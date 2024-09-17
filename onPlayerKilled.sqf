setPlayerRespawnTime 99999999;



["Initialize", [player,[],true,true,true,true,true,true,true,false]] call BIS_fnc_EGSpectator;





sleep 2;





//*************************************************************************
//            REDUCE TICKETS AND CHECK FAIL STATUS
//*************************************************************************

_tickets = [missionNamespace,-1] call BIS_fnc_respawnTickets;

if ( _tickets <= 0 ) then {

	["noTickets", false, true, true, true] remoteExecCall ["BIS_fnc_endMission",0];

};


//*************************************************************************
//            CHECK RESPAWN PHASE
//*************************************************************************
if ( OL_respawn_phase == 0 ) exitWith {  ["Terminate", [player]] call BIS_fnc_EGSpectator; setPlayerRespawnTime 2; };



if ( OL_respawn_phase == 1 ) then {


	waitUntil { sleep 1; (OL_respawn_enabled) && (({alive _x} count OL_respawn_planes) > 0) };

	["Terminate", [player]] call BIS_fnc_EGSpectator;
	
	//*************************************************************
	//           ENABLE RESPAWN
	//*************************************************************
	setPlayerRespawnTime 2;
	

};



