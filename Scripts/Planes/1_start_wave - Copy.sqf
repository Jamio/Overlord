// [] execVM "Scripts\Planes\1_start_wave.sqf";

if (isServer) then {



	//*************************************************************
	//           CREATE PLANES
	//*************************************************************
	_grp = createGroup [independent, true];

	_plane_1 = [[-4538.69,2322.58,318.932], 93.429, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle; plane_1 = _plane_1 select 0;
	_plane_2 = [[-4594.69,2377.25,321.618], 93.429, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle; plane_2 = _plane_2 select 0;
	_plane_3 = [[-4600.34,2272.08,324.15], 93.429, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle; plane_3 = _plane_3 select 0;
	_plane_4 = [[-4737.73,2206.24,349.149], 93.429, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle; plane_4 = _plane_4 select 0;
	_plane_5 = [[-4799.38,2155.82,354.391], 93.429, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle; plane_5 = _plane_5 select 0;
	_plane_6 = [[-4793.73,2261.07,351.844], 93.429, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle; plane_6 = _plane_6 select 0; 
	_plane_7 = [[-4848.88,2430.31,360.429], 93.429, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle;plane_7 = _plane_7 select 0;
	_plane_8 = [[-4904.87,2485,363.092], 93.429, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle; plane_8 = _plane_8 select 0;  
	_plane_9 = [[-4910.52,2379.91,365.69], 93.429, "LIB_C47_RAF_bob", _grp] call bis_fnc_spawnvehicle; plane_9 = _plane_9 select 0;  

	publicVariable "plane_1";
	publicVariable "plane_2";
	publicVariable "plane_3";
	publicVariable "plane_4";
	publicVariable "plane_5";
	publicVariable "plane_6";
	publicVariable "plane_7";
	publicVariable "plane_8";
	publicVariable "plane_9";


	_grp setCombatBehaviour "CARELESS";

	_wp = _grp addWaypoint [[6158.58,1738.55,200], 0];
	_wp setWaypointType "MOVE";

	OL_respawn_planes = [plane_1,plane_2,plane_4,plane_6,plane_7,plane_9];
	publicVariable "OL_respawn_planes";

	OL_planes_crash = [plane_3,plane_5,plane_8];
	publicVariable "OL_planes_crash";

	OL_respawn_planes_fly = [plane_1,plane_2,plane_3,plane_4,plane_5,plane_6,plane_7,plane_8,plane_9];
	publicVariable "OL_respawn_planes_fly";



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
	//           MOVE PLAYERS IN CARGO
	//*************************************************************
	private _headlessClients = entities "HeadlessClient_F";
	private _allPlayers = allPlayers - _headlessClients;

	{
	_player = _x;
	[_player,false] remoteExec ["allowDamage",0];
	_plane = selectRandom OL_respawn_planes;
	[_player,_plane] remoteExec ["moveInCargo",_player];

	{ 
		if ( !(isPlayer _x) ) then { 

			//[_x, _plane] remoteExecCall ["disableCollisionWith", _x];
			[_x,false] remoteExec ["allowDamage",0];
			_plane = selectRandom OL_respawn_planes;
			[_x,_plane] remoteExec ["moveInCargo",_x]; 
			
		
		}; 

	} forEach units group _player;


	} forEach _allPlayers;



	sleep 1;

	{
	_player = _x;
	[_player,true] remoteExec ["allowDamage",0];

	{ 
		if ( !(isPlayer _x) ) then { 

			[_x,true] remoteExec ["allowDamage",0];

		}; 

	} forEach units group _player;


	} forEach _allPlayers;

	//*************************************************************
	//           SPAWN PARATROOPERS
	//*************************************************************
	_unitArray = [
		"LIB_US_101AB_CO", 
		"LIB_US_101AB_grenadier", 
		"LIB_US_101AB_mgunner_assistant", 
		"LIB_US_101AB_mgunner", 
		"LIB_US_101AB_medic", 
		"LIB_US_101AB_radioman", 
		"LIB_US_101AB_corporal", 
		"LIB_US_101AB_FC_rifleman", 
		"LIB_US_101AB_rifleman", 
		"LIB_US_101AB_smgunner", 
		"LIB_US_101AB_NCO"
	];


	OL_paratroopers_ai = [];



	{
	_plane = _x;

	_totalSeats = count (fullCrew [_plane, "cargo", true]);
	_occupiedSeats = count (fullCrew [_plane, "cargo", false]);
	_emptySeats = _totalSeats - _occupiedSeats;

	_grp = createGroup [independent, true]; 
	_grp addVehicle _plane;

	for "_i" from 1 to _emptySeats do {
		_unit = _grp createUnit [selectRandom _unitArray, _plane, [], 0, "CARGO"];
		_unit allowDamage false;
		[_unit,_plane] remoteExec ["moveInCargo",0];
		{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
		OL_paratroopers_ai pushBack _unit;


	};

	_wp = _grp addWaypoint [[-134.17,2525.55,0], 0];
	_wp setWaypointType "HOLD";
	_wp setWaypointBehaviour "AWARE";
	_wp setWaypointSpeed "FULL";
	_grp setCurrentWaypoint _wp;



	} forEach OL_respawn_planes;




	//***********************************************************************************
	//         BASE CLEANUP
	//***********************************************************************************

	_baseObjects = (getMissionLayerEntities "OL Main Base") select 0;

	{  deleteVehicle _x;  } forEach _baseObjects;




	sleep 1;


	//*************************************************************
	//           SET PLANE POS
	//*************************************************************
	plane_1 setPos [-4538.69,2322.58,318.932];
	plane_2 setPos [-4594.69,2377.25,321.618];
	plane_3 setPos [-4600.34,2272.08,324.15];
	plane_4 setPos [-4737.73,2206.24,349.149];
	plane_5 setPos [-4799.38,2155.82,354.391];
	plane_6 setPos [-4793.73,2261.07,351.844];
	plane_7 setPos [-4848.88,2430.31,360.429];
	plane_8 setPos [-4904.87,2485,363.092];
	plane_9 setPos [-4910.52,2379.91,365.69];




	sleep 2;


	//***********************************************************************************
	//        BLACK IN
	//***********************************************************************************
	[["OL_blackOut_1", true, 2],BIS_fnc_blackIn] remoteExec ["call",0];

	sleep 3;

	//***********************************************************************************
	//         DISPLAY TIME and PLACE FOR PLAYERS
	//***********************************************************************************

	[[parseText format ["<t font='PuristaBold' size='3'>June 6, 1944</t><br /><t font='PuristaBold' size='2'>D-Day + 0</t><br /><t font='PuristaBold' size='1'>Entering Enemy Occupied France</t>"], [0,1,1,1], [10,10], 10, 0.7, 0], BIS_fnc_textTiles] remoteExec ["spawn",0];


	sleep 2;



	//*************************************************************
	//           START MUSIC
	//*************************************************************
	[2,1] remoteExec ["fadeMusic",0];
	["OL_risers_1"] remoteExec ["playMusic",0];
	[3,1] remoteExec ["fadeSound",0];
	





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




