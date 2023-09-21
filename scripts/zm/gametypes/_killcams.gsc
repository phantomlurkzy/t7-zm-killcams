#using scripts\zm\gametypes\_globallogic;
#using scripts\shared\util_shared;
#using scripts\shared\hud_util_shared;
#using scripts\shared\hud_message_shared;
#using scripts\zm\gametypes\_hud_message;
#using scripts\shared\hud_util_shared;
#using scripts\codescripts\struct;
#using scripts\shared\callbacks_shared;
#using scripts\shared\system_shared;
#using scripts\zm\gametypes\_clientids;
#using scripts\zm\gametypes\killcam_entities;

#insert scripts\shared\shared.gsh;

#precache( "eventstring", "pre_killcam_transition" );
#precache( "eventstring", "post_killcam_transition" );

#namespace killcam;


function init_final_killCam()
{
	killcam_entities::init();
	level.finalKillcamSettings = [];

	init_final_killCam_team( "none" );
	
	foreach( team in level.teams )
	{
		init_final_killCam_team( team );
	}
	
	level.finalKillCam_winner = undefined;
	level.finalKillCam_winnerPicked = undefined;
}

function init_final_killCam_team( team )
{
	level.finalKillcamSettings[team] = SpawnStruct();

	clear_final_killcam_team( team );
}

function clear_final_killcam_team( team )
{
	level.finalKillcamSettings[team].spectatorclient = undefined;
	level.finalKillcamSettings[team].weapon = undefined;
	level.finalKillcamSettings[team].meansOfDeath = undefined;
	level.finalKillcamSettings[team].deathTime = undefined;
	level.finalKillcamSettings[team].deathTimeOffset = undefined;
	level.finalKillcamSettings[team].offsettime = undefined;
	level.finalKillcamSettings[team].killcam_entity_info = undefined;
	level.finalKillcamSettings[team].targetentityindex = undefined;
	level.finalKillcamSettings[team].perks = undefined;
	level.finalKillcamSettings[team].killstreaks = undefined;
	level.finalKillcamSettings[team].attacker = undefined;
}

function record_settings( spectatorclient, targetentityindex, weapon, meansOfDeath, deathTime, deathTimeOffset, offsettime, killcam_entity_info, perks, killstreaks, attacker )
{
	if( isdefined( attacker ) && isdefined( attacker.team ) && isdefined( level.teams[attacker.team] ) )
	{
		team = attacker.team;
		
		level.finalKillcamSettings[ team ].spectatorclient = spectatorclient;
		level.finalKillcamSettings[ team ].weapon = weapon;
		level.finalKillcamSettings[ team ].meansOfDeath = meansOfDeath;
		level.finalKillcamSettings[ team ].deathTime = deathTime;
		level.finalKillcamSettings[ team ].deathTimeOffset = deathTimeOffset;
		level.finalKillcamSettings[ team ].offsettime = offsettime;
		level.finalKillcamSettings[ team ].killcam_entity_info = killcam_entity_info;
		level.finalKillcamSettings[ team ].targetentityindex = targetentityindex;
		level.finalKillcamSettings[ team ].perks = perks;
		level.finalKillcamSettings[ team ].killstreaks = killstreaks;
		level.finalKillcamSettings[ team ].attacker = attacker;
	}

	level.finalKillcamSettings[ "none" ].spectatorclient = spectatorclient;
	level.finalKillcamSettings[ "none" ].weapon = weapon;
	level.finalKillcamSettings[ "none" ].meansOfDeath = meansOfDeath;
	level.finalKillcamSettings[ "none" ].deathTime = deathTime;
	level.finalKillcamSettings[ "none" ].deathTimeOffset = deathTimeOffset;
	level.finalKillcamSettings[ "none" ].offsettime = offsettime;
	level.finalKillcamSettings[ "none" ].killcam_entity_info = killcam_entity_info;
	level.finalKillcamSettings[ "none" ].targetentityindex = targetentityindex;
	level.finalKillcamSettings[ "none" ].perks = perks;
	level.finalKillcamSettings[ "none" ].killstreaks = killstreaks;
	level.finalKillcamSettings[ "none" ].attacker = attacker;
}

