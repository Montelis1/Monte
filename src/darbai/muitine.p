/*
- Padaryta kad paprastas žaidėjas galėtų susimokėti už muitą jeigu nelegalo neveža.
- Padaryta jeigu veža priekaba cheminės medžiagos uždėtų įtarimą ir praneštų teisėsaugos racijai.
- Padaryta kad 60 sec sulaikytu muitinė kur atvažiuos teisėsaugos darbuotojai praėjus laikui žaidėjas būtų atšaldytas,
- Muitinės vienkartinis mokestis bus 500 Eur o nukeliautų po 250 Eur į abu teisėsaugos fondus.
*/

#include YSI\y_hooks

#define DIALOG_MUITINES_PUNKTAS 12484

//new muiPick = -1;

new muiPrice[MAX_PLAYERS][3];

new muiGates[3];

hook OnGameModeInit()
{
	/*muiPick[1] = CreateDynamicPickup(1274, 14, 137.0085,484.7841,11.8100);
	muiPick[2] = CreateDynamicPickup(1274, 14, 137.0085,484.7841,11.8100);
	muiPick[3] = CreateDynamicPickup(1274, 14, 137.0085,484.7841,11.8100);
	muiPick[4] = CreateDynamicPickup(1274, 14, 137.0085,484.7841,11.8100);
	muiPick[5] = CreateDynamicPickup(1274, 14, 137.0085,484.7841,11.8100);*/
	CreateDynamicObject(8041, -137.56700, 482.04645, 16.41088,   0.00000, 0.00000, 76.00000);
    muiGates[0] = CreateDynamicObject(7657, -138.41110, 482.02301, 12.72112,   0.00000, 0.00000, 165.49010);
    CreateDynamicObject(8041, -410.02402, 1015.41492, 15.40073,   0.00000, 0.00000, -29.47030);
    muiGates[1] = CreateDynamicObject(7657, -410.15668, 1015.53412, 11.73883,   0.00000, 0.00000, 59.06600);
    CreateDynamicObject(7657, -2689.78589, 1271.16125, 56.12040,   0.00000, 0.00000, 0.00000); 
    CreateDynamicObject(7657, -2689.78589, 1271.16125, 56.12040,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(7657, -2689.78589, 1271.16125, 56.12040,   0.00000, 0.00000, 0.00000);
    muiGates[2] = CreateDynamicObject(7657, -2673.05786, 1271.16125, 56.12040,   0.00000, 0.00000, 0.00000);
    return 1; 
}	
	
hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(IsPlayerInAnyVehicle(playerid) && newkeys & KEY_HANDBRAKE)
	{
	      if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 1;
	      if(IsPlayerInRangeOfPoint(playerid, 6.0, -137.1206,484.7988,11.8111) || IsPlayerInRangeOfPoint(playerid, 6.0, -138.3165,479.2136,12.0781)) //#1 muitin�
		  {
		     muiPrice[playerid][0] = 1;
			 ShowPlayerDialogEx(playerid, DIALOG_MUITINES_PUNKTAS, DIALOG_STYLE_MSGBOX, "{669966}Muitin�","{FFFFFF}Ar sumok�site {669966}500 {FFFFFF}Eur u� muitin�s patikrinim�?","Taip","Ne");
			 return 1;
		  }
		  if(IsPlayerInRangeOfPoint(playerid, 6.0, -407.3707,1013.7803,11.0050) || IsPlayerInRangeOfPoint(playerid, 6.0, -412.9119,1017.0519,11.0313)) //#2 muitin�
		  {
		     muiPrice[playerid][1] = 1;
			 ShowPlayerDialogEx(playerid, DIALOG_MUITINES_PUNKTAS, DIALOG_STYLE_MSGBOX, "{669966}Muitin�","{FFFFFF}Ar sumok�site {669966}500 {FFFFFF}Eur u� muitin�s patikrinim�?","Taip","Ne");
			 return 1;
		  }
		  if(IsPlayerInRangeOfPoint(playerid, 6.0, -2676.7788,1268.8588,55.4297) || IsPlayerInRangeOfPoint(playerid, 6.0, -2676.5459,1274.4176,55.4297)) //#3 muitin�
		  {
		     muiPrice[playerid][2] = 1;
			 ShowPlayerDialogEx(playerid, DIALOG_MUITINES_PUNKTAS, DIALOG_STYLE_MSGBOX, "{669966}Muitin�","{FFFFFF}Ar sumok�site {669966}500 {FFFFFF}Eur u� muitin�s patikrinim�?","Taip","Ne");
			 return 1;
		  }
	}
    return 1;
}	

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_MUITINES_PUNKTAS)
	{
	    if(response)
		{
		   if(muiPrice[playerid][0] == 1 || muiPrice[playerid][1] == 1|| muiPrice[playerid][2] == 1)
		   {
		      new vehicleid = GetPlayerVehicleID(playerid);
			  //new trailerid = GetVehicleTrailer(vehicleid);
			  /*if(IsJobVehicle(vehicleid, JOB_TRV) && GetVehicleModel(vehicleid) == 515)
			  {
			     if(NarkaiFuroj[trailerid] == 1 || ChemijaFuroj[trailerid] == 1)
				 {
				    if(muiPrice[playerid][0] == 1) return SetTimerEx("TikrinaFura", 6000, false, "d", playerid);
				    if(muiPrice[playerid][1] == 1) return SetTimerEx("TikrinaFura", 6000, false, "d", playerid);
				    if(muiPrice[playerid][2] == 1) return SetTimerEx("TikrinaFura", 6000, false, "d", playerid);
				    InfoMSG(playerid, "Aptikta nelegalus krovinys, jus sulaikomas 60 sec."); 
					new msg[200];
					format(msg, 200, "{ffff00}[teis�saugos racija]: {ffcc00}Demesio! %s buvo pagautas muitin�s nes jo krovinys nelegalus", GetPlayerNameEx(playerid));
				    ZinuteTeisesauga(BLUE, msg);
				    muiPrice[playerid][0] = -1;
		            muiPrice[playerid][1] = -1;
		            muiPrice[playerid][2] = -1;
		            TogglePlayerControllable(playerid, false);
				 }
				 else 
				 {
				    SetTimerEx("TikrinaM", 6000, false, "d", playerid);
			        InfoMSG(playerid, "Tikriname jus u�truks 60 sec.");
			        TogglePlayerControllable(playerid, false);
				 }
			  }*/
              if(GetVehicleModel(vehicleid))
              {
                 SetTimerEx("TikrinaM", 6000, false, "d", playerid);
			     InfoMSG(playerid, "Tikriname jus u�truks 60 sec.");
			     TogglePlayerControllable(playerid, false);
              }			  
		   }
		}
		else
		{
		   muiPrice[playerid][0] = -1;
		   muiPrice[playerid][1] = -1;
		   muiPrice[playerid][2] = -1;
		   
		}
	}	

    return 1;
}

