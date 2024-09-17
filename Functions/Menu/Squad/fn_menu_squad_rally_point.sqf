

private ["_unit","_group","_rallyPointVarName"];

_listboxIDC = 2005;
_index = lbCurSel _listboxIDC;

_unitString = lbData [_listboxIDC, _index];
_unit = missionNamespace getVariable [_unitString, objNull];





_group = group player;

_rallyPointVarName = (str _group) + " Rally Point"; 


[

[player,_unit,_group,_rallyPointVarName], 

	{
	
		private ["_playerUnit","_unit","_group","_rallyPointVarName"];


		_playerUnit = _this select 0;		
		_unit = _this select 1;
		_group = _this select 2;
		_rallyPointVarName = _this select 3;
		
		
		private _oldRally = missionProfileNamespace getVariable [_rallyPointVarName, ""];





		if ( (_oldRally == "") ) exitWith { 

			[["<t color='#ff0000' size='.7'>No Rally Point Found.</t>",1,-1,4,0,0,15],BIS_fnc_dynamicText] remoteExec ["spawn",_playerUnit];

		};



		if (  !(_unit inArea "dropzone_1")  ) exitWith { 

			[["<t color='#ff0000' size='.7'>Unit must be in dropzone.</t>",1,-1,4,0,0,15], BIS_fnc_dynamicText] remoteExec ["spawn",_playerUnit];
			
		};

		if (  !(isNull objectParent _unit)  ) exitWith { 

			[["<t color='#ff0000' size='.7'>Unit can't be in vehicle.</t>",1,-1,4,0,0,15], BIS_fnc_dynamicText] remoteExec ["spawn",_playerUnit];

		};


		if ( (_unit inArea "dropzone_1") && (isNull objectParent player) ) then {

			_rallyPoint = missionNameSpace getVariable _oldRally;
			_teleportPos = (getPosATL _rallyPoint) findEmptyPosition [5,100];

			_unit setPos _teleportPos;	
			
		};


	}

] remoteExec ["spawn",2];