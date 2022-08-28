/// @description Methods
event_inherited()

Cue_Attack = function()
	{
		if(Boss_AtkCount >= 3)
			{
				switch(EnemySize)
				{
				default: fsm.change("Attack2"); Boss_AtkCount = 0; break;
				//case 4:
				//case 5: time_source_start(ant_FastAttackTimer); break;
				}
			}
		else{fsm.change("Attack"); Boss_AtkCount +=1}
		}
antKing_AttackTimer = function(){
		switch(EnemySize)
		{
		default: time_source_start(ant_NormAttackTimer); break;
		case 4:
		case 5: time_source_start(ant_FastAttackTimer); break;
		}
}
ant_NormAttackTimer = time_source_create(time_source_game,2.0,time_source_units_seconds,Cue_Attack);
ant_FastAttackTimer = time_source_create(time_source_game,1.5,time_source_units_seconds,Cue_Attack);

Walk_in_Circle = function(){
WalkAng += 0.8;
x = origin_x + lengthdir_x(15,WalkAng)
y = origin_y + lengthdir_y(15,WalkAng)
}

Fire_palette_cycle = function(){
	
if(fire_cycle)
	{
	fire_cycle_timer += 1
	if(fire_cycle_timer > 2)
		{fire_cycle_timer = 0
		enemy_palette_num += 1;
		if(enemy_palette_num > 2){enemy_palette_num = 0;}
		}
	}
else{enemy_palette_num = 0;}
}

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
		default: _Scale = 0.7; _ShotSpd = 1.0; _ShotPow = 1; _ShotHome = oneSec*2; break;
		case 3: _Scale = 0.9; _ShotSpd = 1.0; _ShotPow =1; _ShotHome = oneSec*3; break;
		case 4:
		case 5: _Scale = 1.1; _ShotSpd = 1.0; _ShotPow = 2; _ShotHome = oneSec*5; break;
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

Fire_MissileShot = function(){
		var _Targ = global.the_Player;
		var _dir = point_direction(x,y,_Targ.x, _Targ.y);
		var _inst = instance_create_depth(x,y,Projectile_depth,obj_antFireball)
		var _ShotSpd;
		var _ShotPow;
		var _ShotHome;
		var _Scale;
		
		switch(EnemySize)
		{
		default: _Scale = 0.7; _ShotSpd = 4.0; _ShotPow = 1; _ShotHome = halfSec; break;
		case 2:
		case 3: _Scale = 1.0; _ShotSpd = 4.0; _ShotPow =1; _ShotHome = halfSec; break;
		case 4:
		case 5: _Scale = 1.2; _ShotSpd = 4.0; _ShotPow = 2; _ShotHome = halfSec; break;
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
		HomeRate = 1;
		damage = _ShotPow;
		}	
	
}


Fire_LobShot = function(_x = 0, _y = 0, _size = 3){
		var _Targ = global.the_Player;
		var _dir = point_direction(x,y,_Targ.x+_x, _Targ.y+_y);
		var _inst = instance_create_depth(x,y,Projectile_depth,obj_AntKing_LobShot)
		var _ShotSpd = 0;
		var _ShotPow = 1;
		var _ShotTime = oneSec;
		var _Scale = 1.0;
		
		var _Gx = _Targ.x+_x;
		var _Gy = _Targ.y+_y;
		var _LobSPD = (point_distance(x,y,_Targ.x+_x,_Targ.y+_y)/_ShotTime);
		
		
		switch(EnemySize)
		{
		default: _Scale = 0.4; _size = _size; break;
		case 3: _Scale = 0.8; _size += 1; break;
		case 4:
		case 5: _Scale = 0.9; _size += 2; break;
		}
		
		
		with(_inst) {
		speed =_ShotSpd;
		direction = _dir;
		image_angle = _dir;
		image_xscale = _Scale;
		image_yscale = image_xscale;
		Owner_ID = other;
		Target_ID = _Targ;
		Shot_Lifetime = _ShotTime;
		Shot_MaxLifetime = _ShotTime;
		damage = _ShotPow;
		x_Goal = _Gx;
		y_Goal = _Gy;
		LobSPD = _LobSPD;
		Pillar_Size = _size
		}	
	
}