function erase_final_killcam()
{
	clear_final_killcam_team( "none" );
	
	foreach( team in level.teams )
	{
		clear_final_killcam_team( team );
	}
	
	level.finalKillCam_winner = undefined;
	level.finalKillCam_winnerPicked = undefined;
}

function dokillcam( attackerNum, targetNum, killcam_entity_info, weapon, meansOfDeath, deathTime, deathTimeOffset, offsetTime, respawn, maxtime, perks, killstreaks, attacker, keep_deathcam )
{
	self endon("disconnect");
	self endon("spawned");
	level endon("game_ended");


	if(attackerNum < 0)
		return;
        
	level.numPlayersWaitingToEnterKillcam++;
	
	if ( level.numPlayersWaitingToEnterKillcam > 1 )
		wait 0.05 * (level.numPlayersWaitingToEnterKillcam - 1);
	
	wait 0.05;
	level.numPlayersWaitingToEnterKillcam--;
	
	postDeathDelay = (getTime() - deathTime) / 1000;
	predelay = postDeathDelay + deathTimeOffset;
	
	killcamentitystarttime = get_killcam_entity_info_starttime( killcam_entity_info );
	
	camtime = calc_time( weapon, killcamentitystarttime, predelay, respawn, maxtime );
	postdelay = calc_post_delay();

	killcamlength = camtime + postdelay;
	
	if (isdefined(maxtime) && killcamlength > maxtime)
	{
		if (maxtime < 2)
			return;

		if (maxtime - camtime >= 1)
			postdelay = maxtime - camtime;
		else 
        {
			postdelay = 1;
			camtime = maxtime - 1;
		}
		
		killcamlength = camtime + postdelay;
	}

	killcamoffset = camtime + predelay;
	
	self notify ( "begin_killcam", getTime() );
	
	killcamstarttime = (gettime() - killcamoffset * 1000);
	
	self.sessionstate = "spectator";
	self.spectatekillcam = true;
	self.spectatorclient = attackerNum;
	self.killcamentity = -1;
	self thread set_killcam_entities( killcam_entity_info, killcamstarttime );
	self.killcamtargetentity = targetNum;
	self.killcamweapon = weapon;
	self.killcammod = meansOfDeath;
	self.archivetime = killcamoffset;
	self.killcamlength = killcamlength;
	self.psoffsettime = offsetTime;

	self allowSpectateTeam("freelook", true);
	self allowSpectateTeam("none", true);
	
	self thread ended_killcam_cleanup();

	wait 0.05;

	if ( self.archivetime <= predelay )
	{
		self.sessionstate = "dead";
		self.spectatorclient = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		self.spectatekillcam = false;
		
		self notify ( "end_killcam" );		
		return;
	}

	self.killcam = true;
    
	self thread wait_killcam_time();
	
	self waittill("end_killcam");
	
	self.sessionstate = "dead";
	self.spectatorclient = -1;
	self.killcamentity = -1;
	self.archivetime = 0;
	self.psoffsettime = 0;
	self.spectatekillcam = false;

}

function final_killcam_waiter()
{
	if ( level.finalKillCam_winnerPicked === true )
	{
		level waittill( "final_killcam_done" );
	}
}

function post_round_final_killcam()
{
	if ( isdefined( level.sidebet ) && level.sidebet )
	{
		return;
	}
	level notify( "play_final_killcam" );
	resetOutcomeForAllPlayers();
	final_killcam_waiter();	
}




function are_any_players_watching()
{
	players = level.players;
	for ( index = 0; index < players.size; index++ )
	{
		player = players[index];
		if ( isdefined( player.killcam ) )
			return true;
	}
	
	return false;
}


