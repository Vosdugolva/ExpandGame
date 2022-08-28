/// @description Insert description here
// You can write your code in this editor

if (time_source_exists(Deflation)){time_source_destroy(Deflation);}
else{show_debug_message("this one ain't here")}
if (time_source_exists(next_state_timer)){time_source_destroy(next_state_timer)};