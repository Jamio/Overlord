// [] execVM "Scripts\Enemy\ARTY_call.sqf";

if (isServer) then {


	//*******************************************************
	//             INFO
	//*******************************************************

	private ["_pos","_num","_type"];

	_pos = _this select 0;

/*
	_ammo = [
	"LIB_8Rnd_81mmHE_GRWR34",
	"LIB_8Rnd_81mmHE_GRWR34",
	"LIB_20x_Shell_105L28_Gr39HlC_HE"
	];
*/

	_ammo = [
	"Sh_82mm_AMOS"
	];

	_num = 6;
	_type = selectRandom _ammo;






	if ( !( OL_enemy_arty_avail) ) exitWith { 

			//*******************************************************
			//             DEBUG
			//*******************************************************
			if ( OL_debugInfo ) then { ["Enemy Artillery in cooldown"] remoteExec ["systemChat",0];  };
			
	};

	if ( count OL_arty_sector_array <= 0 ) exitWith { 
	
			//*******************************************************
			//             DEBUG
			//*******************************************************
			if ( OL_debugInfo ) then { ["All Enemy Artillery Destroyed"] remoteExec ["systemChat",0];  };
			
	};



	//*******************************************************
	//             DEBUG
	//*******************************************************
	if ( OL_debugInfo ) then { ["Enemy Artillery incoming!"] remoteExec ["systemChat",0];  };

	OL_enemy_arty_avail = false;
	publicVariable "OL_enemy_arty_avail";



	sleep 10;


	{
			
		if ( (_x distance _pos) <= 150 ) then {

			["OL_s_arty"] remoteExec ["playSound", _x];
		};

	} forEach allPlayers;


	sleep 5;

	{
			
		if ( (_x distance _pos) <= 150 ) then {

			[["<t color='#ffffff' size='2'>Artillery Incoming!</t><br/>", "PLAIN DOWN", -1, false, true]] remoteExec ["cutText",_x];
		};

	} forEach allPlayers;





	sleep 40;

	



	//*******************************************************
	//             DEBUG
	//*******************************************************
	if ( OL_debugInfo ) then { ["SPLASH!"] remoteExec ["systemChat",0];  };
	

	//********************************************************************************
	//                  ARTY CALL
	//********************************************************************************
	for "_i" from 1 to _num do {


		_randomPos = [[[_pos, 100]],[]] call BIS_fnc_randomPos;

		_shell = _type createvehicle _randomPos;
		_shell setVectorDirandUp [[0,0,-1],[0.1,0.1,1]]; 
		_shell setVelocity [0,0,-10];

		sleep 2;

	};









	sleep 60;

	OL_enemy_arty_avail = true;
	publicVariable "OL_enemy_arty_avail";


















};