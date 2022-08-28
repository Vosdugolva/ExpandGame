/// @description Insert description here
// You can write your code in this editor

x = mouse_x;
y = mouse_y;
var _mouse_down = mouse_check_button(mb_left)
var _pumping = Owner_ID.fsm.state_is("Pump")
var _touch_talker = false;
touch_talker = false;

if (!instance_exists(Owner_ID) or  Owner_ID = noone){ exit;}

//if your mouse is hovering over a talkable entity, don't let the player shoot
//unless they were already shooting

if (not _mouse_down)
{
	if(place_meeting(x,y,obj_Talkables))
	{
		var _inst = instance_place(x, y, obj_Talkables);
		var _owner = Owner_ID;
	with(_inst)
		{
		if(can_talk_to && player_in_talk_range()){/*_owner.hold_your_fire = true;*/ _touch_talker = true}	
		}
	}
}


if (not _mouse_down)
{
if(not _touch_talker)Owner_ID.hold_your_fire = false;
}

//if(Owner_ID.hold_your_fire) {image_index = 1}
if(_touch_talker) {image_index = 1}
else{image_index = 0}