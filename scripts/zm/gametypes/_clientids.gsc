#using scripts\codescripts\struct;
#using scripts\shared\callbacks_shared;
#using scripts\shared\system_shared;
#using scripts\shared\flag_shared;
#using scripts\zm\_zm_spawner;
#using scripts\zm\_zm;
#using scripts\shared\util_shared;
#using scripts\shared\clientfield_shared;
#using scripts\zm\gametypes\_killcams;
#using scripts\components\game;
#using scripts\components\menu;
#using scripts\components\utils;
#using scripts\components\zombies;
#using scripts\shared\bots\_bot;

/*
            - TO DO LIST - 
- fill out menu functions (any function with null)
- change gobblegum & perk names to display names
- add different zombie spawners (eg margwa, and panzer ect..)
- add softlands
- maybe port an equipment that is good for instaswaps for both lethal/tactical
- find equipment names for equipment aimbot

            - BUG LIST -
- zombies dont delete out of zombie options after death
*/

#precache("xmodel", "custom_skeleton_body");
#precache("xmodel", "custom_skeleton_head");
#precache("model", "collision_clip_wall_128x128x10");
#precache("material", "damage_feedback_glow_blue");
#precache("material", "damage_feedback_glow");
#precache("material", "damage_feedback_glow_orange");
#precache("material", "damage_feedback_glow_red");
#precache("material", "damage_feedback_glow_pink");
#precache("material", "damage_feedback_glow_green");
#precache("material", "damage_feedback_glow_purple");
#precache("material", "damage_feedback_glow_yellow");
#precache("material", "white");
#precache("material", "zm_counter");

#precache("lui_menu_data", "killcamWeapon.weaponName"); // initiate player weapon (needed for killedby)
#precache("lui_menu_data", "killcam.rounds");
#precache("lui_menu_data", "zombieArchtype");
#precache("lui_menu_data", "zombieClantag");
#precache("lui_menu_data", "hideFactionInfo");
#precache("lui_menu_data", "hideKilledBy");

#precache( "eventstring", "show_outcome" );
#precache( "eventstring", "killed_actor" );
#precache("string", "ZOMBIE_ELIMINATED");
#precache("string", "ZOMBIE_SURVIVED");

#insert scripts\shared\shared.gsh;

#namespace clientids;

REGISTER_SYSTEM( "clientids", &__init__, undefined )


function __init__()
{
	callback::on_start_gametype( &init );
	callback::on_connect( &on_player_connect );
	callback::on_spawned( &on_player_spawned );
}	

function init()
{
	level.clientid = 0;

	level.callbackActorKilled = &ActorKilledWrapper;
	level.callbackActorDamage = &ActorDamageWrapper;

	level.killcam = true; //not sure if these 2 are needed
	level.finalkillcam = true;

	level.hitmarkers = 1; //hitmarker toggle
	level.current_round = 1; //this is used to control round number after killcam
	level.mpmovement = 0; //wallrun and boosts
	level.revive_stalls = 1; //revive stall toggle
	level.saved_zombies = 0; //saved zombies check
	level.killed_popup = 1; //killed popup toggle

	level.max_zombie_func = &stop_zombie_spawn;
	level.round_think_func = &custom_round_over;
	
	setDvar( "sv_cheats", 1 );
	setDvar( "boltTime", 3 );
	setDvar( "player_lastStandBleedoutTime", 99999 );

	thread killcam::init_final_killCam();

	level thread intro_screen_text(); //top left welcome message 

}

function on_player_connect()
{

	self.clientid = matchRecordNewPlayer( self );
	if ( !isdefined( self.clientid ) || self.clientid == -1 )
	{
		self.clientid = level.clientid;
		level.clientid++;
	}

	if( self util::is_bot() == false )
	{
		self thread menu::init();
		self thread game_::watchAreaMonitor(); //monitor for out of map and weapon limit
		self thread default_settings(); //all variables are set here
		self.firstspawn = false;
		self.score = 666;
		self.get_player_weapon_limit = undefined;
		self.factionInfo = 1;
        self SetControllerUIModelValue("hideFactionInfo", 1); // weapon
        self.killedby = 1;
        self SetControllerUIModelValue("hideKilledBy", 1); // weapon
		self.status = "VIP";
		
		/*if(self isVip() == true)
		self.status = "VIP";
		else 
		self.status = "Non-VIP";*/
	}
	else
	self.status = "BOT";
}


