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






// CHILD TASK 2 (Fortify)
[independent, ["defend_task_2","defend_task_parent"], ["Defend Neaville and prevent the enemy from pushing through to the beach.<br/><br/>NOTE: Mission will fail if no players are alive in the city while the enemy force occupies it.
","Defend Neaville - Wave #1", ""],"main_obj_mrkr", "ASSIGNED",99, true, "Defend", true] call BIS_fnc_taskCreate;

[independent, ["defend_task_3","defend_task_parent"], ["Defend Neaville and prevent the enemy from pushing through to the beach.<br/><br/>NOTE: Mission will fail if no players are alive in the city while the enemy force occupies it.
","Defend Neaville - Wave #2", ""],"main_obj_mrkr", "ASSIGNED",98, true, "Defend", true] call BIS_fnc_taskCreate;


["defend_task_1","SUCCEEDED"] call BIS_fnc_taskSetState;