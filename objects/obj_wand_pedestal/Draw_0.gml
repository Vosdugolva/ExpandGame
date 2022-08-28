/// @description Insert description here
// You can write your code in this editor


switch(wand_is_set)
		{
			
		case true: draw_set_color(c_blue); break;
		case false: draw_set_color(c_red); break;
		}
draw_rectangle(x-8,y-8,x+8,y+8,false);