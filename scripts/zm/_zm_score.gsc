#using scripts\codescripts\struct;

#using scripts\shared\callbacks_shared;
#using scripts\shared\clientfield_shared;
#using scripts\shared\flagsys_shared;
#using scripts\shared\scoreevents_shared;
#using scripts\shared\system_shared;
#using scripts\shared\util_shared;

#insert scripts\shared\shared.gsh;
#insert scripts\shared\version.gsh;
#insert scripts\zm\_zm_utility.gsh;

#using scripts\zm\_zm_bgb;
#using scripts\zm\_zm_bgb_token;
#using scripts\zm\_zm_pers_upgrades_functions;
#using scripts\zm\_zm_stats;
#using scripts\zm\_zm_utility;

#insert scripts\zm\_zm_bgb.gsh;

#namespace zm_score;

REGISTER_SYSTEM( "zm_score", &__init__, undefined )

function __init__()
{
	score_cf_register_info( "damage", VERSION_SHIP, 7 );
	score_cf_register_info( "death_normal", VERSION_SHIP, 3 );
	score_cf_register_info( "death_torso", VERSION_SHIP, 3 );
	score_cf_register_info( "death_neck", VERSION_SHIP, 3 );
	score_cf_register_info( "death_head", VERSION_SHIP, 3 );
	score_cf_register_info( "death_melee", VERSION_SHIP, 3 );

	// clientuimodels are registered client-side in raw/ui/uieditor/clientfieldmodels.lua
	clientfield::register( "clientuimodel", "hudItems.doublePointsActive", VERSION_SHIP, 1, "int" );
	clientfield::register( "clientuimodel", "hudItems.showDpadUp", VERSION_SHIP, 1, "int" );
	clientfield::register( "clientuimodel", "hudItems.showDpadDown", VERSION_SHIP, 1, "int" );
	clientfield::register( "clientuimodel", "hudItems.showDpadLeft", VERSION_SHIP, 1, "int" );
	clientfield::register( "clientuimodel", "hudItems.showDpadRight", VERSION_SHIP, 1, "int" );
	
	callback::on_spawned( &player_on_spawned );
	
	level.score_total = 0; // holds the sum of all score received by any player during the session
	level.a_func_score_events = [];	// use this to customize score events for new ai types
}


//	Registers a function for score event processing
function register_score_event( str_event, func_callback )
{
	level.a_func_score_events[ str_event ] = func_callback;
}


function reset_doublexp_timer()
{
	self notify( "reset_doublexp_timer" );
	self thread doublexp_timer();
}

function doublexp_timer()
{	
	self notify( "doublexp_timer" );
	self endon( "doublexp_timer" );
	self endon( "reset_doublexp_timer" );
	self endon( "end_game" );

	level flagsys::wait_till( "start_zombie_round_logic" );
	
	if( !level.onlineGame )
	{
		return;	
	}	
		
	wait 60;
	if( level.onlineGame )
	{
		if( !IsDefined( self ) )
		{
			return;
		}
		self DoubleXPTimerFired();
	}

	self thread reset_doublexp_timer();
}

function player_on_spawned()
{
	util::wait_network_frame(); // Hotjoin fix: Wait one network frame to make sure the clientfields have completed registration. 

	self thread doublexp_timer();
	
	if ( IsDefined(self) )
	{
		self.ready_for_score_events = true; 
	}
}

function score_cf_register_info( name, version, max_count )
{
	// clientuimodels are registered client-side in raw/ui/uieditor/clientfieldmodels.lua
	for ( i = 0; i < MAX_CLIENTS_ZM; i++ )
	{
		clientfield::register( "clientuimodel", "PlayerList.client" + i + ".score_cf_" + name, version, GetMinBitCountForNum( max_count ), "counter" );
	}
}


function score_cf_increment_info( name )
{
	foreach ( player in level.players )
	{
		thread wait_score_cf_increment_info( player, "PlayerList.client" + self.entity_num + ".score_cf_" + name );
	}
}

function wait_score_cf_increment_info( player, cf )
{
    return;
}


//chris_p - added dogs to the scoring
function player_add_points( event, mod, hit_location ,is_dog, zombie_team, damage_weapon )
{
	return;
}

function get_points_multiplier(player)
{
    return;
}

// Adjust points based on number of players (MikeA)
function get_zombie_death_player_points()
{
    return;
}


// Adjust team points based on number of players (MikeA)
function get_zombie_death_team_points()
{
	return;
}


function player_add_points_kill_bonus( mod, hit_location, weapon, player_points = undefined )
{
	return;
}

function player_reduce_points( event, n_amount )
{
    return;
}


//
//	Add points to the player's score
//	self is a player
//
function add_to_player_score( points, b_add_to_total = true, str_awarded_by = "" )
{
	return;
	
}


//
//	Subtract points from the player's score
//	self is a player
//
function minus_to_player_score( points )
{
    return;
}


//
//	Add points to the team pool
//	self is a player.  We need to derive the team from the player
//
function add_to_team_score( points )
{
	//MM (3/10/10)	Disable team points

// 	if( !isdefined( points ) || points == 0 || level.intermission )
// 	{
// 		return;
// 	}
// 
// 	// Find out which team pool to adjust
// 	team_pool = level.team_pool[ 0 ];
// 	if ( isdefined( self.team_num ) && self.team_num != 0 )
// 	{
// 		team_pool = level.team_pool[ self.team_num ];
// 	}
// 
// 	team_pool.score += points; 
// 	team_pool.score_total += points; 
// 
// 	// also set the score onscreen
// 	team_pool set_team_score_hud(); 
}


//
//	Subtract points from the team pool
//	self is a player.  We need to derive the team from the player
//
function minus_to_team_score( points )
{
/*
	if( !isdefined( points ) || level.intermission )
	{
		return;
	}

	team_pool = level.team_pool[ 0 ];
	if ( isdefined( self.team_num ) && self.team_num != 0 )
	{
		team_pool = level.team_pool[ self.team_num ];
	}

	team_pool.score -= points; 

	// also set the score onscreen
	team_pool set_team_score_hud(); 
*/
}


//
//
//
function player_died_penalty()
{
    return;
}


//
//
//
function player_downed_penalty()
{
    return;
}

//check to see if player has enough points to purchase
function can_player_purchase( n_cost )//self = player
{
    return true;
}
