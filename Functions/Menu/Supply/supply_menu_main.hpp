
// missionConfigFile >> "OL_SupplyMenuMain"
// createDialog "OL_SupplyMenuMain";

class OL_SupplyMenuMain
{
	idd = 420691;
	onLoad = "";

	class Controls
	{


//************************************************************************************************************
//
//             class Controls 
//
//************************************************************************************************************



class OL_supply_menu_background: IGUIBack
{
	idc = 2000;

	x = 0.304011 * safezoneW + safezoneX;
	y = 0.258043 * safezoneH + safezoneY;
	w = 0.391978 * safezoneW;
	h = 0.373933 * safezoneH;
};

class OL_supply_menu_title_1: RscStructuredText
{
	idc = 2001;

	text = "<t size='1.5' shadow='0' align='center' font='RobotoCondensed' >Supply Menu</t>"; //--- ToDo: Localize;
	x = 0.304011 * safezoneW + safezoneX;
	y = 0.225049 * safezoneH + safezoneY;
	w = 0.391978 * safezoneW;
	h = 0.0329941 * safezoneH;
	colorBackground[] = {0,0,0,1};
	sizeEx = 0.0329941 * safezoneH;
};

class OL_supply_menu_frame_1: RscFrame
{
	idc = 2001;
	x = 0.304011 * safezoneW + safezoneX;
	y = 0.225049 * safezoneH + safezoneY;
	w = 0.391978 * safezoneW;
	h = 0.0329941 * safezoneH;
};

class OL_supply_menu_frame_2: RscFrame
{
	idc = 2002;
	x = 0.304011 * safezoneW + safezoneX;
	y = 0.258043 * safezoneH + safezoneY;
	w = 0.391978 * safezoneW;
	h = 0.373933 * safezoneH;
};

class OL_supply_mapPic: RscPicture
{
	idc = 2003;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.441203 * safezoneW + safezoneX;
	y = 0.269042 * safezoneH + safezoneY;
	w = 0.244986 * safezoneW;
	h = 0.351937 * safezoneH;
};


class OL_supply_title_fortificationSupplies: RscStructuredText
{
	idc = 2004;

	text = "<t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Fortification Supplies</t>"; //--- ToDo: Localize;
	x = 0.304011 * safezoneW + safezoneX;
	y = 0.28004 * safezoneH + safezoneY;
	w = 0.137192 * safezoneW;
	h = 0.021996 * safezoneH;
	colorBackground[] = {0,0,0,0};
	sizeEx = 1 * safezoneH;
};


class OL_supply_title_totalSupplies_1: RscStructuredText
{
	idc = 2005;
	
	text = "<t size='1.1' shadow='0' align='Left' font='RobotoCondensed' >Reserve:      100</t>"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.324 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
	sizeEx = 0.022 * safezoneH;
};



class OL_supply_button_totalSupplies: RscButton
{
	idc = 2007;
	text = "+"; //--- ToDo: Localize;
	x = 0.402209 * safezoneW + safezoneX;
	y = 0.318908 * safezoneH + safezoneY;
	w = 0.0195989 * safezoneW;
	h = 0.0329941 * safezoneH;
	sizeEx = 0.0329941 * safezoneH;
	action = "_sel = 0; [_sel] spawn OL_fnc_menu_supply_addSupplies; ";
};


class OL_supply_title_totalCompany_1: RscStructuredText
{
	idc = 2008;
	
	text = "<t size='1.1' shadow='0' align='Left' font='RobotoCondensed' >Company:   100</t>"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.368 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
	sizeEx = 0.022 * safezoneH;
	
};




class OL_supply_button_totalCompany: RscButton
{
	idc = 2010;
	text = "+"; //--- ToDo: Localize;
	x = 0.402175 * safezoneW + safezoneX;
	y = 0.362397 * safezoneH + safezoneY;
	w = 0.0195989 * safezoneW;
	h = 0.0329941 * safezoneH;
	sizeEx = 0.0329941 * safezoneH;
	action = "_sel = 1;  [_sel] spawn OL_fnc_menu_supply_addSupplies; ";
};




class OL_supply_title_supplyDrop: RscStructuredText
{
	idc = 2011;

	text = "<t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Supply Drop</t>"; //--- ToDo: Localize;
	x = 0.3068 * safezoneW + safezoneX;
	y = 0.418424 * safezoneH + safezoneY;
	w = 0.13289 * safezoneW;
	h = 0.0272857 * safezoneH;
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.0272857 * safezoneH;
};

class OL_supply_title_supplyDrop_1: RscStructuredText
{
	idc = 2012;
	
