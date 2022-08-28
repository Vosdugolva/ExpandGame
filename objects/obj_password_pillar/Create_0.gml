/// @description Insert description here
// You can write your code in this editor


pass_pillar_state = 0;
pass_toggle_buffer = 0;
pubstub_string = "PassChange_" + string(pillar_ID);

pass_toggle_state = function(){

if(pass_toggle_buffer <= 0){
	pass_pillar_state+=1;
	if(pass_pillar_state > 3)pass_pillar_state = 0;
	pass_toggle_buffer = 5;
	
	var _pubsub_struct = {
		a: pass_pillar_state,
		b: pillar_ID,
		
	}
	pubsub_publish(pubstub_string,_pubsub_struct);
	}
}
