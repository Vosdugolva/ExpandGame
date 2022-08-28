/// @description Insert description here
// You can write your code in this editor

if(BGM_trans){
	if(BGM_queue != BGM_to_play)
	{
	if(audio_sound_get_gain(BGM_to_play) = 0)
		{
		audio_stop_sound(BGM_to_play);
		BGM_to_play = audio_play_sound(BGM_queue,1000,true);
		jukebox_set_lengths(BGM_to_play);
		//audio_play_sound(BGM_to_play,1000,true);
		audio_sound_gain(BGM_to_play,1,0);
		BGM_trans = false
		}
	}
}

jukebox_track_position = audio_sound_get_track_position(BGM_to_play);
//show_debug_message(string(jukebox_track_position) + string(jukebox_total_length));
if(jukebox_track_position > jukebox_total_length)
{
audio_sound_set_track_position(BGM_to_play,jukebox_track_position - jukebox_loop_length);
}