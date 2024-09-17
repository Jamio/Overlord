


private _ctrl_7 = (findDisplay 199007) displayCtrl 3007;

private _value = sliderPosition _ctrl_7;
_value = round _value;

player setVariable ["OL_View_foot_2", _value];




if ( (isNull objectParent player) ) then {


	setObjectViewDistance _value;

};

private _ctrl_8 = (findDisplay 199007) displayCtrl 3008;
_ctrl_8 ctrlSetStructuredText parseText format ["<t size='1' shadow='2' align='center' >Object: %1</t>", _value];