/*

scriptDone OL_convoyScript_1;

convoyScript = [convoyGroup] spawn TOV_fnc_SimpleConvoy;

convoyScript = [convoyGroup, convoySpeed, convoySeparation, pushThrough] spawn TOV_fnc_SimpleConvoy;
     
convoyGroup : the group you want to move as a convoy
convoySpeed : Maximum speed of the convoy in km/h (default 50 km/h)
convoySeparation : distance between each vehicle of the convoy (default 50m)
pushThrough : true/false, force the AI to push through contact, only returning fire on the move (default true)

convoyScript = [testgroup] spawn TOV_fnc_SimpleConvoy;
convoyScript = [testgroup, 25, 15, true] spawn TOV_fnc_SimpleConvoy;

scriptDone convoyScript

terminate convoyScript;
{(vehicle _x) limitSpeed 5000;(vehicle _x) setUnloadInCombat [true, false]} forEach (units convoyGroup);
convoyGroup enableAttack true;

By TOVA

*/





TOV_fnc_SimpleConvoy = { 
	params ["_convoyGroup",["_convoySpeed",50],["_convoySeparation",50],["_pushThrough", true]];
	if (_pushThrough) then {
		_convoyGroup enableAttack !(_pushThrough);
		{(vehicle _x) setUnloadInCombat [false, false];} forEach (units _convoyGroup);
	};
	_convoyGroup setFormation "COLUMN";
	{
    	(vehicle _x) limitSpeed _convoySpeed*1.15;
        (vehicle _x) setConvoySeparation _convoySeparation;
    } forEach (units _convoyGroup);
	(vehicle leader _convoyGroup) limitSpeed _convoySpeed;
	while {sleep 5; !isNull _convoyGroup} do {
		{
			if ((speed vehicle _x < 5) && (_pushThrough || (behaviour _x != "COMBAT"))) then {
				(vehicle _x) doFollow (leader _convoyGroup);
			};	
		} forEach (units _convoyGroup)-(crew (vehicle (leader _convoyGroup)))-allPlayers;
        {(vehicle _x) setConvoySeparation _convoySeparation;} forEach (units _convoyGroup);
	}; 
};