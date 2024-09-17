

private ["_ctrl"];

(findDisplay 46) createDisplay "OL_CommandMenuMain";






//******************************************************************
//          TEXT COLOR
//******************************************************************
_r = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,1];

{
	_ctrl = (findDisplay 420692) displayCtrl _x;
	_ctrl ctrlSetTextColor _color;
	
} forEach [2001,2004,2005,2006,2007,2008];



//******************************************************************
//          ORANGE HEADER
//******************************************************************
_r = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,.8];

_ctrl = (findDisplay 420692) displayCtrl 2001;
_ctrl ctrlSetBackgroundColor _color;



//******************************************************************
//          BACKGROUND COLOR
//******************************************************************
_r = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,.9];

_ctrl = (findDisplay 420692) displayCtrl 2000;
_ctrl ctrlSetBackgroundColor _color;










//******************************************************************
//                 COMPANY SUPPLIES
//******************************************************************

if ( !(player == company_commander) ) then {
	
	_ctrl = (findDisplay 420692) displayCtrl 2004;
	_ctrl ctrlEnable false;
	
};






//******************************************************************
//                 RallyPoints
//******************************************************************

if ( !(OL_rallyPoints) ) then {

	_ctrl = (findDisplay 420692) displayCtrl 2007;
	_ctrl ctrlEnable false;

};












