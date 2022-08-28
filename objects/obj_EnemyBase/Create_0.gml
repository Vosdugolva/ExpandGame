/// @description Variables and stuff

//enemyStartDamage = 0;
//EnemyBurstDamage = 100;
//Deflate_Start = 1;

EnemySize = 0; //Dictates sprite changes and AI behavior
EnemyMaxSize = 5; //How big the actor can get before bursting
EnemySizeThreshold = 3; //Effects the formula that dictates the damage needed to change size
EnemySizeThreshholdPlus = 6;
EnemyDefense = 1.0; //multiplier to reduces shot damage
enemyDamage = 0;
enemyDamage2 = 0;
EnemyMaxDamage = 100;
enemyMinDamage = 0;
enemyExpandRange = 80;
enemyExpandScaleMult = 0.1;
EnemySizeScaleFactor[0] = 0;
EnemySizeScaleFactor[1] = 1;
EnemySizeScaleFactor[2] = 1;
EnemySizeScaleFactor[3] = 1;
EnemySizeScaleFactor[4] = 1;
EnemySizeScaleFactor[5] = 1;

//Palette related variables
pal_surface = noone; //for stuff like flash effects
enemy_palette = noone;
flash_timer = 0;
flash_color = c_white;

enemy_attack_at_spawn = false;

enemyMoveSpeed = 0.5

deflatebaseTime = 1*oneSec;
deflateTime = 2.5;
deflateRate = 5;
Deflating = false;
Timer = [0,oneSec,0];
imageframe = 0;
SpawnerID = noone;


SpriteFrame[0][0] = 0;

ActTimer = 0;
ActCount = 0;
ActLoopCount = 0;

action_count = 0;
current_action = "default";

moveDir = 1;
z = 0;
x_shake = 0;

base_state = "idle";
next_state = "idle";
next_state_time = 1.0;

Enemy_DT = new Damage_Table();

//Dialogue
can_talk_to = false;
//Dialogue_Tag = "";