

if (isServer) then {





		_veh = _this select 0;
		
		_scriptDone = _veh getVariable "OL_supplyScriptDone";
		_mrkr = _veh getVariable 'OL_supplyMarker';

		deleteMarker _mrkr;
		hint 'Supply Drop Inbound';



		if ( !(_scriptDone) ) then {
			
			_veh setVariable ["OL_supplyScriptDone", true];
			_pos = getPos _veh; 
		 
			_pos1 = _pos select 0; 
			_pos2 = _pos select 1; 
			_pos3 = (_pos select 2) - 15; 
		 
			 _cargo = createVehicle [ 'B_supplyCrate_F', [_pos1,_pos2,_pos3], [], 0, 'NONE' ]; 
				 clearItemCargoGlobal _cargo; 
				 clearWeaponCargoGlobal _cargo; 
				 clearMagazineCargoGlobal _cargo; 
				 clearBackpackCargoGlobal _cargo;
			 _cargo setMass [20, 10];
			 
			 _cargo allowDamage false;
			 [[_cargo],OL_fnc_arsenal_addObject] remoteExec ['spawn',0];
			 _cargo setVariable ["OL_arsenalObject",true,true];
			 
			 
			 //****************************************
			//         ACE CHECK
			//****************************************
			if ( (isClass(configFile >> "CfgPatches" >> "ace_main")) ) then {
			
				 [[_cargo, true, [0, 2, 0], 45],ace_dragging_fnc_setDraggable] remoteExec ['call',0];
				 [[_cargo, true, [0, 3, 1], 10],ace_dragging_fnc_setCarryable] remoteExec ['call',0];
				 
			};

			_para = createVehicle ['B_Parachute_02_F', [0,0,600], [], 0, 'FLY']; 
			_para setPosATL (_cargo modelToWorld[0,0,0]); 
		 
			_cargo attachTo [_para,[0,0,0]];


			//****************************************
			//         SET SPEED / HEIGHT CHECK
			//****************************************			
			private _timeOut = 60;
			while { _timeOut > 0} do {
			
				_timeOut = _timeOut - 0.1;
				
				_para setVelocity [0, 0, -25]; 
				
				if (  getPosATL _cargo select 2 <= 15 ) then {
					_timeOut = 0;
				};
				
				sleep 0.1;
				
			};
			
			//****************************************
			//         CREATE MARKER
			//****************************************	
			_pos = getPos _cargo;
			_mrkr = 'Markername' + (str _pos);
			_mrkr = createMarker [_mrkr, _pos];
			_mrkr setMarkerType 'LIB_mil_destroy'; 
			_mrkr setMarkerText 'Supply Drop';
			_mrkr setMarkerColor 'ColorYellow'; 


		};



















};