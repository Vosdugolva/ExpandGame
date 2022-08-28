/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

shot_damage_enemy = function() {
	var _PBal = check_bitflag(Owner_ID.Player_ItemFlags,Item_PBalloon);
	
	var _damT = damageType;
	var _Bullet = self;
	
	with( other ) { 
		//get and process damage
		var _dam = variable_struct_get(Enemy_DT, _damT);
		if(_PBal) _dam *= 2;
		_dam = round(_dam * EnemyDefense);
		if(_dam < 0){_dam = 1;}
		//show_debug_message(_dam)
		
		//apply damage
        DamageSwell(_dam);
		
		//set MP gain for bullet
		_Bullet.MPGain = _dam;
		
	}
}


shot_MP_Gain = function() {
	if(!is_BigShot)
	{
	var _MPGain = MPGain;
		with( Owner_ID ) {
		GiveMP(_MPGain);
		}
	}
}

Shot_Impact_Effect = function() {
shot_damage_enemy();
shot_MP_Gain();
ShotDie();
}