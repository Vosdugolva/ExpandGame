/// @description Insert description here
// You can write your code in this editor
z += z_Thrust
if(z > 0)
	{
	z_Thrust -= z_gravity
	}
if(z < 0)
	{
		
		if(z_bounce)
		{
			z_bounceThrust *= 0.8;
			z_Thrust = z_bounceThrust;
			z_bounce -= 1;
		}
		else{z = 0;}
		
		}