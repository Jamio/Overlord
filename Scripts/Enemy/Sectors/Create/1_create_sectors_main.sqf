/*


[] execVM "Scripts\Enemy\Sectors\1_create_sectors_main.sqf";



VARIABLES:

MARKER:

[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_patrolNum,_markerPos,_captured(True/False)];


UNIT:
_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolNum];


*/






if (isServer) then {


	params ["_marker"];
	
	



	
	
	//*********************************************************************************
	//
	//                 CREATE MAIN OBJECTIVE
	//
	//*********************************************************************************	
	

	
	
		_marker = "main_obj_mrkr";
		_size = 300;

		
		_sectorStatics = [];
		_sectorFlak = [];
		_sectorUnits = [];
		_sectorVeh = [];
		
		

		//********************************************************
		//         UNIT TOTALS   14 + 66  = 80
		//********************************************************
		
		//********************************************************
		//               CAMP  -- 7 + (16)
		//********************************************************
		_guardTotalCamp = [3,3] call BIS_fnc_randomInt;
		_buildTotalCamp = [3,3] call BIS_fnc_randomInt;
		_vehTotalCamp = [1,1] call BIS_fnc_randomInt;
		

		//********************************************************
		//               HQ  -- (10)
		//********************************************************
		_guardTotalHQ = [5,5] call BIS_fnc_randomInt;
		_buildTotalHQ = [5,5] call BIS_fnc_randomInt;


		//********************************************************
		//               CITY -- 2 + (38)
		//********************************************************
		_guardTotalCity = [8,8] call BIS_fnc_randomInt;
		_buildTotalCity = [8,8] call BIS_fnc_randomInt;
		_patrolTotalCity = [2,2] call BIS_fnc_randomInt;
		_patrolSizeCity = [5,5] call BIS_fnc_randomInt;
		_vehTotalCity = [2,2] call BIS_fnc_randomInt;








		
		
		
		//********************************************************
		//            UNIT OPTIONS
		//********************************************************
		_speakers = [
			"Male01Ger",
			"Male02Ger",
			"Male03Ger",
			"Male04Ger",
			"Male05Ger"
		];

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


		_vehArray = [
			"LIB_Kfz1_MG42_camo", 
			"LIB_SdKfz251_FFV", 
			"LIB_PzKpfwVI_E_tarn52d", 
			"LIB_PzKpfwVI_E_tarn51d", 
			"LIB_PzKpfwVI_B_tarn51d", 
			"LIB_PzKpfwV"
		];




		//********************************************************
		//         CURRENT POPULATION   14
		//********************************************************
		_currentUnits = allUnits select { ((_x distance getMarkerPos _marker) <= _size) && (side _x == west)}; 
		_currentUnitsNum = count _currentUnits; 
			
		{
			_unit = _x;
			_marker = _marker;
			_type = typeOf _unit;
			_role = "";
			_pos =  getPos _unit;
			_dir = getDir _unit;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			_unit setVariable ["OL_enemy_unitInfo", _unitInfo];
			[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
			
			//****************************************************
			//             MP KILLED EVENT HANDLER
			//****************************************************
			[_unit] spawn OL_eh_enemy_sector;


		} forEach _currentUnits;
		
		
		
		
		
		//********************************************************
		//            COUNT EMPTY TURRETS
		//********************************************************
		_list = getMarkerPos _marker nearObjects ["StaticWeapon", _size]; 

		{ 
 			if ( (count (crew _x)) == 0 ) then { 
  				_sectorStatics pushBack _x; 
 			}; 
 
		} forEach _list; 
		
		
		
		
		
		//********************************************************
		//            GET AA UNITS
		//********************************************************
		_sectorFlak = (getMarkerPos _marker) nearEntities ["LIB_FlaK_38", _size];
		
		{ 
		
			_alive_flak = missionProfileNamespace getVariable [str _x, true];
			
			private _crew = crew _x;
			
			if ( _alive_flak ) then {
			
				[_x] spawn OL_ha_expl_aa;
				[_x] spawn OL_fnc_eh_flak;
				OL_enemy_flak_array pushBack _x;
				
			} else {
			
				_x setDamage 1;
				
			};
			
			{
			
				_alive_unit = missionProfileNamespace getVariable [str _x, true];
				
				if ( _alive_unit ) then {
					
					[_x] spawn OL_fnc_eh_startUnitsKilled;
					
				} else {
				
					_x setDamage 1;
					
				};
			
			} forEach _crew;
			
			
			
		} forEach _sectorFlak;
		
		publicVariable "OL_enemy_flak_array";
		
		
		
		
		
		//********************************************************
		//            GET SPOTLIGHTS
		//********************************************************
		_spotlightArray = (getMarkerPos _marker) nearEntities ["LIB_GER_SearchLight", _size];
		
		{ 
		
		
		
			_alive_light = missionProfileNamespace getVariable [str _x, true];
			
			_crew = crew _x;
			
			if ( _alive_light ) then {
			
				[_x] spawn OL_fnc_eh_startUnitsKilled;
				OL_spotlight_array pushBack _x;
				
			} else {
			
				_x setDamage 1;
				
			};
			
			{
			
				_alive_unit = missionProfileNamespace getVariable [str _x, true];
				
				if ( _alive_unit ) then {
					
					[_x] spawn OL_fnc_eh_startUnitsKilled;
					
				} else {
				
					_x setDamage 1;
					
				};
			
			} forEach _crew;


		
		
		} forEach _spotlightArray;
		
		publicVariable "OL_spotlight_array";	
		
		
		
		
		

		
		
		
		
		
		//*********************************************************************************
		//
		//                 SECTOR POSITIONS 
		//
		//*********************************************************************************

		//********************************************************
		//            MILITARY CAMP
		//********************************************************
		
		_permPosCamp = [
			[2453.59,2638.07,0], 
			[2451.08,2623.76,0.372196], 
			[2420.41,2571.44,4.04408], 
			[2387.07,2646.58,0.19165], 
			[2358.92,2571.96,3.99694], 
			[2359.88,2688.7,4.02521], 
			[2430.72,2692.09,4.02358]
		];
		
		
		_guardPosCamp = [
			[2407.18,2615.39,0], 
			[2440.8,2614.06,0], 
			[2380.77,2619.75,0], 
			[2399.59,2644.48,0], 
			[2403.19,2644.52,0], 
			[2377.34,2650.78,0], 
			[2381,2616.84,0], 
			[2402.62,2615.71,0], 
			[2446.62,2626.45,0], 
			[2426.42,2645.2,0]
		];
		
		
		_buildingPosCamp = [
			[2367.44,2610.93,0.52813], 
			[2378.78,2610.71,0.555981], 
			[2436.65,2608.4,0.341923], 
			[2433.33,2607.84,0.172924], 
			[2435.26,2647.3,0.526833], 
			[2368.24,2656.84,0.158279], 
			[2372.15,2657.02,0.104172]
		];

	


		_vehPosCamp = [
			[[2401.6,2581.46,0],159.592],
			[[2396.93,2621.04,-3.8147e-006],81.264],
			[[2400.26,2637.97,-3.8147e-006],108.116],
			[[2375.38,2633.97,0],93.573]
		];



		//********************************************************
		//            MILITARY HQ (CHURCH)
		//********************************************************

		
		_guardPosHQ = [
			[2608.64,2479.59,0], 
			[2606.13,2497.02,0], 
			[2596.12,2480.43,0], 
			[2611.45,2516.46,0], 
			[2617.04,2516.73,0], 
			[2605.99,2506.09,0], 
			[2619.68,2507.7,0], 
			[2620.08,2504.51,0], 
			[2610.17,2474.43,0], 
			[2609.51,2491.19,0], 
			[2610.97,2523.69,0], 
			[2593.41,2471.77,0], 
			[2597.96,2469.9,0], 
			[2612.65,2527.31,0], 
			[2618.63,2526.62,0]
		];
		
		
		_buildingPosHQ = [
			[2611.79,2499.37,0.110474], 
			[2616.99,2502.85,0.110474], 
			[2617.16,2490.11,0.103874], 
			[2612.48,2486.98,0.103874], 
			[2623.47,2483.69,0.17889], 
			[2621.91,2488.36,0.178886], 
			[2616.17,2479.61,0.162888], 
			[2619.65,2483.76,0.17889], 
			[2612,2503.82,0.110474]
		];




		//********************************************************
		//            MILITARY City
		//********************************************************
		
				
		_permPosCity = [
			[2612.93,2512.04,15.2025], 
			[2615.95,2512.07,15.2018]	
		];
		
		
		_guardPosCity = [
			[2517.9,2406.04,3.8147e-006], 
			[2500.23,2404.98,3.8147e-006], 
			[2515.46,2457.19,3.8147e-006], 
			[2519.37,2466.37,0.0821037], 
			[2533.67,2468.44,0.11092], 
			[2556.6,2486.82,3.8147e-006], 
			[2554.85,2487.63,3.8147e-006], 
			[2569.54,2553.19,0.0950546], 
			[2542.09,2516.43,0.102005], 
			[2559.33,2521.42,0.102005], 
			[2571.55,2550.84,0.102051], 
			[2556.06,2555.84,0.0269585], 
			[2554.78,2554.09,0.0670509], 
			[2533.04,2543.51,0.105804], 
			[2507.37,2545.1,3.8147e-006], 
			[2456.92,2566.91,3.8147e-006], 
			[2460.15,2566.91,3.8147e-006], 
			[2461.24,2549.81,3.8147e-006], 
			[2572.5,2587.67,3.8147e-006], 
			[2558.74,2598.97,3.8147e-006], 
			[2545.77,2619.88,3.8147e-006], 
			[2549.92,2618.11,3.8147e-006], 
			[2529.71,2621.89,3.8147e-006], 
			[2638,2537.49,0.101994], 
			[2635.44,2537.91,0.100811], 
			[2616.28,2542.54,0.105034], 
			[2603.82,2545.83,0.116901], 
			[2593.57,2547.51,0.1175], 
			[2581.87,2535.55,3.8147e-006], 
			[2564.82,2540.32,0.101536], 
			[2565.9,2540.06,0.10561], 
			[2548.57,2541.31,0.120136], 
			[2553.8,2508.43,0.102005], 
			[2647.75,2535.38,0.097023], 
			[2531.57,2490.64,0.19838],
			[2425.68,2562.59,-7.62939e-006], 
			[2424.23,2553.37,-7.62939e-006], 
			[2421.84,2551.39,-7.62939e-006]
		];
		
		
		_buildingPosCity = [
			[2529.73,2456.55,4.32589], 
			[2531.1,2459.43,0.314671], 
			[2532.56,2462.41,4.25578], 
			[2537.61,2464.99,0.260651], 
			[2535.26,2464.34,0.247314], 
			[2545.49,2463.69,0.193619], 
			[2543.27,2465.34,4.20212], 
			[2525.18,2480.23,3.82515], 
			[2526.43,2484.13,3.71786], 
			[2526.49,2483.92,0.315022], 
			[2513.13,2457.11,0.278873], 
			[2537.77,2508.9,3.7086], 
			[2558.8,2512.82,0.116077], 
			[2558.95,2508.38,0.116081], 
			[2541.89,2522.9,0.711758], 
			[2543.57,2533.7,0.711178], 
			[2544.65,2529.31,4.48404], 
			[2543.94,2534.26,4.11178], 
			[2563.27,2525.69,3.87664], 
			[2562.7,2526.11,0.487358], 
			[2565.1,2533.18,0.541374], 
			[2564.88,2533.24,3.9398], 
			[2565.57,2536.27,0.553493], 
			[2568.62,2536.67,3.97707], 
			[2583.29,2550.95,0.547749], 
			[2584.73,2552.24,4.59307], 
			[2573.8,2551.79,4.24117], 
			[2578.99,2552.3,0.375725], 
			[2577.11,2552.51,0.331615], 
			[2572.85,2555.05,0.22628], 
			[2573.4,2560.1,0.224537], 
			[2574.21,2562.91,0.177967], 
			[2573.05,2559.9,4.20397], 
			[2572.4,2563.7,4.10248], 
			[2546.29,2462.65,4.17564], 
			[2596.15,2550.15,0.558487], 
			[2599.46,2549.63,0.651611], 
			[2595.86,2548.88,3.93742], 
			[2591.53,2552.07,3.79342], 
			[2636.98,2540.98,0.342583], 
			[2636.63,2539.84,3.73939], 
			[2640.71,2539.22,3.87179], 
			[2640.89,2539.11,0.477032], 
			[2458.14,2570.48,0.237621], 
			[2462.51,2570.99,0.373608], 
			[2458.34,2568.12,3.60873], 
			[2462.56,2569.87,3.77272]
		];


		_patrolPosCity = [
			[2550.86,2464.87,0.133537], 
			[2658.35,2496.76,0], 
			[2497.23,2598.06,0]
		];		


		_vehPosCity = [
			[[2604.64,2536.91,0],102.997],
			[[2582.52,2461.39,0],264.554],
			[[2547.92,2482.4,0],288.545],
			[[2557.45,2546.53,0],266.765],
			[[2560.97,2588.77,0],6.920],
			[[2478.46,2562.04,0],251.808]
		];





		
		

		
		
		//*********************************************************************************
		//
		//                 SECTOR POSITIONS  (END)
		//
		//*********************************************************************************	
	
	
	
	
	
	
	
	
	
	


		//*********************************************************************
		//
		//   	       CREATE UNITS INFO (CAMP)
		//
		//*********************************************************************
		
		//********************************************************
		//          CREATE PERMANENT
		//********************************************************
		{
		
			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "sniper";
			_pos =  _x;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorUnits pushBack _unitInfo;
			
		
		} forEach _permPosCamp;
		
		
		
		//********************************************************
		//          CREATE GUARDS
		//********************************************************
		for "_i" from 1 to _guardTotalCamp do {

		
			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "guard";
			_pos =  selectRandom _guardPosCamp;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorUnits pushBack _unitInfo;
			
			_guardPosCamp = _guardPosCamp - [_pos];
			

		};
		
		
		
		
		//********************************************************
		//          CREATE BUILDING UNITS
		//********************************************************
		for "_i" from 1 to _buildTotalCamp do {


			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "guard";
			_pos =  selectRandom _buildingPosCamp;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorUnits pushBack _unitInfo;
			
			_buildingPosCamp = _buildingPosCamp - [_pos];
			

		};
		
		

		//********************************************************
		//          CREATE VEHICLES
		//********************************************************
		for "_i" from 1 to _vehTotalCamp do {
			
			_unit = objNull;
			_marker = _marker;
			_type = "";
			_role = "";
			_posArray = selectRandom _vehPosCamp;
			_pos =  _posArray select 0;
			_dir = _posArray select 1;
			_vehType = selectRandom _vehArray;
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorVeh pushBack _unitInfo;
			
			_vehArray = _vehArray - [_vehType];
			_vehPosCamp = _vehPosCamp - [_pos];
			
			
			
			_crewCount = [_vehType, false] call BIS_fnc_crewCount;
			
			for "_i" from 1 to _crewCount do {
			
				_unit = objNull;
				_marker = _marker;
				_type = selectRandom _unitArray;
				_role = "vehicle";
				_pos =  _pos;
				_dir = [0,360] call BIS_fnc_randomInt;
				_vehType = _vehType;
				_static = "";
				
				_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
				
				_sectorUnits pushBack _unitInfo;
			
			
			};
			
		
		};





		//*********************************************************************
		//
		//   	       CREATE UNITS INFO (HQ)
		//
		//*********************************************************************
		//********************************************************
		//          CREATE GUARDS
		//********************************************************
		for "_i" from 1 to _guardTotalHQ do {

		
			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "guard";
			_pos =  selectRandom _guardPosHQ;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorUnits pushBack _unitInfo;
			
			_guardPosHQ = _guardPosHQ - [_pos];
			

		};
		
		
		
		
		//********************************************************
		//          CREATE BUILDING UNITS
		//********************************************************
		for "_i" from 1 to _buildTotalHQ do {


			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "guard";
			_pos =  selectRandom _buildingPosHQ;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorUnits pushBack _unitInfo;
			
			_buildingPosHQ = _buildingPosHQ - [_pos];
			

		};
		
		












		//*********************************************************************
		//
		//   	       CREATE UNITS INFO (CITY)
		//
		//*********************************************************************
		
		//********************************************************
		//          CREATE PERMANENT  (SNIPER)
		//********************************************************
		{
		
			_unit = objNull;
			_marker = _marker;
			_type = "LNRD_Luftwaffe_sniper";
			_role = "sniper";
			_pos =  _x;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorUnits pushBack _unitInfo;
			
		
		} forEach _permPosCity;
		
		
		
		//********************************************************
		//          CREATE GUARDS
		//********************************************************
		for "_i" from 1 to _guardTotalCity do {

		
			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "guard";
			_pos =  selectRandom _guardPosCity;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorUnits pushBack _unitInfo;
			
			_guardPosCity = _guardPosCity - [_pos];
			

		};
		
		
		
		
		
		//********************************************************
		//          CREATE BUILDING UNITS
		//********************************************************
		for "_i" from 1 to _buildTotalCity do {


			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "guard";
			_pos =  selectRandom _buildingPosCity;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorUnits pushBack _unitInfo;
			
			_buildingPosCity = _buildingPosCity - [_pos];
			

		};
		
		
		

		
		//********************************************************
		//          CREATE PATROL UNITS
		//********************************************************
		
		_patrolGrpNum = 0;
		_patrolNum = _patrolTotalCity;
		
		for "_i" from 1 to _patrolTotalCity do {
		
			_position =  selectRandom _patrolPosCity;
			_patrolPosCity = _patrolPosCity - [_position];
			
			for "_i" from 1 to _patrolSizeCity do {
			
				_unit = objNull;
				_marker = _marker;
				_type = selectRandom _unitArray;
				_role = "patrol";
				_pos = _position;
				_dir = [0,360] call BIS_fnc_randomInt;
				_vehType = "";
				_static = "";
				_patrolGrpNum = _patrolGrpNum;
			
				_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
				
				_sectorUnits pushBack _unitInfo;
				


			};
			
			_patrolGrpNum = _patrolGrpNum + 1;
			
		};
		
		
		
		
		
		//********************************************************
		//          CREATE VEHICLES
		//********************************************************
		for "_i" from 1 to _vehTotalCity do {

			_unit = objNull;
			_marker = _marker;
			_type = "";
			_role = "";
			_posArray = selectRandom _vehPosCity;
			_pos =  _posArray select 0;
			_dir = _posArray select 1;
			_vehType = selectRandom _vehArray;
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorVeh pushBack _unitInfo;
			
			_vehArray = _vehArray - [_vehType];
			_vehPosCity = _vehPosCity - [_posArray];
			
			
			
			_crewCount = [_vehType, false] call BIS_fnc_crewCount;
			
			for "_i" from 1 to _crewCount do {
			
				_unit = objNull;
				_marker = _marker;
				_type = selectRandom _unitArray;
				_role = "vehicle";
				_pos =  _pos;
				_dir = [0,360] call BIS_fnc_randomInt;
				_vehType = _vehType;
				_static = "";
				
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
				
				_sectorUnits pushBack _unitInfo;
			
			
			};
			
		
		};





		//********************************************************
		//          CREATE STATICS
		//********************************************************

		{


			_static = _x;
	
			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "static";
			_pos =  getPos _static;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_patrolGrpNum = -1;
				
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,str _static,_patrolGrpNum];
	
			_sectorUnits pushBack _unitInfo;	

		} forEach _sectorStatics;




			
			
			
			
			




		//********************************************************
		//             CALCULATE POPULATION TOTALS
		//********************************************************

		_startPop = (count _sectorUnits) + (count _currentUnits);
		_currentPop = _startPop;
		
		
		


			
			
		//********************************************************
		//
		//             SAVE MARKER VARIABLES
		//[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_captured(True/False)];
		//********************************************************
		
		_sectorInfo = missionProfileNamespace getVariable [_marker,[_currentPop,_startPop,_sectorStatics,[],_sectorUnits,_sectorVeh,_patrolNum,getMarkerPos _marker,false]];
		
		_load_currentPop = _sectorInfo select 0;
		_load_startPop = _sectorInfo select 1;
		_load_sectorUnits = _sectorInfo select 4;
		_load_sectorVeh = _sectorInfo select 5;
		_load_patrolNum = _sectorInfo select 6;
		_load_markerPos = _sectorInfo select 7;
		_load_captured = _sectorInfo select 8;
		
		
		missionProfileNamespace setVariable [_marker, [_load_currentPop,_load_startPop,_sectorStatics,[],_load_sectorUnits,_load_sectorVeh,_load_patrolNum,_load_markerPos,_load_captured]];





		//********************************************************
		//
		//             CHECK IF CAPTURED
		//
		//********************************************************

		if ( _load_captured ) then {
		
			_marker setMarkerColor "colorBLUFOR";
			
		} else {
		
			OL_sector_array pushBack _marker;
			
		};








































};