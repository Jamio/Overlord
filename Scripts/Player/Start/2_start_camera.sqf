


sleep 5;


//***********************************************************************************
//         DISPLAY TIME and PLACE FOR PLAYERS
//***********************************************************************************

[parseText format ["<t font='PuristaBold' size='3'>June 5, 1944</t><br /><t font='PuristaBold' size='2'>Royal Airforce Station Upottery</t><br /><t font='PuristaBold' size='1'>East Devon, England  (185 miles from Normandy)</t>"], [-0.2,1,1,1], [10,10], 10, 0.7, 0] spawn BIS_fnc_textTiles;



sleep 3;


[] execVM "Scripts\Hints\player_hints.sqf";