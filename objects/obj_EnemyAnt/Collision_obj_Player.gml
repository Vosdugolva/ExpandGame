/// @description Bump Player

var _EDam = enemyDamage;
var _dir = point_direction(x,y,other.x,other.y+other.sprite_height/2);
with( other ) {
	player_Bump(_dir,_EDam*0.2);
	//direction = _dir;
	}
        
//}