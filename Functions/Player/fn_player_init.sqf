/*


	//*************************************************************************
	//                PLAYER INIT
	//*************************************************************************
	[] spawn OL_fnc_player_init;


*/

//*******************************************************
//
//      CRICKET KEYBIND
//		
//*******************************************************
["Overlord D-Day", "OL_Clicker", ["Cricket Clicker", "Alert nearbuy friendlies of your position."], 
{
	[player] spawn OL_fnc_misc_cricket; 
}, 
{}, [22, [false, false, false]]] call CBA_fnc_addKeybind;



//*************************************************************************
//                ON PLAYER SPAWN
//*************************************************************************
[] spawn OL_fnc_player_onSpawn;





