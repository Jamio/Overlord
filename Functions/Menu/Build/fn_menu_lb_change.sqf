



private _ctrl = (findDisplay 420692) displayCtrl 2006;
private _row = lnbCurSelRow _ctrl;
private _value = _ctrl lnbValue [_row,1];




if ( OL_fortify_company < _value ) then {

 	ctrlEnable [2007, false];

} else {

	ctrlEnable [2007, true];

};