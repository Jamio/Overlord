

_unit = _this select 0;    





_unit addEventHandler ["Suppressed", {
	params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];

	_targetPos = getPos _shooter;

	_nearEnemies = allUnits select {(_x distance _shooter < OL_arty_dist) && (side _x == WEST) }; 



	if ( (count _nearEnemies > 0) ) then {

		//*******************************************************
		//             DEBUG
		//*******************************************************
		if ( OL_debugInfo ) then { ["Players too close for artillery."] remoteExec ["systemChat",0];  };
		
	} else {

		private _arty_task = "arty_mrkr_1" call BIS_fnc_taskCompleted; 
		private _mortar_task = "mortar_mrkr_1" call BIS_fnc_taskCompleted; 
 
		if ( !( (_arty_task) && (_mortar_task) ) ) then {

			[(getPos _shooter)] spawn OL_enemy_ARTY;

		} else {

			//*******************************************************
			//             DEBUG
			//*******************************************************
			if ( OL_debugInfo ) then { ["No Artillery In Range"] remoteExec ["systemChat",0];  };
			
		};

	};


}];





















