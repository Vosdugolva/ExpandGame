/// @description Insert description here
// You can write your code in this editor

Pillar_Size = 5;
Pillar_Count = 0;
Owner_ID = noone;
Target_ID = noone;
Can_MultiHit = false;
Once = false;

SpawnFirePillar = function(_x = 0, _y = 0){
	if(Owner_ID == noone)exit;
		var _Targ = Target_ID;
		var _owner = Owner_ID
		var _ShotSpd = 0;
		var _ShotPow = 1;
		var _Scale = 1.0;
		var _damT = damageType;
		var _inst = instance_create_layer(x+_x,y+_y,"Players",obj_player_firePillar)

		
		with(_inst) {
		speed = _ShotSpd;
		image_xscale = _Scale;
		image_yscale = image_xscale;
		Owner_ID = _owner;
		Target_ID = _Targ;
		damage = _ShotPow;
		damageType = _damT;
		Can_MultiHit = true;
		}	
	
}

FirePillar_Cross = function(_len = 3){
	var _block = 16;
	
	if(Pillar_Count = 0){SpawnFirePillar(0*_block,0*_block);}
	else
	{
	SpawnFirePillar(Pillar_Count*_block,0*_block);
	SpawnFirePillar(-Pillar_Count*_block,0*_block);
	SpawnFirePillar(0*_block,Pillar_Count*_block);
	SpawnFirePillar(0*_block,-Pillar_Count*_block);
	}
	Pillar_Count += 1;
	
	if(Pillar_Count >= Pillar_Size){ instance_destroy();}

}

/*
FirePillar_Cross = function(_len = 3){
	var _block = 16;
	
	SpawnFirePillar(0*_block,0*_block);
	for(var i = 1; i <_len;i += 1)
	{
	SpawnFirePillar(i*_block,0*_block);
	SpawnFirePillar(-i*_block,0*_block);
	SpawnFirePillar(0*_block,i*_block);
	SpawnFirePillar(0*_block,-i*_block);
	}
}
*/

FirePillar_Daimonji = function(_len = 3){
	var _block = 16;
	
	if(Pillar_Count = 0){SpawnFirePillar(0*_block,0*_block);}
	else
	{
	SpawnFirePillar(0*_block,-Pillar_Count*_block);
	SpawnFirePillar(Pillar_Count*_block,0*_block);
	SpawnFirePillar(-Pillar_Count*_block,0*_block);
	
	SpawnFirePillar(Pillar_Count*_block,Pillar_Count*_block);
	SpawnFirePillar(-Pillar_Count*_block,Pillar_Count*_block);
	}
	Pillar_Count += 1;
	
	if(Pillar_Count >= Pillar_Size){ instance_destroy();}
	
}





