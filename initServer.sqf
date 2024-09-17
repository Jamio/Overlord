

//*******************************************************************************
//
//      PreCompiled Scripts  -- EXAMPLE: [] spawn inf_respawn;
// 		
//*******************************************************************************


//****************************************
//    PLANES
//****************************************
OL_planes_start_wave = compile preprocessFileLineNumbers "Scripts\Planes\1_start_wave.sqf";
OL_planes_respawn_wave_1 = compile preprocessFileLineNumbers "Scripts\Planes\2_respawn_wave.sqf";
OL_planes_dialog = compile preprocessFileLineNumbers "Scripts\Planes\3_dialog.sqf";
OL_planes_paradrop = compile preprocessFileLineNumbers "Scripts\Planes\4_paradrop.sqf";
OL_planes_spawnCrash = compile preprocessFileLineNumbers "Scripts\Planes\5_plane_crash.sqf";
OL_planes_end = compile preprocessFileLineNumbers "Scripts\Planes\6_plane_end.sqf";

	
	
//****************************************
//    RESPAWN STUFF
//****************************************
OL_respawn_manager = compile preprocessFileLineNumbers "Scripts\Respawn\respawn_manager.sqf";
OL_respawn_timer_script = compile preprocessFileLineNumbers "Scripts\Respawn\respawn_timer.sqf";


//****************************************
//         ENEMY SHIT
//****************************************
OL_enemy_airRaid_manager = compile preprocessFileLineNumbers "Scripts\Enemy\air_raid_manager.sqf";
OL_enemy_spotlight = compile preprocessFileLineNumbers "Scripts\Enemy\spotlight_call.sqf";
OL_enemy_AA_fire = compile preprocessFileLineNumbers "Scripts\Enemy\AA_fire_call.sqf";
OL_enemy_AA_flak = compile preprocessFileLineNumbers "Scripts\Enemy\AA_flak_call.sqf";
OL_enemy_ARTY = compile preprocessFileLineNumbers "Scripts\Enemy\ARTY_call.sqf";



//****************************************
//         MISC
//****************************************
OL_start_mission = compile preprocessFileLineNumbers "Scripts\Start\start_mission.sqf";
OL_paratrooper_cleanup = compile preprocessFileLineNumbers "Scripts\Start\paratrooper_cleanup.sqf";
OL_start_mission_2 = compile preprocessFileLineNumbers "Scripts\Start\start_mission_2.sqf";
OL_end_victory = compile preprocessFileLineNumbers "Scripts\End\victory_end.sqf";
OL_end_lose = compile preprocessFileLineNumbers "Scripts\End\lose_end.sqf";




//****************************************
//       HOLD ACTIONS
//****************************************
OL_ha_expl_aa = compile preprocessFileLineNumbers "Scripts\Holdactions\ha_aa_explosives.sqf";
OL_ha_expl_tower = compile preprocessFileLineNumbers "Scripts\Holdactions\ha_tower_explosives.sqf";
OL_ha_expl_veh = compile preprocessFileLineNumbers "Scripts\Holdactions\ha_veh_explosives.sqf";
OL_ha_intel = compile preprocessFileLineNumbers "Scripts\Holdactions\ha_pickup_intel.sqf";
OL_ha_flag_raise = compile preprocessFileLineNumbers "Scripts\Holdactions\ha_raise_flag.sqf";
OL_ha_supplyBox = compile preprocessFileLineNumbers "Scripts\Holdactions\ha_supplybox.sqf";


[] spawn OL_ha_expl_tower;
[] spawn OL_ha_flag_raise;


//****************************************
//         EVENT HANDLERS
//****************************************
OL_eh_enemy_arty = compile preprocessFileLineNumbers "Scripts\Eventhandlers\Enemy\eh_enemy_arty.sqf";
OL_eh_enemy_arty_killed = compile preprocessFileLineNumbers "Scripts\Eventhandlers\Enemy\eh_enemy_arty_killed.sqf";
OL_eh_enemy_sector = compile preprocessFileLineNumbers "Scripts\Eventhandlers\Enemy\eh_enemy_sector.sqf";
OL_eh_enemy_veh_patrol = compile preprocessFileLineNumbers "Scripts\Eventhandlers\Enemy\eh_enemy_veh_patrol.sqf";
OL_eh_enemy_defense = compile preprocessFileLineNumbers "Scripts\Eventhandlers\Enemy\Neaville\eh_enemy_defense.sqf";


