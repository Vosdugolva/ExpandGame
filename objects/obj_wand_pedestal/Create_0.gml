/// @description Insert description here
// You can write your code in this editor

wand_is_set = false;
can_talk_to = true;

wand_PDST = new SnowState("off");

wand_PDST

 //[+]============|Off|==============[+] 
	.add("off", {
    enter: function() {
	  wand_is_set = false;
    },
    step: function() {

		if(point_in_circle(mouse_x,mouse_y,x,y,16) && player_talk_input())
		{
			if(player_in_talk_range(undefined,true))
			{		
				
			create_textbox("wand_pedestal_1");
					
			}
		}
    }
  })
 //[+]================================[+]
  //[+]============|Off|==============[+] 
	.add("on", {
    enter: function() {
	  wand_is_set = true;
    },
    step: function() {

		if(point_in_circle(mouse_x,mouse_y,x,y,16) && player_talk_input())
		{
			if(player_in_talk_range(undefined,true))
			{		
				
			create_textbox("wand_pedestal_1_set");
					
			}
		}
    }
  })
 //[+]================================[+]
 ;