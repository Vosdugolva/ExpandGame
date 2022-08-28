function player_talk_input(){

return keyboard_check_pressed(vk_space);
}


function Damage_Player ()
{
	var _hurt = false;
	var _hurtsnd1 = function(){audio_play_sound(snd_player_hurt_1,6,false);}
	var _hurtsnd2 = function(){audio_play_sound(snd_player_hurt_2,6,false);}
	var _canhurt = false;
	
		if(fsm.get_current_state() != "Death" 
			and !Player_Invulnerable
			and !Barri_Timer){
				_canhurt = true;
			}
	
	if(_canhurt)
	{
		if(Player_HP > 0){Player_HP -= 1; _hurt = true; }
		else if(Player_HeartFlower > 0){Player_HeartFlower -= 1;  _hurt = true;}
		
		if(Player_HP <= 0 && Player_HeartFlower <= 0 ){ _hurtsnd2(); fsm.change("Death");}
		else if(_hurt)
			{
			_hurtsnd1();
			Player_Invulnerable = true;
			time_source_start(Player_Invuln_Timer);
			Flicker_effect(1);	
			}
	}
}

function is_player_hittable()
{
	if(fsm.get_current_state() != "Death" 
	and !Player_Invulnerable
	and !Barri_Timer)
	{return true}
	
	return false
}

function checkFire(_ActiveWep = 0) {
if(not hold_your_fire ) //and not global.antiMagicRoom
	{
	if(mouse_check_button(mb_left)){
		if(is_undefined(WeaponSet[| _ActiveWep])) exit;
		var _wep = WeaponSet[| _ActiveWep];
		_wep.CastShot(id);
		}
	
	if(mouse_check_button(mb_right)){
		if(is_undefined(WeaponSet[| _ActiveWep])) exit;
		var _wep = WeaponSet[| _ActiveWep];
		_wep.CastBigShot(id);
		}
	
	}
}

function ini_SpriteFrame(framex,framey){
var _h = 0;
for (var i = 0; i < framex; i += 1)
{
	 
	for (var j = 0; j < framey; j += 1)
{
	SpriteFrame[i][j] = _h;
	_h+= 1;
}
}	
	
}

function SpriteSetter(_SpriteY,_SpriteX){image_index = SpriteFrame[_SpriteY][_SpriteX];}

///@param timer_slot
///@param Time_countdown
function act_Timer(_timerSlot,_TimeDown){
	var _timeEnd = false;
	
	Timer[_timerSlot] -= _TimeDown;	
	if(Timer[_timerSlot] <= 0){ _timeEnd = true;}
	
	return _timeEnd;
}

///@param timer_slot
///@param Time__to_set
function act_Timer_Set(_timerSlot,_timeSet){Timer[_timerSlot] = _timeSet;}

function sprite_depth_handler()
{
	if y != yprevious
	{
	    depth = -y;
	}	
}

function Action_counter(_action_name,_reset = false)
	{
	/*
	This incriments a value every time this function is called, and will return it's
	current increment. if the "_action_name" given is different from the last call
	of this function or _reset is true, then we start the count back to 0 again.
	*/
	var _current_action = current_action;

	if(_reset)
	{
		current_action = _action_name;
		action_count = 0;
		return action_count;
	}
	else if(_action_name == _current_action)
		{
		action_count += 1;	
		//show_debug_message(_action_name + string(action_count))
		return action_count;
		}
	else if(_current_action = "default")
	{
		action_count = 1;
		current_action = _action_name;
		//show_debug_message(_action_name + string(action_count))
		return action_count;		
	}
	else
		{
		current_action = _action_name;
		action_count = 1;
		return action_count;
		}
	}

function player_Bump(_bumpDir,_BumbDist)
{
		bumpDir = _bumpDir;
		bumpDist = _BumbDist;
		bump_Timer += 4;
		if(bump_Timer > bump_Cap){bump_Timer = bump_Cap;}
}

