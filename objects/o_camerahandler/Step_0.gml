/// @description Insert description here
// You can write your code in this editor

if(!Room_Small)
	{
	var _player = global.the_Player;
	var _CamX = camera_get_view_x(view_camera[0]);
	var _CamY = camera_get_view_y(view_camera[0]);
	
	var _CamW = camera_get_view_width(view_camera[0]);
	var _CamH = camera_get_view_height(view_camera[0]);
	
	var _NewCamX = clamp(global.RoomOffset_x+_player.x-(_CamW/2),RoomX-16,RoomX+RoomWidth+16-(_CamW));
	var _NewCamY = clamp(global.RoomOffset_y+_player.y-(_CamH/2),RoomY-16,RoomY+RoomHeight+16-(_CamH));

	//camera_set_view_pos(view_camera[0], _NewCamX, _NewCamY);
	
	var x1 = _CamX;
	var y1 = _CamY;
	var x2 = x1 + _CamW;
	var y2 = y1 + _CamH;
	var xBound = _CamW/3;
	var yBound = _CamH/3;
	//if(!point_in_rectangle(obj_PlayerBase.x,obj_PlayerBase.y,x1+xBound,y1+yBound,x2-xBound,_CamY+y2-yBound))
	//{
			camera_set_view_pos(view_camera[0],
			lerp(camera_get_view_x(view_camera[0]),_NewCamX,0.1),
			lerp(camera_get_view_y(view_camera[0]),_NewCamY,0.1));
	//}
	
	}