	text = "<t size='1.1' shadow='0' align='Center' font='RobotoCondensed' >Drops Available:   3</t>"; //--- ToDo: Localize;
	x = 0.314375 * safezoneW + safezoneX;
	y = 0.456 * safezoneH + safezoneY;
	w = 0.118594 * safezoneW;
	h = 0.022 * safezoneH;
	colorBackground[] = {-1,-1,-1,0};
	sizeEx = 0.022 * safezoneH;
};



class OL_supply_button_supplyDrop: RscButton
{
	idc = 2014;
	text = "Request Drop"; //--- ToDo: Localize;
	x = 0.308911 * safezoneW + safezoneX;
	y = 0.489002 * safezoneH + safezoneY;
	w = 0.127393 * safezoneW;
	h = 0.0439921 * safezoneH;
	action = "[] spawn OL_fnc_menu_supply_supplyDrop;";
};

class OL_supply_button_close: RscButton
{
	idc = 2015;
	text = "Close"; //--- ToDo: Localize;
	x = 0.333409 * safezoneW + safezoneX;
	y = 0.565988 * safezoneH + safezoneY;
	w = 0.0783956 * safezoneW;
	h = 0.0439921 * safezoneH;
	action = "(findDisplay 420691) closeDisplay 1; [] spawn OL_fnc_menu_command_main;";
};










//****************************************************************************
//
//             MAP   START   (51)
//
//****************************************************************************

class RscMapControl_AIM
{
	idc = 51;
	deletable = 0;
	fade = 0;
	access = 0;
	type = CT_MAP_MAIN;
	style = ST_MULTI + ST_TITLE_BAR;
	colorBackground[] = {0.969,0.957,0.949,1};
	colorOutside[] = {0,0,0,1};
	colorText[] = {0,0,0,1};
	font = "TahomaB";
	sizeEx = 0.04;
	colorSea[] = {0.467,0.631,0.851,0.5};
	colorForest[] = {0.624,0.78,0.388,0.5};
	colorRocks[] = {0,0,0,0.3};
	colorCountlines[] = {0.572,0.354,0.188,0.25};
	colorMainCountlines[] = {0.572,0.354,0.188,0.5};
	colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
	colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
	colorForestBorder[] = {0,0,0,0};
	colorRocksBorder[] = {0,0,0,0};
	colorPowerLines[] = {0.1,0.1,0.1,1};
	colorRailWay[] = {0.8,0.2,0,1};
	colorNames[] = {0.1,0.1,0.1,0.9};
	colorInactive[] = {1,1,1,0.5};
	colorLevels[] = {0.286,0.177,0.094,0.5};
	colorTracks[] = {0.84,0.76,0.65,0.15};
	colorRoads[] = {0.7,0.7,0.7,1};
	colorMainRoads[] = {0.9,0.5,0.3,1};
	colorTracksFill[] = {0.84,0.76,0.65,1};
	colorRoadsFill[] = {1,1,1,1};
	colorMainRoadsFill[] = {1,0.6,0.4,1};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	stickX[] = {0.2,["Gamma",1,1.5]};
	stickY[] = {0.2,["Gamma",1,1.5]};
	onMouseButtonClick = "ctrlShow [1104, true]; ";



