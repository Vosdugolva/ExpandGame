#macro oneSec game_get_speed(gamespeed_fps)
#macro halfSec  oneSec/2
#macro quarSec  oneSec/4
#macro fifthSec  oneSec/5
#macro eigthSec  oneSec/8

#macro bump_Cap 3
#macro talking_range  32 //50

//Foraging item bitflags
#macro Item_TenseMint 1
#macro Item_BarriBerry 2
#macro Item_PBalloon 4
#macro Item_SpeedSalt 8

//Player defaults
#macro Player_startHP 3
#macro Player_StartMP 0
#macro Player_startitems 0

//actor Depths
#macro Player_depth  -500
#macro Enemy_depth  -600
#macro Projectile_depth  -600
#macro Lower_depth  -400

enum Dir {
	Up,
	Right,
	Down,
	Left
}

global.the_Player = noone;
global.is_Loading = false;
global.is_Scrolling = false;
global.Allow_Spawns = false;
global.talking_time = false;
global.scroll_Delay = 0;
global.activeRoom = -1;
global.antiMagicRoom = false;
global.RoomOffset_x = 0;
global.RoomOffset_y = 0;

global.freeze_enemies = false;

global.BurstCount = 0;