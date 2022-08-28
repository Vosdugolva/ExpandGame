/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
image_speed = 0;
event_inherited();
EnemyMaxSize = 4;
EnemySizeThreshold = 3;
EnemySizeThreshholdPlus = 10;

enemyMoveSpeed = 0.3
Inhaled = false;
inhale_offset = 5;
BlowDir = 0;

enum Werewolf_SpriteList
	{
	Walk1,
	Walk2,
	Walk3,
	Attack1,
	}

ini_SpriteFrame(5,4);

event_user(15);

GetEnemySize();
InstantInflateToScale();
act_Timer_Set(1,halfSec);
shotSpeed = 1.5;

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
	  ActLoopCount = 0;
	  act_Timer_Set(0,quarSec);
	  //alarm[1] = oneSec*2.5;
	  if(Inhaled){time_source_start(Werewolf_AttackTimer); Inhaled = false}
	  else{time_source_start(Werewolf_InhaleTimer); Inhaled = true}
	  
	  imageframe = Werewolf_SpriteList.Walk1;
    },
    step: function() {
		WalkAnim();
		//DeflationHandler();
		burstcheck();
    }
  })
  
  .add("Inhale", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  ActLoopCount = 0;
	  imageframe = Werewolf_SpriteList.Attack1;
    },
    step: function() {
		InhaleAnim();
		//DeflationHandler();
		burstcheck();
    }
  })
  
	.add("pause", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  time_source_start(Werewolf_AttackTimer);
	  imageframe = Werewolf_SpriteList.Walk1;
    },
    step: function() {
		//WalkAnim();
		DeflationHandler();
		burstcheck();
    }
  })
  
	.add("Attack", {
    enter: function() {
      ActCount = 0;
	  ActLoopCount = 0;
	  ActTimer = 0;
	  imageframe = Werewolf_SpriteList.Walk1;
	  if(instance_exists(obj_Player))
	  {BlowDir = point_direction(x,y,obj_Player.x, obj_Player.y);}
	  time_source_start(Deflation);
    },
    step: function() {
		AttackAnim();
		//DeflationHandler();
		burstcheck();
    }
  });
  