[] execVM "Scripts\Eventhandlers\Enemy\Neaville\eh_enemy_radioTower.sqf";
[] execVM "Scripts\Eventhandlers\Enemy\Neaville\eh_enemy_flak_1.sqf";
[] execVM "Scripts\Eventhandlers\Enemy\Neaville\eh_enemy_flak_2.sqf";
[] execVM "Scripts\Eventhandlers\Enemy\Neaville\eh_enemy_flak_3.sqf";



//****************************************
//         SECTORS
//****************************************
OL_sector_manager = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Spawn\1_spawn_sector_manager.sqf";
OL_sector_spawn = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Spawn\2_spawn_sector.sqf";
OL_patrol_spawn_patrol_veh_1 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Spawn\3_spawn_veh_patrol_1.sqf";
OL_patrol_spawn_patrol_veh_2 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Spawn\4_spawn_veh_patrol_2.sqf";

OL_defend_wave_start_1 = compile preprocessFileLineNumbers "Scripts\Enemy\Defend\1_wave_start.sqf";
OL_defend_wave_check_1 = compile preprocessFileLineNumbers "Scripts\Enemy\Defend\1_wave_check_loop.sqf";
OL_defend_wave_start_2 = compile preprocessFileLineNumbers "Scripts\Enemy\Defend\2_wave_start.sqf";
OL_defend_wave_check_2 = compile preprocessFileLineNumbers "Scripts\Enemy\Defend\2_wave_check_loop.sqf";
OL_defend_area_loop = compile preprocessFileLineNumbers "Scripts\Enemy\Defend\defend_area_loop.sqf";



//****************************************
//         TASKS
//****************************************
OL_tasks_defend_1 = compile preprocessFileLineNumbers "Scripts\Tasks\7_defend_task_1.sqf";
OL_tasks_defend_2 = compile preprocessFileLineNumbers "Scripts\Tasks\8_defend_task_2.sqf";




//****************************************
//         CREATE SECTORS
//****************************************
OL_create_sectors_main_1 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Create\1_create_sectors_main.sqf";
OL_create_sectors_radar_2 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Create\2_create_sectors_radar.sqf";
OL_create_sectors_aa_3 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Create\3_create_sectors_aa.sqf";
OL_create_sectors_arty_4 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Create\4_create_sectors_arty.sqf";
OL_create_sectors_mortar_5 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Create\5_create_sectors_mortar.sqf";
OL_create_sectors_mg_1_6 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Create\6_create_sectors_mg_1.sqf";
OL_create_sectors_mg_2_7 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Create\7_create_sectors_mg_2.sqf";
OL_create_sectors_mg_3_8 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Create\8_create_sectors_mg_3.sqf";
OL_create_sectors_patrol_1_9 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Create\9_create_sectors_patrol_1.sqf";
OL_create_sectors_patrol_1_10 = compile preprocessFileLineNumbers "Scripts\Enemy\Sectors\Create\10_create_sectors_patrol_2.sqf";









 




//*********************************************************************************************
//
//      MISSION VARIABLES
//
//*********************************************************************************************






//*******************************************************
//      MISSION VARIABLES		
//*******************************************************
OL_jukeBox = false;
publicVariable "OL_jukeBox";

OL_mission_started = missionProfileNamespace getVariable ["OL_mission_started",false];
publicVariable "OL_mission_started";
missionProfileNamespace setVariable ["OL_mission_started", OL_mission_started];

OL_mission_started_2 = missionProfileNamespace getVariable ["OL_mission_started_2",false];
publicVariable "OL_mission_started_2";
missionProfileNamespace setVariable ["OL_mission_started_2", OL_mission_started_2];

OL_mission_1_ended = missionProfileNamespace getVariable ["OL_mission_1_ended",false];
publicVariable "OL_mission_1_ended";
missionProfileNamespace setVariable ["OL_mission_1_ended", OL_mission_1_ended];

