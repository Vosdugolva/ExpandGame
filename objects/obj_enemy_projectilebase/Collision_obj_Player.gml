/// @description Insert description here
if(alarm_get(0) <= 0)
	{
var _player_is_hittable = false;
with( other ) {
	_player_is_hittable = is_player_hittable();
if(_player_is_hittable){Damage_Player();}
}
if(_player_is_hittable)
	{alarm_set(0,1)	
	}

}