function on_player_spawned()
{
	level flag::wait_till( "initial_blackscreen_passed" );

	if(isDefined(self.killfeed_bot))
	{
		self enableInvulnerability();
		self hide();
		self freezecontrols(true);
		self setorigin(self.origin-(0,0,6000));
	}

	if( self util::is_bot() == false )
	{
		self enableInvulnerability();
		self.score = 666;

		//self iprintln("Debug Check"); //This is too make sure that spawning more then once bug isnt happening

		if(self.zm_counter == 1)
		self game_::create_zombie_counter(); //activate zm counter on spawn

		if(self.firstspawn == false)
		{
			self IPrintLnBold("Press ^5ADS ^7+ ^5[{+actionslot 1}] ^7to open menu!");
			self.firstspawn = true;
		}

		if(level.mpmovement == 1)
		{
			self AllowDoubleJump( true );
			self AllowWallRun(true);
		}

	}
}

function custom_round_over()
{
	level.round_number = 1; //this sets round to first round so i can control it
	setroundsplayed( level.round_number );
}

function stop_zombie_spawn()
{
	return 0; //this returns zombies max spawn amount to 0 
}

function ActorKilledWrapper(eInflictor, attacker, iDamage, sMeansOfDeath, weapon, vDir, sHitLoc, psOffsetTime)
{
	targetentityindex = self GetEntityNumber();
	//Obituary(killfeed_victim, attacker, weapon, sMeansOfDeath);

	attacker SetControllerUIModelValue("killcamWeapon.weaponName", weapon.name + ""); // weapon
	attacker SetControllerUIModelValue("killcam.rounds", level.current_round); // weapon
	attacker SetControllerUIModelValue("zombieArchtype", self.nickname); // weapon
	attacker SetControllerUIModelValue("zombieClantag", self.tag); // weapon

	if(sMeansOfDeath == "MOD_UNKNOWN") //this is to help zombies from not despawning/randomly dying
		return; 

	if(attacker.scorepopup == 1)
    	attacker LUINotifyEvent(&"score_event", 2, &"SND_ZOMBIE_ELIMINATED", 100); //+100

	zombies = GetAiTeamArray( level.zombie_team );
	
	if(self.killcam_target != 1)
		LUINotifyEvent( &"killed_actor"); //shows end game overlay

	if(isDefined(self.killcam_target) && self.killcam_target == 1)
	{
		if(isDefined(attacker.floaters) && attacker.floaters == true) //if floaters on do floaters
		attacker thread game_::FloatDown();

		thread killcam::do_final_killcam();

		foreach(player in level.players)
		player thread respawn_players_after_killcam(player.origin, player.angles);

		for(i=0;i<level.players.size;i++)
		level.players[i] thread game_::reload_loadout(); //starts reload loadout function

		winner = attacker.team;
		attackerNum = attacker getEntityNumber();
		targetNum = self getEntityNumber();
		deathtimeoffset = 0;
		respawn = 1;	
		spectatorclient = attacker GetEntityNumber();
		deathTimeOffset = 0; 
		poffsettime = 0;
		keep_deathcam = 0;
		perks = [];
		killstreaks = [];
		killcam_entity_info = killcam::get_killcam_entity_info(attacker, eInflictor, weapon);
		maxtime = 8;
		self.deathTime = getTime();
		level.killed_ent = self;

		level.current_round++;

		if(attacker.afterhit != 0)
			attacker thread game_::do_afterhit();

		level thread killcam::record_settings( spectatorclient, targetentityindex, weapon, sMeansOfDeath, self.deathTime, deathTimeOffset, poffsettime, killcam_entity_info, perks, killstreaks, attacker );

		LUINotifyEvent( &"show_outcome", 7, &"ZOMBIE_SURVIVED", &"ZOMBIE_ELIMINATED", randomint(1500), 1, true, 1, 0); //shows end game overlay

		for(i=0;i<level.players.size;i++) //freeze all players for end game and remove hud
		{
			level.players[i] freezeControls(true); 
			level.players[i] util::show_hud( 0 );
			level.players[i] thread game_::destroy_zombie_counter();
		}
		
		wait 8; //end game time 

		LUINotifyEvent( &"pre_killcam_transition" );
		level notify ( "play_final_killcam" );
		self thread killcam::dokillcam( attackerNum, targetNum, killcam_entity_info, weapon, sMeansOfDeath, self.deathTime, deathTimeOffset, poffsetTime, respawn, killcam::timeUntilRoundEnd(), perks, killstreaks, attacker, keep_deathcam );

		//wait till killcam is over and increase round number and reload zombie settings
		level waittill("killcam_finished");
		thread zombies::delete_all_corpses();
		
		if(level.saved_zombies == 1)
		thread zombies::reload_zombies_init();
		
		wait .25;
		setroundsplayed( level.current_round );
	
	} 

	self[[ self.deathFunction ]]( eInflictor, attacker, iDamage, sMeansOfDeath, weapon, vDir, sHitLoc, psOffsetTime );
}

