/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

ShotHomePlayer = function(){
if(HomeTimer)
	{
		// Vector angle between homing missile and target
		_PointDiff = point_direction(x,y,Target_ID.x, Target_ID.y);

		// Sin in degrees of vector angle minus current direction
		_AngDiff = dsin(_PointDiff - direction);
		
		
		direction = direction + HomeRate*sign(_AngDiff);
		
		HomeTimer -= 1;
	}
}

