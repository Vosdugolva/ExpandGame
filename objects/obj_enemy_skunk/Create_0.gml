image_speed = 0;
event_inherited();
EnemyMaxSize = 3;
EnemySizeThreshold = 3;
EnemySizeThreshholdPlus = 2;
enemyExpandScaleMult = 0.02;

enemyMoveSpeed = 0.3
Enemy_XStep = 0;
Enemy_YStep = 0;
Enemy_StepCount = 0;
Enemy_StepDir = 0

enum skunk_SpriteList
	{
	Idle,
	Walk1,
	Walk2,
	Attack1,
	Attack2,
	Defeat,
	Burst,
	}

ini_SpriteFrame(7,7);

event_user(15);
event_user(14);

GetEnemySize();
InstantInflateToScale();
act_Timer_Set(1,quarSec);
shotSpeed = 1.5;

skunk_step = 0;
skunk_shake = 0;
skunk_shake_count = 0;
x_shake = 0;