/// @description Insert description here
// You can write your code in this editor

enemyDamage = lerp(enemyDamage,enemyDamage2,0.05)
InflateToScale();

if(Mounted){
check_input();
check_SpriteAng();
fsm.step();
	if(fsm.get_current_state() != "Death")
	{
	//checkFire(Weapon_Active);
	//sprite_depth_handler()
	//player_Bump_Movement();
	ClampToViewport(0);
	ScrollFromEdge(0);
	RoomZoneHandler();
	//check_weapon_toggle();
	}
}