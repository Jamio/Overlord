// [_unit] spawn XRAY_fnc_music_jukeBox;


private ["_unit","_music_base","_music_tense","_music_combat","_music_lz"];



_unit = _this select 0;








//*****************************************************************************
//                TURN OFF MUSIC
//*****************************************************************************		
if ( !(OL_jukeBox) ) exitWith {

		if ( ["isInitialized"] call BIS_fnc_jukebox ) then {
			["terminate"] call BIS_fnc_jukebox;
			playMusic "";
		};

};




//*****************************************************************************
//                CHECK IF MUSIC IS ALREADY RUNNING
//*****************************************************************************
if ( ["isInitialized"] call BIS_fnc_jukebox ) exitWith {};		
			
			
			
//*****************************************************************************
//                MUSIC ARRAYS
//*****************************************************************************			
_music_safe = [
"IFTrack03",
"IFTrack04",
"IFTrack10",
"IFTrack11",
"IF_OldTrack5",
"IF_OldTrack6",
"fow_main_theme",
"fow_ANewWorldisBorn",
"EventTrack01_F_EPB",
"EventTrack01a_F_EPB",
"EventTrack04_F_EPB",
"BackgroundTrack03_F_EPC",
"CUP_A2_Last_Men_Standing",
"CUP_A2_Debriefing",
"CUP_A2_Badlands",
"CUP_A2_Rise_Of_The_Fallen"
];


_music_stealth = [
"IFTrack03",
"IFTrack04",
"IFTrack10",
"IFTrack11",
"IF_OldTrack5",
"IF_OldTrack6",
"fow_main_theme",
"fow_ANewWorldisBorn",
"EventTrack01_F_EPB",
"EventTrack01a_F_EPB",
"EventTrack04_F_EPB",
"BackgroundTrack03_F_EPC",
"CUP_A2_Last_Men_Standing",
"CUP_A2_Debriefing",
"CUP_A2_Badlands",
"CUP_A2_Rise_Of_The_Fallen"
];

_music_combat = [
"IFTrack01",
"IFTrack05",
"IFTrack08",
"IFTrack12",
"IFTrack13",
"IF_OldTrack4",
"fow_HeroicWings",
"CUP_A2_Reinforcements",
"CUP_A2_Harvest_Red",
"CUP_A2_Large_Scale_Assault",
"CUP_A2_The_Movement",
"CUP_A2_Marauder_Song",
"CUP_A2OA_Airborne_D",
"CUP_A2OA_Arrowhead",
"CUP_A2OA_Arrowhead_D"
];











["initialize", [
	_music_stealth,  // stealth music
	_music_combat,  // combat music
	_music_safe, // safe music
	1,             // VOLUME
	5, 			   //Transition
	200,           //Radius
	1,             // Rate
	true          // No Repeat
]] call BIS_fnc_jukebox;

_unit setVariable ["XR_currentMusic","base_music"];
		










