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
	
	_marker = "mg_mrkr_2";
	_size = 100;



	_mgPosMarkers = allMapMarkers select { (_x select [0, (count "mg_pos_mrkr_2")]) isEqualTo "mg_pos_mrkr_2" ;};
	
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
		[4.44682,5.01843,0.00138855],
		[-0.128372,4.60278,0.00141907],
		[-4.18638,4.90912,0.00144958],
		[-8.66043,0.779297,0.0255241],
		[-2.2387,0.576904,0.0014534],
		[3.74632,0.380554,0.00143051],
		[9.11452,1.43176,0.0656853]
	];
	
	
	

	//*********************************************************************
	//
	//   	       OBJECTS ARRAY
	//
	//*********************************************************************
	_objectsArray = [
	["Land_CamoNetVar_EAST",[0.525513,-2.76343,0.0270004],359.491,1,0,[-2.4346,0.0216374],"","",true,false], 
	["Land_BagFence_Long_F",[-2.68188,1.43555,-0.0462036],89.8555,1,0,[-0.00440408,-1.74607],"","",true,false], 
	["Land_BagFence_Long_F",[-2.80823,-1.26514,-0.0714188],95.2173,1,0,[0.221526,-2.42462],"","",true,false], 
	["LIB_WeaponsBox_Big_GER",[3.10583,-0.385254,0.000694275],355.741,1,0,[-1.95844,0.126542],"","",true,false], 
	["LIB_GerRadio",[-2.54041,-2.05518,0],95.9022,1,0,[0.250512,-2.42181],"","",true,false], 
	["Land_BagFence_Short_F",[4.16302,-0.856201,-0.0323753],103.054,1,0,[0.394494,-1.70098],"","",true,false], 
	["Land_BagFence_Long_F",[4.08398,1.4541,-0.0453949],78.541,1,0,[-0.346991,-1.71129],"","",true,false], 
	["LIB_B_Hedgerows",[-4.68555,-0.808838,-0.0676689],90.9616,1,0,[0.0293125,-1.74583],"","",true,false], 
	["LIB_BasicWeaponsBox_GER",[2.9679,-3.75562,-0.0032959],109.108,1,0,[0.797817,-2.30101],"","",true,false], 
	["Land_BagFence_Long_F",[3.67426,-3.16797,-0.0619698],102.128,1,0,[0.511831,-2.38042],"","",true,false], 
	["Land_BagFence_Long_F",[-4.1557,2.85083,-0.000652313],179.6,1,0,[1.74603,-0.0122006],"","",true,false], 
	["Land_BagFence_Long_F",[-3.39984,-3.94141,0.0622292],286.713,1,0,[-0.700562,2.33196],"","",true,false], 
	["LIB_B_Hedgerows",[5.26416,-0.277344,-0.0642776],90.9616,1,0,[0.0293125,-1.74583],"","",true,false], 
	["Land_BagFence_Short_F",[4.60675,3.08691,0.0076828],342.988,1,0,[-1.66971,0.51101],"","",true,false], 
	["LIB_BasicAmmunitionBox_GER",[2.85779,-4.77881,-0.0058136],274.997,1,0,[-0.212885,2.42577],"","",true,false], 
	["LIB_B_Hedgerows",[-5.03186,-3.41772,-0.056591],90.9612,1,0,[0.0408669,-2.43435],"","",true,false], 
	["LIB_B_Hedgerows",[4.86188,-3.36841,-0.0568771],90.9612,1,0,[0.0408669,-2.43435],"","",true,false], 
	["LIB_MG42_Lafette_Deployed",[4.29572,4.38525,-0.0750427],79.5989,1,0,[-0.315327,-1.7174],"","",true,false], 
	["LIB_MG42_Lafette_Deployed",[-4.52478,4.19727,-0.0750389],268.026,1,0,[0.060157,1.74504],"","",true,false], 
	["Land_BagFence_Short_F",[2.81592,5.58228,0.000148773],358.008,1,0,[-1.74502,0.0607207],"","",true,false], 
	["Land_CamoNet_EAST",[0.755981,6.38501,-0.00544739],357.242,1,0,[-1.74406,0.0840278],"","",true,false], 
	["Land_BagFence_Long_F",[3.33246,-5.88696,-0.0634232],92.1246,1,0,[0.0903159,-2.43303],"","",true,false], 
	["Land_BagFence_Long_F",[-5.50623,4.20166,-0.0461998],90.3988,1,0,[0.0121571,-1.74603],"","",true,false], 
	["Land_BagFence_Long_F",[5.20227,4.59961,0.0460701],266.135,1,0,[0.117738,1.74211],"","",true,false], 
	["Land_BagFence_Long_F",[-4.17072,5.57861,-0.000652313],179.599,1,0,[1.74603,-0.012226],"","",true,false], 
	["Land_BagFence_Short_F",[-2.67584,6.46704,0.0283165],281.282,1,0,[-0.3417,1.71236],"","",true,false], 
	["Land_BagFence_Short_F",[4.33887,5.771,0.00613785],346.121,1,0,[-1.69513,0.418952],"","",true,false], 
	["Land_BagFence_Long_F",[-1.146,7.40723,-0.00069809],359.284,1,0,[-1.74594,0.0218407],"","",true,false], 
	["Land_BagFence_Long_F",[-3.72906,-6.56104,0.0651436],265.782,1,0,[0.179192,2.42811],"","",true,false], 
	["Land_BagFence_Long_F",[1.75018,7.42798,-0.00069809],359.284,1,0,[-1.74594,0.0218407],"","",true,false], 
	["LIB_B_Betulahumilis",[-7.18103,2.26196,3.8147e-006],122.388,1,0,[0.935501,-1.47458],"","",true,false], 
	["LIB_B_Betulahumilis",[7.41895,2.3938,0],285.606,1,0,[-0.469867,1.68174],"","",true,false], 
	["Land_I44_Buildings_Bush",[-7.45929,-3.22046,0],31.9061,1,0,[-2.0672,-1.28737],"","",true,false], 
	["Land_I44_Buildings_Bush",[-6.3222,-5.27881,0],31.9061,1,0,[-2.0672,-1.28737],"","",true,false], 
	["Land_BagFence_Short_F",[3.92975,-7.12964,0.00406647],186.57,1,0,[2.41873,0.278727],"","",true,false], 
	["I44_Vegetation_MB_B_Ulmus",[-8.46729,-0.00244141,0],264.516,1,0,[0.166916,1.73809],"","",true,false], 
	["LIB_B_Betulahumilis",[-4.53784,7.15381,0],98.2712,1,0,[0.251264,-1.72793],"","",true,false], 
	["I44_Vegetation_MB_B_Ulmus",[8.71271,-0.956787,0],264.516,1,0,[0.166916,1.73809],"","",true,false], 
	["Land_BagFence_Long_F",[4.53558,7.82275,0.0102119],345.665,1,0,[-1.69174,0.432446],"","",true,false], 
	["Land_BagFence_Long_F",[-4.95886,-7.8999,0.00255585],182.233,1,0,[2.43285,0.0949401],"","",true,false], 
	["LIB_B_Betulahumilis",[5.94275,-7.02856,3.8147e-006],285.6,1,0,[-0.655085,2.34512],"","",true,false], 
	["LIB_B_Betulahumilis",[-6.76996,6.51855,-3.8147e-006],98.2712,1,0,[0.251264,-1.72793],"","",true,false], 
	["LIB_MG42_Lafette_Deployed",[3.9303,-8.81323,-0.0750618],99.3495,1,0,[0.395763,-2.40239],"","",true,false], 
	["Land_BagFence_Long_F",[5.04016,-8.52368,0.06427],259.531,1,0,[0.442648,2.39422],"","",true,false], 
	["Land_I44_Buildings_Bush",[-8.02454,-5.71143,0],122.702,1,0,[1.31594,-2.04915],"","",true,false], 
	["CUP_kmen_1_buk",[-9.42664,2.79712,-0.174381],282.046,1,0,[-0.364501,1.70765],"","",true,false], 
	["LIB_B_Betulahumilis",[-7.51288,-7.45825,3.8147e-006],216.492,1,0,[1.95776,1.44851],"","",true,false], 
	["Land_BagFence_Short_F",[2.93756,-10.1277,0.00406647],186.57,1,0,[2.41873,0.278727],"","",true,false], 
	["LIB_MG42_Lafette_Deployed",[-5.36554,-9.22119,-0.0750656],275.409,1,0,[-0.229627,2.42387],"","",true,false], 
	["LIB_T_Alnus2s",[-8.74347,-1.75122,0],320.301,1,0,[-1.87376,1.55571],"","",true,false], 
	["Land_CamoNet_EAST",[-0.325256,-11.0452,0.00956726],178.025,1,0,[2.43325,-0.08397],"","",true,false], 
	["I44_Vegetation_MB_B_Ulmus",[9.84174,-4.53979,0],99.9681,1,0,[0.421694,-2.39799],"","",true,false], 
	["Land_BagFence_Short_F",[4.53229,-9.98901,0.0112534],342.981,1,0,[-2.32819,0.71302],"","",true,false], 
	["LIB_B_Betulahumilis",[-8.8988,-6.7085,0],172.171,1,0,[2.41203,-0.331842],"","",true,false], 
	["LIB_B_Hedgerows_New",[-4.57153,10.0325,0.123123],342.973,1,0,[-1.4939,0.457603],"","",true,false], 
	["Land_BagFence_Long_F",[-6.35583,-9.21387,-0.0633621],93.0343,1,0,[0.128956,-2.43129],"","",true,false], 
	["LIB_B_Betulahumilis",[8.96606,6.90918,0],285.606,1,0,[-0.469867,1.68174],"","",true,false], 
	["Land_BagFence_Short_F",[-3.30951,-11.2263,0.0318108],232.11,1,0,[1.46757,1.88561],"","",true,false], 
	["Land_BagFence_Long_F",[-5.0683,-10.6255,0.00255585],182.239,1,0,[2.43284,0.0951862],"","",true,false], 
	["LIB_B_Hedgerows_New",[4.724,11.1104,0.103355],188.312,1,0,[1.54595,0.225906],"","",true,false], 
	["LIB_T_Acer2s",[7.18365,1.05322,0],140.813,1,0,[1.35353,-1.10347],"","",true,false], 
	["Land_BagFence_Long_F",[0.948242,-12.0249,0.00247574],182.239,1,0,[2.38694,0.0933848],"","",true,false], 
	["Land_BagFence_Long_F",[-1.63373,-11.9609,0.00247574],182.239,1,0,[2.38694,0.0933848],"","",true,false], 
	["LIB_B_Betulahumilis",[-11.5065,-3.42871,0],136.102,1,0,[1.75488,-1.6887],"","",true,false], 
	["LIB_B_Ker_Deravej_Big",[8.63263,8.60669,0],0,1,0,[-1.74608,0],"","",true,false], 
	["CUP_kmen_1_buk",[11.8716,-3.10083,0.19379],74.7925,1,0,[-0.639018,-2.34954],"","",true,false], 
	["LIB_B_Sambucus",[10.1711,-7.5105,0],0,1,0,[-2.4347,0],"","",true,false], 
	["RJW_Bocage_Tree_2",[4.99402,11.5176,-0.00258636],109.791,1,0,[0.52912,-1.47011],"","",true,false], 
	["Land_BagFence_Long_F",[3.79681,-12.5347,-0.0213814],18.7385,1,0,[-2.26228,-0.767786],"","",true,false], 
	["LIB_B_Betulahumilis",[-5.62939,-12.0288,3.8147e-006],171.258,1,0,[2.36104,-0.363268],"","",true,false], 
	["LIB_B_Betulahumilis",[8.09125,-10.6746,7.62939e-006],47.7255,1,0,[-1.63832,-1.802],"","",true,false], 
	["LIB_B_Betulahumilis",[-7.55249,-11.356,0],171.258,1,0,[2.36104,-0.363268],"","",true,false], 
	["LIB_B_Sambucus",[-11.2505,8.40332,0],0,1,0,[-1.74608,0],"","",true,false], 
	["LIB_T_Carpinus2s",[-6.15265,11.3828,0],182.829,1,0,[1.56045,0.0771276],"","",true,false], 
	["LIB_MV_Fallentree1_w",[-11.2999,-8.78394,0],169.737,1,0,[2.39579,-0.434018],"","",true,false], 
	["LIB_B_Betulahumilis",[-14.9565,-4.44482,0],98.2676,1,0,[0.350308,-2.40942],"","",true,false], 
	["LIB_B_Ker_Deravej_Big",[6.16809,-14.5168,7.62939e-006],0,1,0,[-2.38876,0],"","",true,false], 
	["LIB_B_Hedgerows_New",[-5.1333,-15.4944,0.11087],16.3445,1,0,[-2.29233,-0.672585],"","",true,false], 
	["LIB_B_Hedgerows_New",[3.27795,-15.8262,0.0982552],184.445,1,0,[2.38158,0.185253],"","",true,false], 
	["LIB_T_Acer2s",[-6.30286,-14.4258,0],140.802,1,0,[1.85163,-1.51023],"","",true,false], 
	["LIB_B_Sambucus",[-12.2273,-13.6348,0],0,1,0,[-2.38876,0],"","",true,false], 
	["LIB_T_Betula2s",[6.08728,-14.2742,0],23.7204,1,0,[-2.18716,-0.961405],"","",true,false], 
	["LIB_B_Sambucus",[3.96222,-19.6519,0],0,1,0,[-2.38876,0],"","",true,false]
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


		if ( (typeOf _object == "Land_CamoNetVar_EAST") || (typeOf _object == "Land_CamoNet_EAST") ) then {
		
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