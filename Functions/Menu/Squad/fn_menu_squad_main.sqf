

createDialog "OL_SquadMenuMain";

//******************************************************************
//          TEXT COLOR
//******************************************************************
_r = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['IGUI', 'TEXT_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,1];

{

	_ctrl = displayCtrl _x;
	_ctrl ctrlSetTextColor _color;
} forEach [2001,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017];



//******************************************************************
//          ORANGE HEADER
//******************************************************************
_r = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['GUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,.8];

_ctrl = displayCtrl 2001;
_ctrl ctrlSetBackgroundColor _color;



//******************************************************************
//          BACKGROUND COLOR
//******************************************************************
_r = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 0;
_g = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 1;
_b = (['IGUI', 'BCG_RGB'] call BIS_fnc_displayColorGet) select 2;
_color = [_r,_g,_b,.9];

_ctrl = displayCtrl 2000;
_ctrl ctrlSetBackgroundColor _color;







lbClear 2005;
//******************************************************************
//                 LISTBOX
//******************************************************************


_unitArray = [];


{
	if ( !(isPlayer _x) ) then {

		_unitArray pushBack _x;

	};

} forEach units group player;






{

	_getUnitPositionId = {
		private ["_vvn", "_str"];
		_vvn = vehicleVarName _this;
		_this setVehicleVarName "";
		_str = str _this;
		_this setVehicleVarName _vvn;
		parseNumber (_str select [(_str find ":") + 1])
	};
	
	_id = _x call _getUnitPositionId;
	
	typeOf _x;
	_name = getText (configFile >> "CfgVehicles" >> typeOf _x >> "displayName");

	_index = lbAdd [ 2005, format ["%1) %2 ",_id, _name]]; 
	lbSetData [ 2005, _index,[_x] call BIS_fnc_objectVar];
	_man = lbData [2005, _index];

	//*********************************************************
	//              TEXT COLOR
	//*********************************************************


	if ( 'MAIN' == assignedTeam _x ) then { lbSetColor [2005, _index, [1,1,1,1]]; };

	if ( 'RED' == assignedTeam _x ) then { lbSetColor [2005, _index, [0.7,0.13,0.13,1]]; };

	if ( 'GREEN' == assignedTeam _x ) then { lbSetColor [2005, _index, [0.56,0.93,0.56,1]]; };

	if ( 'BLUE' == assignedTeam _x ) then { lbSetColor [2005, _index, [0.53,0.81,0.98,1]]; };

	if ( 'YELLOW' == assignedTeam _x ) then { lbSetColor [2005, _index, [1,1,0,1]]; };
	
	
	//*********************************************************
	//              ROLE PICTURE
	//*********************************************************
	_medic = _x getUnitTrait "Medic";
	_eod = _x getUnitTrait "ExplosiveSpecialist";
	_repair = _x getUnitTrait "Engineer";
	_damage = getDammage _x;
	_onFoot = isNull objectParent _x;

if ( !(_onFoot) ) then {

_veh_role = (assignedVehicleRole _x) select 0; 



	if ( (_veh_role == "driver") ) then {
	lbSetPictureRight [2005, _index, "\A3\ui_f\data\IGUI\Cfg\CommandBar\imageDriver_ca.paa"];
	};

	if ( (_veh_role == "turret") ) then {
	lbSetPictureRight [2005, _index, "\A3\ui_f\data\IGUI\Cfg\CommandBar\imageGunner_ca.paa"];
	};

	if ( (_veh_role == "cargo") ) then {
	lbSetPictureRight [2005, _index, "\A3\ui_f\data\IGUI\Cfg\CommandBar\imageCargo_ca.paa"];
	};



} else {

	if ( (_damage > .2) ) then {
	lbSetPictureRight [2005, _index, "\A3\ui_f\data\IGUI\Cfg\Cursors\unitBleeding_ca.paa"];
	_ctrl lbSetPictureRightColor [_index, [1, 0, 0, 1]];
	} else {

		if ( (_medic) ) then {
			lbSetPictureRight [2005, _index, "\A3\ui_f\data\map\vehicleicons\pictureHeal_ca.paa"];
		};

		if ( (_eod) ) then {
			lbSetPictureRight [2005, _index, "\A3\ui_f\data\map\vehicleicons\pictureExplosive_ca.paa"];
		};

		if ( (_repair) ) then {
			lbSetPictureRight [2005, _index, "\A3\ui_f\data\map\vehicleicons\pictureRepair_ca.paa"];
		};



		if ( !(_medic) ) then {

			_secWep = secondaryWeapon _x; 
			_secWepType = _secWep call BIS_fnc_itemType; 

			if ( (_secWepType select 1 == "MissileLauncher") || (_secWepType select 1 == "RocketLauncher") ) then {
				lbSetPictureRight [2005, _index, "\A3\ui_f\data\IGUI\Cfg\WeaponIcons\at_ca.paa"];
			};


			if ( !(_secWepType select 1 == "MissileLauncher") || (_secWepType select 1 == "RocketLauncher") ) then {

				_priWep = primaryWeapon _x; 
				_priWepType = _priWep call BIS_fnc_itemType;

					if ( (_priWepType select 1 == "SniperRifle") ) then {
						lbSetPictureRight [2005, _index, "\A3\ui_f\data\IGUI\Cfg\WeaponIcons\srifle_ca.paa"];
					};
	
					if ( (_priWepType select 1 == "MachineGun") ) then {
						lbSetPictureRight [2005, _index, "\A3\weapons_f\data\UI\icon_mg_CA.paa"];
					};

							
			};


		};


	};


};


	
	
} forEach _unitArray;


lbSetCurSel [2005, 0];






//******************************************************************
//                 RallyPoints
//******************************************************************

if ( !(OL_rallyPoints) ) then {

	ctrlEnable [2013, false]
	ctrlEnable [2008, false]	
	
};







