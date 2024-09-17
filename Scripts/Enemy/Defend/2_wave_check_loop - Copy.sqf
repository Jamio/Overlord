/*


[] execVM "Scripts\Enemy\Defend\2_wave_check_loop.sqf";
[] spawn OL_defend_wave_check_2;




*/



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
	
	
	
	
	
	

	
	







if (isServer) then {

	params ["_wave_1","_wave_2"];

	_totalStrength = count OL_enemy_attack_units;
	_nextWaveStrength =  _totalStrength * .50;


	_wave_1 = true;

	while { sleep 5; (_wave_1) } do {
	
	
	
		_remainingStrength = {alive _x} count OL_enemy_attack_units;
	
	
	
	
		//**********************************************************
		//       REVEAL CHECK
		//**********************************************************		
		if (  (_remainingStrength <= _nextWaveStrength)   ) then {
					
					
					
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
						
					_unit = _grp createUnit [selectRandom _unitArray, [2639.6,2828.75,0], [], 0, "NONE"];
					[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];

					{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
									
					OL_enemy_attack_units pushback _unit;

							
				};
				
				_wp1 = _grp addWaypoint [[2564.89,2576.66,0], 0];
				_wp1 setWaypointType "MOVE";
				
				_wp2 = _grp addWaypoint [[2536.99,2487.1,0], 1];
				_wp2 setWaypointType "SAD";
				
				_wp3 = _grp addWaypoint [[2564.89,2576.66,0], 2];
				_wp3 setWaypointType "SAD";
				
					
				
				
				//**************************************************************
				//          GROUP #2
				//**************************************************************
				_grp = createGroup [west, true]; 

				for "_i" from 1 to 10 do {
						
					_unit = _grp createUnit [selectRandom _unitArray, [2394.32,2708.66,1.14441e-005], [], 0, "NONE"];
					[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];

					{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
									
					OL_enemy_attack_units pushback _unit;

							
				};
				
				_wp1 = _grp addWaypoint [[2506.19,2554.45,3.8147e-005], 0];
				_wp1 setWaypointType "MOVE";
				
				_wp2 = _grp addWaypoint [[2615.85,2534.22,-3.8147e-006], 1];
				_wp2 setWaypointType "SAD";
				
				_wp3 = _grp addWaypoint [[2537.53,2481.3,0], 2];
				_wp3 setWaypointType "SAD";
				
				_wave_1 = false;
				
		};
	
	

		sleep 5;
	
	
	};






	_totalStrength = count OL_enemy_attack_units;
	_revealStrength =  _totalStrength * .50;


	_wave_2 = true;

	while { sleep 5; (_wave_2) } do {
	
	
		_remainingStrength = {alive _x} count OL_enemy_attack_units;
	
		//**********************************************************
		//       REVEAL CHECK
		//**********************************************************		
		if (  (_remainingStrength <= _revealStrength)   ) then {
					
			{
				_unit = _x;
				{
					[_x,[_unit, 4]] remoteExec ["reveal",_x];
				} forEach allPlayers;
					
			} forEach OL_enemy_attack_units;
					
		};
	
	
		//**********************************************************
		//       SUCCESS CHECK
		//**********************************************************
		if (  (_remainingStrength <= 4)   ) then {
					
			_wave_2 = false;
					
		};	
	
	
	
	
		sleep 5;
	
	
	};





	terminate OL_convoyScript_1;
	{(vehicle _x) limitSpeed 5000;(vehicle _x) setUnloadInCombat [true, false]} forEach (units OL_enemy_convoy_grp_1);
	OL_enemy_convoy_grp_1 enableAttack true;


	//*******************************************************
	//             DEBUG
	//*******************************************************
	if ( OL_debugInfo ) then { ["Wave 2 Defeated"] remoteExec ["hint",0]; };



	[[],OL_end_victory] remoteExec ["spawn",0];









};