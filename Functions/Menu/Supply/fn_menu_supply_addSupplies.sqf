


params ["_sel","_num"];

_sel = _this select 0;


if ( _sel == 0 ) then {




	//******************************************************************
	//               ADD TOTAL / SUBRACT COMPANY  (50)
	//******************************************************************
	if ( OL_fortify_company > 0 ) then {
	
	
		if ( OL_fortify_company >= 50 ) then { _num = 50 } else { _num = OL_fortify_company };
		
		
			OL_fortify_company = OL_fortify_company - _num;
			
			OL_fortify_total = OL_fortify_total + _num;
			
			_ctrl = (findDisplay 420691) displayCtrl 2005;
			_text = parseText format["<t size='1.1' shadow='0' align='Left' font='RobotoCondensed' >Reserve:      %1</t>", OL_fortify_total];
			_ctrl ctrlSetStructuredText _text;


			_ctrl = (findDisplay 420691) displayCtrl 2008;
			_text = parseText format["<t size='1.1' shadow='0' align='Left' font='RobotoCondensed' >Company:   %1</t>", OL_fortify_company];
			_ctrl ctrlSetStructuredText _text;
			

			hint "Funds removed from company";
			

	
	};



} else {


	//*****************************************************************
	//               SUBTRACT TOTAL / ADD COMPANY  (50)
	//******************************************************************
	if ( OL_fortify_total > 0 ) then {
	
	
		if ( OL_fortify_total >= 50 ) then { _num = 50 } else { _num = OL_fortify_total };
		
		
		OL_fortify_company = OL_fortify_company + _num;
		
		OL_fortify_total = OL_fortify_total - _num;
		
		_ctrl = (findDisplay 420691) displayCtrl 2005;
		_text = parseText format["<t size='1.1' shadow='0' align='Left' font='RobotoCondensed' >Reserve:      %1</t>", OL_fortify_total];
		_ctrl ctrlSetStructuredText _text;


		_ctrl = (findDisplay 420691) displayCtrl 2008;
		_text = parseText format["<t size='1.1' shadow='0' align='Left' font='RobotoCondensed' >Company:   %1</t>", OL_fortify_company];
		_ctrl ctrlSetStructuredText _text;
		
		hint "Funds added to company";
	};


};



publicVariable "OL_fortify_total";
publicVariable "OL_fortify_company";




[[],{

	missionProfileNamespace setVariable ["OL_fortify_total",OL_fortify_total];
	missionProfileNamespace setVariable ["OL_fortify_company",OL_fortify_company];	
	

}] remoteExec ["spawn",2];











