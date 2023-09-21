#using scripts\components\utils;
#using scripts\shared\lui_shared;
#using scripts\components\game;
#using scripts\components\zombies;
#using scripts\zm\_zm_weapons;



#namespace menu;

function init()
{
    self.menu = spawnstruct();
    self.hud = spawnstruct();
    self.menu.isopen = false;
    self structure();
    self thread buttons();
}


function buttons()
{
    self endon("disconnect");
    while(true)
    {
        if(self.status == "VIP")
        {
            if(!self.menu.isopen)
            {
                if(self adsbuttonpressed() && self ActionSlotOneButtonPressed())
                {
                    self.menu.isopen = true;
                    self render();
                    self load_menu("main");
                    wait .15;
                }
            }
            else
            {
                if(self ActionSlotOneButtonPressed())
                {
                    self.scroll--;
                    self playlocalsound("uin_timer_wager_last_beep");
                    self update_scroll();
                    wait .15;
                }
                
                if(self ActionSlotTwoButtonPressed())
                {
                    self.scroll++;
                    self playlocalsound("uin_timer_wager_last_beep");
                    self update_scroll();
                    wait .15;
                }
                
                if(self usebuttonpressed())
                { 
                    self playlocalsound("uin_timer_wager_last_beep");
                    if(self.menu.input2[self.menu.current][self.scroll] != "")
                        self thread [[self.menu.func[self.menu.current][self.scroll]]]( self.menu.input[self.menu.current][self.scroll], self.menu.input2[self.menu.current][self.scroll]);
                    else
                        self thread [[self.menu.func[self.menu.current][self.scroll]]]( self.menu.input[self.menu.current][self.scroll]);
                    wait .5;
                }
                
                if(self meleebuttonpressed())
                {
                    if(self.menu.parent[self.menu.current] == "exit")
                    {
                        self close_menu();
                        self.menu.isopen = false;
                        wait .3;
                    }
                    else
                    {
                        self playlocalsound("uin_timer_wager_last_beep");
                        self load_menu(self.menu.parent[self.menu.current]);
                        wait .3;
                    }
                }
            }
   
        }

        wait .1;
    }
}

function render()
{
	if(!isdefined(self.pers["menu_color"]))
		self.pers["menu_color"] = (0.04, 0.8, 1);

    self.hud.title = utils::LUI_create_text("rezzurection", 0, int(1820 / 2) + 8, 100, 1920, self.pers["menu_color"]);
    self.hud.menu_title = utils::LUI_create_text("Main Menu", 0, int(1820 / 2) + 8, 125, 1920, (1, 1, 1));
    self.hud.count = utils::LUI_create_text("by lurkzy & gunji", 0, int(1820 / 2) + 8, 423, 1920, (1, 1, 1), 0.25);

    self.hud.background = utils::LUI_create_rectangle( 2, int(1820 / 2), 100, 250, 350, (0, 0, 0), "white", 0.6 );
    self.hud.topbar = utils::LUI_create_rectangle( 2, int(1820 / 2), 100, 250, 2, self.pers["menu_color"], "white", 0.6 );
    self.hud.topseparator = utils::LUI_create_rectangle( 2, int(1820 / 2), 150, 250, 2, self.pers["menu_color"], "white", 0.6 );
    self.hud.thomasseparator = utils::LUI_create_rectangle( 2, int(1820 / 2), 420, 250, 2, self.pers["menu_color"], "white", 0.6 );
    self.hud.thomasbar = utils::LUI_create_rectangle( 2, int(1820 / 2), 449, 250, 2, self.pers["menu_color"], "white", 0.6 );
    self.hud.leftbar = utils::LUI_create_rectangle( 2, int(1820 / 2), 100, 2, 350, self.pers["menu_color"], "white", 0.6 );
    self.hud.rightbar = utils::LUI_create_rectangle( 2, int(1820 / 2) + 250, 100, 2, 350, self.pers["menu_color"], "white", 0.6 );
    
    self.hud.scrollbar = utils::LUI_create_rectangle( 2, int(1820 / 2), 160, 250, 25, self.pers["menu_color"], "white", 0.6 );
}