function player_Bump_Movement()
{
		if(bump_Timer){
		var _bumpX = lengthdir_x(bumpDist,bumpDir);
		var _bumpY = lengthdir_y(bumpDist,bumpDir);
		if place_meeting(x+(sign(_bumpX)*8),y,par_collision){

			    while !place_meeting(x+(sign(_bumpX)*4),y,par_collision){
			        x +=  1*sign(_bumpX);
			    }
    
			   // if place_meeting(x+(sign(_bumpX)*8),y+16,par_collision){
			   //     y = y - 4;
			   // }
    
			   // if place_meeting(x+(sign(_bumpX)*8),y-16,par_collision){
			   //     y = y + 4;
			   //}
      
			}
			else{x += _bumpX;}
			
		//Vertical (Y)
			if place_meeting(x,y+(sign(_bumpY)*8),par_collision){

			    while !place_meeting(x,y+(sign(_bumpY)*4),par_collision){
			        y += 1*sign(_bumpY);
			    }
    
			   // if place_meeting(x+16,y+(sign(_bumpY)*8),par_collision){
			   //     x = x - 4;
			   // }
    
			   // if place_meeting(x-16,y+(sign(_bumpY)*8),par_collision){
			   //     x = x + 4;
			   // }
    
			}
			else{y += _bumpY;}
			//show_debug_message("Bump X =" + string(_bumpX));
			//show_debug_message("Bump Y =" + string(_bumpY));
		//bump_Timer -= 1;
		bumpDist = lerp(0,bumpDist,0.8);
		if(bumpDist <= 0.5)bump_Timer = 0;
		}
}

function ClampToViewport(_View)
{
	if(global.is_Scrolling)
	{
		var _CamLeftBound = camera_get_view_x(view_camera[_View]);
		var _CamRightBound = camera_get_view_x(view_camera[_View])+camera_get_view_width(view_camera[0]);
		var _CamTopBound = camera_get_view_y(view_camera[_View]);
		var _CamBottomBound = camera_get_view_y(view_camera[_View])+camera_get_view_height(view_camera[0]);

		if x <  _CamLeftBound
		{
		    x = _CamLeftBound;
		}
		if x > _CamRightBound
		{
		    x = _CamRightBound;
		}

		if y<_CamTopBound
		{
		    y = _CamTopBound;
		}
		else if y > _CamBottomBound
		{
		    y = _CamBottomBound
		}	
	}
}

function ScrollFromEdge(_View)
{
if(!global.is_Loading)
{
	var _CamLeftBound = camera_get_view_x(view_camera[_View])-1;
	var _CamRightBound = camera_get_view_x(view_camera[_View])+camera_get_view_width(view_camera[0])+1;
	var _CamTopBound = camera_get_view_y(view_camera[_View])-1;
	var _CamBottomBound = camera_get_view_y(view_camera[_View])+camera_get_view_height(view_camera[0])+1;
	var _CamDir;
	var _StartScroll = false;

	if x <  _CamLeftBound
	{
	    _CamDir = Dir.Left;
		_StartScroll = true;
	}
	if x > _CamRightBound
	{
	    _CamDir = Dir.Right;
		_StartScroll = true;
	}

	if y<_CamTopBound
	{
	    _CamDir = Dir.Up;
		_StartScroll = true;
	}
	else if y > _CamBottomBound
	{
	     _CamDir = Dir.Down;
		 _StartScroll = true;
	}	
	
	if(_StartScroll == true && !global.is_Scrolling)
	{
		instance_destroy(o_CameraHandler);
		global.is_Scrolling = true;
		global.Allow_Spawns = false;
		global.activeRoom = -1;
		var _CamScroller = instance_create_depth(x,y,Player_depth,o_CameraScroller);
		with (_CamScroller)
		{
		    camScrollDir = _CamDir;
		}
	}

}
}

function RoomZoneHandler()
{
if (place_meeting(x,y,obj_RoomZone) && !global.is_Scrolling)
	{
		var _inst = instance_place(x, y, obj_RoomZone);
	if(global.activeRoom != _inst.roomZone_ID)
		{
			global.activeRoom = _inst.roomZone_ID;
			global.antiMagicRoom = _inst.Room_Anti_Magic;
			global.RoomOffset_x = _inst.Room_CamOffset_x;
			global.RoomOffset_y = _inst.Room_CamOffset_y;
			//show_debug_message("active room is " + string(global.activeRoom));
			var _CamHandler = instance_create_depth(x,y,Player_depth,o_CameraHandler);
			with (_CamHandler)
			{
			    RoomID = _inst.roomZone_ID;
				RoomX = _inst.RoomZone_X;
				RoomY = _inst.RoomZone_Y;
				RoomWidth = _inst.roomZone_Width;
				RoomHeight = _inst.roomZone_Height;
				
				if(RoomWidth > camera_get_view_width(view_camera[0])
					|| RoomHeight > camera_get_view_height(view_camera[0])){Room_Small = false;}
			}
			
		}
	}

}

function GiveMP(_ammount)
{
	Player_MPBuild += _ammount;
	if(Player_MPBuild >= Player_MPBuildCap)
		{
			if(Player_MP < Player_MaxMP)
				{
				Player_MPBuild = 0;
				Player_MP += 1;
				}
			else{Player_MPBuild = Player_MPBuildCap;}	
		}
}

