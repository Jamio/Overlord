// missionConfigFile >> "OL_ViewDistance"
// createDialog "OL_ViewDistance";

class OL_ViewDistance
{
	idd = 199007;

	class Controls
	{
//************************************************************************************************************
//
//             class Controls 
//
//************************************************************************************************************


class OL_support_background: RscPicture
{
	idc = -1;
	text = "Pics\menu_background_view.paa";
	x = 0.29379 * safezoneW + safezoneX;
	y = 0.225049 * safezoneH + safezoneY;
	w = 0.41242 * safezoneW;
	h = 0.549901 * safezoneH;
	colorBackground[] = {0,0,0,1};
};


class OL_View_title_1: RscStructuredText
{
	idc = -1;
	text = "<t size='0.2'>&#160;</t><br/><t size='1.5' shadow='0' valign='middle' align='Center' font='RobotoCondensed'>View Distance Settings</t>"; //--- ToDo: Localize;
	x = 0.368842 * safezoneW + safezoneX;
	y = 0.406702 * safezoneH + safezoneY;
	w = 0.242297 * safezoneW;
	h = 0.0439921 * safezoneH;
	colorBackground[] = {0.176,0.278,0.537,0};
	sizeEx = 1 * GUI_GRID_H;
};

class OL_View_title_2: RscStructuredText
{
	idc = 1004;
	text = "<t size='1' shadow='1' align='center' >In Vehicle</t>"; //--- ToDo: Localize;
	x = 0.370274 * safezoneW + safezoneX;
	y = 0.47174 * safezoneH + safezoneY;
	w = 0.126213 * safezoneW;
	h = 0.0205321 * safezoneH;
	colorBackground[] = {0.176,0.278,0.537,0};
	sizeEx = 1 * GUI_GRID_H;
};


class OL_View_vehicle_text_1: RscStructuredText
{
	idc = 3002;

	text = "<t size='1' shadow='1' align='center' >View: 2000</t>"; //--- ToDo: Localize;
	x = 0.365763 * safezoneW + safezoneX;
	y = 0.503213 * safezoneH + safezoneY;
	w = 0.134036 * safezoneW;
	h = 0.0227279 * safezoneH;
	colorBackground[] = {0.176,0.278,0.537,0};
	sizeEx = 1 * GUI_GRID_H;
};

class OL_View_veh_slider_1: RscXSliderH
{
	idc = 3001;

	text = ""; //--- ToDo: Localize;
	x = 0.365964 * safezoneW + safezoneX;
	y = 0.50366 * safezoneH + safezoneY;
	w = 0.134036 * safezoneW;
	h = 0.021996 * safezoneH;
	color[] = {1,1,1,0.5};
	colorActive[] = {1,1,1,0.5};
	sliderRange[] = {100, 10000};
	sliderStep = 100;
	colorBackground[] = {1,1,1,1};
	onSliderPosChanged = " [] spawn OL_fnc_view_vehicle_1; ";
};




class OL_View_vehicle_text_2: RscStructuredText
{
	idc = 3004;

	text = "<t size='1' shadow='1' align='center' >Object: 2000</t>"; //--- ToDo: Localize;
	x = 0.365964 * safezoneW + safezoneX;
	y = 0.532994 * safezoneH + safezoneY;
	w = 0.134036 * safezoneW;
	h = 0.0227279 * safezoneH;
	colorBackground[] = {0.176,0.278,0.537,0};
	sizeEx = 1 * GUI_GRID_H;
};

class OL_View_veh_slider_2: RscXSliderH
{
	idc = 3003;
	
	text = ""; //--- ToDo: Localize;
	x = 0.365964 * safezoneW + safezoneX;
	y = 0.532994 * safezoneH + safezoneY;
	w = 0.134036 * safezoneW;
	h = 0.021996 * safezoneH;
	color[] = {1,1,1,0.5};
	colorActive[] = {1,1,1,0.5};
	sliderRange[] = {100, 10000};
	sliderStep = 100;
	colorBackground[] = {1,1,1,1};
	onSliderPosChanged = "[] spawn OL_fnc_view_vehicle_2; ";
	
};








class OL_View_title_3: RscStructuredText
{
	idc = 1005;