OL_respawn_phase = missionProfileNamespace getVariable ["OL_respawn_phase",0];
publicVariable "OL_respawn_phase";
missionProfileNamespace setVariable ["OL_respawn_phase", OL_respawn_phase];

OL_sectors_enabled = missionProfileNamespace getVariable ["OL_sectors_enabled",false];
publicVariable "OL_sectors_started";
missionProfileNamespace setVariable ["OL_sectors_enabled", OL_sectors_enabled];

OL_enemy_arty_avail = missionProfileNamespace getVariable ["OL_enemy_arty_avail",true];
publicVariable "OL_enemy_arty_avail";
missionProfileNamespace setVariable ["OL_enemy_arty_avail", OL_enemy_arty_avail];

OL_main_tasks = missionProfileNamespace getVariable ["OL_main_tasks",[]];
publicVariable "OL_main_tasks";
missionProfileNamespace setVariable ["OL_main_tasks", OL_main_tasks];

OL_mission_started_2 = missionProfileNamespace getVariable ["OL_mission_started_2",false];
publicVariable 'OL_mission_started_2';	
missionProfileNamespace setVariable ["OL_mission_started_2", OL_mission_started_2];


OL_respawn_disabled = false;
publicVariable "OL_respawn_disabled";

OL_respawn_enabled = true;
publicVariable "OL_respawn_enabled";

OL_respawn_planes = [];
publicVariable "OL_respawn_planes";

OL_respawn_planes_fly = [];
publicVariable "OL_respawn_planes_fly";

OL_planes_crash = [];
publicVariable "OL_planes_crash";


OL_saveScores = missionProfileNamespace getVariable ["OL_saveScores",[]];
publicVariable "OL_saveScores";



//*******************************************************
//      ENEMY AND SECTOR VARIABLES		
//*******************************************************
OL_sector_array = missionProfileNamespace getVariable ["OL_sector_array",[]];
publicVariable "OL_sector_array";
missionProfileNamespace setVariable ["OL_sector_array", OL_sector_array];

OL_sector_array_small = missionProfileNamespace getVariable ["OL_sector_array_small",[]];
publicVariable "OL_sector_array_small";
missionProfileNamespace setVariable ["OL_sector_array_small", OL_sector_array_small];	

_aa_Markers = allMapMarkers select { (_x select [0, (count "aa_mrkr")]) isEqualTo "aa_mrkr" ;};
OL_aa_sector_array = missionProfileNamespace getVariable ["OL_aa_sector_array",_aa_Markers];
publicVariable "OL_aa_sector_array";
missionProfileNamespace setVariable ["OL_aa_sector_array", OL_aa_sector_array];

_mortar_Markers = allMapMarkers select { (_x select [0, (count "mortar_mrkr")]) isEqualTo "mortar_mrkr" ;};
OL_mortar_sector_array = missionProfileNamespace getVariable ["OL_mortar_sector_array",_mortar_Markers];
publicVariable "OL_mortar_sector_array";
missionProfileNamespace setVariable ["OL_mortar_sector_array", OL_mortar_sector_array];

OL_arty_sector_array = missionProfileNamespace getVariable ["OL_arty_sector_array",[]];
publicVariable "OL_arty_sector_array";
missionProfileNamespace setVariable ["OL_arty_sector_array", OL_arty_sector_array];

OL_intel_array = missionProfileNamespace getVariable ["OL_intel_array",[]];
publicVariable "OL_intel_array";	
missionProfileNamespace setVariable ["OL_intel_array", OL_intel_array];

OL_enemy_flak_array = [];
publicVariable "OL_enemy_flak_array";

OL_spotlight_array = [];
publicVariable "OL_spotlight_array";

OL_arty_array = [];
publicVariable "OL_arty_array";

OL_active_sectors = [];
publicVariable "OL_active_sectors";	




//**********************************************************************
//        MISSION PARAMETERS	
//**********************************************************************
OL_sector_act_dist = "Sector_Distance" call BIS_fnc_getParamValue;
publicVariable "OL_sector_act_dist";

OL_respawn_timer = "Respawn_Timer" call BIS_fnc_getParamValue;
publicVariable "OL_respawn_timer";

