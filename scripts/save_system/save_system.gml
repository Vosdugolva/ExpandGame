// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


//bitflag macros,
/*
I've been using bitflags back when I was doing zandronum modding, when you were limited to
only 3 arguments per script, these things were a godsend for performing fancier stuff with ACS.

I find myself wanting to use one with the save system to dictate what does and doesn't get saved.
*/

#macro save_all 0 //passing no argument just saves everything//
#macro save_player 1
#macro save_enemies 2
#macro save_items 4
#macro save_misc 8
#macro save_world 16





function Save_The_Game(_newSave = true,_bitflag = 0){

//if a save file already exists, load it up so we can update it

if(_newSave)
	{
		save_new(_bitflag);
	}
else{
	save_update()
	}



}

function save_update(_bitflag = 0){
if(!file_exists("Savegame.save")) exit;

var _buffer = buffer_load("Savegame.save");
var _string = buffer_read(_buffer,buffer_string);
buffer_delete(_buffer);
		
	//make a save array
	var _saveData = json_parse(_string);
	var _arraySize = array_length(_saveData);
	
	for(var i = 0; i < _arraySize; i++)
	{
		
		
	}
}




//for all the instances we want to save, create a struct and add it in the array
function save_new(_bitflag = 0){
if(global.is_Scrolling){show_debug_message("Cannot Save the game"); exit;}
if(_bitflag = save_all) _bitflag = save_player | save_items | save_enemies | save_misc | save_world;
//show_debug_message(save_misc);


	//make a save struct that carries individual arrays and structs for each group of content.
	var _enemyCount = instance_number(obj_SpawnerBase);
	var _itemCount = instance_number(obj_PickupSpawnerBase);
	var _miscCount = instance_number(obj_saveable);
	var _saveData = {
		World : {
			CamX : camera_get_view_x(view_camera[0]),
			CamY : camera_get_view_y(view_camera[0]),
			RoomID : global.activeRoom,
			},
		Player : {},
		EnemyCount : _enemyCount,
		Enemies : array_create(0),
		ItemCount : _itemCount,
		Items : array_create(0),
		MiscCount : _miscCount,
		Misc : array_create(0),
		
	 }
	 
	 //first, let's populate the player struct
		_saveData.Player = {
			obj : "obj_PlayerSpawner",
			y :  obj_Player.y,
			x :  obj_Player.x,
			//Player_HP :  obj_Player.Player_HP,
			//Player_MP :  obj_Player.Player_MP,
			Player_ItemFlags : obj_Player.Player_ItemFlags,
		};
	//next, let's populate the enemy array
	for(var i = 0; i < _enemyCount; i++)
	{
		var _saveEntity = instance_find(obj_SpawnerBase,i);
		//show_debug_message(object_get_name(_saveEntity.object_index));
		_saveData.Enemies[i] ={
				obj : object_get_name(_saveEntity.object_index),
				y: _saveEntity.y,
				x: _saveEntity.x,
				SpawnStruct: _saveEntity.SpawnStruct,
				//Dialogue_Tag : _saveEntity.Dialogue_Tag,
				Dialogue_handler :  _saveEntity[$ "Dialogue_handler"],
				//enemyStartDamage: _saveEntity.enemyStartDamage,
				//EnemyBurstDamage: _saveEntity.EnemyBurstDamage,
				//EnemyDefense : _saveEntity.Defense,
				//Attack_on_Spawn : _saveEntity.Attack_on_Spawn,
				//Palette_index: _saveEntity.Palette_index,	
				}
	}
	
		//next, let's populate the item array
	for(var i = 0; i < _itemCount; i++)
	{
		var _saveEntity = instance_find(obj_PickupSpawnerBase,i);
		_saveData.Items[i] ={
				obj : object_get_name(_saveEntity.object_index),
				y: _saveEntity.y,
				x: _saveEntity.x,
				is_Hidden: _saveEntity.is_Hidden,
				}
	}
	
	//Finally, load miscelaneous entities
	for(var i = 0; i < _miscCount; i++)
	{
		var _saveEntity = instance_find(obj_saveable,i);
		_saveData.Misc[i] ={
				obj : object_get_name(_saveEntity.object_index),
				y: _saveEntity.y,
				x: _saveEntity.x,
				image_xscale : _saveEntity.image_xscale,
				image_yscale: _saveEntity.image_yscale,
				}
		
	}
		

		/*
	//first the map itself
	if(_bitflag & save_world)
	{
		var _SaveEntity =
		{
		lable : "World",
		CamX : camera_get_view_x(view_camera[0]),
		CamY : camera_get_view_y(view_camera[0]),
		RoomID : global.activeRoom,
		}
		array_push(_saveData,_SaveEntity);
	}
	
//[+]===================================[+]
	//Save the enemy Spawners
	if(_bitflag & save_enemies)
	{
	with(obj_SpawnerBase)
	{
		var _SaveEntity =
		{
		lable : "Enemy",
		obj : object_get_name(object_index),
		y:y,
		x:x,
		enemyStartDamage:enemyStartDamage,
		EnemyBurstDamage:EnemyBurstDamage,
		EnemyDefense : Defense,
		Attack_on_Spawn : Attack_on_Spawn,
		Palette_index: Palette_index,
		}
	array_push(_saveData,_SaveEntity);	
	}
	}
//[+]===================================[+]
	if(_bitflag && save_items)
	{
	//Save the item Spawners
	with(obj_PickupSpawnerBase)
	{
		var _SaveEntity =
		{
		lable : "Item",
		obj : object_get_name(object_index),
		y:y,
		x:x,
		Hidden : Hidden
		}
	array_push(_saveData,_SaveEntity);	
	}
	}
//[+]===================================[+]	

	if(_bitflag & save_player)
	{
	//Save the Player
	with(obj_Player)
	{
		var _SaveEntity =
		{
		lable : "Player",
		obj : "obj_PlayerSpawner",
		y:y,
		x:x,
		Player_HP : Player_HP,
		Player_HeartFlower : Player_HeartFlower,
		Player_MP : Player_MP
		}
	array_push(_saveData,_SaveEntity);	
	}
	}
	
//[+]===================================[+]	
	//Save miscellaneous
	if(_bitflag & save_misc)
	{
	with(o_music_track_queuer)
	{
		var _SaveEntity =
		{
		lable : "Misc",
		obj : object_get_name(object_index),
		y:y,
		x:x,
		image_xscale:image_xscale,
		image_yscale:image_yscale,
		}
	array_push(_saveData,_SaveEntity);	
	}
	}
	*/
//[+]===================================[+]
//[+]===================================[+]
	//now to turn all this data into a JSON string and save it via a buffer
	var _string = json_stringify(_saveData);
	var _buffer = buffer_create(string_byte_length(_string) +1, buffer_fixed, 1);
	buffer_write(_buffer,buffer_string,_string);
	buffer_save(_buffer,"Savegame.save");
	buffer_delete(_buffer);
	show_debug_message("Game saved" + _string)
}

