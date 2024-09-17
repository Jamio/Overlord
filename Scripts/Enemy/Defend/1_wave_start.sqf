/*

[] execVM "Scripts\Enemy\Defend\1_wave_start.sqf";
[] spawn OL_defend_wave_start_1;


*/




if (isServer) then {

	params ["_tank","_halfTrack_1","_halfTrack_2","_truck_1","_truck_2"];

	//*******************************************************
	//             DELETE BLUFOR AND DEAD
	//*******************************************************
	{
		deleteVehicle _x;
	} forEach allDeadMen;

	{
		if ( side _x == west ) then {
			deleteVehicle _x;
		};

	} forEach allUnits;
	


	[""] remoteExec ["playMusic",0];

	//*******************************************************
	//             DEBUG
	//*******************************************************
	if ( OL_debugInfo ) then { ["Wave 1 Incoming"] remoteExec ["hint",0]; };


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
		[3475.62,2456.05,0], 
		[3463.2,2458.53,0], 
		[3452.06,2461.68,0], 
		[3438.35,2463.74,0], 
		[3423.71,2465.93,0], 
		[3404.95,2469.23,0], 
		[3388.44,2472.3,0], 
		[3366.42,2475.94,0], 
		[3349.23,2479.36,0], 
		[3334.7,2483.86,0], 
		[3316.93,2488.58,0], 
		[3296.17,2493.75,0], 
		[3281.43,2501.35,0], 
		[3274.63,2505.14,0], 
		[3266.93,2509.4,0], 
		[3258.74,2513.8,0], 
		[3246.37,2519.45,0], 
		[3234.47,2525.4,0], 
		[3219.22,2532.99,0], 
		[3198.99,2540.2,0], 
		[3179.36,2546.22,0], 
		[3156.81,2551.71,0], 
		[3138.6,2555.48,0], 
		[3112.6,2562.38,0], 
		[3099.68,2565.29,0], 
		[3086.74,2568.32,0], 
		[3075.12,2569.5,0], 
		[3052.04,2567.8,0], 
		[3037.89,2566.17,0], 
		[3018.09,2561.57,0], 
		[3001.57,2558.79,0], 
		[2987.5,2553.86,0], 
		[2967.23,2547.93,0], 
		[2952.65,2545.09,0], 
		[2940.15,2539.9,0], 
		[2927.62,2533.78,0], 
		[2907.54,2520.64,0], 
		[2897.35,2514.33,0], 
		[2882.53,2505.39,0], 
		[2867.65,2500.1,0], 
		[2858.54,2496.89,0], 
		[2845.62,2494.08,0], 
		[2837.91,2493.06,0], 
		[2826.06,2490.4,0], 
		[2811.78,2488.04,0], 
		[2790.83,2484.32,0], 
		[2777.49,2483.33,0], 
		[2759.99,2482.5,0], 
		[2829.72,2509.04,0], 
		[2839.06,2510.61,0], 
		[2851.15,2513.57,0], 
		[2860.85,2516.42,0], 
		[2867.9,2520.24,0], 
		[2876.18,2525.2,0], 
		[2885.61,2529.51,1.59856], 
		[2892.54,2533.35,0], 
		[2899.24,2537.45,0], 
		[2904.11,2540.88,0], 
		[2908.25,2543.7,0], 
		[2914.02,2547.23,0], 
		[2922.71,2553.24,0], 
		[2940.53,2559.91,0], 
		[2962.89,2567.42,0], 
		[2978.3,2572.42,0], 
		[2996.25,2576.4,0], 
		[3010.33,2578.17,0], 
		[3024.12,2579.73,0], 
		[3037.48,2581.53,0], 
		[3049.73,2583.85,0], 
		[3059.03,2585.65,0], 
		[3076.56,2587.18,0], 
		[3086.64,2583.15,0], 
		[3101.49,2581.64,0], 
		[3113.04,2580.18,0], 
		[3122,2579.2,0], 
		[3142.01,2573.7,0], 
		[3155.89,2570.72,0], 
		[3172.75,2566.49,0], 
		[3191.63,2560.22,0], 
		[3207.76,2556.09,0], 
		[3221.83,2552.29,0], 
		[3249.64,2543.85,0], 
		[3294.19,2527.98,0], 
		[3323.71,2516.47,0], 
		[3342.27,2509.85,0], 
		[3362.84,2501.28,0], 
		[3377.93,2495.32,0], 
		[3393.88,2490.05,0], 
		[3426.15,2485.34,0], 
		[3442.12,2480.69,0], 
		[3460.64,2477.89,0], 
		[3413.69,2488.18,0]
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
	OL_enemy_convoy_grp_1 = createGroup [west, true]; 

	_vehArray = [[3446.31,2472.05,0], 283.053, "LIB_SdKfz251_FFV", OL_enemy_convoy_grp_1] call bis_fnc_spawnvehicle; 
	_halfTrack_1 = _vehArray select 0; _halfTrackCrew_1 = _vehArray select 1; _leader = OL_enemy_convoy_grp_1 selectLeader (_halfTrackCrew_1 select 0);

	_vehArray = [[3469.56,2467.06,-3.8147e-006], 283.053, "LIB_PzKpfwV", OL_enemy_convoy_grp_1] call bis_fnc_spawnvehicle; 
	_tank = _vehArray select 0; _tankCrew = _vehArray select 1; 

	_vehArray = [[3489.92,2462.57,0], 283.053, "LIB_SdKfz251_FFV", OL_enemy_convoy_grp_1] call bis_fnc_spawnvehicle;
	_halfTrack_2 = _vehArray select 0; _halfTrackCrew_1 = _vehArray select 1;
	 
	_vehArray = [[3508.97,2458.87,7.62939e-006], 283.053, "LIB_OpelBlitz_Tent_Y_Camo", OL_enemy_convoy_grp_1] call bis_fnc_spawnvehicle;
	_truck_1 = _vehArray select 0; _truckCrew_1 = _vehArray select 1;
	 
	_vehArray = [[3526.73,2455.17,-1.14441e-005], 283.053, "LIB_OpelBlitz_Tent_Y_Camo", OL_enemy_convoy_grp_1] call bis_fnc_spawnvehicle;
	_truck_2 = _vehArray select 0; _truckCrew_2 = _vehArray select 1;


	OL_enemy_convoy_grp_1 setFormation "COLUMN";
	OL_enemy_convoy_grp_1 setCombatBehaviour "SAFE";

	OL_convoyScript_1 = [OL_enemy_convoy_grp_1, 25, 15, true] spawn TOV_fnc_SimpleConvoy;



	{
		[_x,[[_tank],true]] remoteExec ["addCuratorEditableObjects",0]; 
		[_x,[[_halfTrack_1],true]] remoteExec ["addCuratorEditableObjects",0]; 
		[_x,[[_halfTrack_2],true]] remoteExec ["addCuratorEditableObjects",0]; 
		[_x,[[_truck_1],true]] remoteExec ["addCuratorEditableObjects",0]; 
		[_x,[[_truck_2],true]] remoteExec ["addCuratorEditableObjects",0]; 
	} forEach allCurators; 	
	
	
	//*****************************************************************************
	//             HOLD ACTION
	//*****************************************************************************
	{ 
		[_x] spawn OL_ha_expl_veh;	
	} forEach [_halfTrack_1,_tank,_halfTrack_2,_truck_1,_truck_2];
	
	
	//*****************************************************************************
	//             ARRAY / HOLD ACTION
	//*****************************************************************************
	{ 
		OL_enemy_attack_units pushBack _x;	
	} forEach units OL_enemy_convoy_grp_1;



	//**************************************************************
	//
	//           SPAWN INFANTRY
	//
	//**************************************************************
	
	
	//**************************************************************
	//          GROUP #1
	//**************************************************************
	_grp = createGroup [west, true]; 

	for "_i" from 1 to 10 do {
			
		_unit = _grp createUnit [selectRandom _unitArray, _truck_1, [], 0, "CARGO"];
		[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
		[_unit] call OL_fnc_misc_opfor_ai_skill;
		[_unit,_truck_1] remoteExec ["moveInCargo",_unit];
		
			
		{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
						
		OL_enemy_attack_units pushback _unit;

				
	};
	
    _wp1 = _grp addWaypoint [[2749.71,2498.52,3.8147e-006], 0];
    _wp1 setWaypointType "GETOUT";
	
	_wp2 = _grp addWaypoint [[2672.66,2444.38,7.62939e-006], 1];
    _wp2 setWaypointType "MOVE";
	
	_wp2 = _grp addWaypoint [[2534.51,2474.79,3.8147e-006], 2];
    _wp2 setWaypointType "SAD";
	
	_wp3 = _grp addWaypoint [[2559.78,2546.61,-1.52588e-005], 3];
    _wp3 setWaypointType "SAD";





	//**************************************************************
	//          GROUP #2
	//**************************************************************
	_grp = createGroup [west, true]; 
	for "_i" from 1 to 10 do {
			
		_unit = _grp createUnit [selectRandom _unitArray, _truck_2, [], 0, "CARGO"];
		[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
		[_unit] call OL_fnc_misc_opfor_ai_skill;
		[_unit,_truck_2] remoteExec ["moveInCargo",_unit];
		
			
		{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
						
		OL_enemy_attack_units pushback _unit;

				
	};


    _wp1 = _grp addWaypoint [[2749.71,2498.52,3.8147e-006], 0];
    _wp1 setWaypointType "GETOUT";
	
	_wp2 = _grp addWaypoint [[2563.59,2548.68,0], 1];
    _wp2 setWaypointType "MOVE";
	
	_wp2 = _grp addWaypoint [[2563.59,2548.68,0], 2];
    _wp2 setWaypointType "SAD";
	
	_wp3 = _grp addWaypoint [[2528.83,2471.92,-7.62939e-006], 3];
    _wp3 setWaypointType "SAD";




	//**************************************************************
	//
	//          CONVOY WAYPOINTS
	//
	//**************************************************************

    _wp1 = OL_enemy_convoy_grp_1 addWaypoint [[2749.71,2498.52,3.8147e-006], 0];
    _wp1 setWaypointType "TR UNLOAD";
	_wp1 setWaypointStatements ["true", "
	
		{ deleteVehicle _x } forEach OL_can_openers;
	
	"];
		
		
		
	_wp2 = OL_enemy_convoy_grp_1 addWaypoint [[2561.27,2547.01,-7.62939e-006], 1];
  	_wp2 setWaypointType "MOVE";
	
	_wp2 setWaypointStatements ["true", "
	
		terminate OL_convoyScript_1;
		{(vehicle _x) limitSpeed 5000;(vehicle _x) setUnloadInCombat [true, false]} forEach (units OL_enemy_convoy_grp_1);
		OL_enemy_convoy_grp_1 enableAttack true;
	
	"];



	
	
	//**************************************************************
	//
	//           SPAWN DEFENSE AREA CHECK LOOPS
	//
	//**************************************************************
	[] spawn OL_defend_area_loop;
	[] spawn OL_defend_wave_check_1;
	
	
	
	//**************************************************************
	//             WAVE VARIABLES
	//**************************************************************
	_currentUnits = count OL_enemy_attack_units;
	
	
	_waveNum = _currentUnits + (100 - _currentUnits);
	_reinfNum = 30;
	

	missionNameSpace setVariable ["OL_enemy_defense",["Wave #1",_waveNum,_reinfNum]];
	
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
			_tank say3D ["OL_s_tank", 2000, 1, false, 0];
			["OL_s_rumble"] remoteExec ["playSound", _x];
			
		
		};
	
	} forEach allPlayers;
	



};