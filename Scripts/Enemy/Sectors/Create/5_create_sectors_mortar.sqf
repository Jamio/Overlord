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
	
	_marker = "mortar_mrkr_1";
	_size = 100;



	_mortarPosMarkers = allMapMarkers select { (_x select [0, (count "mortar_pos_mrkr")]) isEqualTo "mortar_pos_mrkr" ;};
	
	
	
	if ( isNil { missionProfileNamespace getVariable _marker } ) then {
	
		_pos = getMarkerPos (selectRandom _mortarPosMarkers);

	} else {
	
		_sectorInfo = missionProfileNamespace getVariable _marker;
		_pos = _sectorInfo select 7;

	};	
	
	

	_mrkrPos = getMarkerPos "dropzone_1";
	_dir = (_pos getDir _mrkrPos) + 90;
	_arty = [];

	_marker setMarkerPos _pos;
	_marker setMarkerDir (_pos getDir _mrkrPos);
	
	
	
	
	OL_sector_array_small pushBack _marker;
	publicVariable "OL_sector_array_small";
		
	OL_arty_sector_array pushBack _marker;
	publicVariable "OL_arty_sector_array";
	
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
		[3.19135,-5.37842,-0.000221252],
		[-7.58064,-4.06366,-0.0332947],
		[-1.93372,-0.437927,-0.000228882]
	];
	

	//*********************************************************************
	//
	//   	       OBJECTS ARRAY
	//
	//*********************************************************************
	_objectsArray = [
		["Land_CamoNetVar_EAST",[-1.46497,-1.7417,-0.00377655],80.4021,1,0,[0.191586,1.13283],"","",true,false], 
		["LIB_MG42_Lafette_Deployed",[-3.56891,0.446289,-0.075016],265.651,1,0,[-0.087138,-1.1456],"","",true,false], 
		["LIB_GerRadio",[-3.94818,-1.38208,0],85.5293,1,0,[0.0895676,1.14541],"","",true,false], 
		["Land_BagFence_Long_F",[-4.32898,-0.383301,0.0296555],83.7468,1,0,[0.125159,1.14208],"","",true,false], 
		["LIB_BasicWeaponsBox_GER",[-3.32446,-2.8916,-0.00232697],90.1173,1,0,[-0.00229809,1.14911],"","",true,false], 
		["Land_BagFence_Long_F",[0.981812,4.83813,-0.00141525],358.471,1,0,[1.1485,-0.0306669],"","",true,false], 
		["Land_BagFence_Short_F",[-1.146,4.82251,-9.15527e-005],2.36687,1,0,[1.14793,0.047454],"","",true,false], 
		["Land_BagFence_Short_F",[-4.53741,1.99219,-0.0196342],269.772,1,0,[-0.00458018,-1.1489],"","",true,false], 
		["Land_BagFence_Long_F",[-4.13049,-3.04346,-0.0309296],266.132,1,0,[-0.0775236,-1.14629],"","",true,false], 
		["LIB_WeaponsBox_Big_GER",[-0.225159,-5.8811,3.8147e-006],5.67871,1,0,[2.10631,0.206847],"","",true,false], 
		["Land_BagFence_Long_F",[-2.84515,5.95581,-0.00719452],234.175,1,0,[-0.241766,-0.334909],"","",true,false], 
		["Land_BagFence_Long_F",[-5.40936,3.88135,-0.0261116],236.208,1,0,[-0.639054,-0.954859],"","",true,false], 
		["LIB_B_Betulahumilis",[-5.72498,-3.22217,0],66.3963,1,0,[0.460084,1.05281],"","",true,false], 
		["Land_BagFence_Long_F",[-5.27496,-4.54468,-0.00141525],358.471,1,0,[1.1485,-0.0306669],"","",true,false], 
		["LIB_BasicWeaponsBox_GER",[-1.85541,-6.88062,-0.00231934],359.999,1,0,[2.1134,-3.27678e-006],"","",true,false], 
		["LIB_BasicAmmunitionBox_GER",[-2.85925,-6.81445,-0.00584412],0.00441636,1,0,[2.11357,0.000259643],"","",true,false], 
		["Land_BagFence_Long_F",[0.268738,-7.49292,-0.00162888],358.47,1,0,[2.11263,-0.0564561],"","",true,false], 
		["LIB_B_Sambucus",[-6.88751,2.39819,0],283.81,1,0,[0.274275,-1.11571],"","",true,false], 
		["Land_BagFence_Long_F",[-2.258,-7.56152,-0.00163269],358.47,1,0,[2.11263,-0.0564561],"","",true,false], 
		["Land_BagFence_Short_F",[-3.89679,7.23511,0.00445175],52.0385,1,0,[0.254084,0.325663],"","",true,false], 
		["LIB_B_Betulahumilis",[-7.45374,-3.13159,0],66.3963,1,0,[0.460084,1.05281],"","",true,false], 
		["Land_BagFence_Short_F",[-6.6557,5.62451,0.00649643],52.0385,1,0,[0.254084,0.325663],"","",true,false], 
		["Land_BagFence_Short_F",[-7.65131,-4.61841,-0.000526428],178.732,1,0,[-1.14863,0.0254376],"","",true,false], 
		["LIB_GrWr34_g",[-5.69971,7.03931,-0.0776978],322.829,1,0,[0.329921,-0.250835],"","",true,false], 
		["Land_BagFence_Long_F",[-5.16071,-7.59302,-0.00162888],358.47,1,0,[2.11263,-0.0564561],"","",true,false], 
		["LIB_T_Alnus2s",[1.3396,5.93042,0],288.444,1,0,[0.13068,-0.391837],"","",true,false], 
		["Land_BagFence_Round_F",[-5.35333,8.87915,-0.00236893],197.571,1,0,[-0.393781,-0.1247],"","",true,false], 
		["LIB_B_Hedgerows_New",[-2.922,-9.5061,0.12067],178.31,1,0,[-2.11247,0.0623438],"","",true,false], 
		["Land_BagFence_Round_F",[-7.58545,7.59863,0.00866699],96.1614,1,0,[-0.0443337,0.410667],"","",true,false], 
		["LIB_GrWr34_g",[-8.34576,-6.32593,-0.0771828],270.253,1,0,[0.00906099,-2.11122],"","",true,false], 
		["Land_BagFence_Short_F",[-7.44037,-7.66992,1.52588e-005],178.731,1,0,[-2.11287,0.0468283],"","",true,false], 
		["Land_BagFence_Round_F",[-9.66583,-5.03101,0.0437317],135.159,1,0,[-1.49888,1.49057],"","",true,false], 
		["LIB_MV_Fallentree1_w",[-10.299,3.98584,0],165.506,1,0,[-1.11236,0.287578],"","",true,false], 
		["I44_Vegetation_MB_B_Ulmus",[-2.37573,10.7825,0],0,1,0,[0.413052,0],"","",true,false], 
		["Land_BagFence_Round_F",[-9.50604,-7.48315,0.0196838],33.7876,1,0,[1.75669,1.17566],"","",true,false], 
		["Land_I44_Buildings_Bush",[-8.89819,-9.54077,0],0,1,0,[2.11339,0],"","",true,false], 
		["Land_I44_Buildings_Bush_Alt_1",[-2.41071,-13.5581,0],311.403,1,0,[1.39806,-1.58551],"","",true,false], 
		["LIB_T_Acer2s",[2.44989,-12.9287,0],108.931,1,0,[-0.685935,1.99917],"","",true,false]
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

	
		if ( typeOf _object == "LIB_GrWr34_g") then {
		
			_mortars pushBack _object;
			_object addEventHandler ["Fired",{(_this select 0) setVehicleAmmo 1}];
		};
	
		if ( typeOf _object == "LIB_MG42_Lafette_Deployed") then {
		
			_centerObject = _object;
			_sectorStatics pushBack _object;

		};


		if ( typeOf _object == "Land_CamoNetVar_EAST") then {
		
			_object enableSimulationGlobal false;
			_object allowDamage false;

		};


	} forEach _compositionArray;
	
	
	
	
	
	
	//*********************************************************************
	//
	//   	       SPAWN MORTAR UNITS  (UNIT INFO)
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

	
	} forEach _mortars;	






	
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