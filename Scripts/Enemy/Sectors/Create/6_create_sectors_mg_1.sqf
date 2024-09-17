/*


[] execVM "Scripts\Enemy\Sectors\2_create_sectors_radar.sqf";



VARIABLES:

MARKER:

[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_patrolNum,_captured(True/False)];


UNIT:
_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolNum];


*/






if (isServer) then {


	params ["_marker","_centerObject","_pos","_intelDataArray"];


	
	//*********************************************************************************
	//
	//                 ARTY MARKER INFO
	//
	//*********************************************************************************		
	
	_marker = "mg_mrkr_1";
	_size = 100;



	_mgPosMarkers = allMapMarkers select { (_x select [0, (count "mg_pos_mrkr_1")]) isEqualTo "mg_pos_mrkr_1" ;};

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
	//                 CREATE MORTAR OBJECTIVE
	//
	//*********************************************************************************	
	
	_sectorStatics = [];
	_sectorFlak = [];
	_sectorUnits = [];
	_sectorVeh = [];
	_patrolNum = 1;
	
	
	
	
	
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


	_unitPositions = [
		[-1.34563,0.756775,0.00151443],
		[-4.87976,1.76611,0.00150681],
		[3.24146,3.06543,-0.0321159]
	];
	
	
	

	//*********************************************************************
	//
	//   	       OBJECTS ARRAY
	//
	//*********************************************************************
	_objectsArray = [
		["LIB_MG42_Lafette_Deployed",[-1.56177,-0.175049,-0.075016],271.359,1,0,[-0.0272491,1.14868],"","",true,false], 
		["Land_BagFence_Short_F",[-1.72595,1.10938,-0.000946045],0,1,0,[-1.14893,0],"","",true,false], 
		["LIB_GerRadio",[-0.816162,2.00537,0],96.4445,1,0,[0.196042,-1.73505],"","",true,false], 
		["Land_BagFence_Long_F",[-2.38348,-0.212891,-0.0309753],89.4201,1,0,[-0.0116307,-1.14887],"","",true,false], 
		["Land_BagFence_Short_F",[-1.76105,-1.89429,0.00992584],214.213,1,0,[0.95015,0.646069],"","",true,false], 
		["Land_BagFence_Long_F",[-1.12817,2.33521,-0.0419312],89.4202,1,0,[-0.0176741,-1.74599],"","",true,false], 
		["Land_BagFence_Long_F",[2.31238,1.28857,-0.0250511],89.4201,1,0,[-0.0116307,-1.14887],"","",true,false], 
		["Land_CamoNet_EAST",[1.34363,2.45483,-0.954899],91.2233,1,0,[0.0372871,-1.74568],"","",true,false], 
		["Land_BagFence_Long_F",[2.35309,-1.51221,-0.0309715],89.4201,1,0,[-0.0116307,-1.14887],"","",true,false], 
		["LIB_BasicWeaponsBox_GER",[1.74518,2.64233,-0.00330353],267.653,1,0,[0.071303,1.74483],"","",true,false], 
		["Land_BagFence_Long_F",[0.352661,-3.79419,-0.0227356],45.8006,1,0,[-0.801039,-0.823741],"","",true,false], 
		["LIB_B_Betulahumilis",[-2.52936,2.57373,0],66.4018,1,0,[-0.69917,-1.60014],"","",true,false], 
		["Land_BagFence_Short_F",[2.9339,-3.46802,-0.0136719],42.5528,1,0,[-0.846416,-0.777042],"","",true,false], 
		["Land_BagFence_Long_F",[2.2655,4.00464,-0.0461998],89.4202,1,0,[-0.0176741,-1.74599],"","",true,false], 
		["Land_BagFence_Short_F",[-1.17993,4.46704,-0.0289726],88.2848,1,0,[-0.0522786,-1.74529],"","",true,false], 
		["Land_BagFence_Short_F",[1.49829,-4.99829,-0.0139236],43.6122,1,0,[-0.831907,-0.792556],"","",true,false], 
		["LIB_WeaponsBox_Big_GER",[1.62653,5.11865,-1.52588e-005],3.28512,1,0.0483875,[-1.7548,-0.114824],"","",true,false], 
		["LIB_B_Hedgerows_New",[5.10138,2.21387,0.104305],94.6801,1,0,[0.14251,-1.74026],"","",true,false], 
		["Land_I44_Buildings_Bush",[-3.21088,4.30347,0],0,1,0,[-1.74608,0],"","",true,false], 
		["Land_BagFence_Short_F",[2.1825,5.42578,-0.0287209],82.1941,1,0,[-0.237219,-1.72991],"","",true,false], 
		["I44_Vegetation_MB_B_Ulmus",[-0.956116,-5.8645,-3.8147e-006],232.636,1,0,[0.697312,0.913213],"","",true,false], 
		["Land_BagFence_Long_F",[-1.96552,6.40381,-0.043972],71.1708,1,0,[-0.5637,-1.65269],"","",true,false], 
		["LIB_MV_Fallentree1_w",[-6.6814,2.09912,0],167.069,1,0,[1.70183,-0.390833],"","",true,false], 
		["LIB_B_Betulahumilis",[-3.16254,6.41797,-7.62939e-006],66.4018,1,0,[-0.69917,-1.60014],"","",true,false], 
		["LIB_MG42_Lafette_Deployed",[-0.710754,7.62158,-0.0750313],340.16,1,0,[-1.64242,0.592759],"","",true,false], 
		["Land_BagFence_Short_F",[0.70343,7.69263,-0.0255699],118.719,1,0,[0.839214,-1.5314],"","",true,false], 
		["Land_BagFence_Short_F",[0.251282,7.8313,-0.0272903],69.6928,1,0,[-0.606148,-1.63761],"","",true,false], 
		["Land_BagFence_Long_F",[2.80371,7.40942,-0.0408363],117.73,1,0,[0.812662,-1.54564],"","",true,false], 
		["Land_BagFence_Long_F",[-1.21649,8.05396,-0.0168762],158.901,1,0,[1.62908,-0.628731],"","",true,false], 
		["Land_BagFence_Long_F",[8.25891,0.812988,-0.00603485],9.11781,1,0,[-1.13442,-0.182089],"","",true,false], 
		["LIB_T_Alnus2s",[-2.66388,-4.12109,-7.62939e-006],288.441,1,0,[-0.363474,1.08995],"","",true,false], 
		["LIB_MG42_Lafette_Deployed",[8.46167,-0.746094,-0.0750084],98.4182,1,0,[0.168222,-1.13655],"","",true,false], 
		["Land_BagFence_Short_F",[8.51324,-2.12866,0.000545502],184.303,1,0,[1.14569,0.0862112],"","",true,false], 
		["Land_BagFence_Short_F",[1.36786,8.8811,-0.0255699],118.719,1,0,[0.839214,-1.5314],"","",true,false], 
		["I44_Vegetation_MB_B_Ulmus",[8.80579,2.02051,3.8147e-006],153.476,1,0,[1.56239,-0.779951],"","",true,false], 
		["Land_BagFence_Long_F",[9.40216,-0.796143,0.0293999],278.797,1,0,[-0.175726,1.13542],"","",true,false], 
		["LIB_B_Sambucus",[4.34296,7.93677,0],283.806,1,0,[-0.416799,1.69566],"","",true,false], 
		["LIB_B_Betulahumilis",[9.52173,-3.104,3.8147e-006],339.581,1,0,[-1.07675,0.40089],"","",true,false], 
		["LIB_B_Betulahumilis",[0.690491,9.96704,7.62939e-006],161.368,1,0,[1.65461,-0.558017],"","",true,false], 
		["CUP_kmen_1_buk",[11.4288,0.224854,-0.0953484],282.11,1,0,[-0.241068,1.12337],"","",true,false], 
		["LIB_B_Betulahumilis",[10.8727,1.09009,3.8147e-006],66.3963,1,0,[-0.460092,-1.05283],"","",true,false], 
		["LIB_B_Betulahumilis",[-7.82959,9.34229,-3.8147e-006],66.4018,1,0,[-0.69917,-1.60014],"","",true,false], 
		["LIB_T_Acer2s",[6.42157,6.59644,-3.8147e-006],108.935,1,0,[0.566755,-1.65164],"","",true,false], 
		["LIB_T_Betula2s",[8.79535,-3.98755,0],0,1,0,[-1.14893,0],"","",true,false]
	];	
	
	
	
	
	
	
	
	//*********************************************************************
	//
	//   	       SPAWN COMPOSITION
	//
	//*********************************************************************
	_compositionArray = [_pos, _dir, _objectsArray, 0] call BIS_fnc_objectsMapper;




	//*********************************************************************
	//
	//   	       GET ARTILLERY AND CENTER OBJECT
	//
	//*********************************************************************
	_mortars = [];
	
	{
		_object = _x;


		if ( typeOf _object == "LIB_GerRadio") then {
		
			_centerObject = _object;

		};
		
	
		if ( typeOf _object == "LIB_MG42_Lafette_Deployed") then {
		
			_sectorStatics pushBack _object;

		};


		if ( typeOf _object == "Land_CamoNet_EAST") then {
		
			_object enableSimulationGlobal false;
			_object allowDamage false;

		};


	} forEach _compositionArray;
	
	
	
	
	
	

	
	//********************************************************
	//          CREATE PERMANENT
	//********************************************************
	{
	
		_unit = objNull;
		_marker = _marker;
		_type = selectRandom _unitArray;
		_role = "middle";
		_pos = _centerObject modelToWorld _x;
		_dir = [0,360] call BIS_fnc_randomInt;
		_vehType = "";
		_static = "";
		_patrolGrpNum = -1;
		
		_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
		
		_sectorUnits pushBack _unitInfo;
		
	
	} forEach _unitPositions;
	
	
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
			
		_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];

		_sectorUnits pushBack _unitInfo;	

	} forEach _sectorStatics;


	
	
	
	

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
	
	
	
	private _intelDataArrayAll = missionProfileNamespace getVariable "OL_intel_array";

	{
		private _intelMarkerSelect = _x select 2;
					
		if ( _intelMarkerSelect == _marker ) then {
						
			_intelDataArray = _x;

		};
				
	} forEach _intelDataArrayAll;

	private _intelMarker = _intelDataArray select 2;
	private _assignedMarker = _intelDataArray select 3;
	private _position = _intelDataArray select 4;
	private _captured = _intelDataArray select 5;


	if ( _captured ) then {

		[_intelMarker, (getMarkerPos _intelMarker)] call BIS_fnc_taskSetDestination;
		_intelMarker setMarkerAlpha 1;

		
		switch (true) do {

			case (_intelMarker == "mortar_mrkr_1"): {
				[_intelMarker, 
						[
						"Capture the enemy mortar nest.<br/><br/>NOTE: Location can be found by finding Intel at the AA sites. The enemy will be able to call in mortar support until it is captured.",
						"Capture Mortars",
						_intelMarker
						]
					] call BIS_fnc_taskSetDescription;
			};
			
			case ( (_intelMarker == "mg_mrkr_1") || (_intelMarker == "mg_mrkr_2") || (_intelMarker == "mg_mrkr_3") ): {
				[_intelMarker, 
						[
						"Capture the enemy machine gun nest.",
						"Capture MG Nest",
						_intelMarker
						]
					] call BIS_fnc_taskSetDescription;
			};
			
			
			default { };

		};
		
	};	



	
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