

private _ctrl_5 = (findDisplay 199007) displayCtrl 3005;

private _value = sliderPosition _ctrl_5;
_value = round _value;

player setVariable ["OL_View_foot_1", _value];




if ( (isNull objectParent player) ) then {

	setViewDistance _value;

};

private _ctrl_6 = (findDisplay 199007) displayCtrl 3006;
_ctrl_6 ctrlSetStructuredText parseText format ["<t size='1' shadow='2' align='center' >View: %1</t>", _value];