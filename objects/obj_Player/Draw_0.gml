/// @description Insert description here
fsm.draw();


var _CamID = view_camera[0];
	var _CamWidth = camera_get_view_width(_CamID);
	var _CamHeight = camera_get_view_height(_CamID);
	display_set_gui_size(_CamWidth,_CamHeight)

//TenseMint
if((check_bitflag(Player_ItemFlags,Item_TenseMint)) and not Player_is_Dead)
	{
	draw_set_color(c_black)
	if(Tense_buffer)draw_set_color(c_white)
	draw_circle(x,y,Tense_radius,true)	
		
	}
	
//BarriBerry
if((check_bitflag(Player_ItemFlags,Item_BarriBerry)) and not Player_is_Dead)
	{
	if(Barri_Timer){
		draw_set_color(c_blue)
		draw_set_alpha(0.5);
		draw_circle(x,y,Tense_radius,false)	
		draw_set_alpha(1);
		}
	}
	
var _wep = WeaponSet[| Weapon_Active];
if(not is_undefined(_wep)){
	if(_wep[$ "Name"] = "Pump")
		{
		draw_set_color(c_white)
		draw_circle(mouse_x,mouse_y,_wep.pump_radius,true)	
		
		}
}