function Load_The_Game(){

if(global.is_Scrolling){show_debug_message("Cannot Load the game"); exit;}
//destroy all instances first
with(obj_SpawnerBase) instance_destroy();
with(obj_EnemyBase) instance_destroy();
with(obj_PickupSpawnerBase) instance_destroy();
with(obj_PickupBase) instance_destroy();
with(obj_PlayerBase) instance_destroy();
with(o_CameraHandler) instance_destroy();
with(FX_Poof) instance_destroy();
with(FX_shot_impact) instance_destroy();
with(obj_saveable) instance_destroy();
with(o_CameraScroller) instance_destroy();
global.Allow_Spawns = false;
global.is_Loading = true;
if(file_exists("Savegame.save"))
	{
		var _buffer = buffer_load("Savegame.save");
		var _string = buffer_read(_buffer,buffer_string);
		buffer_delete(_buffer);
		
		var _loadData = json_parse(_string);
		
		//load world data
	    camera_set_view_pos(view_camera[0],_loadData.World.CamX,_loadData.World.CamY);
		show_debug_message("world data Loaded")
		global.activeRoom = -1;//_loadData.World.RoomID
		
		//Load player
		with(instance_create_depth(_loadData.Player.x,_loadData.Player.y,Player_depth,asset_get_index(_loadData.Player.obj)))
		{
			//Player_HP = _loadData.Player.Player_HP;
			//Player_MP  = _loadData.Player.Player_MP;
			Player_ItemFlags = _loadData.Player.Player_ItemFlags;
			show_debug_message(Player_ItemFlags);
		}
		
		//load enemies
		var _enemyCount = _loadData.EnemyCount;
		var _enemyArray = _loadData.Enemies;
			for(var i = 0; i < _enemyCount; i++)
				{
		var _loadEntity = _enemyArray[i]
		//show_debug_message(_loadEntity.obj)
			with(instance_create_depth(_loadEntity.x,_loadEntity.y,Enemy_depth,asset_get_index(_loadEntity.obj)))
				{
				SpawnStruct = _loadEntity.SpawnStruct;
				//Dialogue_Tag = _loadEntity.Dialogue_Tag;
				Dialogue_handler = _loadEntity[$ "Dialogue_handler"];
				//enemyStartDamage = _loadEntity.enemyStartDamage;
				//EnemyBurstDamage = _loadEntity.EnemyBurstDamage;
				//EnemyDefense = _loadEntity.EnemyDefense;
				//Attack_on_Spawn = _loadEntity.Attack_on_Spawn;
				//Palette_index = _loadEntity.Palette_index;
				}
				}
	
		//load Items
		var _itemCount = _loadData.ItemCount;
		var _itemArray = _loadData.Items;
			for(var i = 0; i < _itemCount; i++)
				{
		var _loadEntity = _itemArray[i]
		//show_debug_message(_loadEntity.obj)
		var _pre_spawn = {is_Hidden : _loadEntity.is_Hidden};
			with(instance_create_depth(_loadEntity.x,_loadEntity.y,Enemy_depth,asset_get_index(_loadEntity.obj),_pre_spawn))
				{
				//is_Hidden = _loadEntity.is_Hidden;
				}
				}
				
		//load misc
		var _miscCount = _loadData.MiscCount;
		var _miscArray = _loadData.Misc;
			for(var i = 0; i < _miscCount; i++)
				{
		var _loadEntity = _miscArray[i]
		//show_debug_message(_loadEntity.obj)
			with(instance_create_depth(_loadEntity.x,_loadEntity.y,Player_depth,asset_get_index(_loadEntity.obj)))
				{
				image_xscale = _loadEntity.image_xscale;
				image_yscale = _loadEntity.image_yscale;
				}
				}
		
		
		#region Depreciated
		/*
		//now to put all the enemy spawners back
		while(array_length(_loadData) > 0)
			{
				var _loadEntity = array_pop(_loadData);
				
				if(_loadEntity.lable = "Enemy")
					{
						with(instance_create_layer(0,0,"Enemies",asset_get_index(_loadEntity.obj)))
						{
							x = _loadEntity.x;
							y = _loadEntity.y;
							enemyStartDamage = _loadEntity.enemyStartDamage;
							EnemyBurstDamage = _loadEntity.EnemyBurstDamage;
							EnemyDefense = _loadEntity.EnemyDefense;
							Attack_on_Spawn = _loadEntity.Attack_on_Spawn;
							Palette_index = _loadEntity.Palette_index;
						}
					
					}
				if(_loadEntity.lable = "Item")
					{
						with(instance_create_layer(0,0,"Enemies",asset_get_index(_loadEntity.obj)))
						{
							x = _loadEntity.x;
							y = _loadEntity.y;
							Hidden = _loadEntity.Hidden;
						}
					
					}
				if(_loadEntity.lable = "Player")
					{
						with(instance_create_layer(0,0,"Players",asset_get_index(_loadEntity.obj)))
						{
							x = _loadEntity.x;
							y = _loadEntity.y;
							Player_HP = _loadEntity.Player_HP
							Player_HeartFlower  = _loadEntity.Player_HeartFlower
							Player_MP  = _loadEntity.Player_MP
						}
					
					}
				if(_loadEntity.lable = "World")
					{
							camera_set_view_pos(view_camera[0],_loadEntity.CamX,_loadEntity.CamY);
							show_debug_message("world data Loaded")
							global.activeRoom = _loadEntity.RoomID
					}
				if(_loadEntity.lable = "Misc")
					{
						with(instance_create_layer(0,0,"misc",asset_get_index(_loadEntity.obj)))
						{
							x = _loadEntity.x;
							y = _loadEntity.y;
							image_xscale = _loadEntity.image_xscale;
							image_yscale = _loadEntity.image_yscale;
						}
					}
					/*
				with(instance_create_layer(0,0,"Enemies",asset_get_index(_loadEntity.obj)))
				{
					x = _loadEntity.x;
					y = _loadEntity.y;
					
					if object_is_ancestor(object_index, obj_PickupSpawnerBase)
					{
					    Hidden = _loadEntity.Hidden;
					}
					
					if (object_get_name(object_index) = obj_Player)
					{
						Player_HP = _loadEntity.Player_HP
						Player_HeartFlower  = _loadEntity.Player_HeartFlower
						Player_MP  = _loadEntity.Player_MP
					}
					
				}
				
			}*/
				
			#endregion
			
			show_debug_message("Game Loaded" + _string)
			//global.Allow_Spawns = true;
			o_jukebox.jukebox_play_track(0);
			global.is_Loading = false;
		
	}
}
