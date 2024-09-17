/*


[] execVM "Scripts\Enemy\Sectors\2_create_sectors_radar.sqf";



VARIABLES:

MARKER:

[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_patrolNum,_captured(True/False)];


UNIT:
_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolNum];


*/






if (isServer) then {


	params ["_marker","_size","_pos","_mrkrPos","_dir","_arty","_marker","_centerObject","_intelDataArray"];
	
	
	//*********************************************************************************
	//
	//                 ARTY MARKER INFO
	//
	//*********************************************************************************		
	
	_marker = "arty_mrkr_1";
	_size = 200;


	
	_artyPosMarkers = allMapMarkers select { (_x select [0, (count "arty_pos_mrkr")]) isEqualTo "arty_pos_mrkr" ;};
	
	
	
	if ( isNil { missionProfileNamespace getVariable _marker } ) then {
	
		_pos = getMarkerPos (selectRandom _artyPosMarkers);

	} else {
	
		_sectorInfo = missionProfileNamespace getVariable _marker;
		_pos = _sectorInfo select 7;

	};

	
	_mrkrPos = getMarkerPos "dropzone_1";
	_dir = _pos getDir _mrkrPos;
	
	_arty = [];
	
	OL_sector_array_small pushBack _marker;
	publicVariable "OL_sector_array_small";
	
	OL_arty_sector_array pushBack _marker;
	publicVariable "OL_arty_sector_array";
	

	_marker setMarkerAlpha 0;
	_marker setMarkerPos _pos;
	_marker setMarkerDir _dir;		
	
	
	
	_sectorStatics = [];
	_sectorFlak = [];
	_sectorUnits = [];
	_sectorVeh = [];
	_patrolNum = 0;
	



	
	
	//*********************************************************************************
	//
	//                 CREATE ARTY OBJECTIVE
	//
	//*********************************************************************************	
	
	

	
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
		[-13.5938,31.9731,-0.168106],
		[-20.4565,46.189,-0.294125],
		[-29.2017,28.3532,-0.153976],
		[-23.3448,-0.0128021,0.0124016],
		[-5.90076,7.50209,0.0367355],
		[-3.05212,7.16624,0.0333328],
		[-6.19226,-2.52715,0.167305],
		[-11.7197,-2.74614,0.169918]
	];
	

	//*********************************************************************
	//
	//   	       OBJECTS ARRAY
	//
	//*********************************************************************
	_objectsArray = [
		["Land_I44_Object_Tent_Zeltbahn_3",[3.72095,5.69788,-5.72205e-005],216.713,1,0,[1.69447,1.26378],"","",true,false], 
		["Land_WoodPile_F",[6.84875,5.47217,0.0035553],295.531,1,0,[-0.911225,1.90719],"","",true,false], 
		["LIB_BasicWeaponsBox_GER",[0.793945,-10.0577,-0.00231934],0.000773026,1,0,[-1.37929,-0.000153673],"","",true,false], 
		["Land_WoodenLog_F",[5.61157,9.06885,0.000267029],238.374,1,0,[0.918923,1.49108],"","",true,false], 
		["LIB_Mine_Ammo_Box_Ger",[-0.116211,-10.7646,-0.00583649],300.562,1,0,[-0.701722,1.18723],"","",true,false], 
		["LIB_BasicAmmunitionBox_GER",[-0.340332,-11.5206,-0.00583649],273.328,1,0,[-0.0803966,1.37641],"","",true,false], 
		["Land_I44_Object_Tent_Zeltbahn_8",[11.8202,4.76709,0.0263252],124.628,1,0,[1.20129,-1.7393],"","",true,false], 
		["Land_WoodenLog_F",[8.0824,9.56885,0.000267029],243.415,1,0,[0.78453,1.56576],"","",true,false], 
		["Campfire_burning_F",[6.65613,10.7762,0.0144119],0,1,0,[-1.74608,0],"","",true,false], 
		["Land_WoodenLog_F",[4.81262,11.8789,0.000270844],238.374,1,0,[0.918846,1.49103],"","",true,false], 
		["LIB_WeaponsBox_Big_GER",[-0.383179,-13.4772,0.00113297],175.203,1,0,[1.3736,-0.121424],"","",true,false], 
		["Land_WoodenLog_F",[7.48242,12.4994,0.000267029],212.374,1,0,[1.47753,0.935186],"","",true,false], 
		["CamoNet_BLUFOR_open_F",[6.01367,-14.952,0.0100822],4.95771,1,0,[-0.915547,-0.0794257],"","",true,false], 
		["LIB_Kfz1_MG42_sernyt",[16.9961,1.26172,-0.00830078],255.166,1,0,[0.713464,2.03064],"","",true,false], 
		["LIB_leFH18",[-17.1387,4.9458,-0.07341],283.497,1,0,[-0.493477,2.05509],"","",true,false], 
		["Land_I44_Object_Tent_Zeltbahn_16",[12.6478,13.1239,0.000591278],78.4956,1,0,[-0.348347,-1.71102],"","",true,false], 
		["Land_I44_Object_Tent_Zeltbahn_4",[5.63257,18.4436,-0.027153],0,1,0,[-1.60827,0],"","",true,false], 
		["Land_fort_artillery_nest",[-21.8251,5.21814,-0.0220184],280.283,1,0,[-0.377429,2.07949],"","",true,false], 
		["Land_WoodenTable_large_F",[8.59998,-17.6652,0.000110626],275.279,1,0,[-0.0845188,0.915701],"","",true,false], 
		["Land_I44_Object_Radio_G_20WSd",[8.56799,-17.9287,8.01086e-005],186.871,1,0,[0.912385,0.109955],"","",true,false], 
		["LIB_leFH18",[-13.0151,-16.736,-0.074131],265.113,1,0,[0.0782888,0.915645],"","",true,false], 
		["Land_fort_artillery_nest",[-17.597,-17.9811,0.00762558],261.898,1,0,[0.129535,0.909812],"","",true,false], 
		["Land_fortified_nest_big",[4.0752,-24.8671,0.0428429],6.0522,1,0,[-0.913863,-0.0969009],"","",true,false], 
		["LIB_leFH18",[-5.08862,23.2153,-0.0733871],309.015,1,0,[-1.0126,1.24973],"","",true,false], 
		["Land_fort_artillery_nest",[-9.12256,25.4934,-0.05513],305.799,1,0,[-0.940905,1.30455],"","",true,false], 
		["LIB_Static_OpelBlitz_Radio",[13.5243,-24.2341,0],7.83778,1,0,[-1.18369,-0.162963],"","",true,false]
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
	{
		_object = _x;

	
		if ( _object isKindOf "StaticWeapon") then {
		
			_arty pushBack _object;
			_object addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];

		};
	
		if ( typeOf _object == "LIB_Static_OpelBlitz_Radio") then {
		
			_centerObject = _object;

		};
		
	} forEach _compositionArray;
	
	
	
	
	
	
	//*********************************************************************
	//
	//   	       SPAWN ARTILLERY UNITS
	//
	//*********************************************************************
	
	
	{
	
		_static = _x;
		
		
		OL_arty_array pushBack _static;
		publicVariable "OL_arty_array";
		

		_unit = objNull;
		_marker = _marker;
		_type = selectRandom _unitArray;
		_role = "static";
		_pos =  getPos _static;
		_dir = [0,360] call BIS_fnc_randomInt;
		_vehType = "";
		_static = _static;
		_patrolGrpNum = -1;
		
		_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
		_unit setVariable ["OL_enemy_unitInfo", _unitInfo];
		
		_sectorUnits pushBack _unitInfo;		
		
		
		[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
		{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 	
		
		
		
		//*****************************************************************************
		//             MP KILLED EVENT HANDLER
		//*****************************************************************************
		[_unit] spawn OL_eh_enemy_arty_killed;

	
	} forEach _arty;	
	
	
	

	
		//*********************************************************************
		//
		//   	       CREATE UNITS INFO 
		//
		//*********************************************************************
		
		//********************************************************
		//          CREATE PERMANENT
		//********************************************************
		{
		
			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "guard";
			_pos = _centerObject modelToWorld _x;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
			
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_sectorUnits pushBack _unitInfo;
			
		
		} forEach _unitPositions;
		
		



		
		
		
		

	



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
		_marker setMarkerDir _dir;	
		
		
		
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