


_unit = _this select 0;


_unit addEventHandler ["Killed", { 
	params ["_unit", "_killer", "_instigator", "_useEffects","_grpNum"];


	_info = missionNameSpace getVariable "OL_enemy_defense";
	

	_text = _info select 0;
	_waveNum = _info select 1;
	_reinfNum = _info select 2;
	_currentUnits = {alive _x} count OL_enemy_attack_units;	
	_waveNum = _waveNum - 1;
	
	
	//*****************************************************************************
	//              SET VARIABLE
	//*****************************************************************************
	missionNameSpace setVariable ["OL_enemy_defense",[_text,_waveNum,_reinfNum]];
	
	//*****************************************************************************
	//              SECTOR INFORMATION HINTS
	//*****************************************************************************

	if ( OL_sectorInfo ) then {	
	
		{
			
			[[_text,_waveNum],OL_fnc_sector_notification] remoteExec ["spawn",_x];
				
				
		} forEach allPlayers;
								
	};	
	
			
			
}];