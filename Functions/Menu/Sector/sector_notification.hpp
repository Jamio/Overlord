

// missionConfigFile >> "OL_sector_notification"
// createDialog "OL_sector_notification";

class OL_sector_notification
{
	idd = 59321;
	//onLoad = "(_this select 0) displayAddEventhandler ['KeyDown', {(_this select 1) isEqualTo 1}];";


	class Controls
	{
//************************************************************************************************************
//
//             class Controls 
//
//************************************************************************************************************





	class OL_sector_notification_title_1: RscStructuredText
	{
		idc = 200;

		text = "<t size='0.9' shadow='0' align='center' font='RobotoCondensed' >Objective Strength</t>"; //--- ToDo: Localize;
		x = 0.711406 * safezoneW + safezoneX;
		y = 0.016 * safezoneH + safezoneY;
		w = 0.102101 * safezoneW;
		h = 0.0212831 * safezoneH;
		colorBackground[] = {0,0.5,0,1};
		sizeEx = 1 * safezoneH;
	};
	
	class OL_sector_notification_title_2: RscStructuredText
	{
		idc = 2001;

		text = "<t size='0.2'>&#160;</t><br/><t size='1' shadow='0' valign='middle' align='Center' font='RobotoCondensed' >Sector Name:  25</t>"; //--- ToDo: Localize;
		x = 0.711406 * safezoneW + safezoneX;
		y = 0.038 * safezoneH + safezoneY;
		w = 0.101938 * safezoneW;
		h = 0.0322601 * safezoneH;
		colorBackground[] = {-1,-1,-1,0.6};
		sizeEx = 1 * safezoneH;
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
