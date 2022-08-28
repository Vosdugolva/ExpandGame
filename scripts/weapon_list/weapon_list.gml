// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Weapon() constructor{
	GDT = new GameDamageTypes();
	Name = "";
	damageType = GDT.base;
	damageType_BigShot =  GDT.base_BS;
	ShotSpeed = 0;
	ShotSpeed_BigShot = 0;
	FireRate = 5;
	FireRate_BigShot = 15;
	ShotObj = obj_Shot;
	BigShotObj = obj_Shot;
}


function BaseWep() : Weapon() constructor{
	Name = "Base";
	damageType = GDT.base;
	damageType_BigShot =  GDT.base_BS;
	ShotSpeed = 8;
	ShotSpeed_BigShot = 10;
	FireRate = oneSec/7;
	FireRate_BigShot = halfSec;
	fire_sound = snd_weapon_base;
	fire_BS_sound = snd_weapon_base;
	ShotObj = obj_Shot;
	BigShotObj = obj_Shot;
	
	CastShot = function(_id)
		{
			var _spd = ShotSpeed;
			var _fr = FireRate;
			var _obj = ShotObj;
			var _dmgT = damageType;
			var _snd = fire_sound;
			
			with(_id)
			{
			if (Player_FireCheck())
				{
				canFire = false;
				alarm[0] = _fr;
		
				var _dir = point_direction(x,y,mouse_x, mouse_y);
				audio_play_sound(_snd,0,false);
				var _inst = instance_create_depth(x,y,Projectile_depth,_obj)
				with(_inst) {
				speed = _spd;
				direction = _dir;
				image_angle = _dir;
				damageType = _dmgT;
				Owner_ID = _id;
				}
				}
			}
		}
		
		CastBigShot = function(_id)
		{
			
			var _spd = ShotSpeed_BigShot;
			var _fr = FireRate_BigShot;
			var _obj = BigShotObj;
			var _dmgT = damageType_BigShot;
			var _snd = fire_sound;
			
			with(_id)
				{
				if (Player_FireCheck(1))
				{
				canFire = false;
				Barri_berry_initiate();
				alarm[0] =_fr;
		
				var _dir = point_direction(x,y,mouse_x, mouse_y);
				audio_play_sound(_snd,0,false);
				var _inst = instance_create_depth(x,y,Projectile_depth,_obj)
				with(_inst) {
				speed = _spd;
				direction = _dir;
				image_angle = _dir;
				image_xscale = 2.5;
				image_yscale = image_xscale;
				damageType = _dmgT;
				is_BigShot = true;
				Owner_ID = other;
				}
				}		
			}
		}
	
}

function IceWep() : Weapon() constructor{
	Name = "Ice";
	damageType = GDT.ice;
	damageType_BigShot =  GDT.ice_BS;
	ShotSpeed = 8;
	ShotSpeed_BigShot = 5;
	FireRate = oneSec/3;
	FireRate_BigShot = halfSec;
	ShotObj = obj_iceShot;
	BigShotObj = obj_iceShot;
	
	CastShot = function(_id)
		{
			var _spd = ShotSpeed;
			var _fr = FireRate;
			var _obj = ShotObj;
			var _dmgT = damageType;
			
			with(_id)
			{
			if (Player_FireCheck())
				{
				canFire = false;
				alarm[0] = _fr;
		
				var _dir = point_direction(x,y,mouse_x, mouse_y);
				var _inst = instance_create_depth(x,y,Projectile_depth,_obj)
				with(_inst) {
				speed = _spd;
				direction = _dir;
				image_angle = _dir;
				damageType = _dmgT;
				Owner_ID = _id;
				}
				}
			}
		}
		
		CastBigShot = function(_id)
		{
			
			var _spd = ShotSpeed_BigShot;
			var _fr = FireRate_BigShot;
			var _obj = BigShotObj;
			var _dmgT = damageType_BigShot;
			with(_id)
				{
				if (Player_FireCheck(1))
				{
				canFire = false;
				Barri_berry_initiate();
				alarm[0] =_fr;
		
				var _dir = point_direction(x,y,mouse_x, mouse_y);
				var _inst = instance_create_depth(x,y,Projectile_depth,_obj)
				with(_inst) {
				speed = _spd;
				direction = _dir;
				image_angle = _dir;
				image_xscale = 2.5;
				image_yscale = image_xscale;
				damageType = _dmgT;
				is_BigShot = true;
				Owner_ID = other;
				}
				}		
			}
		}
	
}

