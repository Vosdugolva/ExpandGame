// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function InflateToScale(){
GetEnemySize();

var _scaleFactor;
if(EnemySizeScaleFactor[EnemySize] != 1) _scaleFactor = EnemySizeScaleFactor[EnemySize];
else{_scaleFactor = EnemySize;}
var _scale = (1 + ((enemyDamage/ (EnemyMaxSize*2) - _scaleFactor)*enemyExpandScaleMult))
image_xscale = _scale;//lerp(image_xscale,_scale,0.2);
image_yscale = image_xscale;
}

function InstantInflateToScale(){
GetEnemySize();
var _scale = (1 + ((enemyDamage/ (EnemyMaxSize*2) - EnemySize)*enemyExpandScaleMult)*EnemySizeScaleFactor[EnemySize])
image_xscale = _scale;
image_yscale = image_xscale;
}

function GetEnemySize(){
	#region depreciated
	//var _sizeUp = (EnemySizeThreshold * EnemySize)+(EnemySizeThreshholdPlus* EnemySize);
	//show_debug_message("Sizeup " + string(_sizeUp));
	//var _sizeDown = (EnemySizeThreshold * (EnemySize-1)) + (EnemySizeThreshholdPlus*(EnemySize-1));
	//show_debug_message("SizeDown " + string(_sizeDown));
	//if(enemyDamage >= _sizeUp && EnemySize<EnemyMaxSize)
	//{
	//show_debug_message(EnemySize);
	//EnemySize++; 
	//}
	//else if(enemyDamage <_sizeDown && EnemySize>0)
	//{
	////show_debug_message(EnemySize);
	//EnemySize--;
	//}
	#endregion
	
	var _newSize = 0;
	var _curSize = EnemySize;
	var _maxSize = EnemyMaxSize;
	for(var i = 0; i<=_maxSize;i+=1)
		{
		//var _TempSize = (EnemySizeThreshold * i-1)+(EnemySizeThreshholdPlus* i-1);
		var _TempSize = (enemyExpandRange/_maxSize)*i;
		if(enemyDamage >= _TempSize){_newSize = i;}
		}
	if(_newSize > _maxSize){_newSize = _maxSize; }
	_newSize = clamp(_newSize,0,_maxSize);
	EnemySize = _newSize;
	if(_curSize != _newSize){InstantInflateToScale();}
}

function DamageSwell(_dam) {
	//show_debug_message("dealt damage = " + string(_dam));
	enemyDamage2 += _dam;
	Deflating = false;
	//enemy_hitflash();
	time_source_start(Deflation);
	//alarm[0] = deflatebaseTime;
	InflateToScale();
}

function Object_Swell(_dam) {
	//show_debug_message("dealt damage = " + string(_dam));
	enemyDamage2 += _dam;
	//Deflating = false;
	//enemy_hitflash();
	//time_source_start(Deflation);
	//alarm[0] = deflatebaseTime;
	InflateToScale();
}



function DeflationHandler() {
if(Deflating)
	{
		if(deflateTime){deflateTime--;}
		else
		{
		if(enemyDamage2 > enemyMinDamage)
			{
				enemyDamage2--;
				InflateToScale();
				deflateTime = deflateRate;
				}
		else{Deflating = false;}

		}
		
	}

}


function CheckIfOnScreen(_View = 0)
{
	var cam = view_camera[0];
	var x1 = camera_get_view_x(cam);
	var y1 = camera_get_view_y(cam);
	var x2 = x1 + camera_get_view_width(cam);
	var y2 = y1 + camera_get_view_height(cam);
	if(point_in_rectangle( x, y, x1, y1, x2, y2)) { return true; }
	else{return false;}

}

function CheckIfInRoom()
{
	//if(RoomID = -1){return false;}
	var RoomID = global.activeRoom;
	var x1 = RoomID.x;
	var y1 = RoomID.y;
	var x2 = x1 + RoomID.sprite_width;
	var y2 = y1 + RoomID.sprite_height;
	if(point_in_rectangle( x, y, x1, y1, x2, y2)) { return true; }
	else{return false;}

}

function CheckIfEnemiesInRoom()
{

	var RoomID = global.activeRoom;
	if(RoomID = -1){return 1;}
	var x1 = RoomID.x;
	var y1 = RoomID.y;
	var x2 = x1 + RoomID.sprite_width;
	var y2 = y1 + RoomID.sprite_height;
	var _enemyCount = 0;
	for (var i = 0; i < instance_number(obj_SpawnerBase); ++i;)
{
    _Thisenemy = instance_find(obj_SpawnerBase,i);
	
	_x = _Thisenemy.x;
	_y = _Thisenemy.y;
	if(point_in_rectangle( _x, _y, x1, y1, x2, y2)) {_enemyCount += 1; }
}
//show_debug_message(_enemyCount);
return _enemyCount;
}


function burstcheck()
{
	if (enemyDamage >= EnemyMaxDamage)
		{
		if(fsm.state_exists("defeat")){fsm.change("defeat");}
		else{enemy_burst();}
		}
	
}

function instaBurst()
{

		if(fsm.state_exists("rupture")){fsm.change("rupture");}
		else{enemy_burst();}
	
}

function enemy_burst()
{
		enemy_kill_spawner();
		instance_destroy(self);
		enemy_burst_fx();
		//global.BurstCount += 1;
		//if((global.BurstCount mod 3) = 0)instance_create_depth(x,y,Player_depth,obj_HeartFlower)
}

function enemy_flyoff()
{
	if(!CheckIfOnScreen(0))
	{
		enemy_kill_spawner();
		instance_destroy(self);
	}
}

function enemy_kill_spawner()
{
if(SpawnerID.enemy_respawn)
{
	with(SpawnerID)
		{
		spawner_Refresh_Struct_Data();
		is_spawnable_dead = true;
		}
}
else{instance_destroy(SpawnerID);}
}