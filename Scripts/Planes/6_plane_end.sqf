



if (isServer) then {



	//***********************************************************************************
	//              WAIT UNTIL PLANES IN MAP
	//***********************************************************************************	
	private _timeOut = 120;

	while { _timeOut > 0 } do {

		_timeOut = _timeOut - 1;

		if ( ({_x inArea "map_area"} count OL_respawn_planes_fly > 0) ||  (count OL_respawn_planes_fly == 0) ) then {

			_timeOut = 0;

		};

		sleep 1;

	};




	sleep 10;


	//***********************************************************************************
	//              WAIT UNTIL PLANES OUT OF MAP
	//***********************************************************************************	
	private _timeOut = 150;

	while { _timeOut > 0 } do {

		_timeOut = _timeOut - 1;

		private _planeCountAlive = {alive _x} count OL_respawn_planes_fly;
		private _planeCountInArea = {!(_x inArea "map_area") && (alive _x)} count OL_respawn_planes_fly;

		if ( (_planeCountInArea == _planeCountAlive) || (_planeCountAlive == 0) ) then {

			_timeOut = 0;

		};

		sleep 1;

	};












	//*************************************************************
	//   REMOVE ONEACHFRAME
	//*************************************************************
	removeMissionEventHandler ["EachFrame", OL_plane_eachFrame];


	//*************************************************************
	//  DELETE RESPAWN PLANES
	//*************************************************************

	{  

		_plane = _x; 
		{ _plane deleteVehicleCrew _x; } forEach crew _x;  
		deleteVehicle _plane; 

	} forEach OL_respawn_planes_fly;   

	OL_respawn_planes_fly = [];
	publicVariable "OL_respawn_planes_fly";



/*
	//*************************************************************
	//   ALLOW DAMAGE
	//*************************************************************
	{

		[_x,true] remoteExec ["allowDamage",_x];

	} forEach allUnits;
*/








	//*************************************************************
	//   MUSIC
	//*************************************************************
	OL_jukeBox = true;
	publicVariable "OL_jukeBox";
	{  [[_x],OL_fnc_misc_jukeBox] remoteExec ["spawn",_x]; } forEach allPlayers;






	//*************************************************************
	//       ENABLE SECTORS IF NOT ALREADY
	//*************************************************************
	if ( !(OL_sectors_enabled) ) then {

		OL_sectors_enabled = true;
		publicVariable "OL_sectors_enabled";
		
		[] spawn OL_paratrooper_cleanup;
		
		if ( !("vehicle_patrol_1" call BIS_fnc_taskCompleted) ) then { [] spawn OL_patrol_spawn_patrol_veh_1; };
		if ( !("vehicle_patrol_2" call BIS_fnc_taskCompleted) ) then { [] spawn OL_patrol_spawn_patrol_veh_2; };
		
	};






		
		
	//*******************************************************
	//             DEBUG
	//*******************************************************
	if ( OL_debugInfo ) then { ["Cleanup Complete: Planes, Dead, AI"] remoteExec ["systemChat",0];  };	
		
		
		



	//*************************************************************************
	//              KILL INCAPACITATED ENEMY
	//*************************************************************************		
	{ 

		if ( (side _x == WEST) && (lifeState _x == "INCAPACITATED") ) then {
			
			_x setDamage 1;
		
		};

	} forEach allUnits;




	//*************************************************************************
	//
	//             DELETE DEAD UNIT MANAGER   
	//
	//*************************************************************************	
	//****************************************************************
	//                HIDE ALL DEAD BODIES
	//****************************************************************
	private _headlessClients = entities "HeadlessClient_F";
	private _humanPlayers = allPlayers - _headlessClients;
	
	private _dead = [];

	{ 
		
		private _nearestPlayer = [_humanPlayers, _x] call BIS_fnc_nearestPosition;
		
		if ( _x distance _nearestPlayer > 50 ) then {
			
			if ( (getPosATL _x select 2) <= 1 ) then { [_x] remoteExec ["hideBody",_x]; }; 
			
			_dead pushBack _x;		
			
		};


	} forEach allDead;





	sleep 10;
			

	//****************************************************************
	//                DELETE UNITS
	//****************************************************************
	{ 
	
		moveOut _x;
		deleteVehicle _x;

	} forEach _dead;

	//****************************************************************
	//                DELETE VEHICLES
	//****************************************************************
	private _headlessClients = entities "HeadlessClient_F";
	private _humanPlayers = allPlayers - _headlessClients;

	{

		private _vehicle = _x;
		private _nearestPlayer = [_humanPlayers, _vehicle] call BIS_fnc_nearestPosition;

		if (damage _x >= 1) then {

			if ( (_vehicle distance _nearestPlayer > 250) && (_vehicle getVariable ["OL_allowDelete", true]) ) then {

				deleteVehicle _vehicle;

			};

		}

	} forEach vehicles;





	//*******************************************************
	//             SAVE GAME
	//*******************************************************
	[] spawn OL_fnc_misc_saveMission;


	//*************************************************************
	//       SPAWN RESPAWN MANAGER
	//*************************************************************
	[OL_respawn_timer] spawn OL_respawn_manager;







};