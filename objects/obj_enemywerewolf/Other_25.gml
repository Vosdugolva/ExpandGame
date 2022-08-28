/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();


Cue_Attack = function(){fsm.change("Attack");}
Werewolf_AttackTimer = time_source_create(time_source_game,2.5,time_source_units_seconds,Cue_Attack);

Cue_Inhale = function(){fsm.change("Inhale");}
Werewolf_InhaleTimer = time_source_create(time_source_game,2.5,time_source_units_seconds,Cue_Inhale);

WolfInhale = function(_offset){
		var _Targ = obj_Player;
		var _dir = 0;
		var _dis = 270;
		var _ShotSpd;
		var _ShotPow;
		var _ShotHome;
		var _Scale;
		
		switch(EnemySize)
		{
		default: _Scale = 0.5; _ShotSpd = 1.8; _ShotPow = 1; _ShotHome = 0; break;
		case 3: _Scale = 0.6; _ShotSpd = 1.8; _ShotPow =1; _ShotHome = 0; break;
		case 4:
		case 5: _Scale = 0.75; _ShotSpd = 1.8; _ShotPow = 2; _ShotHome = 0; break;
		}
		for(var i = 0; i<3;i += 1)
			{
			_dir = (360/3)*i + _offset+random(15);
			
			var _inst = instance_create_layer(x+lengthdir_x(_dis,_dir),(y-(sprite_height/EnemyMaxDamage)*enemyDamage)+lengthdir_y(_dis,_dir),"Projectiles",obj_enemyShot)
				with(_inst) {
				speed =-_ShotSpd;
				direction = _dir;
				image_angle = _dir;
				image_xscale = _Scale;
				image_yscale = image_xscale;
				Owner_ID = other;
				Target_ID = _Targ;
				HomeTimer = _ShotHome;
				damage = _ShotPow;
				range = _dis - 20;
				}	
			}
		

	
}

FireShot = function(_offset, _dir){
		var _Targ = obj_Player;
		var _inst = instance_create_layer(x,(y-((sprite_height/2)/EnemyMaxSize)*EnemySize),"Projectiles",obj_enemyShot)
		var _ShotSpd;
		var _ShotPow;
		var _ShotHome;
		var _Scale;
		
		switch(EnemySize)
		{
		default: _Scale = 0.5; _ShotSpd = 3.0; _ShotPow = 1; _ShotHome = 0; break;
		case 3: _Scale = 0.75; _ShotSpd = 3.8; _ShotPow =1; _ShotHome = 0; break;
		case 4:
		case 5: _Scale = 0.9; _ShotSpd = 3.8; _ShotPow = 2; _ShotHome = 0; break;
		}
		
		with(_inst) {
		speed =_ShotSpd;
		direction = _dir+(random_range(-_offset, _offset));
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

_SmallWalk = function(){
			switch(ActCount)
		{
		case 0: ActTimer = quarSec; ActCount = 1; imageframe = Werewolf_SpriteList.Walk1; break;
		case 1: ActTimer = quarSec; ActCount = 0; imageframe = Werewolf_SpriteList.Walk1; break;
		}
		}
		
_MidWalk = function(){
			switch(ActCount)
		{
		case 0: ActTimer = quarSec; ActCount = 1; imageframe = Werewolf_SpriteList.Walk2; break;
		case 1: ActTimer = quarSec; ActCount = 0; imageframe = Werewolf_SpriteList.Walk3; break;
		}
		}
		
_BigWalk = function(){
			switch(ActCount)
		{
		case 0: ActTimer = quarSec; ActCount = 1; imageframe = Werewolf_SpriteList.Walk1; break;
		case 1: ActTimer = quarSec; ActCount = 0; imageframe = Werewolf_SpriteList.Walk3; break;
		}
		}
		
if (ActTimer <= 0) {
	switch(EnemySize)
		{
		case 0: _SmallWalk(); break;
		case 1: _MidWalk(); break;
		default: _BigWalk(); break;
		}

	}
	
}

InhaleAnim = function (){
ActTimer--;

var _SmallAtk = function(){
	switch(ActCount)
		{
		case 0: ActCount = 0; ActLoopCount++; ActTimer = 3;imageframe = Werewolf_SpriteList.Walk1; WolfInhale(ActLoopCount*inhale_offset) break;
		//case 1: ActCount = 0; ActLoopCount++; ActTimer = eigthSec;imageframe = Werewolf_SpriteList.Walk1; break;
		}	
	if(ActLoopCount >= 50){fsm.change("idle");}
}

var _BigAtk = function(){
	switch(ActCount)
		{
		case 0: ActCount = 0; ActLoopCount++; ActTimer = 3;imageframe = Werewolf_SpriteList.Walk3; WolfInhale(ActLoopCount*inhale_offset); break;
		//case 1: ActCount = 0; ActLoopCount++; ActTimer = halfSec;imageframe = Werewolf_SpriteList.Walk2; FireShot(45); break;
		}	
	if(ActLoopCount >= 50){ fsm.change("idle");}
}

if (ActTimer <= 0) {
	
		switch(EnemySize)
		{
		case 3:
		case 4: _BigAtk(); break;
		default: _SmallAtk(); break;
		}
	if(enemyDamage < EnemyMaxDamage-20){enemyDamage2 += 1;InflateToScale();}
	else{ActLoopCount = 50;}
	
	//if(ActLoopCount >= 2){FireShot(); fsm.change("idle");}
	}
	
}

AttackAnim = function (){
ActTimer--;

var _SmallAtk = function(){
	switch(ActCount)
		{
		case 0: ActCount = 0; ActLoopCount++; FireShot(random_range(-25,25),BlowDir); ActTimer = 3;imageframe = Werewolf_SpriteList.Walk1; break;
		//case 1: ActCount = 0; ActLoopCount++; ActTimer = eigthSec;imageframe = Werewolf_SpriteList.Walk1; break;
		}	
	if(ActLoopCount >= 30){ fsm.change("idle");}
}

var _BigAtk = function(){
	switch(ActCount)
		{
		case 0: ActCount = 0; ActLoopCount++; FireShot(random_range(-25,25),BlowDir); ActTimer = 3;imageframe = Werewolf_SpriteList.Walk3; break;
		//case 1: ActCount = 0; ActLoopCount++; ActTimer = halfSec;imageframe = Werewolf_SpriteList.Walk2; FireShot(45); break;
		}	
	if(ActLoopCount >= 50){ fsm.change("idle");}
}

if (ActTimer <= 0) {
	
		switch(EnemySize)
		{
		case 3:
		case 4: _BigAtk(); break;
		default: _SmallAtk(); break;
		}
	if(enemyDamage > 0){enemyDamage2 -= 3;InflateToScale();}
		
	//if(ActLoopCount >= 2){FireShot(); fsm.change("idle");}
	}
	
}