function respawn_players_after_killcam(origin, angles)
{
	self waittill("end_killcam");
	self thread [[level.spawnClient]](); //spawns client in after killcam
	self notify("givebackloadout");
	self util::show_hud( 1 );
	self setorigin(origin);
	self setplayerangles(angles);
}


function ActorDamageWrapper( inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, sHitLoc, vDamageOrigin, psOffsetTime, boneIndex, modelIndex, surfaceType, vSurfaceNormal )
{

    self finishActorDamage( inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, sHitLoc, vDamageOrigin, psOffsetTime, boneIndex, surfaceType, vSurfaceNormal );
	
	if(self.is_hellhound == 1) //this is to do dog death fx
	{
		attacker thread game_::do_hitmarker(0);
		self thread zombies::dog_death_fx(self.origin);
		self ActorKilledWrapper(inflictor, attacker, damage, meansofdeath, weapon, vdir, sHitLoc, psOffsetTime);
	}
	else
	attacker thread game_::do_hitmarker(self.health);
}

function default_settings()
{
	self.hm_killed = "damage_feedback_glow_orange"; //set killed hitmarker
	self.hm_damage = "damage_feedback_glow_blue"; //set damage hitmarker
	self.scorepopup = 1; //+100 toggle
	self.togglebolt = 0; //bolt movement start bind toggle
	self.bolt["poscount"] = 0; //bolt movement position index
	self.bolttime = 3; //time between bolts in bolt movement
	self.remove_hud = 0; //remove hud toggle
	self.afterhit = 0; //afterhit index
	self.upbind = 0;//upbind index
	self.downbind = 0;//downbind index
	self.leftbind = 0;//leftbind index
	self.rightbind = 0;//rightbind index
	self.alwayscanswap = 0; //always canswap toggle
	self.snl = 0; //save and load toggle
	self.noclip = 0; //noclip toggle
	self.zm_counter = 1; //toggle for zm counter
	self.god = 1; //god mode toggle
	self.floaters = false; //floaters toggle
	self.pers["aims"]["equipment"] = "none"; //equipment aimbot 
	self.aimbot = 0; //aimbot toggle
	self.aimbot2 = 0; //aimbot 2 toggle
	self.aimbotWeapon = 0; //aimbot 1 weapon
	self.aimbot2Weapon = 0; //aimbot 2 weapon
	self.equipmentaimbot = 0; //equipment aimbot toggle
	self.console_fov = 0; //console fov toggle
	self.fast_hands = 0;
}

function isVip()
{
	self.guid = self getxuid();
	//1100001 <- xuid always starts with this

	if(self.guid == "110000135bbe320" || //gunji
	self.guid == "11000010585a7cd" || //hachi
	self.guid == "e3ac56c92245e996" //gunji boiii
	)
	return true;
	else 
	return false;
}


function intro_screen_text()
{
    wait(1); // wait for flags to init
    level flag::wait_till("initial_blackscreen_passed");

    intro_hud = [];
    str_text = [];
	str_text[0] = "Rezurrection v^51";
	str_text[1] = "By @^5gunjibra ^7& @^5lurkzy";

    for ( i = 0; i < str_text.size; i++ )
    {
        intro_hud[i] = NewHudElem();
        intro_hud[i].x = 20;
        intro_hud[i].y = -425 + ( 20 * i );
        intro_hud[i].fontscale = ( IsSplitScreen() ? 2.75 : 1.75 );
        intro_hud[i].alignx = "LEFT";
        intro_hud[i].aligny = "BOTTOM";
        intro_hud[i].horzalign = "LEFT";
        intro_hud[i].vertalign = "BOTTOM";
        intro_hud[i].color = (1.0, 1.0, 1.0);
        intro_hud[i].alpha = 1;
        intro_hud[i].sort = 0;
        intro_hud[i].foreground = true;
        intro_hud[i].hidewheninmenu = true;
        intro_hud[i].archived = false;
        intro_hud[i].showplayerteamhudelemtospectator = true;
        intro_hud[i] SetText(str_text[i]);
        intro_hud[i] SetTypewriterFX( 100, 10000 - ( 3000 * i ), 3000 );
        wait(3);
    }

    wait(10);
    foreach ( hudelem in intro_hud ) hudelem Destroy();
}