

//**********************************************************************
//               STATIC LINE
//**********************************************************************
/*
PARACHUTES:
"B_Parachute"
"B_LIB_US_Type5"

*/


_plane = _this select 0;


_list = (fullCrew [_plane, "cargo", false]) apply { _x select 0 };

{ 
	_unit = _x;

	if ( _unit in _plane ) then {
	

		[[_plane,_unit],LIB_fnc_deployStaticLine] remoteExec ["spawn",_unit];

		sleep 0.5;

		
	};
		




} forEach _list + ({units group _x} forEach allPlayers);
















