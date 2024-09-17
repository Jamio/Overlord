/*


[] execVM "Scripts\Enemy\Sectors\2_create_sectors_radar.sqf";



VARIABLES:

MARKER:

[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_patrolNum,_captured(True/False)];


UNIT:
_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolNum];


*/






if (isServer) then {


	params ["_marker"];
	
	



	
	
	//*********************************************************************************
	//
	//                 CREATE RADAR OBJECTIVE
	//
	//*********************************************************************************	
	
	_marker = "radar_mrkr";
	_size = 200;

	
	_sectorStatics = [];
	_sectorFlak = [];
	_sectorUnits = [];
	_sectorVeh = [];
		
		

	//********************************************************
	//         UNIT TOTALS   (
	//********************************************************
	_guardTotal = [10,10] call BIS_fnc_randomInt;
	_buildTotal = [10,10] call BIS_fnc_randomInt;
	_patrolTotal = [1,1] call BIS_fnc_randomInt;
	_patrolSize = [4,4] call BIS_fnc_randomInt;
	_vehTotal = [1,1] call BIS_fnc_randomInt;


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
		"LIB_Kfz1_MG42_sernyt"
	];




		//********************************************************
		//         CURRENT POPULATION
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
		//            MILITARY City
		//********************************************************
		
				
		_permPos = [
			[2899.66,3718.44,7.24047], 
			[2907.47,3731.9,7.23166], 
			[2873.01,3732.95,8.08225], 
			[2869.62,3735.4,8.08191]
		];
		
		
		_guardPos = [
			[2890.35,3705.27,0], 
			[2918.9,3719.98,0], 
			[2896.77,3751.94,0], 
			[2875.65,3749.62,0], 
			[2865.75,3740.66,4.57764e-005], 
			[2878.26,3727.4,1.29202], 
			[2904.4,3718.14,3.43323e-005], 
			[2908.82,3727.15,0], 
			[2910.07,3729.62,0], 
			[2886.2,3721.09,0], 
			[2879.56,3721.13,0], 
			[2866.78,3731.48,0], 
			[2864.04,3732.88,0], 
			[2869.13,3747.66,7.62939e-006], 
			[2882.88,3750.68,4.57764e-005], 
			[2886.65,3748.54,4.57764e-005], 
			[2905.54,3720.13,4.57764e-005], 
			[2882.95,3722.16,4.57764e-005], 
			[2873.86,3723.5,4.57764e-005], 
			[2860.2,3720.08,0], 
			[2866.45,3740.09,4.57764e-005], 
			[2876.27,3749.43,8.15206], 
			[2887.39,3743.01,8.22981], 
			[2906.53,3728.66,7.23402], 
			[2884.27,3727,8.01533]
		];
		
		
		_buildingPos = [
			[2879.86,3738.04,0.273552], 
			[2883.41,3743.8,0.395367], 
			[2892.69,3734.04,0.798832], 
			[2895.21,3723.44,0.479], 
			[2893.34,3725.34,0.665421], 
			[2896.94,3726.17,0.334587], 
			[2897.6,3733.27,0.344959], 
			[2899.24,3732.66,0.193752], 
			[2904.01,3731.42,0.142155], 
			[2900.2,3722.54,0.0368729], 
			[2876.13,3734.09,0.25668], 
			[2886.45,3727.67,0.988056], 
			[2897.91,3727.04,3.96838], 
			[2903.08,3725.03,3.94831], 
			[2906.3,3732.92,3.90238], 
			[2906.65,3730.02,3.85653], 
			[2888.74,3739.39,4.81251], 
			[2886.21,3744.05,4.90604], 
			[2874,3743.55,4.72647], 
			[2872.43,3740.14,4.81699], 
			[2875.15,3731.54,4.72451], 
			[2879.8,3730.52,4.70116], 
			[2883.35,3727.41,4.69536], 
			[2896.89,3720.39,4.02188], 
			[2898.4,3719.15,3.91187], 
			[2904.32,3733.72,3.89909]
		];


		_patrolPos = [
			[2840.08,3789.42,7.62939e-006]
		];		


		_vehPos = [
			[[2909.32,3740.85,-1.14441e-005],53.229],
			[[2898.61,3712.12,-3.8147e-006],158.170],
			[[2860.22,3734.54,-1.14441e-005],205.885]
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
			
		
		} forEach _permPos;
		
		


		//********************************************************
		//          CREATE GUARDS
		//********************************************************
		for "_i" from 1 to _guardTotal do {

		
			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "guard";
			_pos =  selectRandom _guardPos;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorUnits pushBack _unitInfo;
			
			_guardPos = _guardPos - [_pos];
			

		};
		
		
		
		
		
		//********************************************************
		//          CREATE BUILDING UNITS
		//********************************************************
		for "_i" from 1 to _buildTotal do {


			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "guard";
			_pos =  selectRandom _buildingPos;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorUnits pushBack _unitInfo;
			
			_buildingPos = _buildingPos - [_pos];
			

		};
		
		
		

		
		//********************************************************
		//          CREATE PATROL UNITS
		//********************************************************
		
		_patrolGrpNum = 0;
		_patrolNum = _patrolTotal;
		
		for "_i" from 1 to _patrolTotal do {
		
			_position =  selectRandom _patrolPos;
			_patrolPos = _patrolPos - [_position];
			
			for "_i" from 1 to _patrolSize do {
			
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
		for "_i" from 1 to _vehTotal do {

			_unit = objNull;
			_marker = _marker;
			_type = "";
			_role = "";
			_posArray = selectRandom _vehPos;
			_pos =  _posArray select 0;
			_dir = _posArray select 1;
			_vehType = selectRandom _vehArray;
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorVeh pushBack _unitInfo;
			
			_vehArray = _vehArray - [_vehType];
			_vehPos = _vehPos - [_posArray];
			
			
			
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
		
			_marker setMarkerAlpha 1;
			_marker setMarkerColor "colorBLUFOR";
			
		} else {
		
			OL_sector_array pushBack _marker;
			
		};
		
		
			
			















































};