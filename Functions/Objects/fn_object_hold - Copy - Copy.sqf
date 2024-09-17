/*



[] spawn OL_fnc_objects_hold;

*/

params ["_object","_unit","_holding","",""];



_object = _this select 0;

_unit = _this select 1;



_object attachTo [_unit, [0.1, 2, 0.25], "Pelvis"];




_unit setVariable ["OL_object_holding",true];
_unit setVariable ["OL_attachedObject",[_object,[0.1, 2, 0.25],0,true]];


_holding = (_unit getVariable "OL_attachedObject") select 3;





//*****************************************************************************************
//                   CREATE PIC
//*****************************************************************************************
_pic = "Pics\control_pic_test.paa"; 
[ 
    '<img align=''center'' size=''7'' shadow=''0'' image='+(str(_pic))+' />', 
    safeZoneX+0.8, 
    safeZoneY+safeZoneH-.6, 
    99999, 
    0, 
    0, 
    3090 
] spawn bis_fnc_dynamicText;







/*

OL_eh_raiseLower = (findDisplay 46) displayAddEventHandler ["MouseZChanged",
	
	{
	
		_num = _this select 1;
		
		_objectArray = player getVariable 'OL_attachedObject';
		_object = _objectArray select 0;
		_pos = _objectArray select 1;
		_pos3 = _pos select 2;
		_dir =  _objectArray select 2;

		
		hint format ['%1',_pos3];
		
		if ( ( _num > 0) ) then {

			_pos3 = _pos3 + .1;
			_object attachTo [player, [0.1, 2, _pos3], 'Pelvis'];
			

		};
		
		if ( ( _num < 0) ) then {
		
			_pos3 = _pos3 - .1;
			_object attachTo [player, [0.1, 2, _pos3], 'Pelvis'];

		};
		
		player setVariable ['OL_attachedObject',[_object,[0.1, 2, _pos3],_dir,true]];	
	
	
		true
		
	}
	
];

*/


//*****************************************************************************************
//                   CREATE ACTIONS
//*****************************************************************************************
inGameUISetEventHandler ["PrevAction", " 

		_objectArray = player getVariable 'OL_attachedObject';
		_object = _objectArray select 0;
		_pos = _objectArray select 1;
		_pos3 = _pos select 2;
		_dir =  _objectArray select 2;
		_pos3 = _pos3 + .1;
		_object attachTo [player, [0.1, 2, _pos3], 'Pelvis'];
		player setVariable ['OL_attachedObject',[_object,[0.1, 2, _pos3],_dir,true]];	
		true
		
 "]; 
		
		
		
inGameUISetEventHandler ["NextAction", "

		_objectArray = player getVariable 'OL_attachedObject';
		_object = _objectArray select 0;
		_pos = _objectArray select 1;
		_pos3 = _pos select 2;
		_dir =  _objectArray select 2;
		_pos3 = _pos3 - .1;
		_object attachTo [player, [0.1, 2, _pos3], 'Pelvis'];
		player setVariable ['OL_attachedObject',[_object,[0.1, 2, _pos3],_dir,true]];	
		true
 
 "]; 




/*

SPACE = 57
SHIFT = 42
CTRL = 29
ALT = 56
Q = 16
E = 18


*/




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




		hint format ['%1',_dikCode];
		
		
		
		if (_dikCode == 57) then {

			detach _object;
			
			player setVariable ["OL_attachedObject",[objNull,[0.1, 2, 0.25],0,false]];
			["",-1,-1,0,1,0,3090] spawn bis_fnc_dynamicText;
			findDisplay 46 displayRemoveEventHandler ["KeyDown", OL_eh_place];
			inGameUISetEventHandler ["PrevAction", "false"]; 
			inGameUISetEventHandler ["NextAction", "false"];
			true			
			
		};
		
		if (_dikCode == 18) then {
		
			_dir = _dir + 1;
			_object setDir _dir;
			player setVariable ["OL_attachedObject",[_object,[0.1, 2, _pos3],_dir,true]];
			true
		};
		
		if (_dikCode == 16) then {
		
			_dir = _dir - 1;
			_object setDir _dir;
			player setVariable ["OL_attachedObject",[_object,[0.1, 2, _pos3],_dir,true]];
			true
		};
		
		if ( (_dikCode == 57) || (_dikCode == 18) || (_dikCode == 16)) then {
		
			true
			
		};
		
	}
];





























while { sleep 0.1; (alive _unit) && ( (_unit getVariable "OL_attachedObject") select 3 ) } do {

	sleep 0.1;	

};

["",-1,-1,0,1,0,3090] spawn bis_fnc_dynamicText;
findDisplay 46 displayRemoveEventHandler ["KeyDown", OL_eh_place];
inGameUISetEventHandler ["PrevAction", "false"]; 
inGameUISetEventHandler ["NextAction", "false"]; 
detach _object;

hint "Exited";

_unit setVariable ["OL_attachedObject",[objNull,[0.1, 2, 0.25],0,false]];