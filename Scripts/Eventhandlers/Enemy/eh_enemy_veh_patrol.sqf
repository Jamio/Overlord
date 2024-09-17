


_unit = _this select 0;


_unit addEventHandler ["Killed", { 
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	private _grp = group _unit;

	private _taskInfo = _grp getVariable "OL_enemy_taskInfo";

	private _task = _taskInfo select 0;	
	private _totalPop = _taskInfo select 1;
	private _patrolScript = _taskInfo select 2;
	private _found = _taskInfo select 3;
	private _vehArray = _taskInfo select 4;
	private _veh = _vehArray select 1;
	private _totalPop = _totalPop - 1;


	terminate _patrolScript;
	
	
	//*****************************************************************************
	//              DELETE WAYPOINTS
	//*****************************************************************************

	for "_i" from count waypoints _grp - 1 to 0 step -1 do
	{
		deleteWaypoint [_grp, _i];
		

	};
	
	
	
	
	//*****************************************************************************
	//              SET FUEL
	//*****************************************************************************
	{ _x setFuel 0;} forEach _vehArray;


	//*****************************************************************************
	//              SUCCESS CHECK
	//*****************************************************************************
	if ( (_totalPop <= 1) ) then {	
		[_task,"SUCCEEDED"] call BIS_fnc_taskSetState;
		missionProfileNamespace setVariable [_task,"SUCCEEDED"];
						
	};




	
	//*****************************************************************************
	//              SECTOR INFORMATION HINTS
	//*****************************************************************************
	if ( OL_sectorInfo ) then {	
	
		{

			private _positions = [getPos _unit]; 
			
			if ( count OL_active_sectors == 0 ) then { 
			
				{ 
					 _pos = getMarkerPos _x; 
					 _positions pushBack _x; 
					 
				} forEach OL_active_sectors; 
			};
		
			private _nearestPos = [_positions, _x] call BIS_fnc_nearestPosition; 
			
			if ( ((_x distance _nearestPos) <= OL_sector_act_dist) && (_nearestPos isEqualTo (getPos _unit)) ) then {
			
				private _sectorName = "Enemy Convoy";
			
				[[_sectorName,_totalPop],OL_fnc_sector_notification] remoteExec ["spawn",_x];
				
			};
						
		} forEach allPlayers;
								
	};


	//*********************************************************************
	//
	//   	         SHOW OBJECTIVE DESCRIPTION
	//
	//*********************************************************************
	_completed = _task call BIS_fnc_taskCompleted;	

	
	if ( !(_completed) && !(_found) ) then {

		[_task, [
			"Ambush and destroy the enemy convoy.",
			"Destroy Enemy Convoy",
			""
				]
			] call BIS_fnc_taskSetDescription;
	
		
		[_task,"CREATED"] call BIS_fnc_taskHint; 
		
		[_task,_veh] call BIS_fnc_taskSetDestination;
		
		
		//**************************************************************
		//
		//           SPAWN INFANTRY
		//
		//**************************************************************
		//*******************************************************
		//             UNIT INFO
		//*******************************************************

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
		
		//**************************************************************
		//          GROUP #1
		//**************************************************************

		for "_i" from 1 to 12 do {
				
			_unit = _grp createUnit [selectRandom _unitArray, _veh, [], 0, "CARGO"];
			[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
			[_unit,_veh] remoteExec ["moveInCargo",_unit];
			[_unit] spawn OL_eh_enemy_veh_patrol;
			
			{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
							
				
		};
		    
	};



	_found = true;
	
	
	//********************************************************
	//
	//             SAVE MARKER VARIABLES
	//[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_captured(True/False)];
	//********************************************************
	_grp setVariable ["OL_enemy_taskInfo",[_task,_totalPop,_found]];


	_grp setVariable ["OL_enemy_taskInfo", [_task,_totalPop, _patrolScript, _found,_vehArray]];
		
	
			

	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
			
			
}];