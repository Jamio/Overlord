// [] execVM "Scripts\Start\start_mission_2.sqf";


if (isServer) then {
	

	["defend_task_1","SUCCEEDED"] call BIS_fnc_taskSetState;
	[] spawn OL_tasks_defend_2; 

	sleep 5;

	[] spawn OL_defend_wave_start_1;

};