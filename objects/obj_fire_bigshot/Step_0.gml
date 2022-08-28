/// @description Insert description here
// You can write your code in this editor

LobShotArc();

Proj_die_from_distance();
if(Proj_check_lifetime()){SpawnFirePillarSource(); ShotDie();}
Proj_die_when_owner_Dies();
Proj_check_when_inbounds();
