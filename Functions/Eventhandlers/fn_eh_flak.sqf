// [_unit] spawn OL_fnc_eh_flak_killed;

_unit = _this select 0;



_unit addEventHandler ["Killed", { 
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	OL_enemy_flak_array = OL_enemy_flak_array - [_unit];
	publicVariable "OL_enemy_flak_array";
			
	missionProfileNamespace setVariable [str _unit, false];	
	
}];



_unit addEventHandler ["Reloaded",{_unit setVehicleAmmo 1}];


