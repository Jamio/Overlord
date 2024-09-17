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


// PARENT TASK

[independent, ["player_start_tasks"], ["Mission Preparation", "Mission Preparation", ""],objNull, "CREATED",0, true, "", false] call BIS_fnc_taskCreate; 


// PARENT TASK

[independent, ["primary_task_parent"], ["All primary tasks must be completed for mission success.<br/><br/>NOTE: Intel recovered from AA Sites can reveal the location of hidden tasks.
","Primary Tasks", ""],objNull, "CREATED",0, false, "", false] call BIS_fnc_taskCreate; 







