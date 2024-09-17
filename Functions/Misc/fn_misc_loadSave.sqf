//[] spawn OL_fnc_misc_loadsave;

if (isServer) then {



	private ["_currentTickets","_save","_respawnTickets","_objectArray","_arsenalobjectArray","_unitScores","_cpInventoryArray"];



	_currentTickets = [missionNamespace] call BIS_fnc_respawnTickets;

	//*******************************************************
	//      SET DATE / TIME		
	//*******************************************************
	private _date = missionProfileNamespace getVariable ["OL_mission_date",date];
	[_date, true, false] call BIS_fnc_setDate;


	//*******************************************************************************
	//      CHECK IF MISSION IS STARTED
	//*******************************************************************************		
	if (OL_mission_started) then {

		[0] spawn OL_respawn_manager;
		
		//*****************************************************************
		//         BASE CLEANUP
		//*****************************************************************
		_baseObjects = (getMissionLayerEntities "OL Main Base") select 0;
		{  deleteVehicle _x;  } forEach _baseObjects;
		
	};
	
	
	
	//**********************************************************
	//
	//              GET SAVE INFO
	//
	//**********************************************************
	_respawnTickets = missionProfileNamespace getVariable ["OL_saveFile_tickets", _currentTickets];
	_objectArray = missionProfileNamespace getVariable ["OL_saveFile_objects", []];
	_arsenalobjectArray = missionProfileNamespace getVariable ["OL_saveFile_arsenal_objects", []];



	//**********************************************************
	//
	//            SET SAVE VARIABLES
	//
	//**********************************************************
	[missionNamespace,(- _currentTickets) + _respawnTickets] call BIS_fnc_respawnTickets;
	

	
	
	
	//**********************************************************
	//
	//            LOAD PLACED OBJECTS
	//
	//**********************************************************

	{
		
		_x params ["_name","_typ","_pos","_dir","_dam"];

		_oldobject = missionNamespace getVariable [_name, objNull];
		
		if ( !(isNull _oldobject) ) then {
			
			_oldobject setPosWorld _pos;
			_oldobject setDir _dir;

			_oldobject setDamage _dam;
			
			if ( !(alive _oldobject) ) then {
				
				deleteVehicle _oldobject;
				
			};
			
		} else {
		
			_object = createVehicle [_typ,_pos,[],0,"can_collide"];
			_object setVehicleVarName _name;
			_object call BIS_fnc_objectVar;
			publicVariable _name;
			
			_object setPosWorld _pos;

			_object setDir _dir;

			_object setDamage _dam;

			_object setVariable ["OL_saveObject",true,true];
			
			if ( !(alive _object) ) then {
				
				deleteVehicle _object;
				
			};
			
		};
		
	
	} forEach _objectArray;


	{
		
		_x params ["_name","_typ","_pos","_dir","_dam"];
		
		_object = createVehicle [_typ,_pos,[],0,"can_collide"];
		_object setVehicleVarName _name;
		_object call BIS_fnc_objectVar;
		publicVariable _name;
		
		_object setPosWorld _pos;

		_object setDir _dir;

		_object setDamage _dam;

		_object setVariable ["OL_arsenalObject",true,true];
		[[_object],OL_arsenal_load] remoteExec ['spawn',0];
		
		//****************************************
		//         ACE CHECK
		//****************************************
		if ( (isClass(configFile >> "CfgPatches" >> "ace_main")) ) then {
					
			 [[_object, true, [0, 2, 0], 45],ace_dragging_fnc_setDraggable] remoteExec ['call',0];
			 [[_object, true, [0, 3, 1], 10],ace_dragging_fnc_setCarryable] remoteExec ['call',0];
						 
		};		
		
	
		if ( !(alive _object) ) then {
			
			deleteVehicle _object;
			
		};
			

		
	
	} forEach _arsenalobjectArray;


























	//**********************************************************
	//
	//           MOVE RALLYPOINT MARKERS
	//
	//**********************************************************

	if ( !(isNil "able_group") ) then {

		private _group = able_group;

		private _rallyPointVarName = (str _group) + ' Rally Point'; 

		private _oldRally = missionProfileNamespace getVariable [_rallyPointVarName, ""];

		if ( !(_oldRally == "") ) then {

			_rallyPoint = missionNameSpace getVariable _oldRally;

			
			"able_rp_marker" setMarkerAlpha 1;
			"able_rp_marker" setMarkerPos (getPos _rallyPoint);
			
		};
	};




		if ( !(isNil "baker_group") ) then {

			private _group = baker_group;

			private _rallyPointVarName = (str _group) + ' Rally Point'; 

			private _oldRally = missionProfileNamespace getVariable [_rallyPointVarName, ""];

			if ( !(_oldRally == "") ) then {

				_rallyPoint = missionNameSpace getVariable _oldRally;
	
				
				"baker_rp_marker" setMarkerAlpha 1;
				"baker_rp_marker" setMarkerPos (getPos _rallyPoint);
				
			};
		};



		if ( !(isNil "charlie_group") ) then {

			private _group = charlie_group;

			private _rallyPointVarName = (str _group) + ' Rally Point'; 

			private _oldRally = missionProfileNamespace getVariable [_rallyPointVarName, ""];

			if ( !(_oldRally == "") ) then {

				_rallyPoint = missionNameSpace getVariable _oldRally;
	
				
				"charlie_rp_marker" setMarkerAlpha 1;
				"charlie_rp_marker" setMarkerPos (getPos _rallyPoint);
				
			};
		};



	//**********************************************************
	//            LOAD FLAG STATUS
	//**********************************************************
	if ( missionProfileNamespace getVariable ["OL_flagRaised",false] ) then {

		[flag_1,"\ca\misc\data\usa_vlajka.paa"] remoteExec ["setFlagTexture",0];
		
	};



	//*************************************************************
	//       ENABLE SECTORS IF NOT ALREADY
	//*************************************************************
	if ( !(OL_sectors_enabled) && (OL_mission_started) ) then {

		OL_sectors_enabled = true;
		publicVariable "OL_sectors_enabled";
		
		[] spawn OL_paratrooper_cleanup;
		
		if ( !("vehicle_patrol_1" call BIS_fnc_taskCompleted) ) then { [] spawn OL_patrol_spawn_patrol_veh_1; };
		if ( !("vehicle_patrol_2" call BIS_fnc_taskCompleted) ) then { [] spawn OL_patrol_spawn_patrol_veh_2; };
		
	};
	
	
	


};