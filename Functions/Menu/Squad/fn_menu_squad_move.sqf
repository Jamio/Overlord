



_listboxIDC = 2005;
_index = lbCurSel _listboxIDC;

_unitString = lbData [_listboxIDC, _index];
_unit = missionNamespace getVariable [_unitString, objNull];



//******************************************************************
//                 UNIT ENABLED / DISABLED
//******************************************************************
_aiEnabled = _unit checkAIFeature "PATH";

if ( _aiEnabled ) then {
	
	_unit disableAI "PATH";
	ctrlSetText [2009, "Enable Move"]; 

} else {

	_unit enableAI "PATH";
	ctrlSetText [2009, "Disable Move"]; 

};









