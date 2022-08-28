pass_display_state = 0;
pubstub_string = "PassChange_" + string(displayer_ID);

pass_toggle_state = function(_passState){

	pass_display_state = _passState;
}

pubsub_subscribe(pubstub_string,function(_pass_Struct){
	pass_display_state = _pass_Struct.a;
});
