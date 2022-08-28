/// @description Insert description here
// You can write your code in this editor
image_speed = 0

image_index = is_pump_tile;

give_pump = function(){
var _Posting = "Player_Has_Pump";

if(not billboard_read(_Posting))
{
	Take_expand_rod();
	Give_magic_pump()
	billboard_post(_Posting,true)
}	
	
}


give_wand = function(){
var _Posting = "Player_Has_Pump";

if(is_undefined(billboard_read(_Posting)))exit;

if(billboard_read(_Posting))
{
	Give_expand_rod();
	Take_magic_pump()
	billboard_post(_Posting,false)
}	
	
}