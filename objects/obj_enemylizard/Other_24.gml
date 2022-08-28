/// @description Insert description here
// You can write your code in this editor


fsm = new SnowState(base_state);


fsm
	.event_set_default_function("draw", function() {
		// Draw this no matter what state we are in
		// (Unless it is overridden, ofcourse)
		SpriteSetter(EnemySize,imageframe);
		if(flash_timer)Draw_enemy_hitflash();
		else Draw_enemy_standard();
		
	})
//[+]================================[+]
 
//[+]============|idle|==============[+] 	
	.add("idle", {
    enter: function() {
	  next_state = "movement";
	  StateChange_Set_Time(0.5);
	  time_source_start(next_state_timer);
	  imageframe = Lizard_SpriteList.Idle
    },
    step: function() {
		if(global.antiMagicRoom){fsm.change("NPC")}
		DeflationHandler();
		burstcheck();
    }
  })
//[+]================================[+]
 
//[+]============|NPC|==============[+]
	.add("NPC", {
    enter: function() {
	  //image_index = 0;
	  time_source_pause(next_state_timer);
	  can_talk_to = true;
    },
    step: function() {
		burstcheck();
		if(not global.antiMagicRoom){fsm.change("idle")}
			//enemy_palette = sin_oscillate(1,steps-2,2);
		if(mouse_over_entity() && player_talk_input())
		{
			if(player_in_talk_range())
			{		
			get_dialogue_function(Dialogue_handler);
			create_textbox(Dialogue_Tag);
			}
		}
    }
  })
//[+]================================[+]
 
//[+]============|movement|==============[+]  
  .add("movement", {
    enter: function() {
		enemy_quickdraw("attack");
		if(lizard_step = 0){lizard_step = 1; imageframe = Lizard_SpriteList.Walk2}
		else{lizard_step = 0; imageframe = Lizard_SpriteList.Walk1}
    },
    step: function() {
		DeflationHandler();
		burstcheck();
		Step_Movement();
    }
  })
//[+]================================[+]
 
//[+]============|pause|==============[+]   
	.add("pause", {
    enter: function() {

	  if(Action_counter("Step") >= 4){ next_state = "attack";}
		else{next_state = "movement";}
	  StateChange_Set_Time(0.2);
	  time_source_start(next_state_timer);
	  imageframe = Lizard_SpriteList.Idle
    },
    step: function() {
		DeflationHandler();
		burstcheck();
    }
  })
//[+]================================[+]
 
//[+]============|attack|==============[+]
	.add("attack", {
    enter: function() {
	  imageframe = Lizard_SpriteList.Idle
	  time_source_start(Deflation);
    },
    step: function() {
		AttackAnim()
		burstcheck();
    }
  })
//[+]================================[+]
 
//[+]============|defeat|==============[+]  
 	.add("defeat", {
    enter: function() {
		time_source_stop(next_state_timer);
	  imageframe = Lizard_SpriteList.Defeat
    },
    step: function() {
		enemy_burst_shake();
    }
  })
//[+]================================[+]

//[+]============|rupture|==============[+]  
 	.add("rupture", {
    enter: function() {
		time_source_stop(next_state_timer);
	  imageframe = Lizard_SpriteList.Defeat
    },
    step: function() {
		enemy_rupture_shake();
		enemy_flyoff();
    }
  });
//[+]================================[+]