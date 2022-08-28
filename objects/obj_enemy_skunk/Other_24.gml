/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor


fsm = new SnowState(base_state);


fsm
	.event_set_default_function("draw", function() {
		// Draw this no matter what state we are in
		// (Unless it is overridden, ofcourse)
		SpriteSetter(EnemySize,imageframe);
		draw_sprite_ext(sprite_index, image_index, x+x_shake, y-z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	})
	
	.add("idle", {
    enter: function() {
	  next_state = "movement";
	  StateChange_Set_Time(0.5);
	  time_source_start(next_state_timer);
	  imageframe = skunk_SpriteList.Idle
    },
    step: function() {
		DeflationHandler();
		burstcheck();
    }
  })
  
  .add("movement", {
    enter: function() {
		if(skunk_step = 0){skunk_step = 1; imageframe = skunk_SpriteList.Walk2}
		else{skunk_step = 0; imageframe = skunk_SpriteList.Walk1}
    },
    step: function() {
		DeflationHandler();
		burstcheck();
		Step_Movement();
    }
  })
  
	.add("pause", {
    enter: function() {

	  if(Action_counter("Step") >= 2){ next_state = "attack";}
		else{next_state = "movement";}
	  StateChange_Set_Time(0.2);
	  time_source_start(next_state_timer);
	  imageframe = skunk_SpriteList.Idle
    },
    step: function() {
		DeflationHandler();
		burstcheck();
    }
  })
  
	.add("attack", {
    enter: function() {
		var _damcheck = enemyDamage - enemyMinDamage;
		if(_damcheck < 30){fsm.change("idle");}
	  imageframe = skunk_SpriteList.Idle
	  skunk_shake_count = 0;
    },
    step: function() {
		AttackAnim()
		burstcheck();
    }
  });