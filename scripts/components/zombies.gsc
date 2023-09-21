#using scripts\shared\ai\zombie_utility;
#using scripts\shared\clientfield_shared;
#using scripts\zm\gametypes\_clientids;
#using scripts\zm\_zm_ai_raps;


#namespace zombies;

function lookPos(value)
{
	x = 10000000;
	if(isdefined(value))
	{
		x = value;
	}
	vector = AnglesToForward(self getPlayerAngles());
	return bullettrace(self GetEye(), (vector[0] * x, vector[1] * x, vector[2] * x), 0, self)["position"];
}

function teleport_zombie_to_ch(i)
{
    origin = self lookPos();
    i ForceTeleport( origin );
}

function kill_zombie(i)
{
    i DoDamage(500, i.origin, self, self, "torso_upper", "MOD_RIFLE_BULLET", 0, self getCurrentWeapon(), -1, false);
}

function delete_zombie(i)
{
    i delete();
}

function killcam_target(i)
{
    if(i.killcam_target == 0)
    {
        self iprintln("Killcam will now call on this Zombie!");
        i.killcam_target = 1;
    }
    else if(i.killcam_target == 1)
    {
        self iprintln("Killcam will no longer call on this Zombie!");
        i.killcam_target = 0;
    }
}

function aimbot_target(i)
{
    if(i.aimbot_target == 0)
    {
        self iprintln("Aimbot will target this Zombie!");
        i.aimbot_target = 1;
    }
    else if(i.aimbot_target == 1)
    {
        self iprintln("Aimbot will no longer target this Zombie!");
        i.aimbot_target = 0;
    }
}

function aimbot2_target(i)
{
    if(i.aimbot2_target == 0)
    {
        i.aimbot2_target = 1;
        self iprintln("Aimbot 2 will target this Zombie!");
    }
    else if(i.aimbot2_target == 1)
    {
        i.aimbot2_target = 0;
        self iprintln("Aimbot 2 will no longer target this Zombie!");
    }
}

function set_custom_zombie_properties(type, reload)
{

    if(type == "raps")
    {
        self.ignoreme = true;
        self.ignoreall = true; 
    }

    self.b_ignore_cleanup = true; //dont leak this new despawn fix
    self.ignore_cleanup_mgr = true; //dont leak this new despawn fix
    self.team = level.zombie_team;

    if(!reload) //if is reloading zombies dont set default variables
    {
        self.nickname = get_zombie_nickname(type);
        self.aimbot_target = 0;
        self.killcam_target = 0; 
        self.aimbot2_target = 0;
        self.zombie_type = type;
        zombies = GetAITeamArray( level.zombie_team );
        self.tag = zombies.size -1;
    }

    if(type == "hellhound")
    {
        wait 1;
        self show();
        self.health = 100; 
        self clientfield::set( "dog_fx", 1 );
        self.is_hellhound = 1;
    }

    wait 0.5;
    
    if(type == "skeleton")
    {
        if(getDvarString("mapname") == "zm_castle")
        {
            body = "c_zom_dlc1_skeleton_zombie_body";
            head = "c_zom_dlc1_skeleton_zombie_head";
        }
        else
        {
            body = "custom_skeleton_body";
            head = "custom_skeleton_head";
        }
        
        self setmodel(body);
        
        if ( IsDefined( self.head ) )
		self Detach( self.head );

		self Attach( head, "" );
    }
}

function custom_spawn_zombie(type)
{
    spawn_loc = self lookPos();
    spawner = get_spawner(type);

    if(spawner == undefined)
    {
        self iprintln("This zombie isnt on this map!");
        return;
    }
    else
        self iprintln("Zombie Spawning...");

    if(type == "raps")
        guy = zm_ai_raps::special_raps_spawn( 1, spawn_loc, 1 );
    else
        guy = zombie_utility::spawn_zombie( spawner,spawner.targetname,spawn_loc );
    
    guy thread set_custom_zombie_properties(type);

    wait 1;

    guy forceteleport( spawn_loc, self.angles+(0,180,0) ); //wait 1 second and force teleport give them time to spawn

}