_startingTickets = "Tickets_num" call BIS_fnc_getParamValue;
[missionNamespace, _startingTickets] call BIS_fnc_respawnTickets;

_debug = "Debug_setting" call BIS_fnc_getParamValue;
if ( _debug == 1 ) then { OL_debugInfo = true; } else { OL_debugInfo = false; };
publicVariable "OL_debugInfo";

_sectorInfo = "Sector_Info" call BIS_fnc_getParamValue;
if ( _sectorInfo == 1 ) then { OL_sectorInfo = true; } else { OL_sectorInfo = false; };
publicVariable "OL_sectorInfo";
	
OL_arty_dist = "Arty_dist" call BIS_fnc_getParamValue;
publicVariable "OL_arty_dist";

_timeMulitiply = "Time_multiply" call BIS_fnc_getParamValue;
setTimeMultiplier _timeMulitiply;


_skill = "enemy_skill" call BIS_fnc_getParamValue;
_aimSkill = "enemy_aim_skill" call BIS_fnc_getParamValue;		
OL_enemy_skill = (_skill / 10 );
OL_enemy_aimskill = (_aimskill / 10 );

_rallyPoints = "Param_rallyPoint" call BIS_fnc_getParamValue;
if ( _rallyPoints == 0 ) then { OL_rallyPoints = false; } else { OL_rallyPoints = true; };
publicVariable "OL_rallyPoints";

_radioRestrict = "Radio_Param" call BIS_fnc_getParamValue;
if ( _radioRestrict == 0 ) then { OL_radioRestricted = false; } else { OL_radioRestricted = true; };
publicVariable "OL_radioRestricted";

OL_maxSectors = "max_Sectors" call BIS_fnc_getParamValue;
publicVariable "OL_maxSectors";

_cutscenes = "cutscene_Param" call BIS_fnc_getParamValue;
if ( _cutscenes == 0 ) then { OL_cutscenesOn = false; } else { OL_cutscenesOn = true; };
publicVariable "OL_cutscenesOn";


OL_fortify_total = missionProfileNamespace getVariable ["OL_fortify_total",("supply_total" call BIS_fnc_getParamValue)];
publicVariable "OL_fortify_total";
missionProfileNamespace setVariable ["OL_fortify_total",OL_fortify_total];

OL_fortify_company = missionProfileNamespace getVariable ["OL_fortify_company",0];
publicVariable "OL_fortify_company";
missionProfileNamespace setVariable ["OL_fortify_company",OL_fortify_company];

OL_fortify_supplybox = missionProfileNamespace getVariable ["OL_fortify_supplybox",("supply_crate" call BIS_fnc_getParamValue)];
publicVariable "OL_fortify_supplybox";
missionProfileNamespace setVariable ["OL_fortify_supplybox", OL_fortify_supplybox];


OL_supplyDrops_avail = missionProfileNamespace getVariable ["OL_supplyDrops_avail",("supply_drop" call BIS_fnc_getParamValue)];
publicVariable "OL_supplyDrops_avail";
missionProfileNamespace setVariable ["OL_supplyDrops_avail", OL_supplyDrops_avail];
	
	
	
		
	
	
	


	
	
	

	
	






























	



//******************************************************************************************************************************
//
//                              CREATE TASKS
//
//******************************************************************************************************************************
[] execVM "Scripts\Tasks\1_create_tasks.sqf";






//****************************************
//       ADD UNITS TO ZEUS
//****************************************
 { 
  _x addCuratorEditableObjects [allUnits,true]; 
 } forEach allCurators;  

commander_zeus setCuratorCoef ["Delete", -1e10];
commander_zeus setCuratorCoef ["Destroy", -1e10];




//****************************************
//         CONVOY SCRIPT by TOVA
//****************************************

[] execVM "Functions\Misc\convoy_script.sqf";




//****************************************
//         RADIO TYPES
//****************************************
OL_radio_types = [
	"fow_b_us_radio",
	"fow_b_us_radio_scr",
	"ItemRadio",
	"TFAR_anprc148jem",
	"TFAR_anprc152",
	"TFAR_anprc154",
	"TFAR_fadak",
	"TFAR_pnr1000a",
	"TFAR_rf7800str"
];















