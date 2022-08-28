/// @description Methods

WalkAnim = function (){
ActTimer--;
if (ActTimer <= 0) {
		switch(ActCount)
		{
		case 0: ActTimer = quarSec; ActCount = 1; imageframe = Bunny_SpriteList.idle1; break;
		case 1: ActTimer = quarSec; ActCount = 0; imageframe = Bunny_SpriteList.idle1; break;
		}
	}
	
}

idleAnim = function (){
ActTimer--;
if (ActTimer <= 0) {
		switch(EnemySize)
		{
		case 1: //Size 1 anim
			switch(ActCount)
			{
			case 0: ActTimer = quarSec; ActCount = 1; imageframe = Bunny_SpriteList.idle1; break;
			case 1: ActTimer = quarSec; ActCount = 2; imageframe = Bunny_SpriteList.idle2; break;
			case 2: ActTimer = quarSec; ActCount = 3; imageframe = Bunny_SpriteList.idle1; break;
			case 3: ActTimer = quarSec; ActCount = 0; imageframe = Bunny_SpriteList.idle3; break;
			}
		break;
		
		case 2: //Larger Size Anim
		case 3:
		case 4:
			switch(ActCount)
			{
			case 0: ActTimer = halfSec; ActCount = 1; imageframe = Bunny_SpriteList.idle1; break;
			case 1: ActTimer = quarSec; ActCount = 2; imageframe = Bunny_SpriteList.idle2; break;
			case 2: ActTimer = quarSec; ActCount = 3; imageframe = Bunny_SpriteList.idle3; break;
			case 3: ActTimer = quarSec; ActCount = 0; imageframe = Bunny_SpriteList.idle2; break;
			}
		break;
		
		default: ActTimer = quarSec; imageframe = Bunny_SpriteList.idle1; break;
		}

	}
	
}

AttackAnim = function (){
ActTimer--;
if (ActTimer <= 0) {
	
	switch(EnemySize)
		{
		case 0:
			switch(ActCount)
			{
			case 0: ActCount = 1; ActTimer = eigthSec;imageframe = Bunny_SpriteList.idle2; break;
			case 1: ActCount = 0; ActLoopCount++; ActTimer = eigthSec;imageframe = Bunny_SpriteList.idle1; break;
			}
		break;
		
		default:
			switch(ActCount)
			{
			case 0: ActCount = 1; ActTimer = eigthSec;imageframe = Bunny_SpriteList.jump; break;
			case 1: ActCount = 0; ActLoopCount++; ActTimer = eigthSec;imageframe = Bunny_SpriteList.idle1; break;
			}
		break;
		}

	if(ActLoopCount >= 2){fsm.change("idle");}
	}
	
}

