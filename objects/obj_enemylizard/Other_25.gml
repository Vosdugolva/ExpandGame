/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

Step_Movement = function(){
	
	var _XStep = function(){
				if place_meeting(x+(sign(moveDir)*4),y,par_collision){

			    moveDir = moveDir*-1;
			}
		else
			{
			    x += moveDir*enemyMoveSpeed;
				
			}
	}
	
	var _AddXStep = function()
		{
		Enemy_XStep += 1*sign(moveDir)
		if(abs(Enemy_XStep) >= 3)
			{
				Enemy_StepDir = 1
				moveDir *= sign(Enemy_XStep);
				}
		}

	var _YStep = function(){
				if place_meeting(x,y+(sign(moveDir)*4),par_collision){

			    moveDir = moveDir*-1;
			}
		else
			{
			    y += moveDir*enemyMoveSpeed;
			}
	}
	
	
	var _AddYStep = function()
		{
		Enemy_YStep += 1*sign(moveDir)
		if(abs(Enemy_YStep) >= 3)
			{
				Enemy_StepDir = 0
				moveDir *= sign(Enemy_YStep);
				}
		}
		
	switch(Enemy_StepDir)
		{
			case 0: _XStep(); break;
			case 1: _YStep(); break;	
		}

		if(act_Timer(1,1))
			{
			act_Timer_Set(1,quarSec); 
			if(Enemy_StepDir = 1){Enemy_StepDir = 0;}else{Enemy_StepDir = 1;}
			moveDir = choose(1,-1); 
			Enemy_StepDir = choose(0,1); 
			
			switch(Enemy_StepDir)
				{
					case 0: _AddXStep(); break;
					case 1: _AddYStep(); break;	
				}
			fsm.change("pause");
			}	
}

//Cue_Attack = function(){fsm.change("attack");}
//Lizard_AttackTimer = time_source_create(time_source_game,0.5,time_source_units_seconds,Cue_Attack);

//Cue_Movement = function(){fsm.change("movement");}
//Lizard_MovementTimer = time_source_create(time_source_game,0.5,time_source_units_seconds,Cue_Movement);

FireShot = function(_offset){
		var _Targ = global.the_Player;
		var _dir = point_direction(x,y,_Targ.x, _Targ.y) + _offset;
		var _inst = instance_create_depth(x,y-sprite_height/6,Projectile_depth,obj_enemyShot)
		var _ShotSpd;
		var _ShotPow;
		var _ShotHome;
		var _Scale;
		var _pal;
		
		
		switch(EnemySize)
		{
		default: _Scale = 0.5; _ShotSpd = 1.0; _ShotPow = 1; _ShotHome = 0; break;
		case 2: _Scale = 0.75; _ShotSpd = 0.8; _ShotPow =1; _ShotHome = 0; break;
		case 3: _Scale = 0.9; _ShotSpd = 0.8; _ShotPow = 2; _ShotHome = 0; break;
		}
		
		switch(enemy_palette_num)
			{
			default: _pal = 1; break;
			case 0: _pal = 3; break;
			case 1: _pal = 1; break;
			case 2: _pal = 2; break;
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
		shot_palette_num = _pal;
		}	
	
}
//[+]===|Animation Functions|===[+]
WalkAnim = function (){

//====|Small walk method
var _SmallWalk = function(){
		//Define frames of action
		var _frame1 = function(){act_Timer_Set(0,quarSec);  imageframe = Lizard_SpriteList.Walk1;}
		var _frame2 = function(){act_Timer_Set(0,quarSec);  imageframe = Lizard_SpriteList.Walk2;}
		//Play frame by frame actions, Action_counter increments with each call
		switch(Action_counter("attack"))
		{
		case 0: _frame1(); break;
		case 1: _frame2(); break;
		}
		}
//====|Mid walk method	
var _MidWalk = function(){
		//Define frames of action
		var _frame1 = function(){act_Timer_Set(0,quarSec); imageframe = Lizard_SpriteList.Walk1;}
		var _frame2 = function(){act_Timer_Set(0,quarSec); imageframe = Lizard_SpriteList.Walk2;}
		//Play frame by frame actions, Action_counter increments with each call
		switch(Action_counter("attack"))
		{
		case 0: _frame1(); break;
		case 1: _frame2(); break;
		}
		}
//====|Big walk method		
var _BigWalk = function(){
		//Define frames of action
		var _frame1 = function(){act_Timer_Set(0,quarSec); imageframe = Lizard_SpriteList.Walk1;}
		var _frame2 = function(){act_Timer_Set(0,quarSec); imageframe = Lizard_SpriteList.Walk2;}
		//Play frame by frame actions, Action_counter increments with each call
		switch(Action_counter("attack"))
		{
		case 0: _frame1(); break;
		case 1: _frame2(); break;
		}
		}
//act_Timer decrements with each call and returns true when 0
if (act_Timer(0,1)) {
	switch(EnemySize)
		{
		case 0: _SmallWalk(); break;
		case 1: _MidWalk(); break;
		default: _BigWalk(); break;
		}

	}
	
}

