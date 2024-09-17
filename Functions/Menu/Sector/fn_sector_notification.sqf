// [] spawn OL_fnc_sector_notification;

private ["_sectorName","_currentPop"];

disableSerialization;


_sectorName = _this select 0;
_currentPop = _this select 1;


//10 cutText ["", "PLAIN"];	
10 cutRsc ["RscSectorNotification", "PLAIN", 2, false];
private _parent = uiNamespace getVariable "dynamic_ui";



//******************************************************************
//         Sector Name
//******************************************************************
private _ctrl = _parent displayCtrl 2001;
_text = parseText format["<t size='0.2'>&#160;</t><br/><t size='1' shadow='0' valign='middle' align='Center' font='RobotoCondensed' >%1:  %2</t>", _sectorName,_currentPop];
_ctrl ctrlSetStructuredText _text;



















