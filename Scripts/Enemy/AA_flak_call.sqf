/*

 [] execVM "AA_flak_call.sqf";
 
 
Artillery Pieces:
OL_enemy_flak_array = [gun_1,gun_2,..etc];

Aircraft:
OL_respawn_planes_fly = [plane_1,plane_2,etc...];

*/


if (isServer) then {


	//********************************************
	//     SPAWN FLAK EXPLOSIONS AROUND AIRCRAFT
	//********************************************
	if ( (({ alive _x } count OL_enemy_flak_array) > 0) ) then {

		while { sleep 0.5; (({alive _x} count OL_respawn_planes_fly) > 0)} do {



			{
			
				_plane = _x;
				
				_num1_1 = [-30,-50] call BIS_fnc_randomInt;
				_num1_2 = [30,50] call BIS_fnc_randomInt;
			
				_num1 = selectRandom [_num1_1,_num1_2];

				_num2 = [-20, 20] call BIS_fnc_randomInt;

				_bomb = "APERSMine_Range_Ammo" createVehicle (_plane modelToWorld [_num1,_num2,0]);
				_bomb setdamage 1; 

				{
					if ( (_x in _plane) ) then {
						[[2, 2, 25]] remoteExec ["addCamShake",_x];
					};

				} forEach allPlayers;

				sleep (.1 + (random .65));
				
			} forEach OL_respawn_planes_fly;


		};

	};




};




















