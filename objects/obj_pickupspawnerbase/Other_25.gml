/// @description First Spawn
Hidden = is_Hidden;
spawnable = noone;
CanSpawn = false;

Spawner_SpawnPickup = function(){
				var _id = id;
				var _hidden = is_Hidden;
				instance_create_depth(x,y,Player_depth,FX_Poof);
				spawnable = instance_create_depth(x,y,Player_depth,ToSpawn);
				with(spawnable)
					{
						SpawnerID =_id;
					}	
				
}

Spawner_RemovePickup = function(){if(instance_exists(spawnable)){instance_destroy(spawnable);}}
