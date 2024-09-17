/*

	//*************************************************************************
	//                ON PLAYER SPAWN
	//*************************************************************************
	[] spawn OL_fnc_player_onSpawn;

*/



//**********************************************************************
//          PLAYER VARIABLES
//**********************************************************************
player setVariable ["LIB_isAllowedToStaticLineJump",true];




//**********************************************************************************
//
//                 PLAYER ADDACTIONS / HOLD ACTIONS
//
//**********************************************************************************
//*************************************************************************
//                START MISSION  (COMMANDER)
//*************************************************************************

if ( (player == company_commander) )  then {

		[player] execVM "Scripts\Holdactions\ha_start_mission.sqf";
		[player] execVM "Scripts\Holdactions\ha_start_mission_2.sqf";
};

//*************************************************************************
//                TELEPORT
//*************************************************************************

_action = player addAction ["<t color=""#ff0000"">" + ("-- MOVE TO RALLYPOINT --") + "</t>", "  
			
[] spawn OL_fnc_misc_player_teleport;
	
", nil, 1000, false, true, "", "(_this == _target) && (OL_rallyPoints) && (player inArea 'dropzone_1') && (isNull objectParent player)", 25, false];

























