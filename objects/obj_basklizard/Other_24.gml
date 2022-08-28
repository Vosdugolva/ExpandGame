/// @description Insert description here
// You can write your code in this editor

/// @description states

event_inherited()
//fsm = new SnowState(base_state);


fsm
	.event_set_default_function("draw", function() {
		// Draw this no matter what state we are in
		// (Unless it is overridden, ofcourse)
		SpriteSetter(EnemySize,imageframe);
		draw_sprite_ext(sprite_index, image_index, x, y-z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		Draw_enemy_hitflash();
		//draw_self();
		

		
		
	})
//[+]============|idle|==============[+]
	.add("idle", {
    enter: function() {
	  //image_index = 0;
	  can_talk_to = true;
    },
    step: function() {
		burstcheck();
			//enemy_palette = sin_oscillate(1,steps-2,2);
		if(mouse_over_entity() && player_talk_input())
		{
			if(player_in_talk_range())
			{		
			switch(EnemySize)
			{
			case 1: Dialogue_Tag = "ex1_basklizard_2"; break;
			case 2: Dialogue_Tag = "ex1_basklizard_3"; break;
			case 3: Dialogue_Tag = "ex1_basklizard_4"; break;
			case 4: Dialogue_Tag = "ex1_basklizard_5"; break;
			case 5: Dialogue_Tag = "ex1_basklizard_6"; break;
			default: if(billboard_read("Popped_BaskLizard") = true){
					Dialogue_Tag = "ex1_basklizard_7";
					}
					else{Dialogue_Tag = "ex1_basklizard_1";}
					break;
			}
			create_textbox(Dialogue_Tag);
			}
		}
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
 
//[+]============|defeat|==============[+]  
 	.add("defeat", {
    enter: function() {
		time_source_stop(next_state_timer);
		billboard_post("Popped_BaskLizard",true);
	  //imageframe = Lizard_SpriteList.Defeat
    },
    step: function() {
		enemy_burst_shake();
    }
  })
//[+]================================[+]
  ;

