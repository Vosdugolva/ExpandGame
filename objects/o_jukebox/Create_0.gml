BGM_to_play = audio_play_sound(level_music,1000,true);
BGM_queue = BGM_to_play
BGM_trans = false;
BGM_track[0] =  music_track_1;
BGM_track[1] =  music_track_2;
BGM_track[2] =  music_track_3;
BGM_track[3] =  music_track_4;
Jukebox_songList = new Song_Masterlist();


jukebox_intro_length = 0;
jukebox_loop_length = 0;
jukebox_total_length = 0;
jukebox_track_position = 0;

jukebox_set_lengths = function(_BGM){
	//_BGM = asset_get_index(_BGM);
	//var _struct = Song_ident(Jukebox_songList,_BGM);
	var str = string("s_" + audio_get_name(_BGM));
	//show_debug_message(str);
	//str = "s_BGM_BossTheme"
	var _struct = Jukebox_songList[$ str];
	//show_debug_message(_struct);
	
	jukebox_intro_length = _struct.intro_length
	jukebox_loop_length = _struct.loop_length
	jukebox_total_length = jukebox_intro_length+jukebox_loop_length;
	show_debug_message(jukebox_intro_length);
	show_debug_message(jukebox_loop_length);
	
}

jukebox_set_lengths(BGM_to_play);


Jukebox_queue_music = function(_BGM){
if(_BGM == BGM_to_play) exit;
BGM_queue = _BGM;
BGM_trans = true;
audio_sound_gain(BGM_to_play,0,1000);
}

Jukebox_queue_track = function(_tracknum){
_tracknum = clamp(_tracknum,0,3);
if(BGM_track[_tracknum] == BGM_to_play) exit;

BGM_queue =  BGM_track[_tracknum];
BGM_trans = true;
audio_sound_gain(BGM_to_play,0,1000);
}

jukebox_fade_music = function(_fadeSpeed = 1000){
audio_sound_gain(BGM_to_play,0,_fadeSpeed);
}

jukebox_play_track = function(_tracknum){
_tracknum = clamp(_tracknum,0,3);
var _BGM = BGM_track[_tracknum];
if(_BGM == BGM_to_play) exit;

if(audio_sound_get_gain(BGM_to_play) > 0){audio_stop_sound(BGM_to_play);}
BGM_to_play = audio_play_sound(_BGM,1000,true);;
BGM_queue = BGM_to_play
jukebox_set_lengths(BGM_to_play);
//audio_play_sound(BGM_to_play,1000,true);
audio_sound_gain(BGM_to_play,1,0);
}

jukebox_stop_music = function(){
audio_stop_sound(BGM_to_play);
}