function Player_FireCheck(_MPCost = 0)
{
		if(global.antiMagicRoom){return false;}
		if (canFire)
		{
			if(not _MPCost){return true;}
			else if (Player_MP >= _MPCost and Player_MP > 0)
			{
				Player_MP -= _MPCost;
				return true;
			}
			else if(Player_PowerBeat >= _MPCost and Player_PowerBeat > 0)
				{
				Player_PowerBeat -= _MPCost;
				return true;
				}		
		}
return false;
}

function Set_Camera_on_Player(){
	var _player = global.the_Player;
	var _CamX = camera_get_view_x(view_camera[0]);
	var _CamY = camera_get_view_y(view_camera[0]);
	
	var _CamW = camera_get_view_width(view_camera[0]);
	var _CamH = camera_get_view_height(view_camera[0]);
	
	var _NewCamX = (((_player.x) div _CamW)*_CamW)+1;
	var _NewCamY = (((_player.y) div _CamH)*_CamH)+1;

			camera_set_view_pos(view_camera[0],_NewCamX,_NewCamY);
	
}

function Get_Player_Wep(){
	var _player = global.the_Player;
	var _wep = _player.WeaponSet[| _player.Weapon_Active];
	return _wep;
	
}

function mouse_over_entity(){
if (point_in_circle(mouse_x,mouse_y,x,y,16)
	or 
	position_meeting(mouse_x,mouse_y,id))	return true;
	
	
return false;
}

function player_in_talk_range(_range = talking_range, _is_object = false)
{
	var _wep = Get_Player_Wep();
	if(obj_Player.fsm.state_is("pump")) return false;
//if(_wep.Name = "Pump") = _range/2; 
// _range*image_xscale
//var _left_B = x-_range*image_xscale;
//	if(EnemySize > EnemyMaxSize-1 and bbox_left <_left_B ){_left_B = bbox_left-_range;}
//var _right_B = x+_range*image_xscale
//	if(EnemySize > EnemyMaxSize-1 and bbox_right >_right_B ){_right_B = bbox_right+_range;}

/*
var _size = 1;
var _max_size = 1;

if(not _is_object)
	{
     _size = EnemySize;
	_max_size = EnemyMaxSize;
	}
*/

if object_is_ancestor(object_index, obj_EnemyBase){
     var _size = EnemySize;
	var _max_size = EnemyMaxSize
}
else{
	var _size = 1;
	var _max_size = 1;	
}


var _left_B = x-(x-bbox_left)*(_size/_max_size);
var _right_B = x+(bbox_right-x)*(_size/_max_size);
var _top_B = y-(y-bbox_top)*(_size/_max_size);
var _bot_B = y+(bbox_bottom-y)*(_size/_max_size);

if collision_ellipse(_left_B-_range,_top_B-_range,_right_B+_range ,_bot_B+_range, obj_Player, true, true)
{
    return true;
}	
	
return false;
}

function Take_expand_rod(){
	//show_debug_message(object_get_name(object_index));
	with(obj_Player)
		{
			var _size = ds_list_size(WeaponSet);
			for(var i = _size;i > 0; i--){
			if(WeaponSet[| i-1][$ "Name"] = "Pump"){continue;}
				//show_debug_message(i);
				ds_list_delete(WeaponSet,i-1);
				
			}
		
		}
}

function Give_expand_rod(){
	//show_debug_message(object_get_name(object_index));
	with(obj_Player)
		{
		ds_list_copy(WeaponSet,WeaponSet_Backup)
		
		}
}

function Take_magic_pump(){
	with(obj_Player)
		{
			var _size = ds_list_size(WeaponSet);
			for(var i = _size;i > 0; i--){
			if(WeaponSet[| i-1][$ "Name"] = "Pump"){ds_list_delete(WeaponSet,i-1);}
				
			}
		
		}
}

function Give_magic_pump(){
	
//just to be safe, let's make sure you don't have it already
	with(obj_Player)
		{
			var _size = ds_list_size(WeaponSet);
			for(var i = _size;i > 0; i--){
			if(WeaponSet[| i-1][$ "Name"] = "Pump"){exit;}
			}
		ds_list_add(WeaponSet, new Magic_Pump())
		}


}

function wand_pedestal_set (_PedestalID){
	
	with(obj_wand_pedestal)
		{
			if(pedestal_ID = _PedestalID){
				Take_expand_rod();
				wand_PDST.change("on");	}
		}	
}

function wand_pedestal_take (_PedestalID){
	
	with(obj_wand_pedestal)
		{
			if(pedestal_ID = _PedestalID){
				Give_expand_rod();
				wand_PDST.change("off");	}
		}	
}