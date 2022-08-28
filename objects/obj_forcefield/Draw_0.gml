/// @description Insert description here
// You can write your code in this editor
	
	/*
	
			if(!surface_exists(pal_surface)){
			  var _height = pal_swap_get_color_count(ff_palette); //enemy_palette
			  var _width = steps + 2;
			  pal_surface = surface_create(_width,_height);
			  surface_set_target(pal_surface);
			  draw_clear_alpha(0,0);
			  pal_swap_draw_palette(ff_palette,0,0,0);
			  pal_swap_draw_palette(ff_palette,ff_palette_num,1,0);
			  var _half = steps/2
			  //draw_rectangle_color(2,0,steps,_height-1,c_yellow,c_red,c_yellow,c_red,false)
			  draw_rectangle_color(2,0,_half,_height-1,c_yellow,c_red,c_yellow,c_red,false)
			  draw_rectangle_color(_half,0,_half*2,_height-1,c_red,c_yellow,c_red,c_yellow,false)
			  surface_reset_target();
			}
			*/




pal_swap_set(pal_surface,round(ff_palette_num),true);
	draw_self();
pal_swap_reset();