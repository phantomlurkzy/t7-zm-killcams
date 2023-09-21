#using scripts\shared\callbacks_shared;
#using scripts\shared\util_shared;

#namespace killcam_entities;

function init()
{
	callback::on_connect( &on_player_connect );
}

function on_player_connect()
{
	thread on_player_throw_nade();
	thread on_player_missile_fire();
	thread on_player_projectile();
}

function on_player_throw_nade()
{
	self endon( "disconnect" );

	while(true)
	{
		self waittill( "grenade_fire", entity, weapon_struct );

		entity thread create_killcam_entity( weapon_struct );
	}
}

function on_player_missile_fire()
{
	self endon( "disconnect" );

	while(true)
	{
		self waittill( "missile_fire", entity, weapon_struct );

		entity thread create_killcam_entity( weapon_struct);
	}
}

function on_player_projectile()
{
	self endon( "disconnect" );

	while(true)
	{
		self waittill( "missile_fire", entity, weapon_struct );

		entity thread create_killcam_entity( weapon_struct, true);
	}
}

function create_killcam_entity(weapon_struct, projectile = false)
{
	ent = Spawn("script_model", self.origin);
	ent LinkTo(self);

	ent.starttime = gettime();

	ent SetWeapon(GetWeapon(weapon_struct.name)); //set the entity to its parent weapon so the camera offsets for the killcam are correct
	self.killcament = ent; //let interal script take care of the entity

	if(projectile == false)
 	self util::waittill_any( "death", "detonate", "explode", "deleted" ); //dont actually know the correct callbacks except for death, not that important, can use timeout for extra safety
 	else
	self waittill(#"projectile_impact_explode", origin, normal, surface);
	wait 3.5;
	ent Delete(); //delete to prevent g_spawn error
}