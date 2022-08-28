/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();
//fsm = new SnowState(base_state);

fsm

/*
	.event_set_default_function("draw", function() {
		// Draw this no matter what state we are in
		// (Unless it is overridden, ofcourse)
		SpriteSetter(EnemySize,imageframe);
		draw_sprite_ext(sprite_index, image_index, x+x_shake, y-z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	})
	*/
 //[+]============|idle|==============[+] 
	.add("idle", {
    enter: function() {
	  can_talk_to = true;
    },
    step: function() {
		//burstcheck();
			//enemy_palette = sin_oscillate(1,steps-2,2);
		if(point_in_circle(mouse_x,mouse_y,x,y,16) && player_talk_input() )
		{
			if(player_in_talk_range())
			{		
				
			if(enemyDamage = 0)
				{
					create_textbox("ex1_3rdHog_0");
				}
				
			else{
					var _myarrayslot = 0;
				
					for (var i = 0; i < instance_number(obj_3rdHog); ++i;)
					{
						_thisHog = instance_find(obj_3rdHog,i);
						if(_thisHog.id = self.id){_myarrayslot = i;}
					    thirdHog[i] = _thisHog.enemyDamage;
					}
					array_sort(thirdHog,true);
					for (var i = 0; i < array_length(thirdHog); ++i;)
					{
						if(enemyDamage = thirdHog[i]) _myarrayslot = i;
					}
				switch(_myarrayslot)
				{
				case 0: Dialogue_Tag = "ex1_3rdHog_1st" ; break;
				case 1: Dialogue_Tag = "ex1_3rdHog_2nd"; break;
				case 2: Dialogue_Tag = "ex1_3rdHog_3rd"; break;
				case 3: Dialogue_Tag = "ex1_3rdHog_4th"; break;
				case 4: Dialogue_Tag = "ex1_3rdHog_5th"; break;
				default: Dialogue_Tag = "ex1_3rdHog_0"; break;
				}
				create_textbox(Dialogue_Tag);
				}
			}
		}
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
 
 //[+]================================[+]  
  .add("movement", {
    enter: function() {
		fsm.change("idle")
	  //enemy_quickdraw("attack");
	  
	  //var _state = time_source_get_state(next_state_timer);
	  

	  //if(_state != time_source_state_active)
		//{
		//	next_state = "attack";
		//	StateChange_Set_Time(2.5);
		//	time_source_start(next_state_timer)
		//}
      ActCount = 0;
	  ActTimer = 0;
	  imageframe = HedgeHog_SpriteList.Idle
    },
    step: function() {
		if(global.antiMagicRoom){fsm.change("NPC")}
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
 //[+]============|pause|==============[+] 
 
 //[+]================================[+]  
	.add("pause", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  act_Timer_Set(2,quarSec);
	  imageframe = HedgeHog_SpriteList.Idle
    },
    step: function() {
		if(global.antiMagicRoom){fsm.change("NPC")}
		WalkAnim();
		DeflationHandler();
		burstcheck();
		if(act_Timer(2,1)){fsm.change("movement");}
    }
  })
 //[+]============|attack|==============[+] 
 
 //[+]================================[+]
	.add("attack", {
    enter: function() {
      ActCount = 0;
	  ActLoopCount = 0;
	  ActTimer = 0;
	  imageframe = HedgeHog_SpriteList.Idle
	  time_source_start(Deflation);
    },
    step: function() {
		attackAnim()
		//DeflationHandler();
		burstcheck();
    }
  })
  
  //[+]============|defeat|==============[+]  
 	.add("defeat", {
    enter: function() {
		time_source_stop(next_state_timer);
	  imageframe = HedgeHog_SpriteList.Defeat
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
	  imageframe = HedgeHog_SpriteList.Burst
    },
    step: function() {
		enemy_rupture_shake();
		enemy_flyoff();
    }
  });
//[+]================================[+]