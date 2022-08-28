// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Create_As_Inflatable(){

Expand = {}
EnemySize = 0; //Dictates sprite changes and AI behavior
EnemyMaxSize = 5; //How big the actor can get before bursting
EnemySizeThreshold = 3; //Effects the formula that dictates the damage needed to change size
EnemySizeThreshholdPlus = 6;
EnemyDefense = 1.0; //multiplier to reduces shot damage
enemyDamage = 0;
enemyDamage2 = 0;
EnemyMaxDamage = 100;
enemyMinDamage = 0;
enemyExpandRange = 80;
enemyExpandScaleMult = 0.1;
EnemySizeScaleFactor[0] = 0;
EnemySizeScaleFactor[1] = 1;
EnemySizeScaleFactor[2] = 1;
EnemySizeScaleFactor[3] = 1;
EnemySizeScaleFactor[4] = 1;
EnemySizeScaleFactor[5] = 1;
with (Expand)
{
	
	
}
}

function Flicker_effect(_duration = 1.0)
{
var _struct =
	{
	Flicker_Time : _duration,
	Owner_ID : id
	}
	
instance_create_depth(x,y,Player_depth,o_FlickerHandler,_struct);
	
}

function freeze_entity () {

with(obj_ProjectileBase)
	{
	speed_cache = speed;
	speed = 0;
	}
global.freeze_enemies = true;
}

function unfreeze_entity() {
	
	
	with(obj_ProjectileBase)
	{
	if(variable_instance_exists(id,"speed_cache")){speed = speed_cache;}
	}
global.freeze_enemies = false;
}

/// @description sin_oscillate(min,max,duration,?position)
/// @function sin_oscillate
/// @param min
/// @param max
/// @param duration [in seconds]
/// @param ?position
function sin_oscillate(){
  var position = argument_count>3 ? argument[3] : get_timer() / 1000000;
  return((argument[1]-argument[0])/2 * sin(position*2*pi/argument[2]) + (argument[1]+argument[0])/2);
}

/// @description wrap(value,min,max)
/// @function wrap
/// @param value
/// @param min
/// @param max
function wrap() {
	//returns the value wrapped.  If it is above or below the threshold it will wrap around
	var _val=argument[0];
	var _max = argument[2];
	var _min = argument[1];

	if(_val mod 1 == 0)
	{
	    while(_val > _max || _val < _min)
	    {
	        if(_val > _max)
	        {
	            _val=_min + _val - _max - 1
	        }
	        else if (_val < _min)
	        {
	            _val=_max + _val - _min + 1;
	        }
	        else
	            _val=_val;
	    }
	    return(_val);
	}
	else
	{
	    var _old = argument[0]+1;
	    while(_val != _old)
	    {
	        _old=_val;
	        if(_val<_min)
	            _val=_max-(_min-_val);
	        else if(_val >_max)
	            _val=_min+(_val-_max);
	        else
	            _val=_val;
	    }
	    return(_val)
	}


}


/// @description check_bitflag(flag,bits)
/// @param flag
/// param bits to check
function check_bitflag(_flag,_bits){

return (_flag & _bits);
}

function unlock_Forcefield(_FF_Num)
{
if(Player_keyCount)
	{
	var _posting = "Unlock FF " + string(_FF_Num);
	Player_keyCount--;
	pubsub_publish(_posting,true)
	}
}

///@param _varname
///@param _iniVal
function ini_var(_varname,_iniVal){
	
if(not variable_instance_exists(id,_varname)){variable_instance_set(id,_varname,_iniVal);}
}

function Set_cycle_palette(_Palette,_PalNum,_col1,_col2,_steps)
{

				//Create Surface pal
			//ini_var("pal_surface",noone);
			var _Surface = noone;
			if(!surface_exists(_Surface)){
				
			  var _height = pal_swap_get_color_count(_Palette); //enemy_palette
			  var _width = _steps + 2;
			  _Surface = surface_create(_width,_height);
			  surface_set_target(_Surface);
			  draw_clear_alpha(0,0);
			  pal_swap_draw_palette(_Palette,0,0,0);
			  pal_swap_draw_palette(_Palette,_PalNum,1,0);
			  var _half = _steps/2
			  //draw_rectangle_color(2,0,steps,_height-1,c_yellow,c_red,c_yellow,c_red,false)
			  draw_rectangle_color(2,0,_half,_height-1,_col1,_col2,_col1,_col2,false)
			  draw_rectangle_color(_half,0,_half*2,_height-1,_col2,_col1,_col2,_col1,false)
			  surface_reset_target();
			  /*
			  var _height = pal_swap_get_color_count(_Palette); //enemy_palette
			  _Surface = surface_create(_steps+2,_height);
			  surface_set_target(_Surface);
			  draw_clear_alpha(0,0);
			  pal_swap_draw_palette(_Palette,0,0,0);
			  pal_swap_draw_palette(_Palette,_PalNum,1,0);
			  draw_rectangle_color(2,0,_steps-2,_height-1,_col1,_col2,_col1,_col2,false)
			  surface_reset_target();
			  */
			  
			  return _Surface;
			}
}