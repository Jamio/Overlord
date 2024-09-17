if (isServer) then {


	if ( (isNil "OL_paratroopers_ai") ) exitWith {};



	while { sleep 10; (count OL_paratroopers_ai) > 0 } do {


		{
			_unit = _x;


			_playerNear = [_unit, 200] call CBA_fnc_nearPlayer;

			if ( (isNull objectParent _unit) && !(_playerNear) && (isTouchingGround _unit) ) then {

					deleteVehicle _unit;
					
			};

		} forEach OL_paratroopers_ai;


		sleep 5;


	};




};