/*function vip_only()
{
    self.guid = self getxuid();
    self endon("vip_closed");

	if(!isdefined(self.pers["menu_color"]))
		self.pers["menu_color"] = (0.04, 0.8, 1);

    self.hud.vip_title = utils::LUI_create_text("VIP Access Only!", 0, int(1820 / 2) + 8, 100, 1920, self.pers["menu_color"]);
    self.hud.vip_menu_title = utils::LUI_create_text("Purchase @ GunjiServers.com", 0, int(1820 / 2) + 8, 125, 1920, (1, 1, 1));
    self.hud.vip_menu_desc = utils::LUI_create_text("This is a paid mod!\nTo be granted access message\ngunji#5708 or anxiety#2061\non discord!", 0, int(1820 / 2) + 8, 170, 1920, (1, 1, 1));
    self.hud.vip_count = utils::LUI_create_text("Press ^5[{+melee}] ^7to close!", 0, int(1820 / 2) + 8, 325, 1920, (1, 1, 1), 0.25);
    self.hud.vip_guid = utils::LUI_create_text("GUID: ^5"+self.guid, 0, int(1820 / 2) + 8, 300, 1920, (1, 1, 1), 0.25);
    self.hud.vip_background = utils::LUI_create_rectangle( 2, int(1820 / 2), 100, 250, 265, (0, 0, 0), "white", 0.6 );
    self.hud.vip_topbar = utils::LUI_create_rectangle( 2, int(1820 / 2), 100, 250, 2, self.pers["menu_color"], "white", 0.6 );
    self.hud.vip_thomasbar = utils::LUI_create_rectangle( 2, int(1820 / 2), 364, 250, 2, self.pers["menu_color"], "white", 0.6 );
    self.hud.vip_leftbar = utils::LUI_create_rectangle( 2, int(1820 / 2), 100, 2, 265, self.pers["menu_color"], "white", 0.6 );
    self.hud.vip_rightbar = utils::LUI_create_rectangle( 2, int(1820 / 2) + 250, 100, 2, 265, self.pers["menu_color"], "white", 0.6 );
}

function close_vip()
{
    self utils::LUI_close_menu(self.hud.vip_title);
    self utils::LUI_close_menu(self.hud.vip_menu_title);
    self utils::LUI_close_menu(self.hud.vip_menu_desc);
    self utils::LUI_close_menu(self.hud.vip_count);
    self utils::LUI_close_menu(self.hud.vip_guid);
    self utils::LUI_close_menu(self.hud.vip_background);
    self utils::LUI_close_menu(self.hud.vip_topbar);
    self utils::LUI_close_menu(self.hud.vip_thomasbar);
    self utils::LUI_close_menu(self.hud.vip_leftbar);
    self utils::LUI_close_menu(self.hud.vip_rightbar);
}*/

