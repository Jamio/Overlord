
// missionConfigFile >> "OL_BuildMenuMain"
// createDialog "OL_BuildMenuMain";

class OL_BuildMenuMain
{
	idd = 420692;
	onLoad = "";

	class Controls
	{


//************************************************************************************************************
//
//             class Controls 
//
//************************************************************************************************************



class OL_build_menu_background: RscPicture
{
	idc = 2000;
	text = "Pics\BuildMenu\menu_background_build.paa";
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.104 * safezoneH + safezoneY;
	w = 0.4125 * safezoneW;
	h = 0.671 * safezoneH;
	colorBackground[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
};
		

class OL_build_menu_title_1: RscStructuredText
{
	idc = 2001;

	text = "<t size='1.5' shadow='0' align='center' font='RobotoCondensed' >Build Menu</t>"; //--- ToDo: Localize;
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.144375 * safezoneW;
	h = 0.0332858 * safezoneH;
	colorBackground[] = {0,0,0,0};
	sizeEx = 1 * GUI_GRID_H;
};




class OL_build_title_totalSupplies_1: RscStructuredText
{
	idc = 2004;

	text = "<t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Supplies Available:  200</t>"; //--- ToDo: Localize;
	x = 0.422656 * safezoneW + safezoneX;
	y = 0.330714 * safezoneH + safezoneY;
	w = 0.154687 * safezoneW;
	h = 0.033 * safezoneH;
	sizeEx = 1 * GUI_GRID_H;
};




class OL_build_listbox_0: RscListNBox
{
	idc = 2005;
	
	type = CT_LISTNBOX; // ST_LEFT; 
	x = 0.430494 * safezoneW + safezoneX;
	y = 0.36316 * safezoneH + safezoneY;
	w = 0.139219 * safezoneW;
	h = 0.022 * safezoneH;
	
	colorScrollbar[] = {0,0,0,0};
	colorSelect[] = {1,1,1,1};
	colorSelect2[] = {1,1,1,1};
	colorSelectBackground[] = {0.95,0.95,0.95,0};
	colorSelectBackground2[] = {1,1,1,0};
	columns[] = {0,0.6,0.83}; 
	soundSelect[] = {"",0.1,0};
	disableOverflow = 1;
	idcLeft = -1; 
	idcRight = -1; 
	sizeEx = .9 * GUI_GRID_H;	
	
};


class OL_build_listbox_1: RscListNBox
{
	idc = 2006;
	
	type = CT_LISTNBOX; // ST_LEFT; 
	x = 0.430156 * safezoneW + safezoneX;
	y = 0.393857 * safezoneH + safezoneY;
	w = 0.139765 * safezoneW;
	h = 0.181714 * safezoneH;
	
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	columns[] = {-0.01,0.6,0.80}; 
	soundSelect[] = {"",0.1,0};
	disableOverflow = 1;
	idcLeft = -1; 
	idcRight = -1; 
	sizeEx = .9 * GUI_GRID_H;	
	
	onLBSelChanged = " [] spawn OL_fnc_menu_lb_change; ";
	
};





class OL_build_button_confirm: RscButton
{
	idc = 2007;

	text = "Build"; //--- ToDo: Localize;
	x = 0.425853 * safezoneW + safezoneX;
	y = 0.59152 * safezoneH + safezoneY;
	w = 0.065 * safezoneW;
	h = 0.0269999 * safezoneH;
	colorText[] = {1,1,1,0.8};
	colorActive[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.2};
	colorBackground[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorFocused[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	toolTip = "Confirm selection."
	action = " [] spawn OL_fnc_menu_build_select; ";
};

class OL_build_button_close: RscButton
{
	idc = 2008;

	text = "Close"; //--- ToDo: Localize;
	x = 0.511093 * safezoneW + safezoneX;
	y = 0.593714 * safezoneH + safezoneY;
	w = 0.0626563 * safezoneW;
	h = 0.0241428 * safezoneH;
	colorText[] = {1,1,1,0.8};
	colorActive[] = {1,1,1,1};
	colorBackground[] = {0,0,0,0};
	colorBackgroundDisabled[] = {0,0,0,0};
	colorBackgroundActive[] = {0,0,0,0};
	colorFocused[] = {0,0,0,0};
	colorShadow[] = {0,0,0,0};
	colorBorder[] = {0,0,0,0};
	toolTip = "Close menu."
	action = "(findDisplay 420692) closeDisplay 1;";
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
