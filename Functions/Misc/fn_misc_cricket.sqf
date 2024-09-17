

_unit = _this select 0;

[_unit, "OL_s_clicker"] remoteExec ["say3D",0]; 

if ( _unit inArea "base_area_marker") exitWith { hint "AI will not respond to your clicker at base."; };

_pos = getPos _unit;

_nearMenGood = nearestObjects [_unit, ["man"], 100];
_nearMenBad = nearestObjects [_unit, ["man"], 50];


sleep 1;



{


	if ( !(isPlayer _x) && (side _x == independent) ) then {

		
		[_x, "OL_s_clicker"] remoteExec ["say3D",0]; 
		
	};


	sleep (.1 + (random 1));

} forEach _nearMenGood;






{
	_lines = [
		"SentContact",
		"SentEnemyContact",
		"SentWhereAreYou",
		"SentBehaviourAware",
		"SentWatchAround"
	];

	if ( !(isPlayer _x) && (side _x == west) ) then {

		
		[_x, selectRandom _lines] remoteExec ["directSay",0]; 
		[_x, [_pos, 50, 50, 0, false],"AWARE","NO CHANGE", "LIMITED","NO CHANGE","",[3,3,3]] call CBA_fnc_taskSearchArea;
	};


	sleep 1;

} forEach _nearMenBad;