	text = "<t size='1' shadow='1' align='center' >On Foot</t>"; //--- ToDo: Localize;
	x = 0.512517 * safezoneW + safezoneX;
	y = 0.472187 * safezoneH + safezoneY;
	w = 0.126213 * safezoneW;
	h = 0.0205321 * safezoneH;
	colorBackground[] = {0.176,0.278,0.537,0};
	sizeEx = 1 * GUI_GRID_H;
};







class OL_View_foot_text_1: RscStructuredText
{
	idc = 3006;

	text = "<t size='1' shadow='1' align='center' >View: 2000</t>"; //--- ToDo: Localize;
	x = 0.509388 * safezoneW + safezoneX;
	y = 0.503659 * safezoneH + safezoneY;
	w = 0.134036 * safezoneW;
	h = 0.0227279 * safezoneH;
	colorBackground[] = {0.176,0.278,0.537,0};
	sizeEx = 1 * GUI_GRID_H;
};

class OL_View_foot_slider_1: RscXSliderH
{
	idc = 3005;

	text = ""; //--- ToDo: Localize;
	x = 0.509129 * safezoneW + safezoneX;
	y = 0.50366 * safezoneH + safezoneY;
	w = 0.134036 * safezoneW;
	h = 0.021996 * safezoneH;
	color[] = {1,1,1,0.5};
	colorActive[] = {1,1,1,0.5};
	sliderRange[] = {100, 10000};
	sliderStep = 100;
	colorBackground[] = {1,1,1,1};
	onSliderPosChanged = "[] spawn OL_fnc_view_foot_1; ";
	
};








class OL_View_foot_text_2: RscStructuredText
{
	idc = 3008;

	text = "<t size='1' shadow='1' align='center' >Object: 2000</t>"; //--- ToDo: Localize;
	x = 0.508997 * safezoneW + safezoneX;
	y = 0.534401 * safezoneH + safezoneY;
	w = 0.134036 * safezoneW;
	h = 0.0227279 * safezoneH;
	colorBackground[] = {0.176,0.278,0.537,0};
	sizeEx = 1 * GUI_GRID_H;
};

class OL_View_foot_slider_2: RscXSliderH
{
	idc = 3007;
	
	text = ""; //--- ToDo: Localize;
	x = 0.509137 * safezoneW + safezoneX;
	y = 0.534458 * safezoneH + safezoneY;
	w = 0.134036 * safezoneW;
	h = 0.021996 * safezoneH;
	color[] = {1,1,1,0.5};
	colorActive[] = {1,1,1,0.5};
	sliderRange[] = {100, 10000};
	sliderStep = 100;
	colorBackground[] = {1,1,1,1};
	onSliderPosChanged = "_pos = sliderPosition 3007; [_pos] spawn OL_fnc_view_foot_2; ";
};




class OL_support_confirm: RscActiveText
{
	idc = -1;
	type = CT_ACTIVETEXT;
	style = ST_PICTURE;
	x = 0.624389 * safezoneW + safezoneX;
	y = 0.412168 * safezoneH + safezoneY;
	w = 0.020621 * safezoneW;
	h = 0.0329941 * safezoneH;
	color[] = {1,1,1,1};
	colorActive[]= {1,1,1,0.5};
	colorDisabled[] = {1,1,1,0.2};
	soundEnter[] = {"",0,1};
	soundPush[]= {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundClick[]= {"",0,1};
	soundEscape[]= {"",0,1};
	//action = "  "; 
	onButtonClick = " (findDisplay 199007) closeDisplay 1; ";  
	text = "Pics\x_mark.paa";
	tooltip = "Close Menu";
	default = false;
	
};




//*****************************************************************************************************************************************************************************
//
//
//            CONTROLS END
//
//
//*****************************************************************************************************************************************************************************





	};

};
