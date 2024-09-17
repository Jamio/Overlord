_listboxIDC = 2005;
_index = lbCurSel _listboxIDC;

_unitString = lbData [_listboxIDC, _index];
_unit = missionNamespace getVariable [_unitString, objNull];


deleteVehicle _unit;