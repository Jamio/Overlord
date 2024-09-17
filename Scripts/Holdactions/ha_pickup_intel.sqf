
_unit = _this select 0;
_intel = _this select 1;
_marker = _this select 2;



[
	_unit,											// object the action is attached to
	"Secure Intel",										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",	// Progress icon shown on screen
	"(true)",						// Condition for the action to be shown
	"(_caller distance _target < 7)",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ 


		params ["_intel","_marker","_text"];
		
		_intel = _this select 3 select 0;
		_marker = _this select 3 select 1;
		

		[[_intel,_marker],OL_fnc_misc_pickup_Intel] remoteExec ["spawn",2];

		
		switch (true) do {
			case ( _marker == "radar_mrkr"): { _text = "Radar Station"; };
			case ( _marker == "arty_mrkr_1"): { _text = "Artillery Site"; };
			case ( _marker == "mortar_mrkr_1"): { _text = "Mortar Site"; };
			case ( _marker == "mg_mrkr_1"): { _text = "Machine Gun Nest"; };
			case ( _marker == "mg_mrkr_2"): { _text = "Machine Gun Nest"; };
			case ( _marker == "mg_mrkr_3"): { _text = "Machine Gun Nest"; };
			default { _text = "Unknown"};
		};

		["IntelFound",[_text]] remoteExecCall ["BIS_fnc_showNotification",0];
		
		deleteVehicle _intel;
		
	
	

	},				// Code executed on completion
	{},													// Code executed on interrupted
	[_intel,_marker],													// Arguments passed to the scripts as _this select 3
	1,													// action duration in seconds
	0,													// priority
	true,												// Remove on completion
	false												// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, _unit];	// MP compatible implementation