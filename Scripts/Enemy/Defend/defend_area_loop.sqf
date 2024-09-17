/*

[] execVM "Scripts\Enemy\Defend\defend_area_loop.sqf";
[] spawn OL_defend_area_loop;

*/


if (isServer) then {

	OL_city_defense = true;


	while {sleep 1; (OL_city_defense) } do {



		//********************************************************************
		//                       GET ALIVE PLAYERS
		//********************************************************************
		_headlessClients = entities "HeadlessClient_F";
		_humanPlayers = allPlayers - _headlessClients;


		_playerArray = [];

		{

			_player = _x;
		
			{
			
				if ( alive _x ) then { _playerArray pushBack _x; };
			
			} forEach units group _player;

		} forEach _humanPlayers;





		if ( (( {(alive _x) && (_x inArea "main_obj_defend_mrkr") } count _playerArray) <= 0) && 
			 (( {(alive _x) && (side _x == west) && (_x inArea "main_obj_defend_mrkr") } count allUnits) >= 1) ) then {
		
		
 
			_time = 240;  
 
			while { (_time > 0) && 
					(( {(alive _x) && (_x inArea "main_obj_defend_mrkr") } count _playerArray) <= 0) && 
					(( {(alive _x) && (side _x == west) && (_x inArea "main_obj_defend_mrkr") } count allUnits) >= 1) 
			} do {  
		
				_time = _time - 1;    
				format['Neaville Has Fallen to the Enemy! \n %1', [((_time)/60)+.01,'HH:MM'] call BIS_fnc_timetostring] remoteExec ['hintSilent',0];  
				sleep 1;
			}; 
			
			[''] remoteExec ['hint',0];
			
		if ( (( {(alive _x) && (_x inArea "main_obj_defend_mrkr") } count _playerArray) <= 0) && 
			 (( {(alive _x) && (side _x == west) && (_x inArea "main_obj_defend_mrkr") } count allUnits) >= 1) ) then {
					
					OL_jukeBox = false;
					publicVariable "OL_jukeBox";
					
					OL_city_defense = false;
					
					[[],OL_end_lose] remoteExec ["spawn",0];
					
			};
			
		
		};







		sleep 5;



	};








};