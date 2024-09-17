//		[_mrkr,_pos] spawn OL_menu_supply_supplyDrop;



hint 'Click desired drop location on map.';



if ( OL_supplyDrops_avail <= 0) then {
	
	_ctrl = (findDisplay 420691) displayCtrl 2014;
	_ctrl ctrlEnable false;
	
};



//**********************************************************************************************************************
//
//                   ON MAP CLICK 
//_index = lbCurSel 1100; _unit = missionNamespace getVariable(lbData [1100, _index]); 
//**********************************************************************************************************************

onMapSingleClick "



	[_pos] spawn {




		_pos = _this select 0;
		
		_mrkr = 'Markername' + (str _pos);
		_mrkr = createMarkerLocal [_mrkr, _pos];
		_mrkr setMarkerType 'Select'; 
		_mrkr setMarkerColor 'ColorRed'; 
		_mrkr setMarkerText 'Select';
		_mrkr setMarkerSize [0, 0];

		_size = 0;

		while { _size < 1 } do {
		
			_size = _size + .1;
			_mrkr setMarkerSize [_size, _size];
			sleep .01;
			
		};


		while { _size > 0 } do {
		
			_size = _size - .1;
			_mrkr setMarkerSize [_size, _size];
			sleep .01;
			
		};

		sleep 0.11;

		deleteMarker _mrkr;




		_mrkr = 'Markername' + (str _pos);
		_mrkr = createMarker [_mrkr, _pos];
		_mrkr setMarkerType 'LIB_mil_destroy'; 
		_mrkr setMarkerText 'Supply Drop Request';
		_mrkr setMarkerColor 'ColorYellow'; 


		sleep 1;




		
		['SuppliesDrop'] remoteExecCall ['BIS_fnc_showNotification',0];


		OL_supplyDrops_avail = OL_supplyDrops_avail - 1;
		
		
		_ctrl = (findDisplay 420691) displayCtrl 2012;
		_text = parseText format ['<t size=''1.1'' shadow=''0'' align=''Center'' font=''RobotoCondensed'' >Drops Available:   %1</t>', OL_supplyDrops_avail];
		_ctrl ctrlSetStructuredText _text;
		
		[[_mrkr,_pos],OL_fnc_menu_supply_supplyPlane] remoteExec ['spawn',2];

		publicVariable 'OL_supplyDrops_avail';


	};









 onMapSingleClick ''; true";


//*********************************************************************************************************