if (isServer) then {



	{ 
		_plane = _x;
		[[_plane,true], LIB_fnc_changeLightStatement] remoteExec ["spawn",0];

	}  forEach OL_respawn_planes;



	sleep 2;







	{ 

		_plane = _x;


		{
			
			if ( (_x in _plane) ) then {

				[["<t color='#ffffff' size='2'>Jump Master:  Go! Go! Go!</t><br/>", "PLAIN DOWN", -1, false, true]] remoteExec ["cutText",_x];
				["OL_v_jump_2"] remoteExec ["playSound", _x];
			};

		} forEach allPlayers;

		sleep 1;

		[_plane] spawn OL_fnc_misc_paradrop;

	} forEach OL_respawn_planes - OL_planes_crash;



	OL_respawn_planes = [];
	publicVariable "OL_respawn_planes";


	












};