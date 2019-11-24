/*
Padaryta mechanikams kad su forklifu galëtø ruðiuoti detales interjere tai:
- Paprastø maðinø detales
- Motociklø detales
- Sportiniø maðinø detales

Padaryta mechanikams kai iðkrauni detales iðkrautø ant dezes tai
- Rodytø bûtø atskiras kintamasis kiek iðviso atveþta detaliø
*/

#include YSI\y_hooks

#define DIALOG_RUSIAVIMAS 99

new Text3D:MechDez; new Text3D:MechDezP; new Text3D:MechDezM; new Text3D:MechDezS; new mechPIC = -1;

new mechCP[MAX_PLAYERS][3];

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{
	if(pickupid == mechPIC)
	{
	   /*new vehicleid = GetPlayerVehicleID(playerid);
	   new m = GetVehicleModel(vehicleid);
	   if(m != 530) return 0;
	   if(zInfo[playerid][specialybe] != 3) return ErorMSG(playerid, "Rûðiuoti galima tik dirbant mechanikø darbà!");
	   ShowPlayerDialogEx(playerid, DIALOG_RUSIAVIMAS, DIALOG_STYLE_LIST, "{FFFFFF}Detaliø rûðiavimas","{3FB0DB}• {FFFFFF}Paprastos detalës\n{3FB0DB}• {FFFFFF}Moto detalës\n{3FB0DB}• {FFFFFF}Sportinës detalës","Pasikrauti","Atðaukti");*/
	}
	return 1;
}

hook OnGameModeInit()
{
    new mechdez[250], mechdezp[59], mechdezm[61], mechdezs[60];
    format(mechdez, sizeof(mechdez), "{FFFFFF}Ið viso nerûðiuotø detaliø yra: {ff9966}%d\n{FFFFFF}Norëdami pasikrauti raðykite /pasdez\n{FFFFFF}Norëdami iðkrauti detales raðykite /iskrauti\n{FFFFFF}Norëdami patalpinti transportà á KMA raðykite /prdk", ISDalys);
    MechDez = Create3DTextLabel(mechdez, 0xFFFFFFFF, -1527.0287,2634.0234,55.8817, 40.0, 0, 0);
    
    format(mechdezp, sizeof(mechdezp), "{FFFFFF}Ið viso surûðiuotø paprastø detaliø yra: {ff9966}%d", PADalys);
    MechDezP = Create3DTextLabel(mechdezp, 0xFFFFFFFF, 144.7844,1235.8228,328.9380, 40.0, 0, 0);
    
    format(mechdezm, sizeof(mechdezm), "{FFFFFF}Ið viso surûðiuotø motociklø detaliø yra: {ff9966}%d", MDalys);
    MechDezM = Create3DTextLabel(mechdezm, 0xFFFFFFFF, 155.4125,1232.4441,328.9380, 40.0, 0, 0);
    
    format(mechdezs, sizeof(mechdezs), "{FFFFFF}Ið viso surûðiuotø sportiniø detaliø yra: {ff9966}%d", SADalys);
    MechDezS = Create3DTextLabel(mechdezs, 0xFFFFFFFF, 156.2295,1238.0096,328.9380, 40.0, 0, 0);
    mechPIC = CreateDynamicPickup(2972, 14, -1527.0287,2634.0234,55.8817);
    return 1;
}

hook OnPlayerSpawn(playerid)
{
    DestroyDynamicObject(Forklifas[playerid]);
	mechCP[playerid][0] = 0;
	mechCP[playerid][1] = 0;
	mechCP[playerid][2] = 0;
	return 1;
}

hook OnPlayerDisconnect(playerid)
{
	DestroyDynamicObject(Forklifas[playerid]);
	mechCP[playerid][0] = 0;
	mechCP[playerid][1] = 0;
	mechCP[playerid][2] = 0;
	return 1;
}

