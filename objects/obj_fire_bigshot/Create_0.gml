/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();
Can_Go_OutofBounds = true;

Pillar_Size = 3;
Pillar_Count = 0;


SpawnFirePillarSource = function(){
		var _Targ = obj_reticle;
		var _owner = Owner_ID
		var _ShotSpd = 0;
		var _ShotPow = 1;
		var _Scale = 1.0;
		//var _PCount = Pillar_Count;
		var _PSize = Pillar_Size;
		var _DamT = damageType;
		var _inst = instance_create_depth(x,y,Projectile_depth,obj_player_firePillarSpawner)


		
		with(_inst) {
		speed = _ShotSpd;
		image_xscale = _Scale;
		image_yscale = image_xscale;
		Owner_ID = _owner;
		Target_ID = _Targ;
		damage = _ShotPow;
		Can_MultiHit = true;
		damageType = _DamT;
		//Pillar_Count = _PCount;
		Pillar_Size = _PSize;
		}	
	
}