/*

 [[],OL_end_lose] remoteExec ["spawn",0];

*/





if ( ["isInitialized"] call BIS_fnc_jukebox ) then {
	["terminate"] call BIS_fnc_jukebox;
	playMusic "";
};




sleep 4;


playMusic "IFtrack07";


sleep 4;


//*************************************************************
//           FADE BLACK
//*************************************************************

[["","BLACK IN",4]] remoteExec ["cutText", 0];



_camera = "camera" camCreate [2785.41,2494.66,5.01413];
_camera cameraEffect ["Internal","back"];
camUseNVG false;
showCinemaBorder false;





_camera camPrepareTarget [2615.42,2512.87,15.1831];
_camera camPreparePos [2785.41,2494.66,5.01413];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 0;



// CHURCH
waitUntil { (camCommitted _camera) || !(alive _camera)};

_camera camPrepareTarget [2615.42,2512.87,15.1831];
_camera camPreparePos [2654.05,2524.56,14.3436];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;


// INTERSECTION
waitUntil { (camCommitted _camera) || !(alive _camera)};

_camera camPrepareTarget [2526.58,2552.1,2.33432];
_camera camPreparePos [2562.28,2547.54,2.15077];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 10;


// REVERSE
waitUntil { (camCommitted _camera) || !(alive _camera)};

_camera camPrepareTarget [2564.06,2560.81,2.15077];
_camera camPreparePos [2543.29,2502.26,2.31462];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 8;


waitUntil { (camCommitted _camera) || !(alive _camera)};

_camera camPrepareTarget [2543.29,2502.26,2.31462];
_camera camPreparePos [2525.01,2463.71,9.54417];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 5;



waitUntil { (camCommitted _camera) || !(alive _camera)};


_camera camPrepareTarget [2614.94,2512.84,16.1811];
_camera camPreparePos [2536.12,2398.36,32.3539];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 8;



waitUntil { (camCommitted _camera) || !(alive _camera)};


_camera camPrepareTarget [2614.94,2512.84,16.1811];
_camera camPreparePos [2735.84,2437.54,69.703];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 15;



waitUntil { (camCommitted _camera) || !(alive _camera)};


_camera camPrepareTarget [2614.94,2512.84,16.1811];
_camera camPreparePos [2646.34,2762.97,75.6808];
_camera camPrepareFOV 0.700;
_camera camCommitPrepared 20;


sleep 10;
//*************************************************************
//           FADE BLACK
//*************************************************************

[5,0] remoteExec ["fadeMusic",0];

sleep 5;

["defenseLose", false, 3, false, true] remoteExec ["BIS_fnc_endMission", 0, true];


