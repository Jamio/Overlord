// [] spawn OL_menu_supply_main_1;



private ["_ctrl"];

(findDisplay 46) createDisplay "OL_SupplyMenuMain";



//******************************************************************
//          TEXT COLOR
//******************************************************************
_r = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,1];

{

	_ctrl = (findDisplay 420691) displayCtrl _x;
	_ctrl ctrlSetTextColor _color;
} forEach [2001,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015];



//******************************************************************
//          ORANGE HEADER
//******************************************************************
_r = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,.8];


_ctrl = (findDisplay 420691) displayCtrl 2001;
_ctrl ctrlSetBackgroundColor _color;



//******************************************************************
//          BACKGROUND COLOR
//******************************************************************
_r = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,.9];


_ctrl = (findDisplay 420691) displayCtrl 2000;
_ctrl ctrlSetBackgroundColor _color;






//******************************************************************
//                 TOTAL SUPPLIES
//******************************************************************
_ctrl = (findDisplay 420691) displayCtrl 2005;
_text = parseText format ["<t size='1.1' shadow='0' align='Left' font='RobotoCondensed' >Reserve:      %1</t>", OL_fortify_total];
_ctrl ctrlSetStructuredText _text;

//******************************************************************
//                 COMPANY SUPPLIES
//******************************************************************
_ctrl = (findDisplay 420691) displayCtrl 2008;
_text = parseText format ["<t size='1.1' shadow='0' align='Left' font='RobotoCondensed' >Company:   %1</t>", OL_fortify_company];
_ctrl ctrlSetStructuredText _text;


//******************************************************************
//                 COMPANY SUPPLIES
//******************************************************************
_ctrl = (findDisplay 420691) displayCtrl 2012;
_text = parseText format ["<t size='1.1' shadow='0' align='Center' font='RobotoCondensed' >Drops Available:   %1</t>", OL_supplyDrops_avail];
_ctrl ctrlSetStructuredText _text;


if ( OL_supplyDrops_avail <= 0) then {

	_ctrl = (findDisplay 420691) displayCtrl 2014;
	_ctrl ctrlEnable false;
	
};