AttackAnim = function (){

//====|Small attack method
var _SmallAtk = function(){
	//Define frames of action
	var _frame1 = function(){act_Timer_Set(0,fifthSec/2); imageframe = Lizard_SpriteList.Idle;}
	var _frame2 = function(){act_Timer_Set(0,quarSec); imageframe = Lizard_SpriteList.Attack;}
	var _frame3 =  function(){FireShot(0); fsm.change("idle");}
	
	//Play frame by frame actions, Action_counter increments with each call
	switch(Action_counter("attack"))
		{
		case 0:  break;
		case 1: _frame1(); break;
		case 2: FireShot(0); enemy_sfx(snd_enemyshot_1); _frame2(); break;
		case 3: fsm.change("idle"); break;
		default: fsm.change("idle");
		}	
}
//====|mid attack method
var _MidAtk = function(){
	//Define frames of action
	var _frame1 = function(){act_Timer_Set(0,fifthSec/2); imageframe = Lizard_SpriteList.Idle;}
	var _frame2 = function(){act_Timer_Set(0,quarSec); imageframe = Lizard_SpriteList.Attack;}
	var _frame3 =  function(){FireShot(0); enemy_sfx(snd_enemyshot_1); fsm.change("idle");}
	//Play frame by frame actions, Action_counter increments with each call
	switch(Action_counter("attack"))
		{
		case 0:  break;
		case 1: _frame1(); break;
		case 2: FireShot(0); FireShot(15); FireShot(-15); enemy_sfx(snd_enemyshot_1); _frame2(); break;
		case 3: fsm.change("idle"); break;
		default: fsm.change("idle");
		}	
}

//====|Big attack method
var _BigAtk = function(){
	//Define frames of action
	var _frame1 = function(){act_Timer_Set(0,fifthSec/2); imageframe = Lizard_SpriteList.Idle;}
	var _frame2 = function(){act_Timer_Set(0,quarSec); imageframe = Lizard_SpriteList.Attack;}
	var _frame3 =  function(){FireShot(0); fsm.change("idle");}
	//Play frame by frame actions, Action_counter increments with each call
	switch(Action_counter("attack"))
		{
		case 0:  break;
		case 1: _frame1(); break;
		case 2: FireShot(0); FireShot(15); FireShot(-15); FireShot(30); FireShot(-30); enemy_sfx(snd_enemyshot_1); _frame2(); break;
		case 3: fsm.change("idle"); break;
		default: fsm.change("idle");
		}	
}
//====|Function behavior
//act_Timer decrements with each call and returns true when 0
if (act_Timer(0,1)) 
	{
		switch(EnemySize)
		{ 
		case 1: _MidAtk(); break;
		case 2:
		case 3: _BigAtk(); break;
		default: _SmallAtk(); break;
		}
		
	}
	
}
