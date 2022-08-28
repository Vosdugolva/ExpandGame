/// @description Scrolling
if(!camScrollStart)
	{
		switch(camScrollDir)
			{
			case Dir.Up: scrollcount = ver_scrollCount; CamScrollSpeed_x = 0; CamScrollSpeed_y = -camScrollSpeed; break;
			case Dir.Right: scrollcount = hor_scrollCount; CamScrollSpeed_x = camScrollSpeed; CamScrollSpeed_y = -0; break;
			case Dir.Down: scrollcount = ver_scrollCount; CamScrollSpeed_x = 0; CamScrollSpeed_y = camScrollSpeed; break;
			case Dir.Left: scrollcount = hor_scrollCount; CamScrollSpeed_x = -camScrollSpeed; CamScrollSpeed_y = -0; break;
				
			}
	camScrollStart = true;
	global.scroll_Delay = 10;
	}
	var _Player = global.the_Player;
	var _CamX = camera_get_view_x(view_camera[0]);
	var _CamY = camera_get_view_y(view_camera[0]);
	
	var _CamW = camera_get_view_width(view_camera[0]);
	var _CamH = camera_get_view_height(view_camera[0]);
	
	var _NewCamX = ((_Player.x + CamScrollSpeed_x) div _CamW)*_CamW+1*sign(CamScrollSpeed_x);
	var _NewCamY = ((_Player.y + CamScrollSpeed_y) div _CamH)*_CamH+1*sign(CamScrollSpeed_y);
	
if(scrollcount > 0)
	{
		camera_set_view_pos(view_camera[0],
			lerp(camera_get_view_x(view_camera[0]),_NewCamX,1/scrollcount),
			lerp(camera_get_view_y(view_camera[0]),_NewCamY,1/scrollcount));
			if(scrollcount = 1)camera_set_view_pos(view_camera[0],_NewCamX,_NewCamY);
	//camera_set_view_pos(view_camera[0], _CamX + CamScrollSpeed_x, _CamY + CamScrollSpeed_y);
	scrollcount -= 1;
	//show_debug_message(scrollcount);
	}
else if(global.scroll_Delay)
	{global.scroll_Delay -= 1;
		global.Allow_Spawns = true;
			//_CamX = (obj_PlayerBase.x div _CamW)*_CamW;
			//_CamY = (obj_PlayerBase.y div _CamH)*_CamH;
			//camera_set_view_pos(view_camera[0], _CamX, _CamY);
		}
	else{global.is_Scrolling = false; global.activeRoom = -1;  instance_destroy();}

