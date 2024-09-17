// [] spawn OL_menu_commander_main_1;



(findDisplay 46) createDisplay "OL_BuildMenuMain";

_ctrl = (findDisplay 420692) displayCtrl 2006;

lbClear _ctrl;






//******************************************************************
//                 COMPANY SUPPLIES AVAILABLE
//******************************************************************
_ctrl = (findDisplay 420692) displayCtrl 2004;
_text = parseText format["<t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Supplies Available:  %1</t>", OL_fortify_company];
_ctrl ctrlSetStructuredText _text;

if ( OL_fortify_company <= 0) then {

	private _ctrl = (findDisplay 420692) displayCtrl 2007;
	_ctrl ctrlEnable false;
	
};





//******************************************************************
//                 LISTBOX  #2
//******************************************************************
private _ctrl = (findDisplay 420692) displayCtrl 2005;
lnbClear 2005;

private _pic_1 = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\letters\s_ca.paa";
private _pic_2 = "\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\intel_ca.paa";
_row = _ctrl lnbAddRow ["Type", "", ""];
_ctrl lnbSetPicture [[_row, 1], _pic_1];
_ctrl lnbSetPicture [[_row, 2], _pic_2];


lbSetCurSel [2005, -1];




//******************************************************************
//                 LISTBOX  #2
//******************************************************************
private _ctrl = (findDisplay 420692) displayCtrl 2006;
lnbClear 2006;

{
	private _type = _x select 0;
	private _cost = _x select 1;
	private _ammoBox = _x select 2;
	
	private _name = [configFile >> "CfgVehicles" >> _type] call BIS_fnc_displayName;
	private _pic = (getText (configFile >> 'CfgVehicles' >> _type >> 'picture')); 
	
	if ( (_pic == "pictureStaticObject") || (_pic == "pictureThing") ) then {
	
		_pic = (getText (configFile >> 'CfgVehicles' >> _type >> 'editorPreview'));
		
	};
	
	_row = _ctrl lnbAddRow [_name, (str(_cost)), ""];
	_ctrl lnbSetPicture [[_row, 2], _pic];
	_ctrl lnbSetData [[_row,0],_type];
	_ctrl lnbSetValue [[_row,1],_cost];
	
} forEach OL_build_objects;


lbSetCurSel [2006, 0];