function save_zombie_settings()
{
	level.saved_zombies = 1;
    self iprintlnbold("Saved all Zombies Settings!");
	level.zombie_info = [];
       
    zombies = GetAITeamArray( level.zombie_team );

	for(i = 0; i < zombies.size; i++ ) 
	{
		level.zombie_info[i] = spawnstruct();
		level.zombie_info[i].spawn_loc = zombies[i].origin;
		level.zombie_info[i].angles = zombies[i].angles;
		level.zombie_info[i].health = zombies[i].health;
		level.zombie_info[i].aimbot_target = zombies[i].aimbot_target;
        level.zombie_info[i].aimbot2_target = zombies[i].aimbot2_target;
		level.zombie_info[i].killcam_target = zombies[i].killcam_target;
        level.zombie_info[i].nickname = zombies[i].nickname;
        level.zombie_info[i].tag = zombies[i].tag;
        level.zombie_info[i].zombie_type = zombies[i].zombie_type;
    }

}

function reload_zombie_settings(i)
{
    spawner = get_spawner(level.zombie_info[i].zombie_type);		
	guy = zombie_utility::spawn_zombie( spawner,spawner.targetname,level.zombie_info[i].spawn_loc); 

    guy.aimbot_target = level.zombie_info[i].aimbot_target;
	guy.aimbot2_target = level.zombie_info[i].aimbot2_target;
    guy.killcam_target = level.zombie_info[i].killcam_target; 
    guy.nickname = level.zombie_info[i].nickname;
    guy.tag = level.zombie_info[i].tag;
    guy.zombie_type = level.zombie_info[i].zombie_type;

    guy thread set_custom_zombie_properties(undefined, true);
    wait 1;
    guy forceteleport(level.zombie_info[i].spawn_loc, level.zombie_info[i].angles);
    guy.health = level.zombie_info[i].health;
}


function reload_zombies_init(forced)
{

	if(isDefined(forced))
	{
        if(level.saved_zombies == 0)
        {
            self iprintln("Save zombie settings first!");
            return;
        }

		self iprintlnbold("Reloading Zombies..");
		
	}

    delete_all_zomb();
    
	for(i = 0; i < level.zombie_info.size; i++) 
	{
		level.zombie_info[i] thread reload_zombie_settings(i);
		wait 0.05;
	}

}

function get_spawner(type)
{
    if(type == "zombie" || type == "skeleton")	
        spawner = random(level.zombie_spawners);
    else if(type == "raps")
    {
        level.raps_enabled = true;
        level.raps_rounds_enabled = true;
        level.raps_round_count = 1;
        spawner = level.raps_spawners[0];
       
    }
    else if(type == "hellhound")
    {
        level.dog_rounds_enabled = true;
        level.dog_round_count = 1;
        level.dogs_enabled = true;  
        spawner = level.dog_spawners[0];
    }

    return spawner;
    
}

function get_zombie_nickname(type)
{
    zombies = GetAITeamArray( level.zombie_team );

    if(type == "zombie")	
        nickname = "Zombie";
    else if(type == "raps")
        nickname = "R.A.P.S";
    else if(type == "hellhound")
        nickname = "Hellhound";
    else if(type == "skeleton")
        nickname = "Skeleton";
    
    return nickname; 
}

function dog_death_fx(origin)
{
    self notify("death");
    PlayFX( level._effect["dog_gib"], origin );
	PlaySoundAtPosition( "zmb_hellhound_explode", origin );
    self hide();
    wait 3;
    self delete();
}

function delete_all_zomb()
{
    zombies = GetAITeamArray( level.zombie_team );
	
    if( IsDefined( zombies ) )
	{
		i = 0;
		while( i < zombies.size )
		{
			zombies[i] delete();
			i++;
		}
	}
}

function random( array )
{
	if ( array.size > 0 )
	{
		keys = GetArrayKeys( array );
		return array[ keys[RandomInt( keys.size )] ];
	}
}

function set_zombie_one_shot(i)
{
    i.health = 2;
    self iprintln("Zombie health is now set to ^51");
}

function delete_all_corpses()
{
	corpse_array = GetCorpseArray();
	
	for ( i = 0; i < corpse_array.size; i++ )
	{
		if ( IsDefined( corpse_array[ i ] ) )
		{
			corpse_array[ i ] Delete();
		}
	}
}