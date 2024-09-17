/*


[] execVM "Scripts\Enemy\Sectors\Spawn\3_spawn_veh_patrol_1.sqf";
player allowDamage false;
scriptDone OL_patrolScript_1;

*/



if (isServer) then {



	

	//*******************************************************
	//             UNIT INFO
	//*******************************************************

	_unitArray = [
		"LIB_GER_stggunner", 
		"LNRD_Luftwaffe_sniper", 
		"LIB_GER_unterofficer", 
		"LIB_GER_sapper", 
		"LIB_GER_scout_rifleman", 
		"LIB_GER_rifleman", 
		"LNRD_Luftwaffe_ober_rifleman", 
		"LNRD_Luftwaffe_radioman", 
		"LIB_GER_medic", 
		"LIB_GER_mgunner2", 
		"LIB_GER_ober_grenadier", 
		"LIB_GER_LAT_Rifleman", 
		"LIB_GER_AT_soldier"
	];


	_speakers = [
		"Male01Ger",
		"Male02Ger",
		"Male03Ger",
		"Male04Ger",
		"Male05Ger"
	];



	//**************************************************************
	//
	//           SPAWN VEHICLES
	//
	////************************************************************
	OL_enemy_patrol_grp_1 = createGroup [west, true]; 

	_vehArray = [[2065.82,691.616,0], 0, "LIB_Kfz1_MG42_camo", OL_enemy_patrol_grp_1] call bis_fnc_spawnvehicle; 
	enemy_v_patrol_1 = _vehArray select 0; _carCrew = _vehArray select 1; _leader = OL_enemy_patrol_grp_1 selectLeader (_carCrew select 0);

	_vehArray = [[2065.33,674.169,0], 0, "LIB_OpelBlitz_Tent_Y_Camo", OL_enemy_patrol_grp_1] call bis_fnc_spawnvehicle; 
	enemy_v_patrol_2 = _vehArray select 0; 


	OL_enemy_patrol_grp_1 setFormation "COLUMN";
	OL_enemy_patrol_grp_1 setCombatBehaviour "SAFE";

	OL_patrolScript_1 = [OL_enemy_patrol_grp_1, 50, 15, false] spawn TOV_fnc_SimpleConvoy;



	{
		[_x,[[enemy_v_patrol_1],true]] remoteExec ["addCuratorEditableObjects",0]; 
		[_x,[[enemy_v_patrol_2],true]] remoteExec ["addCuratorEditableObjects",0]; 
	} forEach allCurators; 	
	
	
	//*****************************************************************************
	//             HOLD ACTION
	//*****************************************************************************
	{ 
		[_x] spawn OL_ha_expl_veh;	
	} forEach [enemy_v_patrol_1,enemy_v_patrol_2];





/*

	//**************************************************************
	//
	//           SPAWN INFANTRY
	//
	//**************************************************************
	
	
	//**************************************************************
	//          GROUP #1
	//**************************************************************

	for "_i" from 1 to 10 do {
			
		_unit = OL_enemy_patrol_grp_1 createUnit [selectRandom _unitArray, enemy_v_patrol_2, [], 0, "CARGO"];
		[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
		[_unit] call OL_fnc_misc_opfor_ai_skill;
		[_unit,enemy_v_patrol_2] remoteExec ["moveInCargo",_unit];
		
		
		{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
						
			
	};

*/


	//**************************************************************
	//
	//          CONVOY WAYPOINTS
	//
	//**************************************************************

  	_wp1 = OL_enemy_patrol_grp_1 addWaypoint [[236.1,1401.83,0], 0];
   	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointStatements ["true", "
	
		enemy_v_patrol_1 setPos [2065.82,691.616,0];
		enemy_v_patrol_1 setDir 0;
		
		enemy_v_patrol_2 setPos [2065.33,674.169,0];
		enemy_v_patrol_2 setDir 0;
	
	"];
	
	
	
	
	
	_wp2 = OL_enemy_patrol_grp_1 addWaypoint [[2181.21,1184.9,-2.67029e-005], 1];
    _wp2 setWaypointType "MOVE";
	


	_wp3 = OL_enemy_patrol_grp_1 addWaypoint [[236.328,1401.22,0], 1];
    _wp3 setWaypointType "CYCLE";	
		
		


	_totalPop = (count units OL_enemy_patrol_grp_1) + 12;
	
	OL_enemy_patrol_grp_1 setVariable ["OL_enemy_taskInfo", ["vehicle_patrol_1",_totalPop, OL_patrolScript_1, false,[enemy_v_patrol_1,enemy_v_patrol_2]]];
		
	{ 
		_unit = _x;	
		[_unit] spawn OL_eh_enemy_veh_patrol;
		
	} forEach units OL_enemy_patrol_grp_1;








};