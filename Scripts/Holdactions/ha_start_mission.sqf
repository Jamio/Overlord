
_unit = _this select 0;



[
	_unit,											// object the action is attached to
	"Start Mission",										// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_thumbsup_ca.paa",	// Progress icon shown on screen
	"!(OL_mission_started)",						// Condition for the action to be shown
	"(_caller == company_commander) && !(OL_mission_started)",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ 


		OL_mission_started = true;
		publicVariable 'OL_mission_started';
		
		
		[[],OL_start_mission] remoteExec ["spawn",2];

	

	},				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	2,													// action duration in seconds
	0,													// priority
	true,												// Remove on completion
	false												// Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, _unit];	// MP compatible implementation