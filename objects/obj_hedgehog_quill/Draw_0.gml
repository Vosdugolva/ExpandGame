/// @description draw self
if(shot_palette > 0) pal_swap_set(shot_palette,shot_palette_num,false)
draw_sprite_ext(sprite_index, image_index, x, y-z, image_xscale, image_yscale, 0, image_blend, image_alpha);
if(DrawShadow)draw_sprite_ext(ShadowSprite, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
if(shot_palette > 0) pal_swap_reset();