function set_entity( killcamentityindex, delayms )
{
	self endon("disconnect");
	self endon("end_killcam");
	self endon("spawned");
	
	if ( delayms > 0 )
		wait delayms / 1000;
	
	self.killcamentity = killcamentityindex;
}

function set_killcam_entities( entity_info, killcamstarttime )
{
	for ( index = 0; index < entity_info.entity_indexes.size; index++ )
	{
		delayms = entity_info.entity_spawntimes[index] - killcamstarttime - 100;
	
		thread set_entity(entity_info.entity_indexes[index], delayms );
		
		// return if this entity spawned before the killcam start time
		// we dont want any older entities
		if ( delayms <=0 )
			return;
	}
}

function wait_killcam_time()
{
	self endon("disconnect");
	self endon("end_killcam");

	wait(self.killcamlength - 0.05);
	self notify("end_killcam");
}

function wait_final_killcam_slowdown( deathTime, startTime )
{
	self endon("disconnect");
	self endon("end_killcam");
	secondsUntilDeath = ( ( deathTime - startTime ) / 1000 );
	deathTime = getTime() + secondsUntilDeath * 1000;
	waitBeforeDeath = 2;

	wait( max(0, (secondsUntilDeath - waitBeforeDeath) ) );
	
	setClientSysState("levelNotify", "sndFKsl" );

	setSlowMotion( 1.0, 0.25, waitBeforeDeath ); // start timescale, end timescale, lerp duration
	wait( waitBeforeDeath + .5 );
	setSlowMotion( 0.25, 1, 1.0 );

	wait(.5);
}



function end( final )
{
	self.killcam = undefined;
}


function spawned_killcam_cleanup()
{
	self endon("end_killcam");
	self endon("disconnect");

	self waittill("spawned");
	self end(false);
}

function spectator_killcam_cleanup( attacker )
{
	self endon("end_killcam");
	self endon("disconnect");
	attacker endon ( "disconnect" );

	attacker waittill ( "begin_killcam", attackerKcStartTime );
	waitTime = max( 0, (attackerKcStartTime - self.deathTime) - 50 );
	wait (waitTime);
	self end(false);
}

function ended_killcam_cleanup()
{
	self endon("disconnect");
	self end(false);

}

function ended_final_killcam_cleanup()
{
	self endon("disconnect");
	self waittill("end_killcam");
	level notify("killcam_ended");
	self end(true);
}

function final_killcam( winner )
{
	self endon("disconnect");
	level endon("game_ended");

	if ( util::wasLastRound() )
	{
		setMatchFlag( "final_killcam", 1 );	
		setMatchFlag( "round_end_killcam", 0 );	
	}
	else
	{
		setMatchFlag( "final_killcam", 0 );	
		setMatchFlag( "round_end_killcam", 1 );	
	}

	
	final_killcam_internal( winner );

	util::setClientSysState("levelNotify", "sndFKe" );
	
	//LUINotifyEvent( &"post_killcam_transition" );
	
	self FreezeControls( true );
		
	wait 1.5;

	self end(true);
	
	setMatchFlag( "final_killcam", 0 );	
	setMatchFlag( "round_end_killcam", 0 );
}

