/// @description Insert description here
// You can write your code in this editor

var _HP = Player_HP;
var _MP = Player_MP ;
var _items = Player_ItemFlags;
global.the_Player = instance_create_depth(x,y,Player_depth,obj_Player);
with(global.the_Player)
{
Player_HP = _HP;
Player_MP = _MP;
Player_ItemFlags = _items;
}
instance_create_depth(x,y,Player_depth,o_hud);
global.Allow_Spawns = true;
instance_destroy();