// [] execVM "Scripts\Enemy\Sectors\Spawn\1_sector_manager.sqf";



if (isServer) then {

	params ["_mrkr","_sectors","_mrkrTextSectors","_playerArray"];



	
	//********************************************************************
	//                       GET ALIVE PLAYERS
	//********************************************************************
	_headlessClients = entities "HeadlessClient_F";
	_humanPlayers = allPlayers - _headlessClients;


	_playerArray = [];

	{

		_player = _x;
	
		{
		
			if ( alive _x ) then { _playerArray pushBack _x; };
		
		} forEach units group _player;

	} forEach _humanPlayers;





	//********************************************************************
	//                       SPAWN SECTORS
	//********************************************************************

	if ( (count OL_active_sectors >= OL_maxSectors) ) then { 	["Maximum Active Sectors Reached"] remoteExec ["hintSilent",0]; } else {
	
		{



				
			_mrkr = _x;

			if ( !(_mrkr in OL_active_sectors) && (count OL_active_sectors < OL_maxSectors) && (( {(alive _x) && (_x distance getMarkerPos _mrkr <= OL_sector_act_dist) } count _playerArray) > 0) ) then {


				[_mrkr] spawn OL_sector_spawn;
				OL_active_sectors pushBack _mrkr;

				//*******************************************************
				//             DEBUG
				//*******************************************************
				if ( OL_debugInfo ) then { [format ["Active Sectors: %1",OL_active_sectors]] remoteExec ["systemChat",0]; };



			};

			



		} forEach  OL_sector_array;

	};





	//********************************************************************
	//                  SPAWN SECTORS SMALL
	//********************************************************************
		{



				
			_mrkr = _x;

			if ( !(_mrkr in OL_active_sectors) && (( {(alive _x) && (_x distance getMarkerPos _mrkr <= OL_sector_act_dist) } count _playerArray) > 0) ) then {


				[_mrkr] spawn OL_sector_spawn;
				OL_active_sectors pushBack _mrkr;

				//*******************************************************
				//             DEBUG
				//*******************************************************
				if ( OL_debugInfo ) then { [format ["Active Sectors: %1",OL_active_sectors]] remoteExec ["systemChat",0]; };

			};

			



		} forEach  OL_sector_array_small;








	//********************************************************************
	//                       DELETE UNITS
	//********************************************************************

		{

			_marker = _x;

			//_playerNear = [getMarkerPos _marker, OL_sector_act_dist] call CBA_fnc_nearPlayer;
			
			

			if (  (( {(alive _x) && (_x distance getMarkerPos _marker <= OL_sector_act_dist) } count _playerArray) <= 0)  ) then {

				_markerVarArray = missionProfileNamespace getVariable _marker;
				
				_sectorUnits = _markerVarArray select 4;
				_sectorVeh = _markerVarArray select 5;					


				{

					_unit = _x select 0;
					deleteVehicle _unit;
						
				} forEach _sectorUnits;
				
				
				{
				
					_veh = _x select 0;
					_distance = OL_sector_act_dist - 15;
					_crew = crew _veh; 
 
					if ( (_veh distance getMarkerPos _marker <= _distance) && ({isPlayer _x} count _crew == 0) ) then {
					
						deleteVehicle _veh;
					};
						
				} forEach _sectorVeh;


				OL_active_sectors = OL_active_sectors - [_marker];
					
					
					
				{ 
					if ( _x distance (getMarkerPos _marker) < 300 ) then {
						deleteVehicle _x;
					};
					
				} forEach allDead;
					
					
				//*******************************************************
				//             DEBUG
				//*******************************************************
				if ( OL_debugInfo ) then { [format ["Sector Deactivated: %1",_marker]] remoteExec ["systemChat",0]; };
				
			};



		} forEach OL_active_sectors;












	//********************************************************************
	//               ACTIVE SECTOR UPDATE / CAPTURE
	//********************************************************************

	{

		_marker = _x;


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


				
		if (  (_currentPop <= 1) && (({alive _x} count _sectorFlak) == 0)  ) then {
				
			OL_active_sectors = OL_active_sectors - [_marker]; 
			
			OL_sector_array = OL_sector_array - [_marker];
			OL_sector_array_small = OL_sector_array_small - [_marker];

			[_marker,"SUCCEEDED"] call BIS_fnc_taskSetState;
			missionProfileNamespace setVariable [_marker,"SUCCEEDED"];
			
			
			if ( (_marker == "patrol_mrkr_1") || (_marker == "patrol_mrkr_2") ) then {
			
				    deleteMarker _marker;
			
			} else {
		
				_marker setMarkerColor "colorBLUFOR";
			
			};

			_secured = true;
			
			//********************************************************************
			//               CHECK IF ARTY AND REMOVE
			//********************************************************************	

			if ( (_marker == "mortar_mrkr_1") || (_marker == "arty_mrkr_1") ) then {

					OL_arty_sector_array = OL_arty_sector_array - [_marker];
					publicVariable "OL_arty_sector_array";
					missionProfileNamespace setVariable ["OL_arty_sector_array",OL_arty_sector_array];
					
			};
			
			//********************************************************************
			//               MAIN TASK CHECK
			//********************************************************************			
			_task_1 = "main_obj_mrkr" call BIS_fnc_taskCompleted;
			_task_2 = "main_obj_2" call BIS_fnc_taskCompleted;
			_task_3 = "main_obj_3" call BIS_fnc_taskCompleted;
			_task_4 = "main_obj_4" call BIS_fnc_taskCompleted;
			_task_5 = "main_obj_5" call BIS_fnc_taskCompleted;


			if ( (_task_1) && (_task_2) && (_task_3) && (_task_4) && (_task_5) ) then {

				["main_obj_parent_task","SUCCEEDED"] call BIS_fnc_taskSetState;
				missionProfileNamespace setVariable ["main_obj_parent_task","SUCCEEDED"];

			};
		
		
			
			//********************************************************
			//
			//             SAVE MARKER VARIABLES
			//[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_captured(True/False)];
			//********************************************************

			missionProfileNamespace setVariable [_marker, 
				[_currentPop,_startPop,_sectorStatics,_sectorFlak,_sectorUnits,_sectorVeh,_patrolNum,_markerPos,_secured]
			];
			
			
			//*******************************************************
			//             SAVE GAME
			//*******************************************************
			[] spawn OL_fnc_misc_saveMission;
			
					
		};
				
				
		if (  (_currentPop <= (_startPop * .25))   ) then {
					
			{
				_unit = _x select 0;
				{
					[_x,[_unit, 4]] remoteExec ["reveal",_x];
				} forEach allPlayers;
					
			} forEach _sectorUnits + _sectorVeh;
					
		};


	} forEach OL_active_sectors;
	
	
	/*
	//********************************************************************
	//               MARKER OBJECTIVE STATUS
	//********************************************************************	
	if ( OL_sectorInfo ) then {
	
		{ 
			
			if ( count OL_active_sectors == 0 ) exitWith { [10,["", "PLAIN"]] remoteExec ["cutText",_x]; };
			
			private _nearestMarker = [OL_active_sectors, _x] call BIS_fnc_nearestPosition; 
			 
			if ( (_x distance getMarkerPos _nearestMarker) <= OL_sector_act_dist ) then { 
			 
				private _markerVarArray = missionProfileNamespace getVariable _nearestMarker; 
				private _currentPop = _markerVarArray select 0; 
				private _sectorName = markerText _nearestMarker; 
			 
				[[_sectorName,_currentPop],OL_fnc_sector_notification] remoteExec ["spawn",_x]; 
			 
			} else { 
			 
				[10,["", "PLAIN"]] remoteExec ["cutText",_x];
			  
			}; 
	 
	 
		} forEach allPlayers;
		
	};
	*/





	//********************************************************************
	//               SPAWN TASK DEFEND
	//********************************************************************
	
	if ( ({[_x] call BIS_fnc_taskState == "SUCCEEDED"} count ["main_obj_parent_task","radar_mrkr"]) == 2 ) then {
	
		[] spawn OL_tasks_defend_1; 
	
	};




	true
	


};