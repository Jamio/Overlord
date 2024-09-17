/*

	[this] spawn OL_fnc_arsenal_addObject;
	
*/




private _armory =_this select 0;



//********************************************************
//         VANILLA ARSENAL
//********************************************************
_armory addAction
[
	"Open Arsenal",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script

		
		[] call BIS_fnc_arsenal;
		
	},
	nil,		// arguments
	10,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true", 	// condition
	10,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];





//********************************************************
//         ACE CHECK
//********************************************************
if ( (isClass(configFile >> "CfgPatches" >> "ace_main")) ) then {

	_armory addAction
	[
		"Open Ace Arsenal",	// title
		{
			params ["_target", "_caller", "_actionId", "_arguments"]; // script

			
			[_target, _caller] call ace_arsenal_fnc_openBox;
			
		},
		nil,		// arguments
		100,		// priority
		true,		// showWindow
		true,		// hideOnUse
		"",			// shortcut
		"true", 	// condition
		6,			// radius
		false,		// unconscious
		"",			// selection
		""			// memoryPoint
	];
	
	[_armory, OL_all_arsenal_items, true] call ace_arsenal_fnc_addVirtualItems;
	
};
