Fire_LobQuadShot = function(_range = 6, _range2 = 2, _size = 3){
	_range = _range*16;
	_range2 = _range2*16;
Fire_LobShot(random_range(_range,_range2),random_range(_range,_range2),_size);	
Fire_LobShot(-random_range(_range,_range2),random_range(_range,_range2),_size);	
Fire_LobShot(random_range(_range,_range2),-random_range(_range,_range2),_size);	
Fire_LobShot(-random_range(_range,_range2),-random_range(_range,_range2),_size);	
}

//[+]===|Animation Functions|===[+]
WalkAnim = function (){
var _frame1 = function(){act_Timer_Set(0,quarSec); imageframe = AntKing_SpriteList.Walk1;}
var _frame2 = function(){act_Timer_Set(0,quarSec); imageframe = AntKing_SpriteList.Walk2;}
if (act_Timer(0,1)) {
	switch(Action_counter("walk"))
		{
		case 0: _frame2(); break;
		case 1: _frame1(); break;
		case 2: _frame2(); break;
		case 3:  Action_counter("walk",true); break;
		default:  Action_counter("walk",true); break;
		} 
	}
	
}

AttackAnim = function (){
var _frame1 = function(){act_Timer_Set(0,quarSec); imageframe = AntKing_SpriteList.Windup1;}
var _frame2 = function(){act_Timer_Set(0,quarSec); imageframe = AntKing_SpriteList.Windup2;}
var _frame3 = function(){act_Timer_Set(0,quarSec); imageframe = AntKing_SpriteList.Cast1;}
var _frame4 = function(){act_Timer_Set(0,quarSec); imageframe = AntKing_SpriteList.Cast2;}
var _frameShoot = function(){FireShot(6,2,2); enemy_sfx(snd_antking_1);}
if (act_Timer(0,1)) {
	switch(Action_counter("Attack"))
		{
		case 0: _frame1(); fire_cycle = true; break;
		case 1: _frame1(); fire_cycle = true; break;
		case 2: _frame2(); fire_cycle = true; break;
		case 3: _frame3(); fire_cycle = false;  _frameShoot();break;
		case 4: _frame4(); break;
		case 5: Action_counter("Attack",true); fsm.change("idle"); break;
		default: Action_counter("Attack",true); fsm.change("idle"); break;
		}
	}
	
}

//Lob shot anim
AttackAnim2 = function (){
var _frame1 = function(){act_Timer_Set(0,halfSec); imageframe = AntKing_SpriteList.Lob1;}
var _frame2 = function(){act_Timer_Set(0,quarSec); imageframe = AntKing_SpriteList.Lob2;}
var _frameShoot = function(){Fire_LobQuadShot(); enemy_sfx(snd_enemyshot_3);}
if (act_Timer(0,1)) {
	switch(Action_counter("LobAttack"))
		{
		case 0: _frame1(); fire_cycle = true; break;
		case 1: _frame1(); fire_cycle = true; break;
		case 2: _frame2(); fire_cycle = false; _frameShoot(); break;
		case 3: fsm.change("pause"); break;
		default: fsm.change("pause"); break;
		}
	}
	
}

//Missile anim
AttackAnim3 = function (){
var _frame1 = function(){act_Timer_Set(0,quarSec); imageframe = AntKing_SpriteList.Missile1;}
var _frame2 = function(){act_Timer_Set(0,quarSec); imageframe = AntKing_SpriteList.Missile2;}
var _frameShoot = function(){Fire_MissileShot(); enemy_sfx(snd_antking_2);}
var _frameCount = function(){if (act_Timer(1,1)) {fsm.change("idle");} }
if (act_Timer(0,1)) {
	switch(Action_counter("MissileAttack"))
		{
		case 1: _frame1(); fire_cycle = true; break;
		case 2: _frame2(); fire_cycle = false; _frameShoot(); break;
		case 3:  _frameCount(); Action_counter("MissileAttack",true); break;
		default: Action_counter("MissileAttack",true); fsm.change("idle"); break;
		}
	}

	
}
