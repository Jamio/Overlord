



_listboxIDC = 2005;
_index = lbCurSel _listboxIDC;

_unitString = lbData [_listboxIDC, _index];
_unit = missionNamespace getVariable [_unitString, objNull];






//******************************************************************
//                 ZOOM MAP
//******************************************************************
_ctrl = (findDisplay 420693) displayCtrl 51;
_ctrl ctrlMapAnimAdd [0.5, 0.25, getPos _unit];
ctrlMapAnimCommit _ctrl;



//******************************************************************
//                 UNIT ENABLED / DISABLED
//******************************************************************
_aiEnabled = _unit checkAIFeature "PATH";

if ( _aiEnabled ) then {

	ctrlSetText [2009, "Disable Move"]; 

} else {

	ctrlSetText [2009, "Enable Move"]; 

};









