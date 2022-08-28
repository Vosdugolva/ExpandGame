/// @description Methods
event_inherited()

Cue_attack = function(){fsm.change("attack");}
ant_attackTimer = function(){
		switch(EnemySize)
		{
		default: time_source_start(ant_FastattackTimer); break;
		case 4:
		case 5: time_source_start(ant_NormattackTimer); break;
		}
}
ant_NormattackTimer = time_source_create(time_source_game,2.0,time_source_units_seconds,Cue_attack);
ant_FastattackTimer = time_source_create(time_source_game,1.5,time_source_units_seconds,Cue_attack);

FireShot = function(){
		var _Targ = global.the_Player;
		var _dir = point_direction(x,y,_Targ.x, _Targ.y);
		var _inst = instance_create_depth(x,y,Projectile_depth,obj_antFireball)
		var _ShotSpd;
		var _ShotPow;
		var _ShotHome;
		var _Scale;
		
		
		switch(EnemySize)
		{
		default: _Scale = 0.5; _ShotSpd = 1.0; _ShotPow = 1; _ShotHome = oneSec; break;
		case 3: _Scale = 0.75; _ShotSpd = 0.8; _ShotPow =1; _ShotHome = oneSec*2; break;
		case 4:
		case 5: _Scale = 0.9; _ShotSpd = 0.8; _ShotPow = 2; _ShotHome = oneSec*5; break;
		}
		
		
		with(_inst) {
		speed =_ShotSpd;
		direction = _dir;
		image_angle = _dir;
		image_xscale = _Scale;
		image_yscale = image_xscale;
		Owner_ID = other;
		Target_ID = _Targ;
		HomeTimer = _ShotHome;
		damage = _ShotPow;
		}	
	
}
//[+]===|Animation Functions|===[+]
WalkAnim = function (){
ActTimer--;
if (ActTimer <= 0) {
		switch(ActCount)
		{
		case 0: ActTimer = fifthSec; ActCount = 1; imageframe = SpriteList.Walk1; break;
		case 1: ActTimer = fifthSec; ActCount = 0; imageframe = SpriteList.Walk2; break;
		}
	}
	
}

attackAnim = function (){
ActTimer--;

if (ActTimer <= 0) {
	switch(ActCount)
		{
		case 0: ActCount = 1; ActTimer = quarSec;imageframe = SpriteList.Attack1; break;
		case 1: ActCount = 2; FireShot(); enemy_sfx(snd_enemyshot_2); ActTimer = quarSec;imageframe = SpriteList.Attack2; break;
		case 2: fsm.change("idle"); break;
		}
	if(ActLoopCount >= 2){FireShot(); enemy_sfx(snd_enemyshot_2); fsm.change("idle");}
	}
	
}
