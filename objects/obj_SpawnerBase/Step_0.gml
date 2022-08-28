/// @description Insert description here


//show_debug_message(string(CheckIfOnScreen(0)));

if(global.Allow_Spawns )
	{
	if(CheckIfInRoom() || CheckIfOnScreen(0))
		{
			if(!instance_exists(spawnable) and !is_spawnable_dead)
				{
					Spawner_SpawnEnemy();
					}
		}		
		else{Spawner_RemoveEnemy(); is_spawnable_dead = false;}
		
	}
else{Spawner_RemoveEnemy();}
/*
if(!global.Allow_Spawns && CheckIfInRoom(0))
	{
		if(!instance_exists(spawnable))
			{
				//event_user(15);
				Spawner_SpawnEnemy();
				}
		
	}
else
	{
		if(instance_exists(spawnable)){instance_destroy(spawnable);}
	}

if(!global.Allow_Spawns && !CheckIfOnScreen(0))
	{
		if(instance_exists(spawnable)){instance_destroy(spawnable);}
	}