function final_killcam_internal( winner )
{
	winning_team = figureOutWinningTeam( winner );

	killcamSettings = level.finalKillcamSettings[ winning_team ];
	
	postDeathDelay = (getTime() - killcamSettings.deathTime) / 1000;
	predelay = postDeathDelay + killcamSettings.deathTimeOffset;
	
	killcamentitystarttime = get_killcam_entity_info_starttime( killcamSettings.killcam_entity_info );

	camtime = calc_time( killcamSettings.weapon, killcamentitystarttime, predelay, false, undefined );
	postdelay = calc_post_delay();

	killcamoffset = camtime + predelay;
	killcamlength = camtime + (postdelay + 2) - 0.05; // We do the -0.05 since we are doing a wait below.

	killcamstarttime = (gettime() - killcamoffset * 1000);

	self notify ( "begin_killcam", getTime() );
	util::setClientSysState("levelNotify", "sndFKs" );

	self.sessionstate = "spectator";
	self.spectatorclient = killcamSettings.spectatorclient;
	self.killcamentity = -1;
	self thread set_killcam_entities( killcamSettings.killcam_entity_info, killcamstarttime );
	self.killcamtargetentity = killcamSettings.targetentityindex;
	self.killcamweapon = killcamSettings.weapon;
	self.killcammod = killcamSettings.meansOfDeath;
	self.archivetime = killcamoffset;
	self.killcamlength = killcamlength;
	self.psoffsettime = killcamSettings.offsettime;

	// ignore spectate permissions
	foreach( team in level.teams )
	{
		self allowSpectateTeam(team, true);
	}
	self allowSpectateTeam("freelook", true);
	self allowSpectateTeam("none", true);

	self thread ended_final_killcam_cleanup();
	
	// wait till the next server frame to allow code a chance to update archivetime if it needs trimming
	wait 0.05;

	if ( self.archivetime <= predelay ) // if we're not looking back in time far enough to even see the death, cancel
	{
		// self.sessionstate = "dead"; // DO NOT SET to state "dead" in final killcam
		self.spectatorclient = -1;
		self.killcamentity = -1;
		self.archivetime = 0;
		self.psoffsettime = 0;
		self.spectatekillcam = false;

		self notify ( "end_killcam" );
		
		return;
	}
	

	self.killcam = true;

	if ( !( self IsSplitscreen() ) )
	{
		self add_timer(camtime);
	}
	
	self thread wait_killcam_time();
	self thread wait_final_killcam_slowdown( level.finalKillcamSettings[ winning_team ].deathTime, killcamstarttime );
	
	self waittill("end_killcam"); //this is needed too keep killcam overlay up.
	level notify("killcam_finished");

}




function calc_time( weapon, entitystarttime, predelay, respawn, maxtime )
{
	camtime = 0.0;
	
	// length from killcam start to killcam end
	if (GetDvarString( "scr_killcam_time") == "") 
	{

		if ( !respawn ) // if we're not going to respawn, we can take more time to watch what happened
		{
			camtime = 5.0;
		}
		else if ( weapon.isGrenadeWeapon )
		{
			camtime = 4.25; // show long enough to see grenade thrown
		}
		else
			camtime = 2.5;
	}
	else
		camtime = GetDvarfloat( "scr_killcam_time");
	
	if (isdefined(maxtime)) {
		if (camtime > maxtime)
			camtime = maxtime;
		if (camtime < .05)
			camtime = .05;
	}
	
	return camtime;
}

function calc_post_delay()
{
	postdelay = 0;
	
		// time after player death that killcam continues for
	if (GetDvarString( "scr_killcam_posttime") == "")
	{
		postdelay = 2;
	}
	else 
	{
		postdelay = GetDvarfloat( "scr_killcam_posttime");
		if (postdelay < 0.05)
			postdelay = 0.05;
	}
	
	return postdelay;
}


function add_timer(camtime)
{
}



function get_closest_killcam_entity( attacker, killCamEntities, depth )
{
	if ( !isdefined( depth ) )
		depth = 0;
		
	closestKillcamEnt = undefined;
	closestKillcamEntIndex = undefined;
	closestKillcamEntDist = undefined;
	origin = undefined;
	
	foreach( killcamEntIndex, killcamEnt in killCamEntities )
	{
		if ( killcamEnt == attacker )
			continue;
		
		origin = killcamEnt.origin;
		if ( isdefined( killcamEnt.offsetPoint ) )
			origin += killcamEnt.offsetPoint;

		dist = DistanceSquared( self.origin, origin );

		if ( !isdefined( closestKillcamEnt ) || dist < closestKillcamEntDist )
		{
			closestKillcamEnt = killcamEnt;
			closestKillcamEntDist = dist;
			closestKillcamEntIndex = killcamEntIndex;
		}
	}
	
	// check to see if the player is visible at time of death
	if ( depth < 3 && isdefined( closestKillcamEnt ) )
	{
		if ( !BulletTracePassed( closestKillcamEnt.origin, self.origin, false, self ) )
		{
			killCamEntities[closestKillcamEntIndex] = undefined;
			
			betterKillcamEnt = get_closest_killcam_entity( attacker, killCamEntities, depth + 1 );
			
			if ( isdefined( betterKillcamEnt ) )
			{
				closestKillcamEnt = betterKillcamEnt;
			}
		}
	}

	return closestKillcamEnt;
}

