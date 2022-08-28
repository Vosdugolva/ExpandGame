

//Create an array to store the digits
pass_lock_combo = array_create(password_digits);
pass_lock_str = "0000";
pass_lock_goal = "1232";

//Method to read out the combo
pass_read_combo = function(){
	var _combo = "";
	
	for(var i = password_digits; i > 0;i--){
		_combo = string_insert(_combo,string(pass_lock_combo[i-1]),i+1);
		//_combo += pass_lock_combo[i]*(10*i);
	}
	pass_lock_str = _combo;
	show_debug_message(pass_lock_str);
	
}

//Subscribe to all the password pubsubs
for(var i = 0; i < password_digits;i++){
	var _pubstub_string = "PassChange_" + string(i);

pubsub_subscribe(_pubstub_string,function(_pass_Struct){
	pass_lock_combo[_pass_Struct.b] = _pass_Struct.a;
	pass_read_combo();
});

}

