
// missionConfigFile >> "OL_SquadMenuMain"
// createDialog "OL_SquadMenuMain";

class OL_SquadMenuMain
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


class OL_squad_menu_background: IGUIBack
{
	idc = 2000;

	x = 0.304023 * safezoneW + safezoneX;
	y = 0.258029 * safezoneH + safezoneY;
	w = 0.392001 * safezoneW;
	h = 0.516938 * safezoneH;
};

class OL_squad_menu_title_1: RscStructuredText
{
	idc = 2001;

	text = "<t size='1.5' shadow='0' align='center' font='RobotoCondensed' >Squad Menu</t>"; //--- ToDo: Localize;
	x = 0.303988 * safezoneW + safezoneX;
	y = 0.225049 * safezoneH + safezoneY;
	w = 0.391978 * safezoneW;
	h = 0.0329941 * safezoneH;
	colorBackground[] = {0,0,0,1};
	sizeEx = 0.0329941 * safezoneH;
};

class OL_squad_menu_frame_1: RscFrame
{
	idc = 2002;

	x = 0.303988 * safezoneW + safezoneX;
	y = 0.225049 * safezoneH + safezoneY;
	w = 0.391978 * safezoneW;
	h = 0.0329941 * safezoneH;
};

class OL_squad_menu_frame_2: RscFrame
{
	idc = 2003;

	x = 0.304 * safezoneW + safezoneX;
	y = 0.258029 * safezoneH + safezoneY;
	w = 0.392001 * safezoneW;
	h = 0.516938 * safezoneH;
};

class OL_squad_menu_title_2: RscStructuredText
{
	idc = 2004;

	text = "<t size='1.2' shadow='0' align='center' font='RobotoCondensed' >AI Units</t>"; //--- ToDo: Localize;
	x = 0.313788 * safezoneW + safezoneX;
	y = 0.291038 * safezoneH + safezoneY;
	w = 0.15681 * safezoneW;
	h = 0.021996 * safezoneH;
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.021996 * safezoneH;
};

class OL_squad_lb_1: RscListbox
{
	idc = 2005;
	x = 0.3089 * safezoneW + safezoneX;
	y = 0.324021 * safezoneH + safezoneY;
	w = 0.1617 * safezoneW;
	h = 0.241971 * safezoneH;
	sizeEx = .8  * GUI_GRID_H;
	onLBSelChanged = "[] spawn OL_fnc_menu_squad_unitSelected; ";
};

class OL_squad_menu_title_3: RscStructuredText
{
	idc = 2006;

	text = "<t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Individual Commands</t>"; //--- ToDo: Localize;
	x = 0.3138 * safezoneW + safezoneX;
	y = 0.587989 * safezoneH + safezoneY;
	w = 0.15681 * safezoneW;
	h = 0.021996 * safezoneH;
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.021996 * safezoneH;
};

class OL_squad_but_control_1: RscButton
{
	idc = 2007;

	text = "Delete"; //--- ToDo: Localize;
	x = 0.3138 * safezoneW + safezoneX;
	y = 0.620986 * safezoneH + safezoneY;
	w = 0.0735002 * safezoneW;
	h = 0.032996 * safezoneH;
	action = "[] spawn OL_fnc_menu_squad_delete_unit; ";
	tooltip = "Delete Selected Unit."; //--- ToDo: Localize;
};

class OL_squad_but_control_2: RscButton
{
	idc = 2008;

	text = "Move to RallyPoint"; //--- ToDo: Localize;
	x = 0.3971 * safezoneW + safezoneX;
	y = 0.620986 * safezoneH + safezoneY;
	w = 0.0735002 * safezoneW;
	h = 0.032996 * safezoneH;
	action = "[] spawn OL_fnc_menu_squad_rally_point; ";
	tooltip = "Move unit to rallypoint (Must be in dropzone and not in a vehicle)."; //--- ToDo: Localize;

	
};

class OL_squad_but_move_3: RscButton
{
	idc = 2009;
	text = "Disable Move"; //--- ToDo: Localize;
	x = 0.3138 * safezoneW + safezoneX;
	y = 0.66498 * safezoneH + safezoneY;
	w = 0.0735002 * safezoneW;
	h = 0.032996 * safezoneH;
	action = "[] spawn OL_fnc_menu_squad_move; ";
	toolTip = "Disable / Enable AI Movement.";
};

