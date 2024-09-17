	
	
	
	
private ["_group","_rallyPointVarName"];


_group = group player;

_rallyPointVarName = (str _group) + " Rally Point"; 

[

[player,_group,_rallyPointVarName], 

	{

		private ["_playerUnit","_group","_rallyPointVarName","_oldRally","_teleportPos"];
		
		_playerUnit = _this select 0;		
		_group = _this select 1;
		_rallyPointVarName = _this select 2;

		private _oldRally = missionProfileNamespace getVariable [_rallyPointVarName, ""];


		if ( !(_oldRally == "") ) then {

			_rallyPoint = missionNameSpace getVariable _oldRally;
			
			[["Moving to RallyPoint", "BLACK OUT",.3]] remoteExec ["cutText",_playerUnit];
			
			sleep 1;

			_teleportPos = (getPosATL _rallyPoint) findEmptyPosition [5,100];

			_playerUnit setPos _teleportPos;	
			[["", "BLACK IN"]] remoteExec ["cutText",_playerUnit];
			
		} else {

			[["<t color='#ff0000' size='.7'>No Rally Point Found</t>",-1,-1,2,0,0,15],BIS_fnc_dynamicText] remoteExec ["spawn",_playerUnit];
		};
		
		
	}

] remoteExec ["spawn",2];