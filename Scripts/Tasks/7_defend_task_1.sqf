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



OL_mission_1_ended = true;
publicVariable "OL_mission_1_ended";



private _tasks = [
"secondary_task_parent",
"tertiary_task_parent"
];

{

	if ( !(_x call BIS_fnc_taskCompleted) ) then {

		[_x,"CANCELED"] call BIS_fnc_taskSetState;
	};


} forEach _tasks;




// PARENT
[independent, ["defend_task_parent"], ["Defend Neaville and prevent the enemy from pushing through to the beach.", "Defend Neaville", ""],"main_obj_mrkr", "CREATED",99, true, "defend", true] call BIS_fnc_taskCreate;




// CHILD TASK 1 (Fortify)
[independent, ["defend_task_1","defend_task_parent"], ["Setup defensive positions and build fortifications around the city.<br/><br/>NOTE: After fortification is complete, the company commander must use the provided hold-action (Ready to Defend Neaville), for the mission to proceed.
","Fortify Neaville", ""],"main_obj_mrkr", "ASSIGNED",99, true, "Defend", true] call BIS_fnc_taskCreate;




