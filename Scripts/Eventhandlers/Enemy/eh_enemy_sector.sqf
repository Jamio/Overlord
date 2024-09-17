


_unit = _this select 0;


_unit addEventHandler ["Killed", { 
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	

	
	_grp = group _unit;



	_unitInfo = _unit getVariable "OL_enemy_unitInfo";

	_unit = _unitInfo select 0;
	_marker = _unitInfo select 1;
	_type = _unitInfo select 2;
	_role = _unitInfo select 3;
	_pos =  _unitInfo select 4;
	_dir = _unitInfo select 5;
	_vehType = _unitInfo select 6;
	_static = _unitInfo select 7;
	_patrolGrpNum = _unitInfo select 8;	

				
	_markerVarArray = missionProfileNamespace getVariable _marker;
				
	_currentPop = _markerVarArray select 0;
	_startPop = _markerVarArray select 1;
	_sectorStatics = _markerVarArray select 2;
	_sectorFlak = _markerVarArray select 3;	
	_sectorUnits = _markerVarArray select 4;
	_sectorVeh = _markerVarArray select 5;
	_patrolNum = _markerVarArray select 6;
	_markerPos = _markerVarArray select 7;
	_secured = _markerVarArray select 8;

		
	if ( _unit isKindOf "Man" ) then { 

		_sectorUnits = _sectorUnits - [_unitInfo];
		_currentPop = _currentPop - 1;

	} else {

		_sectorVeh = _sectorVeh - [_unitInfo];

	};	




	if ( (role == "patrol") && ({alive _x} count units _grp <= 0) ) then {

		_patrolNum = _patrolNum - 1;

	};

	
	
	
	//********************************************************
	//
	//             SAVE MARKER VARIABLES
	//[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_captured(True/False)];
	//********************************************************

	missionProfileNamespace setVariable [_marker, 
		[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_patrolNum,_markerPos,_secured]
	];		
	
			
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
	
	
	
	
	
	//*********************************************************************
	//
	//   	         SHOW OBJECTIVE ON MAP
	//
	//*********************************************************************
	_completed = _marker call BIS_fnc_taskCompleted;	
	_alphaMarker = markerAlpha _marker;
	
	if ( !(_completed) && (_alphaMarker == 0) ) then {

		[_marker, (getMarkerPos _marker)] call BIS_fnc_taskSetDestination;

		_marker setMarkerAlpha 1;
		
		switch (true) do {
		
			case (_marker == "mortar_mrkr_1"): {
				[_marker, 
						[
						"Capture the enemy mortar nest.<br/><br/>NOTE: Location can be found by finding Intel at the AA sites. The enemy will be able to call in mortar support until it is captured.",
						"Capture Mortars",
						_marker
						]
					] call BIS_fnc_taskSetDescription;
			};
			
			case ( (_marker == "mg_mrkr_1") || (_marker == "mg_mrkr_2") || (_marker == "mg_mrkr_3") ): {
				[_marker, 
						[
						"Capture the enemy machine gun nest.",
						"Capture MG Nest",
						_marker
						]
					] call BIS_fnc_taskSetDescription;
			};
			
			case ( (_marker == "patrol_mrkr_1") || (_marker == "patrol_mrkr_2") ): {
				[_marker, 
						[
						"Destroy the enemy patrol.",
						"Destroy Enemy Patrol",
						_marker
						]
					] call BIS_fnc_taskSetDescription;
			};
			
			
			default { };
		
		};
		
		[_marker,"CREATED"] call BIS_fnc_taskHint; 
			
	};
		
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
			
			
}];