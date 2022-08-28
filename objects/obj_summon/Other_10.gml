/// @description Insert description here
// You can write your code in this editor



check_input = function() {
	with (input) {
	Key_Left = keyboard_check_direct(ord("A"));
	Key_Right = keyboard_check_direct(ord("D"));
	Key_Up = keyboard_check_direct(ord("W"));
	Key_Down = keyboard_check_direct(ord("S"));
	Key_Focus = keyboard_check_direct(vk_space);

	key_hor = Key_Right - Key_Left;
	key_vert = Key_Down - Key_Up;
	key_speed = min(1,abs(key_hor)+abs(key_vert));
	key_dir = point_direction(0,0,key_hor,key_vert);
	}
};

check_SpriteAng = function() {
	if(input.key_hor != 0 or input.key_vert != 0){
	var md = input.key_dir;
	//md += 25;
	if(md > 360)md -= 360;
	/*
	if (md >= 45 && md < 135) {
	  aimDir = sprAng.spr_up;
	} else if (md >= 135 && md < 225) {
	  aimDir = sprAng.spr_left;
	} else if (md >= 225 && md < 315) {
	  aimDir = sprAng.spr_down;
	} else {
	  aimDir = sprAng.spr_right;
	}
	*/
	aimDir = (round(((md)/360)*4));
	aimDir = clamp(aimDir,0,3);
	}
}

MovementHandler = function() {

///--------Calculating movement speed----------
hsp = 0;
vsp = 0;
var xdif = input.key_hor;
var ydif = input.key_vert;
if (xdif != 0) || (ydif != 0) {
	var dir = point_direction(0, 0, xdif, ydif);
	dir_index = dir div 45;
	hsp = lengthdir_x(input.key_speed*playerSpeed, dir);
	vsp = lengthdir_y(input.key_speed*playerSpeed, dir);
}

///----------Horizontal collisions and movement----------
if (place_meeting(x + hsp, y, par_collision)) {
	while (!place_meeting(x + sign(hsp), y, par_collision)) {
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

///----------Vertical collisions and movement----------
if (place_meeting(x, y + vsp, par_collision)) {
	while (!place_meeting(x, y + sign(vsp), par_collision)) {
		y += sign(vsp);	
	}
	vsp = 0;
}

y += vsp;


if (input.Key_Focus){
focusing = true;
playerSpeed = Player_FocusSpeed;
}
else{
focusing = false;
playerSpeed = Player_WalkSpeed;
//if(check_bitflag(Player_ItemFlags,Item_SpeedSalt)) playerSpeed = Player_SaltSpeed;
	}
}

WalkAnim = function (){
	
	var _SmallWalk = function(){
		//Define frames of action
		var _frame1 = function(){act_Timer_Set(0,fifthSec);  imageframe = Summon_SpriteList.idle;}
		var _frame2 = function(){act_Timer_Set(0,fifthSec);  imageframe = Summon_SpriteList.walk1;}
		//Play frame by frame actions, Action_counter increments with each call
		switch(Action_counter("Move"))
		{
		case 0:
		case 1: _frame1(); break;
		case 2: _frame2(); break;
		case 3 : Action_counter("Move",true); break;
		}
		}
		
if (act_Timer(0,1)) {
	_SmallWalk();

	}
	
}


Draw_Mounted_Player = function (_val){
	if(_val){
		
	
	var _sprite = sp_Player;
	var _index = 0;
	var _dir = aimDir;
	var _y = 0;
	
	switch(_dir){
	case 0: _index = 0; _y = 8; break; 	
	case 1: _index = 4; _y = 0;break;
	case 2: _index = 8; _y = 8; break;
	case 3: _index = 12; _y = 0; break;
		
	}
	draw_sprite_ext(_sprite, _index, x, bbox_top-_y-z, 1.0, 1.0, image_angle, image_blend, image_alpha);
	}
	
}