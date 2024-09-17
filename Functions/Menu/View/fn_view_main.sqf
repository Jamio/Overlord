// [] spawn XRAY_fnc_view_main;



private _viewDistance1 = player getVariable "OL_View_veh_1";
private _viewDistance2 = player getVariable "OL_View_veh_2";
private _viewDistance3 = player getVariable "OL_View_foot_1";
private _viewDistance4 = player getVariable "OL_View_foot_2";




(findDisplay 46) createDisplay "OL_ViewDistance";


private _ctrl_1 = (findDisplay 199007) displayCtrl 3001;
private _ctrl_2 = (findDisplay 199007) displayCtrl 3002;
private _ctrl_3 = (findDisplay 199007) displayCtrl 3003;
private _ctrl_4 = (findDisplay 199007) displayCtrl 3004;

private _ctrl_5 = (findDisplay 199007) displayCtrl 3005;
private _ctrl_6 = (findDisplay 199007) displayCtrl 3006;
private _ctrl_7 = (findDisplay 199007) displayCtrl 3007;
private _ctrl_8 = (findDisplay 199007) displayCtrl 3008;


//**************************************************
//           VEHICLE VIEW DISTANCE
//**************************************************
_ctrl_1 sliderSetPosition _viewDistance1;
_ctrl_2 ctrlSetStructuredText parseText format ["<t size='1' shadow='2' align='center' >View: %1</t>", _viewDistance1];


//**************************************************
//           VEHICLE OBJECT DISTANCE
//**************************************************
_ctrl_3 sliderSetPosition _viewDistance2;
_ctrl_4 ctrlSetStructuredText parseText format ["<t size='1' shadow='2' align='center' >Object: %1</t>", _viewDistance2];




//**************************************************
//           ON FOOT VIEW DISTANCE
//**************************************************
_ctrl_5 sliderSetPosition _viewDistance3;
_ctrl_6 ctrlSetStructuredText parseText format ["<t size='1' shadow='2' align='center' >View: %1</t>", _viewDistance3];


//**************************************************
//           ON FOOT OBJECT DISTANCE
//**************************************************
_ctrl_7 sliderSetPosition _viewDistance4;
_ctrl_8 ctrlSetStructuredText parseText format ["<t size='1' shadow='2' align='center' >Object: %1</t>", _viewDistance4];