forward TikrinaFura(playerid);
public TikrinaFura(playerid)
{
    new vehicleid = GetPlayerVehicleID(playerid);
	new trailerid = GetVehicleTrailer(vehicleid);
    //NarkaiFuroj[trailerid] = 0;
	//ChemijaFuroj[trailerid] = 0;
	//muiPrice[playerid] = 0;
	SetVehicleToRespawn(trailerid);
	SetPlayerWantedLevelEx(playerid, zInfo[playerid][zvaigzdutes] + 20);
	SetPlayerColor(playerid, 0x00B8D8AA);
	InfoMSG(playerid, "Rasta nelegali� med�iag� krovinys konfiskuotas");
	InfoMSG(playerid, "Kad ve�ate nelegalias med�iagas gavote 20 �tarim��");
	MoveDynamicObject(muiGates[0], -138.41110, 482.02301, 9.11310, 8, 0.00000, 0.00000, 165.49010);
	SetTimer("ResetMove", 10000, false);
	TogglePlayerControllable(playerid, true);
    return 1;
}

forward TikrinaM(playerid);
public TikrinaM(playerid)
{
    GivePlayerMoneyA(playerid, -500);
    SuccesMSG(playerid, "Susimok�jote muitin�s mokest�, esate �varus galite va�iuoti");
    if(muiPrice[playerid][0] == 1)
    {
       MoveDynamicObject(muiGates[0], -138.41110, 482.02301, 9.11310, 8, 0.00000, 0.00000, 165.49010);
       muiPrice[playerid][0] = -1;
    }
    if(muiPrice[playerid][1] == 1)
    {
       MoveDynamicObject(muiGates[1], -410.15671, 1015.53412, 8.13080, 8, 0.00000, 0.00000, 59.06600);
       muiPrice[playerid][1] = -1;
    }
    if(muiPrice[playerid][2] == 1)
    {
       MoveDynamicObject(muiGates[2], -2673.05786, 1271.16125, 52.51240, 8, 0.00000, 0.00000, 0.00000);
       muiPrice[playerid][2] = -1;
    }
	SetTimer("ResetMove", 10000, false);
	TogglePlayerControllable(playerid, true);
    return 1;
}

forward ResetMove();
public ResetMove()
{
    MoveDynamicObject(muiGates[0], -138.41110, 482.02301, 12.72110, 10, 0.00000, 0.00000, 165.49010);
    MoveDynamicObject(muiGates[1], -410.15671, 1015.53412, 11.73880, 10, 0.00000, 0.00000, 59.06600);
    MoveDynamicObject(muiGates[2], -2673.05786, 1271.16125, 56.12040, 10, 0.00000, 0.00000, 0.00000);
    return 1;
}
