




private _recruitInfo = player getVariable "OL_recruitUnits";

private _unitArray = _recruitInfo select 1;


(findDisplay 420693) closeDisplay 1;







private _aiEventHandler = {


	_unit = _this select 0;

	//***********************************************************************
	//
	//                EVENT HANDLERS
	//
	//***********************************************************************					
	//***********************************************************************
	//                 UNIT KILLED
	//***********************************************************************	
	_unit addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		
			_tickets = [missionNamespace,-1] call BIS_fnc_respawnTickets;

			if ( _tickets <= 0 ) then {

				["noTickets", false, true, true, true] remoteExecCall ["BIS_fnc_endMission",0];

			};
	}];
	
	
	_unit addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];


		
		
		if ( typeOf _vehicle == "LIB_US_Parachute") then {

			_unit setVariable ["OL_isParachute",true];
			
		};
		
	}];


	_unit addEventHandler ["GetOutMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];

		if ( typeOf _vehicle == "LIB_US_Parachute") then {
			
			[_unit] spawn {
				_unit = _this select 0;
				sleep 10;
				_unit setVariable ["OL_isParachute",false];
				[_unit,true] remoteExec ["allowDamage",0];
			};
			
			
		};
	}];


	_unit addEventHandler ["HandleDamage", {
	
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
		
		_isParachute = _unit getVariable ["OL_isParachute",false];
		
		if ( _isParachute ) then {
		
			_unit setDamage 0;
		};
		
	}];



};



























//***********************************************************************
//
//                CREATE UNITS AT BASE
//
//***********************************************************************	


if ( !(OL_mission_started) && (player getVariable ["OL_unitOrderComplete",true]) ) then {



	{ 
	
		_type = _x;
		
		_unit = group player createUnit [_type, [-3517.18,-108.656,0], [], 15, "NONE"]; 
		{ _x addCuratorEditableObjects [[_unit],true]; } forEach allCurators;  
		
		[_unit] call _aiEventHandler;
		
		sleep 0.2;
		
	} forEach _unitArray;


	player setVariable ["OL_unitOrderComplete",true];
	

} else {




	//***********************************************************************
	//
	//                CREATE UNITS IN MISSION
	//
	//***********************************************************************	
	
	if ((player getVariable ["OL_unitOrderComplete",true]) ) then {

		hint "Units will paradrop with the next wave.";


		player setVariable ["OL_unitOrderComplete",false];
		
		//*************************************************************************
		//                WAIT FOR PLANE
		//*************************************************************************
		waitUntil { sleep 1; (OL_respawn_enabled) && (({alive _x} count OL_respawn_planes) > 0) };



		//*************************************************************************
		//                SPAWN UNITS
		//*************************************************************************

		{ 
		
			_type = _x;
			
			_unit = group player createUnit [_type, [-3517.18,-108.656,0], [], 15, "NONE"];
			{ _x addCuratorEditableObjects [[_unit],true]; } forEach allCurators;  
			
			[_unit] call _aiEventHandler;

			_plane = selectRandom OL_respawn_planes;
			[_unit,_plane] remoteExec ["moveInCargo",_unit];
			

			sleep 0.2;
			
		} forEach _unitArray;



		player setVariable ["OL_unitOrderComplete",true];
		hint "Reinforcements are on the way.";


	};





};



