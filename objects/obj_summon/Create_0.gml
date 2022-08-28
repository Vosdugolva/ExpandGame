
// Declare methods
event_user(0);
image_speed = 0;
// Input
input = {};
check_input();

SpriteFrame[0][0] = 0;
ini_SpriteFrame(8,2);
rod_sprite = spr_rod;
no_rod = false;

Timer = [0,oneSec,0];
action_count = 0;
current_action = "default";

// Declare variables
focusing = false;
playerSpeed = 2;
Player_WalkSpeed = 1.75;
Player_SaltSpeed = 2.25
Player_FocusSpeed = 1;

Player_HP = 3;
Player_MaxHP = 3;
Player_MP = 3;
Player_MaxMP = 3;
Player_MPBuild = 0;
Player_MPBuildCap = 150;
Player_Invulnerable = false;

aimDir = 0;
fireRate = 10;
canFire = true;
hold_your_fire = false;
shotSpeed = 4;


bumpDir = 0;
bumpDist = 0;
bump_Timer = 0;
z = 0;

hsp = 0;
vsp = 0;

ActTimer = 0;
ActCount = 0;
ActLoopCount = 0;

Player_is_Dead = false;

Mounted = false;
Rider = noone;

WeaponSet = ds_list_create();
WeaponSet_Backup = ds_list_create();
Weapon_Active = 0;
ds_list_add(WeaponSet,new BaseWep());
ds_list_add(WeaponSet,new Magic_Pump());
ds_list_add(WeaponSet,new IceWep());
ds_list_add(WeaponSet,new FireWep());
Weapon_Name = WeaponSet[| Weapon_Active][$ "Name"];
ds_list_copy(WeaponSet_Backup,WeaponSet)

enum Summon_SpriteList{
	idle,
	walk1,
}


Create_As_Inflatable()
EnemyMaxSize = 1;
EnemyMaxDamage = 150;
enemyExpandScaleMult = 0.02;
//[+]==========|Player States|==========[+]
fsm = new SnowState("idle");

//[+]==========|Default Draw state|==========[+]
fsm
	.event_set_default_function("draw", function() {
		// Draw this no matter what state we are in
		// (Unless it is overridden, ofcourse)
		SpriteSetter(aimDir,imageframe);
		draw_sprite_ext(sprite_index, image_index, x, y-z, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		Draw_Mounted_Player(Mounted);
		
		if(Mounted){
		
		
		}
	})
//[+]==========|Idle|==========[+]	
	.add("idle", {
    enter: function() {
	  imageframe = Summon_SpriteList.idle
	  no_rod = false;
    },
    step: function() {
			MovementHandler();
			if(input.key_hor != 0 || input.key_vert != 0){fsm.change("walk");}

    }
  })
//[+]===================================[+]

//[+]==========|Walk|==========[+]
	.add("walk", {
    enter: function() {

	  imageframe = Summon_SpriteList.idle
	  no_rod = false;
    },
    step: function() {
		MovementHandler();
		WalkAnim();
		if(input.key_hor == 0 && input.key_vert == 0){fsm.change("idle");}

    }
  })
//[+]===================================[+]

//[+]==========|Walk|==========[+]
	.add("pump", {
    enter: function() {

	  imageframe = Summon_SpriteList.idle
	  sprite_index = sp_Player_Pump;
	  PumpTime = 5
	  PumpFrame = 0
	  no_rod = true;
    },
    step: function() {
		PumpTime--;
		if(!PumpTime)
			{
				switch(PumpFrame)
					{
					case 0:
					imageframe = Summon_SpriteList.walk1;
					PumpTime = quarSec
					PumpFrame = 1;
					audio_play_sound(snd_magicPump,0,false);
					break;
					
					
					case 1:
					sprite_index = sp_Player;
					fsm.change("idle");
					break;
						
					}
				
			}
		//if(input.key_hor == 0 && input.key_vert == 0){fsm.change("idle");}

    }
  })
//[+]===================================[+]


//[+]==========|Death|==========[+] 
  	.add("Death", {
    enter: function() {

	  imageframe = 0
	  Death_Anim = false;
	  Player_is_Dead = true;
	  sprite_index = sp_player_hurt;
	  rod_sprite = sp_rod_hurt;
	  act_Timer_Set(0,halfSec);
	  o_jukebox.jukebox_stop_music();
	  //Save_The_Game(save_enemies|save_misc);
	  freeze_entity();
	 
    },
    step: function() {
	
		if(act_Timer(0,1) and !Death_Anim)
			{
			image_alpha = 0;
		   Player_Death_Effect();
		   audio_play_sound(snd_player_die,6,false);
		   time_source_start(Death_Reload);	
		   unfreeze_entity();
		  Death_Anim = true;
			}
    }
  })
  //[+]===================================[+]
  //[+]==========|Puppet|==========[+]
  	.add("puppet", {
    enter: function() {
	  imageframe = Summon_SpriteList.idle
    },
    step: function() {
			MovementHandler();
			if(input.key_hor != 0 || input.key_vert != 0){fsm.change("walk");}

    }
  })
 //[+]===================================[+]
  ;