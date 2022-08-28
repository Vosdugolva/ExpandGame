/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
event_inherited()

enum AntKing_SpriteList
	{
	Idle,
	Walk1,
	Walk2,
	Windup1,
	Windup2,
	Cast1,
	Cast2,
	Lob1,
	Lob2,
	Missile1,
	Missile2,
	}

ini_SpriteFrame(2,11);

event_user(15);
event_user(14);


EnemyMaxSize = 1;

GetEnemySize();
InstantInflateToScale();
act_Timer_Set(1,halfSec);

Enemy_DT = new AntKing_DT();

shotSpeed = 0.5;
enemyExpandScaleMult = 0.02;
EnemySizeScaleFactor[0] = 1;
EnemySizeScaleFactor[1] = 35;
Boss_AtkCount = 0;

sprite_step = true;
fire_cycle = false;
fire_cycle_timer = 0;
enemy_palette = pal_fireantking;

  

