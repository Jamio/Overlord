


{

	_unit = _x;

	_unit addEventHandler ["Killed", { 


		if ( !(alive neaville_aa_3) && !(alive neaville_aa_4) ) then {

			["main_obj_3","SUCCEEDED"] call BIS_fnc_taskSetState;
			missionProfileNamespace setVariable ["main_obj_3","SUCCEEDED"];
			
		};

		_task_1 = "main_obj_mrkr" call BIS_fnc_taskCompleted;
		_task_2 = "main_obj_2" call BIS_fnc_taskCompleted;
		_task_3 = "main_obj_3" call BIS_fnc_taskCompleted;
		_task_4 = "main_obj_4" call BIS_fnc_taskCompleted;
		_task_5 = "main_obj_5" call BIS_fnc_taskCompleted;


		if ( (_task_1) && (_task_2) && (_task_3) && (_task_4) && (_task_5) ) then {

			["main_obj_parent_task","SUCCEEDED"] call BIS_fnc_taskSetState;
			missionProfileNamespace setVariable ["main_obj_parent_task","SUCCEEDED"];

		};
				
	}];
	
} forEach [neaville_aa_3,neaville_aa_4];