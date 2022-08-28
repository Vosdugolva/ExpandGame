/// @description Insert description here
// You can write your code in this editor
	var _CamID = view_camera[0];
	var _Camx = camera_get_view_x(_CamID);
	var _Camy = camera_get_view_y(_CamID);
	var _CamWidth = camera_get_view_width(_CamID);
	var _CamHeight = camera_get_view_height(_CamID);
	var _str = "Ready";
	Timer++
	if(Timer > halfSec){Timer = 0; Toggle = !Toggle;}
if(Toggle){draw_set_color(c_white);
	draw_text_transformed(_CamWidth/2 - string_width(_str)/2,_CamHeight/2,"Ready",1.0,1.0,0);
	}