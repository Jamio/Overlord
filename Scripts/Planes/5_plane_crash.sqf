if (isServer) then {


params ["_effects"];

sleep 10;

_effects = [];

	{

		_plane = _x;
		
		_bomb = "APERSMine_Range_Ammo" createVehicle (_plane modelToWorld [2.8,7,-1.3]);
		_bomb setdamage 1; 

		[_plane,["hitengine", 1]] remoteExec ["setHitPointDamage",0];

		_fire = "#particlesource" createVehicle getpos _plane;
		[_fire,[["\A3\data_f\ParticleEffects\Universal\Universal",16,10,32,1],"","Billboard",1,0.6,[0,0,0],[0,0,0.7],0,0.045,0.04,0.05,[0.65,0.05],[[1,1,1,-1]],[0.5,1],0,0,"","","",0,false,0,[[0,0,0,0]]]] remoteExec ["setParticleParams",0];
		[_fire,[0.15,[0.3,0.3,0.1],[0.05,0.05,0.15],10,0.03,[0.1,0.1,0.1,0],0,0,0.1,0]] remoteExec ["setParticleRandom",0];
		[_fire,[0,[0,0,0]]] remoteExec ["setParticleCircle",0];
		[_fire,[1.25,1,0.1]] remoteExec ["setParticleFire",0];
		[_fire,0.015] remoteExec ["setDropInterval",0];


		_smoke = "#particlesource" createVehicle getpos _plane;
		[_smoke,[["\A3\data_f\ParticleEffects\Universal\Universal_02",8,0,40,1],"","Billboard",1,22,[0,0,0],[0,0,2.5],1,0.05,0.04,0.05,[2,20],[[0.35,0.35,0.35,0.6],[0.35,0.35,0.35,0.75],[0.35,0.35,0.35,0.45],[0.42,0.42,0.42,0.28],[0.42,0.42,0.42,0.16],[0.42,0.42,0.42,0.09],[0.42,0.42,0.42,0.06],[0.5,0.5,0.5,0.02],[0.5,0.5,0.5,0]],[1,0.55,0.35],0.3,0.2,"","","",0,false,0,[[0,0,0,0]]]] remoteExec ["setParticleParams",0];
		[_smoke,[8,[0.15,0.15,0.15],[0.25,0.25,0.5],0.5,0,[0,0,0,0.06],0,0,0.5,0]] remoteExec ["setParticleRandom",0];
		[_smoke,[1,[0,0,0]]] remoteExec ["setParticleCircle",0];
		[_smoke,[0,0,0]] remoteExec ["setParticleFire",0];
		[_smoke,0.08] remoteExec ["setDropInterval",0];

	

		_fire attachTo [_plane,[2.8,7,-1.3]];
		_smoke attachTo [_plane,[2.8,7,-1.3]];

		_effects pushBack _fire;
		_effects pushBack _smoke;

		sleep 1;

		{ _x setDamage 1; } forEach crew _plane - allPlayers;

		OL_respawn_planes_fly = OL_respawn_planes_fly - [_plane];
		publicVariable "OL_respawn_planes_fly";

		_val_1 = velocityModelSpace _plane select 0;
		_val_2 = velocityModelSpace _plane select 2;
		[_plane,[_val_1, 65, _val_2]] remoteExec ["setVelocityModelSpace",0];
		[_plane,[[0.856331,-0.052612,-0.513741],[0.513228,-0.0238634,0.85792]]] remoteExec ["setVectorDirAndUp",0];
		[_plane,0] remoteExec ["setFuel",0];
		
		_plane allowDamage true;

		{
			if (_x in _plane) then {

				_x allowDamage true;

			};

		} forEach allUnits;

		sleep 5;


	} forEach OL_planes_crash;



	//*******************************************************
	//             DEBUG
	//*******************************************************
	if ( OL_debugInfo ) then { [format ["Plane Crash: Success"]] remoteExec ["systemChat",0];  };
	
	_count = 60;
	while { (_count > 0 ) || (({alive _x} count OL_planes_crash) > 0) } do {

		_count = _count - 1;
		sleep 1;
	};

	{ _x setDamage 1; } forEach OL_planes_crash;

	{ 	
		detach _x;
		deleteVehicle _x; 

	} forEach _effects + OL_planes_crash;

	OL_planes_crash = [];
	
	//*******************************************************
	//             DEBUG
	//*******************************************************
	if ( OL_debugInfo ) then { [format ["Crash Effects Deleted"]] remoteExec ["systemChat",0];  };
	
};