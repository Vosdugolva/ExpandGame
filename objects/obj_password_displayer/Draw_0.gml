/// @description Insert description here
// You can write your code in this editor


switch(pass_display_state)
		{
			
		case 1: draw_set_color(c_blue); break;
		case 2: draw_set_color(c_red); break;
		case 3: draw_set_color(c_green); break;
		default: draw_set_color(c_gray); break;
		}
draw_circle(x,y,8,false);
draw_text_color(x,y,string(pass_display_state),c_black,c_black,c_black,c_black,1);