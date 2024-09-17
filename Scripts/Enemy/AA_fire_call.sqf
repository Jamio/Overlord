/*

 [] execVM "AA_fire_call.sqf";
 
 
Artillery Pieces:
OL_enemy_flak_array = [gun_1,gun_2,..etc];

Aircraft:
OL_respawn_planes_fly = [plane_1,plane_2,etc...];

*/


if (isServer) then {

	//********************************************
	//     ORDER AA GUNS TO FIRE
	//********************************************
	{

  		 _startPos = getPos _x;
 		_dir = [0,359] call BIS_fnc_randomInt; 
 		_relpos = _x getRelPos [500, _dir];
 
   		_position = [(_relpos select 0), _relpos select 1, 1000];   
  
   		_x doSuppressiveFire _position;

		sleep 0.1;

	} forEach OL_enemy_flak_array;


	sleep 5;


	//********************************************
	//     ORDER AA GUNS 
	//********************************************
	while { sleep 2; ((count OL_respawn_planes_fly) > 0) } do {

		{

  		 	_startPos = getPos _x;
 			_dir = [0,359] call BIS_fnc_randomInt; 
 			_relpos = _x getRelPos [500, _dir];
 
   			_position = [(_relpos select 0), _relpos select 1, 1000];   
  
   			_x doSuppressiveFire _position;

			sleep 0.1;

		} forEach OL_enemy_flak_array;


		sleep 5;

	};






};