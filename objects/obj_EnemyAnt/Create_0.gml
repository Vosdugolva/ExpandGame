/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
event_inherited()

enum SpriteList
	{
	Walk1,
	Walk2,
	Attack1,
	Attack2,
	Defeat,
	Rupture,
	Idle,
	}

ini_SpriteFrame(4,7);
EnemyMaxSize = 3;
enemyExpandScaleMult = 0.02;
event_user(15);
event_user(14);//Time Sources

GetEnemySize();
InstantInflateToScale();
act_Timer_Set(1,halfSec);

Enemy_DT = new Ant_DT();

shotSpeed = 0.5;

fsm = new SnowState("idle");


fsm
	.event_set_default_function("draw", function() {
		// Draw this no matter what state we are in
		// (Unless it is overridden, ofcourse)
		SpriteSetter(EnemySize,imageframe);
		draw_sprite_ext(sprite_index, image_index, x+x_shake, y-z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	})
	
	.add("idle", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  act_Timer_Set(0,quarSec);
	  //alarm[1] = oneSec*2.5;
	  ant_attackTimer();
	  imageframe = SpriteList.Walk1
    },
    step: function() {
		if(global.antiMagicRoom){fsm.change("NPC")}
		WalkAnim();
		DeflationHandler();
		burstcheck();
		if(act_Timer(0,1)){fsm.change("movement");}
    }
  })
//[+]============|NPC|==============[+]
	.add("NPC", {
    enter: function() {
	  //image_index = 0;
	  time_source_pause(next_state_timer);
	  time_source_pause(ant_FastattackTimer);
	  time_source_pause(ant_NormattackTimer);
	  imageframe = SpriteList.Idle
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
 
  .add("movement", {
    enter: function() {
	  enemy_quickdraw("attack")
      ActCount = 0;
	  ActTimer = 0;
	  imageframe = SpriteList.Walk1
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
			    x += moveDir*0.7;
			}
		if(act_Timer(1,1)){act_Timer_Set(1,oneSec); moveDir = moveDir*-1; fsm.change("pause");}
    }
  })
  
	.add("pause", {
    enter: function() {
      ActCount = 0;
	  ActTimer = 0;
	  act_Timer_Set(2,quarSec);
	  imageframe = SpriteList.Walk1
    },
    step: function() {
		if(global.antiMagicRoom){fsm.change("NPC")}
		WalkAnim();
		DeflationHandler();
		burstcheck();
		if(act_Timer(2,1)){fsm.change("movement");}
    }
  })
  
	.add("attack", {
    enter: function() {
      ActCount = 0;
	  ActLoopCount = 0;
	  ActTimer = 0;
	  imageframe = SpriteList.Walk1
    },
    step: function() {
		attackAnim()
		DeflationHandler();
		burstcheck();
    }
  })
  
  //[+]============|defeat|==============[+]  
 	.add("defeat", {
    enter: function() {
		time_source_stop(next_state_timer);
	  imageframe = SpriteList.Defeat
    },
    step: function() {
		enemy_burst_shake();
    }
  });
//[+]================================[+]

