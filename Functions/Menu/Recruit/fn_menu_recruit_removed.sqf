





private _ctrl = (findDisplay 420693) displayCtrl 2009;
private _index = lbCurSel _ctrl;
private _size = lbSize _ctrl;


private _recruitInfo = player getVariable "OL_recruitUnits";
private _availNum = _recruitInfo select 0;
private _unitOrderArray = [];



//******************************************************************
//                 UNITS AVAILABLE
//******************************************************************
_availNum = _availNum + 1;

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
//                 REMOVE UNIT 
//******************************************************************
_ctrl = (findDisplay 420693) displayCtrl 2009;

_ctrl lbDelete _index;


	
_count = 0;

for "_i" from 0 to _size do { 

	_type = _ctrl lbData _count;
	
	if ( !(_type == "")) then {
		_unitOrderArray pushBack _type;
	};
	
	_count = _count + 1;
	
};




//******************************************************************
//                 SET VARIABLE
//******************************************************************
player setVariable ["OL_recruitUnits",[_availNum,_unitOrderArray]];




