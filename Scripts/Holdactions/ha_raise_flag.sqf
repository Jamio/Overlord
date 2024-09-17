



[
	flag_1,											// object the action is attached to
	"Raise U.S. Flag",										// Title of the action
	"\a3\ui_f\data\igui\cfg\actions\returnflag_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\igui\cfg\actions\returnflag_ca.paa",	// Progress icon shown on screen
	"(_this distance _target <= 5)",						// Condition for the action to be shown
	"(_caller distance _target <= 5)",						// Condition for the action to progress
	{},													// Code executed when action starts
	{},													// Code executed on every progress tick
	{ 
		[flag_1, 0] call BIS_fnc_animateFlag;
		private _eh = [flag_1, "FlagAnimationDone", { 

			[flag_1,"\ca\misc\data\usa_vlajka.paa"] remoteExec ["setFlagTexture",0];
			[flag_1, 1] call BIS_fnc_animateFlag;

		 }] call BIS_fnc_addScriptedEventHandler;
		 
		 [{missionProfileNamespace setVariable ["OL_flagRaised",true]}] remoteExec ["call",2];
		

	},				// Code executed on completion
	{},													// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	1,													// action duration in seconds
	100,													// priority
	true,												// Remove on completion
	false,												// Show in unconscious state
	true
] remoteExec ["BIS_fnc_holdActionAdd", 0, flag_1];	// MP compatible implementation