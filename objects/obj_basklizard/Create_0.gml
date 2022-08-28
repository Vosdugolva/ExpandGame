/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

image_speed = 0;
EnemyMaxSize = 5;
EnemySizeThreshold = 3;
EnemySizeThreshholdPlus = 2;
enemyExpandScaleMult = 0.03;

enemyMoveSpeed = 0.3
Enemy_XStep = 0;
Enemy_YStep = 0;
Enemy_StepCount = 0;
Enemy_StepDir = 0

base_state = "idle";

enemy_palette = pal_lizard
enemy_palette_num = 0;


//dialogue
Dialogue_Tag = "ex1_basklizard_1"

ini_SpriteFrame(6,1);

event_user(15);
event_user(14);

GetEnemySize();
InstantInflateToScale();
act_Timer_Set(1,quarSec);
shotSpeed = 1.5;





