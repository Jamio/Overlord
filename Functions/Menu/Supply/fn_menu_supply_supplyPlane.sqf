// ["drop_mrkr",[1179.86,1123.79]] execVM "Functions\Menu\Supply\2_spawn_supplyPlane.sqf";
/*

	 [_cargo, true, [0, 2, 0], 45] call ace_dragging_fnc_setDraggable;
	 [_cargo, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;

*/

if (isServer) then {


	_mrkr = _this select 0;
	_pos = _this select 1;





	_plane = createVehicle [ "LIB_C47_RAF_bob", [-1093.78,-746.958,500], [], 40, "FLY" ];
	_grp = createVehicleCrew _plane;


	_plane enableVehicleCargo true;
	_plane engineOn true;


	{ _x setCombatBehaviour "CARELESS"; _x setCaptive true;  } forEach units _grp;


	_plane limitSpeed 300; 
	_plane setVelocityModelSpace [0, 55.5, 0]; 
	_plane flyInHeightASL [500, 500, 500];

	//****************************************
	//       ADD UNITS TO ZEUS
	//****************************************
	 { 
	  _x addCuratorEditableObjects [[_plane],true]; 
	 } forEach allCurators;  







	//*************************************************************
	//           SET PLANE POS
	//*************************************************************
	_plane setPos [-1093.78,-746.958,400];



	_plane setVariable ["OL_supplyMarker", _mrkr];
	_plane setVariable ["OL_supplyScriptDone", false];
	
	

	_wp1 = _grp addWaypoint [_pos, 0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointSpeed "NORMAL";
	_wp1 setWaypointStatements ["true", "
		if (isServer) then {
			_veh = vehicle this;
		
			[[_veh],OL_fnc_menu_supply_spawnCargo] remoteExec ['spawn',2];
		};


	"];



	_wp2 = _grp addWaypoint [[5882.93,5903.32,0], 1];
	_wp2 setWaypointType "MOVE";
	_wp2 setWaypointStatements ["true", "

		_veh = vehicle this;

		{ _veh deleteVehicleCrew _x; } forEach crew _veh;  
		deleteVehicle _veh; 

	"];



	hint "Waypoints Set";


};