//***************************************************************************
//
//         OBJECTS TO CARRY ARRAY
//
//***************************************************************************

OL_carry_objects = [
	"LIB_BasicAmmunitionBox_US",
	"Land_Plank_01_4m_F",
	"Land_Plank_01_8m_F",
	"Land_wx_bunker_roof01",
	"Land_ladderEP1",
	"B_supplyCrate_F", 
	"Land_BagFence_Corner_F", 
	"Land_BagFence_End_F", 
	"Land_BagFence_Long_F", 
	"Land_BagFence_Round_F", 
	"Land_BagFence_Short_F", 
	"Hedgehog", 
	"Hedgehog_EP1", 
	"Wire", 
	"Fort_RazorWire", 
	"LIB_MG42_Lafette_low_Deployed", 
	"LIB_MG42_Lafette_Deployed", 
	"LIB_MG34_Lafette_low_Deployed", 
	"LIB_MG34_Lafette_Deployed", 
	"LIB_GrWr34_g", 
	"LIB_GrWr34", 
	"fow_w_mg42_deployed_high_ger_heer", 
	"fow_w_mg42_deployed_ger_heer", 
	"fow_w_mg42_deployed_middle_ger_heer", 
	"LIB_M1919_M2", 
	"LIB_M2_60", 
	"fow_w_m1919a6_deployed_high_usa_m37", 
	"fow_w_m1919a6_deployed_usa_m37", 
	"fow_w_m1919a6_deployed_usa_m41", 
	"fow_w_m1919a6_deployed_middle_usa_m37", 
	"fow_w_m1919a6_deployed_middle_usa_m41", 
	"fow_w_m2_mortar_usa", 
	"fow_w_m2_mortar_adv_usa", 
	"fow_w_m1919_tripod_usa_m37", 
	"fow_w_m1919_tripod_usa_m41", 
	"fow_w_m1919a6_deployed_high_usa_m41"

];

publicVariable "OL_carry_objects";


OL_build_objects = [
	["Land_Plank_01_4m_F",5],
	["Land_Plank_01_8m_F",5],
	["Land_wx_bunker_roof01",5],
	["Land_ladderEP1",5],
	["Land_BagFence_Corner_F",5],
	["Land_BagFence_End_F",5],
	["Land_BagFence_Short_F",10],
	["Land_BagFence_Long_F",15],
	["Land_BagFence_Round_F",15],
	["Fort_RazorWire",20],
	["Hedgehog",20],
	["Wire",25],
	["LIB_M1919_M2",25],
	["fow_w_m1919a6_deployed_usa_m37",25],
	["fow_w_m1919a6_deployed_middle_usa_m37",25],
	["fow_w_m1919a6_deployed_high_usa_m37",25],
	["LIB_M2_60",50]

];

publicVariable "OL_build_objects";






//*******************************************************************************
//      SUPPLY BOXES
//*******************************************************************************
private _supplyBoxes = [
supplyBox_1,supplyBox_2,supplyBox_3,supplyBox_4,
supplyBox_5,supplyBox_6,supplyBox_7,supplyBox_8,
supplyBox_9,supplyBox_10,supplyBox_11,supplyBox_12,
supplyBox_13,supplyBox_14,supplyBox_15,supplyBox_16
];

{

	_x setVariable ["OL_saveObject",true];
	
	if ( missionProfileNamespace getVariable [str _x,true] ) then {
	
		[_x] spawn OL_ha_supplyBox;
		
	} else {
	
		deleteVehicle _x;
		
	};
	

} forEach _supplyBoxes;





saveMissionProfileNamespace;

//*******************************************************************************
//
//      CHECK IF LOADING GAME
//
//*******************************************************************************
if ( _newGame == 0 ) then {



	//*******************************************************************************
	//      LOAD SAVE INFO
	//*******************************************************************************	
	[] spawn OL_fnc_misc_loadsave;
	

};








//*******************************************************************************
//
//      START SECTOR MANAGER
//
//*******************************************************************************
[] spawn OL_fnc_misc_sectorManager;












