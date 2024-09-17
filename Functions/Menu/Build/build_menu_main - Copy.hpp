
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



class OL_build_menu_background: IGUIBack
{
	idc = 2000;

	x = 0.382407 * safezoneW + safezoneX;
	y = 0.258043 * safezoneH + safezoneY;
	w = 0.235187 * safezoneW;
	h = 0.362935 * safezoneH;
};

class OL_build_menu_title_1: RscStructuredText
{
	idc = 2001;

	text = "<t size='1.5' shadow='0' align='center' font='RobotoCondensed' >Build Menu</t>"; //--- ToDo: Localize;
	x = 0.382407 * safezoneW + safezoneX;
	y = 0.225049 * safezoneH + safezoneY;
	w = 0.235187 * safezoneW;
	h = 0.0329941 * safezoneH;
	colorBackground[] = {0,0,0,1};
	sizeEx = 0.0329941 * safezoneH;
};

class OL_build_menu_frame_1: RscFrame
{
	idc = 2002;

	x = 0.382407 * safezoneW + safezoneX;
	y = 0.225049 * safezoneH + safezoneY;
	w = 0.235187 * safezoneW;
	h = 0.0329941 * safezoneH;
};

class OL_build_menu_frame_2: RscFrame
{
	idc = 2003;

	x = 0.382407 * safezoneW + safezoneX;
	y = 0.258043 * safezoneH + safezoneY;
	w = 0.235187 * safezoneW;
	h = 0.362935 * safezoneH;
};



class OL_build_title_totalSupplies_1: RscStructuredText
{
	idc = 2004;

	text = "<t size='1.4' shadow='0' align='center' font='RobotoCondensed' >Supplies Available:  200</t>"; //--- ToDo: Localize;
	x = 0.386562 * safezoneW + safezoneX;
	y = 0.28 * safezoneH + safezoneY;
	w = 0.226875 * safezoneW;
	h = 0.033 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
	sizeEx = 0.033 * safezoneH;
};


class OL_build_listbox_1: RscListbox
{
	idc = 2006;
	x = 0.402006 * safezoneW + safezoneX;
	y = 0.33503 * safezoneH + safezoneY;
	w = 0.195989 * safezoneW;
	h = 0.197964 * safezoneH;
	onLBSelChanged = "[] spawn OL_fnc_menu_lb_change;";
};

class OL_build_button_supplyDrop: RscButton
{
	idc = 2007;

	text = "Build"; //--- ToDo: Localize;
	x = 0.402006 * safezoneW + safezoneX;
	y = 0.55499 * safezoneH + safezoneY;
	w = 0.088195 * safezoneW;
	h = 0.0439921 * safezoneH;
	action = "[] spawn OL_fnc_menu_build_select;";
};

class OL_build_button_close: RscButton
{
	idc = 2008;

	text = "Close"; //--- ToDo: Localize;
	x = 0.509799 * safezoneW + safezoneX;
	y = 0.55499 * safezoneH + safezoneY;
	w = 0.088195 * safezoneW;
	h = 0.0439921 * safezoneH;
	action = "closeDialog 2;";
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
