
#using scripts\zm\_zm;
#using scripts\zm\_zm_audio;
#using scripts\zm\_zm_bgb;
#using scripts\shared\util_shared;
#using scripts\zm\_zm_perks;
#using scripts\zm\_zm_weapons;
#using scripts\shared\util_shared;
#using scripts\zm\_zm_utility;
#using scripts\shared\ai\zombie_utility;
#using scripts\components\utils;
#using scripts\zm\_zm_equipment;
#using scripts\zm\_zm_powerups;
#using scripts\shared\bots\_bot;
#using scripts\components\zombies;
#using scripts\zm\_zm_laststand;


#namespace game_;


function give_bubblegum(gum)
{
    if(self.get_player_weapon_limit == undefined)
    self.get_player_weapon_limit = 2;
    
    while(self isswitchingweapons())
	{
		self waittill(#"weapon_change_complete");
	}
    self notify(#"bgb_gumball_anim_give", gum);
    self zm_audio::create_and_play_dialog("bgb", "eat");
    self bgb::give(gum);
    original = self getcurrentweapon();
	self giveweapon(level.weaponbgbgrab, self calcweaponoptions(level.bgb[gum].camo_index, 0, 0));
	self switchtoweapon(level.weaponbgbgrab);
    self playsound("zmb_bgb_powerup_default");
    evt = self util::waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete", "disconnect");
    if(evt == "weapon_change_complete")
        self takeweapon(level.weaponbgbgrab);

    self.get_player_weapon_limit = undefined;

}

function set_bubblegum(gum, bind)
{
    self.bubble = gum;
    self set_bind(6, bind);
    self iprintln("Note: Changing your gobble gum will change it for all gobblegum binds set!");
}

function do_game_anim(type)
{
    if(self.get_player_weapon_limit == undefined)
    self.get_player_weapon_limit = 2;

    weapon = self GetCurrentWeapon();
    self zm_weapons::weapon_give( GetWeapon(type), false, false, true, true );
    self switchToWeapon(type);
    evt = self util::waittill_any_return("fake_death", "death", "player_downed", "weapon_change_complete", "disconnect");
    if(evt == "weapon_change_complete")
        self takeweapon(type);
    self.get_player_weapon_limit = undefined;
    self SwitchToWeaponImmediate(weapon);
}

function give_perk(perk)
{
    if (!(self hasperk(perk) || self zm_perks::has_perk_paused(perk)))
    {
        self zm_perks::vending_trigger_post_think( self, perk );
    }
    else
    {
        self notify(perk + "_stop");
        self iprintln("Perk [" + perk + "] ^1Removed");
    }
}

function save_position() 
{
    self.save_loc = self getOrigin();
    self iPrintLn("Position: ^1Saved");
}

function load_position() 
{
    self setOrigin(self.save_loc);
    self iPrintLn("Position: ^1Loaded");
}


function toggle_save_and_load()
{

    if(self.snl == 0)
    {
        self.snl = 1;
        self iPrintLn("Press ^5[{+Actionslot 3}] ^7and ^1Crouch ^7to the Save Position");
        self iPrintLn("Press ^5[{+Actionslot 4}] ^7and ^1Crouch ^7to the Load Position");
        self thread save_and_load();
    }
    else if(self.snl == 1)
    {
        self.snl = 0;
        self notify("stopSNL");
        self iprintln("Save and Load ^1Disabled^7!");
    }
}

function toggle_console_fov()
{

    if(self.console_fov == 0)
    {
        self.console_fov = 1;
        self iPrintLn("Console FOV ^5ON");
        setDvar("cg_gun_x", 1.7);
    }
    else if(self.console_fov == 1)
    {
        self.console_fov = 0;
        setDvar("cg_gun_x", 0);
        self iPrintLn("Console FOV ^5OFF");
    }
}

function save_and_load()
{
    self endon("stopSNL");
    for(;;)
    {
        if(self ActionSlotThreeButtonPressed() && self getStance() == "crouch")
        {
            self.save_loc = self getOrigin();
            self iPrintLn("Position: ^1Saved");
        }
        else if(self ActionSlotFourButtonPressed() && self getStance() == "crouch")
        {
            self setOrigin(self.save_loc);
        }

        wait .1;
    }
}

//WALL RUNNING AND BOOST STUFF

function toggle_mp_movement()
{
    if(level.mpmovement == 0)
    {
        iprintln("MP Movement have been ^5Enabled^7!");
        SetDvar( "doublejump_enabled", 1 );
        SetDvar( "juke_enabled", 1 );
        SetDvar( "playerEnergy_enabled", 1 );
        SetDvar( "wallrun_enabled", 1 );
        SetDvar( "sprintLeap_enabled", 1 );
        SetDvar( "traverse_mode", 1 );
        SetDvar( "weaponrest_enabled", 1 );
        for(i=0;i<level.players.size;i++)
		{
            level.players[i] setdoublejumpenergy( 1.0 );
            level.players[i] AllowDoubleJump( true );
            level.players[i] AllowWallRun(true);
        }
        level.mpmovement = 1;
    }
    else if(level.mpmovement == 1)
    {
        iprintln("MP Movement have been ^5Disabled^7!");
        SetDvar( "doublejump_enabled", 0 );
        SetDvar( "juke_enabled", 0 );
        SetDvar( "playerEnergy_enabled", 0 );
        SetDvar( "wallrun_enabled", 0 );
        SetDvar( "sprintLeap_enabled", 0 );
        SetDvar( "weaponrest_enabled", 0 );
        level.mpmovement = 0;
    }
}


function setup_wallrun()
{
	players = GetPlayers();
	foreach(player in players)
	{
		player AllowWallRun(true);
		player.iswallrunning = false;
	}

}

function toggle_boost()
{
    if(level.mpmovement == 0)
    {
        self iprintln("Please turn MP Movement on First!");
        return;
    }

	if(!isDefined(self.toggle_boost))
	{
		self thread maintain_boost();
		self iPrintln("Unlimited Boost: ^5Enabled");
		self.toggle_boost = 1;
	}
	else
	{
		self notify("endUBoost");
		self iPrintln("Unlimited Boost: ^5Disabled");
		self.toggle_boost = undefined;
	}
}

function maintain_boost()
{
	self endon("endUBoost");
	for(;;)
	{
		if(isDefined(self) && isAlive(self) && self isDoubleJumping())
		{
            self SetDoubleJumpEnergy(100);
		}

		wait .1;
	}
}

//AIMBOT STUFF

function aimbot_range()
{
    if(!isDefined(self.aimbotRange))
    {
        self.aimbotRange = 100;
        self iPrintLn("Aimbot Range: ^5100");
    }
    else if(self.aimbotRange == 100)
    {
        self.aimbotRange = 300;
        self iPrintLn("Aimbot Range: ^5300");
    }
    else if(self.aimbotRange == 300)
    {
        self.aimbotRange = 500;
        self iPrintLn("Aimbot Range: ^5500");
    }
    else if(self.aimbotRange == 500)
    {
        self.aimbotRange = 1000;
        self iPrintLn("Aimbot Range: ^51000");
    }
    else if(self.aimbotRange == 1000)
    {
        self.aimbotRange = 99999999;
        self iPrintLn("Aimbot Range: ^5Everywhere");
    }
    else if(self.aimbotRange == 99999999)
    {
        self.aimbotRange = 100;
        self iPrintLn("Aimbot Range: ^5100");
    }
}


function aimbot_delay()
{
    if(!isDefined(self.aimbotWait))
    {
        self.aimbotWait = .1;
        self iPrintLn("Aimbot Delay: ^5.1");
    }
    else if( self.aimbotWait == .1 )
    {
        self.aimbotWait = .2;
        self iPrintLn("Aimbot Delay: ^5.2");
    }
    else if( self.aimbotWait == .2 )
    {
        self.aimbotWait = .3;
        self iPrintLn("Aimbot Delay: ^5.3");
    }
    else if( self.aimbotWait == .3 )
    {
        self.aimbotWait = .4;
        self iPrintLn("Aimbot Delay: ^5.4");
    }
    else if( self.aimbotWait == .4 )
    {
        self.aimbotWait = .5;
        self iPrintLn("Aimbot Delay: ^5.5");
    }
    else if( self.aimbotWait == .5 )
    {
        self.aimbotWait = .6;
        self iPrintLn("Aimbot Delay: ^5.6");
    }
    else if( self.aimbotWait == .6 )
    {
        self.aimbotWait = .1;
        self iPrintLn("Aimbot Delay: ^5.1");
    }
}

function set_aimbot1()
{
    if(!isDefined(self.aimbotRange))
    {
        self iprintln("Set Range First!");
        return;
    }

    if(self.aimbot1 != 1)
    {
        self.aimbot1 = 1;
        self.aimWeapon = 1;
        self.aimbotWeapon = self getCurrentWeapon();
        self iprintln("Aimbot 1 weapon defined: ^5" + self.aimbotWeapon.name);
        self iprintln("Dont forget to set your aimbot target in zombies menu!");
        self thread do_aimbot();
    }
    else if(self.aimbot1 == 1)
    {
        self.aimbot1 = 0;
        self.aimbotWeapon = 0;
        self.aimWeapon = 0;
        self iPrintLn("Aimbot 1: ^5Disabled");

        if(self.aimbot2Weapon == 0)
        {
            self.aimbot_started = 0;
            self notify("endAimbot");
        }
    }
}


function set_aimbot2()
{
    if(!isDefined(self.aimbotRange))
    {
        self iprintln("Set Range First!");
        return;
    }

    if(self.aimbot2 != 1)
    {
        self.aimbot2 = 1;
        self.aim2Weapon = 1;
        self.aimbot2Weapon = self getCurrentWeapon();
        self iprintln("Aimbot 2 weapon defined: ^5" + self.aimbot2Weapon.name);
        self iprintln("Dont forget to set your aimbot target in zombies menu!");
        self thread do_aimbot();
    }
    else if(self.aimbot2 == 1)
    {
        self.aimbot2 = 0;
        self.aimbot2Weapon = 0;
        self.aim2Weapon = 0;
        self iPrintLn("Aimbot 2: ^5Disabled");

        if(self.aimbotWeapon == 0)
        {
            self.aimbot_started = 0;
            self iprintln("aimbot fully ended");
            self notify("endAimbot");
        }
    }
}


function do_aimbot()
{
    self endon("endAimbot");

    if(isDefined(self.aimbot_started) && self.aimbot_started == 1)
    return;

    for(;;)
    {
        self.aimbot_started = 1;
        self waittill("weapon_fired", weapon);
        start = self getTagOrigin("j_head");
        end = self thread vector_scal(anglestoforward(self getPlayerAngles()), 100000);
        bullet = BulletTrace(start, end, true, self, true, true)[ "position" ];

        zombies = GetAITeamArray( level.zombie_team );
        foreach(zombie in zombies)
        { 
            if(zombie.aimbot_target == 1 && distance(bullet, zombie.origin) < self.aimbotRange)
            {
                if( isDefined( self.aimbotWeapon ) && weapon.name == self.aimbotWeapon.name )
                {
                    if( isDefined(self.aimbotWait) )
                    wait self.aimbotWait;

                    zombie DoDamage(500, zombie.origin, self, self, "torso_upper", "MOD_RIFLE_BULLET", 0, GetWeapon( weapon ), -1, false);
                }
            }  

            if(zombie.aimbot2_target == 1 && distance(bullet, zombie.origin) < self.aimbotRange)
            {
                if( isDefined( self.aimbot2Weapon ) && weapon.name == self.aimbot2Weapon.name )
                {
                    if( isDefined(self.aimbotWait) )
                    wait self.aimbotWait;

                    zombie DoDamage(500, zombie.origin, self, self, "torso_upper", "MOD_RIFLE_BULLET", 0, GetWeapon( weapon ), -1, false);
                }
            }  
        }
    }
}



function vector_scal(vec, scale)
{
    vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
    return vec;
}

function reload_loadout()
{
    weapons = [];
	index = 0;
   
    foreach(weapon in self getweaponslist(  )) 
    {
        weapons[index] = weapon;
		index++;
    }

    perks = [];
    i = 0;
    foreach(perk in self getperks())
    {
        perks[i] = perk;
        i++;
    }

    self waittill("givebackloadout");
    self takeallweapons();
    wait 0.05;

    foreach(weapon in weapons)
    { 
        self zm_weapons::weapon_give( weapon, false, false, true, true );
        wait 0.01;
    }

    foreach(perk in perks)
    self zm_perks::give_perk( perk );
}

function toggle_plus_100()
{
    if(self.scorepopup == 1)
    {
        self.scorepopup = 0;
        self iprintlnbold("+100 has been ^1deactivated^7!");
    }
    else if(self.scorepopup == 0)
    {
        self.scorepopup = 1;
        self iprintlnbold("+100 has been ^2activated^7!");
    }

}

function toggle_hitmarkers()
{
    if(level.hitmarkers == 1)
    {
        level.hitmarkers = 0;
        iprintlnbold("Hitmarkers has been ^1deactivated^7!");
    }
    else if(level.hitmarkers == 0)
    {
        level.hitmarkers = 1;
        iprintlnbold("Hitmarkers has been ^2activated^7!");
    }

}

function toggle_killed_popup()
{
    if(level.killed_popup == 1)
    {
        level.killed_popup = 0;
        iprintlnbold("Killed Popup has been ^1deactivated^7!");
    }
    else if(level.killed_popup == 0)
    {
        level.killed_popup = 1;
        iprintlnbold("Killed popup has been ^2activated^7!");
    }

}

function toggle_revive_stalls()
{
    if(level.revive_stalls == 1)
    {
        level.revive_stalls = 0;
        iprintlnbold("Revive Stalls has been ^1deactivated^7!");
    }
    else if(level.revive_stalls == 0)
    {
        level.revive_stalls = 1;
        iprintlnbold("Revive Stalls has been ^2activated^7!");
    }

}

function toggle_hud()
{
    if(self.remove_hud == 1)
    {
        self.remove_hud = 0;
        self util::show_hud( 1 );
    }
    else if(self.remove_hud == 0)
    {
        self.remove_hud = 1;
        self util::show_hud( 0 );
    }

}

function toggle_last_cooldown()
{
    if(self.LastCooldown == 1)
    {
        level.LastCooldown = 0;
        iprintlnbold("Last cooldown has been ^1deactivated^7!");
    }
    else if(self.LastCooldown == 0)
    {
        level.LastCooldown = 1;
        iprintlnbold("Last cooldown has been ^2activated^7!");
    }

}

function drop_current_weapon()
{
    weapon = self getcurrentweapon();
    self dropItem(weapon);
}

function drop_canswap()
{
    if(self.get_player_weapon_limit == undefined)
    self.get_player_weapon_limit = 2;
    self.randomGun = [];
    zmWeap = getArrayKeys(level.zombie_weapons);
    test = 0;

    foreach(i, weapon in zmWeap)
    {
        weaponClass = util::getWeaponClass( zmWeap[i] );
        if(weaponClass == "weapon_smg")
        {
            test++;
            self.randomGun[test] = zmWeap[i];
        }
    }

    rand = RandomIntRange(1, self.randomGun.size);
    self zm_weapons::weapon_give(self.randomGun[rand]);
    self DropItem(self.randomGun[rand]);
    self.get_player_weapon_limit = undefined;

}


function watchAreaMonitor()
{
	for(;;)
	{
		if(isDefined(level.player_out_of_playable_area_monitor) && level.player_out_of_playable_area_monitor)
			level.player_out_of_playable_area_monitor = 0;
		if(isDefined(level.player_too_many_weapons_monitor) && level.player_too_many_weapons_monitor)
			level.player_too_many_weapons_monitor = 0;
		wait 0.05;
	}
}




function BoltStart()
{
    self endon("disconnect");
    self endon("detachBolt");
    self endon("StopppBolt");
   
    for(;;)
	{    
        if(self.togglebolt == 1 && self actionslotthreebuttonpressed() )
        self BoltMovementFull();
        else if(self.togglebolt == 2 && self actionslotfourbuttonpressed() )
        self BoltMovementFull();
        else if(self.togglebolt == 3 && self actionslotonebuttonpressed() )
        self BoltMovementFull();
        else if(self.togglebolt == 4 && self actionslottwobuttonpressed() )
        self BoltMovementFull();
        else if(self.togglebolt == 5 && self fragbuttonpressed() )
        self BoltMovementFull();
        else if(self.togglebolt == 6 && self secondaryoffhandbuttonpressed() )
        self BoltMovementFull();
        
        wait 0.05;
    }

           	    
}


function BoltMovementFull()
{
    self endon("disconnect");
    self endon("detachBolt");
    self endon("StopppBolt");

        if (self.bolt["poscount"] == 0)
        {
            self iprintln("^5There's no point(s) to travel to");
            return;
        }
        weapon = spawn( "script_model", self.origin );
        weapon SetModel( "tag_origin" );
        weapon EnableLinkTo();
        self playerlinkto( weapon, "tag_origin", 1, 360, 360, 360, 360, false );
        
        for (i=1 ; i < self.bolt["poscount"] + 1 ; i++)
        {
            weapon MoveTo( self.bolt["origin"][i],  self.boltTime / self.bolt["poscount"], 0, 0 );
            wait ( self.boltTime  / self.bolt["poscount"] );
        }
        self Unlink();
        weapon delete();

}


function SaveBoltPos()
{
   self endon("disconnect");
   wait 0.1;
   self.bolt["poscount"] += 1;
   self.bolt["origin"][self.bolt["poscount"]] = self.origin;
   self.bolt["angles"][self.bolt["poscount"]] = self.angles;
   self iprintln("Saved Bolt Position ^5#" + self.bolt["poscount"]); 
}


function DeleteBoltPos()
{
     self endon("disconnect");
     wait 0.1;
     if( self.bolt["poscount"] == 0 ) 
	 self iprintln("There's nothing to delete");
     else
     {
         self.bolt["origin"][self.bolt["poscount"]] = undefined;
         self.bolt["angles"][self.bolt["poscount"]] = undefined;
         self iprintln( "Position ^5#" + self.bolt["poscount"] + " ^7deleted" );
         self.bolt["poscount"] -= 1;
      }
}


function add_bolt_speed()
{
    self.bolttime = self.bolttime + 0.25;
	self iprintln("Bolt Speed set to^5 "+self.bolttime+" Seconds");
}

function take_bolt_speed()
{
    self.bolttime = self.bolttime - 0.25;
	self iprintln("Bolt Speed set to^5 "+self.bolttime+" Seconds");
}


function changeboltbind() 
{

    self notify("StopppBolt");

    self.togglebolt++;
        
    if(self.togglebolt == 1)
		self iprintln("Bolt Bind [^5[{+actionslot 3}]^7]");  
    else if(self.togglebolt == 2)
		self iprintln("Bolt Bind [^5[{+actionslot 4}]^7]");
    else if(self.togglebolt == 3)
		self iprintln("Bolt Bind [^5[{+actionslot 1}]^7]");
    else if(self.togglebolt == 4)
		self iprintln("Bolt Bind [^5[{+actionslot 2}]^7]");
    else if(self.togglebolt == 5)
		self iprintln("Bolt Bind [^5[{+frag}]^7]");
    else if(self.togglebolt == 6)
		self iprintln("Bolt Bind [^5[{+smoke}]^7]");
	else if(self.togglebolt == 7)
	{
		self iprintln("Bolt Bind Disabled!");
		self notify("StopppBolt");
		self.togglebolt = 0;
	}
	
	if(self.togglebolt != 0 && self.togglebolt <= 6)
	{
		wait 0.05;
    	self thread BoltStart();
    }
    
}


function toggle_timescale()
{
    if(getdvarint("timescale") == 1)
        setDvar("timescale", .5);
    else
        setDvar("timescale", 1);
} 


function set_afterhit(weapon)
{
    if(weapon == "remove")
    {
        self.afterhit = 0;
        self iprintln("Afterhit removed!");
    }
    else 
    {
        self.afterhit = weapon;
        self iprintln("Afterhit has been set to ^5" + weapon.name);
    }
}

function do_afterhit()
{
    wait 0.05;
    self takeallweapons();
    self freezecontrols(false);
    wait 0.05;
    self zm_weapons::weapon_give( self.afterhit, false, false, true, true );
    wait 1;

}

function toggle_weaponlimit()
{
    if(!isDefined(self.get_player_weapon_limit))
    {
        self.get_player_weapon_limit = 2;
        self iprintln("Unlimited Weapons ^5ON");
    }
    else 
    {
        self.get_player_weapon_limit = undefined;
        self iprintln("Unlimited Weapons ^5OFF");
    }
}


function binds_monitor()
{
    self endon("disconnect");

    self.binds_active = 1;
    for(;;) 
    {
            // add if not in menu here
            if(self actionslotonebuttonpressed() && self.upbind != 0)
            {  
                self thread do_binds(self.upbind);
                wait 0.05;
            }
            else if(self actionslottwobuttonpressed() && self.downbind != 0)
            {
                self thread do_binds(self.downbind);
                wait 0.05;
            }
            else if(self actionslotthreebuttonpressed() && self.leftbind != 0) 
            {
                self thread do_binds(self.leftbind);
                wait 0.05;
            }
            else if(self actionslotfourbuttonpressed() && self.rightbind != 0)
            {
                self thread do_binds(self.rightbind);
                wait 0.05;
            }

        wait 0.05;
    }
}

function do_binds(bind)
{
    if(bind == 0)
        return;
    else if(bind == 1)
        self thread do_canswap();
    else if(bind == 2)
        self thread do_zoomload();
    else if(bind == 3)
        self thread do_emptyclip();
    else if(bind == 4)
        self thread do_clip2one();
    else if(bind == 5)
        self thread do_maxammo();
    else if(bind == 6)
        self thread give_bubblegum(self.bubble);
    else if(bind == 7)
        self thread fake_hitmarker("damage");
    else if(bind == 8)
        self thread fake_hitmarker("killed");
    else if(bind == 9)
        self thread do_game_anim("zombie_perk_bottle_jugg");
    else if(bind == 10)
        self thread do_game_anim("zombie_knuckle_crack");
    else if(bind == 11)
        self thread do_canzoom();
}

function set_bind(bind, button)
{
    if(button == "Left")
        self.leftbind = bind;
    else if(button == "Right")
        self.rightbind = bind;
    else if(button == "Up")
        self.upbind = bind;
    else if(button == "Down")
        self.downbind = bind;

    if(!isDefined(self.binds_active))
    self thread binds_monitor();
	
    if(bind > 0)
    self iprintln(button + " Bind has been set!"); //for some reason i couldnt do button + at the start of this...
    else
    self iprintln(button + " Bind has been removed!");

    if(bind == 2)
    self iprintln("You must do ADS and Reload manually with this bind!");
    else if(bind == 11 || bind == 1)
    self iprintln("This bind only works properly when you have 1-2 weapons!");
    
}

function do_maxammo()
{
    level thread zm_powerups::specific_powerup_drop("full_ammo", self.origin);
    
    foreach(weapon in self GetWeaponsList(1)) //refill ammo in both clips of guns.
	{
        self givestartammo(weapon);
	}
}

function do_canswap() //idk why but this function is fucking retarded i cant get it
{
    weapon = self GetCurrentWeapon();
    self take_weapon_canswap(weapon);
    self disableWeapons();
    wait 0.05;
    self give_weapon_canswap(weapon);
    self switchToWeapon(weapon);
    wait 0.05;
    self enableWeapons();
}

function take_weapon_canswap(x)
{
    self.getgun[x] = x;
    self.getstock[x] = self getWeaponAmmoStock(self.getgun[x]);
    self.getclip[x] = self getWeaponAmmoClip(self.getgun[x]);
    self takeWeapon(self.getgun[x]);
}

function give_weapon_canswap(x)
{
    self zm_weapons::weapon_give( self.getgun[x], false, false, true, true );
    self setWeaponAmmoClip(self.getgun[x],self.getclip[x]);
    self setWeaponAmmoStock(self.getgun[x],self.getstock[x]);
}

function do_zoomload()
{
    weapon = self getcurrentweapon();
    self setspawnweapon(weapon);
}

function do_canzoom()
{
    weapon = self GetCurrentWeapon();
    self take_weapon_canswap(weapon);
    self disableWeapons();
    wait 0.005;
    self give_weapon_canswap(weapon);
    self switchToWeapon(weapon);
    self enableWeapons();
    wait 0.05;
    self setspawnweapon(weapon);
     
}

function do_clip2one()
{
    weapon = self getcurrentweapon();
    self SetWeaponAmmoClip(weapon, 1);
}

function do_emptyclip()
{
    weapon = self getcurrentweapon();
    self SetWeaponAmmoClip(weapon, 0);
}

function always_canswap()
{
    self endon("end_canswap");

    for(;;)
    {
        self set_all_canswap();
        self waittill("weapon_change");
        wait 0.05;
    }
}

function set_all_canswap()
{

    foreach(weapon in self getweaponslist())
    {
        self ShouldDoInitialWeaponRaise(weapon, true);
    }

}

function toggle_always_canswap()
{
    if(self.alwayscanswap == 0)
    {
        self.alwayscanswap = 1;
        self iprintln("Always Canswap Activated!");
        self thread always_canswap();
    }
    else
    {
        self.alwayscanswap = 0;
        self iprintln("Always Canswap Deactivated!");
        self notify("end_canswap");
    }
}


function do_refill()
{
	foreach(weapon in self GetWeaponsList())
	{
		self GiveMaxAmmo(weapon);
	}

}

function noclip()
{
	self endon("stop_noclip");
	self.originObj = spawn( "script_origin", self.origin, 1 );
	self.originObj.angles = self.angles;
	self playerlinkto( self.originObj, undefined );

	for(;;)
	{
		if( self sprintbuttonpressed())
		{
			normalized = anglesToForward( self getPlayerAngles() );
			scaled = vectorScale( normalized, 50 );
			originpos = self.origin + scaled;
			self.originObj.origin = originpos;
			self enableweapons();
		}

	wait 0.05;

	}
}

function toggle_noclip()
{
	if(self.noclip == 0)
	{
		self thread noclip();
		self.noclip = 1;
        self iprintln("No Clip ^5ON^7!");
	}
	else
	{
		self notify("stop_noclip");
        self iprintln("No Clip ^5OFF^7!");
		self.noclip = 0;
		self unlink();
		self.originObj delete();
	}
}

function point_monitor()
{
    self endon("disconnect");

    for(;;)
    {
        if(self.score != 6666)
        self.score = 6666;
        wait 7.5;
    }

}

function toggle_zombie_counter()
{
    if(self.zm_counter == 1)
    {
        self.zm_counter = 0;
        self iprintln("ZM Counter ^5OFF");
        self thread destroy_zombie_counter();
    }  
    else
    {
        self.zm_counter = 1;
        self iprintln("ZM Counter ^5ON");
        self thread create_zombie_counter();
    }
}

function create_zombie_counter()
{
    self.counterteamtext = self utils::createText("fonts/wearetrippinshort.ttf", 1.4, 15, "ALIVE", "CENTER", "CENTER", -352, -84, 2,(1,1,1)); //team alive text
    self.counterteam2text = self utils::createText("fonts/wearetrippinshort.ttf", 1.4, 15, "ALIVE", "CENTER", "CENTER", -352, -65, 2,(1,1,1)); //team alive text
    self.zmcounter = self utils::createImage("CENTER", "CENTER", -375, -70, 90, 45, 1, 1, "zm_counter"); //zm counter box
    self.teamplayers = self utils::createText("fonts/wearetrippinshort.ttf", 1.4, 15, "0", "CENTER", "CENTER", -385, -84, 2,(1,1,1)); //team count
    self.zombieplayers = self utils::createText("fonts/wearetrippinshort.ttf", 1.4, 15, "0", "CENTER", "CENTER", -385, -65, 2,(1,1,1)); //enemy count
    self thread updateZombieCounter();
}

function destroy_zombie_counter()
{
    self.zmcounter destroy();
    self.counterteamtext destroy();
    self.counterteam2text destroy();
    self.teamplayers destroy();
    self.zombieplayers destroy();
}

function updateZombieCounter()
{
    while(true)
    {
        zombies = GetAITeamArray( level.zombie_team );
        self.zombieplayers setValue(zombies.size);
        self.teamplayers setValue(level.players.size);

        wait .1;
    }
}

function init_hitmarkers()
{
    self.hitmarker = newdamageindicatorhudelem( self );
    self.hitmarker.horzalign = "center";
    self.hitmarker.vertalign = "middle";
    self.hitmarker.x = -12;
    self.hitmarker.y = -12;
    self.hitmarker.alpha = 0;
    self.hitmarker setshader( self.hm_damage, 24, 48 );
}

function do_hitmarker(health)
{
	if(!isDefined(self.hitmarker))
	self init_hitmarkers();

	if( health > 0 ) //hitmarker if doesnt kill
	{
		self.hitmarker setShader( self.hm_damage, 24, 48 );
		self.hitmarker.color = ( 1, 1, 1 );
		self.hitmarker.alpha = 1;
		self.hitmarker fadeovertime( .5 );
		self.hitmarker.alpha = 0;
	}
	else //hitmarker if kills
	{
		self.hitmarker setShader( self.hm_killed, 24, 48 );
		self.hitmarker.color = ( 1, 1, 1 );
		self.hitmarker.alpha = 1;
		self.hitmarker fadeovertime( .5 );
		self.hitmarker.alpha = 0;
	}
}

function give_upgraded_weapon()
{
    upgrade_weapon = self GetBuildKitWeapon( self getcurrentweapon(), true );

    upgrade_weapon.pap_camo_to_use = zm_weapons::get_pack_a_punch_camo_index( upgrade_weapon.pap_camo_to_use );
    upgrade_weapon_options = self GetBuildKitWeaponOptions( upgrade_weapon, upgrade_weapon.pap_camo_to_use );
    upgrade_weapon_acvi = self GetBuildKitAttachmentCosmeticVariantIndexes( upgrade_weapon, true );

    original_weapon = self GetCurrentWeapon();
    Thomas = GetWeapon( "zombie_knuckle_crack" );
    
    if ( original_weapon != level.weaponNone && !zm_utility::is_placeable_mine( original_weapon ) && !zm_equipment::is_equipment( original_weapon ) )
    {
        self notify( "zmb_lost_knife" );
        self TakeWeapon( original_weapon );
    }
    else
    {
        return;
    }

    self GiveWeapon( Thomas );
    self SwitchToWeapon( Thomas );
    wait 2;
    self takeweapon(Thomas);

    weapon = zm_weapons::get_upgrade_weapon( upgrade_weapon );
    self giveweapon(weapon, upgrade_weapon_options, upgrade_weapon_acvi);
    self switchToWeapon(weapon);
}


function custom_drop_powerup(powerup)
{
	spawn_loc = self zombies::lookPos();
	level thread zm_powerups::specific_powerup_drop( powerup, spawn_loc );
}

function down_player(i)
{
    if(i!=self)
    {
        if(isAlive(i))
        {

            i disableInvulnerability();
            self iPrintln(i.name + " ^1Was Downed!");
		    i dodamage(i.health * 2, i.origin);
        }
        else
            self iPrintln(i.name + " Is Already Downed/Dead!");
    }
    else
        self iprintln("Stopped to protect game end!");
}

function spawn_player(i)
{
    i thread [[level.spawnClient]]();
    self iprintln("Player Spawned!");
}

function spawn_bot()
{	
    self iprintln("Bot spawned, reset client menu to access options!");
	bot = bot::add_bot( self.team );
    wait 1;
    bot thread [[level.spawnClient]]();
    wait 0.25;
    bot DisableInvulnerability();
    
}

function freeze_player(i)
{
    if(!isDefined(i.is_frozen))
    i.is_frozen = 0;

    if(i.is_frozen == 0)
    {
        i freezeControls(true);
        i.is_frozen = 1;
        self iprintln("Player Frozen");
    }
    else if(i.is_frozen == 1)
    {
        i freezeControls(false);
        i.is_frozen = 0;
        self iprintln("Player Un-Frozen");
    }

}


function teleport_player(i)
{
	tp = self zombies::lookPos();
    i setOrigin(tp);
}


function set_fast_hands()
{
    if(self.fast_hands == 0)
    {
        self setperk("specialty_fastweaponswitch");
        self setperk("specialty_fasttoss");
        self setperk("specialty_fastequipmentuse");
        self iprintln("Fast Hands ^5ON^7!");
        self.fast_hands = 1;
    }
    else if(self.fast_hands == 1)
    {
        self unsetperk("specialty_fastweaponswitch");
        self unsetperk("specialty_fasttoss");
        self unsetperk("specialty_fastequipmentuse");
        self iprintln("Fast Hands ^5OFF^7!");
        self.fast_hands = 0;
    }
}



function toggle_floaters()
{

    if (!self.floaters)
    {
        self iprintln("Floaters ^5ON");
        self.floaters = true;
    }
    else if (self.floaters)
    {
        self iprintln("Floaters ^5OFF");
        self notify("stopFloatersBruh");
        self.floaters = false;
    }

}


function FloatDown() 
{
    self endon("disconnect");
    self.Float = spawn("script_model", self.origin);
    self playerLinkTo(self.Float);
    wait 0.1;
    self freezeControls(true);
	if (self isOnGround() == true)
	{
		return;
	}
	else
	{
    	for (;;) 
        {
        	self.Down = self.origin - (0, 0, 0.5);
        	self.Float moveTo(self.Down, 0.01);
        	wait 0.01;
		}
	}
}

function toggle_hm_k_color()
{
    if(self.hm_killed == "damage_feedback_glow_orange")
    {
        self.hm_killed = "damage_feedback_glow_green";
        self thread example_hitmarker("Killed");
    }
    else if(self.hm_killed == "damage_feedback_glow_green")
    {
        self.hm_killed = "damage_feedback_glow_blue";
        self thread example_hitmarker("Killed");
    }
    else if(self.hm_killed == "damage_feedback_glow_blue")
    {
        self.hm_killed = "damage_feedback_glow_pink";
        self thread example_hitmarker("Killed");
    }
    else if(self.hm_killed == "damage_feedback_glow_pink")
    {
        self.hm_killed = "damage_feedback_glow_purple";
        self thread example_hitmarker("Killed");
    }
    else if(self.hm_killed == "damage_feedback_glow_purple")
    {
        self.hm_killed = "damage_feedback_glow_red";
        self thread example_hitmarker("Killed");
    }
    else if(self.hm_killed == "damage_feedback_glow_red")
    {
        self.hm_killed = "damage_feedback_glow_yellow";
        self thread example_hitmarker("Killed");
    }
    else if(self.hm_killed == "damage_feedback_glow_yellow")
    {
        self.hm_killed = "damage_feedback";
        self thread example_hitmarker("Killed");
    }
    else if(self.hm_killed == "damage_feedback")
    {
        self.hm_killed = "damage_feedback_glow_orange";
        self thread example_hitmarker("Killed");
    }

}

function toggle_hm_d_color()
{
    if(self.hm_damage == "damage_feedback_glow_orange")
    {
        self.hm_damage = "damage_feedback_glow_green";
        self thread example_hitmarker("Damage");
    }
    else if(self.hm_damage == "damage_feedback_glow_green")
    {
        self.hm_damage = "damage_feedback_glow_blue";
        self thread example_hitmarker("Damage");
    }
    else if(self.hm_damage == "damage_feedback_glow_blue")
    {
        self.hm_damage = "damage_feedback_glow_pink";
        self thread example_hitmarker("Damage");
    }
    else if(self.hm_damage == "damage_feedback_glow_pink")
    {
        self.hm_damage = "damage_feedback_glow_purple";
         self thread example_hitmarker("Damage");
    }
    else if(self.hm_damage == "damage_feedback_glow_purple")
    {
        self.hm_damage = "damage_feedback_glow_red";
         self thread example_hitmarker("Damage");
    }
    else if(self.hm_damage == "damage_feedback_glow_red")
    {
        self.hm_damage = "damage_feedback_glow_yellow";
         self thread example_hitmarker("Damage");
    }
    else if(self.hm_damage == "damage_feedback_glow_yellow")
    {
        self.hm_damage = "damage_feedback";
        self thread example_hitmarker("Damage");
    }
    else if(self.hm_damage == "damage_feedback")
    {
        self.hm_damage = "damage_feedback_glow_orange";
        self thread example_hitmarker("Damage");
    }

}

function example_hitmarker(hitmarker)
{
    if(!isDefined(self.hitmarker))
	self init_hitmarkers();

    if(hitmarker == "Killed")
    {
        self.hitmarker setShader( self.hm_killed, 24, 48 );
        self.hitmarker.color = ( 1, 1, 1 );
        self.hitmarker.alpha = 1;
        self.hitmarker fadeovertime( .5 );
        self.hitmarker.alpha = 0;
    }
    else if(hitmarker == "Damage")
    {
        self.hitmarker setShader( self.hm_damage, 24, 48 );
        self.hitmarker.color = ( 1, 1, 1 );
        self.hitmarker.alpha = 1;
        self.hitmarker fadeovertime( .5 );
        self.hitmarker.alpha = 0;
    }

    self iprintlnbold(hitmarker + " hitmarker color changed to:");
}


function doEndDetonateEquipment()
{
    while(isDefined(self))
    wait 0.05;
    self notify("exist");
}

function doDetonateEquipment( grenade, owner )
{

    player = owner;
    grenade endon("exist");
    grenade thread doEndDetonateEquipment();
    done = 1;
    while(done)
    {
        level waittill( "weapon_fired", player);
        done = 0;        
        grenade detonate();
        magicbullet( player getcurrentweapon(), player gettagorigin( "tag_weapon_right" ) + anglestoforward( player getplayerangles() ) * 75, grenade.origin, player );
        player fake_hitmarker("damage");

    }

}

function onWeaponFired()
{
	self endon("end_eq_aimbot");
    self endon("disconnect");
    level endon("game_ended");
    
    for(;;)
    {
        self waittill( "weapon_fired" );
        level notify( "weapon_fired", self);
    }
}

function doEquipmentAimbot()
{
	self endon("end_eq_aimbot");
    self endon("disconnect");
    level endon("game_ended");
    self thread onWeaponFired();
   
    for(;;)
    {
        self waittill( "grenade_fire", grenade, name);
        if(grenade.name == "bouncingbetty" || grenade.name == "bouncingbetty_holly" || grenade.name == "bouncingbetty_devil")
        wait 0.01;
        self waittill( "weapon_fired" );
        grenade thread doDetonateEquipment( grenade, self );	  
    }
    
}

function equipment_aimbot()
{
    if(self.equipmentaimbot != 1)
    {
        self thread doEquipmentAimbot();
        self.equipmentaimbot = 1;
        self iprintln("Equipment Aimbot: ^5On" );
    }
    else
    {
        self notify("end_eq_aimbot");
        self.equipmentaimbot = 0;
        self iprintln( "Equipment Aimbot: ^5Off" );
    }
}

function fake_hitmarker(hitmarker)
{
    if(!isDefined(self.hitmarker))
    self init_hitmarkers();

    if(hitmarker == "killed")
    self.hitmarker setShader( self.hm_killed, 24, 48 );
    else
    self.hitmarker setShader( self.hm_damage, 24, 48 );

    self.hitmarker.color = ( 1, 1, 1 );
    self.hitmarker.alpha = 1;
    self.hitmarker fadeovertime( .5 );
    self.hitmarker.alpha = 0;
}

function spawn_platform()
{
	if(isDefined(self.platform))
	{
		self.platform.origin = self.origin;
		self iprintlnbold("Platform Moved!");
	}
	else
	{
		self.platform = spawncollision("collision_clip_wall_128x128x10","collider",self.origin, (90,0,0));
        self.platform.angles = (90,0,0);
		self iprintlnbold("Platform Spawned!");
	}
}

function delete_platform()
{
	self.platform delete();
	self iprintlnbold("Platform Deleted!");
}

function factionInfo()
{
    if(self.factionInfo != 1)
    {
        self SetControllerUIModelValue("hideFactionInfo", 1);
        self.factionInfo = 1;
        self iprintln("Hide Faction Info: ^5False");
    }
    else
    {
        self SetControllerUIModelValue("hideFactionInfo", 0); // weapon
        self.factionInfo = 0;
        self iprintln("Hide Faction Info: ^5True");
    }
}

function killedbyInfo()
{
    if(self.killedby != 1)
    {
        self SetControllerUIModelValue("hideKilledBy", 1);
        self.killedby = 1;
        self iprintln("Hide Killed By Info: ^5False");
    }
    else
    {
        self SetControllerUIModelValue("hideKilledBy", 0); // weapon
        self.killedby = 0;
        self iprintln("Hide Killed By Info: ^5True");
    }
}

function toggle_player_godmode(player)
{
    if(!isDefined(player.god))
    player.god = 0;

    if(player.god == 0)
    {
        player.god = 1;
        self iprintln("God mode activated on player!");
        player EnableInvulnerability();
    }
    else if(player.god == 1)
    {
        player.god = 0;
        self iprintln("God mode deactivated on player!");
        player disableInvulnerability();
    }
}

function kick_player(player)
{
    Kick(player GetEntityNumber());
}

function toggleKillcamTime( i )
{
    setdvar("scr_killcam_time", 10);
}

function set_anywhere_but_here_tp()
{
    level.var_2c12d9a6 = self.origin;
    self iprintln("Anywhere but here, teleport origin set!");
}