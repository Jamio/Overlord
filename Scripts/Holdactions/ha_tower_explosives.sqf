
_object = _this select 0;


[OL_radio_tower,
"Place Explosive",
"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loadDevice_ca.paa",
"\a3\ui_f\data\igui\cfg\simpletasks\types\destroy_ca.paa",
"(_this distance radio_sphere < 10) && (alive OL_radio_tower)",
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

_exp1 = "fow_e_tnt_twopound" createVehicle position _caller; 
_exp1 attachTo [OL_radio_tower, [1.8,-2.3,-15]];    
_exp1 setVectorDirAndUp [[1,0.5,0],[-0.5,0.5,0]];

_exp2 = "fow_e_tnt_twopound" createVehicle position _caller; 
_exp2 attachTo [OL_radio_tower, [-2.8,-2.3,-15]];    
_exp2 setVectorDirAndUp [[1,0.5,0],[-0.5,0.5,0]];

_exp3 = "fow_e_tnt_twopound" createVehicle position _caller; 
_exp3 attachTo [OL_radio_tower, [1.8,2.3,-15]];     
_exp3 setVectorDirAndUp [[1,0.5,0],[-0.5,0.5,0]];

_exp4 = "fow_e_tnt_twopound" createVehicle position _caller; 
_exp4 attachTo [OL_radio_tower, [-2.8,2.3,-15]];     
_exp4 setVectorDirAndUp [[1,0.5,0],[-0.5,0.5,0]];


_explosives = _caller getVariable "OL_player_explosives"; 

{_explosives pushBack _x;} forEach [OL_radio_tower,_exp1,_exp2,_exp3];
_explosives pushBack OL_radio_tower;
_caller setVariable ["OL_player_explosives",_explosives]; 


},
nil, 
nil, 
3, 
10, 
false, 
false] remoteExec ["BIS_fnc_holdActionAdd", 0, OL_radio_tower];