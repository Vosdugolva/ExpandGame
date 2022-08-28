/// @description Insert description here
// You can write your code in this editor

Owner_ID = noone;
Target_ID = noone;
range = 500;
Shot_Lifetime = oneSec*5;
Shot_MaxLifetime = oneSec*5;
InBounds = false;
Can_Go_OutofBounds = false;

//=|MultiHit Variables
Can_MultiHit = false;
HitCountCap = 1;
HitMemory = ds_list_create();
hitTimer = quarSec;

//=|Homing Variables
HomeRate = 3;
HomeTimer = oneSec;

//=|Lobbing Variables
DrawShadow = false;
ShadowSprite = spr_Shadow;
z = 0;
LobSPD = 0;
Percent = 0
LobShot_Curve = animcurve_get_channel(LobCurve,"LobCurve1");

//=| Shot death effects
shot_death_fx = FX_shot_impact;
shot_no_death_fx = false;

shot_palette = pal_base_shot_1
shot_palette_num = 0;

event_user(15);