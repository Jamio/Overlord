
/*


[] spawn OL_respawn_manager;


*/


	_timer = _this select 0;
	
	OL_respawn_planes = [];
	
	//*************************************************************
	//           DISABLE RESPAWN
	//*************************************************************
	//[999999] remoteExec ["setPlayerRespawnTime",0];
	OL_respawn_enabled = false;
	publicVariable "OL_respawn_enabled";
	
	
	
	
	[_timer] spawn OL_respawn_timer_script;
	sleep _timer;
	









	if ( (OL_respawn_phase == 1) ) then {




		[] spawn OL_planes_respawn_wave_1;
		
		
	} else {


			if ( (OL_respawn_phase == 2) ) then {



			};



	};




	sleep 2;
	
	
	

	//*************************************************************
	//           ENABLE RESPAWN
	//*************************************************************
	//[0] remoteExec ["setPlayerRespawnTime",0];
	OL_respawn_enabled = true;
	publicVariable "OL_respawn_enabled";
	
	
	
	
	
	
	