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


_unit = _this select 0;

_taskName_1 = [name player, "_task_1"] joinString "";
_unit setVariable ["OL_startTask_1",_taskName_1];






// CHILD TASK 1 (ARMORY)
[_unit, [_taskName_1,"player_start_tasks"], ["Head to the armory for resupply.", "Resupply", ""],armory_1, "ASSIGNED",99, true, "rearm", true] call BIS_fnc_taskCreate;

// CHILD TASK 2 (Report)
[_unit, ["player_task_2","player_start_tasks"], ["Report to your Company Commander for mission briefing.<br/><br/>NOTE: After preparation is complete, the company commander must use the provided hold-action (Start Mission), for the mission to proceed.", "Report for briefing", ""],brief_sphere, "CREATED",98, true, "meet", true] call BIS_fnc_taskCreate;