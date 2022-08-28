/// @description Insert description here
// You can write your code in this editor
if not instance_exists(obj_Player) exit;
var hp_x = 8;
var hp_y = 8;
var hp_width = 8;
var hp_height = 8;
var HP_pips = obj_Player.Player_HP;
var HP_pips2 = obj_Player.Player_HeartFlower;

for(var i = 0; i < HP_pips+HP_pips2; i++)
	{
		var x_offset = hp_x + 10*i;
		if(i < HP_pips2)
		{
	draw_rectangle_color(x_offset,hp_y,x_offset + hp_width,hp_y + hp_height,
		c_purple,c_purple,c_purple,c_purple,false);
		}
		else
		{
	draw_rectangle_color(x_offset,hp_y,x_offset + hp_width,hp_y + hp_height,
		c_red,c_red,c_red,c_red,false);			
		}
	}
	
var mp_x = 11;
var mp_y = 24;
var mp_width = 4;
var mp_height = 8;
var mp_total = obj_Player.Player_MP;
var mp_pips = obj_Player.Player_MaxMP;
var mp_pips2 = obj_Player.Player_PowerBeat;
for(var i = 0; i < mp_pips+mp_pips2; i++)
	{
		var x_offset = mp_x + 10*i;
		if(i < mp_pips2)
		{
	draw_circle_color(x_offset,mp_y, mp_width,
		c_teal,c_teal,false);
		}
		else
		{
		if(i - mp_pips2 < mp_total)
		{
		draw_circle_color(x_offset,mp_y, mp_width,
		c_blue,c_blue,false);
		}
		else
		{
		draw_circle_color(x_offset,mp_y, mp_width,
		c_black,c_black,false);
		}
		
		}
	}
			
var mp2_x = 8;
var mp2_y = 32;
var mp2_width = 32;
var mp2_height = 2;
var mp2_percent = obj_Player.Player_MPBuild/obj_Player.Player_MPBuildCap;
	draw_rectangle_color(mp2_x,mp2_y,mp2_x+mp2_width,mp2_y + mp2_height,
		c_black,c_black,c_black,c_black,false);		
	draw_rectangle_color(mp2_x,mp2_y,mp2_x+mp2_width*mp2_percent,mp2_y + mp2_height,
		c_blue,c_blue,c_blue,c_blue,false);			
		

var weptext_x = 8
var weptext_y = 40
var activewep = obj_Player.Weapon_Active;
var wep = obj_Player.WeaponSet[|activewep];
if(not is_undefined(wep)){
	var weptext = wep.Name;
	draw_set_color(c_white)
	draw_set_font(hud_font);
	draw_text_transformed(weptext_x,weptext_y,weptext,1.0,1.0,0);
	}

var _keyCount = "Keystones: " + string(obj_Player.Player_keyCount);
draw_text_transformed(weptext_x,weptext_y+16,_keyCount,1.0,1.0,0);