/// @description Initialization
camScrollDir = 0;
camScrollSpeed = 16;
CamScrollSpeed_x = 0;
CamScrollSpeed_y = 0;
CamWidth = camera_get_view_width(view_camera[0]);
CamHeight = camera_get_view_height(view_camera[0]);

scrollcount = 0;
hor_scrollCount = CamWidth/camScrollSpeed;
ver_scrollCount = CamHeight/camScrollSpeed;
camScrollStart = false;

