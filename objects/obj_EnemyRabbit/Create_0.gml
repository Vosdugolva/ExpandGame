/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
event_inherited()
EnemyMaxSize = 4;
EnemySizeThreshold = 5;
EnemySizeThreshholdPlus = 8;


enum Bunny_SpriteList
	{
	idle1,
	idle2,
	idle3,
	jump,
	}

ini_SpriteFrame(5,4);
event_user(15);

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
	  alarm[1] = oneSec*5;
	  imageframe = Bunny_SpriteList.idle1
    },
    step: function() {
		idleAnim();
		DeflationHandler();
		burstcheck();
    }
  })
  
	.add("Attack", {
    enter: function() {
      ActCount = 0;
	  ActLoopCount = 0;
	  ActTimer = 0;
	  imageframe = Bunny_SpriteList.jump
    },
    step: function() {
		AttackAnim()
		DeflationHandler();
		burstcheck();
    }
  });