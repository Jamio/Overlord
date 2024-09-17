if (isServer) then {




	params ["_plane_1","_plane_2","_plane_3","_percentage"];



	//*************************************************************
	//           CREATE PLANES
	//*************************************************************
	OL_respawn_planes = [];
	OL_planes_crash = [];
	OL_respawn_planes_fly = [];

	private _planeParams = [
		[[-1216.45,2216.18,300],300],
		[[-1268.8,2151.43,296.652],296.652],
		[[-1280.77,2280.86,300],300]
	];

	{
		private _pos = _x select 0;
		private _height = _x select 1;
		private _crash = _x select 2;

		private _relativePosition = [_pos, [12000, 0, 0]] call BIS_fnc_vectorAdd;
		private _plane = ([_pos, 93.429, "LIB_C47_RAF_bob", independent] call bis_fnc_spawnvehicle) select 0;
		_plane limitSpeed 205; 
		_plane flyInHeight _height;
		_plane setPos _pos;
		_plane setVelocityModelSpace [0, 55.5, 0]; 
		_plane setVectorDirAndUp  [[1,-.08,0], [0,0,1]]; 

		{ _x disableAi "ALL"; } forEach units (group _plane);

		_wp = (group _plane) addWaypoint [_relativePosition, 0];
		_wp setWaypointType "MOVE";
		_wp setWaypointBehaviour "CARELESS";
		_wp setWaypointForceBehaviour true;

		OL_respawn_planes_fly pushBack _plane;
		OL_respawn_planes pushBack _plane;

	} forEach _planeParams;


	publicVariable "OL_respawn_planes";
	publicVariable "OL_planes_crash";
	publicVariable "OL_respawn_planes_fly";









	//*******************************************************
	//             CRASH CHANCE
	//*******************************************************
	_percentage = 0;
	if ( ((count OL_enemy_flak_array) > 0) ) then {


		_flakNum = count OL_enemy_flak_array;
		_percentage = _flakNum * 4;
		

		if ( (_percentage > random 100) ) then {

			_plane = selectRandom OL_respawn_planes;
			OL_planes_crash pushBack _plane;
			publicVariable "OL_planes_crash";

		};



	};

	//*******************************************************
	//             DEBUG
	//*******************************************************
	if ( OL_debugInfo ) then { [format ["Crash Chance: %1`/,\nPlanes Crash: %2\n",_percentage,OL_planes_crash]] remoteExec ["systemChat",0];  };
	


	{ 

		[_x] spawn OL_fnc_misc_set_plane; 
	  	_x limitSpeed 205; 

	} forEach OL_respawn_planes_fly;


	//*************************************************************
	//          ON EACH FRAME (SET PLANE FLIGHT)
	//*************************************************************
	OL_plane_eachFrame = addMissionEventHandler ["EachFrame", {

		{
			
			[_x, [0, 55.5, 0]] remoteExec ["setVelocityModelSpace",_x];
			[_x, [[1,-.08,0], [0,0,1]] ] remoteExec ["setVectorDirAndUp",_x];

		} forEach OL_respawn_planes_fly;

	}];

	



	sleep 1;



	//*************************************************************
	//           DELETE PARACHUTES
	//*************************************************************
	_allMObjects = allMissionObjects "";

	{

		if ( typeOf _x == "LIB_US_ParachuteLanded" ) then {

			deleteVehicle _x;

		};

	} forEach _allMObjects;




	//***********************************************************************************
	//              TRIGGER -- FLAK / 30-Secs
	//***********************************************************************************	
	_trg = createTrigger ["EmptyDetector", [-286.223,2142.47,0], false];
	_trg setTriggerArea [50, 1000, 0, true];
	_trg setTriggerActivation ["ANY", "PRESENT", false];
	_trg setTriggerStatements ["({_x in thisList} count OL_respawn_planes_fly > 0)", " [] spawn OL_planes_dialog; deleteVehicle thisTrigger; ", ""];
	_trg setTriggerInterval 2;




	//***********************************************************************************
	//              SPAWN PLANES END
	//***********************************************************************************	
	[] spawn OL_planes_end;





};