function get_killcam_entity( attacker, eInflictor, weapon )
{
	if ( !isdefined( eInflictor ) )
		return undefined;

	// if there is a killcam entity stored on the player who died
	if ( isdefined(self.killcamKilledByEnt) )
		return self.killcamKilledByEnt;
		
	if ( eInflictor == attacker )
	{
		if( !isdefined( eInflictor.isMagicBullet ) )
			return undefined;
		if( isdefined( eInflictor.isMagicBullet ) && !eInflictor.isMagicBullet )
			return undefined;
	}
	else if ( isdefined( level.levelSpecificKillcam ) )
	{
		levelSpecificKillcamEnt = self [[level.levelSpecificKillcam]]();
		if ( isdefined( levelSpecificKillcamEnt ) )
			return levelSpecificKillcamEnt;
	}
	
	if ( weapon.name == "hero_gravityspikes" )
		return undefined;

	if ( isdefined(eInflictor.killCamEnt) )
	{
		// this is the case with the player helis
		if ( eInflictor.killCamEnt == attacker )
			return undefined;
			
		return eInflictor.killCamEnt;
	}
	else if ( isdefined(eInflictor.killCamEntities) )
	{
		return get_closest_killcam_entity( attacker, eInflictor.killCamEntities );
	}
	
	if ( isdefined( eInflictor.script_gameobjectname ) && eInflictor.script_gameobjectname == "bombzone" )
		return eInflictor.killCamEnt;
	
	return eInflictor;
}

function get_secondary_killcam_entity(entity, entity_info )
{
	if( !isdefined(entity) || !isdefined( entity.killcamentityindex ) )
		return;
	
	entity_info.entity_indexes[entity_info.entity_indexes.size] = entity.killcamentityindex;
	entity_info.entity_spawntimes[entity_info.entity_spawntimes.size] = entity.killcamentitystarttime;
}

function get_primary_killcam_entity(attacker, eInflictor, weapon, entity_info )
{
	killcamentity = self get_killcam_entity( attacker, eInflictor, weapon );
	killcamentitystarttime = killcam::get_killcam_entity_start_time( killcamentity );
	killcamentityindex = -1;

	if ( isdefined( killcamentity ) )
	{
		killcamentityindex = killcamentity getEntityNumber(); // must do this before any waiting lest the entity be deleted
	}
	
	entity_info.entity_indexes[entity_info.entity_indexes.size] = killcamentityindex;
	entity_info.entity_spawntimes[entity_info.entity_spawntimes.size] = killcamentitystarttime;
	
	get_secondary_killcam_entity( killcamentity, entity_info );
}

function get_killcam_entity_info(attacker, eInflictor, weapon)
{
	entity_info = SpawnStruct();
	
	entity_info.entity_indexes = [];
	entity_info.entity_spawntimes = [];
	
	get_primary_killcam_entity(attacker, eInflictor, weapon, entity_info);
	
	return entity_info;
}

function get_killcam_entity_info_starttime( entity_info )
{
	if ( entity_info.entity_spawntimes.size == 0 )
		return 0;
	
	// the last one should be the oldest
	return entity_info.entity_spawntimes[entity_info.entity_spawntimes.size - 1];
}

