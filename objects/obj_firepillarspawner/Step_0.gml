/// @description Insert description here
// You can write your code in this editor
if(!Once)
{
FirePillar_Daimonji(Pillar_Size);
PillarSpawnTimer = time_source_create(time_source_game,quarSec,time_source_units_frames,
					FirePillar_Daimonji,[],Pillar_Size-1);
time_source_start(PillarSpawnTimer);
Once = true;
}