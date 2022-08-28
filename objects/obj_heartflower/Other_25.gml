/// @description give to player

if not instance_exists(obj_Player) exit;

if(obj_Player.Player_HeartFlower < 3)
	{
	obj_Player.Player_HeartFlower += 1;
	instance_destroy(SpawnerID);
	instance_destroy();
	}