function FireWep() : Weapon() constructor{
	Name = "Fire";
	damageType = GDT.fire;
	damageType_BigShot =  GDT.fire_BS;
	ShotSpeed = 3;
	ShotSpeed_BigShot = 0;
	FireRate = oneSec/3;
	FireRate_BigShot = halfSec;
	ShotObj = obj_fireShot;
	BigShotObj = obj_Fire_BigShot;
	
	BigShotPillarSize = 3;
	
	HomeRate = quarSec;
	HomeTimer = oneSec*1.5;
	
	CastShot = function(_id)
		{
			var _spd = ShotSpeed;
			var _fr = FireRate;
			var _obj = ShotObj;
			var _dmgT = damageType;
			var _homR = HomeRate;
			var _homT = HomeTimer;
			
			with(_id)
			{
			if (Player_FireCheck())
				{
				canFire = false;
				alarm[0] = _fr;
		
				var _dir = point_direction(x,y,mouse_x, mouse_y);
				var _inst = instance_create_depth(x,y,Projectile_depth,_obj)
				with(_inst) {
				speed = _spd;
				direction = _dir;
				image_angle = _dir;
				damageType = _dmgT;
				Owner_ID = _id;
				HomeRate = _homR;
				HomeTimer = _homT;
				}
				}
			}
		}
		
		CastBigShot = function(_id)
		{
			var _Targ = obj_reticle;
			var _spd = ShotSpeed_BigShot;
			var _fr = FireRate_BigShot;
			var _obj = BigShotObj;
			var _dmgT = damageType_BigShot;
			var _ShotTime = oneSec;
			var _Gx = _Targ.x;
			var _Gy = _Targ.y;
			var _LobSPD = (point_distance(_id.x,_id.y,_Targ.x,_Targ.y)/_ShotTime);
			var _size = BigShotPillarSize;
			with(_id)
				{
				if (Player_FireCheck(1))
				{
				canFire = false;
				Barri_berry_initiate();
				alarm[0] =_fr;
		
				var _dir = point_direction(x,y,mouse_x, mouse_y);
				var _inst = instance_create_depth(x,y,Projectile_depth,_obj)
				with(_inst) {
				speed = _spd;
				direction = _dir;
				image_angle = _dir;
				image_xscale = 2.5;
				image_yscale = image_xscale;
				damageType = _dmgT;
				x_Goal = _Gx;
				y_Goal = _Gy;
				LobSPD = _LobSPD;
				Shot_Lifetime = _ShotTime;
				Shot_MaxLifetime = _ShotTime;
				Pillar_Size = _size
				is_BigShot = true;
				Owner_ID = _id;
				}
				}		
			}
		}
	
}


function Magic_Pump() : Weapon() constructor{
	Name = "Pump";
	damageType = GDT.base;
	damageType_BigShot =  GDT.base_BS;
	ShotSpeed = 8;
	ShotSpeed_BigShot = 10;
	FireRate = oneSec/3;
	FireRate_BigShot = fifthSec;
	fire_sound = snd_magicPump;
	fire_BS_sound = snd_magicPump;
	ShotObj = obj_Shot;
	BigShotObj = obj_Shot;
	pump_radius = 16;
	
	CastShot = function(_id)
		{
			var _spd = ShotSpeed;
			var _fr = FireRate;
			var _obj = ShotObj;
			var _dmgT = damageType;
			var _snd = fire_sound;
			var _rad = pump_radius;
			
			var _dmg = 35;
			
			with(_id)
			{
			if (canFire)
				{
				canFire = false;
				alarm[0] = _fr;
				fsm.change("pump")
				
				//var _enemy = collision_circle(mouse_x,mouse_y,25,obj_EnemyBase,false,true)//instance_place(mouse_x,mouse_y,obj_EnemyBase)
				with(collision_circle(mouse_x,mouse_y,_rad,obj_EnemyBase,false,true))
					{
					var _dif = EnemyMaxDamage - enemyDamage2;
					//if(_dmg > _dif) _dmg = _dif-1;
					_dmg = clamp(_dmg,0,_dif-1);
					if(_dmg > 0){DamageSwell(_dmg);	}
					//audio_play_sound(_snd,0,false);
					}
					
					with(collision_circle(mouse_x,mouse_y,_rad,obj_summon,false,true))
					{
					var _dif = EnemyMaxDamage - enemyDamage2;
					//if(_dmg > _dif) _dmg = _dif-1;
					_dmg = clamp(_dmg,0,_dif-1);
					if(_dmg > 0){Object_Swell(_dmg);	}
					//audio_play_sound(_snd,0,false);
					}
					
				/*
				var _dir = point_direction(x,y,mouse_x, mouse_y);
				audio_play_sound(_snd,0,false);
				var _inst = instance_create_depth(x,y,Projectile_depth,_obj)
				with(_inst) {
				speed = _spd;
				direction = _dir;
				image_angle = _dir;
				damageType = _dmgT;
				Owner_ID = _id;
				*/
				//}
				}
			}
		}
		
		CastBigShot = function(_id)
		{
			
			var _spd = ShotSpeed_BigShot;
			var _fr = FireRate_BigShot;
			var _obj = BigShotObj;
			var _dmgT = damageType_BigShot;
			var _snd = fire_sound;
			var _rad = pump_radius;
			
			var _dmg = 10;
			
			with(_id)
				{
				if (canFire)
				{
				canFire = false;
				alarm[0] =_fr;
				fsm.change("pump")
				//var _enemy = collision_circle(mouse_x,mouse_y,25,obj_EnemyBase,false,true)//instance_place(mouse_x,mouse_y,obj_EnemyBase)
				with(collision_circle(mouse_x,mouse_y,_rad,obj_EnemyBase,false,true))
					{
					var _dif = enemyDamage2 - enemyMinDamage;
					_dmg = clamp(_dmg,0,_dif-1);
					if(_dmg > 0){enemyDamage2 -= _dmg;	}
					//audio_play_sound(_snd,0,false);
					}
					
					with(collision_circle(mouse_x,mouse_y,_rad,obj_summon,false,true))
					{
					var _dif = enemyDamage2 - enemyMinDamage;
					_dmg = clamp(_dmg,0,_dif-1);
					if(_dmg > 0){enemyDamage2 -= _dmg;	}
					//audio_play_sound(_snd,0,false);
					}
					
				}		
			}
		}
	
}