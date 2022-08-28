/// @description states


fsm = new SnowState(base_state);


fsm
	.event_set_default_function("draw", function() {
		// Draw this no matter what state we are in
		// (Unless it is overridden, ofcourse)
		SpriteSetter(EnemySize,imageframe);
		if(flash_timer)Draw_enemy_hitflash();
		else Draw_enemy_standard();
	})
/*
//[+]============|idle|==============[+]
	.add("idle", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  act_Timer_Set(0,quarSec);
	  //alarm[1] = oneSec*2.5;
	  //time_source_start(Lizard_MovementTimer);
	  imageframe = SpriteList.Walk1
    },
    step: function() {
		//WalkAnim();
		DeflationHandler();
		burstcheck();
		//if(act_Timer(0,1)){fsm.change("movement");}
    }
  })
 //[+]================================[+]
 
 //[+]============|movement|==============[+]
  .add("movement", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  imageframe = SpriteList.Walk2
    },
    step: function() {
		//WalkAnim();
		DeflationHandler();
		burstcheck();
		Step_Movement();
	///
    }
  })
 //[+]================================[+]
 
 //[+]============|pause|==============[+]
	.add("pause", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  //if(Enemy_StepCount >= 4){time_source_start(Lizard_AttackTimer);}
		//else{time_source_start(Lizard_MovementTimer);}
	  imageframe = SpriteList.Walk1
    },
    step: function() {
		//WalkAnim();
		DeflationHandler();
		burstcheck();
		//if(act_Timer(2,1)){fsm.change("movement");}
    }
  })
 //[+]================================[+]
 
 //[+]============|attack|==============[+]
	.add("attack", {
    enter: function() {
      ActCount = 0;
	  ActLoopCount = 0;
	  ActTimer = 0;
	  imageframe = SpriteList.Walk1
	  time_source_start(Deflation);
    },
    step: function() {
		AttackAnim()
		//DeflationHandler();
		burstcheck();
    }
  })
 //[+]================================[+]
 */
  ;

