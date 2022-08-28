/// @description Methods

Toggle_wep = function(_dir = 0)
{
	var WepCount = ds_list_size(WeaponSet);
	Weapon_Active += _dir;
	if(Weapon_Active > WepCount-1){Weapon_Active = 0;}
	if(Weapon_Active < 0){Weapon_Active = WepCount-1;}
	Weapon_Name = WeaponSet[| Weapon_Active][$ "Name"];
	
}

Set_wep = function(_wepnum = 0){
Weapon_Active = 0;	
}

check_weapon_toggle = function() {
	wepTogKey = keyboard_check_pressed(ord("Q"));
	
	if(wepTogKey)Toggle_wep(1);
	
}

Check_forcefield = function(_x,_y){
	//try to unlock forcefields if we make contact with them
	var _col = instance_place(_x, _y, obj_ForceField);
	if(place_meeting(_x, _y, _col) and Player_keyCount > 0)
		{
		unlock_Forcefield(_col.Forcefield_Number)
		}	
	
}

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
	var md = point_direction(x, y, mouse_x, mouse_y);
	md += 25;
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
	aimDir = (round(((md)/360)*7));
	aimDir = clamp(aimDir,0,7);
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
Check_forcefield(x + hsp, y);
if (place_meeting(x + hsp, y, par_collision)) {

	while (!place_meeting(x + sign(hsp), y, par_collision)) {
		x += sign(hsp);
	}
	hsp = 0;
}

x += hsp;

///----------Vertical collisions and movement----------
Check_forcefield(x, y + vsp);
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
if(check_bitflag(Player_ItemFlags,Item_SpeedSalt)) playerSpeed = Player_SaltSpeed;
	}
}


/*
MovementHandler = function() {

if place_meeting(x+(sign(input.key_hor)*8),y,par_collision){

			    while !place_meeting(x+(sign(input.key_hor)*4),y,par_collision){
			        x += input.key_hor;
			    }
    
			    if place_meeting(x+(sign(input.key_hor)*8),y+16,par_collision){
			        y = y - 4;
			    }
    
			    if place_meeting(x+(sign(input.key_hor)*8),y-16,par_collision){
			        y = y + 4;
			    }
      
			}
			else
			{
			    x += lengthdir_x(input.key_speed*playerSpeed,input.key_dir);
			}

			//Vertical (Y)
			if place_meeting(x,y+(sign(input.key_vert)*8),par_collision){

			    while !place_meeting(x,y+(sign(input.key_vert)*4),par_collision){
			        y += input.key_vert;
			    }
    
			    if place_meeting(x+16,y+(sign(input.key_vert)*8),par_collision){
			        x = x - 4;
			    }
    
			    if place_meeting(x-16,y+(sign(input.key_vert)*8),par_collision){
			        x = x + 4;
			    }
    
			}
			else
			{
			    y += lengthdir_y(input.key_speed*playerSpeed,input.key_dir);
			}

			if (input.Key_Focus){
			    focusing = true;
			    playerSpeed = Player_FocusSpeed;
			}
			else{
			    focusing = false;
			    playerSpeed = Player_WalkSpeed;
			}
	
}
*/


WalkAnim = function (){
ActTimer--;
if (ActTimer <= 0) {
		switch(ActCount)
		{
		case 0: ActTimer = eigthSec; ActCount = 1; imageframe = player_SpriteList.idle; break;
		case 1: ActTimer = eigthSec; ActCount = 0; imageframe = player_SpriteList.walk1; break;
		}
	}
	
}


Player_Death_Effect = function() {
	
	
	for(var i = 0; i < 6;i += 1)
		{
			_inst = instance_create_depth(x,y,Player_depth,FX_Poof2)
			with(_inst)
			{
			speed = 1;
			direction = (360/6)*i;			
			anim_loop_death = 4;
			}	
			
			_inst = instance_create_depth(x,y,Player_depth,FX_Poof2)
			with(_inst)
			{
			speed = 0.7;
			direction = ((360/6)*i)+30;		
			anim_loop_death = 4;
			}
		}

				
}

Player_spawn_reticle = function(){
reticle = instance_create_depth(mouse_x,mouse_y,Enemy_depth,obj_reticle);
var _id = id;
with(reticle)
	{
	Owner_ID = _id;
	}
	
}

Player_ReVulnerable = function(){Player_Invulnerable = false;}
Player_Invuln_Timer = time_source_create(time_source_game,1,time_source_units_seconds,Player_ReVulnerable);

Player_Reload_Game = function(){Load_The_Game(); show_debug_message("reloading!!!")}
Death_Reload = time_source_create(time_source_global,2.5,time_source_units_seconds,Player_Reload_Game);



//Item functions

item_effects = function(){
	
if(check_bitflag(Player_ItemFlags,Item_TenseMint))Tense_mint_effect();
if(check_bitflag(Player_ItemFlags,Item_BarriBerry))Barri_berry_effect();
}

Tense_mint_effect = function(){
	
/*
When tense mint is in effect, the player will check if they are very close to a projectile,
if they are, then we start to generate MP.
*/
var _tenseRad = Tense_radius;

if (Tense_buffer)Tense_buffer -= 1;
	else{ 
		if (collision_circle(x,y,_tenseRad,obj_Enemy_ProjectileBase,false,true))
		{
		Tense_buffer = 3;
		GiveMP(5);
		audio_play_sound(snd_graze,5,false);
		}
		
	}
	
	
}

Barri_berry_initiate = function(){

//called in "Player_FireCheck", this checks if we have the item, 
//and if so, increments the invuln timer for it
if(check_bitflag(Player_ItemFlags,Item_BarriBerry))Barri_Timer = Barri_Duration;
}

Barri_berry_effect = function(){
/*
when you have the barri berry, if the barri timer is greater than 1, 
*/	
	
if(Barri_Timer)Barri_Timer--;
	
}