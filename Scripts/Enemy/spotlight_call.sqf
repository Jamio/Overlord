/*

 [] execVM "spotlight_call.sqf";
 
 
Spotlights:
OL_spotlight_array = [light_1,light_2,..etc];

Aircraft:
OL_respawn_planes_fly = [plane_1,plane_2,etc...];

*/


if (isServer) then {






	while { sleep 1; (( { alive _x } count OL_spotlight_array ) > 0 ) && (((count OL_respawn_planes) > 0)) } do {


		{
			_x turretUnit [0] action ["SearchLightOn", _x];
			_startPos = getPos _x;
 			_dir = [0,359] call BIS_fnc_randomInt; 
 			_relpos = _x getRelPos [500, _dir];
 
   			_position = [(_relpos select 0), _relpos select 1, 1000];   
  
   			_x doWatch _position;
	
		} forEach OL_spotlight_array;


		sleep 5;

	};




};