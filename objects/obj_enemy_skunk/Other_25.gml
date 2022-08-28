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

FireShot = function(_offset){
		var _Targ = global.the_Player;
		var _dir = 0;
		var _dis = 4+ enemyDamage*0.5;
		var _ShotSpd;
		var _ShotPow;
		var _ShotHome;
		var _Scale;
		
		switch(EnemySize)
		{
		default: _Scale = 0.8; _ShotSpd = 1.3; _ShotPow = 1; _ShotHome = 0; break;
		case 3: _Scale = 0.8; _ShotSpd = 1.3; _ShotPow =1; _ShotHome = 0; break;
		case 4:
		case 5: _Scale = 1.0; _ShotSpd = 1.3; _ShotPow = 2; _ShotHome = 0; break;
		}
		for(var i = 0; i<2;i += 1)
			{
			_dir = (360/2)*i + _offset;
			
			var _inst = instance_create_depth(x+lengthdir_x(_dis,_dir),(y-sprite_height/6)+lengthdir_y(_dis,_dir),Projectile_depth,obj_enemyShot)
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
}

AttackAnim = function (){

var _PreAttack = function(){
		//Define frames of action
		var _frame1 = function(){imageframe = HedgeHog_SpriteList.Attack2; }
		var _frameshake0 = function(){act_Timer_Set(0,quarSec); x_shake = 0;}
		var _frameshake1 = function(){act_Timer_Set(0,quarSec/4); x_shake = 1;}
		var _frameshake2 = function(){act_Timer_Set(0,quarSec/4); x_shake = -1;}
		//Play frame by frame actions, Action_counter increments with each call
		switch(skunk_shake)
		{
		case 0: skunk_shake_count++; skunk_shake = 1; _frame1(); _frameshake1(); break;
		case 1: skunk_shake_count++; skunk_shake = 0; _frame1(); _frameshake2(); break;
		}
}


if (act_Timer(0,1)) {
	
	if(skunk_shake_count >= halfSec)
	{
		var _addoffset = (skunk_shake_count - halfSec)*13
		x_shake = 0;
		act_Timer_Set(0,quarSec/4);
		FireShot(0 + _addoffset );
		FireShot(180 + _addoffset);
		enemyDamage2 -= 5;
		skunk_shake_count++;
		if(enemyDamage - enemyMinDamage <= 10){fsm.change("idle")}
	}
	else
	{
		_PreAttack();

	}

	}
	
}