hook OnVehicleSpawn(vehicleid)
{
    DestroyDynamicObject(Forklifas[vehicleid]);
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_RUSIAVIMAS)
	{
		if(response)
		{
			 switch(listitem)
			 {
				 case 0: //Paprastos detales
				 {
					if(ISDalys == 0) return ErorMSG(playerid, "Nëra atveþtø nerûðiuotø detaliø!");
                    SetTimerEx("PakraunaForklifaP", 10*30, false, "d", playerid);
	                SuccesMSG(playerid, "Kraunama paprastø detaliø dëþë palaukite 30 sek...");
	                TogglePlayerControllable(playerid, false);
				 }
				 case 1: //Moto detales
				 {
                    if(ISDalys == 0) return ErorMSG(playerid, "Nëra atveþtø nerûðiuotø detaliø!");
                    SetTimerEx("PakraunaForklifaM", 10*30, false, "d", playerid);
	                SuccesMSG(playerid, "Kraunama moto detaliø dëþë palaukite 30 sek...");
	                TogglePlayerControllable(playerid, false);
				 }
				 case 2: //Sportines detales
				 {
                    if(ISDalys == 0) return ErorMSG(playerid, "Nëra atveþtø nerûðiuotø detaliø!");
                    SetTimerEx("PakraunaForklifaS", 10*30, false, "d", playerid);
	                SuccesMSG(playerid, "Kraunama sportiniø detaliø dëþë palaukite 30 sek...");
	                TogglePlayerControllable(playerid, false);
				 }
			 }
		}
	}
	return 1;
}

forward PakraunaForklifaP(playerid);
public PakraunaForklifaP(playerid)
{
    Forklifas[playerid] = CreateDynamicObject( 2972,0,0,0,0,0,0,80 );
    AttachDynamicObjectToVehicle(Forklifas[playerid], GetPlayerVehicleID(playerid), -0.004999, 0.589999, -0.144999, 0.000000, 0.000000, 0.000000);
    SuccesMSG(playerid, "Paprastos detalës pakrautos vaþiuokite á CP");
    SetPlayerCheckpointEx(playerid, 39, -1522.4504,2580.5464,55.8359, 4.0);
    mechCP[playerid][0] = 1;
    TogglePlayerControllable(playerid, true);
    return 1;
}
forward PakraunaForklifaM(playerid);
public PakraunaForklifaM(playerid)
{
    Forklifas[playerid] = CreateDynamicObject( 2972,0,0,0,0,0,0,80 );
    AttachDynamicObjectToVehicle(Forklifas[playerid], GetPlayerVehicleID(playerid), -0.004999, 0.589999, -0.144999, 0.000000, 0.000000, 0.000000);
    SuccesMSG(playerid, "Moto detalës pakrautos vaþiuokite á CP");
    SetPlayerCheckpointEx(playerid, 41, -1522.4504,2580.5464,55.8359, 4.0);
    mechCP[playerid][1] = 1;
    TogglePlayerControllable(playerid, true);
    return 1;
}
forward PakraunaForklifaS(playerid);
public PakraunaForklifaS(playerid)
{
    Forklifas[playerid] = CreateDynamicObject( 2972,0,0,0,0,0,0,80 );
    AttachDynamicObjectToVehicle(Forklifas[playerid], GetPlayerVehicleID(playerid), -0.004999, 0.589999, -0.144999, 0.000000, 0.000000, 0.000000);
    SuccesMSG(playerid, "Sportinës detalës pakrautos vaþiuokite á CP");
    SetPlayerCheckpointEx(playerid, 43, -1522.4504,2580.5464,55.8359, 4.0);
    mechCP[playerid][2] = 1;
    TogglePlayerControllable(playerid, true);
    return 1;
}
/*
CMD:pasdez(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 7.0, -1527.0287,2634.0234,55.8817))
	{
        new vehicleid = GetPlayerVehicleID(playerid);
        new m = GetVehicleModel(vehicleid);
        if(m != 530) return 0;
        if(zInfo[playerid][specialybe] != 3) return ErorMSG(playerid, "Rûðiuoti galima tik dirbant mechanikø darbà!");
        ShowPlayerDialogEx(playerid, DIALOG_RUSIAVIMAS, DIALOG_STYLE_LIST, "{FFFFFF}Detaliø rûðiavimas","{3FB0DB}• {FFFFFF}Paprastos detalës\n{3FB0DB}• {FFFFFF}Moto detalës\n{3FB0DB}• {FFFFFF}Sportinës detalës","Pasikrauti","Atðaukti");
	}
	return 1;
}
*/
