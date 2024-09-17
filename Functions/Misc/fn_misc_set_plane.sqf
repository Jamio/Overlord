




_plane = _this select 0;


[_plane, true] remoteExec ["allowCrewInImmobile",_plane];
[_plane, [false,false]] remoteExec ["setUnloadInCombat",_plane];

[_plane, true] remoteExec ["lockDriver",_plane];
[_plane,[[0], true]] remoteExec ["lockTurret",_plane];

[_plane, 1] remoteExec ["setFuel", 0];
[_plane, true] remoteExec ["EngineOn", 0];
[_plane, false] remoteExec ["allowDamage", 0];

[[_plane,false], LIB_fnc_changeLightStatement] remoteExec ["spawn",0];
[_plane,LIB_cargoOpenDoorStatement] remoteExec ["spawn",0];


true
