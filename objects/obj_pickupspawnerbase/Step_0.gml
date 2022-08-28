/// @description Insert description here
// You can write your code in this editor

if(global.Allow_Spawns)
	{
	if(CheckIfInRoom() || CheckIfOnScreen(0))
		{
		if(Hidden)
			{
			if(CheckIfEnemiesInRoom()<=0){CanSpawn = true;}
			}
		else{CanSpawn = true;}
		
		}
		else{CanSpawn = false;}
	}
else{CanSpawn = false;}

if(CanSpawn){if(!instance_exists(spawnable)){Spawner_SpawnPickup();}}
else{Spawner_RemovePickup();}