/// @description Bump Player

var _EDam = enemyDamage;
var _sizDif = enemyDamage/EnemyMaxDamage;
var _dir = point_direction(x,y-(sprite_height/4)*_sizDif,other.x,other.y);
var _bumpForce = enemyDamage*0.2;

if(_bumpForce < 2.0){_bumpForce = 2.0}
if(_bumpForce > 10.0){_bumpForce = 10.0}
with( other ) {
	player_Bump(_dir,_bumpForce);
	//direction = _dir;
	}
        
//}