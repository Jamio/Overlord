

private _ctrl = (findDisplay 420693) displayCtrl 2007;
private _index = lbCurSel _ctrl;
private _type = _ctrl lbData _index;

private _recruitInfo = player getVariable "OL_recruitUnits";
private _availNum = _recruitInfo select 0;
private _unitOrderArray = _recruitInfo select 1;



//******************************************************************
//                 UNITS AVAILABLE
//******************************************************************
_availNum = _availNum - 1;

_ctrl = (findDisplay 420693) displayCtrl 2004;
_text = parseText format["<t size='0.5'>&#160;</t><br/><t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Recruits Available:   %1</t>", _availNum];
_ctrl ctrlSetStructuredText _text;



_ctrl = (findDisplay 420693) displayCtrl 2010;
if ( _availNum < 0) then {

	_ctrl ctrlEnable false;
	
} else {
	
	_ctrl ctrlEnable true;

};


//******************************************************************
//                 ADD UNIT
//******************************************************************

_ctrl = (findDisplay 420693) displayCtrl 2009;

_name = [configFile >> "CfgVehicles" >> _type] call BIS_fnc_displayName;

_index = _ctrl lbAdd (format ["%1",_name]); 
_ctrl lbSetData [_index,_type];

_unitOrderArray pushBack _type;




//******************************************************************
//                 SET VARIABLE
//******************************************************************
player setVariable ["OL_recruitUnits",[_availNum,_unitOrderArray]];




