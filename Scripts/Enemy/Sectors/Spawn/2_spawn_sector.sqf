
/*


["aa_mrkr_1"] execVM "Scripts\Enemy\Sectors\Spawn\2_spawn_sector_draft.sqf";


VARIABLES:

MARKER:

[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_patrolNum,_captured(True/False)];


UNIT:
_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];




*/



if (isServer) then {


	params ["_marker","_markerVarArray","_spawnedUnits","_spawnedVehicles"];
	
	
	_marker = _this select 0;

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




	_speakers = [
		"Male01Ger",
		"Male02Ger",
		"Male03Ger",
		"Male04Ger",
		"Male05Ger"
	];




	_spawnedUnits = [];
	_spawnedVehicles = [];;



	if ( _secured ) exitWith { hint "Sector is secured";};





	//*****************************************************************************************
	//
	//
	//   	           SPAWN UNITS 
	//
	//
	//*****************************************************************************************
	
	if ( (count _sectorUnits > 0) && !(_currentPop == 0) ) then {
	
	
	
	
		//*********************************************************************
		//
		//   	       SPAWN VEHICLES  [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
		//
		//*********************************************************************
			
		{
			//*****************************************************************************
			//             SPAWN VEHICLE
			//*****************************************************************************
			
			_unitInfo = _x;

			_unit = _unitInfo select 0;
			_marker = _unitInfo select 1;
			_type = _unitInfo select 2;
			_role = _unitInfo select 3;
			_pos =  _unitInfo select 4;
			_dir = _unitInfo select 5;
			_vehType = _unitInfo select 6;
			_static = _unitInfo select 7;
			_patrolGrpNum = _unitInfo select 8;
			
			
			_unit = createVehicle [_vehType, _pos, [], _dir, "NONE"];		
			_unit setPos _pos;
			
			{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
			
			
			//*****************************************************************************
			//             MP KILLED EVENT HANDLER / HOLD ACTION
			//*****************************************************************************
			[_unit] spawn OL_eh_enemy_sector;
			[_unit] spawn OL_ha_expl_veh;			
			
			
			//*****************************************************************************
			//             SET VEHICLE VARIABLE
			//*****************************************************************************
			_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
			
			_unit setVariable ["OL_enemy_unitInfo", _unitInfo];
			_unit setVariable ["OL_saveObject",true];
			
			_spawnedVehicles pushBack _unitInfo;
			
				

		} forEach _sectorVeh;
	
	
	
	
	
		//*********************************************************************
		//
		//   	         UNITS
		//
		//*********************************************************************
		
		_patrolGroups = []; 
   
		for "_i" from 1 to _patrolNum do { 
   
			_grp = createGroup [west, true];  
			_patrolGroups pushBack _grp;
			
		};   
		
		
		
		{
		
			private _unitInfo = _x;
			
			private _unit = _unitInfo select 0;
			private _marker = _unitInfo select 1;
			private _type = _unitInfo select 2;
			private _role = _unitInfo select 3;
			private _pos =  _unitInfo select 4;
			private _dir = _unitInfo select 5;
			private _vehType = _unitInfo select 6;
			private _static = _unitInfo select 7;
			private _patrolGrpNum = _unitInfo select 8;		

			
			if ( _role == "vehicle" ) then {
						
				_grp = createGroup [west, true]; 			

				_unit = _grp createUnit [_type, _pos, [], 0, "NONE"];
				[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
				[_unit] call OL_fnc_misc_opfor_ai_skill;

				_nearVehicles = nearestObjects [_unit, ["Car", "Tank"], 300];
				
				{
					_veh = _x;
					if ( (typeOf _veh == _vehType) ) then {
					
						[_unit,_veh] remoteExec ["moveInAny",_unit];
						{[_x] join _unit; } forEach crew _veh;
					};
					
				} forEach _nearVehicles;
				
						
				_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
		
				_unit setVariable ["OL_enemy_unitInfo", _unitInfo];
			
				{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
							
				_spawnedUnits pushback _unitInfo;
				
				//*****************************************************************************
				//             MP KILLED EVENT HANDLER
				//*****************************************************************************
				[_unit] spawn OL_eh_enemy_sector;
	
			};	
	

	
			if ( _role == "guard" ) then {
			
				_grp = createGroup [west, true]; 
				
				_unit = _grp createUnit [_type, _pos, [], 0, "CAN_COLLIDE"];
				[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
				[_unit] call OL_fnc_misc_opfor_ai_skill;
				_unit setFormDir _dir;
				_unit setPosATL _pos;
				{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
				
				_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
				_unit setVariable ["OL_enemy_unitInfo", _unitInfo];
				
				_spawnedUnits pushBack _unitInfo;
				
				//*****************************************************************************
				//             MP KILLED EVENT HANDLER
				//*****************************************************************************
				[_unit] spawn OL_eh_enemy_sector;
				[_unit] spawn OL_eh_enemy_arty;	
	
			};
			
			
			
			
			if ( _role == "sniper" ) then {
			
				_grp = createGroup [west, true]; 
			
				_unit = _grp createUnit [_type, _pos, [], 0, "CAN_COLLIDE"];
				[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
				[_unit] call OL_fnc_misc_opfor_ai_skill;
				_unit setFormDir _dir;
				_unit setPosATL _pos;
				_unit setUnitPos "UP";
				{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
				
				_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
				_unit setVariable ["OL_enemy_unitInfo", _unitInfo];
				
				_spawnedUnits pushBack _unitInfo;
				
				//*****************************************************************************
				//             MP KILLED EVENT HANDLER
				//*****************************************************************************
				[_unit] spawn OL_eh_enemy_sector;
				[_unit] spawn OL_eh_enemy_arty;	
	
			};
			
			
			
			if ( _role == "middle" ) then {
			
				_grp = createGroup [west, true]; 
			
				_unit = _grp createUnit [_type, _pos, [], 0, "CAN_COLLIDE"];
				[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
				[_unit] call OL_fnc_misc_opfor_ai_skill;
				_unit setFormDir _dir;
				_unit setPosATL _pos;
				_unit setUnitPos "MIDDLE";
				{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
				
				_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
				_unit setVariable ["OL_enemy_unitInfo", _unitInfo];
				
				_spawnedUnits pushBack _unitInfo;
				
				//*****************************************************************************
				//             MP KILLED EVENT HANDLER
				//*****************************************************************************
				[_unit] spawn OL_eh_enemy_sector;
				[_unit] spawn OL_eh_enemy_arty;	
	
			};
			

			if ( _role == "static" ) then {
				
				private ["_staticName"];
				
				_grp = createGroup [west, true]; 
				
				if ( typeName _static == "STRING" ) then {
				
					_staticName = _static;
					_static = missionNameSpace getVariable _static;
					
				} else {
				
					_staticName = _static;
				};
				
				_unit = _grp createUnit [_type, _pos, [], 0, "NONE"];
			   	[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0]; 
				[_unit] call OL_fnc_misc_opfor_ai_skill;
				[_unit,_static] remoteExec ["moveInGunner",_unit];

				{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
				
				_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_staticName,_patrolGrpNum];
				_unit setVariable ["OL_enemy_unitInfo", _unitInfo];
				
				_spawnedUnits pushBack _unitInfo;
						
				//*****************************************************************************
				//             MP KILLED EVENT HANDLER
				//*****************************************************************************
				[_unit] spawn OL_eh_enemy_sector;
				[_unit] spawn OL_eh_enemy_arty;			
			
			};
			
			
			
			
			if ( _role == "patrol" ) then {
				
				_grp = _patrolGroups select _patrolGrpNum;
				_unit = _grp createUnit [_type, _pos, [], 0, "NONE"];
				[_unit, (selectRandom _speakers)] remoteExec ["setSpeaker",0];
				[_unit] call OL_fnc_misc_opfor_ai_skill;
				_unit setDir _dir;
				{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
				
				_unitInfo = [_unit,_marker,_type,_role,_pos,_dir,_vehType,_static,_patrolGrpNum];
				_unit setVariable ["OL_enemy_unitInfo", _unitInfo];
				
				_spawnedUnits pushBack _unitInfo;
				
				//*****************************************************************************
				//             MP KILLED EVENT HANDLER
				//*****************************************************************************
				[_unit] spawn OL_eh_enemy_sector;
				[_unit] spawn OL_eh_enemy_arty;	
				

				
			};
		
			
		} forEach _sectorUnits;	


		//*****************************************************************************
		//             PATROL WAYPOINTS
		//*****************************************************************************		
		{
			//[_x, getMarkerPos _marker, 200] call CBA_fnc_taskPatrol;
			[_x, getMarkerPos _marker, 200, 7, "MOVE", "SAFE", "YELLOW", "LIMITED", "STAG COLUMN", "this call CBA_fnc_searchNearby", [3, 6, 9]] call CBA_fnc_taskPatrol;
		} forEach _patrolGroups;
		

		

		
		
		
		
		
		//********************************************************
		//
		//             SAVE MARKER VARIABLES
		//[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_captured(True/False)];
		//********************************************************

		missionProfileNamespace setVariable [_marker, 
			[_currentPop,_startPop,_sectorStatics,_sectorFlak,_spawnedUnits,_spawnedVehicles,_patrolNum,_markerPos,_secured]
		];		
		
		
	};
	
	
	




};