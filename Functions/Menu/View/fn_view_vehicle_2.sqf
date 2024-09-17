


private _ctrl_3 = (findDisplay 199007) displayCtrl 3003;

private _value = sliderPosition _ctrl_3;
_value = round _value;


player setVariable ["OL_View_veh_2", _value];


if ( !(isNull objectParent player) ) then {

	setObjectViewDistance _value;

};

private _ctrl_4 = (findDisplay 199007) displayCtrl 3004;
_ctrl_4 ctrlSetStructuredText parseText format ["<t size='1' shadow='2' align='center' >Object: %1</t>", _value];