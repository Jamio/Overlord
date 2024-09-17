/*

	[_x] call OL_fnc_misc_opfor_ai_skill;

*/



_unit = _this select 0;


_unit setSkill ["general", OL_enemy_skill];
_unit setSkill ["courage", 1];
_unit setSkill ["commanding", 1];
_unit setSkill ["aimingAccuracy", OL_enemy_aimskill];
_unit setSkill ["aimingSpeed", OL_enemy_aimskill];
_unit setSkill ["aimingShake", OL_enemy_aimskill];





true

