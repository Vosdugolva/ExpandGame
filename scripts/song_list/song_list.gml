// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function GameSong() constructor{
	song = BGM_ForestStage;
	intro_length = 16.064;
	loop_length =  48.013;
	total_length = intro_length+loop_length;
}

function Song_forest() : GameSong() constructor{
	song = BGM_ForestStage;
	intro_length = 16.064;
	loop_length =  48.013;
	total_length = intro_length+loop_length;
}

function Song_Boss() : GameSong() constructor{
	song = BGM_BossTheme;
	intro_length = 06.115;
	loop_length =  48.926;
	total_length = intro_length+loop_length;
}

function Song_EX1() : GameSong() constructor{
	song = BGM_EXZone1;
	intro_length = 00.000;
	loop_length =  57.595;
	total_length = intro_length+loop_length;
}

function Song_Masterlist() constructor{
		s_BGM_ForestStage = new Song_forest();
		s_BGM_BossTheme = new Song_Boss();
		s_BGM_EXZone1 = new Song_EX1();
		
	}
	
function Song_ident(_songList, _songName){
var _s = _songList[$ "s_" +  string(_songName)];	
return _s;
	
}


/*
function Song_ident(_songList, _songName){
var str = "";
var array = variable_struct_get_names(_songList);
show_debug_message("Variables for struct: " + string(array));
for (var i = 0; i < array_length(array); i++;)
{
	str = string("s_" + _songName);
    if(str =  array[i]){return(is_struct(str))}
    show_debug_message(str);
}

}
*/