class OL_squad_but_control_4: RscButton
{
	idc = 2010;
	text = "Take Control"; //--- ToDo: Localize;
	x = 0.3971 * safezoneW + safezoneX;
	y = 0.66498 * safezoneH + safezoneY;
	w = 0.0735002 * safezoneW;
	h = 0.032996 * safezoneH;
	action = "[] spawn OL_fnc_menu_squad_control; ";
	toolTip = "Take remote control of AI.";
};

class OL_squad_menu_title_4: RscStructuredText
{
	idc = 2011;

	text = "<t size='1.2' shadow='0' align='center' font='RobotoCondensed' >Squad Commands</t>"; //--- ToDo: Localize;
	x = 0.5049 * safezoneW + safezoneX;
	y = 0.587989 * safezoneH + safezoneY;
	w = 0.15681 * safezoneW;
	h = 0.021996 * safezoneH;
	colorBackground[] = {0,0,0,0};
	sizeEx = 0.021996 * safezoneH;
};

class OL_squad_but_control_5: RscButton
{
	idc = 2012;

	text = "Delete All"; //--- ToDo: Localize;
	x = 0.4804 * safezoneW + safezoneX;
	y = 0.620986 * safezoneH + safezoneY;
	w = 0.0931002 * safezoneW;
	h = 0.032996 * safezoneH;
	action = "[] spawn OL_fnc_menu_squad_delete_all; ";
	tooltip = "Delete all AI squad members."; //--- ToDo: Localize;
};

class OL_squad_but_control_6: RscButton
{
	idc = 2013;

	text = "Move to RallyPoint"; //--- ToDo: Localize;
	x = 0.5833 * safezoneW + safezoneX;
	y = 0.620986 * safezoneH + safezoneY;
	w = 0.1029 * safezoneW;
	h = 0.032996 * safezoneH;
	action = "[] spawn OL_fnc_menu_squad_rally_point_all; ";
	tooltip = "Move all AI squad members to rallypoint."; //--- ToDo: Localize;
};

class OL_squad_but_control_8: RscButton
{
	idc = 2014;

	text = "Disable Move"; //--- ToDo: Localize;
	x = 0.5833 * safezoneW + safezoneX;
	y = 0.66498 * safezoneH + safezoneY;
	w = 0.1029 * safezoneW;
	h = 0.032996 * safezoneH;
	action = "[] spawn OL_fnc_menu_squad_disableMove_all; ";
	toolTip = "Disable AI Movement for all squad members.";
};

class OL_squad_but_control_7: RscButton
{
	idc = 2015;

	text = "Enable Move"; //--- ToDo: Localize;
	x = 0.4804 * safezoneW + safezoneX;
	y = 0.66498 * safezoneH + safezoneY;
	w = 0.0931002 * safezoneW;
	h = 0.032996 * safezoneH;
	action = "[] spawn OL_fnc_menu_squad_enableMove_all; ";
	toolTip = "Enable AI Movement for all squad members.";
};





class OL_squad_but_takeControl: RscButton
{
	idc = 2016;
	text = "Take Command"; //--- ToDo: Localize;
	x = 0.3138 * safezoneW + safezoneX;
	y = 0.719974 * safezoneH + safezoneY;
	w = 0.1568 * safezoneW;
	h = 0.032996 * safezoneH;
	sizeEx = 0.032996 * safezoneH;
	action = " [group player, player] remoteExec ['selectLeader', groupOwner group player]; ";
	toolTip = "Reassign as squad leader.";
};

class OL_squad_but_close: RscButton
{
	idc = 2017;
	text = "Close"; //--- ToDo: Localize;
	x = 0.4804 * safezoneW + safezoneX;
	y = 0.719974 * safezoneH + safezoneY;
	w = 0.2058 * safezoneW;
	h = 0.032996 * safezoneH;
	sizeEx = 0.032996 * safezoneH;
	action = "closeDialog 2; [] spawn OL_fnc_menu_command_main;";
};





class OL_squad_menu_mapPic: RscPicture
{
	idc = 2018;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	x = 0.480413 * safezoneW + safezoneX;
	y = 0.291025 * safezoneH + safezoneY;
	w = 0.2058 * safezoneW;
	h = 0.285966 * safezoneH;
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
	x = 0.480413 * safezoneW + safezoneX;
	y = 0.291025 * safezoneH + safezoneY;
	w = 0.2058 * safezoneW;
	h = 0.285966 * safezoneH;
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
