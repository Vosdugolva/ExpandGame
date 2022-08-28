

spawner_Apply_Struct_Data = function(){
var _struct = SpawnStruct;
var _id = id;

if(is_undefined(_struct))exit;
if(is_undefined(_id))exit;
//show_debug_message(_struct.Dialogue_handler)
with(spawnable)
{
SpawnerID =_id;
deflatebaseTime = _struct.Deflate_Start*oneSec;
deflateRate = _struct.Deflate_Speed;
						
enemyDamage = _struct.enemyMemoryDamage;
enemyDamage2 = _struct.enemyMemoryDamage;
EnemyMaxDamage = _struct.EnemyBurstDamage;
enemyMinDamage = _struct.enemyStartDamage;
EnemyDefense = _struct.Defense;
enemyExpandRange = _struct.EnemyExpandCap;
enemy_attack_at_spawn = _struct.Attack_on_Spawn;
enemy_palette_num = _struct.Palette_index;
Dialogue_Tag = _struct.Dialogue_Tag;
Dialogue_handler = _struct[$ "Dialogue_handler"];
//if(!is_undefined(_struct[$ "Dialogue_handler"])){
//Dialogue_handler = method(id, _struct[$ "Dialogue_handler"]);}
InflateToScale();
}	
}

spawner_Update_Struct_Data = function(){
var _SpawnedActor = spawnable;
if(not instance_exists(spawnable))exit;
SpawnStruct.enemyMemoryDamage = _SpawnedActor.enemyDamage;
SpawnStruct.Dialogue_Tag = _SpawnedActor.Dialogue_Tag;

}

spawner_Refresh_Struct_Data = function(){
var _SpawnedActor = spawnable;
if(not instance_exists(spawnable))exit;
SpawnStruct.enemyMemoryDamage = SpawnStruct.enemyStartDamage;
}

/// @description First Spawn
Spawner_SpawnEnemy = function(){
	if(global.Allow_Spawns)
	{
				var _id = id;
				var _struct = SpawnStruct;
				//
				var _StartDam = enemyStartDamage;
				var _BurstDam = EnemyBurstDamage;
				var _Def = Defense;
				var _DefStart = Deflate_Start;
				var _DefSpeed = Deflate_Speed;
				var _Xpand = EnemyExpandCap;
				var _state = "idle"
				var _quickdraw = Attack_on_Spawn
				var _pal = Palette_index; 
				var _FX = instance_create_depth(x,y,Player_depth,FX_Poof);
				var _dialog = Dialogue_Tag;
				with(_FX)
					{
					var _scale = (1 + (_StartDam/(4))*0.1)
					image_xscale = _scale;
					image_yscale = image_xscale;
					} 
				spawnable = instance_create_depth(x,y,Enemy_depth,ToSpawn);
				spawner_Apply_Struct_Data();
				/*
				with(spawnable)
					{
						SpawnerID =_id;
						//enemyStartDamage = _StartDam;
						//EnemyBurstDamage = _BurstDam;
						deflatebaseTime = _DefStart*oneSec;
						deflateRate = _DefSpeed;
						
						enemyDamage = _StartDam;
						enemyDamage2 = _StartDam;
						EnemyMaxDamage = _BurstDam;
						enemyMinDamage = _StartDam;
						EnemyDefense = _Def;
						enemyExpandRange = _Xpand;
						enemy_attack_at_spawn = _quickdraw;
						enemy_palette_num = _pal;
						Dialogue_Tag = _dialog;
						InflateToScale();
						}
						*/
	}
}

Spawner_RemoveEnemy = function(){
	if(instance_exists(spawnable))
		{
			spawner_Update_Struct_Data();
			instance_destroy(spawnable);
			}
	}

			/*			
Spawner_CheckOnScreen = function(){
	
if(CheckIfOnScreen(0))
	{
		if(!instance_exists(spawnable))
			{
				Spawner_SpawnEnemy();
				}
		
	}
else
	{
		if(instance_exists(spawnable)){instance_destroy(spawnable);}
	}

	
	
}