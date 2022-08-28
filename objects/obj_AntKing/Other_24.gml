
fsm = new SnowState("idle");

origin_x = x;
origin_y = y;
WalkAng = 0;



fsm
	.event_set_default_function("draw", function() {
		// Draw this no matter what state we are in
		// (Unless it is overridden, ofcourse)
		SpriteSetter(EnemySize,imageframe);
		Fire_palette_cycle();
		Draw_enemy_standard();
	})
	
	.add("idle", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  act_Timer_Set(0,quarSec);
	  //alarm[1] = oneSec*2.5;
	  antKing_AttackTimer();
	  imageframe = SpriteList.Walk1
    },
    step: function() {
		WalkAnim();
		Walk_in_Circle();
		
		burstcheck();
		if(act_Timer(0,1)){fsm.change("movement");}
    }
  })
  
  .add("movement", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  imageframe = SpriteList.Walk1
    },
    step: function() {
		WalkAnim();
		
		burstcheck();
		Walk_in_Circle();
    }
  })
  
	.add("pause", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  act_Timer_Set(2,oneSec);
	  imageframe = SpriteList.Walk1
    },
    step: function() {
		WalkAnim();
		burstcheck();
		if(act_Timer(2,1)){fsm.change("Attack3");}
    }
  })
  
	.add("Attack", {
    enter: function() {
      ActCount = 0;
	  ActLoopCount = 0;
	  ActTimer = 0;
	  imageframe = SpriteList.Walk1
    },
    step: function() {
		AttackAnim()
		Walk_in_Circle();
		burstcheck();
    }
  })
  
  
  	.add("Attack2", {
    enter: function() {
      ActCount = 0;
	  ActLoopCount = 0;
	  ActTimer = 0;
	  imageframe = SpriteList.Walk1
    },
    step: function() {
		AttackAnim2()
		//Walk_in_Circle();
		burstcheck();
    }
  })
  
    .add("Attack3", {
    enter: function() {
      ActCount = 0;
	  ActLoopCount = 0;
	  ActTimer = 0;
	  act_Timer_Set(1,3);
	  imageframe = SpriteList.Walk1
    },
    step: function() {
		AttackAnim3();
		burstcheck();
    }
  });