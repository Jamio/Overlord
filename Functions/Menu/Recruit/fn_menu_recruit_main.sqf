// [] spawn OL_menu_recruit_main;

private ["_ctrl"];


(findDisplay 46) createDisplay "OL_RecruitMenuMain";


lbClear ((findDisplay 420693) displayCtrl 2007);
lbClear ((findDisplay 420693) displayCtrl 2009);




_groupNum = count units group player;
_availNum = 20 - _groupNum;
_unitOrderArray = [];
player setVariable ["OL_recruitUnits",[_availNum,_unitOrderArray]];




//******************************************************************
//          TEXT COLOR
//******************************************************************
_r = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,1];

{

	_ctrl = (findDisplay 420693) displayCtrl _x;
	_ctrl ctrlSetTextColor _color;
} forEach [2001,2004,2005,2006,2007,2008,2009,2010,2011];



//******************************************************************
//          ORANGE HEADER
//******************************************************************
_r = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,.8];

_ctrl = (findDisplay 420693) displayCtrl 2001;
_ctrl ctrlSetBackgroundColor _color;



//******************************************************************
//          BACKGROUND COLOR
//******************************************************************
_r = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,.9];

_ctrl = (findDisplay 420693) displayCtrl 2000;
_ctrl ctrlSetBackgroundColor _color;





//******************************************************************
//                 UNITS AVAILABLE
//******************************************************************
_ctrl = (findDisplay 420693) displayCtrl 2004;
_text = parseText format["<t size='0.5'>&#160;</t><br/><t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Recruits Available:   %1</t>", _availNum];
_ctrl ctrlSetStructuredText _text;


if ( _availNum <= 0 || !(player getVariable ["OL_unitOrderComplete",true]) ) then {

	((findDisplay 420693) displayCtrl 2010) ctrlEnable false;
	((findDisplay 420693) displayCtrl 2005) ctrlSetText "0";
	
};






//******************************************************************
//                 LISTBOX
//******************************************************************
_ctrl = (findDisplay 420693) displayCtrl 2007;

_unitTypes = [
	"LIB_US_101AB_smgunner",
	"LIB_US_101AB_radioman", 
	"LIB_US_101AB_rifleman", 
	"LIB_US_101AB_FC_rifleman", 
	"LIB_US_101AB_corporal", 
	"LIB_US_101AB_AT_soldier", 
	"LIB_US_101AB_grenadier", 
	"LIB_US_101AB_mgunner", 
	"LIB_US_101AB_mgunner_assistant", 
	"LIB_US_101AB_medic"
];






{
	_type = _x;
	_name = [configFile >> "CfgVehicles" >> _type] call BIS_fnc_displayName;

	_index = _ctrl lbAdd format (["%1",_name]); 
	_ctrl lbSetData [_index,_type];

} forEach _unitTypes;



