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
	
	
	_spawnPos = [
		[2637.83,2826.2,0], 
		[2549.04,2746.67,0], 
		[2405.13,2703.86,0], 
		[2685.25,2746.95,0], 
		[2439.33,2744.79,0], 
		[2586.19,2855.87,0]
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
	
	
	
	


	terminate OL_convoyScript_2;
	{(vehicle _x) limitSpeed 5000;(vehicle _x) setUnloadInCombat [true, false]} forEach (units OL_enemy_convoy_grp_2);
	OL_enemy_convoy_grp_2 enableAttack true;



	sleep 5;
	
	//*****************************************************************************
	//              SECTOR INFORMATION HINTS
	//*****************************************************************************
	["defend_task_3","SUCCEEDED"] call BIS_fnc_taskSetState;



	OL_jukeBox = false;
	publicVariable "OL_jukeBox";

	[[],OL_end_victory] remoteExec ["spawn",0];





};