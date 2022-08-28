/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
image_speed = 0;
event_inherited();
EnemyMaxSize = 3;
EnemySizeThreshold = 3;
EnemySizeThreshholdPlus = 2;
enemyExpandScaleMult = 0.03;

enemyMoveSpeed = 0.3
Enemy_XStep = 0;
Enemy_YStep = 0;
Enemy_StepCount = 0;
Enemy_StepDir = 0

enemy_palette = pal_lizard

enum Lizard_SpriteList
	{
    Idle,
	Walk1,
	Walk2,
	Attack,
	Defeat,
	}

ini_SpriteFrame(4,6);

event_user(15);
event_user(14);

GetEnemySize();
InstantInflateToScale();
act_Timer_Set(1,quarSec);
shotSpeed = 1.5;

lizard_step = 0;
  