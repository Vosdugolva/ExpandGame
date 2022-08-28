/// @description Insert description here
// You can write your code in this editor


switch(pass_pillar_state)
		{
			
		case 1: draw_set_color(c_blue); break;
		case 2: draw_set_color(c_red); break;
		case 3: draw_set_color(c_green); break;
		default: draw_set_color(c_gray); break;
		}
draw_rectangle(x-8,y-8,x+8,y+8,false);