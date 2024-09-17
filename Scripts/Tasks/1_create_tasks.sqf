/*

[owner, taskID, description, destination, state, priority, showNotification, type, visibleIn3D] call BIS_fnc_taskCreate 

PARAMETERS:
    owner: Task owner(s)
    Boolean - true to set task of all playable units
    Object - set task of a specific object
    Group - set tasks of all objects in the group
    Side - set tasks of all objects of the given side
    Array - collection of above types 
    taskID:
    String - Task ID
    Array - In the format of [task ID, parent task ID]
    description:
    Array - Task description in the format ["description", "title", "marker"]
    String - CfgTaskDescriptions class name, if empty string is used then CfgTaskDescriptions is searched for a class matching the tasks TaskID
    destination (Optional): Task destination
    Object - Use objNull to set no position
    Array - Either position in format [x,y,z], or [object,precision] as used by setSimpleTaskTarget command
    state (Optional): Task state
    String - can be one of following:
    "CREATED"
    "ASSIGNED"
    "AUTOASSIGNED" ("ASSIGNED" when no task is assigned yet, otherwise "CREATED")
    "SUCCEEDED"
    "FAILED"
    "CANCELED"
    Boolean - true to set the task as current
    priority (Optional): Number - priority. When a current task is completed, system select a next one with the larges priority >= 0
    showNotification (Optional): Boolean - true to show notification (default), false to disable it
    type (Optional): String - task type from CfgTaskTypes, if not defined, type "" is being used
    visibleIn3D (Optional): Boolean - true to make task always visible in 3D (default: false)
*/


private ["_taskStatus","_taskInfo"];