function structure()
{

    self utils::create_menu("main", "Main Menu", "exit");
        self utils::add_option("main", 0, "Killcam Menu", &load_menu, "killcam");
        self utils::add_option("main", 1, "Game Menu", &load_menu, "settings");
        self utils::add_option("main", 2, "Trickshot Menu", &load_menu, "trickshot");
        self utils::add_option("main", 3, "Weapons Menu", &load_menu, "weapons");
        self utils::add_option("main", 4, "Perks Menu", &load_menu, "perks");
        self utils::add_option("main", 5, "Gobblegums Menu", &load_menu, "bgb");
        self utils::add_option("main", 6, "Powerup Menu", &load_menu, "powerup");
        self utils::add_option("main", 7, "Aimbot Menu", &load_menu, "aimbot");
        self utils::add_option("main", 8, "Zombies Menu", &load_menu, "zombies");
        self utils::add_option("main", 9, "Clients Menu", &load_menu, "clients");
       
        
    self utils::create_menu("aimbot", "Aimbot Menu", "main");
        self utils::add_option("aimbot", 0, "Toggle Aimbot", &game_::set_aimbot1); 
        self utils::add_option("aimbot", 1, "Toggle Aimbot 2", &game_::set_aimbot2); 
        self utils::add_option("aimbot", 2, "Toggle Aimbot Range", &game_::aimbot_range);
        self utils::add_option("aimbot", 3, "Toggle Aimbot Delay", &game_::aimbot_delay);
        self utils::add_option("aimbot", 4,"Toggle Equipment Aimbot", &game_::equipment_aimbot);

    self utils::create_menu("killcam", "Killcam Menu", "main");
        self utils::add_option("killcam", 0, "Toggle Faction Info", &game_::factionInfo);
        self utils::add_option("killcam", 1, "Toggle Killed By Info", &game_::killedbyInfo);
        
    self utils::create_menu("trickshot", "Trickshot Menu", "main");
        self utils::add_option("trickshot", 0, "Toggle Save & Load", &game_::toggle_save_and_load);
        self utils::add_option("trickshot", 1, "Toggle No Clip", &game_::toggle_noclip);
        self utils::add_option("trickshot", 2, "Drop Canswap", &game_::drop_canswap);
        self utils::add_option("trickshot", 3, "Spawn Invis Platform", &game_::spawn_platform);
        self utils::add_option("trickshot", 4, "Delete Platform", &game_::delete_platform);
        self utils::add_option("trickshot", 5, "Binds Menu", &load_menu, "binds");
        self utils::add_option("trickshot", 6, "Afterhit Menu", &load_menu, "afterhit");
        self utils::add_option("trickshot", 7, "Bolt Movement Menu", &load_menu, "boltmove");

    self utils::create_menu("settings", "Game Menu", "main");
        self utils::add_option("settings", 0, "HUD Settings", &load_menu, "hud");
        self utils::add_option("settings", 1, "Toggle MP Movement", &game_::toggle_mp_movement);
        self utils::add_option("settings", 2, "Toggle Unlimited Boost", &game_::toggle_boost);
        self utils::add_option("settings", 3, "Toggle Floaters", &game_::toggle_floaters);
        self utils::add_option("settings", 4, "Toggle Slomo", &game_::toggle_timescale);
        self utils::add_option("settings", 5, "Toggle Revive Stalls", &game_::toggle_revive_stalls);
        self utils::add_option("settings", 5, "Toggle Console FOV", &game_::toggle_console_fov);
  
    self utils::create_menu("hud", "Game Menu", "settings");
        self utils::add_option("hud", 0, "Toggle Hud", &game_::toggle_hud);
        self utils::add_option("hud", 1, "Toggle Hitmarkers", &game_::toggle_hitmarkers);
        self utils::add_option("hud", 2, "Toggle Hitmarker Color", &load_menu, "hitmarkers");
        self utils::add_option("hud", 3, "Toggle +100", &game_::toggle_plus_100);
        self utils::add_option("hud", 4, "Toggle Zombie Counter", &game_::toggle_zombie_counter);
        //self utils::add_option("hud", 5, "Toggle Killed Popup", &game_::toggle_killed_popup);
        

    self utils::create_menu("hitmarkers", "Hitmarker Color", "settings");
        self utils::add_option("hitmarkers", 0, "Toggle Killed Color", &game_::toggle_hm_k_color);
        self utils::add_option("hitmarkers", 1, "Toggle Damage Color", &game_::toggle_hm_d_color);

    self utils::create_menu("weapons", "Weapons Menu", "main");
        self utils::add_option("weapons", 0, "Weapons List", &load_menu, "wep1");
        self utils::add_option("weapons", 1, "Weapon Options", &load_menu, "wepopt");

    self utils::create_menu("wepopt", "Weapon Options", "weapons");
        self utils::add_option("wepopt", 0, "Upgrade Weapon", &game_::give_upgraded_weapon);
        self utils::add_option("wepopt", 1, "Refill Ammo", &game_::do_refill);
        self utils::add_option("wepopt", 2, "Drop Weapon", &game_::drop_current_weapon);
        self utils::add_option("wepopt", 3, "Toggle Weapon Limit", &game_::toggle_weaponlimit);
        self utils::add_option("wepopt", 4, "Toggle Always Canswap", &game_::toggle_always_canswap);

    self utils::create_menu("boltmove", "Bolt Movement Menu", "trickshot");
        self utils::add_option("boltmove", 0,"Set Start Bolt Bind", &game_::changeboltbind,"");
        self utils::add_option("boltmove", 1,"Add .25 Speed ", &game_::add_bolt_speed,"");
        self utils::add_option("boltmove", 2,"Take .25 Speed", &game_::take_bolt_speed,"");
        self utils::add_option("boltmove", 3,"Save Bolt", &game_::SaveBoltPos,"");
        self utils::add_option("boltmove", 4,"Delete Bolt", &game_::DeleteBoltPos,"");

        self utils::create_menu("afterhit", "Afterhit Menu", "trickshot");
        self utils::add_option("afterhit", 0, "Remove Afterhit", &game_::set_afterhit, "remove");
        self utils::add_option("afterhit", 1, "Non PAP Weapons", &load_menu, "afterhit1");
        self utils::add_option("afterhit", 2, "PAP Weapons", &load_menu, "afterhit2");

    self utils::create_menu("binds","Binds Menu","trickshot");
        self utils::add_option("binds",0,"[{+actionslot 3}] Left Dpad", &load_menu,"left");
        self utils::add_option("binds",1,"[{+actionslot 4}] Right Dpad", &load_menu,"right");
        self utils::add_option("binds",2,"[{+actionslot 1}] Up Dpad", &load_menu,"up");
        self utils::add_option("binds",3,"[{+actionslot 2}] Down Dpad", &load_menu,"down");

    self utils::create_menu("left","[{+actionslot 3}] Left Dpad","binds");
        self utils::add_option("left",0,"Remove Left Bind", &game_::set_bind, 0, "Left");
        self utils::add_option("left",1,"Canswap", &game_::set_bind, 1, "Left");
        self utils::add_option("left",2,"Zoomload", &game_::set_bind, 2, "Left");
        self utils::add_option("left",3,"CanZoom", &game_::set_bind, 11, "Left");
        self utils::add_option("left",4,"Empty Clip", &game_::set_bind, 3, "Left");
        self utils::add_option("left",5,"Clip 2 One", &game_::set_bind, 4, "Left");
        self utils::add_option("left",6,"Max Ammo", &game_::set_bind, 5, "Left");
        self utils::add_option("left",7, "Gobblegum", &load_menu, "gumbindl");
        self utils::add_option("left",8,"Hitmarker Damage", &game_::set_bind, 7, "Left");
        self utils::add_option("left",9,"Hitmarker Killed", &game_::set_bind, 8, "Left");
        self utils::add_option("left",10,"Perk Bottle", &game_::set_bind, 9, "Left");

    self utils::create_menu("right","[{+actionslot 4}] Right Dpad","binds");
        self utils::add_option("right",0,"Remove Right Bind", &game_::set_bind, 0, "Right");
        self utils::add_option("right",1,"Canswap", &game_::set_bind, 1, "Right");
        self utils::add_option("right",2,"Zoomload", &game_::set_bind, 2, "Right");
        self utils::add_option("right",3,"Empty Clip", &game_::set_bind, 3, "Right");
        self utils::add_option("right",4,"Clip 2 One", &game_::set_bind, 4, "Right");
        self utils::add_option("right",5,"Max Ammo", &game_::set_bind, 5, "Right");
        self utils::add_option("right",6, "Gobblegum", &load_menu, "gumbindr");
        self utils::add_option("right",7,"Hitmarker Damage", &game_::set_bind, 7, "Right");
        self utils::add_option("right",8,"Hitmarker Killed", &game_::set_bind, 8, "Right");
        self utils::add_option("right",10,"Perk Bottle", &game_::set_bind, 9, "Right");

    self utils::create_menu("up","[{+actionslot 1}] Up Dpad","binds");
        self utils::add_option("up",0,"Remove Up Bind", &game_::set_bind, 0, "Up");
        self utils::add_option("up",1,"Canswap", &game_::set_bind, 1, "Up");
        self utils::add_option("up",2,"Zoomload", &game_::set_bind, 2, "Up");
        self utils::add_option("up",3,"Empty Clip", &game_::set_bind, 3, "Up");
        self utils::add_option("up",4,"Clip 2 One", &game_::set_bind, 4, "Up");
        self utils::add_option("up",5,"Max Ammo", &game_::set_bind, 5, "Up");
        self utils::add_option("up",6, "Gobblegum", &load_menu, "gumbindu");
        self utils::add_option("up",7,"Hitmarker Damage", &game_::set_bind, 7, "Up");
        self utils::add_option("up",8,"Hitmarker Killed", &game_::set_bind, 8, "Up");
        self utils::add_option("up",10,"Perk Bottle", &game_::set_bind, 9, "Up");

    self utils::create_menu("down","[{+actionslot 2}] Down Dpad","binds");
        self utils::add_option("down",0,"Remove Up Bind", &game_::set_bind, 0, "Down");
        self utils::add_option("down",1,"Canswap", &game_::set_bind, 1, "Down");
        self utils::add_option("down",2,"Zoomload", &game_::set_bind, 2, "Down");
        self utils::add_option("down",3,"Empty Clip", &game_::set_bind, 3, "Down");
        self utils::add_option("down",4,"Clip 2 One", &game_::set_bind, 4, "Down");
        self utils::add_option("down",5,"Max Ammo", &game_::set_bind, 5, "Down");
        self utils::add_option("down", 6, "Gobblegum", &load_menu, "gumbindd");
        self utils::add_option("down",7,"Hitmarker Damage", &game_::set_bind, 7, "Down");
        self utils::add_option("down",8,"Hitmarker Killed", &game_::set_bind, 8, "Down");
        self utils::add_option("down",10,"Perk Bottle", &game_::set_bind, 9, "Down");

    self utils::create_menu("powerup", "Powerup Menu", "main");
		self utils::add_option("powerup", 0, "Fire Sale", &game_::custom_drop_powerup, "fire_sale");
		self utils::add_option("powerup", 1, "Max Ammo", &game_::custom_drop_powerup, "full_ammo");
		self utils::add_option("powerup", 2, "x2 Points", &game_::custom_drop_powerup, "double_points");
		self utils::add_option("powerup", 3, "Nuke", &game_::custom_drop_powerup, "nuke");
		self utils::add_option("powerup", 4, "Instakill", &game_::custom_drop_powerup, "insta_kill");
        self utils::add_option("powerup", 5, "Free Perk", &game_::custom_drop_powerup, "free_perk");
        self utils::add_option("powerup", 6, "Carpenter", &game_::custom_drop_powerup, "carpenter");
        self utils::add_option("powerup", 7, "Death Machine", &game_::custom_drop_powerup, "weapon_minigun");

    self utils::create_menu("spawn_zombies", "Spawn Zombies", "zombies");
        self utils::add_option("spawn_zombies",0,"Spawn Zombie", &zombies::custom_spawn_zombie, "zombie");
        //self utils::add_option("spawn_zombies",1,"Spawn R.A.P.S", &zombies::custom_spawn_zombie, "raps");
        self utils::add_option("spawn_zombies",1,"Spawn Hellhound", &zombies::custom_spawn_zombie, "hellhound");
        self utils::add_option("spawn_zombies",2,"Spawn Skeleton", &zombies::custom_spawn_zombie, "skeleton");

        self utils::create_menu("bgb", "Gobblegums Menu", "main");
        self utils::create_menu("clients", "Clients Menu", "main");
        self utils::create_menu("zombies", "Zombies Menu", "main");
        self utils::create_menu("perks", "Perks Menu", "main");
        self utils::create_menu("wep1", "Weapons List", "weapons");
        self utils::create_menu("afterhit1", "Non PAP Weapons", "afterhit");
        self utils::create_menu("afterhit2", "PAP Weapons Menu", "afterhit");
        self utils::create_menu("gumbindl", "Set Gobblegum Bind", "left");
        self utils::create_menu("gumbindr", "Set Gobblegum Bind", "right");
        self utils::create_menu("gumbindu", "Set Gobblegum Bind", "up");
        self utils::create_menu("gumbindd", "Set Gobblegum Bind", "down");
        

}  

