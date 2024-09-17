if (!hasInterface) exitWith {};
waitUntil {!isNull player};

/*
modifiers, links, and font options
<marker name='marker_name'>text with link</marker>
<img image='Image file name jpeg or paa' />
<font color='#FF0000' size='14' face='vbs2_digital'>Text you want in this font</font>
<br/> New Line

http://www.w3schools.com/colors/colors_picker.asp

////<img image='images\satImage.jpg' width='367' height='256'/> <br/>

https://community.bistudio.com/wikidata/images/archive/0/0e/20140217182059%21Arma3Fonts.png
*/

////////////////////////// BRIEFING //////////////////////////////////////

//player removeDiarySubject "cba_help_docs";


//*******************************************************************
//                       Tertiary Objectives
//*******************************************************************
player createDiaryRecord ["Diary",["Tertiary Objectives",
"
<font color='#FFFFFF' size='14' face='PuristaMedium'>All tertiary objectives are optional.</font>
<br/>
<br/>
<font color='#FFFFFF' size='14' face='PuristaMedium'>- Destroying artillery sites will prevent the enemy from using them on allied forces.</font>
<br/>
<br/>
<br/>
"]];

//*******************************************************************
//                       Secondary Objectives
//*******************************************************************
player createDiaryRecord ["Diary",["Secondary Objectives",
"
<font color='#33ccff' size='18' face='PuristaMedium'>AA Sites:</font>
<br/>
<br/>
<font color='#FFFFFF' size='14' face='PuristaMedium'>All secondary objectives are optional.</font>
<br/>
<br/>
<font color='#FFFFFF' size='14' face='PuristaMedium'>- Intel can be found at all AA sites and will reveal the locations of hidden objectives.</font>
<br/>
<br/>
<font color='#FFFFFF' size='14' face='PuristaMedium'>- Destroying the AA guns at these sites will reduce the chance of respawn planes being shot down.</font>
<br/>
<br/>
<br/>
"]];


//*******************************************************************
//                       Neaville
//*******************************************************************
player createDiaryRecord ["Diary",["Primary Objective #2",
"
<font color='#33ccff' size='18' face='PuristaMedium'>Neaville:</font>
<br/>
<br/>
<font color='#FFFFFF' size='14' face='PuristaMedium'>Charlie Company's primary objective is to capture the town of Neaville in order to prevent the enemy from breaking through to the beach.</font>
<br/>
<br/>
<font color='#33ccff' size='14' face='PuristaMedium'>Objectives:</font>
<br/>
<font color='#FFFFFF' size='14' face='PuristaMedium'>- Clear all enemy forces from city.</font>
<br/>
<font color='#FFFFFF' size='14' face='PuristaMedium'>- Destroy all AA guns (6 in total).</font>
<br/>
<font color='#FFFFFF' size='14' face='PuristaMedium'>- Destroy the radio tower at the church.</font>
<br/>
<br/>
<br/>
"]];




//*******************************************************************
//                       RADAR STATION
//*******************************************************************
player createDiaryRecord ["Diary",["Primary Objective #1",
"
<font color='#33ccff' size='18' face='PuristaMedium'>Radar Station:</font>
<br/>
<br/>
<font color='#FFFFFF' size='14' face='PuristaMedium'>Charlie Company's first primary objective is to secure a radar station located in the vicinity of Neaville.</font>
<br/>
<br/>
<br/>
<font color='#33ccff' size='14' face='PuristaMedium'>NOTE:</font>
<br/>
<br/>
<font color='#FFFFFF' size='14' face='PuristaMedium'>The location of the radar station is unknown. Intel located at the AA Sites will reveal its location.</font>
<br/>
<br/>
<br/>
"]];



//*******************************************************************
//                       MISSION OVERVIEW
//*******************************************************************
player createDiaryRecord ["Diary",["Mission Overview",
"
<font color='#33ccff' size='18' face='PuristaMedium'>D-Day: June 6, 1944</font>
<br/>
<br/>
<font color='#FFFFFF' size='14' face='PuristaMedium'>Charlie Company, 506th Parachute Infantry Regiment, of the 101st Airborne Division is tasked with securing the town of Neaville before Allied forces land at the beaches of Normandy this morning.</font>
<br/>
<br/>
<br/>
"]];































