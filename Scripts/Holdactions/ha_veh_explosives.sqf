/*

_object = cursorTarget;
_pos = lineIntersectsSurfaces [eyePos player, position cursorTarget, player, cursorTarget, true, -1]; 

_pos = _pos select 0 select 1;

_expl = "fow_e_tnt_onepound" createVehicle position cursorTarget; 
_expl attachTo [cursorTarget, _pos];  


*/




_object = _this select 0;


[_object,
"Place Explosive",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca.paa",
"\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa",
"(_this distance _target < 5) && (alive _target)",
"true",
nil, 
nil, 
{


switch (true) do {
	case (stance player == "STAND"): {_caller playmove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";};
	case (stance player == "CROUCH"): {_caller playmove "AinvPknlMstpSrasWrflDnon_Putdown_AmovPknlMstpSrasWrflDnon";};
	case (stance player == "PRONE"): {_caller playmove "AinvPpneMstpSrasWrflDnon_Putdown_AmovPpneMstpSrasWrflDnon";};
	default {_caller playmove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";};
};

sleep 1.5;

_expl = "fow_e_tnt_onepound" createVehicle position _caller; 
_expl attachTo [_target, [0,0,0]];  
_expl setVectorDirAndUp [[1,0.5,0],[-0.5,0.5,0]];

_explosives = _caller getVariable "OL_player_explosives"; 

_explosives pushBack _expl;
_explosives pushBack _target;
_caller setVariable ["OL_player_explosives",_explosives]; 


},
nil, 
nil, 
3, 
10, 
false, 
false] remoteExec ["BIS_fnc_holdActionAdd", 0, _object];