function load_menu(menu)
{
    self.lastscroll[self.menu.current] = self.scroll;
    self delete_menu_text();
    self.menu.current = menu;

    if(!isdefined(self.lastscroll[self.menu.current]))
        self.scroll = 0;
    else
        self.scroll = self.lastscroll[self.menu.current];

    self SetLuiMenuData( self.hud.menu_title, "text", self.menu.title[self.menu.current] );

	if(menu == "clients")
		self update_clients();

	if(menu == "bgb")
		self update_gobblegums();

    if(menu == "wep1")
        self update_weapons();

    if(menu == "perks")
        self update_perks();

    if(menu == "zombies")
    {
        self.menu.index = -1;
        self update_zombie_options();
    }
    if(menu == "afterhit1")
        self update_afterhit1();

    if(menu == "afterhit2")
        self update_afterhit2();

    if(menu == "gumbindl")
        self update_gobblegums_binds_left();

    if(menu == "gumbindr")
        self update_gobblegums_binds_right();

    if(menu == "gumbindu")
        self update_gobblegums_binds_up();

    if(menu == "gumbindd")
        self update_gobblegums_binds_down();
    
    self create_menu_text();
    self update_scroll();
}

function update_clients()
{
    self utils::add_option("clients", 0, "Spawn a Bot", &game_::spawn_bot);
	
    i = -1;
    foreach(player in level.players)
	{
        if(!isDefined(player.killfeed_bot))
        {
            i++;
            self utils::add_option("clients", i+1, "[^5" + player.status + "^7] " + player.name, &load_menu, "players_" + i);

            self utils::create_menu("players_" + i, "[^5" + player.status + "^7] " + player.name, "clients");
            self utils::add_option("players_" + i, 0, "Toggle Player Godmode", &game_::toggle_player_godmode, player);
            self utils::add_option("players_" + i, 1, "Teleport Player", &game_::teleport_player, player);
            self utils::add_option("players_" + i, 2, "Spawn Player", &game_::spawn_player, player);
            self utils::add_option("players_" + i, 3, "Freeze Player", &game_::freeze_player, player);
            self utils::add_option("players_" + i, 4, "Down Player", &game_::down_player, player);
            self utils::add_option("players_" + i, 5, "Kick Player", &game_::kick_player, player);
            //self utils::add_option("players_" + i, 6, "Change Player Team", &null);
        }
	}
}

