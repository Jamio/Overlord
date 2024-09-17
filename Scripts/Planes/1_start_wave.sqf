// [] execVM "Scripts\Planes\1_start_wave.sqf";

if (isServer) then {



	//*************************************************************
	//           CREATE PLANES
	//*************************************************************
	OL_respawn_planes = [];
	OL_planes_crash = [];
	OL_respawn_planes_fly = [];

	private _planeParams = [
		[[-4538.69,2322.58,318.932],318.932,false],
		[[-4594.69,2377.25,321.618],321.618,false],
		[[-4600.34,2272.08,324.15],324.15,true],
		[[-4737.73,2206.24,349.149],349.149,false],
		[[-4799.38,2155.82,354.391],354.391,true],
		[[-4793.73,2261.07,351.844],351.844,false],
		[[-4848.88,2430.31,360.429],360.429,false],
		[[-4904.87,2485,363.092],363.092,true],
		[[-4910.52,2379.91,365.69],365.69,false]
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

		if (_crash) then {

			OL_planes_crash pushBack _plane;

		} else {

			OL_respawn_planes pushBack _plane;

		};
		
	} forEach _planeParams;


	publicVariable "OL_respawn_planes";
	publicVariable "OL_planes_crash";
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

			[_x, [0, 55.5, 0]] remoteExec ["setVelocityModelSpace",_x];
			[_x, [[1,-.08,0], [0,0,1]] ] remoteExec ["setVectorDirAndUp",_x];

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
		_plane = selectRandom (OL_respawn_planes select {_x emptyPositions "CargoNoFFV" > 0});
		[_player,_plane] remoteExec ["moveInCargo",_player];

		{ 
			if ( !(isPlayer _x) ) then { 

				[_x,false] remoteExec ["allowDamage",0];
				_plane = selectRandom (OL_respawn_planes select {_x emptyPositions "CargoNoFFV" > 0});
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

		_emptySeats = _plane emptyPositions "CargoNoFFV";

		_grp = createGroup [independent, true]; 
		_grp addVehicle _plane;

		for "_i" from 1 to _emptySeats do {

			if (_emptySeats > 0) then {

				_unit = _grp createUnit [selectRandom _unitArray, _plane, [], 0, "CARGO"];
				_unit allowDamage false;
				[_unit,_plane] remoteExec ["moveInCargo",0];
				{[_x,[[_unit],true]] remoteExec ["addCuratorEditableObjects",0]; } forEach allCurators; 
				OL_paratroopers_ai pushBack _unit;

			};


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
	_trg setTriggerInterval 2;






	//***********************************************************************************
	//              SPAWN PLANES END
	//***********************************************************************************	
	[] spawn OL_planes_end;









};




