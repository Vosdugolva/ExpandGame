/// @description Insert description here
// You can write your code in this editor
alarm[0] = oneSec*3
image_alpha = 0;
image_speed = 0;
Timer = 0;
Toggle = true;
	var _CamID = view_camera[0];
	var _Camx = camera_get_view_x(_CamID);
	var _Camy = camera_get_view_y(_CamID);
	var _CamWidth = camera_get_view_width(_CamID);
	var _CamHeight = camera_get_view_height(_CamID);
	display_set_gui_size(_CamWidth,_CamHeight)
	
ready_font = font_add_sprite(spr_main_font,32,true,1);
draw_set_font(ready_font);
global.the_Player = id;
Set_Camera_on_Player();

//Variables to transfer on load
Player_HP = Player_startHP;
Player_MP  = Player_StartMP;
Player_ItemFlags = Player_startitems;