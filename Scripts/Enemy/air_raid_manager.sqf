


if (isServer) then {



	//***********************************************************
	//          SPAWN AIR RAID SIREN
	//***********************************************************
	if ( (alive OL_radio_tower) ) then {

		[siren_speaker,["OL_s_siren", 4000, 1]] remoteExec ["say3D",0];

	};




	//***********************************************************
	//          SPAWN AA FLAK
	//***********************************************************
	[] spawn OL_enemy_AA_flak;





	//*********************************************************************
	//
	//          LOOP AA and SPOTLIGHTS
	//
	//*********************************************************************
	while { sleep 1; (({alive _x} count OL_respawn_planes_fly) > 0) } do {


		//***********************************************************
		//                 AA
		//***********************************************************
		if ( (({ alive _x } count OL_enemy_flak_array) > 0) ) then {

			{

				_startPos = getPos _x;
				_dir = [0,359] call BIS_fnc_randomInt; 
				_relpos = _x getRelPos [500, _dir];
				_position = [(_relpos select 0), _relpos select 1, 1000];   
				_x doSuppressiveFire _position;
				sleep 0.1;

			} forEach OL_enemy_flak_array;

		};

		//***********************************************************
		//          SPOTLIGHTS
		//***********************************************************
		if ( (({ alive _x } count OL_spotlight_array) > 0) ) then {

			{

				_x turretUnit [0] action ["SearchLightOn", _x];
				_startPos = getPos _x;
				_dir = [0,359] call BIS_fnc_randomInt; 
				_relpos = _x getRelPos [500, _dir];
				_position = [(_relpos select 0), _relpos select 1, 1000];   
				_x doWatch _position;
				sleep 0.1;

			} forEach OL_spotlight_array;
		};

		sleep 6;


	};












};