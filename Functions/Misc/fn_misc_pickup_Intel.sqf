
private ["_intel","_marker"];



_intel = _this select 0;
_marker = _this select 1;








OL_intel_array = missionProfileNamespace getVariable "OL_intel_array";

{

	_intelMarker = _x select 2;
	_assignedMarker = _x select 3;
	_position = _x select 4;
	
	if ( _intelMarker == _marker ) then {
			
		OL_intel_array = OL_intel_array - [_x];
		
		// [_table,_intel,_intelMarker, _assignedZone,_intelPos,_captured]
		OL_intel_array pushBack	[objNull,objNull,_intelMarker,_assignedMarker,_position,true];
		
	};


} forEach OL_intel_array;


publicVariable "OL_intel_array";
missionProfileNamespace setVariable ["OL_intel_array",OL_intel_array];


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
		
		
		default { };
	
	};
	
	[_marker,"CREATED"] call BIS_fnc_taskHint; 
		
};