// [_unit] spawn OL_fnc_eh_startUnitsKilled;

_unit = _this select 0;



_unit addEventHandler ["Killed", { 
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	missionProfileNamespace setVariable [str _unit, false];	
		
	
}];






