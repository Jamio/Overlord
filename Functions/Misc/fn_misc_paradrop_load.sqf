

_unit = _this select 0;
removeBackpack _unit;
_unit addBackpack "B_LIB_US_Type5";
_unit disableCollisionWith (vehicle _unit);
_unit allowdamage false;