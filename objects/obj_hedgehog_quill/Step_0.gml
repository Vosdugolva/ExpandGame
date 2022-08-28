/// @description Insert description here
// You can write your code in this editor

//var md = point_direction(x, y, mouse_x, mouse_y);
image_index = (round((direction/360)*8));
show_debug_message((direction/360)*8);
Proj_die_from_distance();
Proj_die_from_lifetime();
Proj_die_when_owner_Dies();
Proj_check_when_inbounds();
proj_die_when_out_bounds();