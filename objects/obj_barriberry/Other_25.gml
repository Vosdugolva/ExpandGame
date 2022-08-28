/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(not (check_bitflag(obj_Player.Player_ItemFlags,Item_BarriBerry)))
	{
		obj_Player.Player_ItemFlags = obj_Player.Player_ItemFlags | Item_BarriBerry;
		instance_destroy(SpawnerID);
		instance_destroy();
		}
