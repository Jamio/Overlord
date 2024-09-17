


_box = _this select 0;




[
	_box,											// object the action is attached to
	"Unload Supplies",										// Title of the action
	"\a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa",	// Idle icon shown on screen
	"\a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa",	// Progress icon shown on screen
	"(_this distance _target <= 10)",						// Condition for the action to be shown
	"(_caller distance _target <= 10)",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ 
	
		private ["_targetName"];
	
		_targetName = str _target; 
	
		OL_fortify_total = OL_fortify_total + OL_fortify_supplybox;
		publicVariable "OL_fortify_total";
		
		
		[[_targetName],{
		
			_targetName = _this select 0; 
			
			missionProfileNamespace setVariable [_targetName,false];
			missionProfileNamespace setVariable ["OL_fortify_total",OL_fortify_total];

			
		}] remoteExec ["spawn",2];
		
		
		deleteVehicle _target;
		playSound "FD_Skeet_Launch2_F";
		

		["SuppliesCaptured",[OL_fortify_supplybox]] remoteExecCall ["BIS_fnc_showNotification",0];
		
		
		
	},				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	1,													// action duration in seconds
	100,													// priority
	true,												// Remove on completion
	false,												// Show in unconscious state
	true
] remoteExec ["BIS_fnc_holdActionAdd", 0, _box];	// MP compatible implementation