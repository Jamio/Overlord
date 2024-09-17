if (isServer) then {




	params ["_plane_1","_plane_2","_plane_3","_percentage"];



	//*************************************************************
	//           CREATE PLANES
	//*************************************************************
	_grp = createGroup [independent, true];
	_p_1 = [[-1216.45,2216.18,300], 94.516, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle; _plane_1 = _p_1 select 0; 
	_p_2 = [[-1268.8,2151.43,296.652], 94.516, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle; _plane_2 = _p_2 select 0;
	_p_3 = [[-1280.77,2280.86,300], 94.516, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle; _plane_3 = _p_3 select 0;


	_grp setCombatBehaviour "CARELESS";

	_wp = _grp addWaypoint [[6158.58,1738.55,200], 0];
	_wp setWaypointType "MOVE";
	

	OL_respawn_planes = [_plane_1,_plane_2,_plane_3];
	publicVariable "OL_respawn_planes";

	OL_planes_crash = [];
	publicVariable "OL_planes_crash";

	OL_respawn_planes_fly = [_plane_1,_plane_2,_plane_3];
	publicVariable "OL_respawn_planes_fly";


	//*******************************************************
	//             CRASH CHANCE
	//*******************************************************
	_percentage = 0;
	if ( ((count OL_enemy_flak_array) > 0) ) then {


		_flakNum = count OL_enemy_flak_array;
		_percentage = _flakNum * 4;
		

		if ( (_percentage > random 100) ) then {

			_plane = selectRandom [_plane_1,_plane_2,_plane_3];
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

			_x setVelocityModelSpace [0, 55.5, 0]; 
			_x setVectorDirAndUp  [[1,-.08,0], [0,0,1]]; 

		} forEach OL_respawn_planes_fly;

	}];
	






	sleep 2;




	//*************************************************************
	//           SET PLANE POS
	//*************************************************************
	_plane_1 setPos [-1216.45,2216.18,300];
	_plane_2 setPos [-1268.8,2151.43,296.652];
	_plane_3 setPos [-1280.77,2280.86,300];




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





	//***********************************************************************************
	//              SPAWN PLANES END
	//***********************************************************************************	
	[] spawn OL_planes_end;





};