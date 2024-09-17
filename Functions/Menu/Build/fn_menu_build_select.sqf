


private _ctrl = (findDisplay 420692) displayCtrl 2006;
private _row = lnbCurSelRow _ctrl;

private _type = _ctrl lnbData [_row,0];
private _value = _ctrl lnbValue [_row,1];


private _object = createVehicle [_type, [0,0,0], [], 0, "NONE"];



[_object,player,_value] spawn OL_fnc_object_hold;

_object setVariable ["OL_saveObject",true,true];


OL_fortify_company = OL_fortify_company - _value;
publicVariable "OL_fortify_company";


[[], {


	private _ctrl = (findDisplay 420692) displayCtrl 2004;
	_text = parseText format["<t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Supplies Available:  %1</t>", OL_fortify_company];
	_ctrl ctrlSetStructuredText _text;

}] remoteExec ["spawn",0];



[[],{

	missionProfileNamespace setVariable ["OL_fortify_company",OL_fortify_company];	
	
}] remoteExec ["spawn",2];




(findDisplay 420692) closeDisplay 1;