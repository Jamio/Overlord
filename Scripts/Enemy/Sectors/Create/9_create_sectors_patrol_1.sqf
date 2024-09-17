/*


[] execVM "Scripts\Enemy\Sectors\2_create_sectors_radar.sqf";



VARIABLES:

MARKER:

[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_patrolNum,_captured(True/False)];


UNIT:
_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolNum];


*/






if (isServer) then {


	params ["_marker","_centerObject","_pos"];
	

	
	//*********************************************************************************
	//
	//                 ARTY MARKER INFO
	//
	//*********************************************************************************		
	
	_marker = "patrol_mrkr_1";
	_size = 100;



	_mgPosMarkers = allMapMarkers select { (_x select [0, (count "patrol_pos_mrkr_1")]) isEqualTo "patrol_pos_mrkr_1" ;};

	if ( isNil { missionProfileNamespace getVariable _marker } ) then {
	
		_pos = getMarkerPos (selectRandom _mgPosMarkers);

	} else {
	
		_sectorInfo = missionProfileNamespace getVariable _marker;
		_pos = _sectorInfo select 7;

	};	
	

	_mrkrPos = getMarkerPos "dropzone_1";
	_dir = (_pos getDir _mrkrPos) + 90;
	_arty = [];

	_marker setMarkerPos _pos;
	_marker setMarkerDir _dir;
	
	
	
	
	OL_sector_array_small pushBack _marker;
	publicVariable "OL_sector_array_small";
	
	
	_marker setMarkerAlpha 0;
	
	
	


	
	//*********************************************************************************
	//
	//                 CREATE PATROL OBJECTIVE
	//
	//*********************************************************************************	
	
	_sectorStatics = [];
	_sectorFlak = [];
	_sectorUnits = [];
	_sectorVeh = [];
	_patrolNum = 1;
	
	
	_patrolTotal = [1,1] call BIS_fnc_randomInt;
	_patrolSize = [8,12] call BIS_fnc_randomInt;
	
	
	
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



	
	
	



	//********************************************************
	//          CREATE PATROL UNITS
	//********************************************************
		
	_patrolGrpNum = 0;
	_patrolNum = _patrolTotal;
		
	for "_i" from 1 to _patrolTotal do {
	
		_position =  getMarkerPos _marker;
		
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
	//             CALCULATE POPULATION TOTALS
	//********************************************************

	_startPop = (count _sectorUnits);
	_currentPop = _startPop;
	
	
	


			
	//********************************************************
	//
	//             SAVE MARKER VARIABLES
	//[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_captured(True/False)];
	//********************************************************
	
	_sectorInfo = missionProfileNamespace getVariable [_marker,[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_patrolNum,getMarkerPos _marker,false]];
	
	_load_currentPop = _sectorInfo select 0;
	_load_startPop = _sectorInfo select 1;	
	_load_sectorUnits = _sectorInfo select 4;
	_load_patrolNum = _sectorInfo select 6;
	_load_markerPos = _sectorInfo select 7;
	_load_captured = _sectorInfo select 8;
	
	missionProfileNamespace setVariable [_marker, [_load_currentPop,_load_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_load_patrolNum,_load_markerPos,_load_captured]];


	//********************************************************
	//
	//             INTEL MARKER (UPDATE)
	//
	//********************************************************
	
	
	_dir = _load_markerPos getDir (getMarkerPos "dropzone_1");
	_marker setMarkerPos _load_markerPos;
	_marker setMarkerDir (_dir + 90);	
	
	
	





	//********************************************************
	//
	//             CHECK IF CAPTURED
	//
	//********************************************************
	
	if ( _load_captured ) then {
	
		_marker setMarkerAlpha 1;
		_marker setMarkerColor "colorBLUFOR";
		
	};			


































};