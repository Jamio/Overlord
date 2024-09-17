// [] execVM "test.sqf";

_group0 = createGroup [independent, true];

_object0 = createVehicle ["Land_Sack_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object0 setVectorDirAndUp [[0.788879,0.614462,0.0102539],[-0.0361787,0.0297789,0.998902]];
_object0 setPosASL [2270.85,2564.72,49.1504];


_object1 = createVehicle ["Land_Pallet_vertical_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object1 setVectorDirAndUp [[-0.164307,-0.986129,0.0234985],[-0.0351358,0.0296581,0.998942]];
_object1 setPosASL [2269.97,2561.89,49.2037];


_object2 = createVehicle ["Land_Garbage_square5_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object2 setVectorDirAndUp [[0.992554,-0.11584,0.0376587],[-0.0344218,0.0298179,0.998962]];
_object2 setPosASL [2268.65,2565.94,49.0397];


_object3 = createVehicle ["Land_Pallets_stack_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object3 setVectorDirAndUp [[-0.122864,-0.992105,0.0251465],[-0.0360875,0.029788,0.998905]];
_object3 setPosASL [2270.66,2562.69,49.204];


_object4 = createVehicle ["Fort_Crate_wood", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object4 setVectorDirAndUp [[-0.601318,-0.799007,0.00201416],[-0.0361988,0.0297606,0.998901]];
_object4 setPosASL [2271.45,2565.4,49.1519];


_object5 = createVehicle ["Land_fortified_nest_small_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object5 setVectorDirAndUp [[0.992676,-0.114789,0.0376587],[-0.0344577,0.029744,0.998964]];
_object5 setPosASL [2264.07,2569.23,48.7453];


_object6 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object6 setVectorDirAndUp [[0.785706,0.618437,0.0142212],[-0.0342307,0.020512,0.999204]];
_object6 setPosASL [2261.93,2572.55,48.6256];


_object7 = createVehicle ["Land_BagFence_Long_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object7 setVectorDirAndUp [[0.116333,0.993069,-0.0167236],[-0.03428,0.0208425,0.999195]];
_object7 setPosASL [2263,2573.88,48.64];


_object8 = createVehicle ["Land_BagFence_Long_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object8 setVectorDirAndUp [[0.992126,-0.114698,0.050293],[-0.0492207,0.0121633,0.998714]];
_object8 setPosASL [2264.17,2565.22,48.8955];


_object9 = createVehicle ["Land_BagFence_Long_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object9 setVectorDirAndUp [[0.992859,-0.108203,0.0502319],[-0.0491757,0.0124097,0.998713]];
_object9 setPosASL [2263.81,2561.93,48.9282];


_object10 = createVehicle ["LIB_MG42_Lafette_Deployed", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object10 setVectorDirAndUp [[-0.996338,0.0772349,-0.0366821],[-0.0344729,0.0297462,0.998963]];
_object10 setPosASL [2264.94,2569.23,48.8104];
[_object10, [], [], true] call BIS_fnc_initVehicle;

{_object10 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object10;
{_object10 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100]];
_object11 = createVehicle ["LIB_Flakvierling_38", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object11 setVectorDirAndUp [[0,0.999815,-0.0192261],[0,0.0192261,0.999815]];
_object11 setPosASL [2359.33,2538.69,50.7463];
[_object11, ["standard",1], [], true] call BIS_fnc_initVehicle;

{_object11 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object11;
{_object11 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38_APHE_T",[0],80],["LIB_80x_SprGr_FlaK_38_APHE_T",[0],80]];
_object12 = createVehicle ["Land_fort_artillery_nest_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object12 setVectorDirAndUp [[0,0.999815,-0.0192261],[0,0.0192261,0.999815]];
_object12 setPosASL [2359.21,2537.95,50.6753];


_object13 = createVehicle ["LIB_FlaK_38", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object13 setVectorDirAndUp [[0.00134277,0.999999,0],[0,0,1]];
_object13 setPosASL [2397.8,2412.74,48.8683];
[_object13, ["standard",1], ["Hide_Shield",0,"Hide_Shield_Small",0,"Hide_Shield_Sight",0], true] call BIS_fnc_initVehicle;

{_object13 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object13;
{_object13 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20]];
_object14 = createVehicle ["Land_fort_artillery_nest_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object14 setVectorDirAndUp [[0.000671387,0.999229,0.0392456],[0.0168458,-0.0392513,0.999087]];
_object14 setPosASL [2397.45,2413.58,49.0393];


_object15 = createVehicle ["LIB_FlaK_38", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object15 setVectorDirAndUp [[0.00158691,0.99903,0.0440063],[0.03363,-0.0440348,0.998464]];
_object15 setPosASL [2457.81,2428.72,46.912];
[_object15, ["standard",1], ["Hide_Shield",0,"Hide_Shield_Small",0,"Hide_Shield_Sight",0], true] call BIS_fnc_initVehicle;

{_object15 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object15;
{_object15 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20],["LIB_20x_SprGr_FlaK_38_APHE_T",[0],20]];
_object16 = createVehicle ["Land_fort_artillery_nest_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object16 setVectorDirAndUp [[0.00140381,0.999099,0.0424194],[0.0336303,-0.0424427,0.998533]];
_object16 setPosASL [2457.81,2430.53,47.1338];


_object17 = createVehicle ["Land_Pallet_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object17 setVectorDirAndUp [[0.958618,0.220327,-0.180298],[0.182416,0.0108664,0.983161]];
_object17 setPosASL [2470.06,2508.44,47.2891];


_object18 = createVehicle ["Wire", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object18 setVectorDirAndUp [[0.977539,-0.209887,-0.019104],[0.0153863,-0.0193315,0.999695]];
_object18 setPosASL [2464.71,2630.73,46.8721];


_object19 = createVehicle ["Land_fortified_nest_small_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object19 setVectorDirAndUp [[-0.999756,-0.0220957,0],[0,0,1]];
_object19 setPosASL [2457.81,2634.84,47.101];


_object20 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object20 setVectorDirAndUp [[-0.997864,-0.0517156,0.039917],[0.0399705,-3.77796e-007,0.999201]];
_object20 setPosASL [2455.2,2628.54,47.0981];


_object21 = createVehicle ["fow_w_mg42_deployed_high_ger_heer", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object21 setVectorDirAndUp [[0.998657,-0.040706,-0.0320435],[0.0312896,-0.0190233,0.999329]];
_object21 setPosASL [2458.36,2635.06,47.0875];
[_object21, [], [], true] call BIS_fnc_initVehicle;

{_object21 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object21;
{_object21 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["fow_50Rnd_792x57",[0],0],["fow_50Rnd_792x57",[0],27],["fow_50Rnd_792x57",[0],50],["fow_50Rnd_792x57",[0],50],["fow_50Rnd_792x57",[0],50],["fow_50Rnd_792x57",[0],50],["fow_50Rnd_792x57",[0],50],["fow_50Rnd_792x57",[0],50]];
_object22 = createVehicle ["Wire", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object22 setVectorDirAndUp [[0.951843,0.306584,-0.000854492],[0.0103891,-0.0294691,0.999512]];
_object22 setPosASL [2464.72,2641.11,47.1106];


_object23 = createVehicle ["Land_I44_Buildings_Barbedwire2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object23 setVectorDirAndUp [[-0.606873,-0.794215,0.0304565],[0.0602627,-0.0077706,0.998152]];
_object23 setPosASL [2495.49,2406.73,44.3877];


_object24 = createVehicle ["Land_BarGate_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object24 setVectorDirAndUp [[0.00128174,0.999784,0.020752],[0.0624408,-0.0207915,0.997832]];
_object24 setPosASL [2510.76,2405.8,42.8354];


_object25 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object25 setVectorDirAndUp [[0.714905,0.696638,-0.0600586],[0.0911913,-0.00773215,0.995803]];
_object25 setPosASL [2500.63,2401.06,44.0383];


_object26 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object26 setVectorDirAndUp [[-0.689453,0.720921,0.0701904],[0.0920328,-0.00892943,0.995716]];
_object26 setPosASL [2503.39,2401.02,43.7403];


_object27 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object27 setVectorDirAndUp [[-0.684326,0.728896,0.0202026],[0.0414672,0.0112405,0.999077]];
_object27 setPosASL [2517.86,2401.15,42.7938];


_object28 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object28 setVectorDirAndUp [[0.706726,0.70651,-0.0371704],[0.041993,0.0105561,0.999062]];
_object28 setPosASL [2515.1,2401.2,42.9255];


_object29 = createVehicle ["Land_BagFence_Long_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object29 setVectorDirAndUp [[-0.999756,0.016039,0.0151978],[0.0149368,-0.0162658,0.999756]];
_object29 setPosASL [2518.64,2403.63,42.7989];


_object30 = createVehicle ["Land_BagFence_Long_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object30 setVectorDirAndUp [[-0.995605,0.0159123,0.0922852],[0.0922226,-0.00462578,0.995728]];
_object30 setPosASL [2504.18,2403.49,43.7111];


_object31 = createVehicle ["Land_BagFence_Long_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object31 setVectorDirAndUp [[-0.999023,0.0159636,0.0411987],[0.0413747,0.0108527,0.999085]];
_object31 setPosASL [2514.53,2403.84,42.9076];


_object32 = createVehicle ["Land_BagFence_Long_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object32 setVectorDirAndUp [[-0.995605,0.0159123,0.0922852],[0.0922226,-0.00462578,0.995728]];
_object32 setPosASL [2500.06,2403.69,44.0946];


_object33 = createVehicle ["Land_BagFence_End_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object33 setVectorDirAndUp [[0.0157471,0.999849,0.00738525],[0.0920679,-0.00880473,0.995714]];
_object33 setPosASL [2502.13,2400.41,43.8201];


_object34 = createVehicle ["Land_BagFence_End_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object34 setVectorDirAndUp [[0.0175781,0.999775,-0.0119019],[0.0413873,0.0111659,0.999081]];
_object34 setPosASL [2516.6,2400.55,42.8353];


_object35 = createVehicle ["LIB_MG34_Lafette_Deployed", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object35 setVectorDirAndUp [[-0.19812,-0.97999,0.019165],[0.0415484,0.0111386,0.999074]];
_object35 setPosASL [2516.4,2402.08,42.8487];
[_object35, [], [], true] call BIS_fnc_initVehicle;

{_object35 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object35;
{_object35 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100]];
_object36 = createVehicle ["LIB_MG42_Lafette_Deployed", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object36 setVectorDirAndUp [[0.0968628,-0.995139,-0.0177612],[0.0923604,-0.00878102,0.995687]];
_object36 setPosASL [2501.95,2401.66,43.8962];
[_object36, [], [], true] call BIS_fnc_initVehicle;

{_object36 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object36;
{_object36 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100]];
_object37 = createVehicle ["LIB_Flakvierling_38", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object37 setVectorDirAndUp [[0.00335693,0.99902,0.0441284],[0.0759259,-0.0442559,0.996131]];
_object37 setPosASL [2499.21,2488.92,44.2139];
[_object37, ["standard",1], [], true] call BIS_fnc_initVehicle;

{_object37 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object37;
{_object37 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38_APHE_T",[0],80],["LIB_80x_SprGr_FlaK_38_APHE_T",[0],80]];
_object38 = createVehicle ["Land_fort_artillery_nest_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object38 setVectorDirAndUp [[0.00335693,0.99902,0.0441284],[0.0759259,-0.0442559,0.996131]];
_object38 setPosASL [2498.39,2488.92,44.4262];


_object39 = createVehicle ["Land_fort_artillery_nest", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object39 setVectorDirAndUp [[0.000366211,0.999961,0.00878906],[0.0448605,-0.00879664,0.998955]];
_object39 setPosASL [2554.77,2336.91,39.7242];


_object40 = createVehicle ["LIB_Flakvierling_38", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object40 setVectorDirAndUp [[0.000366211,0.999961,0.00878906],[0.0448605,-0.00879664,0.998955]];
_object40 setPosASL [2555.02,2336.89,39.6781];
[_object40, ["standard",1], [], true] call BIS_fnc_initVehicle;

{_object40 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object40;
{_object40 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38_APHE_T",[0],80],["LIB_80x_SprGr_FlaK_38_APHE_T",[0],80]];
_object41 = createVehicle ["Land_fow_wreck_willys", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object41 setVectorDirAndUp [[-0.000854492,0.998979,0.045166],[-0.0194704,-0.0451741,0.998789]];
_object41 setPosASL [2559.4,2558.01,43.2502];


_object42 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object42 setVectorDirAndUp [[0.705933,-0.697659,-0.122192],[0.0481553,-0.124845,0.991007]];
_object42 setPosASL [2557.36,2588.67,44.242];


_object43 = createVehicle ["Land_BagFence_Long_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object43 setVectorDirAndUp [[0.999451,0.00529847,-0.0327148],[0.033066,-0.0929917,0.995118]];
_object43 setPosASL [2556.61,2586.17,44.025];


_object44 = createVehicle ["Land_BagFence_Long_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object44 setVectorDirAndUp [[1,0,0],[0,0,1]];
_object44 setPosASL [2559.63,2587.95,44.1014];


_object45 = createVehicle ["Land_BagFence_End_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object45 setVectorDirAndUp [[-0.00177002,-0.998565,-0.0535278],[0.0328972,-0.0535571,0.998023]];
_object45 setPosASL [2558.61,2589.3,44.2227];


_object46 = createVehicle ["land_fow_fortified_nest_small", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object46 setVectorDirAndUp [[-0.719666,-0.694321,0],[0,0,1]];
_object46 setPosASL [2550.79,2599.59,45.1499];


_object47 = createVehicle ["LIB_MG42_Lafette_Deployed", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object47 setVectorDirAndUp [[0.699219,0.714195,0.0319214],[0.0280329,-0.0720071,0.99701]];
_object47 setPosASL [2551.29,2599.91,45.1588];
[_object47, [], [], true] call BIS_fnc_initVehicle;

{_object47 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object47;
{_object47 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_100Rnd_792x57",[0],88],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100]];
_object48 = createVehicle ["fow_w_mg42_deployed_high_ger_heer", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object48 setVectorDirAndUp [[0.00177002,0.998562,0.0535889],[0.0328361,-0.0536181,0.998021]];
_object48 setPosASL [2558.13,2589.29,44.2222];
[_object48, [], [], true] call BIS_fnc_initVehicle;

{_object48 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object48;
{_object48 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["fow_50Rnd_792x57",[0],11],["fow_50Rnd_792x57",[0],50],["fow_50Rnd_792x57",[0],50],["fow_50Rnd_792x57",[0],50],["fow_50Rnd_792x57",[0],50],["fow_50Rnd_792x57",[0],50],["fow_50Rnd_792x57",[0],50],["fow_50Rnd_792x57",[0],50]];
_object49 = createVehicle ["Fort_RazorWire", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object49 setVectorDirAndUp [[6.10352e-005,0.998918,0.0465088],[0.000793478,-0.0465088,0.998918]];
_object49 setPosASL [2532.52,2618.47,46.2945];


_object50 = createVehicle ["Fort_RazorWire", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object50 setVectorDirAndUp [[6.10352e-005,0.998918,0.0465088],[0.000793478,-0.0465088,0.998918]];
_object50 setPosASL [2537.73,2619.25,46.3247];


_object51 = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object51 setVectorDirAndUp [[0.000305176,0.999459,0.0328979],[0.00878934,-0.0328994,0.99942]];
_object51 setPosASL [2545.71,2621.3,46.3854];


_object52 = createVehicle ["Land_PaperBox_closed_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object52 setVectorDirAndUp [[-0.86615,-0.499549,-0.0153198],[0.000362443,-0.0312807,0.999511]];
_object52 setPosASL [2522.63,2622.39,46.448];


_object53 = createVehicle ["Land_BagBunker_Small_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object53 setVectorDirAndUp [[-0.00115967,-0.998845,-0.0480347],[0.0240483,-0.0480487,0.998555]];
_object53 setPosASL [2550.36,2618.14,46.2];


_object54 = createVehicle ["Land_BagBunker_Small_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object54 setVectorDirAndUp [[-6.10352e-005,-0.999029,-0.0440674],[0.000793464,-0.0440674,0.999028]];
_object54 setPosASL [2526.21,2618.77,46.34];


_object55 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object55 setVectorDirAndUp [[-1,0,0.000793457],[0.000792682,-0.044176,0.999023]];
_object55 setPosASL [2524.46,2616.42,46.2114];


_object56 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object56 setVectorDirAndUp [[-0.999939,-0.00379597,0.010376],[0.0105429,-0.0469729,0.998841]];
_object56 setPosASL [2549.59,2610.04,45.7936];


_object57 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object57 setVectorDirAndUp [[-0.999695,-0.00590466,0.0239868],[0.0242447,-0.0483774,0.998535]];
_object57 setPosASL [2552.09,2615.92,46.0218];
_object57 setDamage 0.011811;


_object58 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object58 setVectorDirAndUp [[-0.999939,-0.00379597,0.010376],[0.0105429,-0.0469729,0.998841]];
_object58 setPosASL [2542.96,2615.79,46.1303];


_object59 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object59 setVectorDirAndUp [[-0.999939,-0.00669498,0.00878906],[0.00910394,-0.0485508,0.998779]];
_object59 setPosASL [2542.96,2618.67,46.2667];


_object60 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object60 setVectorDirAndUp [[6.10352e-005,0.999029,0.0440674],[0.000793464,-0.0440674,0.999028]];
_object60 setPosASL [2525.71,2613.42,46.05];


_object61 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object61 setVectorDirAndUp [[-0.999695,-0.00590466,0.0239868],[0.0242447,-0.0483774,0.998535]];
_object61 setPosASL [2550.84,2613.04,45.8885];


_object62 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object62 setVectorDirAndUp [[0,0.999992,0.00402832],[-0.000793463,-0.00402832,0.999992]];
_object62 setPosASL [2555.27,2705.29,48.5885];


_object63 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object63 setVectorDirAndUp [[0,0.999992,0.00402832],[-0.000793463,-0.00402832,0.999992]];
_object63 setPosASL [2555.26,2706.07,48.5917];


_object64 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object64 setVectorDirAndUp [[-0.000671387,0.999511,0.03125],[-0.0216677,-0.0312572,0.999276]];
_object64 setPosASL [2554.56,2748.87,49.405];


_object65 = createVehicle ["WW2_US_Airborne_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object65 setVectorDirAndUp [[-0.000671387,1,0],[0,0,1]];
_object65 setPosASL [2554.5,2748.15,49.3806];


_object66 = createVehicle ["Land_Fort_Bagfence_Bunker", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object66 setVectorDirAndUp [[0.000183105,0.999711,0.0240479],[0.00781239,-0.0240486,0.99968]];
_object66 setPosASL [2597.69,2490.76,41.0453];


_object67 = createVehicle ["Land_CncBarrier_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object67 setVectorDirAndUp [[0.997864,-0.0568962,-0.0321045],[0.0296235,-0.0439255,0.998596]];
_object67 setPosASL [2577.01,2589.49,43.6087];


_object68 = createVehicle ["Barrel4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object68 setVectorDirAndUp [[-0.49939,0.864646,0.0547485],[0.0244726,-0.0490892,0.998495]];
_object68 setPosASL [2575.08,2584.46,43.4423];


_object69 = createVehicle ["Barrel4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object69 setVectorDirAndUp [[0.965698,0.259419,-0.0113525],[0.0249695,-0.0492555,0.998474]];
_object69 setPosASL [2575.36,2583.79,43.4027];


_object70 = createVehicle ["Land_BarGate_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object70 setVectorDirAndUp [[0.00177002,0.998806,0.0488281],[0.0360103,-0.0488602,0.998156]];
_object70 setPosASL [2566.24,2582.62,43.5036];
_object70 setDamage 0.019685;


_object71 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object71 setVectorDirAndUp [[-0.707703,-0.705843,-0.0307007],[0.0455111,-0.0889086,0.995]];
_object71 setPosASL [2560.11,2588.67,44.2129];


_object72 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object72 setVectorDirAndUp [[-0.707458,-0.706461,-0.0203857],[0.0437974,-0.0726115,0.996398]];
_object72 setPosASL [2574.61,2589.05,43.7337];


_object73 = createVehicle ["Land_BagFence_Round_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object73 setVectorDirAndUp [[0.706177,-0.699933,-0.106812],[0.0433892,-0.107793,0.993226]];
_object73 setPosASL [2571.86,2589.05,43.7666];


_object74 = createVehicle ["Land_BagFence_Long_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object74 setVectorDirAndUp [[0.999694,0,-0.0247192],[0.0246302,-0.0847892,0.996094]];
_object74 setPosASL [2571.1,2586.55,43.569];


_object75 = createVehicle ["Land_BagFence_Long_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object75 setVectorDirAndUp [[0.999564,0,-0.0295407],[0.0294545,-0.0763774,0.996644]];
_object75 setPosASL [2575.22,2586.42,43.4595];


_object76 = createVehicle ["Land_BagFence_End_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object76 setVectorDirAndUp [[-0.00128174,-0.99903,-0.0440063],[0.0296629,-0.044025,0.99859]];
_object76 setPosASL [2573.1,2589.68,43.7453];


_object77 = createVehicle ["fow_w_mg42_deployed_s_ger_heer", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object77 setVectorDirAndUp [[0.00134277,0.998806,0.0488281],[0.0360104,-0.0488448,0.998157]];
_object77 setPosASL [2569.67,2587.49,43.7267];
_object77 setDamage 0.110236;
[_object77, [], [], true] call BIS_fnc_initVehicle;

{_object77 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object77;
{_object77 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["fow_250Rnd_792x57",[0],18],["fow_250Rnd_792x57",[0],250],["fow_250Rnd_792x57",[0],250],["fow_250Rnd_792x57",[0],250],["fow_250Rnd_792x57",[0],250],["fow_250Rnd_792x57",[0],250],["fow_250Rnd_792x57",[0],250],["fow_250Rnd_792x57",[0],250]];
_object78 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object78 setVectorDirAndUp [[0.00213623,0.999066,0.0431519],[0.0488285,-0.0432047,0.997872]];
_object78 setPosASL [2588.76,2641.1,45.4141];


_object79 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object79 setVectorDirAndUp [[0.00213623,0.999066,0.0431519],[0.0488285,-0.0432047,0.997872]];
_object79 setPosASL [2588.78,2641.13,45.4149];


_object80 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object80 setVectorDirAndUp [[0.00231934,0.998846,0.0479736],[0.0480351,-0.0480297,0.99769]];
_object80 setPosASL [2589.62,2653.08,45.906];


_object81 = createVehicle ["WW2_US_Infantry_Dead_4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object81 setVectorDirAndUp [[0.00231934,0.998846,0.0479736],[0.0480351,-0.0480297,0.99769]];
_object81 setPosASL [2589.49,2652.91,45.9039];


_object82 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object82 setVectorDirAndUp [[0,0.999432,0.0336914],[-0.000305176,-0.0336914,0.999432]];
_object82 setPosASL [2572.12,2687.45,48.2855];


_object83 = createVehicle ["WW2_US_Infantry_Dead_4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object83 setVectorDirAndUp [[0,0.999432,0.0336914],[-0.000305176,-0.0336914,0.999432]];
_object83 setPosASL [2572.11,2687.47,48.2859];


_object84 = createVehicle ["MedicalGarbage_01_1x1_v3_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object84 setVectorDirAndUp [[0,1,0],[0,0,1]];
_object84 setPosASL [2583.59,2985.91,49.0681];


_object85 = createVehicle ["LIB_CG4_WACO_WingLeft", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object85 setVectorDirAndUp [[-0.996155,0.075435,-0.0445557],[-0.0446829,4.68727e-007,0.999001]];
_object85 setPosASL [2595.8,2985.67,49.3309];


_object86 = createVehicle ["LIB_CG4_WACO_Wreck", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object86 setVectorDirAndUp [[-0.963989,-0.112385,-0.241028],[-0.251201,0.0872541,0.963994]];
_object86 setPosASL [2586.06,2997.7,50.3528];


_object87 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object87 setVectorDirAndUp [[0,1,-0.000305176],[-0.000183105,0.000305176,1]];
_object87 setPosASL [2583.77,2987.12,49.0676];


_object88 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object88 setVectorDirAndUp [[0,0.999988,0.00482178],[-0.000610359,-0.00482178,0.999988]];
_object88 setPosASL [2579.3,2999.74,49.1123];


_object89 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object89 setVectorDirAndUp [[0,1,-0.000305176],[-0.000183105,0.000305176,1]];
_object89 setPosASL [2581.67,2989.41,49.0664];


_object90 = createVehicle ["Land_fow_corpse_burned3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object90 setVectorDirAndUp [[0,0.999988,0.00482178],[-0.000183108,-0.00482178,0.999988]];
_object90 setPosASL [2585.32,2992.79,49.0801];


_object91 = createVehicle ["Land_fow_corpse_burned1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object91 setVectorDirAndUp [[0,0.999988,0.00482178],[-0.000610359,-0.00482178,0.999988]];
_object91 setPosASL [2579.88,2992.67,49.0789];


_object92 = createVehicle ["WW2_US_Infantry_Dead_4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object92 setVectorDirAndUp [[0,0.999988,0.00482178],[-0.000610359,-0.00482178,0.999988]];
_object92 setPosASL [2579.22,2999.82,49.1126];


_object93 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object93 setVectorDirAndUp [[0,1,-0.000305176],[-0.000183105,0.000305176,1]];
_object93 setPosASL [2583.62,2987.36,49.0675];


_object94 = createVehicle ["Land_IntravenBag_01_empty_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object94 setVectorDirAndUp [[6.10352e-005,0.999996,0.00292969],[0.000182927,-0.0029297,0.999996]];
_object94 setPosASL [2582.7,2986.8,49.0681];


_object95 = createVehicle ["Land_fow_corpse_burned5", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object95 setVectorDirAndUp [[0,0.999934,0.0114746],[-0.000671387,-0.0114746,0.999934]];
_object95 setPosASL [2584.22,3000.42,49.1217];


_object96 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object96 setVectorDirAndUp [[0,0.999934,0.0114746],[-0.000671387,-0.0114746,0.999934]];
_object96 setPosASL [2582.88,3002.26,49.1418];


_object97 = createVehicle ["LIB_CG4_WACO_WingLeft", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object97 setVectorDirAndUp [[0.999084,0.0427148,0.00238037],[-0.00143942,-0.022046,0.999756]];
_object97 setPosASL [2585.98,3010.86,49.3107];


_object98 = createVehicle ["BloodTrail_01_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object98 setVectorDirAndUp [[0,0.999934,0.0114746],[-0.000671387,-0.0114746,0.999934]];
_object98 setPosASL [2582.79,3004.16,49.1635];


_object99 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object99 setVectorDirAndUp [[0,0.999934,0.0114746],[-0.000671387,-0.0114746,0.999934]];
_object99 setPosASL [2582.79,3002.35,49.1428];


_object100 = createVehicle ["WW2_Cow_Dead2_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object100 setVectorDirAndUp [[-6.10352e-005,0.998384,-0.0568237],[0.00146481,0.0568238,0.998383]];
_object100 setPosASL [2587.42,3358.21,59.1973];


_object101 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object101 setVectorDirAndUp [[0.00439453,0.997989,-0.0632324],[-0.069399,0.0633849,0.995573]];
_object101 setPosASL [2578.63,3389.74,57.3134];


_object102 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object102 setVectorDirAndUp [[0.000915527,0.997714,-0.0675659],[-0.0136719,0.0675721,0.997621]];
_object102 setPosASL [2590.82,3376.33,57.8392];


_object103 = createVehicle ["BloodTrail_01_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object103 setVectorDirAndUp [[-0.00305176,0.997719,-0.0674439],[0.0448611,0.0675129,0.996709]];
_object103 setPosASL [2583.11,3377.66,58.048];


_object104 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object104 setVectorDirAndUp [[-0.00305176,0.997719,-0.0674439],[0.0448611,0.0675129,0.996709]];
_object104 setPosASL [2583.03,3379.35,57.9366];


_object105 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object105 setVectorDirAndUp [[0.00439453,0.997989,-0.0632324],[-0.069399,0.0633849,0.995573]];
_object105 setPosASL [2578.42,3389.87,57.291];


_object106 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object106 setVectorDirAndUp [[0.000915527,0.997714,-0.0675659],[-0.0136719,0.0675721,0.997621]];
_object106 setPosASL [2592.13,3374.34,57.9919];


_object107 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object107 setVectorDirAndUp [[0.000915527,1,0],[0,0,1]];
_object107 setPosASL [2592.74,3373.54,58.0547];


_object108 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object108 setVectorDirAndUp [[0.000915527,0.997714,-0.0675659],[-0.0136719,0.0675721,0.997621]];
_object108 setPosASL [2590.67,3376.4,57.8324];


_object109 = createVehicle ["WW2_US_Airborne_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object109 setVectorDirAndUp [[0.591614,0.804882,-0.0464478],[-0.013657,0.0676084,0.997619]];
_object109 setPosASL [2592.49,3374.15,59.3598];


_object110 = createVehicle ["WW2_US_Infantry_Dead_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object110 setVectorDirAndUp [[-0.00305176,0.997719,-0.0674439],[0.0448611,0.0675129,0.996709]];
_object110 setPosASL [2583.14,3379.43,57.9265];


_object111 = createVehicle ["WW2_Cow_Dead2_6", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object111 setVectorDirAndUp [[-0.000488281,0.999463,-0.0327759],[0.0140987,0.0327795,0.999363]];
_object111 setPosASL [2584.56,3387.55,57.4077];


_object112 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object112 setVectorDirAndUp [[0.999974,0,-0.00720196],[0.00720171,0.0083794,0.999939]];
_object112 setPosASL [2636.96,2348.18,37.4762];


_object113 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object113 setVectorDirAndUp [[0.999974,0,-0.00720196],[0.00720171,0.0083794,0.999939]];
_object113 setPosASL [2636.96,2345.18,37.4931];


_object114 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object114 setVectorDirAndUp [[0.707092,0.707063,-0.00909424],[0.00467685,0.00818438,0.999956]];
_object114 setPosASL [2638.08,2342.68,37.4991];


_object115 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object115 setVectorDirAndUp [[-0.999974,0,0.00720196],[0.00720196,0,0.999974]];
_object115 setPosASL [2638.33,2351.18,37.4504];


_object116 = createVehicle ["Land_fort_artillery_nest", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object116 setVectorDirAndUp [[6.10352e-005,0.99998,0.00640869],[0.00799569,-0.00640897,0.999947]];
_object116 setPosASL [2620.01,2374.26,37.6452];


_object117 = createVehicle ["Land_fort_rampart_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object117 setVectorDirAndUp [[-0.00012207,-0.99998,-0.00640869],[0.0208741,-0.00640984,0.999762]];
_object117 setPosASL [2619.96,2380.36,37.6495];


_object118 = createVehicle ["Land_CamoNetB_EAST_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object118 setVectorDirAndUp [[0.00012207,0.99998,0.00640869],[0.0208741,-0.00640984,0.999762]];
_object118 setPosASL [2619.63,2372.1,37.6179];


_object119 = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object119 setVectorDirAndUp [[0,-1,-0.000793457],[0.00799579,-0.00079343,0.999968]];
_object119 setPosASL [2624.59,2364.11,37.5541];


_object120 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object120 setVectorDirAndUp [[0.999798,0,-0.0200802],[0.0200793,-0.00921934,0.999756]];
_object120 setPosASL [2612.09,2372.86,37.7763];


_object121 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object121 setVectorDirAndUp [[0.999798,0,-0.0200802],[0.0200802,0,0.999798]];
_object121 setPosASL [2612.09,2369.86,37.7554];


_object122 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object122 setVectorDirAndUp [[0.706909,0.707173,-0.0136108],[0.0194518,-0.000201376,0.999811]];
_object122 setPosASL [2613.22,2367.36,37.7309];


_object123 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object123 setVectorDirAndUp [[0.999939,0.00362479,-0.010437],[0.0104501,-0.00362114,0.999939]];
_object123 setPosASL [2627.34,2372.86,37.5557];


_object124 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object124 setVectorDirAndUp [[0.999939,0.007625,-0.00799561],[0.00805326,-0.00756051,0.999939]];
_object124 setPosASL [2627.34,2369.86,37.5377];


_object125 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object125 setVectorDirAndUp [[0.999939,0.007625,-0.00799561],[0.00805326,-0.00756051,0.999939]];
_object125 setPosASL [2627.34,2366.86,37.5353];


_object126 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object126 setVectorDirAndUp [[-0.999798,0,0.0200802],[0.0200793,-0.00921934,0.999756]];
_object126 setPosASL [2613.47,2375.86,37.7548];


_object127 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object127 setVectorDirAndUp [[6.10352e-005,0.999992,0.00402832],[0.010437,-0.00402874,0.999937]];
_object127 setPosASL [2626.09,2375.86,37.5801];


_object128 = createVehicle ["LIB_leFH18", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object128 setVectorDirAndUp [[0.00012207,0.99998,0.00640869],[0.0208741,-0.00640984,0.999762]];
_object128 setPosASL [2619.57,2371.79,37.6168];
[_object128, ["Dunkelgelb",1], [], true] call BIS_fnc_initVehicle;

{_object128 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object128;
{_object128 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_20x_Shell_105L28_Gr39HlC_HE",[0],20],["LIB_20x_Shell_105L28_Gr38_HE",[0],20]];
_object129 = createVehicle ["Land_fort_artillery_nest", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object129 setVectorDirAndUp [[0.000732422,0.999747,0.0224609],[0.0336905,-0.0224729,0.99918]];
_object129 setPosASL [2631.85,2420.44,38.1733];


_object130 = createVehicle ["Land_fort_rampart_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object130 setVectorDirAndUp [[-0.000732422,-0.999747,-0.0224609],[0.0336905,-0.0224729,0.99918]];
_object130 setPosASL [2632.29,2428.69,38.2183];


_object131 = createVehicle ["Land_CamoNetB_EAST_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object131 setVectorDirAndUp [[0.000732422,0.999747,0.0224609],[0.0336905,-0.0224729,0.99918]];
_object131 setPosASL [2631.98,2420.4,38.0912];


_object132 = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object132 setVectorDirAndUp [[-0.000427246,-0.999918,-0.0128174],[0.0328975,-0.0128245,0.999376]];
_object132 setPosASL [2636.92,2412.44,37.8119];


_object133 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object133 setVectorDirAndUp [[0.999432,0,-0.0336908],[0.0336893,-0.00923226,0.99939]];
_object133 setPosASL [2639.67,2415.19,37.7673];


_object134 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object134 setVectorDirAndUp [[0.706848,0.707284,-0.0107422],[0.028251,-0.0130531,0.999516]];
_object134 setPosASL [2625.55,2415.69,38.2207];


_object135 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object135 setVectorDirAndUp [[0.999606,0,-0.0280754],[0.0280676,-0.0235377,0.999329]];
_object135 setPosASL [2624.42,2421.19,38.3355];


_object136 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object136 setVectorDirAndUp [[0.999432,0,-0.0336908],[0.0336893,-0.00923226,0.99939]];
_object136 setPosASL [2639.67,2418.19,37.8034];


_object137 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object137 setVectorDirAndUp [[0.999606,0,-0.0280754],[0.0280727,-0.0137132,0.999512]];
_object137 setPosASL [2624.42,2418.19,38.2844];


_object138 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object138 setVectorDirAndUp [[0.99939,0.0055803,-0.0344849],[0.0346026,-0.0225972,0.999146]];
_object138 setPosASL [2639.67,2421.19,37.8515];


_object139 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object139 setVectorDirAndUp [[0.000732422,0.999766,0.0216064],[0.0344857,-0.0216189,0.999171]];
_object139 setPosASL [2638.42,2424.19,37.952];


_object140 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object140 setVectorDirAndUp [[-0.999573,-0.00456705,0.0288696],[0.0289649,-0.0223999,0.999329]];
_object140 setPosASL [2625.8,2424.19,38.3423];


_object141 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object141 setVectorDirAndUp [[0,0.999999,0.00140381],[0.0168454,-0.00140361,0.999857]];
_object141 setPosASL [2614.7,2516.57,41.0993];


_object142 = createVehicle ["WW2_US_Airborne_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object142 setVectorDirAndUp [[-0.209229,-0.977704,-0.0178223],[0.00036087,-0.0183029,0.999833]];
_object142 setPosASL [2614.72,2516.45,55.4922];


_object143 = createVehicle ["Land_sloup_vn", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object143 setVectorDirAndUp [[0,1,0],[0,0,1]];
_object143 setPosASL [2600.46,2483.72,41];


_object144 = createVehicle ["WW2_US_Airborne_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object144 setVectorDirAndUp [[0.208557,-0.976869,-0.0472412],[0.0271178,-0.0425088,0.998728]];
_object144 setPosASL [2610.93,2600.8,46.1042];


_object145 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object145 setVectorDirAndUp [[0.00201416,0.998603,0.0527954],[0.0375965,-0.0528338,0.997895]];
_object145 setPosASL [2602.55,2651.38,45.2913];


_object146 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object146 setVectorDirAndUp [[0.00250244,0.997949,0.0639648],[0.0391841,-0.0640138,0.997179]];
_object146 setPosASL [2630.65,2656.12,44.7509];


_object147 = createVehicle ["WW2_US_Infantry_Dead_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object147 setVectorDirAndUp [[0.00201416,0.998603,0.0527954],[0.0375965,-0.0528338,0.997895]];
_object147 setPosASL [2602.51,2651.31,45.289];


_object148 = createVehicle ["WW2_US_Infantry_Dead_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object148 setVectorDirAndUp [[0.00250244,0.997949,0.0639648],[0.0391841,-0.0640138,0.997179]];
_object148 setPosASL [2630.64,2656.14,44.752];


_object149 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object149 setVectorDirAndUp [[0.000366211,0.999349,0.0360718],[0.00964329,-0.0360736,0.999303]];
_object149 setPosASL [2633.83,2728.29,48.8175];


_object150 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object150 setVectorDirAndUp [[0.000427246,0.999029,0.0440674],[0.00964374,-0.0440695,0.998982]];
_object150 setPosASL [2622.2,2734.96,49.21];


_object151 = createVehicle ["WW2_Cow_Dead2_5", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object151 setVectorDirAndUp [[0.000915527,0.999063,0.0432739],[0.0216062,-0.0432836,0.998829]];
_object151 setPosASL [2616.67,2750.8,50.0382];


_object152 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object152 setVectorDirAndUp [[0.000366211,0.999349,0.0360718],[0.00964329,-0.0360736,0.999303]];
_object152 setPosASL [2633.81,2728.75,48.8343];


_object153 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object153 setVectorDirAndUp [[0.000427246,0.999029,0.0440674],[0.00964374,-0.0440695,0.998982]];
_object153 setPosASL [2622.17,2735.46,49.2323];


_object154 = createVehicle ["WW2_Cow_Dead2_6", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object154 setVectorDirAndUp [[0.000793457,0.999629,-0.0272217],[-0.0296626,0.0272332,0.999189]];
_object154 setPosASL [2639.31,2929.41,50.914];


_object155 = createVehicle ["WW2_Cow_Dead2_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object155 setVectorDirAndUp [[6.10352e-005,0.999997,-0.00238037],[-0.0152589,0.00238103,0.999881]];
_object155 setPosASL [2621.78,3008.04,48.671];


_object156 = createVehicle ["Land_fort_artillery_nest", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object156 setVectorDirAndUp [[-6.10352e-005,0.999997,-0.00238037],[0.0152589,0.00238103,0.999881]];
_object156 setPosASL [2644.91,2350.76,37.3594];


_object157 = createVehicle ["Land_fort_rampart_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object157 setVectorDirAndUp [[6.10352e-005,-0.999997,0.00238037],[0.0152589,0.00238103,0.999881]];
_object157 setPosASL [2644.83,2355.68,37.3621];


_object158 = createVehicle ["Land_CamoNetB_EAST_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object158 setVectorDirAndUp [[-0.000183105,0.999928,-0.0120239],[0.0152587,0.0120253,0.999811]];
_object158 setPosASL [2644.48,2347.45,37.411];


_object159 = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object159 setVectorDirAndUp [[0.00012207,-0.999946,0.010437],[0.00885042,0.0104377,0.999906]];
_object159 setPosASL [2649.46,2339.43,37.4341];


_object160 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object160 setVectorDirAndUp [[0.999928,0,-0.0120238],[0.0120232,0.00997696,0.999878]];
_object160 setPosASL [2652.21,2342.18,37.3593];


_object161 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object161 setVectorDirAndUp [[0.999928,0,-0.0120238],[0.0120232,0.00997696,0.999878]];
_object161 setPosASL [2652.21,2345.18,37.3232];


_object162 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object162 setVectorDirAndUp [[0.999695,-0.00565095,-0.0240479],[0.0241702,0.0226749,0.999451]];
_object162 setPosASL [2652.21,2348.18,37.2825];


_object163 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object163 setVectorDirAndUp [[-0.000183105,0.999974,-0.00720215],[0.0240476,0.00720447,0.999685]];
_object163 setPosASL [2650.96,2351.18,37.27];


_object164 = createVehicle ["LIB_leFH18", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object164 setVectorDirAndUp [[-0.000183105,0.999928,-0.0120239],[0.0152587,0.0120253,0.999811]];
_object164 setPosASL [2644.39,2347.15,37.4114];
[_object164, ["Dunkelgelb",1], [], true] call BIS_fnc_initVehicle;

{_object164 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object164;
{_object164 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_20x_Shell_105L28_Gr39HlC_HE",[0],20],["LIB_20x_Shell_105L28_Gr38_HE",[0],20]];
_object165 = createVehicle ["Land_fort_artillery_nest", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object165 setVectorDirAndUp [[0,1,-0.000793457],[0.00885025,0.000793425,0.999961]];
_object165 setPosASL [2673.01,2370.9,36.5878];


_object166 = createVehicle ["Land_fort_rampart_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object166 setVectorDirAndUp [[0,-1,0.000793457],[0.00885025,0.000793425,0.999961]];
_object166 setPosASL [2673.58,2377.68,36.5817];


_object167 = createVehicle ["Land_CamoNetB_EAST_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object167 setVectorDirAndUp [[-6.10352e-005,0.999961,-0.0088501],[0.00884998,0.00885029,0.999922]];
_object167 setPosASL [2673.22,2369.45,36.5972];


_object168 = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object168 setVectorDirAndUp [[6.10352e-005,-0.999968,0.00799561],[0.00799558,0.00799584,0.999936]];
_object168 setPosASL [2678.21,2361.43,36.6294];


_object169 = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object169 setVectorDirAndUp [[-6.10352e-005,-0.999995,-0.00323486],[0.0112303,-0.00323534,0.999932]];
_object169 setPosASL [2674.18,2398.81,36.6116];


_object170 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object170 setVectorDirAndUp [[0.999748,0,-0.0224608],[0.0224608,0,0.999748]];
_object170 setPosASL [2665.71,2370.18,36.7144];


_object171 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object171 setVectorDirAndUp [[0.999748,0,-0.0224608],[0.0224596,0.0102829,0.999695]];
_object171 setPosASL [2665.71,2367.18,36.737];


_object172 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object172 setVectorDirAndUp [[0.706787,0.707098,-0.0215454],[0.0229512,0.00752017,0.999708]];
_object172 setPosASL [2666.84,2364.68,36.7321];


_object173 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object173 setVectorDirAndUp [[0,1,-0.000793457],[0.00885025,0.000793425,0.999961]];
_object173 setPosASL [2679.71,2373.18,36.5319];


_object174 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object174 setVectorDirAndUp [[-0.999748,0,0.0224608],[0.0224608,0,0.999748]];
_object174 setPosASL [2667.09,2373.18,36.6661];


_object175 = createVehicle ["LIB_FlaK_36_ARTY", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object175 setVectorDirAndUp [[-6.10352e-005,0.999961,-0.0088501],[0.00884998,0.00885029,0.999922]];
_object175 setPosASL [2673.13,2369.38,36.5956];
[_object175, ["standard",1], ["Hide_Shield",0,"Hide_Shield_Hatch",0], true] call BIS_fnc_initVehicle;

{_object175 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object175;
{_object175 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_45x_SprGr_KwK36_HE",[0],45]];
_object176 = createVehicle ["Land_fort_artillery_nest", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object176 setVectorDirAndUp [[0.000366211,0.99973,0.0232544],[0.0168459,-0.0232573,0.999588]];
_object176 setPosASL [2671.65,2411.64,36.8909];


_object177 = createVehicle ["Land_fort_rampart_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object177 setVectorDirAndUp [[-0.000549316,-0.99973,-0.0232544],[0.0240476,-0.0232609,0.99944]];
_object177 setPosASL [2669.56,2415.06,36.879];


_object178 = createVehicle ["Land_CamoNetB_EAST_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object178 setVectorDirAndUp [[0.000305176,0.999907,0.0136108],[0.0232545,-0.0136143,0.999637]];
_object178 setPosASL [2669.23,2406.79,36.7753];


_object179 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object179 setVectorDirAndUp [[0.99973,0,-0.0232538],[0.0232516,-0.0138387,0.999634]];
_object179 setPosASL [2661.69,2404.56,36.9222];


_object180 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object180 setVectorDirAndUp [[0.99973,0,-0.0232538],[0.0232516,-0.0138387,0.999634]];
_object180 setPosASL [2661.69,2407.56,36.9631];


_object181 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object181 setVectorDirAndUp [[0.999858,0,-0.0168454],[0.0168447,-0.00907599,0.999817]];
_object181 setPosASL [2676.94,2404.56,36.6423];


_object182 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object182 setVectorDirAndUp [[0.70697,0.707211,-0.0067749],[0.0233184,-0.0137342,0.999634]];
_object182 setPosASL [2662.81,2402.06,36.8619];


_object183 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object183 setVectorDirAndUp [[0.999858,0,-0.0168454],[0.0168447,-0.00907599,0.999817]];
_object183 setPosASL [2676.94,2407.56,36.6663];


_object184 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object184 setVectorDirAndUp [[0.999937,0,-0.0112304],[0.0112291,-0.0154928,0.999817]];
_object184 setPosASL [2676.93,2401.56,36.6097];


_object185 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object185 setVectorDirAndUp [[-0.99973,0,0.0232538],[0.0232473,-0.0236123,0.999451]];
_object185 setPosASL [2663.06,2410.55,36.9571];


_object186 = createVehicle ["Land_fort_bagfence_corner", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object186 setVectorDirAndUp [[0.00012207,0.999968,0.00799561],[0.0168458,-0.00799653,0.999826]];
_object186 setPosASL [2675.69,2410.56,36.7094];


_object187 = createVehicle ["LIB_leFH18", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object187 setVectorDirAndUp [[0.000183105,0.999907,0.0136108],[0.0112308,-0.013612,0.999844]];
_object187 setPosASL [2670.36,2407.61,36.7656];
[_object187, ["Dunkelgelb",1], [], true] call BIS_fnc_initVehicle;

{_object187 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object187;
{_object187 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_20x_Shell_105L28_Gr39HlC_HE",[0],20],["LIB_20x_Shell_105L28_Gr38_HE",[0],20]];
_object188 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object188 setVectorDirAndUp [[0.00305176,0.997952,0.0639038],[0.0479723,-0.0639766,0.996798]];
_object188 setPosASL [2655.13,2680.78,45.4462];


_object189 = createVehicle ["BloodSplatter_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object189 setVectorDirAndUp [[0.0022583,0.998808,0.0487671],[0.0456553,-0.0488193,0.997764]];
_object189 setPosASL [2660.96,2753.42,49.2];


_object190 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object190 setVectorDirAndUp [[0.00189209,0.998994,0.0447998],[0.0416268,-0.0448397,0.998127]];
_object190 setPosASL [2657.85,2742.44,48.8268];


_object191 = createVehicle ["WW2_US_Infantry_Dead_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object191 setVectorDirAndUp [[0.0022583,0.998808,0.0487671],[0.0456553,-0.0488193,0.997764]];
_object191 setPosASL [2660.78,2754.48,49.26];


_object192 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object192 setVectorDirAndUp [[0.00189209,0.998994,0.0447998],[0.0416268,-0.0448397,0.998127]];
_object192 setPosASL [2657.87,2742.95,48.8486];


_object193 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object193 setVectorDirAndUp [[0.00189209,0.999261,0.0383911],[0.0496207,-0.0384377,0.998028]];
_object193 setPosASL [2675.4,2723.66,47.2243];


_object194 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object194 setVectorDirAndUp [[0,1,0],[0,0,1]];
_object194 setPosASL [2648.87,2825.63,50.6409];


_object195 = createVehicle ["WW2_US_Airborne_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object195 setVectorDirAndUp [[0,1,0],[0,0,1]];
_object195 setPosASL [2648.97,2825.39,52.2199];


_object196 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object196 setVectorDirAndUp [[1,0,-0.000793457],[0.000793457,0,1]];
_object196 setPosASL [2680.95,2370.18,36.5286];


_object197 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object197 setVectorDirAndUp [[1,0,-0.000793457],[0.000793409,0.0110188,0.999939]];
_object197 setPosASL [2680.95,2364.18,36.5799];


_object198 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object198 setVectorDirAndUp [[1,0,-0.000793457],[0.000793409,0.0110188,0.999939]];
_object198 setPosASL [2680.95,2367.18,36.5535];


_object199 = createVehicle ["LIB_Flakvierling_38", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object199 setVectorDirAndUp [[0.000610352,1,0],[0,0,1]];
_object199 setPosASL [2684.18,2426.06,36.8524];
[_object199, ["standard",1], [], true] call BIS_fnc_initVehicle;

{_object199 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object199;
{_object199 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38",[0],80],["LIB_80x_SprGr_FlaK_38_APHE_T",[0],80],["LIB_80x_SprGr_FlaK_38_APHE_T",[0],80]];
_object200 = createVehicle ["Land_fort_artillery_nest_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object200 setVectorDirAndUp [[0.000305176,0.999871,0.0160522],[0.0208744,-0.0160551,0.999653]];
_object200 setPosASL [2683.92,2427.6,36.9117];


_object201 = createVehicle ["Land_CamoNetVar_EAST_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object201 setVectorDirAndUp [[0.444641,-0.895129,-0.0322266],[0.0207548,-0.0256729,0.999455]];
_object201 setPosASL [2683.11,2503.56,38.4068];


_object202 = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object202 setVectorDirAndUp [[0.444702,-0.895099,-0.0322266],[0.0207546,-0.0256725,0.999455]];
_object202 setPosASL [2684.52,2501.59,38.2705];


_object203 = createVehicle ["Land_fort_bagfence_round", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object203 setVectorDirAndUp [[-0.444702,0.895099,0.0322266],[0.0207546,-0.0256725,0.999455]];
_object203 setPosASL [2682.54,2506.01,38.4952];


_object204 = createVehicle ["Land_fort_bagfence_long", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object204 setVectorDirAndUp [[0.895325,0.445315,-0.00939941],[0.0225622,-0.0242664,0.999451]];
_object204 setPosASL [2686.01,2505.16,38.3649];


_object205 = createVehicle ["Land_BarGate_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object205 setVectorDirAndUp [[-0.923767,0.382955,0],[0,0,1]];
_object205 setPosASL [2683.19,2515.76,38.733];


_object206 = createVehicle ["LIB_MG42_Lafette_Deployed", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object206 setVectorDirAndUp [[0.939758,0.341669,-0.0108032],[0.0208513,-0.0257498,0.999451]];
_object206 setPosASL [2683.61,2503.38,38.37];
[_object206, [], [], true] call BIS_fnc_initVehicle;

{_object206 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object206;
{_object206 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100]];
_object207 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object207 setVectorDirAndUp [[0.00213623,0.998001,0.0631714],[0.0336303,-0.0632075,0.997434]];
_object207 setPosASL [2686.85,2683.02,44.2477];


_object208 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object208 setVectorDirAndUp [[0.00158691,0.999262,0.0383911],[0.0408331,-0.0384239,0.998427]];
_object208 setPosASL [2696.69,2716.12,45.9822];


_object209 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object209 setVectorDirAndUp [[0.00201416,0.997791,0.0664063],[0.0303959,-0.0664368,0.997328]];
_object209 setPosASL [2686.71,2683.58,44.2889];


_object210 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object210 setVectorDirAndUp [[0.00158691,0.999262,0.0383911],[0.0408331,-0.0384239,0.998427]];
_object210 setPosASL [2696.57,2716.71,46.0095];


_object211 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object211 setVectorDirAndUp [[0.000671387,0.99965,0.0264282],[0.0248416,-0.0264367,0.999342]];
_object211 setPosASL [2713.43,2834.67,50.2702];


_object212 = createVehicle ["WW2_US_Infantry_Dead_4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object212 setVectorDirAndUp [[0.000671387,0.99965,0.0264282],[0.0248416,-0.0264367,0.999342]];
_object212 setPosASL [2713.5,2834.69,50.2687];


_object213 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object213 setVectorDirAndUp [[0.00012207,0.999628,0.0272827],[0.0048217,-0.027283,0.999616]];
_object213 setPosASL [2709.49,2869.66,51.1476];


_object214 = createVehicle ["WW2_US_Infantry_Dead_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object214 setVectorDirAndUp [[0.00012207,0.999628,0.0272827],[0.0048217,-0.027283,0.999616]];
_object214 setPosASL [2709.45,2869.55,51.1448];


_object215 = createVehicle ["Land_fow_wreck_willys", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object215 setVectorDirAndUp [[0.0497437,0.998099,0.036377],[-0.0224907,-0.0352934,0.999124]];
_object215 setPosASL [2717.04,3137.12,53.9546];


_object216 = createVehicle ["LIB_HORSA_WingRear", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object216 setVectorDirAndUp [[-0.0010376,0.998765,0.0496826],[-0.0208132,-0.0496935,0.998548]];
_object216 setPosASL [2717.18,3145.39,54.3377];


_object217 = createVehicle ["LIB_HORSA_Wreck", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object217 setVectorDirAndUp [[-0.000793457,0.99929,0.0376587],[-0.0208128,-0.0376671,0.999074]];
_object217 setPosASL [2716.7,3128.93,53.6285];


_object218 = createVehicle ["LIB_CG4_WACO_WingLeft", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object218 setVectorDirAndUp [[-0.000305176,0.999432,0.0336914],[-0.0087891,-0.0336928,0.999394]];
_object218 setPosASL [2700.92,3131.37,53.5273];


_object219 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object219 setVectorDirAndUp [[-0.00115967,0.998684,0.0512695],[-0.0224004,-0.0512826,0.998433]];
_object219 setPosASL [2717.62,3140.98,54.1194];


_object220 = createVehicle ["WW2_US_Infantry_Dead_4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object220 setVectorDirAndUp [[-0.00115967,0.998684,0.0512695],[-0.0224004,-0.0512826,0.998433]];
_object220 setPosASL [2717.73,3140.67,54.1059];


_object221 = createVehicle ["Land_Garbage_square5_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object221 setVectorDirAndUp [[0.999756,0.0102159,0.0195923],[-0.0193368,-0.0245345,0.999512]];
_object221 setPosASL [2756.25,2472.02,36.8369];


_object222 = createVehicle ["Land_fortified_nest_small_EP1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object222 setVectorDirAndUp [[-0.999268,-0.0325742,-0.0200806],[-0.0192841,-0.0245831,0.999512]];
_object222 setPosASL [2757.37,2472.26,36.8643];


_object223 = createVehicle ["LIB_MG42_Lafette_Deployed", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object223 setVectorDirAndUp [[0.974915,0.221884,0.0175781],[-0.0133005,-0.0207584,0.999696]];
_object223 setPosASL [2758.07,2472.4,36.8783];
[_object223, [], [], true] call BIS_fnc_initVehicle;

{_object223 removeMagazineTurret (_x select [0, 2])} forEach magazinesAllTurrets _object223;
{_object223 addMagazineTurret _x} forEach [["FakeWeapon",[-1],1],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100],["LIB_100Rnd_792x57",[0],100]];
_object224 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object224 setVectorDirAndUp [[0,0.999029,0.0440674],[0,-0.0440674,0.999029]];
_object224 setPosASL [2747.17,2659.52,42.2847];


_object225 = createVehicle ["WW2_US_Airborne_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object225 setVectorDirAndUp [[0,0.999029,0.0440674],[0,-0.0440674,0.999029]];
_object225 setPosASL [2747.7,2659.22,42.2711];


_object226 = createVehicle ["BloodPool_01_Medium_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object226 setVectorDirAndUp [[0.00164795,0.998806,0.0488281],[0.0336307,-0.0488559,0.99824]];
_object226 setPosASL [2729.81,2821.26,49.2252];


_object227 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object227 setVectorDirAndUp [[0.00164795,0.998806,0.0488281],[0.0336307,-0.0488559,0.99824]];
_object227 setPosASL [2729.86,2821.33,49.2268];


_object228 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object228 setVectorDirAndUp [[0.000976563,0.998048,0.062439],[0.0159911,-0.0624466,0.99792]];
_object228 setPosASL [2743.5,2819.76,48.8289];


_object229 = createVehicle ["WW2_US_Infantry_Dead_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object229 setVectorDirAndUp [[0.00164795,0.998806,0.0488281],[0.0336307,-0.0488559,0.99824]];
_object229 setPosASL [2729.36,2821.74,49.2635];


_object230 = createVehicle ["WW2_US_Infantry_Dead_4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object230 setVectorDirAndUp [[0.000976563,0.998048,0.062439],[0.0159911,-0.0624466,0.99792]];
_object230 setPosASL [2743.25,2819.91,48.8426];


_object231 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object231 setVectorDirAndUp [[0.000305176,0.999711,0.0240479],[0.0128173,-0.0240498,0.999629]];
_object231 setPosASL [2726.41,2858.9,50.6847];


_object232 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object232 setVectorDirAndUp [[6.10352e-005,0.999954,0.00964355],[0.0048218,-0.00964374,0.999942]];
_object232 setPosASL [2747.97,2870.28,50.6534];


_object233 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object233 setVectorDirAndUp [[0.000305176,0.999711,0.0240479],[0.0128173,-0.0240498,0.999629]];
_object233 setPosASL [2726.3,2859.78,50.7073];


_object234 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object234 setVectorDirAndUp [[6.10352e-005,0.999954,0.00964355],[0.0048218,-0.00964374,0.999942]];
_object234 setPosASL [2747.96,2871.12,50.6616];


_object235 = createVehicle ["WW2_US_Infantry_Dead_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object235 setVectorDirAndUp [[0.000244141,0.999097,0.0424805],[0.00640865,-0.0424812,0.999077]];
_object235 setPosASL [2746.34,2842.49,49.96];


_object236 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object236 setVectorDirAndUp [[-0.00012207,0.998195,0.0600586],[-0.00238042,-0.0600587,0.998192]];
_object236 setPosASL [2742,3094.51,52.0566];


_object237 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object237 setVectorDirAndUp [[-0.000366211,0.997735,0.0672607],[-0.00561511,-0.0672617,0.99772]];
_object237 setPosASL [2743.73,3105.03,52.7416];


_object238 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object238 setVectorDirAndUp [[-0.00012207,0.998195,0.0600586],[-0.00238042,-0.0600587,0.998192]];
_object238 setPosASL [2741.96,3094.87,52.0783];


_object239 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object239 setVectorDirAndUp [[-0.000366211,0.997735,0.0672607],[-0.00561511,-0.0672617,0.99772]];
_object239 setPosASL [2743.79,3105.04,52.743];


_object240 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object240 setVectorDirAndUp [[-0.000366211,0.997735,0.0672607],[-0.00561511,-0.0672617,0.99772]];
_object240 setPosASL [2745.07,3100.87,52.4693];


_object241 = createVehicle ["WW2_Cow_Dead2_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object241 setVectorDirAndUp [[-0.000183105,0.998195,0.0600586],[-0.00317389,-0.0600589,0.99819]];
_object241 setPosASL [2738.86,3098.83,52.3166];


_object242 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object242 setVectorDirAndUp [[-0.000366211,0.997735,0.0672607],[-0.00561511,-0.0672617,0.99772]];
_object242 setPosASL [2745.01,3100.9,52.4708];


_object243 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object243 setVectorDirAndUp [[-0.00115967,0.999379,0.0352173],[-0.0320443,-0.0352364,0.998865]];
_object243 setPosASL [2721.52,3132.76,53.9158];


_object244 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object244 setVectorDirAndUp [[-0.000915527,0.99929,0.0376587],[-0.0240473,-0.0376698,0.999001]];
_object244 setPosASL [2723.65,3122.75,53.5843];


_object245 = createVehicle ["LIB_CG4_WACO_WingRight", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object245 setVectorDirAndUp [[-0.00146484,0.998956,0.0456543],[-0.0320444,-0.0456778,0.998442]];
_object245 setPosASL [2725.27,3126.81,53.7929];


_object246 = createVehicle ["BloodTrail_01_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object246 setVectorDirAndUp [[-0.000915527,0.99929,0.0376587],[-0.0240473,-0.0376698,0.999001]];
_object246 setPosASL [2723.69,3123.84,53.626];


_object247 = createVehicle ["BloodPool_01_Medium_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object247 setVectorDirAndUp [[-0.00164795,0.999999,0],[0,0,1]];
_object247 setPosASL [2726.12,3137.26,54.2276];


_object248 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object248 setVectorDirAndUp [[-0.000915527,0.99929,0.0376587],[-0.0240473,-0.0376698,0.999001]];
_object248 setPosASL [2723.67,3122.84,53.5883];


_object249 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object249 setVectorDirAndUp [[-0.00115967,0.999379,0.0352173],[-0.0320443,-0.0352364,0.998865]];
_object249 setPosASL [2721.48,3132.75,53.9142];


_object250 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object250 setVectorDirAndUp [[-0.00164795,0.999999,0],[0,0,1]];
_object250 setPosASL [2726.19,3136.35,54.1967];


_object251 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object251 setVectorDirAndUp [[-0.0012207,0.999319,0.0368652],[-0.0336295,-0.0368854,0.998753]];
_object251 setPosASL [2728.42,3138.3,54.3437];


_object252 = createVehicle ["WW2_US_Infantry_Dead_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object252 setVectorDirAndUp [[-0.0012207,0.999319,0.0368652],[-0.0336295,-0.0368854,0.998753]];
_object252 setPosASL [2728.33,3138.44,54.3456];


_object253 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object253 setVectorDirAndUp [[-0.00195313,0.999998,0],[0,0,1]];
_object253 setPosASL [2726.27,3136.55,54.2064];


_object254 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object254 setVectorDirAndUp [[0.00366211,0.997176,0.0750122],[0.0487676,-0.0751015,0.995983]];
_object254 setPosASL [2781.03,2825.97,48.2007];


_object255 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object255 setVectorDirAndUp [[0.00366211,0.997176,0.0750122],[0.0487676,-0.0751015,0.995983]];
_object255 setPosASL [2780.86,2827.15,48.2983];


_object256 = createVehicle ["WW2_Cow_Dead2_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object256 setVectorDirAndUp [[0,1,0],[-0.000793457,0,1]];
_object256 setPosASL [2778.61,2957.23,51.4819];


_object257 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object257 setVectorDirAndUp [[-0.00012207,0.999968,-0.00805664],[0.0165407,0.00805756,0.999831]];
_object257 setPosASL [2789.1,3581.08,50.7646];


_object258 = createVehicle ["BloodTrail_01_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object258 setVectorDirAndUp [[-0.00012207,0.999968,-0.00805664],[0.0165407,0.00805756,0.999831]];
_object258 setPosASL [2788.53,3583.13,50.7575];


_object259 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object259 setVectorDirAndUp [[-0.000183105,0.999934,-0.0115356],[0.0150147,0.0115371,0.999821]];
_object259 setPosASL [2791,3578.61,50.7595];


_object260 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object260 setVectorDirAndUp [[-0.00012207,0.999968,-0.00805664],[0.0165407,0.00805756,0.999831]];
_object260 setPosASL [2789.03,3581.02,50.7663];


_object261 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object261 setVectorDirAndUp [[-0.00012207,0.999968,-0.00805664],[0.0165407,0.00805756,0.999831]];
_object261 setPosASL [2789.04,3582.13,50.7571];


_object262 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object262 setVectorDirAndUp [[-0.000183105,0.999934,-0.0115356],[0.0150147,0.0115371,0.999821]];
_object262 setPosASL [2794.5,3571.46,50.7894];


_object263 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object263 setVectorDirAndUp [[-0.00012207,0.999968,-0.00805664],[0.0168458,0.00805755,0.999826]];
_object263 setPosASL [2790.26,3580.25,50.7504];


_object264 = createVehicle ["WW2_US_Infantry_Dead_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object264 setVectorDirAndUp [[-0.000183105,0.999934,-0.0115356],[0.0150147,0.0115371,0.999821]];
_object264 setPosASL [2790.82,3578.74,50.7607];


_object265 = createVehicle ["WW2_US_Infantry_Dead_4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object265 setVectorDirAndUp [[-0.000183105,0.999934,-0.0115356],[0.0150147,0.0115371,0.999821]];
_object265 setPosASL [2794.32,3571.37,50.7931];


_object266 = createVehicle ["WW2_Cow_Dead2_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object266 setVectorDirAndUp [[0.000244141,0.999937,-0.0112305],[-0.0240482,0.0112331,0.999648]];
_object266 setPosASL [2810.64,3000.01,51.7154];


_object267 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object267 setVectorDirAndUp [[-0.00158691,0.999099,-0.0424194],[0.0376578,0.0424491,0.998389]];
_object267 setPosASL [2826.33,3479.46,54.0515];


_object268 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object268 setVectorDirAndUp [[-0.00158691,0.999099,-0.0424194],[0.0376578,0.0424491,0.998389]];
_object268 setPosASL [2826.35,3479.38,54.0538];


_object269 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object269 setVectorDirAndUp [[-0.0012207,0.997948,-0.0640259],[0.0192265,0.0640375,0.997762]];
_object269 setPosASL [2818.12,3487.89,53.7968];


_object270 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object270 setVectorDirAndUp [[-0.00280762,0.997577,-0.069519],[0.0399784,0.0695757,0.996775]];
_object270 setPosASL [2830.86,3491.35,53.1993];


_object271 = createVehicle ["LIB_C47_Skytrain_wreck", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object271 setVectorDirAndUp [[-0.421936,-0.903633,0.0736084],[0.0114039,0.0758932,0.997051]];
_object271 setPosASL [2811.9,3498.41,53.0939];


_object272 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object272 setVectorDirAndUp [[-0.0012207,0.997948,-0.0640259],[0.0192265,0.0640375,0.997762]];
_object272 setPosASL [2818.13,3487.66,53.8112];


_object273 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object273 setVectorDirAndUp [[-0.00292969,0.996992,-0.0774536],[0.0375369,0.077509,0.996285]];
_object273 setPosASL [2830.88,3505.85,52.1419];


_object274 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object274 setVectorDirAndUp [[-0.00280762,0.997577,-0.069519],[0.0399784,0.0695757,0.996775]];
_object274 setPosASL [2830.91,3491.41,53.1931];


_object275 = createVehicle ["CraterLong", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object275 setVectorDirAndUp [[-0.572205,-0.816712,0.074585],[0.0110549,0.0832555,0.996467]];
_object275 setPosASL [2814.05,3505.44,53.1879];


_object276 = createVehicle ["WW2_US_Infantry_Dead_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object276 setVectorDirAndUp [[-0.00292969,0.996992,-0.0774536],[0.0375369,0.077509,0.996285]];
_object276 setPosASL [2830.9,3505.83,52.1428];


_object277 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object277 setVectorDirAndUp [[-6.10352e-005,0.999765,-0.0216675],[0.00402832,0.0216675,0.999757]];
_object277 setPosASL [2806.31,3538.24,51.2552];


_object278 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object278 setVectorDirAndUp [[-6.10352e-005,0.999765,-0.0216675],[0.00402832,0.0216675,0.999757]];
_object278 setPosASL [2806.33,3538.22,51.2558];


_object279 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object279 setVectorDirAndUp [[-0.000244141,0.999955,-0.00952148],[0.0227051,0.00952457,0.999697]];
_object279 setPosASL [2805.29,3596.8,50.3291];


_object280 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object280 setVectorDirAndUp [[-0.000244141,0.999955,-0.00952148],[0.0227051,0.00952457,0.999697]];
_object280 setPosASL [2805.14,3596.62,50.3342];


_object281 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object281 setVectorDirAndUp [[6.10352e-005,0.999711,0.0240479],[0.00323489,-0.0240479,0.999706]];
_object281 setPosASL [2854.32,2995.69,51.7508];


_object282 = createVehicle ["WW2_Cow_Dead1_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object282 setVectorDirAndUp [[6.10352e-005,0.999992,0.00402832],[0.0120236,-0.00402876,0.99992]];
_object282 setPosASL [2854.26,2970.79,51.5092];


_object283 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object283 setVectorDirAndUp [[6.10352e-005,0.999711,0.0240479],[0.00323489,-0.0240479,0.999706]];
_object283 setPosASL [2854.31,2996.03,51.759];


_object284 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object284 setVectorDirAndUp [[-6.10352e-005,0.999954,0.00964355],[-0.00884995,-0.00964372,0.999914]];
_object284 setPosASL [2855.22,3027.19,52.481];


_object285 = createVehicle ["LIB_CG4_WACO_Wreck2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object285 setVectorDirAndUp [[-0.00012207,0.999628,0.0272827],[-0.00402826,-0.027283,0.99962]];
_object285 setPosASL [2867.89,3016.76,52.3978];


_object286 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object286 setVectorDirAndUp [[-0.000244141,0.999815,0.0192261],[-0.0136112,-0.0192276,0.999722]];
_object286 setPosASL [2872.81,3028.73,52.6283];


_object287 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object287 setVectorDirAndUp [[-6.10352e-005,0.999954,0.00964355],[-0.00884995,-0.00964372,0.999914]];
_object287 setPosASL [2855.08,3027.15,52.4794];


_object288 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object288 setVectorDirAndUp [[-0.000427246,0.999799,0.0200195],[-0.0200201,-0.0200241,0.999599]];
_object288 setPosASL [2846.84,3013.5,52.1881];


_object289 = createVehicle ["WW2_US_Infantry_Dead_2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object289 setVectorDirAndUp [[-0.000183105,0.999487,0.0320435],[-0.00640878,-0.032044,0.999466]];
_object289 setPosASL [2874.23,3019.18,52.495];


_object290 = createVehicle ["WW2_US_Infantry_Dead_4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object290 setVectorDirAndUp [[-0.000244141,0.999815,0.0192261],[-0.0136112,-0.0192276,0.999722]];
_object290 setPosASL [2872.74,3028.84,52.6296];


_object291 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object291 setVectorDirAndUp [[-0.000427246,0.999799,0.0200195],[-0.0200201,-0.0200241,0.999599]];
_object291 setPosASL [2846.77,3013.66,52.1898];


_object292 = _group0 createUnit ["VirtualCurator_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object292 setPosASL [2876.76,3065.04,52.9413];
_object292 setDir 226.229;
_object292 setRank "PRIVATE";
_object292 setSkill 1;
_object292 setUnitPos "Auto";
['_object292_nextFrameHandle', 'onEachFrame', {
    params ["_unit"];
    _unit setUnitLoadout [[],[],[],[],["V_Rangemaster_belt",[["TFAR_anprc152_9",1],["TFAR_fadak_9",1],["TFAR_anprc148jem_9",1]]],[],"","",[],["ItemMap","","","ItemCompass","TFAR_microdagr",""]];
    _unit call BIN_fnc_CBRNHoseInit;
    ['_object292_nextFrameHandle', 'onEachFrame'] call BIS_fnc_removeStackedEventHandler;
}, [_object292]] call BIS_fnc_addStackedEventHandler;


_object293 = createVehicle ["Land_fow_corpse_burned1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object293 setVectorDirAndUp [[0.000793457,0.99932,0.0368652],[0.0208134,-0.0368738,0.999103]];
_object293 setPosASL [2877.5,3158.72,55.3821];


_object294 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object294 setVectorDirAndUp [[-0.000183105,0.997228,-0.0744019],[0.0023803,0.0744021,0.997226]];
_object294 setPosASL [2872.56,3484.26,52.5308];


_object295 = createVehicle ["LIB_CG4_WACO_WingLeft", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object295 setVectorDirAndUp [[-0.0012207,0.998242,-0.0592651],[0.0208125,0.0592777,0.998025]];
_object295 setPosASL [2857.47,3482.42,52.8527];


_object296 = createVehicle ["LIB_CG4_WACO_WingLeft", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object296 setVectorDirAndUp [[-0.000427246,0.996986,-0.0775757],[0.00561536,0.0775769,0.996971]];
_object296 setPosASL [2878.06,3489.08,52.1355];


_object297 = createVehicle ["LIB_CG4_WACO_Wreck", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object297 setVectorDirAndUp [[-0.00115967,0.997228,-0.0744019],[0.0151975,0.0744109,0.997112]];
_object297 setPosASL [2869.04,3485.52,52.4609];


_object298 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object298 setVectorDirAndUp [[-0.00195313,0.997843,-0.0656128],[0.0296029,0.0656419,0.997404]];
_object298 setPosASL [2850.65,3492.05,52.4038];


_object299 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object299 setVectorDirAndUp [[-0.000183105,0.997228,-0.0744019],[0.0023803,0.0744021,0.997226]];
_object299 setPosASL [2872.56,3484.19,52.5362];


_object300 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object300 setVectorDirAndUp [[-0.00140381,0.998097,-0.0616455],[0.0231939,0.0616615,0.997828]];
_object300 setPosASL [2854.73,3509.18,51.1593];


_object301 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object301 setVectorDirAndUp [[-0.000610352,0.997681,-0.0680542],[0.00878927,0.0680569,0.997643]];
_object301 setPosASL [2863.01,3485.78,52.5225];


_object302 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object302 setVectorDirAndUp [[-0.00195313,0.997843,-0.0656128],[0.0296029,0.0656419,0.997404]];
_object302 setPosASL [2850.73,3492.07,52.4003];


_object303 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object303 setVectorDirAndUp [[-0.000610352,0.997681,-0.0680542],[0.00878927,0.0680569,0.997643]];
_object303 setPosASL [2863.05,3485.88,52.5154];


_object304 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object304 setVectorDirAndUp [[-0.00140381,0.998097,-0.0616455],[0.0231939,0.0616615,0.997828]];
_object304 setPosASL [2854.73,3509.19,51.1586];


_object305 = createVehicle ["LIB_CG4_WACO_Wreck2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object305 setVectorDirAndUp [[-0.249878,-0.967528,0.0380859],[0.0348701,0.0303164,0.998932]];
_object305 setPosASL [2848.96,3527.12,50.5659];


_object306 = createVehicle ["WW2_US_Infantry_Dead_4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object306 setVectorDirAndUp [[-0.0010376,0.999536,-0.0304565],[0.0344841,0.0304742,0.998941]];
_object306 setPosASL [2842.14,3528.27,50.7641];


_object307 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object307 setVectorDirAndUp [[0,0.999995,0.00323486],[-0.00482175,-0.00323483,0.999983]];
_object307 setPosASL [2902.14,3076.52,53.4399];


_object308 = createVehicle ["Land_fow_corpse_burned2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object308 setVectorDirAndUp [[0.000915527,0.99932,0.0368652],[0.024048,-0.0368766,0.999031]];
_object308 setPosASL [2880.67,3156.78,55.2297];


_object309 = createVehicle ["Land_fow_corpse_burned2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object309 setVectorDirAndUp [[0.00134277,0.999229,0.0392456],[0.0336306,-0.0392686,0.998663]];
_object309 setPosASL [2880.06,3166.69,55.6234];


_object310 = createVehicle ["LIB_C47_Skytrain_wreck", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object310 setVectorDirAndUp [[-0.998596,0.039565,0.0352173],[0.0336581,-0.0394062,0.998656]];
_object310 setPosASL [2883.51,3162.63,55.3759];


_object311 = createVehicle ["Land_fow_corpse_burned1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object311 setVectorDirAndUp [[0.000976563,0.99965,0.0264282],[0.0360709,-0.0264463,0.998999]];
_object311 setPosASL [2894.93,3168.47,55.1628];


_object312 = createVehicle ["WW2_Cow_Dead1_5", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object312 setVectorDirAndUp [[0.000488281,0.999729,0.0232544],[0.020874,-0.0232595,0.999512]];
_object312 setPosASL [2938.13,3038.77,53.0951];


_object313 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object313 setVectorDirAndUp [[6.10352e-005,0.999968,0.00799561],[0.00720217,-0.00799584,0.999942]];
_object313 setPosASL [2920.47,3041.63,53.3782];


_object314 = createVehicle ["BloodPool_01_Medium_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object314 setVectorDirAndUp [[6.10352e-005,0.999968,0.00799561],[0.00720217,-0.00799584,0.999942]];
_object314 setPosASL [2920.28,3041.58,53.3792];


_object315 = createVehicle ["BloodPool_01_Medium_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object315 setVectorDirAndUp [[6.10352e-005,0.999968,0.00799561],[0.00720217,-0.00799584,0.999942]];
_object315 setPosASL [2920.29,3041.68,53.38];


_object316 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object316 setVectorDirAndUp [[6.10352e-005,0.999968,0.00799561],[0.00720217,-0.00799584,0.999942]];
_object316 setPosASL [2920.22,3042.97,53.3908];


_object317 = createVehicle ["WW2_US_Infantry_Dead_3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object317 setVectorDirAndUp [[0.000915527,0.999629,0.0272217],[0.0344852,-0.0272371,0.999034]];
_object317 setPosASL [2980.27,3029.82,51.469];


_object318 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object318 setVectorDirAndUp [[0.000915527,0.999629,0.0272217],[0.0344852,-0.0272371,0.999034]];
_object318 setPosASL [2980.27,3029.97,51.4734];


_object319 = createVehicle ["LIB_CG4_WACO_Wreck2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object319 setVectorDirAndUp [[0.000488281,0.999937,0.0112305],[0.0408942,-0.011241,0.9991]];
_object319 setPosASL [2974.66,3048.92,52.0203];


_object320 = createVehicle ["BloodTrail_01_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object320 setVectorDirAndUp [[0.000366211,0.999954,0.00958252],[0.0408925,-0.00958948,0.999118]];
_object320 setPosASL [2976.7,3050.54,51.9524];


_object321 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object321 setVectorDirAndUp [[0.000305176,0.999953,0.00964355],[0.0312505,-0.00964838,0.999465]];
_object321 setPosASL [2966.96,3055.79,52.3722];


_object322 = createVehicle ["BloodPool_01_Large_New_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object322 setVectorDirAndUp [[0.000305176,0.999918,0.0128174],[0.0232547,-0.012821,0.999647]];
_object322 setPosASL [2990.13,3053.34,51.5311];


_object323 = createVehicle ["WW2_Cow_Dead1_6", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object323 setVectorDirAndUp [[0.000488281,0.999783,0.020813],[0.0232544,-0.0208187,0.999513]];
_object323 setPosASL [2997.48,3042.61,51.163];


_object324 = createVehicle ["WW2_US_Infantry_Dead_4", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object324 setVectorDirAndUp [[0.000305176,0.999918,0.0128174],[0.0232547,-0.012821,0.999647]];
_object324 setPosASL [2990.19,3053.25,51.5285];


_object325 = createVehicle ["WW2_US_Infantry_Dead_1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object325 setVectorDirAndUp [[0.000305176,0.999953,0.00964355],[0.0312505,-0.00964838,0.999465]];
_object325 setPosASL [2966.87,3055.86,52.3755];


_object326 = createVehicle ["LIB_CG4_WACO_Wreck2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object326 setVectorDirAndUp [[-0.996704,0.0652831,-0.0481567],[-0.0456287,0.0396777,0.99817]];
_object326 setPosASL [2977.04,3385.72,53.5874];


_object327 = createVehicle ["Land_I44_Buildings_Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object327 setVectorDirAndUp [[0,1,0],[0,0,1]];
_object327 setPosASL [3599.83,4675.88,49.7083];


_object328 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object328 setVectorDirAndUp [[0.000366211,0.999757,-0.0220337],[-0.015564,0.0220367,0.999636]];
_object328 setPosASL [3588.87,4669.31,49.9854];


_object329 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object329 setVectorDirAndUp [[-0.000549316,0.999765,-0.0216675],[0.0264289,0.0216744,0.999416]];
_object329 setPosASL [3589.27,4702.87,49.2636];


_object330 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object330 setVectorDirAndUp [[-0.000244141,0.999974,-0.00720215],[0.0360716,0.00720627,0.999323]];
_object330 setPosASL [3621.39,4664.78,49.1648];


_object331 = createVehicle ["Land_fow_wreck_willys", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object331 setVectorDirAndUp [[-0.000976563,0.999536,-0.0304565],[0.0344842,0.0304721,0.998941]];
_object331 setPosASL [3612.46,4688.67,48.9759];


_object332 = createVehicle ["Land_fow_wreck_willys", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object332 setVectorDirAndUp [[0.348694,0.937115,-0.0150757],[0.034902,0.00309069,0.999386]];
_object332 setPosASL [3614.58,4694.01,48.8492];


_object333 = createVehicle ["Land_ShellCrater_02_debris_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object333 setVectorDirAndUp [[-6.10352e-005,0.999995,-0.00323486],[0.0104981,0.00323533,0.99994]];
_object333 setPosASL [3609.2,4694.8,49.0185];


_object334 = createVehicle ["Land_fow_corpse_burned6", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object334 setVectorDirAndUp [[-0.000610352,0.999872,-0.0159912],[0.0368647,0.0160028,0.999192]];
_object334 setPosASL [3621.64,4709.35,49.9072];


_object335 = createVehicle ["Body", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object335 setVectorDirAndUp [[0.732239,-0.680659,-0.0230103],[0.0376907,0.00676581,0.999267]];
_object335 setPosASL [3619.11,4690.8,48.7041];


_object336 = createVehicle ["Body", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object336 setVectorDirAndUp [[0.722961,-0.690515,-0.0227051],[0.0376472,0.00655879,0.99927]];
_object336 setPosASL [3618.26,4690.31,48.7348];


_object337 = createVehicle ["Body", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object337 setVectorDirAndUp [[0.726563,-0.687088,-0.00408936],[0.0341355,0.030151,0.998962]];
_object337 setPosASL [3618.71,4686.42,48.8296];


_object338 = createVehicle ["Body", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object338 setVectorDirAndUp [[0.724243,-0.689146,-0.0234375],[0.0545256,0.0233528,0.998239]];
_object338 setPosASL [3619.94,4691.34,48.6484];


_object339 = createVehicle ["Body", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object339 setVectorDirAndUp [[0.789246,-0.614019,-0.00848389],[0.034174,0.0301239,0.998962]];
_object339 setPosASL [3617.34,4689.42,48.7853];


_object340 = createVehicle ["Body", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object340 setVectorDirAndUp [[0.75061,-0.66072,-0.0057373],[0.0341588,0.0301316,0.998962]];
_object340 setPosASL [3616.51,4688.6,48.8391];


_object341 = createVehicle ["Land_fow_corpse_burned2", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object341 setVectorDirAndUp [[-0.000488281,0.999871,-0.0160522],[0.0368648,0.0160593,0.999191]];
_object341 setPosASL [3623.34,4706.81,48.1951];


_object342 = createVehicle ["Land_fow_corpse_burned5", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object342 setVectorDirAndUp [[-0.00012207,0.999995,-0.00323486],[0.0344852,0.00323715,0.9994]];
_object342 setPosASL [3612.91,4691.18,48.9164];


_object343 = createVehicle ["LIB_M4A3_75_wreck", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object343 setVectorDirAndUp [[-0.455933,-0.889472,0.0310669],[0.0379087,0.0154665,0.999162]];
_object343 setPosASL [3621.57,4708.87,48.7264];


_object344 = createVehicle ["Land_ShellCrater_02_decal_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object344 setVectorDirAndUp [[-0.000732422,0.999747,-0.0224609],[0.0336905,0.0224729,0.99918]];
_object344 setPosASL [3638.68,4694.23,47.8947];


_object345 = createVehicle ["Land_WW2_Krater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object345 setVectorDirAndUp [[0,1,0],[0,0,1]];
_object345 setPosASL [3629.57,4717.25,47.7448];


_object346 = createVehicle ["Land_ShellCrater_02_large_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object346 setVectorDirAndUp [[-0.000732422,0.999691,-0.0248413],[0.0288698,0.0248521,0.999274]];
_object346 setPosASL [3614.24,4683.22,49.0642];


_object347 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object347 setVectorDirAndUp [[-0.000732422,0.999747,-0.0224609],[0.0336905,0.0224729,0.99918]];
_object347 setPosASL [3633.06,4698.14,47.9927];


_object348 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object348 setVectorDirAndUp [[-0.00012207,0.999995,-0.00323486],[0.0344852,0.00323715,0.9994]];
_object348 setPosASL [3612.36,4692.58,48.927];


_object349 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object349 setVectorDirAndUp [[-0.000610352,0.999872,-0.0159912],[0.0368647,0.0160028,0.999192]];
_object349 setPosASL [3625.2,4705.98,48.135];


_object350 = createVehicle ["Land_ShellCrater_01_decal_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object350 setVectorDirAndUp [[-0.00219727,0.999169,-0.0407104],[0.0543827,0.0407697,0.997688]];
_object350 setPosASL [3614.82,4703.31,48.5897];


_object351 = createVehicle ["Land_fow_corpse_burned3", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object351 setVectorDirAndUp [[-0.000671387,0.999844,-0.0176392],[0.0384529,0.0176519,0.999104]];
_object351 setPosASL [3620.25,4705.25,48.3658];


_object352 = createVehicle ["Land_fow_corpse_burned1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object352 setVectorDirAndUp [[-0.00012207,0.999995,-0.00323486],[0.0344852,0.00323715,0.9994]];
_object352 setPosASL [3612.39,4694.54,48.9143];


_object353 = createVehicle ["Land_fow_corpse_burned1", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object353 setVectorDirAndUp [[-0.585449,-0.80987,0.0368652],[0.0387681,0.0174536,0.999096]];
_object353 setPosASL [3620.55,4707.78,49.9812];


_object354 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object354 setVectorDirAndUp [[-0.000671387,0.999884,-0.0151978],[0.0448598,0.0152126,0.998878]];
_object354 setPosASL [3609.28,4734.21,48.0774];


_object355 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object355 setVectorDirAndUp [[-0.000915527,0.999783,-0.020813],[0.0432742,0.0208331,0.998846]];
_object355 setPosASL [3643.04,4674.73,48.232];


_object356 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object356 setVectorDirAndUp [[-0.0012207,0.99965,-0.0264282],[0.0456548,0.0264564,0.998607]];
_object356 setPosASL [3662.14,4707.56,46.4632];


_object357 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object357 setVectorDirAndUp [[-0.00140381,0.999513,-0.031189],[0.0440676,0.0312205,0.998541]];
_object357 setPosASL [3641.85,4683.19,48.0721];


_object358 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object358 setVectorDirAndUp [[-0.000915527,0.999583,-0.0288696],[0.032043,0.0288841,0.999069]];
_object358 setPosASL [3678.29,4689.72,46.2883];


_object359 = createVehicle ["Land_ShellCrater_01_decal_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object359 setVectorDirAndUp [[-0.000915527,0.999749,-0.0223999],[0.0400384,0.0224186,0.998947]];
_object359 setPosASL [3646.81,4692.43,47.6174];


_object360 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object360 setVectorDirAndUp [[-0.000244141,0.999979,-0.00640869],[0.0401012,0.00641333,0.999175]];
_object360 setPosASL [3650.85,4748.6,46.352];


_object361 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object361 setVectorDirAndUp [[-0.000549316,0.999937,-0.0112305],[0.0504763,0.0112439,0.998662]];
_object361 setPosASL [3674.3,4790.1,44.4888];


_object362 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object362 setVectorDirAndUp [[-0.00109863,0.999918,-0.0127563],[0.0861195,0.0128036,0.996203]];
_object362 setPosASL [3693.86,4708.53,46.1839];


_object363 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object363 setVectorDirAndUp [[-0.000732422,0.999651,-0.0264282],[0.027283,0.0264384,0.999278]];
_object363 setPosASL [3706.97,4733.1,45.0311];


_object364 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object364 setVectorDirAndUp [[-0.000854492,0.999766,-0.0216064],[0.0392445,0.0216233,0.998996]];
_object364 setPosASL [3693.54,4786.34,43.7177];


_object365 = createVehicle ["Crater", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_object365 setVectorDirAndUp [[-0.0012207,0.999407,-0.0344238],[0.0360709,0.0344455,0.998756]];
_object365 setPosASL [3682.19,4763.06,44.9333];



_group0 setFormation "WEDGE";
_group0 setBehaviour "AWARE";
_group0 setCombatMode "YELLOW";
_group0 setSpeedMode "NORMAL";

_waypoint = [_group0, 0];
_waypoint setWaypointPosition [[0,0,0], -1];
_waypoint setWaypointType "MOVE";
_waypoint setWaypointName "";
_waypoint setWaypointDescription "";
_waypoint setWaypointFormation "NO CHANGE";
_waypoint setWaypointBehaviour "UNCHANGED";
_waypoint setWaypointCombatMode "NO CHANGE";
_waypoint setWaypointSpeed "UNCHANGED";
_waypoint setWaypointTimeout [0,0,0];
_waypoint setWaypointCompletionRadius 0;
_waypoint setWaypointStatements ["true",""];
_waypoint setWaypointScript "";

_group0 setCurrentWaypoint [_group0, 1];