	class Legend
	{
		colorBackground[] = {1,1,1,0.5};
		color[] = {0,0,0,1};
		x = SafeZoneX + GUI_GRID_W;
		y = SafeZoneY + safezoneH - 4.5 * GUI_GRID_H;
		w = 10 * GUI_GRID_W;
		h = 3.5 * GUI_GRID_H;
		font = "RobotoCondensed";
		sizeEx = GUI_TEXT_SIZE_SMALL;
	};
	class ActiveMarker
	{
		color[] = {0.3,0.1,0.9,1};
		size = 50;
	};
	class Command
	{
		color[] = {1,1,1,1};
		icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Task
	{
		taskNone = "#(argb,8,8,3)color(0,0,0,0)";
		taskCreated = "#(argb,8,8,3)color(0,0,0,1)";
		taskAssigned = "#(argb,8,8,3)color(1,1,1,1)";
		taskSucceeded = "#(argb,8,8,3)color(0,1,0,1)";
		taskFailed = "#(argb,8,8,3)color(1,0,0,1)";
		taskCanceled = "#(argb,8,8,3)color(1,0.5,0,1)";
		colorCreated[] = {1,1,1,1};
		colorCanceled[] = {0.7,0.7,0.7,1};
		colorDone[] = {0.7,1,0.3,1};
		colorFailed[] = {1,0.3,0.2,1};
		color[] =
		{
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])",
			"(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"
		};
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		size = 27;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class CustomMark
	{
		color[] = {1,1,1,1};
		icon = "\a3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		size = 18;
		importance = 1;
		coefMin = 1;
		coefMax = 1;
	};
	class Tree
	{
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = 12;
		importance = "0.9 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class SmallTree
	{
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = 12;
		importance = "0.6 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bush
	{
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		size = "14/2";
		importance = "0.2 * 14 * 0.05 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Church
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Chapel
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Cross
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Rock
	{
		color[] = {0.1,0.1,0.1,0.8};
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		size = 12;
		importance = "0.5 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Bunker
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 14;
		importance = "1.5 * 14 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fortress
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class Fountain
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		size = 11;
		importance = "1 * 12 * 0.05";
		coefMin = 0.25;
		coefMax = 4;
	};
	class ViewTower
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		size = 16;
		importance = "2.5 * 16 * 0.05";
		coefMin = 0.5;
		coefMax = 4;
	};
	class Lighthouse
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Quay
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Fuelstation
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Hospital
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class BusStop
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class LineMarker
	{
		textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
		lineWidthThin = 0.008;
		lineWidthThick = 0.014;
		lineDistanceMin = 3e-005;
		lineLengthMin = 5;
	};
	class Transmitter
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Stack
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		size = 16;
		importance = "2 * 16 * 0.05";
		coefMin = 0.4;
		coefMax = 2;
	};
	class Ruin
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		size = 16;
		importance = "1.2 * 16 * 0.05";
		coefMin = 1;
		coefMax = 4;
	};
	class Tourism
	{
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		size = 16;
		importance = "1 * 16 * 0.05";
		coefMin = 0.7;
		coefMax = 4;
	};
	class Watertower
	{
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
	};
	class Waypoint
	{
		color[] = {1,1,1,1};
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\a3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		size = 18;
	};
	class WaypointCompleted
	{
		color[] = {1,1,1,1};
		importance = 1;
		coefMin = 1;
		coefMax = 1;
		icon = "\a3\ui_f\data\map\mapcontrol\waypointcompleted_ca.paa";
		size = 18;
	};
	moveOnEdges = 1;
	x = 0.441203 * safezoneW + safezoneX;
	y = 0.269042 * safezoneH + safezoneY;
	w = 0.244986 * safezoneW;
	h = 0.351937 * safezoneH;
	shadow = 0;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 20;
	ptsPerSquareCLn = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareObj = 9;
	showCountourInterval = 0;
	scaleMin = 0.001;
	scaleMax = 1;
	scaleDefault = 0.16;
	maxSatelliteAlpha = 0.85;
	alphaFadeStartScale = 2;
	alphaFadeEndScale = 2;
	colorTrails[] = {0.84,0.76,0.65,0.15};
	colorTrailsFill[] = {0.84,0.76,0.65,0.65};
	widthRailWay = 4;
	fontLabel = "RobotoCondensed";
	sizeExLabel = GUI_TEXT_SIZE_SMALL;
	fontGrid = "TahomaB";
	sizeExGrid = 0.02;
	fontUnits = "TahomaB";
	sizeExUnits = GUI_TEXT_SIZE_SMALL;
	fontNames = "RobotoCondensed";
	sizeExNames = GUI_TEXT_SIZE_SMALL * 2;
	fontInfo = "RobotoCondensed";
	sizeExInfo = GUI_TEXT_SIZE_SMALL;
	fontLevel = "TahomaB";
	sizeExLevel = 0.02;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	idcMarkerColor = -1;
	idcMarkerIcon = -1;
	textureComboBoxColor = "#(argb,8,8,3)color(1,1,1,1)";
	showMarkers = 1;
	class power
	{
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powersolar
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powerwave
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class powerwind
	{
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {1,1,1,1};
	};
	class Shipwreck
	{
		icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
		size = 24;
		importance = 1;
		coefMin = 0.85;
		coefMax = 1;
		color[] = {0,0,0,1};
	};
};

//****************************************************************************
//
//             MAP   END
//
//****************************************************************************





//*****************************************************************************************************************************************************************************
//
//
//            CONTROLS END
//
//
//*****************************************************************************************************************************************************************************





	};

};
