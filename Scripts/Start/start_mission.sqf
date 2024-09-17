// [] execVM "Scripts\Start\start_mission.sqf";


if (isServer) then {
	
	
	OL_mission_started = true;
	publicVariable "OL_mission_started";
	missionProfileNamespace setVariable ["OL_mission_started", OL_mission_started];		
	
	
	['player_start_tasks','SUCCEEDED'] call BIS_fnc_taskSetState;
	missionProfileNamespace setVariable ["player_start_tasks","SUCCEEDED"];
	
	//*************************************************************
	//           STOP MUSIC
	//*************************************************************
	[5,0] remoteExec ["fadeMusic",0];

	sleep 5;

	[""] remoteExec ["playMusic",0];

	//*************************************************************
	//           DISABLE RESPAWN
	//*************************************************************
	OL_respawn_phase = 1;
	publicVariable "OL_respawn_phase";
	missionProfileNamespace setVariable ["OL_respawn_phase", OL_respawn_phase];	
	
	OL_respawn_enabled = false;
	publicVariable "OL_respawn_enabled";



	sleep 2;

	//*************************************************************
	//           FADE BLACK
	//*************************************************************
	[["OL_blackOut_1", true, 2],BIS_fnc_blackOut] remoteExecCall ["call",0];
	
	sleep 2;
	
	//*************************************************************
	//           DATE / TIME
	//*************************************************************
	[[1944, 06, 06, 03, 00], true, true] call BIS_fnc_setDate;


	//*************************************************************
	//           START PLANES
	//*************************************************************
	[] spawn OL_planes_start_wave;







};