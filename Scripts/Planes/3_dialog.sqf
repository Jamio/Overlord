
if (isServer) then {

	_plane = _this select 0;



	//***********************************************************************************
	//              DIALOG and TEXT
	//***********************************************************************************
	{

		if ( (vehicle _x in OL_respawn_planes) ) then {

			[["<t color='#ffffff' size='2'>Jump Master:  30 seconds!</t><br/>", "PLAIN DOWN", -1, false, true]] remoteExec ["cutText",_x];
			["OL_v_jump_1"] remoteExec ["playSound", _x];

		};

	} forEach allPlayers;





	//***********************************************************************************
	//              AIR RAID MANAGER
	//***********************************************************************************
	[] spawn OL_enemy_airRaid_manager;





	//***********************************************************************************
	//              TRIGGER -- PARADROP
	//***********************************************************************************	
	_trg = createTrigger ["EmptyDetector", [940.451,2127.15,0], false];
	_trg setTriggerArea [50, 1000, 0, true];
	_trg setTriggerActivation ["ANY", "PRESENT", false];
	_trg setTriggerStatements ["({_x in thisList} count OL_respawn_planes_fly > 0)", " [] spawn OL_planes_paradrop; [] spawn OL_planes_spawnCrash; deleteVehicle thisTrigger; ", ""];
	_trg setTriggerInterval 2;







};