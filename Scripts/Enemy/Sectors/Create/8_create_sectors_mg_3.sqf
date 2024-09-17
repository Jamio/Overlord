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
	
	_marker = "mg_mrkr_3";
	_size = 100;



	_mgPosMarkers = allMapMarkers select { (_x select [0, (count "mg_pos_mrkr_3")]) isEqualTo "mg_pos_mrkr_3" ;};

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
		[0.460403,10.4572,0.00151825],
		[7.58395,8.39105,0.0198822],
		[4.22056,1.04425,0.00133896],
		[-3.23572,1.28455,0.00134659],
		[-7.10713,11.5597,-0.0293961],
		[-2.20206,2.61322,0.00141907]
		
	];
	
	
	

	//*********************************************************************
	//
	//   	       OBJECTS ARRAY
	//
	//*********************************************************************
	_objectsArray = [
		["LIB_WeaponsBox_Big_GER",[1.15631,0.497559,3.43323e-005],9.05407,1,0.191108,[1.67949,0.260768],"","",true,false], 
		["LIB_GerRadio",[-1.47552,-0.487549,0],95.9049,1,0,[-0.174963,1.69117],"","",true,false], 
		["LIB_BasicWeaponsBox_GER",[1.02301,-1.57275,-0.00231171],92.1647,1,0,[-0.0643458,1.6991],"","",true,false], 
		["Land_BagFence_Long_F",[-1.79901,-0.501465,-0.0444717],278.643,1,0,[0.255586,-1.68089],"","",true,false], 
		["Land_BagFence_Long_F",[1.73572,0.807373,-0.0449982],272.081,1,0,[0.061744,-1.69907],"","",true,false], 
		["Land_CamoNet_EAST",[0.763916,-1.45728,0.00185013],84.4118,1,0,[0.165608,1.69211],"","",true,false], 
		["Land_BagFence_Long_F",[1.74823,0.855225,0.644619],272.082,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[-1.40784,2.11792,-0.0391541],278.643,1,0,[0.255586,-1.68089],"","",true,false], 
		["Land_BagFence_Long_F",[1.56921,-1.98535,-0.0450058],272.081,1,0,[0.061744,-1.69907],"","",true,false], 
		["Land_BagFence_Long_F",[1.57874,-2.01343,0.65567],272.082,1,0,[0,0],"","",true,false], 
		["LIB_B_Hedgerows_New",[-3.57434,-0.00878906,0.14003],92.5479,1,0,[-0.0756021,1.69851],"","",true,false], 
		["Land_BagFence_Long_F",[-0.0791626,3.93774,-0.0148926],329.274,1,0,[0.908675,-0.540111],"","",true,false], 
		["Land_BagFence_Long_F",[-2.05042,-3.35571,0.0447769],93.3896,1,0,[-0.100552,1.69722],"","",true,false], 
		["Land_BagFence_Long_F",[2.92828,3.00098,0.0190659],142.666,1,0,[-0.840496,0.64109],"","",true,false], 
		["Land_BagFence_Long_F",[2.95459,3.03955,0.714703],142.671,1,0,[0,-0],"","",true,false], 
		["LIB_B_Betulahumilis",[-1.47882,4.27124,0],136.123,1,0,[-0.761976,0.732688],"","",true,false], 
		["Land_BagFence_Long_F",[2.27277,-4.64258,-0.0375977],235.445,1,0,[-0.964533,-1.40038],"","",true,false], 
		["Land_BagFence_Long_F",[2.35779,-4.71606,0.691956],235.433,1,0,[0,0],"","",true,false], 
		["LIB_B_Betulahumilis",[-0.315491,5.1958,0],186.009,1,0,[-1.05122,-0.110671],"","",true,false], 
		["I44_Vegetation_MB_B_Ulmus",[5.37927,-0.219238,-3.8147e-006],8.88441,1,0,[1.6798,0.262655],"","",true,false], 
		["Land_BagFence_Long_F",[-1.05878,-5.58105,0.0297012],41.6021,1,0,[1.27152,1.12903],"","",true,false], 
		["Land_BagFence_Long_F",[2.31976,5.37964,-0.0148888],329.274,1,0,[0.908675,-0.540111],"","",true,false], 
		["Land_I44_Buildings_Bush",[-2.00037,5.45166,0],204.622,1,0,[-0.960936,-0.440439],"","",true,false], 
		["LIB_B_Betulahumilis",[1.01727,6.04785,0],136.123,1,0,[-0.761976,0.732688],"","",true,false], 
		["LIB_B_Betulahumilis",[-2.71472,-5.87793,3.8147e-006],97.4491,1,0,[-0.220485,1.68585],"","",true,false], 
		["Land_BagFence_Long_F",[5.4007,3.68408,0.707588],2.93229,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[5.52374,3.68042,0.000785828],2.93279,1,0,[1.05565,0.0540886],"","",true,false], 
		["LIB_B_Betulahumilis",[-1.49011,-6.85669,0],136.115,1,0,[-1.22555,1.17877],"","",true,false], 
		["Land_BagFence_Short_F",[3.62616,-6.42139,0.0217552],51.6231,1,0,[1.05572,1.333],"","",true,false], 
		["Land_BagFence_Short_F",[3.69006,-6.38696,0.765465],51.6109,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[1.06763,-7.43018,0.0116653],41.594,1,0,[0.756145,0.671203],"","",true,false], 
		["Land_I44_Buildings_Bush",[-3.61145,-6.51978,3.8147e-006],86.4593,1,0,[0.10503,1.69694],"","",true,false], 
		["I44_Vegetation_MB_B_Ulmus",[6.57062,-3.66626,0],8.88441,1,0,[1.6798,0.262655],"","",true,false], 
		["LIB_MG42_Lafette_Deployed",[4.31506,6.37622,-0.0750122],288.031,1,0,[0.327213,-1.00513],"","",true,false], 
		["LIB_B_Betulahumilis",[-0.0799561,-7.87695,0],190.274,1,0,[-0.994813,-0.180347],"","",true,false], 
		["Land_BagFence_Short_F",[3.61768,6.8645,-0.0178452],281.285,1,0,[0.206876,-1.0366],"","",true,false], 
		["LIB_MV_Fallentree1_w",[-7.85028,-1.44873,-3.8147e-006],169.742,1,0,[-1.67303,0.302855],"","",true,false], 
		["Land_BagFence_Long_F",[5.10217,7.19189,-0.0104485],199.389,1,0,[-0.997097,-0.350941],"","",true,false], 
		["LIB_B_Sambucus",[0.480896,-8.88037,0],0,1,0,[1.01102,0],"","",true,false], 
		["Land_CamoNet_EAST",[7.8476,3.91992,-0.00349045],189.397,1,0,[-1.04285,-0.172609],"","",true,false], 
		["Land_BagFence_Long_F",[8.32434,3.37793,0.688183],187.593,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[8.44189,3.32349,-0.0049057],187.595,1,0,[-1.04776,-0.139719],"","",true,false], 
		["Land_BagFence_Long_F",[5.3764,-7.64697,0.00788116],22.3932,1,0,[0.934796,0.385194],"","",true,false], 
		["Land_BagFence_Long_F",[5.43689,-7.57227,0.780647],22.3901,1,0,[0,0],"","",true,false], 
		["Land_I44_Buildings_Bush",[2.3092,9.60889,0],122.721,1,0,[-0.571418,0.889325],"","",true,false], 
		["Land_BagFence_Long_F",[2.1806,-9.84668,0.0259933],93.7682,1,0,[-0.0664512,1.00884],"","",true,false], 
		["LIB_T_Alnus2s",[-6.15955,4.95898,0],320.322,1,0,[0.813577,-0.674928],"","",true,false], 
		["Land_BagFence_Long_F",[8.07056,6.64307,-0.00195694],181.52,1,0,[-1.05666,-0.0280355],"","",true,false], 
		["LIB_T_Acer2s",[5.62421,-3.22314,0],140.814,1,0,[-1.31797,1.07444],"","",true,false], 
		["LIB_MG42_Lafette_Deployed",[3.13019,-10.6001,-0.0750122],271.967,1,0,[0.0347098,-1.01043],"","",true,false], 
		["Land_BagFence_Long_F",[11.2448,-2.06396,0.0116997],15.5084,1,0,[1.63832,0.454719],"","",true,false], 
		["LIB_T_Acer2s",[-4.71472,-5.77075,3.8147e-006],242.048,1,0,[-0.797102,-1.50195],"","",true,false], 
		["Land_BagFence_Short_F",[2.06134,-11.428,-0.0173569],275.77,1,0,[0.101647,-1.0059],"","",true,false], 
		["Land_BagFence_Long_F",[7.91437,-8.53613,-0.00881958],196.605,1,0,[-0.968869,-0.288945],"","",true,false], 
		["Land_BagFence_Long_F",[11.1205,3.27954,0.720692],174.148,1,0,[0,-0],"","",true,false], 
		["Land_BagFence_Long_F",[7.89923,-8.56396,0.74789],196.602,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[11.2241,3.2771,0.00163269],174.147,1,0,[-1.05152,0.107809],"","",true,false], 
		["LIB_B_Hedgerows_New",[7.93414,9.44043,0.114109],179.86,1,0,[-1.05703,0.00257403],"","",true,false], 
		["LIB_MG42_Lafette_Deployed",[11.4061,-3.56323,-0.0750275],97.6376,1,0,[-0.226031,1.68511],"","",true,false], 
		["Land_BagFence_Long_F",[10.9412,-4.93945,0.00379562],5.29335,1,0,[1.69294,0.156896],"","",true,false], 
		["Land_CamoNet_EAST",[7.30823,-9.43018,0.00372696],11.4503,1,0,[0.990904,0.200726],"","",true,false], 
		["LIB_B_Sambucus",[0.484924,-12.3904,-3.8147e-006],166.726,1,0,[-0.984018,0.232155],"","",true,false], 
		["LIB_B_Betulahumilis",[12.6498,0.52832,3.8147e-006],136.115,1,0,[-1.22555,1.17877],"","",true,false], 
		["Land_BagFence_Long_F",[3.39471,-12.1877,-0.00296402],183.766,1,0,[-1.00884,-0.0664069],"","",true,false], 
		["Land_BagFence_Long_F",[10.8732,6.61401,-0.00195313],181.52,1,0,[-1.05666,-0.0280355],"","",true,false], 
		["Land_BagFence_Long_F",[12.3903,-3.75415,-0.0448151],275.276,1,0,[0.156393,-1.69299],"","",true,false], 
		["LIB_B_Betulahumilis",[13.516,2.03638,0],136.115,1,0,[-1.22555,1.17877],"","",true,false], 
		["Land_BagFence_Long_F",[6.30798,-12.2961,-0.00223923],182.23,1,0,[-1.01026,-0.0393441],"","",true,false], 
		["Land_BagFence_Long_F",[10.3177,-9.55688,0.771942],36.3829,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[13.677,3.54248,0.720695],174.148,1,0,[0,-0],"","",true,false], 
		["Land_BagFence_Long_F",[13.7806,3.54004,0.00163651],174.147,1,0,[-1.05152,0.107809],"","",true,false], 
		["Land_BagFence_Long_F",[10.4489,-9.67041,0.0144348],34.2947,1,0,[0.835284,0.5697],"","",true,false], 
		["LIB_B_Hedgerows_New",[3.69232,-14.2139,0.104263],5.07153,1,0,[1.00706,0.089383],"","",true,false], 
		["Land_BagFence_Long_F",[13.6769,6.52173,-0.00231552],182.23,1,0,[-1.05623,-0.0411354],"","",true,false], 
		["LIB_B_Sambucus",[1.72797,-14.8311,0],69.3576,1,0,[0.356451,0.946126],"","",true,false], 
		["LIB_B_Hedgerows_New",[12.8772,8.0271,0.104073],5.07161,1,0,[1.05289,0.0934527],"","",true,false], 
		["Land_BagFence_Long_F",[9.27002,-12.907,0.0093689],21.9956,1,0,[0.937446,0.378697],"","",true,false], 
		["LIB_B_Sambucus",[12.9529,8.67407,0],0,1,0,[1.05703,0],"","",true,false], 
		["LIB_T_Alnus2s",[13.8437,1.27026,7.62939e-006],9.6795,1,0,[1.676,0.285945],"","",true,false], 
		["LIB_B_Betulahumilis",[13.5381,-9.18262,0],1.97031,1,0,[1.01042,0.0347642],"","",true,false], 
		["LIB_B_Betulahumilis",[16.1077,2.53906,3.8147e-006],207.092,1,0,[-0.941074,-0.481432],"","",true,false], 
		["LIB_T_Alnus2s",[12.8554,-6.90601,0],28.1896,1,0,[0.891124,0.477637],"","",true,false], 
		["Land_BagFence_Long_F",[12.6841,-11.1921,0.771942],36.3829,1,0,[0,0],"","",true,false], 
		["Land_BagFence_Long_F",[12.8154,-11.3057,0.0144348],34.2947,1,0,[0.835284,0.5697],"","",true,false], 
		["CUP_kmen_1_buk",[16.0952,-3.8877,-0.172863],92.5857,1,0,[-0.0767237,1.69846],"","",true,false], 
		["LIB_T_Betula2s",[0.990845,-14.4639,-3.8147e-006],202.558,1,0,[-0.933683,-0.387886],"","",true,false], 
		["Land_BagFence_Long_F",[11.7904,-14.0769,0.0121956],28.6803,1,0,[0.887002,0.48525],"","",true,false], 
		["LIB_B_Hedgerows_New",[10.7323,-15.2261,0.108223],200.739,1,0,[-0.945522,-0.358051],"","",true,false], 
		["LIB_B_Betulahumilis",[17.2824,6.57373,0],136.123,1,0,[-0.761976,0.732688],"","",true,false], 
		["LIB_B_Sambucus",[6.51801,-17.436,0],328.786,1,0,[0.86469,-0.523985],"","",true,false], 
		["LIB_B_Betulahumilis",[15.1588,-11.5842,0],136.123,1,0,[-0.728812,0.700788],"","",true,false], 
		["LIB_T_Carpinus2s",[13.7776,10.1646,3.8147e-006],181.148,1,0,[-1.05682,-0.0211779],"","",true,false], 
		["LIB_B_Sambucus",[8.01837,-17.5393,0],0,1,0,[0,0],"","",true,false], 
		["LIB_T_Betula2s",[10.9884,-16.3391,0],23.7054,1,0,[0.925732,0.4065],"","",true,false]
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