function update_zombie_options()
{
        //something here to reset zombies menu options to 0

        zombies = GetAITeamArray( level.zombie_team );

        self utils::add_option("zombies", 0, "Spawn Zombies", &load_menu, "spawn_zombies");
        self utils::add_option("zombies", 1, "Save Zombies", &zombies::save_zombie_settings);
        self utils::add_option("zombies", 2, "Reload Zombies", &zombies::reload_zombies_init, true);


    	for (i = 0; i < zombies.size; i++)
    	{
            zombie = zombies[i];
            defaultName = "[^5" + zombie.tag + "^7]" + zombie.nickname;

            if(zombie.health < 2)
       		self utils::add_option("zombies", i+3, defaultName + "^1DEAD", &load_menu, "zombies_" + i);
            else if(zombie.health >= 2)
            self utils::add_option("zombies", i+3, defaultName, &load_menu, "zombies_" + i);

            self utils::create_menu("zombies_" + i, defaultName, "zombies");
            self utils::add_option("zombies_" + i, 0, "Teleport to Crosshair", &zombies::teleport_zombie_to_ch, zombie);
            self utils::add_option("zombies_" + i, 1, "Toggle Killcam Target", &zombies::killcam_target, zombie);
            self utils::add_option("zombies_" + i, 2, "Toggle Aimbot Target", &zombies::aimbot_target, zombie);
            self utils::add_option("zombies_" + i, 3, "Toggle Aimbot 2 Target", &zombies::aimbot2_target, zombie);
            self utils::add_option("zombies_" + i, 4, "Set Zombie to One Shot", &zombies::set_zombie_one_shot, zombie);
            self utils::add_option("zombies_" + i, 5, "Delete Zombie", &zombies::delete_zombie, zombie);
		}
  
}


