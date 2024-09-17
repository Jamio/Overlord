/*

* Registers the given objects in the given side's player interaction menu.
* Players on that side must have the `Fortify Tool` item in their inventory to access the menu.
* Classnames must be in the format [<classname>, <cost>]
* MUST BE CALLED ON SERVER!
*
* Arguments:
* 0: Side <SIDE>
* 1: Budget <NUMBER>
* 2: Object Classnames <ARRAY>
*
* Return Value:
* None
*
* Example:
* [west, 5000, [["Land_BagFence_Long_F", 5], ["Land_BagBunker_Small_F", 50]]] call ace_fortify_fnc_registerObjects


acex_fortify_locations pushBack [constructionCrate, 50, 50, 0, false];


[independent, 100, []] call ace_fortify_fnc_registerObjects;



*/



[independent, 0, [
	
["Land_BagFence_End_F",5],
["Land_BagFence_Corner_F",5],
["Land_BagFence_Short_F",5],
["Land_BagFence_Long_F",5],
["Land_BagFence_Round_F",5],
["Land_I44_HedgeHog",10],
["Land_fow_Barbedwire",25],
["fow_w_m1919a6_deployed_usa_m41",50],
["fow_w_m1919a6_deployed_middle_usa_m41" ,50],
["fow_w_m1919a6_deployed_high_usa_m41",50],
["fow_w_m1919_tripod_usa_m41",50],
["fow_w_m2_mortar_usa" ,100]

]] call ace_fortify_fnc_registerObjects;






 









 
