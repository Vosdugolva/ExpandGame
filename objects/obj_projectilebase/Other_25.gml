/// @description Methods
// You can write your code in this editor

ShotDie = function (_noFX = shot_no_death_fx, _DieFX = shot_death_fx ) {
speed = 0;
if(!_noFX)
	{
		var _fxPal = shot_palette;
		var _fxPalnum = shot_palette_num;
		var _effect = instance_create_depth(x,y,Projectile_depth,_DieFX);
		with(_effect)
			{
				shot_palette = _fxPal;
				shot_palette_num = _fxPalnum;
			}
		}
instance_destroy()
}

Check_MultiHit = function(_id) {
	if(!Can_MultiHit){return false;}
	if(ds_list_find_index(HitMemory,_id) == -1)
		{
		show_debug_message(ds_list_find_index(HitMemory,_id));
		   ds_list_add(HitMemory,_id);
		   time_source_start(MultiHitClearTimer);
		   return true;
		}
	//else{show_debug_message("target" + string(_id) + " Blocked");}
	return false;
}

ClearMultiHit = function() {
	ds_list_clear(HitMemory)
}

MultiHitClearTimer = time_source_create(time_source_game,hitTimer,time_source_units_frames,ClearMultiHit);

set_multihit_rate = function(_hitrate) {
time_source_reconfigure(MultiHitClearTimer,_hitrate,time_source_units_frames,ClearMultiHit);
}


Proj_die_from_distance = function() {
var _dis = point_distance(xstart,ystart,x,y);
if (_dis > range) {ShotDie();}
}

Proj_die_from_lifetime = function() {
	Shot_Lifetime -= 1;
	if(!Shot_Lifetime) ShotDie();
}

Proj_check_lifetime = function() {
	Shot_Lifetime -= 1;
	if(!Shot_Lifetime) {return true;}
	else{return false;}
}

proj_die_when_out_bounds = function(){
	if(InBounds && !Can_Go_OutofBounds){	
		if(!CheckIfOnScreen(0)){ShotDie(true);}
		}	
}

Proj_die_when_owner_Dies = function() {
	if !instance_exists(Owner_ID)
	{
	    ShotDie();
	}
}

Proj_check_when_inbounds = function(){
	if(!InBounds){	
		if(CheckIfOnScreen(0)){InBounds = true;}
		}
	}

LobShotArc = function(){
x =  x + lengthdir_x(LobSPD,direction)
y = y + lengthdir_y(LobSPD,direction)
Percent += 1/Shot_MaxLifetime;
z = 90*animcurve_channel_evaluate(LobShot_Curve,Percent);
//show_debug_message(z);
}