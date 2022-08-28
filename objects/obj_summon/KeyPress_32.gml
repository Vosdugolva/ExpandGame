/// @description Insert description here
// You can write your code in this editor


if(Rider != noone){
	
	instance_activate_object(Rider)
	var new_x = x;
	var new_y = bbox_bottom+16;
	with(Rider)
		{
		x = new_x;
		y = new_y;
		}

global.the_Player = Rider;
//Set_Camera_on_Player();	

Rider = noone
Mounted = false;

}