function do_final_killcam()
{

	level waittill ( "play_final_killcam" );

	wait( 0.35 );
	
	level.inFinalKillcam = true;

	winner = "none";
	if( isdefined( level.finalKillCam_winner ) )
	{
		winner = level.finalKillCam_winner;
	}
	
	winning_team = figureOutWinningTeam( winner );
	 
	if( !isdefined( level.finalKillcamSettings[ winning_team ].targetentityindex ) )
	{
		level.inFinalKillcam = false;
		level notify( "final_killcam_done" );
		return;
	}
	
	attacker = level.finalKillcamSettings[ winning_team ].attacker;
	if( isDefined( attacker ) && isDefined( attacker.archetype ) && ( attacker.archetype == "mannequin" ) )
	{
		level.inFinalKillcam = false;
		level notify( "final_killcam_done" );
		return;
	}

	players = level.players;
	for ( index = 0; index < players.size; index++ )
	{
		player = players[index];
		player closeInGameMenu();
		player thread final_killcam( winner );
	}
	
	wait( 0.1 );

	while ( are_any_players_watching() )
		wait 0.05;

	level notify( "final_killcam_done" );
	level.inFinalKillcam = false;
}

function get_killcam_entity_start_time(killcamentity)
{
	killcamentitystarttime = 0;

	if ( isdefined( killcamentity ) )
	{
		if ( isdefined( killcamentity.startTime ) )
		{
			killcamentitystarttime = killcamentity.startTime;
		}
		else
		{
			killcamentitystarttime = killcamentity.birthtime;
		}
		if ( !isdefined( killcamentitystarttime ) )
			killcamentitystarttime = 0;
	}

	return killcamentitystarttime;
}

function store_killcam_entity_on_entity( killcam_entity )
{
	assert( isdefined( killcam_entity ) );

	// store the entity and the start time it existed because it may not exist at the time we use it
	self.killcamentitystarttime = get_killcam_entity_start_time( killcam_entity );
	self.killcamentityindex = killcam_entity getEntityNumber(); 
}





function setClientSysState(sSysName, sSysState, player)
{
	if(!isdefined(level._clientSys))
	{
		AssertMsg("setClientSysState called before registration of any systems.");
		return;
	}
}

function resetOutcomeForAllPlayers()
{
	players = level.players;
	for ( index = 0; index < players.size; index++ )
	{
		player = players[index];
		player notify ( "reset_outcome" );
	}
}

function figureOutWinningTeam( winner )
{
	if ( !isdefined( winner ) )
	    return "tie";
	    
	if ( IsEntity( winner ) )
		return ( isdefined( winner.team ) ? winner.team : "none" );

	return winner;
}

function set_permissions()
{
	team = self.sessionteam;
	
	if ( team == "spectator" )
	{
		// in online splitscreen we are only going to allow spectators to 
		// spectate the team of the other player on splitscreen
			
		if ( team == "spectator" )
		{
			self allow_all_teams( true );
			self allowSpectateTeam( "freelook", false );
			self allowSpectateTeam( "none", true );
			self allowSpectateTeam( "localplayers", true );
			return;
		}
	}
}

function allow_all_teams( allow )
{
	foreach( team in level.teams )
	{
		self allowSpectateTeam( team, allow );
	}

}



function timeUntilRoundEnd()
{
	if ( level.gameEnded )
	{
		timePassed = (getTime() - level.gameEndTime) / 1000;
		timeRemaining = level.postRoundTime - timePassed;
		
		if ( timeRemaining < 0 )
			return 0;
		
		return timeRemaining;
	}
	
	if ( level.inOvertime )
		return undefined;
	
	if ( level.timeLimit <= 0 )
		return undefined;
	
	if ( !isdefined( level.startTime ) )
		return undefined;
	
	timePassed = (getTimePassed() - level.startTime)/1000;
	timeRemaining = (level.timeLimit * 60) - timePassed;
	
	return timeRemaining + level.postRoundTime;
}

function getTimePassed()
{
	if ( !isdefined( level.startTime ) )
		return 0;
	
	if ( level.timerStopped )
		return (level.timerPauseTime - level.startTime) - level.discardTime;
	else
		return (gettime()            - level.startTime) - level.discardTime;

}