


private _ctrl_1 = (findDisplay 199007) displayCtrl 3001;

private _value = sliderPosition _ctrl_1;
_value = round _value;


player setVariable ["OL_View_veh_1", _value];


if ( !(isNull objectParent player) ) then {

	setViewDistance _value;

};




private _ctrl_2 = (findDisplay 199007) displayCtrl 3002;
_ctrl_2 ctrlSetStructuredText parseText format ["<t size='1' shadow='2' align='center' >View: %1</t>", _value];