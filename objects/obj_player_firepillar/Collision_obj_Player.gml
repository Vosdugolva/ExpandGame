/// @description Insert description here
// You can write your code in this editor

if(Check_MultiHit(other))
	{
	with( other ) {
		Damage_Player();
	}
	show_debug_message("Hit!")
	//ShotDie();
	}