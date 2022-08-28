/// @description Insert description here
// You can write your code in this editor

	var _CamID = view_camera[0];
	var _CamWidth = camera_get_view_width(_CamID);
	var _CamHeight = camera_get_view_height(_CamID);
	display_set_gui_size(_CamWidth,_CamHeight)
	hud_font = font_add_sprite(spr_main_font,32,true,1);