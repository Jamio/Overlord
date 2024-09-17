//[reinf_time] execVM "Scripts\Respawn\respawn_timer.sqf";







private "_time";
_time = _this select 0;

[parseText format ["<t color='#ff0000' shadow='2' size = '.6'>Next Wave:  %1</t>", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring],-1,-.4,9,0,0] remoteExec ["BIS_fnc_dynamicText",0];



while {_time > 20 } do {
_time = _time - 10;  


sleep 10;

[parseText format ["<t color='#ff0000' shadow='2' size = '.6'>Next Wave:  %1</t>", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring],-1,-.4,9,0,0] remoteExec ["BIS_fnc_dynamicText",0]; 


};




while {_time > 0 } do {
_time = _time - 1;  


[parseText format ["<t color='#ff0000' shadow='2' size = '.6'>Next Wave:  %1</t>", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring],-1,-.4,4,0,0] remoteExec ["BIS_fnc_dynamicText",0]; 

sleep 1;


};



["<t color='#ff0000' shadow='2' size = '.6'>Reinforcements Enroute</t>",-1,-.4,4,0,0] remoteExec ["BIS_fnc_dynamicText",0]; 
