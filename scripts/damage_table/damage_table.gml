// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GameDamageTypes() constructor{
	base = "base_damage";
	base_BS = "base_BS_Damage";
	fire = "Fire_damage";
	fire_BS = "Fire_BS_Damage";
	ice = "Ice_Damage";
	ice_BS = "Ice_BS_Damage";
	}
	
function Damage_Table() constructor{
	base_damage = 3;
	base_BS_Damage = 50;
	Fire_damage = 6;
	Fire_BS_Damage = 2;
	Ice_Damage = 4;
	Ice_BS_Damage = 5;
}

function Ant_DT() : Damage_Table() constructor{
	base_damage = 10;
	base_BS_Damage = 60;
	Fire_damage = 4;
	Fire_BS_Damage = 2;
	Ice_Damage = 15;
	Ice_BS_Damage = 5;
}

function AntKing_DT() : Damage_Table() constructor{
	base_damage = 2;
	base_BS_Damage = 10;
	Fire_damage = 1;
	Fire_BS_Damage = 2;
	Ice_Damage = 3;
	Ice_BS_Damage = 5;
}