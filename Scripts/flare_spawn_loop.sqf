


_plane = _this select 0;





	while { sleep 5; (alive _plane) } do {




	for "_i" from 1 to 10 do {

		_num1_1 = [-30,-50] call BIS_fnc_randomInt;
		_num1_2 = [30,50] call BIS_fnc_randomInt;
		
		_num1 = selectRandom [_num1_1,_num1_2];

		_num2 = [-20, 20] call BIS_fnc_randomInt;

		_bomb = "APERSMine_Range_Ammo" createVehicle (_plane modelToWorld [_num1,_num2,0]);
		_bomb setdamage 1; 

		sleep 2;

	};



	sleep 5;

};




















