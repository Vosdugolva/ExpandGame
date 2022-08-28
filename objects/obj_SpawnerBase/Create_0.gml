/// @description Insert Initialize
ToSpawn = monster_Name;
is_spawnable_dead = false;
Dialogue_Tag = "";
Dialogue_handler = function(){};
spawnable = noone;
//EnemySize = 0;

SpawnStruct = {
	enemyStartDamage: enemyStartDamage,
	enemyMemoryDamage: enemyStartDamage,
	EnemyBurstDamage: EnemyBurstDamage,
	Defense: Defense,
	Deflate_Start: Deflate_Start,
	Deflate_Speed: Deflate_Speed,
	EnemyExpandCap: EnemyExpandCap,
	//base_state: base_state,
	Attack_on_Spawn: Attack_on_Spawn,
	Palette_index: Palette_index,
	Dialogue_Tag: Dialogue_Tag,
	Dialogue_handler: Dialogue_handler,
};

event_user(15);
//Spawner_SpawnEnemy();