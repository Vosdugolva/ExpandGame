/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
image_speed = 0;
event_inherited();
EnemyMaxSize = 3;
EnemySizeThreshold = 5;
EnemySizeThreshholdPlus = 4;
enemyExpandScaleMult = 0.03;

enemyMoveSpeed = 0.3

enemy_palette = pal_hedgehog;

enum HedgeHog_SpriteList
	{
	Idle,
	Walk1,
	Walk2,
	Attack1,
	Attack2,
	Defeat,
	Burst,
	}

ini_SpriteFrame(7,7);

event_user(15);


GetEnemySize();
InstantInflateToScale();
act_Timer_Set(1,halfSec);
shotSpeed = 1.5;
event_user(14);

x_shake = 0;
/*
fsm = new SnowState("idle");


fsm
	.event_set_default_function("draw", function() {
		// Draw this no matter what state we are in
		// (Unless it is overridden, ofcourse)
		SpriteSetter(EnemySize,imageframe);
		draw_self();
	})
	
	.add("idle", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  act_Timer_Set(0,quarSec);
	  //alarm[1] = oneSec*2.5;
	  time_source_start(Hedgehog_AttackTimer);
	  time_source_start(Hedgehog_MovementTimer);
	  imageframe = HedgeHog_SpriteList.Idle
    },
    step: function() {
		WalkAnim();
		DeflationHandler();
		burstcheck();
		if(act_Timer(0,1)){fsm.change("movement");}
    }
  })
  
  .add("movement", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  imageframe = HedgeHog_SpriteList.Idle
    },
    step: function() {
		WalkAnim();
		DeflationHandler();
		burstcheck();
		if place_meeting(x+(sign(moveDir)*4),y,par_collision){

			    moveDir = moveDir*-1;
			}
		else
			{
			    x += moveDir*enemyMoveSpeed;
			}
		if(act_Timer(1,1)){act_Timer_Set(1,oneSec); moveDir = moveDir*-1; fsm.change("pause");}
    }
  })
  
	.add("pause", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  act_Timer_Set(2,quarSec);
	  imageframe = HedgeHog_SpriteList.Idle
    },
    step: function() {
		WalkAnim();
		DeflationHandler();
		burstcheck();
		if(act_Timer(2,1)){fsm.change("movement");}
    }
  })
  
	.add("Attack", {
    enter: function() {
      ActCount = 0;
	  ActLoopCount = 0;
	  ActTimer = 0;
	  imageframe = HedgeHog_SpriteList.Idle
	  time_source_start(Deflation);
    },
    step: function() {
		AttackAnim()
		//DeflationHandler();
		burstcheck();
    }
  });
  