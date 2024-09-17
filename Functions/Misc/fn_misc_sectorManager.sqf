/*

    [] spawn OL_fnc_misc_sectorManager;

*/


if (isServer) then {



    while {true} do {






        if ( (OL_sectors_enabled) && !(OL_mission_started_2) ) then {

            
            [] call OL_sector_manager;


        };





        sleep 5;
        
    };








};