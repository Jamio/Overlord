


class CfgHints
{
	class HINTS_ALL
	{
		displayName = "Operation Overlord Hints";
		
		
		class HINT_show
		{

			displayName = "Hints";
			displayNameShort = "";

			description = "All of the following hints can be reviewed under %3Log%4 in your map.<br/><br/>All mission details can also be reviewed in your map.";
			tip = "";
			arguments[] = {};
			image = "";
			noImage = false;
			dlc = 0;

		};
		
		class HINT_persistance
		{

			displayName = "Save / Load Games";
			displayNameShort = "";

			description = "%3SAVE MISSION%4<br/>%2Automatically saved periodically<br/>%2Saved when objectives are completed.<br/><br/>%3LOAD MISSION%4<br/>%2Enable %3Load Save%4 in the mission parameters.<br/><br/>%3What is Saved:%4<br/>%2Objective Statuses (Completion statuses and unit statuses if not complete).<br/>%2All placed objects through %3BUILD MENU%4.<br/>%2Respawn Tickets.<br/>%2Supplies and supply drop boxes.<br/>%2Player scores.<br/>%2Player Loadouts.<br/>";
			tip = "";
			arguments[] = {};
			image = "";
			noImage = false;
			dlc = 0;

		};

		
		class HINT_cricket
		{

			displayName = "Cricket Clicker";
			displayNameShort = "";

			description = "Pressing the %11 key will give an audible click that can be used to determine friend from foe. Players will have to manually reply back, where friendly AI units will automatically reply if they are within 100 m.<br/><br/>NOTE:<br/>Nearby enemy units will investigate this noise if they are within 50 m. This can be used as a distraction to lure the enemy out.";
			tip = "The Default key for your clicker can be configured in Controls >> Configure Addons >> Overlord D-Day";
			arguments[] = {
			{{DIK_U}}

			};
			image = "";
			noImage = false;
			dlc = 0;

		};
		
		class HINT_Arsenal
		{

			displayName = "Player Loadout";
			displayNameShort = "";

			description = "%3LOADOUTS%4<br/>%2The player's persistent loadout is saved each time they close they default arsenal.<br/><br/>";
			tip = "";
			arguments[] = {};
			image = "";
			noImage = false;
			dlc = 0;

		};
		
		class HINT_command_menu
		{

			displayName = "Command Menu";
			displayNameShort = "";

			description = "%3COMMAND MENU%4<br/>%2Only Squad Leaders have access to this menu. This menu includes the following sub-menus:<br/><br/>";
			tip = "All menus can be accessed via the action menu with your mousewheel.";
			arguments[] = {};
			image = "";
			noImage = false;
			dlc = 0;

		};

		class HINT_command_menu_2
		{

			displayName = "Command Sub-Menus";
			displayNameShort = "";

			description = "%3SUPPLY MENU%4<br/>%2Only the commander has access to this menu. Allows the commander to call in supply drops and distribute supply points used for fortifications.<br/><br/>%3RECRUIT MENU%4<br/>%2Squad Leaders are able to recruit AI units with this menu (delivered via paradrop).<br/><br/>%3SQUAD MENU%4<br/>%2Squad Leaders are able to remote control, teleport, disable, and delete AI units with this menu.<br/><br/>%3DEPLOY RALLY POINT%4<br/>%2Squad Leaders are able to deploy rallypoints that their group can teleport to (Can only teleport if a unit is in the dropzone).<br/>";
			//tip = "";
			arguments[] = {};
			image = "";
			noImage = false;
			dlc = 0;

		};

		class HINT_build_menu
		{

			displayName = "Build Menu";
			displayNameShort = "";

			description = "%3BUILD MENU%4<br/>%2All players are able to construct fortifications with this menu. The commander must first distribute supply points.<br/><br/>%3SUPPLIES%4<br/>%2In addition to the starting supplies, supply boxes can be captured at various objectives throughout the map.";
			tip = "All menus can be accessed via the action menu with your mousewheel.";
			arguments[] = {};
			image = "";
			noImage = false;
			dlc = 0;

		};
		
		
		class HINT_intel
		{

			displayName = "Intel";
			displayNameShort = "";

			description = "Intel can be found at the AA sites (Secondary Objectives), and will reveal the location of hidden objectives.";
			tip = "Secondary objectives are optional, but can have a direct impact on the mission";
			arguments[] = {};
			image = "Pics\hint_intel_1.paa";
			noImage = false;
			dlc = 0;

		};
		
		class HINT_explosives
		{

			displayName = "Explosives";
			displayNameShort = "";

			description = "%3PLACE%4<br/>%2All enemy vehicles and AA will have a hold-action called '%3Place Explosives%4', that will allow players to attach explosives to the vehicle without the need to carry any in their inventory.<br/><br/>%3DETONATE%4<br/>%2After attaching explosives to a vehicle, players will then have an option to <br/>%3-- TOUCH OFF BOMBS --%4 via their action menu (access with scroll wheel).";
			tip = "Multiple explosives can be placed and detonated simultaneously.";
			arguments[] = {};
			image = "";
			noImage = false;
			dlc = 0;

		};		
		
		
		class HINT_respawn
		{

			displayName = "Respawn";
			displayNameShort = "";

			description = "All players will be paradropped back into the battlefield after respawn.<br/><br/>%3NOTE:%4<br/>Each AA gun that is still alive will increase the probability that a respawn plane will be shot down by 4 percent.";
			tip = "Destroying AA guns reduces the chances of respawn planes being shot down.";
			arguments[] = {};
			image = "";
			noImage = false;
			dlc = 0;

		};	
		
		class HINT_artillery
		{

			displayName = "Enemy Artillery";
			displayNameShort = "";

			description = "%3Tertiary Objectives:%4<br/>Until all artillery and mortar positions are destroyed, the enemy will be able to call artillery on players that are further than %3%11 m%4 away.";
			tip = "The enemy will not be able to call artillery if players are within %11 meters.";
			arguments[] = {str OL_arty_dist};
			image = "";
			noImage = false;
			dlc = 0;

		};	
		
	};














};