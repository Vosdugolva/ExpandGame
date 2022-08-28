/// @description Methods and Time Sources

_DeflToggle = function(_Bool)
		{
		Deflating = _Bool;
		}
Deflation = time_source_create(time_source_game,deflateTime,time_source_units_seconds,_DeflToggle,[true]);

//show_debug_message("state changed to" +  string(next_state))
Cue_StateChange = function(){fsm.change(next_state); }
StateChange_Set_Time = function(_newTime){time_source_reconfigure(next_state_timer,_newTime,time_source_units_seconds,Cue_StateChange);}
next_state_timer = time_source_create(time_source_game,next_state_time,time_source_units_seconds,Cue_StateChange);

enemy_burst_fx = function() {
	
	audio_play_sound(snd_enemyburst,5,false);
	for(var i = 0; i < 6;i += 1)
		{
			var _dir = (360/6)*i
			var _dir2 = ((360/6)*i)+30;	
			var _xlen = lengthdir_x(8*image_xscale,_dir)
			var _ylen = lengthdir_y(8*image_xscale,_dir)
			var _inst = instance_create_depth(x+_xlen,y+_ylen,Projectile_depth,FX_Poof2)
			with(_inst)
			{
			speed = 1;
			image_speed = 0.6
			direction = _dir;			
			anim_loop_death = 1;
			}	
			var _xlen = lengthdir_x(8*image_xscale,_dir2)
			var _ylen = lengthdir_y(8*image_xscale,_dir2)
			var _inst = instance_create_depth(x+_xlen,y+_ylen,Projectile_depth,FX_Poof2)
			with(_inst)
			{
			speed = 0.7;
			image_speed = 0.6
			direction = _dir2;		
			anim_loop_death = 1;
			}
		}

				
}

enemy_quickdraw = function(_state) {
if(enemy_attack_at_spawn)
	{
	enemy_attack_at_spawn = false;
	fsm.change(_state);
		
	}
}

enemy_burst_shake = function (){

var _ShakeAnim = function(){
		//Define frames of action
		var _frameshake0 = function(){act_Timer_Set(0,quarSec); x_shake = 0;}
		var _frameshake1 = function(){act_Timer_Set(0,quarSec/4); x_shake = 1;}
		var _frameshake2 = function(){act_Timer_Set(0,quarSec/4); x_shake = -1;}
		//Play frame by frame actions, Action_counter increments with each call
		
		var _count = Action_counter("defeat");
		var _countmod =  _count mod 2;
		if(_countmod == 0)
		{_frameshake1(); }
		else{_frameshake2();}
		
		if(_count > 4){enemy_burst();}
}

if (act_Timer(0,1)) {
	
		_ShakeAnim();
	}
	
}

enemy_rupture_shake = function (){

var _ShakeAnim = function(){
		//Define frames of action
		var _frameshake0 = function(){act_Timer_Set(0,oneSec*8); x_shake = 0;}
		var _frameshake1 = function(){act_Timer_Set(0,quarSec/8); x_shake = 1;}
		var _frameshake2 = function(){act_Timer_Set(0,quarSec/8); x_shake = -1;}
		//Play frame by frame actions, Action_counter increments with each call
		
		var _count = Action_counter("defeat");
		var _countmod =  _count mod 2;
		if(_countmod == 0)
		{_frameshake1(); }
		else{_frameshake2();}
		
		if(_count > 6){_frameshake0(); hspeed = random_range(-15,15); vspeed = -25;}
}

if (act_Timer(0,1)) {
	
		_ShakeAnim();
	}
	
}

enemy_sfx = function(_snd = snd_enemyshot_1){
	
audio_play_sound(_snd,5,false);
}


enemy_hitflash = function(_flashcol = c_aqua, _mode = 0)
{
flash_timer = 2;
flash_color = _flashcol;

show_debug_message(enemy_palette);
if(enemy_palette = noone) exit;
				//Create Surface pal
			if(!surface_exists(pal_surface)){
			  var _height = pal_swap_get_color_count(enemy_palette); //enemy_palette
			  pal_surface = surface_create(2,_height);
			  surface_set_target(pal_surface);
			  draw_clear_alpha(0,0);
			  pal_swap_draw_palette(enemy_palette,0,0,0);
			  pal_swap_draw_palette(enemy_palette,enemy_palette_num,1,0);
			  draw_set_color(flash_color); 
			  draw_point(1,0); 
			  surface_reset_target();
			}
}


Draw_enemy_standard = function()
{
pal_swap_set(enemy_palette,enemy_palette_num,false);
	draw_sprite_ext(sprite_index, image_index, 
			        x-x_shake, y-z, 
			        image_xscale, image_yscale, 
			        image_angle, image_blend, image_alpha);
pal_swap_reset();
}

Draw_enemy_hitflash = function()
{
if(flash_timer){

			///Draw With Palette Swap
			pal_swap_set(pal_surface,1,true);
			    draw_sprite_ext(sprite_index, image_index, 
			                    x-x_shake, y-z, 
			                    image_xscale, image_yscale, 
			                    image_angle, image_blend, image_alpha);
			pal_swap_reset();
			flash_timer -= 1;
				}
}