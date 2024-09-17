/*


[] execVM "Scripts\Enemy\Sectors\1_create_sectors.sqf";



VARIABLES:

MARKER:

[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_patrolNum,_captured(True/False)];


UNIT:
_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolNum];


*/






if (isServer) then {


	private ["_marker","_intelMarkers","_guardPos","_buildingPos","_vehPos","_intelPos","_patrolPos","_OL_intel_array"];
	
	
	_OL_intel_array = [];
	
	_intelMarkers = [
		"radar_mrkr",
		"arty_mrkr_1",
		"mortar_mrkr_1",
		"mg_mrkr_1",
		"mg_mrkr_2",
		"mg_mrkr_3"
	];



	
	
	//*********************************************************************************
	//
	//                 CREATE SECTOR FOR EACH AA SITE
	//
	//*********************************************************************************	
	
	{
	
	
		_marker = _x;
		_size = 200;
		
		
		_sectorStatics = [];
		_sectorFlak = [];
		_sectorUnits = [];
		_sectorVeh = [];
		
		

		//********************************************************
		//         UNIT TOTALS
		//********************************************************
		_guardTotal = [3,8] call BIS_fnc_randomInt;
		_buildTotal = [3,6] call BIS_fnc_randomInt;
		_patrolTotal = [1,2] call BIS_fnc_randomInt;
		_patrolSize = [3,6] call BIS_fnc_randomInt;
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
			"LIB_Kfz1_MG42_camo", 
			"LIB_SdKfz251_FFV", 
			"LIB_SdKfz251_FFV",
			"LIB_Kfz1_MG42", 
			"LIB_Kfz1_MG42_sernyt", 
			"LIB_PzKpfwVI_B", 
			"LIB_PzKpfwIV_H_tarn51d"
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
		//                 SECTOR POSITIONS  (START)
		//
		//*********************************************************************************

		switch (true) do {
		
		
		
		
			//********************************************************
			//         AA SITE #1
			//********************************************************
			case ( _marker == "aa_mrkr_1"): {
			
			
				_guardPos = [
					[2522.83,1186.03,1.14441e-005], 
					[2541.49,1170.62,1.14441e-005], 
					[2536.8,1173.78,1.14441e-005], 
					[2581.57,1179.75,1.14441e-005], 
					[2587.56,1176.62,1.14441e-005], 
					[2556.36,1178.92,1.14441e-005], 
					[2521.06,1185.32,-3.8147e-006], 
					[2485.42,1189.61,1.14441e-005], 
					[2483.27,1183.97,1.14441e-005], 
					[2501.23,1192.05,1.14441e-005], 
					[2498.44,1194.14,1.14441e-005], 
					[2478.22,1218.81,1.14441e-005], 
					[2481.64,1217.43,1.14441e-005], 
					[2503.23,1203.26,0], 
					[2632.17,1170.52,1.14441e-005], 
					[2635.03,1168.86,1.14441e-005], 
					[2533,1175.62,1.14441e-005], 
					[2548.85,1165.55,1.14441e-005], 
					[2538.19,1160.28,1.14441e-005], 
					[2541.64,1157.54,1.14441e-005], 
					[2590.56,1185.33,3.8147e-006], 
					[2495.29,1181.46,1.14441e-005], 
					[2525.7,1163.92,7.62939e-006], 
					[2493.85,1182.27,1.14441e-005], 
					[2534.21,1164.47,1.14441e-005], 
					[2568.54,1187.54,1.14441e-005]
				];
		
		
				_buildingPos = [
					[2478.23,1185.14,0.565495], 
					[2481.07,1187.76,0.685436], 
					[2547.81,1162.53,0.323723], 
					[2589.08,1178.65,0.167973], 
					[2591.09,1182.3,0.193336], 
					[2640.23,1174.36,0.689362], 
					[2662.65,1170.12,0], 
					[2514.88,1234.01,0.139114], 
					[2540.52,1168.8,0.735142], 
					[2510.11,1229.68,0.0983315], 
					[2511.87,1231.55,0.11491], 
					[2476.28,1184.48,0.518108], 
					[2587.3,1185.36,0.249905], 
					[2584.32,1181.38,0.171246], 
					[2637.67,1170.84,0.534306]
				];
		
				_patrolPos = [
					[2609.29,1150.79,1.52588e-005], 
					[2496.03,1189.32,3.8147e-006], 
					[2530.06,1133.18,0], 
					[2501.94,1254.53,0]
				];		
		
		
				_vehPos = [
					[[2613.08,1154.45,2.28882e-005],333.967],
					[[2601.28,1176.08,7.62939e-006],207.520],
					[[2523.93,1130.1,3.8147e-006],236.898],
					[[2526.76,1149.54,3.8147e-006],228.406],
					[[2538.22,1194.69,-3.8147e-006],226.053],
					[[2495.88,1168.98,1.14441e-005],166.596],
					[[2485.36,1229.35,3.8147e-006],255.724]	
				];
		
		
		
				// [_intel,_unit]
				_intelPos = [
					[[2585.17,1183.15,0.345562],[2583.99,1184.99,0.405312]],
					[[2539.82,1166.89,0.583836],[2539.33,1163.81,0.316841]],
					[[2480.49,1190.42,0.798676],[2482.63,1191.71,0.806271]],
					[[2514.49,1231.24,0.159302],[2514.2,1228.41,0.115192]],	
					[[2634.13,1174.82,0.644955],[2636.34,1177.56,0.79137]]
				];
		
		
		
		
			};
			
			
			//********************************************************
			//         AA SITE #2
			//********************************************************
			case ( _marker == "aa_mrkr_2"): {
			
			
				_guardPos = [
					[1686.49,1164.69,0], 
					[1675.99,1167.81,0], 
					[1679.37,1163.84,0], 
					[1679.19,1178.51,0], 
					[1669.14,1177.69,0], 
					[1664.47,1197.9,0], 
					[1690.04,1197.61,0], 
					[1687.74,1200.78,0], 
					[1676.27,1206.42,0], 
					[1640.3,1205.78,0.199265], 
					[1635.89,1201.46,0], 
					[1624.69,1216.18,0], 
					[1633.36,1187.13,0], 
					[1629.82,1193.1,0], 
					[1591.5,1241.76,0], 
					[1582.21,1249.71,0], 
					[1603.86,1225.9,0], 
					[1645.02,1183.52,0], 
					[1660.6,1182.83,0], 
					[1581.88,1230.5,0], 
					[1575.6,1238.47,0]	
				];
		
		
				_buildingPos = [
					[1646.22,1208.95,0.738926], 
					[1690.07,1204.32,0.569088], 
					[1692.97,1205.28,0.685696], 
					[1654.72,1197.59,0.258945], 
					[1658.81,1200.6,0.551113], 
					[1582.98,1241.34,0.250225], 
					[1587.72,1236.57,4.23294], 
					[1580.02,1243.89,4.60612]					
				];
		
		
				_patrolPos = [
					[1634.94,1138.45,2.28882e-005], 
					[1726.53,1160,1.52588e-005], 
					[1661.19,1265.79,0.215588], 
					[1582.44,1255.25,1.52588e-005]
				];		
		
		
				_vehPos = [
					[[1601.02,1131.45,0],78.283],
					[[1684.13,1131.96,0],20.642],
					[[1733.63,1254.19,0],344.209],
					[[1639.64,1190.95,0],36.088],
					[[1612,1227.87,0],6.639]
				];
		

				_intelPos = [
				[[1695.83,1198.97,0.464649],[1693.82,1198.95,0.358543]],
				[[1640.92,1210.98,0.751511],[1642.58,1212.56,0.892551]],
				[[1577.39,1245.52,0.509865],[1579.05,1247.11,0.939209]]
				
				];
		
		
		
		
			};



			
			//********************************************************
			//         AA SITE #3
			//********************************************************
			case ( _marker == "aa_mrkr_3"): {
			
			
				_guardPos = [
					[619.222,1623.59,0], 
					[635.114,1646.99,0], 
					[660.199,1652.63,0], 
					[632.792,1659.11,0], 
					[635.214,1662.58,0], 
					[666.541,1666.4,0], 
					[651.391,1672.49,0], 
					[619.299,1708.04,0], 
					[616.867,1710.13,0], 
					[607.281,1706.89,0], 
					[550.026,1695.32,0], 
					[546.868,1695.04,0], 
					[670.97,1678.21,0], 
					[660.76,1685.64,0], 
					[706.269,1693.24,0], 
					[702.552,1693.98,0], 
					[710.295,1690.31,0], 
					[679.214,1683.36,0], 
					[623.946,1665.15,0]
				];
		
		
				_buildingPos = [
					[622.779,1710.16,3.86063], 
					[630.801,1667.29,0.0610199], 
					[675.635,1665.93,4.22029], 
					[673.282,1664.57,0.125919], 
					[620.318,1713.7,0.344059], 
					[623.869,1712.18,0.392979], 
					[618.067,1715.7,0.279194], 
					[617.859,1716.45,3.6553], 
					[555.42,1699.18,0.160915], 
					[545.823,1699.2,0.292751]
				];
		
		
				_patrolPos = [
					[495.529,1719.55,-3.8147e-006], 
					[606.361,1560.63,-3.8147e-006], 
					[705.443,1709.94,0]
				];		
		
		
				_vehPos = [
					[[710.183,1706.85,0],67.002],
					[[698.568,1608.45,0],147.669],
					[[573.598,1609.11,0],247.399],
					[[601.083,1671.85,-3.8147e-006],207.660],
					[[511.721,1693.46,3.8147e-006],161.992]
				];
		

				_intelPos = [
					[[666.31,1654.09,0.235943],[667.333,1652.11,0.326393]],
					[[626.79,1660.57,0.128605],[629.106,1660.03,0.246506]],
					[[625.52,1710.07,3.85676],[627.637,1708.54,3.93637]],
					[[625.024,1709.98,0.476006],[627.14,1708.45,0.532955]],
					[[547.466,1703.3,0.227989],[549.135,1701.89,0.267128]]					
				];
		
		
			};


			//********************************************************
			//         AA SITE #4
			//********************************************************
			case ( _marker == "aa_mrkr_4"): {
			
			
				_guardPos = [
					[812.923,3538.11,0], 
					[800.978,3535.99,0], 
					[798.441,3535.68,0], 
					[790.29,3534.74,0], 
					[797.773,3576.15,0], 
					[798.609,3571.34,0], 
					[778.171,3564.16,0], 
					[805.805,3550.67,0], 
					[886.494,3560.8,0], 
					[882.922,3574.51,0], 
					[874.831,3565.21,0], 
					[868.482,3571.13,0], 
					[802.464,3525.59,0], 
					[805.76,3545.54,0], 
					[814.369,3537.72,3.5129], 
					[833.349,3548.64,0]
				];
		
		
				_buildingPos = [
					[792.058,3528.81,0.613571], 
					[783.601,3529.23,0.66177], 
					[806.661,3528.23,0.365704], 
					[809.486,3532.25,0.393944], 
					[813.208,3531.97,0.435867], 
					[816.377,3533.26,0.358913], 
					[813.674,3528.88,3.41037], 
					[806.38,3529.09,3.34808], 
					[810.435,3535.36,3.37717]
				];
		
		
				_patrolPos = [
					[714.316,3556.45,-3.8147e-006], 
					[770.114,3481.23,3.8147e-006], 
					[902.636,3488.94,-3.8147e-006]
				];		
		
		
				_vehPos = [
					[[759.194,3589.65,-3.8147e-006],16.451],
					[[816.917,3569.5,-3.8147e-006],330.208],
					[[862.974,3533.32,-3.8147e-006],311.273],
					[[730.435,3490.13,-3.8147e-006],313.400],
					[[794.48,3474.81,-3.8147e-006],326.084]	
				];
		

				_intelPos = [
					[[785.908,3530.38,0.573303],[787.036,3528.81,0.65974]],
					[[807.763,3533.6,3.34442],[806.106,3532.5,3.34003]],
					[[814.725,3532.23,3.34954],[815.179,3530.35,3.34954]]		
				];
		
		
		
		
			};



			//********************************************************
			//         AA SITE #5
			//********************************************************
			case ( _marker == "aa_mrkr_5"): {
			
			
				_guardPos = [
					[1591.96,3152.57,0], 
					[1595.09,3155.58,0], 
					[1598.82,3145.3,0], 
					[1562.52,3219.83,0], 
					[1563.88,3215.83,0], 
					[1540.4,3237.41,0], 
					[1543.42,3238.16,0], 
					[1539.17,3237.09,3.53974], 
					[1531.31,3229.54,0], 
					[1535.33,3203.86,0], 
					[1538.28,3208.91,0], 
					[1545.45,3223.06,0], 
					[1567.78,3168,0], 
					[1523.19,3202.4,0], 
					[1517.45,3200.99,0]
				];
		
		
				_buildingPos = [
					[1547.66,3241.89,3.39622], 
					[1566.9,3224.77,0.210732], 
					[1568.85,3220.56,0.330502], 
					[1540.32,3242.77,0.419094], 
					[1537.48,3241.91,0.373714], 
					[1543.95,3243.17,0.446564], 
					[1546.72,3246,0.470856], 
					[1546.78,3246.45,3.40675], 
					[1537.56,3245.35,3.42303]
				];
		
		
				_patrolPos = [
					[1585.7,3185.81,-7.62939e-006], 
					[1495.89,3214.47,-7.62939e-006], 
					[1566.79,3262.87,-7.62939e-006]
				];		
		
		
				_vehPos = [
					[[1621.51,3144.25,-3.8147e-006],137.036],
					[[1581.46,3141.83,-3.8147e-006],147.489],
					[[1488.43,3189,-3.8147e-006],147.489],
					[[1561.99,3248.39,-3.8147e-006],147.489]
				];
		

				_intelPos = [
					[[1567.77,3218.26,0.350826],[1569.76,3216.35,0.425381]],
					[[1545.31,3242.01,3.38822],[1547.66,3241.89,3.39622]],
					[[1538.78,3241.75,3.35398],[1536.65,3239.93,3.38324]]
				];
		
		
			};
			
			
			
			//********************************************************
			//         AA SITE #6
			//********************************************************
			case ( _marker == "aa_mrkr_6"): {
			
			
				_guardPos = [
					[2021.68,2814.16,0], 
					[2007.3,2797.72,0], 
					[2020.3,2789.89,0], 
					[1984.54,2806.1,0], 
					[1994.82,2806.99,0], 
					[1951.66,2801.59,0], 
					[1954.7,2789.92,0], 
					[1953.88,2793.55,0], 
					[1984.18,2792.54,0], 
					[1982.98,2795.59,0], 
					[1967.49,2796.36,0], 
					[1973.02,2832.75,0], 
					[2009.24,2814.78,0], 
					[2011.94,2814.75,0]
				];
		
		
				_buildingPos = [
					[2025.3,2790.54,0.246429], 
					[1984.26,2810.84,0.160122], 
					[1982.45,2814.27,4.26237], 
					[1996.47,2816.88,4.11759], 
					[1994.07,2812.42,0.0308304], 
					[1974.52,2839.11,0.135002], 
					[1977.05,2836.7,0.127064], 
					[1973.47,2835.93,0.0925102], 
					[1987.82,2815.5,0.0802002]
				];
		
		
				_patrolPos = [
					[1915.06,2803.52,-3.8147e-006], 
					[2074.58,2741.94,-3.8147e-006], 
					[1994.11,2858.62,-7.62939e-006], 
					[1994.11,2858.62,-3.8147e-006]
				];		
		
		
				_vehPos = [
					[[2015.77,2860.14,3.8147e-006],171.754],
					[[2045.15,2794.75,-7.62939e-006],53.837],
					[[2018.53,2747.68,-7.62939e-006],150.455],
					[[1948.09,2767.54,-7.62939e-006],155.803]
				];
		

				_intelPos = [
					[[2027.43,2785.9,0.278282],[2025.46,2785.53,0.34071]],
					[[1979.8,2814.77,0.257534],[1981.09,2812.75,0.215572]],
					[[1971.98,2837.6,0.127705],[1970.87,2836.26,0.178452]]
				];
		
		
			};



			
			default {};
			
			
		};
		
		
		//*********************************************************************************
		//
		//                 SECTOR POSITIONS  (END)
		//
		//*********************************************************************************	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	



		//*********************************************************************
		//
		//   	       CREATE UNITS INFO
		//
		//*********************************************************************
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
		//          CREATE INTEL SITE
		//********************************************************
		
		if ( count ( missionProfileNamespace getVariable ["OL_intel_array",[]] ) == 0 ) then {
		
			private ["_intelMarker"];
			
			_posArray = selectRandom _intelPos;
			_position = _posArray select 0;
			
			_nBuilding = nearestBuilding _position;
		
			_exit = _nBuilding buildingExit 0;
			_dir = _position getDir _exit; 
		
			_table = createVehicle ["Land_WoodenTable_small_F", _position, [], 0, "CAN_COLLIDE"];
			_intel = createVehicle ["EvMap", _position, [], 0, "NONE"];
			_radio = createVehicle ["Land_I44_Object_Radio_G_20WSd", _position, [], 0, "NONE"];
			_lamp = createVehicle ["Land_Camping_Light_F", _position, [], 0, "NONE"];


			_radio attachTo [_table, [-.2, -.3, .58]]; 
			_radio setVectorDirAndUp [[-1,-.2,0], [0,0,1]]; 

			_intel attachTo [_table, [.4, 0, .44]];    
			_intel setVectorDirAndUp [[-1,.2,0], [0,0,1]]; 

			_lamp attachTo [_table, [-.25, .55, .55]];           
			_lamp setVectorDirAndUp [[1,0,0], [0,0,1]]; 
			_table setDir _dir;
		
	

			_intelMarker = selectRandom _intelMarkers;

			[_table,_intel,_intelMarker] spawn OL_ha_intel;

			_intelMarkers = _intelMarkers - [_intelMarker];	
			
			{ _x addCuratorEditableObjects [[_radio],true]; } forEach allCurators; 


			// [_table,_intel,_intelMarker, _assignedZone,_intelPos,_captured]
			_OL_intel_array pushBack [_table,_intel,_intelMarker,_marker,_position,false];
			
			
			_unit = objNull;
			_marker = _marker;
			_type = selectRandom _unitArray;
			_role = "guard";
			_pos =  _posArray select 1;
			_dir = [0,360] call BIS_fnc_randomInt;
			_vehType = "";
			_static = "";
			_patrolGrpNum = -1;
				
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			_sectorUnits pushBack _unitInfo;	
			

			
			
		} else {
		
		
		
		
			private ["_intelDataArray"];
		
			_intelDataArrayAll = missionProfileNamespace getVariable "OL_intel_array";
		
			{
				_assignedMarker = _x select 3;
				
				if ( _assignedMarker == _marker ) then {
					
					_intelDataArray = _x;
					
				};
			
			} forEach _intelDataArrayAll;
		
		
			_intelMarker = _intelDataArray select 2;
			_assignedMarker = _intelDataArray select 3;
			_position = _intelDataArray select 4;
			_captured = _intelDataArray select 5;
		
		
			_nBuilding = nearestBuilding _position;
			_exit = _nBuilding buildingExit 0;
			_dir = _position getDir _exit; 
		
			_table = createVehicle ["Land_WoodenTable_small_F", _position, [], 0, "CAN_COLLIDE"];
			_intel = createVehicle ["EvMap", _position, [], 0, "NONE"];
			_radio = createVehicle ["Land_I44_Object_Radio_G_20WSd", _position, [], 0, "NONE"];
			_lamp = createVehicle ["Land_Camping_Light_F", _position, [], 0, "NONE"];		
		
			_radio attachTo [_table, [-.2, -.3, .58]]; 
			_radio setVectorDirAndUp [[-1,-.2,0], [0,0,1]]; 

			_intel attachTo [_table, [.4, 0, .44]];    
			_intel setVectorDirAndUp [[-1,.2,0], [0,0,1]]; 

			_lamp attachTo [_table, [-.25, .55, .55]];           
			_lamp setVectorDirAndUp [[1,0,0], [0,0,1]]; 
			_table setDir _dir;
		

			[_table,_intel,_intelMarker] spawn OL_ha_intel;
			
			{ _x addCuratorEditableObjects [[_radio],true]; } forEach allCurators; 
			
			
			if ( _captured ) then {
			
				[_intelMarker, (getMarkerPos _intelMarker)] call BIS_fnc_taskSetDestination;
				_intelMarker setMarkerAlpha 1;
				deleteVehicle _intel;
				
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
			
			
			
			// [_intelMarker, _assignedZone,_intelPos,_captured]
			_OL_intel_array pushBack [_table,_intel,_intelMarker,_marker,_position,_captured];			
		
		
		};




		
		
		
		
		

			




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
		
		_sectorInfo = missionProfileNamespace getVariable [_marker,[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_patrolNum,getMarkerPos _marker,false]];
		
		_load_currentPop = _sectorInfo select 0;
		_load_startPop = _sectorInfo select 1;
		_load_sectorUnits = _sectorInfo select 4;
		_load_sectorVeh = _sectorInfo select 5;
		_load_patrolNum = _sectorInfo select 6;
		_load_markerPos = _sectorInfo select 7;
		_load_captured = _sectorInfo select 8;
		
		
		missionProfileNamespace setVariable [_marker, [_load_currentPop,_load_startPop,_sectorStatics,_sectorFlak,_load_sectorUnits,_load_sectorVeh,_load_patrolNum,_load_markerPos,_load_captured]];





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







	} forEach OL_aa_sector_array;








	OL_intel_array = _OL_intel_array;
	publicVariable "OL_intel_array";
	

	missionProfileNamespace setVariable ["OL_intel_array",OL_intel_array];
	


























};