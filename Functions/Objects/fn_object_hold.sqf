/*



[] spawn OL_fnc_objects_hold;

*/

params ["_object","_unit","_value","_holding"];



_object = _this select 0;
_unit = _this select 1;
_value = _this select 2;

_object enableSimulationGlobal false;

_object attachTo [_unit, [0.1, 2, 0.25], "Pelvis"];

{[_object, _x] remoteExec ["disableCollisionWith", 0]; } forEach allPlayers;




_unit setVariable ["OL_attachedObject",[_object,[0.1, 2, 0.25],0,true,_value]];


_holding = (_unit getVariable "OL_attachedObject") select 3;





//*****************************************************************************************
//                   CREATE PIC
//*****************************************************************************************
_pic = "Pics\BuildMenu\control_layout.paa"; 
[ 
    '<img align=''center'' size=''7'' shadow=''0'' image='+(str(_pic))+' />', 
    safeZoneX+.7,   
    safeZoneY+safeZoneH-.7,  
    99999, 
    0, 
    0, 
    3090 
] spawn bis_fnc_dynamicText;




//*****************************************************************************************
//
//                   CREATE ACTIONS
//
//*****************************************************************************************
//***************************************************************************
//                   RAISE / LOWER
//***************************************************************************
inGameUISetEventHandler ["PrevAction", " 

		_objectArray = player getVariable 'OL_attachedObject';
		_object = _objectArray select 0;
		_pos = _objectArray select 1;
		_pos3 = _pos select 2;
		_dir =  _objectArray select 2;
		_value =  _objectArray select 4;	
		
		_pos3 = _pos3 + .1;
		_object attachTo [player, [0.1, 2, _pos3], 'Pelvis'];
		player setVariable ['OL_attachedObject',[_object,[0.1, 2, _pos3],_dir,true,_value]];	
		true
		
 "]; 
		
		
		
inGameUISetEventHandler ["NextAction", "

		_objectArray = player getVariable 'OL_attachedObject';
		_object = _objectArray select 0;
		_pos = _objectArray select 1;
		_pos3 = _pos select 2;
		_dir =  _objectArray select 2;
		_value =  _objectArray select 4;
		
		_pos3 = _pos3 - .1;
		_object attachTo [player, [0.1, 2, _pos3], 'Pelvis'];
		player setVariable ['OL_attachedObject',[_object,[0.1, 2, _pos3],_dir,true,_value]];	
		true
 
 "]; 



/****************************************************************************
                
				                RAISE / LOWER		
SPACE = 57
SHIFT = 42
CTRL = 29
ALT = 56
Q = 16
E = 18

//****************************************************************************/



OL_eh_place = (findDisplay 46) displayAddEventHandler
[
	"KeyDown",
	{
		params ["_ctrl", "_dikCode", "_shift", "_ctrlKey"];

		_objectArray = player getVariable 'OL_attachedObject';
		_object = _objectArray select 0;
		_pos = _objectArray select 1;
		_pos3 = _pos select 2;
		_dir =  _objectArray select 2;
		_value =  _objectArray select 4;
		
		
		//hint format ['%1',_dikCode];


		if (_dikCode == 1) then {

			detach _object;
			
			player setVariable ["OL_attachedObject",[objNull,[0.1, 2, 0.25],0,false,_value]];
			["",-1,-1,0,1,0,3090] spawn bis_fnc_dynamicText;
			OL_fortify_company = OL_fortify_company + _value;
			publicVariable "OL_fortify_company";
			deleteVehicle _object;
			findDisplay 46 displayRemoveEventHandler ["KeyDown", OL_eh_place];
			inGameUISetEventHandler ["PrevAction", "false"]; 
			inGameUISetEventHandler ["NextAction", "false"];
			true			
			
		};


		if (_dikCode == 57) then {

			detach _object;
			
			player setVariable ["OL_attachedObject",[objNull,[0.1, 2, 0.25],0,false,_value]];
			["",-1,-1,0,1,0,3090] spawn bis_fnc_dynamicText;
			findDisplay 46 displayRemoveEventHandler ["KeyDown", OL_eh_place];
			inGameUISetEventHandler ["PrevAction", "false"]; 
			inGameUISetEventHandler ["NextAction", "false"];
			true			
			
		};
		
		if (_dikCode == 18) then {
		
			_dir = _dir + 1;
			_object setDir _dir;
			player setVariable ["OL_attachedObject",[_object,[0.1, 2, _pos3],_dir,true,_value]];
			true
		};
		
		if (_dikCode == 16) then {
		
			_dir = _dir - 1;
			_object setDir _dir;
			player setVariable ["OL_attachedObject",[_object,[0.1, 2, _pos3],_dir,true,_value]];
			true
		};
		
		if ( (_dikCode == 57) || (_dikCode == 18) || (_dikCode == 16) || (_dikCode == 1)) then {
		
			true
			
		};
		
	}
];













//***************************************************************************
//                   EXIT IF DEAD
//***************************************************************************

while { sleep 0.1; (alive _unit) && ( (_unit getVariable "OL_attachedObject") select 3 ) } do {

	sleep 0.1;	

};

["",-1,-1,0,1,0,3090] spawn bis_fnc_dynamicText;
findDisplay 46 displayRemoveEventHandler ["KeyDown", OL_eh_place];
inGameUISetEventHandler ["PrevAction", "false"]; 
inGameUISetEventHandler ["NextAction", "false"]; 
detach _object;

_object enableSimulationGlobal true;

_unit setVariable ["OL_attachedObject",[objNull,[0.1, 2, 0.25],0,false,0]];