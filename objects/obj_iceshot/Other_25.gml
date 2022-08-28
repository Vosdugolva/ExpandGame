/// @description Insert description here
// You can write your code in this editor
event_inherited()

Shot_Impact_Effect = function() {
shot_damage_enemy();
shot_MP_Gain();
if(is_BigShot){shot_ice_Poke();}
ShotDie();
}

shot_ice_Poke = function()
{
with(other)
	{
		
	if(EnemySize > 2)
		{
		instaBurst()	
		}
	else{enemyDamage2 -= 30;InflateToScale();}
	}
	
}