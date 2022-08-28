/// @description Insert description here
// You can write your code in this editor

if(shot_palette > 0) pal_swap_set(shot_palette,shot_palette_num,false)
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if(shot_palette > 0) pal_swap_reset();