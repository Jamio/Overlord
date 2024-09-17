saveMissionProfileNamespace;

if (!hasInterface && !isServer) exitWith {};



if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
};



waitUntil { !(isNil "OL_mission_started") && !(isNull player) }; 



//*************************************************************************
//                PLAYER INIT
//*************************************************************************
[] spawn OL_fnc_player_init;




