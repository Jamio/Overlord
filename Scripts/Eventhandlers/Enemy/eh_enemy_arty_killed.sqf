


_unit = _this select 0;


_unit addEventHandler ["Killed", { 
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	


	_unitInfo = _unit getVariable "OL_enemy_unitInfo";

	_marker = _unitInfo select 1;
	_vehicle = _unitInfo select 2;
				
	_markerVar = missionNamespace getVariable _marker;
				
	_totalPop = _markerVar select 0;
	_buildingNum = _markerVar select 1;
	_guardNum = _markerVar select 2;
	_patrolNum = _markerVar select 3;
	_vehicleNum = _markerVar select 4;
	_buildings = _markerVar select 5;
	_statics = _markerVar select 6;
	_flakArray = _markerVar select 7;
	_units = _markerVar select 8;	
	_vehicles = _markerVar select 9;	
	_mrkrText = _markerVar select 10;
	_secured = _markerVar select 11;
		
	if ( _unit isKindOf "Man" ) then { 

		_units = _units - [_unitInfo];
		_totalPop = _totalPop - 1;
	} else {

		_vehicles = _vehicles - [_unitInfo];

	};		
	
	
	missionNamespace setVariable [_marker, [_totalPop,_buildingNum,_guardNum,_patrolNum,_vehicleNum,_buildings,_statics,_flakArray,_units,_vehicles,_mrkrText,_secured]];

	OL_arty_array = OL_arty_array - [_vehicle];
			
			
	//*****************************************************************************
	//              SECTOR INFORMATION HINTS
	//*****************************************************************************
	if ( OL_sectorInfo ) then {	
	
		{
		
			if ( count OL_active_sectors == 0 ) exitWith { [10,["", "PLAIN"]] remoteExec ["cutText",_x]; };
			
			private _nearestMarker = [OL_active_sectors, _x] call BIS_fnc_nearestPosition; 
			
			if ( ((_x distance getMarkerPos _marker) <= OL_sector_act_dist) && (_nearestMarker isEqualTo _marker) ) then {
			
				private _sectorName = markerText _marker;
			
				[[_sectorName,_currentPop],OL_fnc_sector_notification] remoteExec ["spawn",_x];
				
			};
						
		} forEach allPlayers;
								
	};

	
			
}];