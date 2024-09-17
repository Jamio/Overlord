

if (isServer) then {



	private ["_unit","_group","_rallyPointVarName","_oldRally","_rallyPoint"];

	_unit = _this select 0;
	
	_group = group _unit;



	_rallyPointVarName = (str _group) + ' Rally Point'; 

	_oldRally = missionProfileNamespace getVariable [_rallyPointVarName, ""];


	
	

	if ( (_oldRally == "") ) then { 

		
		
		
		
			
		[_unit,"AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon"] remoteExec ["playMoveNow",_unit];
		
		sleep 1;


		_rallyPoint = createVehicle ["LIB_BasicAmmunitionBox_US", (_unit getRelPos [2, 0]), [], 0, "CAN_COLLIDE"];
		_rallyPoint setVariable ["OL_saveObject",true];
		_rallyPoint setVariable ["OL_rallyPoint",_rallyPointVarName, true];

		
		
		


		if ( !(isNil "able_group") ) then {

			if ( group _unit == able_group ) then {
			
				_rallyPoint setVehicleVarName "able_rallypoint";
				_rallyPoint call BIS_fnc_objectVar;
				publicVariable "able_rallypoint";
				
				"able_rp_marker" setMarkerAlpha 1;
				"able_rp_marker" setMarkerPos (getPos _rallyPoint);
				
				missionProfileNamespace setVariable [_rallyPointVarName, "able_rallypoint"];

				
			};
		};


		if ( !(isNil "baker_group") ) then {

			if ( group _unit == baker_group ) then {
			
				_rallyPoint setVehicleVarName "baker_rallypoint";
				_rallyPoint call BIS_fnc_objectVar;
				publicVariable "baker_rallypoint";
				
				"baker_rp_marker" setMarkerAlpha 1;
				"baker_rp_marker" setMarkerPos (getPos baker_rallypoint);
				
				missionProfileNamespace setVariable [_rallyPointVarName, "baker_rallypoint"];
				
			};
		};



		if ( !(isNil "charlie_group") ) then {

			if ( group _unit == charlie_group ) then {
			
				_rallyPoint setVehicleVarName "charlie_rallypoint";
				_rallyPoint call BIS_fnc_objectVar;	
				publicVariable "charlie_rallypoint";
				
				"charlie_rp_marker" setMarkerAlpha 1;
				"charlie_rp_marker" setMarkerPos (getPos charlie_rallypoint);
				
				missionProfileNamespace setVariable [_rallyPointVarName, "charlie_rallypoint"];
				
			};
		};
		
		











	} else {
	
	
	



		_oldRally = call compile _oldRally;
	
		if ( (_unit distance _oldRally <= 200) ) exitWith { 
	
			[["<t color='#ff0000' size='.7'>Cannot Deploy within 200m of previous Rallypoint.</t>",-1,-1,4,0,0,15],BIS_fnc_dynamicText] remoteExec ["spawn",_unit];
			
		};
	
	
	


		sleep 1; 

		deleteVehicle _oldRally;

	
	
	
	
			
		[_unit,"AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon"] remoteExec ["playMove",_unit];
		
		sleep 1;


		_rallyPoint = createVehicle ["LIB_BasicAmmunitionBox_US", (_unit getRelPos [2, 0]), [], 0, "CAN_COLLIDE"];
		_rallyPoint setVariable ["OL_saveObject",true];
		_rallyPoint setVariable ["OL_rallyPoint",_rallyPointVarName, true];

		
		
		


		if ( !(isNil "able_group") ) then {

			if ( group _unit == able_group ) then {
			
				_rallyPoint setVehicleVarName "able_rallypoint";
				_rallyPoint call BIS_fnc_objectVar;
				publicVariable "able_rallypoint";
				
				"able_rp_marker" setMarkerAlpha 1;
				"able_rp_marker" setMarkerPos (getPos _rallyPoint);
				
				missionProfileNamespace setVariable [_rallyPointVarName, "able_rallypoint"];
				
			};
		};


		if ( !(isNil "baker_group") ) then {

			if ( group _unit == baker_group ) then {
			
				_rallyPoint setVehicleVarName "baker_rallypoint";
				_rallyPoint call BIS_fnc_objectVar;
				publicVariable "baker_rallypoint";
				
				"baker_rp_marker" setMarkerAlpha 1;
				"baker_rp_marker" setMarkerPos (getPos baker_rallypoint);
				
				missionProfileNamespace setVariable [_rallyPointVarName, "baker_rallypoint"];
				
			};
		};



		if ( !(isNil "charlie_group") ) then {

			if ( group _unit == charlie_group ) then {
			
				_rallyPoint setVehicleVarName "charlie_rallypoint";
				_rallyPoint call BIS_fnc_objectVar;	
				publicVariable "charlie_rallypoint";
				
				"charlie_rp_marker" setMarkerAlpha 1;
				"charlie_rp_marker" setMarkerPos (getPos charlie_rallypoint);
				
				missionProfileNamespace setVariable [_rallyPointVarName, "charlie_rallypoint"];
				
			};
		};
	
	
	
	
	
	
	
	
	
	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

};