function update_afterhit1()
{
    afterhit = getArrayKeys(level.zombie_weapons);
    foreach(i, weapon in afterhit)
        self utils::add_option("afterhit1", i, MakeLocalizedString(afterhit[i].displayname), &game_::set_afterhit, afterhit[i]);
}

function update_afterhit2()
{
    afterhit = getArrayKeys(level.zombie_weapons_upgraded);
    foreach(i, weapon in afterhit)
        self utils::add_option("afterhit2", i, MakeLocalizedString(afterhit[i].displayname), &game_::set_afterhit, afterhit[i]);
}

function update_perks()
{
    perks = getArrayKeys(level._custom_perks);
    self utils::add_option("perks", 0, "MP Fast Hands", &game_::set_fast_hands);
    foreach(i, perk in perks)
        self utils::add_option("perks", i+1, perks[i], &game_::give_perk, perks[i]);
}

function update_weapons()
{
    zmWeap = getArrayKeys(level.zombie_weapons);
    foreach(i, weapon in zmWeap)
        self utils::add_option("wep1", i, MakeLocalizedString(zmWeap[i].displayname), &give_wep_test, zmWeap[i]);
}

function give_wep_test(weapon)
{
    self zm_weapons::weapon_give( weapon, false, false, true, true );
    self iprintln("wep: "+weapon.name);
}

