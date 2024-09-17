
// missionConfigFile >> "OL_RecruitMenuMain"
// createDialog "OL_RecruitMenuMain";

class OL_RecruitMenuMain
{
	idd = 420693;
	onLoad = "";

	class Controls
	{


//************************************************************************************************************
//
//             class Controls 
//
//************************************************************************************************************



class OL_recruit_menu_background: IGUIBack
{
	idc = 2000;

	x = 0.353009 * safezoneW + safezoneX;
	y = 0.258043 * safezoneH + safezoneY;
	w = 0.293983 * safezoneW;
	h = 0.428923 * safezoneH;
};

class OL_recruit_menu_title_1: RscStructuredText
{
	idc = 2001;

	text = "<t size='1.5' shadow='0' align='center' font='RobotoCondensed' >Recruit Menu</t>"; //--- ToDo: Localize;
	x = 0.353007 * safezoneW + safezoneX;
	y = 0.225049 * safezoneH + safezoneY;
	w = 0.293983 * safezoneW;
	h = 0.0329941 * safezoneH;
	colorBackground[] = {0,0,0,1};
	sizeEx = 0.0329941 * safezoneH;
};

class OL_recruit_menu_frame_1: RscFrame
{
	idc = 2002;

	x = 0.353008 * safezoneW + safezoneX;
	y = 0.225049 * safezoneH + safezoneY;
	w = 0.293983 * safezoneW;
	h = 0.0329941 * safezoneH;
};

class OL_recruit_menu_frame_2: RscFrame
{
	idc = 2003;

	x = 0.353008 * safezoneW + safezoneX;
	y = 0.258043 * safezoneH + safezoneY;
	w = 0.293983 * safezoneW;
	h = 0.428923 * safezoneH;
};




class OL_recruit_title_totalRecruits_1: RscStructuredText
{
	idc = 2004;

	text = "<t size='0.5'>&#160;</t><br/><t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Recruits Available:   %1</t>"; //--- ToDo: Localize;
	x = 0.355625 * safezoneW + safezoneX;
	y = 0.269 * safezoneH + safezoneY;
	w = 0.28875 * safezoneW;
	h = 0.044 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
	sizeEx = 0.044 * safezoneH;
};




class OL_recruit_title_unitTypes_1: RscStructuredText
{
	idc = 2006;

	text = "<t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Unit Types Available</t>"; //--- ToDo: Localize;
	x = 0.362808 * safezoneW + safezoneX;
	y = 0.33503 * safezoneH + safezoneY;
	w = 0.127393 * safezoneW;
	h = 0.0329941 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
	sizeEx = 0.0329941 * safezoneH;
};

class OL_recruit_listbox_1: RscListBox
{
	idc = 2007;

	x = 0.362808 * safezoneW + safezoneX;
	y = 0.368024 * safezoneH + safezoneY;
	w = 0.127393 * safezoneW;
	h = 0.230958 * safezoneH;
	sizeEx = .8  * GUI_GRID_H;
	onLBSelChanged = "[] spawn OL_fnc_menu_recruit_added; ";
};

class OL_recruit_title_request: RscStructuredText
{
	idc = 2008;
	text = "<t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Units Requested</t>"; //--- ToDo: Localize;
	x = 0.509799 * safezoneW + safezoneX;
	y = 0.33503 * safezoneH + safezoneY;
	w = 0.127393 * safezoneW;
	h = 0.0329941 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
	sizeEx = 0.0329941 * safezoneH;
};

class OL_recruit_listbox_2: RscListBox
{
	idc = 2009;

	x = 0.509799 * safezoneW + safezoneX;
	y = 0.368024 * safezoneH + safezoneY;
	w = 0.127393 * safezoneW;
	h = 0.230958 * safezoneH;
	sizeEx = .8  * GUI_GRID_H;
	onLBSelChanged = "[] spawn OL_fnc_menu_recruit_removed;";
};



class OL_recruit_button_confirm: RscButton
{
	idc = 2010;
	
	text = "Confirm"; //--- ToDo: Localize;
	x = 0.372607 * safezoneW + safezoneX;
	y = 0.620978 * safezoneH + safezoneY;
	w = 0.107794 * safezoneW;
	h = 0.0439921 * safezoneH;
	action = "[] spawn OL_fnc_menu_recruit_confirm; ";
};

class OL_recruit_button_close: RscButton
{
	idc = 2011;

	text = "Cancel"; //--- ToDo: Localize;
	x = 0.514699 * safezoneW + safezoneX;
	y = 0.620978 * safezoneH + safezoneY;
	w = 0.107794 * safezoneW;
	h = 0.0439921 * safezoneH;
	action = " (findDisplay 420693) closeDisplay 1; [] spawn OL_fnc_menu_command_main;";
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
