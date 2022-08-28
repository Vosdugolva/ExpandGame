/// @description Insert description here

	Key_Up = keyboard_check_pressed(ord("W"));
	Key_Down = keyboard_check_pressed(ord("S"));
	Key_accept = keyboard_check_pressed(vk_space);
	
	pos += Key_Down - Key_Up;
	if(pos >= op_length)pos = 0;
	if(pos <- 0)pos = op_length-1;


	//using the options
	if(Key_accept){
		switch(pos)
			{
			case 0: break;	
			case 1: break;
			case 2: break;
			
			}
	}