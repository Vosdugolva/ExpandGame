/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();
Can_Go_OutofBounds = true;

Pillar_Size = 3;
Pillar_Count = 0;

//=| Shot death effects
shot_death_fx = FX_shot_impact;
shot_no_death_fx = true;

SpawnFirePillarSource = function(){
		var _Targ = global.the_Player;
		var _owner = Owner_ID
		var _ShotSpd = 0;
		var _ShotPow = 1;
		var _Scale = 1.0;
		//var _PCount = Pillar_Count;
		var _PSize = Pillar_Size;
		var _inst = instance_create_depth(x,y,Projectile_depth,obj_FirePillarSpawner)


		
		with(_inst) {
		speed = _ShotSpd;
		image_xscale = _Scale;
		image_yscale = image_xscale;
		Owner_ID = _owner;
		Target_ID = _Targ;
		damage = _ShotPow;
		Can_MultiHit = true;
		//Pillar_Count = _PCount;
		Pillar_Size = _PSize;
		}	
	
}