/// @description give to player

if not instance_exists(obj_Player) exit;

if(not (check_bitflag(obj_Player.Player_ItemFlags,Item_TenseMint)))
	{
		obj_Player.Player_ItemFlags = obj_Player.Player_ItemFlags | Item_TenseMint;
		instance_destroy(SpawnerID);
		instance_destroy();
		}