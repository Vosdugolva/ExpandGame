/// @description Insert description here
// You can write your code in this editor

//Owner_ID = noone;
//Flicker_Time = 0;
Flicker_State = false;

Flicker_Flick = function() {
	if(instance_exists(Owner_ID))
		{
		switch(Flicker_State)
			{
			case true: 	Owner_ID.image_alpha = 0; Flicker_State = false; break;
			case false: Owner_ID.image_alpha = 1; Flicker_State = true; break;
			}
	
		}
	}

Flicker_End = function(){Owner_ID.image_alpha = 1; instance_destroy();}
Flicker_TimeOut = time_source_create(time_source_game,Flicker_Time,time_source_units_seconds,Flicker_End);
time_source_start(Flicker_TimeOut);