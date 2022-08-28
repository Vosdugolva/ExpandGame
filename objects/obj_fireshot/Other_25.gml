/// @description Insert description here
// You can write your code in this editor


// Inherit the parent event
event_inherited();

Shot_Home_Reticle = function(){
	
HomeRate =-1;
if(!HomeRate && HomeTimer)
	{
		// Vector angle between homing missile and target
		_PointDiff = point_direction(x,y,HomeTarget.x, HomeTarget.y);

		// Sin in degrees of vector angle minus current direction
		_AngDiff = dsin(_PointDiff - direction);
		
		
		direction = direction + 3*sign(_AngDiff);
		HomeRate = quarSec;
		HomeTimer -= 1;
	}
}