//************************************************************
//
//            MISSION PREPARATION (PARENT TASK)
//
//************************************************************
_taskStatus = missionProfileNamespace getVariable ["player_start_tasks","CREATED"];
[independent, ["player_start_tasks"], ["Mission Preparation<br/><br/>
- Use this time to gear up and prepare a plan of attack.
", "Mission Preparation", ""],objNull, _taskStatus,0, true, "move1", false] call BIS_fnc_taskCreate; 






//************************************************************
//
//            RADAR SITE
//
//************************************************************
_taskInfo = (missionProfileNamespace getVariable ["radar_mrkr",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["radar_mrkr"], ["Find and secure the enemy radar site.<br/><br/><br/>
NOTE: Location can be found by finding Intel at the AA sites.<br/><br/>
","Find and Secure Radar Site", ""],objNull, _taskStatus,0, false, "move2", false] call BIS_fnc_taskCreate; 



//************************************************************
//
//            NEAVILLE (MAIN OBJECTIVE)
//
//************************************************************
_taskStatus = missionProfileNamespace getVariable ["main_obj_parent_task","CREATED"];
[independent, ["main_obj_parent_task"], ["Your primary objective is to capture the city of Neaville to prevent the enemy from pushing through to the beach.", "Capture Neaville", ""],"main_obj_mrkr", _taskStatus,0, true, "move3", false] call BIS_fnc_taskCreate; 


//**************************************************
//           NEAVILLE (Kill All Enemy)
//**************************************************
_taskInfo = (missionProfileNamespace getVariable ["main_obj_mrkr",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["main_obj_mrkr","main_obj_parent_task"], ["To capture Neaville, all enemy units must be cleared from the city.", "Clear Enemy from the city", ""],objNull, _taskStatus,0, true, "a", false] call BIS_fnc_taskCreate; 


//**************************************************
//           NEAVILLE (Flak #1)
//**************************************************
_taskStatus = missionProfileNamespace getVariable ["main_obj_2","CREATED"];
[independent, ["main_obj_2","main_obj_parent_task"], ["Capture AA positions in the city and destroy the guns.", "Destroy AA Position", ""],objNull, _taskStatus,0, true, "b", false] call BIS_fnc_taskCreate; 


//**************************************************
//           NEAVILLE (Flak #2)
//**************************************************
_taskStatus = missionProfileNamespace getVariable ["main_obj_3","CREATED"];
[independent, ["main_obj_3","main_obj_parent_task"], ["Capture AA positions in the city and destroy the guns.", "Destroy AA Position", ""],objNull, _taskStatus,0, true, "c", false] call BIS_fnc_taskCreate; 


//**************************************************
//           NEAVILLE (Flak #3)
//**************************************************
_taskStatus = missionProfileNamespace getVariable ["main_obj_4","CREATED"];
[independent, ["main_obj_4","main_obj_parent_task"], ["Capture AA positions in the city and destroy the guns.", "Destroy AA Position", ""],objNull, _taskStatus,0, true, "d", false] call BIS_fnc_taskCreate; 


//**************************************************
//           NEAVILLE (Radio Tower)
//**************************************************
_taskStatus = missionProfileNamespace getVariable ["main_obj_5","CREATED"];
[independent, ["main_obj_5","main_obj_parent_task"], ["Destroy the radio tower at the German HQ located at the church in Neaville.", "Destroy Radio Tower", ""],objNull, _taskStatus,0, true, "e", false] call BIS_fnc_taskCreate; 


if ( ("main_obj_5" call BIS_fnc_taskCompleted) ) then { 

	OL_radio_tower setDamage 1;
	
};





//************************************************************
//
//             SECONDARY OBJECTIVES
//
//************************************************************
_taskStatus = missionProfileNamespace getVariable ["secondary_task_parent","CREATED"];
[independent, ["secondary_task_parent"], ["All secondary tasks are optional, but can provide valuable intel and will have a direct impact on the mission.<br/><br/><br/>
Example:<br/><br/>
- Every AA gun destroyed will reduce the percentage chance that a respawn aircraft will be shot down.<br/><br/>
- Intel found at AA sites will reveal the location of other objectives.<br/><br/>
", "Secondary Tasks", ""],objNull, _taskStatus,0, false, "move4", false] call BIS_fnc_taskCreate; 



//**************************************************
//             AA OBJECTIVES
//**************************************************
_taskInfo = (missionProfileNamespace getVariable ["aa_mrkr_1",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["aa_mrkr_1","secondary_task_parent"], ["All units at the site must be killed and the AA guns must be destroyed.<br/><br/>NOTE:<br/><br/>- Destroying AA sites reduces that chance that respawn aircraft will be shot down.<br/><br/>
- Intel found at the AA sites reavels hidden objectives.
","Capture AA Site (Able)", ""],"aa_mrkr_1",_taskStatus,0, false, "a", false] call BIS_fnc_taskCreate; 

_taskInfo = (missionProfileNamespace getVariable ["aa_mrkr_2",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["aa_mrkr_2","secondary_task_parent"], ["All units at the site must be killed and the AA guns must be destroyed.<br/><br/>NOTE:<br/><br/>- Destroying AA sites reduces that chance that respawn aircraft will be shot down.<br/><br/>
- Intel found at the AA sites reavels hidden objectives.
","Capture AA Site (Baker)", ""],"aa_mrkr_2", _taskStatus,0, false, "b", false] call BIS_fnc_taskCreate; 

_taskInfo = (missionProfileNamespace getVariable ["aa_mrkr_3",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["aa_mrkr_3","secondary_task_parent"], ["All units at the site must be killed and the AA guns must be destroyed.<br/><br/>NOTE:<br/><br/>- Destroying AA sites reduces that chance that respawn aircraft will be shot down.<br/><br/>
- Intel found at the AA sites reavels hidden objectives.
","Capture AA Site (Charlie)", ""],"aa_mrkr_3", _taskStatus,0, false, "c", false] call BIS_fnc_taskCreate; 

_taskInfo = (missionProfileNamespace getVariable ["aa_mrkr_4",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["aa_mrkr_4","secondary_task_parent"], ["All units at the site must be killed and the AA guns must be destroyed.<br/><br/>NOTE:<br/><br/>- Destroying AA sites reduces that chance that respawn aircraft will be shot down.<br/><br/>
- Intel found at the AA sites reavels hidden objectives.
","Capture AA Site (Dog)", ""],"aa_mrkr_4", _taskStatus,0, false, "d", false] call BIS_fnc_taskCreate; 

_taskInfo = (missionProfileNamespace getVariable ["aa_mrkr_5",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["aa_mrkr_5","secondary_task_parent"], ["All units at the site must be killed and the AA guns must be destroyed.<br/><br/>NOTE:<br/><br/>- Destroying AA sites reduces that chance that respawn aircraft will be shot down.<br/><br/>
- Intel found at the AA sites reavels hidden objectives.
","Capture AA Site (Easy)", ""],"aa_mrkr_5", _taskStatus,0, false, "e", false] call BIS_fnc_taskCreate; 

_taskInfo = (missionProfileNamespace getVariable ["aa_mrkr_6",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["aa_mrkr_6","secondary_task_parent"], ["All units at the site must be killed and the AA guns must be destroyed.<br/><br/>NOTE:<br/><br/>- Destroying AA sites reduces that chance that respawn aircraft will be shot down.<br/><br/>
- Intel found at the AA sites reavels hidden objectives.
","Capture AA Site (Fox)", ""],"aa_mrkr_6", _taskStatus,0, false, "f", false] call BIS_fnc_taskCreate; 





//************************************************************
//
//             TERTIARY OBJECTIVES
//
//************************************************************
_taskInfo = missionProfileNamespace getVariable ["tertiary_task_parent","CREATED"];
[independent, ["tertiary_task_parent"], ["All tertiary tasks are optional, but will have a direct impact on the mission.<br/><br/><br/>
Example:<br/><br/>
- Destroying all artillery positions will eliminate the ability for the enemy to call artillery support on players.<br/><br/>
", "Tertiary Tasks", ""],objNull, _taskStatus,0, false, "move5", false] call BIS_fnc_taskCreate; 





//**************************************************
//           ARTILLERY OBJECTIVE
//**************************************************
_taskInfo = (missionProfileNamespace getVariable ["arty_mrkr_1",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["arty_mrkr_1","tertiary_task_parent"], ["Find and destroy enemy artillery site.<br/><br/>NOTE: Location can be found by finding Intel at the AA sites. The enemy will be able to call in artillery requests until it is destroyed.
","Find and Destroy Artillery", ""],ObjNull, _taskStatus,0, false, "a", false] call BIS_fnc_taskCreate; 



//**************************************************
//           MORTAR OBJECTIVE
//**************************************************
_taskInfo = (missionProfileNamespace getVariable ["mortar_mrkr_1",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["mortar_mrkr_1","tertiary_task_parent"], ["Unknown Objective","Unknown", ""],ObjNull, _taskStatus,0, false, "b", false] call BIS_fnc_taskCreate; 


//**************************************************
//           MG #1
//**************************************************
_taskInfo = (missionProfileNamespace getVariable ["mg_mrkr_1",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["mg_mrkr_1","tertiary_task_parent"], ["Unknown Objective","Unknown", ""],ObjNull, _taskStatus,0, false, "c", false] call BIS_fnc_taskCreate; 


//**************************************************
//           MG #2
//**************************************************
_taskInfo = (missionProfileNamespace getVariable ["mg_mrkr_2",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["mg_mrkr_2","tertiary_task_parent"], ["Unknown Objective","Unknown", ""],ObjNull, _taskStatus,0, false, "d", false] call BIS_fnc_taskCreate;


//**************************************************
//           MG #3
//**************************************************
_taskInfo = (missionProfileNamespace getVariable ["mg_mrkr_3",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["mg_mrkr_3","tertiary_task_parent"], ["Unknown Objective","Unknown", ""],ObjNull, _taskStatus,0, false, "e", false] call BIS_fnc_taskCreate;


//**************************************************
//           FOOT PATROL #1
//**************************************************
_taskInfo = (missionProfileNamespace getVariable ["patrol_mrkr_1",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["patrol_mrkr_1","tertiary_task_parent"], ["Unknown Objective","Unknown", ""],ObjNull, _taskStatus,0, false, "f", false] call BIS_fnc_taskCreate;


//**************************************************
//           FOOT PATROL #2
//**************************************************
_taskInfo = (missionProfileNamespace getVariable ["patrol_mrkr_2",[nil,nil,nil,nil,nil,nil,nil,nil,false]]) select 8;
if ( _taskInfo ) then { _taskStatus = "SUCCEEDED" } else { _taskStatus = "CREATED" };
[independent, ["patrol_mrkr_2","tertiary_task_parent"], ["Unknown Objective","Unknown", ""],ObjNull, _taskStatus,0, false, "g", false] call BIS_fnc_taskCreate;


//**************************************************
//           VEHICLE PATROL #1 and #2
//**************************************************
private _veh_task_1 = missionProfileNamespace getVariable ["vehicle_patrol_1","CREATED"];
[independent, ["vehicle_patrol_1","tertiary_task_parent"], ["Unknown Objective","Unknown", ""],ObjNull, _veh_task_1,0, false, "h", false] call BIS_fnc_taskCreate;


private _veh_task_2 = missionProfileNamespace getVariable ["vehicle_patrol_2","CREATED"];
[independent, ["vehicle_patrol_2","tertiary_task_parent"], ["Unknown Objective","Unknown", ""],ObjNull, _veh_task_2,0, false, "i", false] call BIS_fnc_taskCreate;



if ( ("vehicle_patrol_1" call BIS_fnc_taskCompleted) ) then { 

		["vehicle_patrol_1", [
			"Ambush and destroy the enemy convoy.",
			"Destroy Enemy Convoy",
			""
				]
			] call BIS_fnc_taskSetDescription;

};


if ( ("vehicle_patrol_2" call BIS_fnc_taskCompleted) ) then { 

		["vehicle_patrol_2", [
			"Ambush and destroy the enemy convoy.",
			"Destroy Enemy Convoy",
			""
				]
			] call BIS_fnc_taskSetDescription;

};






//*******************************************************************************
//
//      CREATE SECTORS
//
//*******************************************************************************

[] call OL_create_sectors_main_1;
[] call OL_create_sectors_radar_2;
[] call OL_create_sectors_aa_3;
[] call OL_create_sectors_arty_4;
[] call OL_create_sectors_mortar_5;
[] call OL_create_sectors_mg_1_6;
[] call OL_create_sectors_mg_2_7;
[] call OL_create_sectors_mg_3_8;
[] call OL_create_sectors_patrol_1_9;
[] call OL_create_sectors_patrol_1_10;


	