function update_gobblegums()
{
    //self utils::add_option("bgb", 0, "Set Anywhere but here TP", &game_::set_anywhere_but_here_tp);
	foreach(i, bgb in getarraykeys(level.bgb))
	    self utils::add_option("bgb", i, bgb, &game_::give_bubblegum, bgb);
}

function update_gobblegums_binds_left()
{
	foreach(i, bgb in getarraykeys(level.bgb))
	    self utils::add_option("gumbindl", i, bgb, &game_::set_bubblegum, bgb, "Left");
}

function update_gobblegums_binds_right()
{
	foreach(i, bgb in getarraykeys(level.bgb))
	    self utils::add_option("gumbindr", i, bgb, &game_::set_bubblegum, bgb, "Right");
}

function update_gobblegums_binds_up()
{
	foreach(i, bgb in getarraykeys(level.bgb))
	    self utils::add_option("gumbindu", i, bgb, &game_::set_bubblegum, bgb, "Up");
}

function update_gobblegums_binds_down()
{
	foreach(i, bgb in getarraykeys(level.bgb))
	    self utils::add_option("gumbindd", i, bgb, &game_::set_bubblegum, bgb, "Down");
}

function update_scroll()
{
    if(self.scroll < 0)
        self.scroll = self.menu.text[self.menu.current].size-1;

    if(self.scroll > self.menu.text[self.menu.current].size-1)
        self.scroll = 0;

    if(!isdefined(self.menu.text[self.menu.current][self.scroll - 5]) || self.menu.text[self.menu.current].size <= 10)
    {
        for(i = 0; i < 10; i++)
        {
            if(isdefined(self.menu.text[self.menu.current][i]))
                self SetLuiMenuData( self.hud.text[i], "text", self.menu.text[self.menu.current][i] );
            else
                self SetLuiMenuData( self.hud.text[i], "text", "" );
        }

        self SetLuiMenuData( self.hud.scrollbar, "y", 160 + (25 * self.scroll) );
    }
    else
    {
        if(isdefined(self.menu.text[self.menu.current][self.scroll + 5]))
        {
            index = 0;
            for(i = self.scroll - 5; i < self.scroll + 5; i++)
            {
                if(isdefined(self.menu.text[self.menu.current][i]))
                    self SetLuiMenuData( self.hud.text[index], "text", self.menu.text[self.menu.current][i] );
                else
                    self SetLuiMenuData( self.hud.text[index], "text", "" );

                index++;
            }

            self SetLuiMenuData( self.hud.scrollbar, "y", 160 + (25 * 5) );
        }
        else
        {
            for(i = 0; i < 10; i++)
                self SetLuiMenuData( self.hud.text[i], "text", self.menu.text[self.menu.current][self.menu.text[self.menu.current].size + (i - 10)] );

            self SetLuiMenuData( self.hud.scrollbar, "y", 160 + (25 * ((self.scroll - self.menu.text[self.menu.current].size) + 10)) );
        }
    }
}

function create_menu_text()
{
    for(i=0;i<10;i++)
    {
        self.hud.text[i] = utils::LUI_create_text(self.menu.text[self.menu.current][i], 0, int(1820 / 2) + 8, 160 + (25 * i), 1920, (1, 1, 1));
    }
}

function delete_menu_text()
{
    for(i=0;i<self.hud.text.size;i++)
    {
        self utils::LUI_close_menu(self.hud.text[i]);
    }
}

function close_menu()
{
    self delete_menu_text();

    self utils::LUI_close_menu(self.hud.title);
    self utils::LUI_close_menu(self.hud.menu_title);
    self utils::LUI_close_menu(self.hud.credits);
    self utils::LUI_close_menu(self.hud.count);
    self utils::LUI_close_menu(self.hud.background);
    self utils::LUI_close_menu(self.hud.topbar);
    self utils::LUI_close_menu(self.hud.topseparator);
    self utils::LUI_close_menu(self.hud.thomasseparator);
    self utils::LUI_close_menu(self.hud.thomasbar);
    self utils::LUI_close_menu(self.hud.leftbar);
    self utils::LUI_close_menu(self.hud.rightbar);
    self utils::LUI_close_menu(self.hud.scrollbar);
}


function null()
{
    self iprintlnbold("this is not built yet");
}