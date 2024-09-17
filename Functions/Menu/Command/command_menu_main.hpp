
// missionConfigFile >> "OL_CommandMenuMain"
// createDialog "OL_CommandMenuMain";

class OL_CommandMenuMain
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

class OL_command_menu_background: IGUIBack
{
	idc = 2000;

	x = 0.42161 * safezoneW + safezoneX;
	y = 0.258029 * safezoneH + safezoneY;
	w = 0.1568 * safezoneW;
	h = 0.32996 * safezoneH;
};

class OL_command_menu_title_1: RscStructuredText
{
	idc = 2001;

	text = "<t size='1.5' shadow='0' align='center' font='RobotoCondensed' >Command Menu</t>"; //--- ToDo: Localize;
	x = 0.421595 * safezoneW + safezoneX;
	y = 0.225049 * safezoneH + safezoneY;
	w = 0.15681 * safezoneW;
	h = 0.0329941 * safezoneH;
	colorBackground[] = {0,0,0,1};
	sizeEx = 0.0329941 * safezoneH;
};
class OL_command_menu_frame_1: RscFrame
{
	idc = 2002;

	x = 0.421595 * safezoneW + safezoneX;
	y = 0.225049 * safezoneH + safezoneY;
	w = 0.15681 * safezoneW;
	h = 0.0329941 * safezoneH;
};

class OL_command_menu_frame_2: RscFrame
{
	idc = 2003;

	x = 0.4216 * safezoneW + safezoneX;
	y = 0.258029 * safezoneH + safezoneY;
	w = 0.1568 * safezoneW;
	h = 0.32996 * safezoneH;
};

class OL_command_button_supply: RscButton
{
	idc = 2004;

	text = "Supply Menu"; //--- ToDo: Localize;
	x = 0.436296 * safezoneW + safezoneX;
	y = 0.291038 * safezoneH + safezoneY;
	w = 0.127393 * safezoneW;
	h = 0.0439921 * safezoneH;
	toolTip = "Only the commander has access to this menu.";
	action = " (findDisplay 420692) closeDisplay 1; [] spawn OL_fnc_menu_supply_main; ";
};

class OL_command_button_recruit: RscButton
{
	idc = 2005;

	text = "Recruit Menu"; //--- ToDo: Localize;
	x = 0.436296 * safezoneW + safezoneX;
	y = 0.346028 * safezoneH + safezoneY;
	w = 0.127393 * safezoneW;
	h = 0.0439921 * safezoneH;
	toolTip = "Recruit AI Squad Members.";
	action = "(findDisplay 420692) closeDisplay 1; [] spawn OL_fnc_menu_recruit_main; ";
};

class OL_command_button_squad: RscButton
{
	idc = 2006;

	text = "Squad Menu"; //--- ToDo: Localize;
	x = 0.436296 * safezoneW + safezoneX;
	y = 0.401018 * safezoneH + safezoneY;
	w = 0.127393 * safezoneW;
	h = 0.0439921 * safezoneH;
	toolTip = "AI Unit Settings / Remote Control";
	action = "(findDisplay 420692) closeDisplay 1; [] spawn OL_fnc_menu_squad_main; ";
};

class OL_command_button_rally: RscButton
{
	idc = 2007;


	text = "Deploy Rally Point"; //--- ToDo: Localize;
	x = 0.4363 * safezoneW + safezoneX;
	y = 0.456005 * safezoneH + safezoneY;
	w = 0.127393 * safezoneW;
	h = 0.0439921 * safezoneH;
	tooltip = "Deploys Squad Teleport Point"; //--- ToDo: Localize;
	action = "(findDisplay 420692) closeDisplay 1; [[player],OL_fnc_menu_command_rallypoint] remoteExec ['spawn',2]; ";
};

class OL_supply_button_close: RscButton
{
	idc = 2008;

	text = "Close"; //--- ToDo: Localize;
	x = 0.4412 * safezoneW + safezoneX;
	y = 0.521997 * safezoneH + safezoneY;
	w = 0.117607 * safezoneW;
	h = 0.0439921 * safezoneH;
	action = " (findDisplay 420692) closeDisplay 1; ";
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
