/*

[] execVM "Scripts\Enemy\Defend\2_wave_start.sqf";
[] spawn OL_defend_wave_start_2;


*/




if (isServer) then {

	params ["_car","_tank_1","_tank_2","_halfTrack_1","_halfTrack_2","_halfTrack_3"];

//********************************************************************
//                     DELETE DEAD BODIES
//********************************************************************
{ deleteVehicle _x; } forEach allDeadMen;




	//*******************************************************
	//             DEBUG
	//*******************************************************
	if ( OL_debugInfo ) then { ["Wave 2 Incoming"] remoteExec ["hint",0]; };


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

	//*******************************************************
	//             SPAWN CAN OPENERS
	//*******************************************************
	
	_openerArray = [
		[2585.97,2997.7,0], 
		[2588.55,2998.39,0], 
		[2591.3,2999.02,-7.62939e-006], 
		[2594.67,2999.31,-3.8147e-006], 
		[2596.58,2999.6,0], 
		[2584.16,2996.85,0], 
		[2591.58,3017.48,-7.62939e-006], 
		[2590.08,3017.4,0], 
		[2588.79,3017.27,0], 
		[2770.8,3563.14,7.62939e-006], 
		[2764.64,3559.29,0.813946], 
		[2757.84,3554.73,0.684048], 
		[2750.44,3549.82,0.773499], 
		[2741.62,3542.82,7.62939e-006], 
		[2733.57,3537.66,0.723171], 
		[2718.96,3526.69,0.079052], 
		[2710.91,3520.51,0.695541], 
		[2704.01,3515.48,0.739426], 
		[2693.15,3507.95,3.8147e-006], 
		[2684.77,3502.19,7.62939e-006], 
		[2674.98,3493.71,7.62939e-006], 
		[2664.48,3484.12,7.62939e-006], 
		[2654.11,3474.26,7.62939e-006], 
		[2644.08,3463.72,7.62939e-006], 
		[2637.54,3456.24,0.757694], 
		[2631.3,3448.09,0.0110893], 
		[2625.14,3439.13,0.056263], 
		[2621.45,3433.15,0.0885277], 
		[2617.51,3425.74,0.770367], 
		[2613.52,3418.7,0.125866], 
		[2608.09,3409.34,0.125004], 
		[2603.66,3402,7.62939e-006], 
		[2599.65,3394.72,7.62939e-006], 
		[2594.9,3384.73,7.62939e-006], 
		[2590.9,3376.82,7.62939e-006], 
		[2588.7,3370.53,3.43323e-005], 
		[2587.2,3365.47,7.62939e-006], 
		[2586.13,3358.68,1.14441e-005], 
		[2584.65,3350.09,7.62939e-006], 
		[2584.44,3344.35,7.62939e-006], 
		[2583.21,3334.28,7.62939e-006], 
		[2582.64,3328.74,7.62939e-006], 
		[2582,3321.81,7.62939e-006], 
		[2581.44,3311.46,7.62939e-006], 
		[2581.69,3299.99,7.62939e-006], 
		[2582.89,3287.63,7.62939e-006], 
		[2584.08,3273.29,7.62939e-006], 
		[2585.47,3257.99,7.62939e-006], 
		[2587.1,3240.52,7.62939e-006], 
		[2587.64,3234.49,1.14441e-005], 
		[2588.74,3223.97,7.62939e-006], 
		[2590.06,3213.28,7.62939e-006], 
		[2591.1,3200.44,7.62939e-006], 
		[2591.53,3184.35,7.62939e-006], 
		[2592.19,3165.61,7.62939e-006], 
		[2592.37,3142.01,7.62939e-006]
	];
	
	
	OL_can_openers = [];
	
	{
	
		_pos = _x;
		_object = createVehicle ["Land_CanOpener_F", _pos, [], 0, "CAN_COLLIDE"];
		{ [_x,[[_object],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
		OL_can_openers pushBack _object;
		
	} forEach _openerArray;
		
		
		
		
		
		
		
		
		
	OL_enemy_attack_units = [];
	
	//**************************************************************
	//
	//           SPAWN VEHICLES
	//
	////************************************************************
	OL_enemy_convoy_grp_2 = createGroup [west, true]; 

	_vehArray = [[2683.21,3508.36,0], 233.609, "LIB_Kfz1_MG42_camo", OL_enemy_convoy_grp_2] call bis_fnc_spawnvehicle; 
	_car = _vehArray select 0; _carCrew = _vehArray select 1; _leader = OL_enemy_convoy_grp_2 selectLeader (_carCrew select 0);

	_vehArray = [[2700.46,3520.55,0], 234.272, "LIB_PzKpfwVI_E_tarn52d", OL_enemy_convoy_grp_2] call bis_fnc_spawnvehicle; 
	_tank_1 = _vehArray select 0;

	_vehArray = [[2719.02,3533.61,3.8147e-006], 236.096, "LIB_PzKpfwVI_E_tarn51d", OL_enemy_convoy_grp_2] call bis_fnc_spawnvehicle; 
	_tank_2 = _vehArray select 0;

	_vehArray = [[2736.12,3545.66,0], 236.482, "LIB_SdKfz251_FFV", OL_enemy_convoy_grp_2] call bis_fnc_spawnvehicle; 
	_halfTrack_1 = _vehArray select 0; 

	_vehArray = [[2751.58,3556.24,2.67029e-005], 236.482, "LIB_SdKfz251_FFV", OL_enemy_convoy_grp_2] call bis_fnc_spawnvehicle; 
	_halfTrack_2 = _vehArray select 0; 

	_vehArray = [[2766.09,3565.79,0], 236.482, "LIB_SdKfz251_FFV", OL_enemy_convoy_grp_2] call bis_fnc_spawnvehicle; 
	_halfTrack_3 = _vehArray select 0; 




	OL_enemy_convoy_grp_2 setFormation "COLUMN";
	OL_enemy_convoy_grp_2 setCombatBehaviour "SAFE";

	OL_convoyScript_2 = [OL_enemy_convoy_grp_2, 25, 15, true] spawn TOV_fnc_SimpleConvoy;



	{
	
		[_x,[[_car],true]] remoteExec ["addCuratorEditableObjects",0];
		[_x,[[_tank_1],true]] remoteExec ["addCuratorEditableObjects",0]; 
		[_x,[[_tank_2],true]] remoteExec ["addCuratorEditableObjects",0]; 		
		[_x,[[_halfTrack_1],true]] remoteExec ["addCuratorEditableObjects",0]; 
		[_x,[[_halfTrack_2],true]] remoteExec ["addCuratorEditableObjects",0]; 
		[_x,[[_halfTrack_3],true]] remoteExec ["addCuratorEditableObjects",0];
		
	} forEach allCurators; 

	
	//*****************************************************************************
	//             HOLD ACTION
	//*****************************************************************************
	{ 
		[_x] spawn OL_ha_expl_veh;	
	} forEach [_car,_tank_1,_tank_2,_halfTrack_1,_halfTrack_2,_halfTrack_3];
	
	//*****************************************************************************
	//             ARRAY 
	//*****************************************************************************
	{ 
		OL_enemy_attack_units pushBack _x;
	} forEach units OL_enemy_convoy_grp_2;






	//**************************************************************
	//
	//           SPAWN INFANTRY
	//
	//**************************************************************
	
	
	//**************************************************************
	//          GROUP #1
	//**************************************************************
	_grp = createGroup [west, true]; 

	for "_i" from 1 to 7 do {
			
		_unit = _grp createUnit [selectRandom _unitArray, _halfTrack_1, [], 0, "CARGO"];
		[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
		[_unit] call OL_fnc_misc_opfor_ai_skill;
		[_unit,_halfTrack_1] remoteExec ["moveInCargo",_unit];
		
			
		{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
						
		OL_enemy_attack_units pushback _unit;

				
	};
	
    _wp1 = _grp addWaypoint [[2574.67,2803.86,3.8147e-006], 0];
    _wp1 setWaypointType "GETOUT";
	
	_wp2 = _grp addWaypoint [[2560.95,2547.78,-3.8147e-006], 1];
    _wp2 setWaypointType "MOVE";
	
	_wp2 = _grp addWaypoint [[2531.31,2477.4,-3.8147e-006], 2];
    _wp2 setWaypointType "SAD";
	
	_wp3 = _grp addWaypoint [[2584.86,2549.79,10.2049], 3];
    _wp3 setWaypointType "SAD";


	//**************************************************************
	//          GROUP #2
	//**************************************************************
	_grp = createGroup [west, true]; 

	for "_i" from 1 to 7 do {
			
		_unit = _grp createUnit [selectRandom _unitArray, _halfTrack_2, [], 0, "CARGO"];
		[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
		[_unit] call OL_fnc_misc_opfor_ai_skill;
		[_unit,_halfTrack_2] remoteExec ["moveInCargo",_unit];
		
			
		{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
						
		OL_enemy_attack_units pushback _unit;

				
	};
	
    _wp1 = _grp addWaypoint [[2574.67,2803.86,3.8147e-006], 0];
    _wp1 setWaypointType "GETOUT";
	
	_wp2 = _grp addWaypoint [[2560.95,2547.78,-3.8147e-006], 1];
    _wp2 setWaypointType "MOVE";
	
	_wp2 = _grp addWaypoint [[2531.31,2477.4,-3.8147e-006], 2];
    _wp2 setWaypointType "SAD";
	
	_wp3 = _grp addWaypoint [[2584.86,2549.79,10.2049], 3];
    _wp3 setWaypointType "SAD";


	//**************************************************************
	//          GROUP #3
	//**************************************************************
	_grp = createGroup [west, true]; 

	for "_i" from 1 to 7 do {
			
		_unit = _grp createUnit [selectRandom _unitArray, _halfTrack_3, [], 0, "CARGO"];
		[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
		[_unit] call OL_fnc_misc_opfor_ai_skill;
		[_unit,_halfTrack_3] remoteExec ["moveInCargo",_unit];
		
			
		{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
						
		OL_enemy_attack_units pushback _unit;

				
	};
	
    _wp1 = _grp addWaypoint [[2574.67,2803.86,3.8147e-006], 0];
    _wp1 setWaypointType "GETOUT";
	
	_wp2 = _grp addWaypoint [[2560.95,2547.78,-3.8147e-006], 1];
    _wp2 setWaypointType "MOVE";
	
	_wp2 = _grp addWaypoint [[2531.31,2477.4,-3.8147e-006], 2];
    _wp2 setWaypointType "SAD";
	
	_wp3 = _grp addWaypoint [[2584.86,2549.79,10.2049], 3];
    _wp3 setWaypointType "SAD";







	//**************************************************************
	//
	//          CONVOY WAYPOINTS
	//
	//**************************************************************

    _wp1 = OL_enemy_convoy_grp_2 addWaypoint [[2574.67,2803.86,3.8147e-006], 0];
    _wp1 setWaypointType "TR UNLOAD";
	_wp1 setWaypointStatements ["true", "
		
		{ deleteVehicle _x } forEach OL_can_openers;
	
	"];
		
		
	_wp2 = OL_enemy_convoy_grp_2 addWaypoint [[2574.67,2803.86,3.8147e-006], 1];
    _wp2 setWaypointType "MOVE";

	
	_wp3 = OL_enemy_convoy_grp_2 addWaypoint [[2531.31,2477.4,-3.8147e-006], 2];
    _wp3 setWaypointType "MOVE";
	
	_wp3 setWaypointStatements ["true", "
	
		terminate OL_convoyScript_2;
		{(vehicle _x) limitSpeed 5000;(vehicle _x) setUnloadInCombat [true, false]} forEach (units OL_enemy_convoy_grp_2);
		OL_enemy_convoy_grp_2 enableAttack true;
	
	"];



	
	
	//**************************************************************
	//
	//           SPAWN DEFENSE AREA CHECK LOOPS
	//
	//**************************************************************
	[] spawn OL_defend_wave_check_2;


	//**************************************************************
	//             WAVE VARIABLES
	//**************************************************************
	_currentUnits = count OL_enemy_attack_units;
	
	
	_waveNum = _currentUnits + (100 - _currentUnits);
	_reinfNum = 30;
	

	missionNameSpace setVariable ["OL_enemy_defense",["Wave #2",_waveNum,_reinfNum]];
	
	{

		[_x] spawn OL_eh_enemy_defense;
	
	} forEach OL_enemy_attack_units;


	//**************************************************************
	//
	//           SHAKE AND SOUND
	//
	//**************************************************************
	
	sleep 20;
	
	{
		if ( _x inArea "main_obj_defend_mrkr") then {
		
			[[.3, 90, 25]] remoteExec ["addCamShake",_x]; 
			_tank_1 say3D ["OL_s_tank", 2000, 1, false, 0];
			["OL_s_rumble"] remoteExec ["playSound", _x];

		
		};
	
	} forEach allPlayers;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

};