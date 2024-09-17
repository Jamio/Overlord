//[] spawn OL_fnc_misc_saveMission;

if (isServer) then {



	private ["_currentTickets","_respawnTickets","_allMObjects","_saveObjects","_arsenalObjects","_objectArray","_unitScores"];
	
	


	["Saving Mission..."] remoteExec ["systemChat",0]; 


	sleep 1;
	
	
	
	
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
	//            SAVE VARIABLES
	//**********************************************************
	_respawnTickets = [missionNamespace] call BIS_fnc_respawnTickets;
	
	missionProfileNamespace setVariable ["OL_saveFile_tickets", _respawnTickets];
	missionProfileNamespace setVariable ["OL_fortify_total",OL_fortify_total];
	missionProfileNamespace setVariable ["OL_fortify_company",OL_fortify_company];	
	


	

	//**********************************************************
	//            SAVE SCORES
	//**********************************************************
	
	{
	
		private _unit = _x;
		private _name = name _unit;
		private _scoreArray = getPlayerScores _unit;
		
		{
		
			private _player = _x select 0;
			
			if ( _name == _player ) then {
				
				OL_saveScores = OL_saveScores - [_x];
				
			};		
			
		} forEach OL_saveScores;	
		
		private _1 = _scoreArray select 0;
		private _2 = _scoreArray select 1;
		private _3 = _scoreArray select 2;
		private _4 = _scoreArray select 3;
		private _5 = _scoreArray  select 4;		
			
		OL_saveScores pushBack [_name,_1,_2,_3,_4,_5];
				

	} forEach allPlayers;
	
	
	publicVariable "OL_saveScores";
	
	missionProfileNamespace setVariable ["OL_saveScores",OL_saveScores];
	
	

	//******************************************************************************
	//
	//            MISSION OBJECTS
	//
	//******************************************************************************	
	//**********************************************************
	//            GET MISSION OBJECTS
	//**********************************************************
	_allMObjects = allMissionObjects "All";

	_saveObjects = [];
	_arsenalObjects = [];
	
	
	{

		_object = _x;

		if ( (_object getVariable ["OL_saveObject",false] ) && (side _object != WEST) ) then {

			_saveObjects pushBack _x;

		};
		
		if ( (_object getVariable ["OL_arsenalObject",false] ) ) then {

			_arsenalObjects pushBack _x;

		};


	} forEach _allMObjects;


	//**********************************************************
	//            SAVE MISSION OBJECTS
	//**********************************************************
	_objectArray = [];

	{
	
		_objectArray pushBack [str _x,typeOf _x,getPosWorld _x,getDir _x,damage _x];

	} forEach _saveObjects;
	

	missionProfileNamespace setVariable ["OL_saveFile_objects",_objectArray];



	//**********************************************************
	//            SAVE ARSENAL OBJECTS
	//**********************************************************
	_arsenalobjectArray = [];

	{
	
		_arsenalobjectArray pushBack [str _x,typeOf _x,getPosWorld _x,getDir _x,damage _x];

	} forEach _arsenalObjects;
	

	missionProfileNamespace setVariable ["OL_saveFile_arsenal_objects",_arsenalobjectArray];










	//**********************************************************
	//            SAVE DATE / TIME
	//**********************************************************
	missionProfileNamespace setVariable ["OL_mission_date",date];








	saveMissionProfileNamespace;
	
	sleep 1;

	["Mission Saved."] remoteExec ["systemChat",0]; 
	

};