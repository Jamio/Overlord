
/*



[test] execVM "Scripts\Addactions\move_object.sqf";







*/



_object = _this select 0;



_object addAction
[
	"Pickup",	// title
	{
		params ["_target", "_caller", "_actionId", "_arguments"]; // script


		[_target,_caller] spawn OL_fnc_object_hold;
		

	},
	nil,		// arguments
	1000,		// priority
	true,		// showWindow
	true,		// hideOnUse
	"",			// shortcut
	"true", 	// condition
	3,			// radius
	false,		// unconscious
	"",			// selection
	""			// memoryPoint
];