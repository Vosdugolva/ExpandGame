/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();


Cue_attack = function(){fsm.change("attack");}
Hedgehog_attackTimer = time_source_create(time_source_game,2.5,time_source_units_seconds,Cue_attack);

Cue_Movement = function(){fsm.change("movement");}
Hedgehog_MovementTimer = time_source_create(time_source_game,0.5,time_source_units_seconds,Cue_Movement);

FireShot = function(_offset){
		var _Targ = global.the_Player;
		var _dir = 0;
		var _dis = 10+ enemyDamage*0.5;
		var _ShotSpd;
		var _ShotPow;
		var _ShotHome;
		var _Scale;
		var _pal;
		
		switch(EnemySize)
		{
		default: _Scale = 0.8; _ShotSpd = 2.1; _ShotPow = 1; _ShotHome = 0; break;
		case 3: _Scale = 0.8; _ShotSpd = 2.1; _ShotPow =1; _ShotHome = 0; break;
		case 4:
		case 5: _Scale = 1.0; _ShotSpd = 2.1; _ShotPow = 2; _ShotHome = 0; break;
		}
		
		//Shot Colorizer
		switch(enemy_palette_num)
			{
			default: _pal = 2; break;
			case 0: _pal = 2; break;
			case 1: _pal = 1; break;
			case 2: _pal = 3; break;
			}
		
		
		for(var i = 0; i<12;i += 1)
			{
			_dir = (360/12)*i + _offset;
			var _inst = instance_create_depth(x+lengthdir_x(_dis,_dir),(y-sprite_height/6)+lengthdir_y(_dis,_dir),Projectile_depth,obj_hedgehog_quill)
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
		

	
}
//[+]===|Animation Functions|===[+]
WalkAnim = function (){

//====|walk method
var _WalkFrames = function(){
		//Define frames of action
		var _frame1 = function(){act_Timer_Set(0,quarSec);  imageframe = HedgeHog_SpriteList.Walk1;}
		var _frame2 = function(){act_Timer_Set(0,quarSec);  imageframe = HedgeHog_SpriteList.Idle;}
		var _frame3 = function(){act_Timer_Set(0,quarSec);  imageframe = HedgeHog_SpriteList.Walk2;}
		var _frame4 = function(){Action_counter("walk",true);act_Timer_Set(0,quarSec);  imageframe = HedgeHog_SpriteList.Idle;}
		//Play frame by frame actions, Action_counter increments with each call
		switch(Action_counter("walk"))
		{
		case 1: _frame1(); break;
		case 2: _frame2(); break;
		case 3: _frame3(); break;
		case 4: _frame4(); break;
		default: Action_counter("walk",true); break;
		}
		}

//act_Timer decrements with each call and returns true when 0
if (act_Timer(0,1)) {_WalkFrames();}
	
}


attackAnim = function (){
ActTimer--;
var _SmallAtk = function(){
		//Define frames of action
		var _frame1 = function(){act_Timer_Set(0,quarSec/4);  imageframe = HedgeHog_SpriteList.Attack1; x_shake = 1;}
		var _frame2 = function(){act_Timer_Set(0,quarSec/4);  imageframe = HedgeHog_SpriteList.Attack1; x_shake = -1;}
		var _frame3 = function(){FireShot(0); enemy_sfx(snd_enemyshot_4); act_Timer_Set(0,halfSec);  imageframe = HedgeHog_SpriteList.Attack1; x_shake = 0;}
		var _frame4 = function(){act_Timer_Set(0,quarSec);  imageframe = HedgeHog_SpriteList.Idle;}
		//Play frame by frame actions, Action_counter increments with each call
		switch(Action_counter("attack"))
		{
		case 1: _frame1(); break;
		case 2: _frame2(); break;
		case 3: _frame1(); break;
		case 4: _frame2(); break;
		case 5: _frame3(); break;
		case 6: _frame4(); break;
		case 7: fsm.change("idle"); break;
		default: fsm.change("idle"); break;
		}
}

var _BigAtk = function(){
		//Define frames of action
		var _frame1 = function(){imageframe = HedgeHog_SpriteList.Attack1; }
		var _frame2 = function(){imageframe = HedgeHog_SpriteList.Attack2; }
		var _frameshake0 = function(){act_Timer_Set(0,quarSec); x_shake = 0;}
		var _frameshake1 = function(){act_Timer_Set(0,quarSec/4); x_shake = 1;}
		var _frameshake2 = function(){act_Timer_Set(0,quarSec/4); x_shake = -1;}
		var _frameShoot1 = function(){FireShot(0); enemy_sfx(snd_enemyshot_4); act_Timer_Set(0,quarSec/4);  imageframe = HedgeHog_SpriteList.Attack1;}
		var _frameShoot2 = function(){FireShot(45); enemy_sfx(snd_enemyshot_4); act_Timer_Set(0,quarSec/4);  imageframe = HedgeHog_SpriteList.Attack2;}
		var _frame7 = function(){FireShot(45); enemy_sfx(snd_enemyshot_4); act_Timer_Set(0,halfSec);  imageframe = HedgeHog_SpriteList.Attack2; x_shake = 0;}
		var _frame8 = function(){Action_counter("attack",true);act_Timer_Set(0,quarSec);  imageframe = HedgeHog_SpriteList.Idle;}
		//Play frame by frame actions, Action_counter increments with each call
		switch(Action_counter("attack"))
		{
		case 1: _frame2(); _frameshake1(); break;
		case 2: _frame2(); _frameshake2(); break;
		case 3: _frame2(); _frameshake1(); break;
		case 4: _frame2(); _frameshake2(); break;
		case 5: _frameShoot2(); _frameshake1(); break;
		case 6: _frame2(); _frameshake2(); break;
		case 7: _frame2(); _frameshake0(); break;
		case 8: _frameShoot1(); _frameshake1(); break;
		case 9: _frame1(); _frameshake2(); break;
		case 10: _frame1(); _frameshake0(); break;
		case 11: _frameShoot2(); _frameshake1(); break;
		case 12: _frame2(); _frameshake2(); break;
		case 13: _frame2(); _frameshake0(); break;
		case 14: _frameShoot1(); _frameshake1(); break;
		case 15: _frame1(); _frameshake2(); break;
		case 16: _frame1(); _frameshake0(); break;
		case 17: fsm.change("idle");
		default: fsm.change("idle"); break;
		}
}

if (act_Timer(0,1)) {
	
		switch(EnemySize)
		{
		case 3: _BigAtk(); break;
		default: _SmallAtk(); break;
		}
	}
	
}
