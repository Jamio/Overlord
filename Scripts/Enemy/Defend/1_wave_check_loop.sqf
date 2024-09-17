/*


[] execVM "Scripts\Enemy\Defend\1_wave_check_loop.sqf";
[] spawn OL_defend_wave_check_1;




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
	
	
	_spawnPos = [
		[2850.82,2566.58,-3.8147e-006], 
		[2887.66,2376.36,-3.8147e-006], 
		[2835.29,2340.7,-3.8147e-006], 
		[2712.34,2306.17,-3.8147e-006], 
		[2636.49,2302.32,-3.8147e-006], 
		[2753.22,2598.32,-3.8147e-006]
	];	
	
	
	

	
	







if (isServer) then {

	params ["_wave","_grpNum","_spawnNum"];
	
	_wave = true;
	
	while { sleep 1; _wave } do {
	
	
		_info = missionNameSpace getVariable "OL_enemy_defense";
		
		_text = _info select 0;
		_waveNum = _info select 1;
		_reinfNum = _info select 2;
		_currentUnits = {alive _x} count OL_enemy_attack_units;	
		_totalRemain = _waveNum - _currentUnits;

		//**********************************************************
		//       REVEAL CHECK
		//**********************************************************		
		if (  (_currentUnits <= 25)   ) then {
					
			{
				_unit = _x;
				{
					[_x,[_unit, 4]] remoteExec ["reveal",_x];
				} forEach allPlayers;
					
			} forEach OL_enemy_attack_units;
					
		};
		
		
		
		//*****************************************************************************
		//
		//              SPAWN UNITS
		//
		//*****************************************************************************

		if ( (_currentUnits < _reinfNum) && (_currentUnits < _totalRemain) ) then {
		

		
			if ( _totalRemain < _reinfNum ) then { 
			
				_spawnNum = _totalRemain;
				
			} else {
			
				_spawnNum = _reinfNum - _currentUnits;		
			
			};
			
			
			if ( _spawnNum >= 10) then { _grpNum = 10 } else { _grpNum = _spawnNum };
		
				_grp = createGroup [west, true]; 
				_pos = selectRandom _spawnPos;
				
				for "_i" from 1 to _grpNum do {
						
					_unit = _grp createUnit [selectRandom _unitArray, _pos, [], 0, "NONE"];
					[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
					[_unit] call OL_fnc_misc_opfor_ai_skill;
					[_unit] spawn OL_eh_enemy_defense;
					
					{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
									
					OL_enemy_attack_units pushback _unit;

							
				};	
				
				[_grp, [[2562.58,2545.69,0], 100, 100, 0, false],"AWARE","NO CHANGE","FULL"] call CBA_fnc_taskSearchArea;

		
		};
	
		//**********************************************************
		//        VICTORY CHECK
		//**********************************************************		
		if (  (_waveNum <= 4)   ) then {
					
			{
				_x setDamage 1;
					
			} forEach OL_enemy_attack_units;
			
			_wave = false;
			
		};
		
		
		
		
		sleep 5;
		
	
	};
	
	
	
	



	terminate OL_convoyScript_1;
	{(vehicle _x) limitSpeed 5000;(vehicle _x) setUnloadInCombat [true, false]} forEach (units OL_enemy_convoy_grp_1);
	OL_enemy_convoy_grp_1 enableAttack true;


	//*****************************************************************************
	//              SECTOR INFORMATION HINTS
	//*****************************************************************************
	["defend_task_2","SUCCEEDED"] call BIS_fnc_taskSetState;




	[] spawn OL_defend_wave_start_2;







};