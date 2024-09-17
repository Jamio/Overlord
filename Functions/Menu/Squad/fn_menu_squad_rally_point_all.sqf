








_group = group player;

_rallyPointVarName = (str _group) + " Rally Point"; 






[

[player,_group,_rallyPointVarName], 

	{

		private ["_playerUnit","_group","_rallyPointVarName"];
		
		_playerUnit = _this select 0;		
		_group = _this select 1;
		_rallyPointVarName = _this select 2;

		private _oldRally = missionProfileNamespace getVariable [_rallyPointVarName, ""];
		
		if ( (_oldRally == "")  ) exitWith { 

			[["<t color='#ff0000' size='.7'>No Rally Point Found.</t>",1,-1,4,0,0,15], BIS_fnc_dynamicText] remoteExec ["spawn",_playerUnit];
			
		};


		{

			private _unit = _x;
			private _rallyPoint = missionNameSpace getVariable _oldRally;
			
			if ( !(isPlayer _unit) && (_unit inArea "dropzone_1") && (isNull objectParent _unit) ) then {
			
				_teleportPos = (getPosATL _rallyPoint) findEmptyPosition [5,100];

				_unit setPos _teleportPos;	
				
			};

			sleep 0.1;
			
		} forEach units _group;
		
	}

] remoteExec ["spawn",2];