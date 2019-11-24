#include YSI\y_hooks

new g_Money_vr = -1, g_Money_vs = -1, g_Money_tb = -1;

new gaujos_Maisas[MAX_PLAYERS];

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{
	if(pickupid == g_Money_vr)
	{
       new msg[200];
       if (!zInfo[playerid][gaujosID]) return 1;
       if(gaujos_Maisas[playerid] == 1) return SendClientMessage(playerid, RED, "Jûs jau pasiëmete maiðà!");
       format(msg, 200, "{ffff00}[teisësaugos racija]: {ffcc00}Demesio! Gaujai pavyko apiplëðti Vyriausybë ir %s pasiemë 4000€ bet jis yra paþymëtas bëgliu!", GetPlayerNameEx(playerid));
	   ZinuteTeisesauga(BLUE, msg);
	   SendClientMessage(playerid, -1, "{878787}• • • {FFFFFF}Jums pavyko su gauja apiplëðti Vyriausybë ir pasiëmei {878787}4000€ {FFFFFF}pristatykite juos á gaujos pickup");
       SetPlayerAttachedObject(playerid, 2, 11745, 5, 0.299999, 0.099999, 0.000000, 0.000000, -83.000000, 0.000000, 1.000000, 1.000000, 1.000000);
       gaujos_Maisas[playerid] = 1;
       //DestroyPickup(g_Money_vr);
       SetPlayerColor(playerid,0xFFD400AA);
       Pazymetas[playerid] = 1;
	}
	if(pickupid == g_Money_vs)
	{
       new msg[200];
       if (!zInfo[playerid][gaujosID]) return 1;
       if(gaujos_Maisas[playerid] == 2) return SendClientMessage(playerid, RED, "Jûs jau pasiëmete maiðà!");
       format(msg, 200, "{ffff00}[teisësaugos racija]: {ffcc00}Demesio! Gaujai pavyko apiplëðti Vieðbutá ir %s pasiemë 5000€ bet jis yra paþymëtas bëgliu!", GetPlayerNameEx(playerid));
       ZinuteTeisesauga(BLUE, msg);
	   SendClientMessage(playerid, -1, "{878787}• • • {878787}Jums pavyko su gauja apiplëðti Vieðbutá ir pasiëmei {878787}5000€ {FFFFFF}pristatykite juos á gaujos pickup");
       SetPlayerAttachedObject(playerid, 2, 11745, 5, 0.299999, 0.099999, 0.000000, 0.000000, -83.000000, 0.000000, 1.000000, 1.000000, 1.000000);
       gaujos_Maisas[playerid] = 2;
       //DestroyPickup(g_Money_vs);
       SetPlayerColor(playerid,0xFFD400AA);
       Pazymetas[playerid] = 1;

	}
    if(pickupid == g_Money_tb)
	{
       new msg[200];
       if (!zInfo[playerid][gaujosID]) return 1;
       if(gaujos_Maisas[playerid] == 3) return SendClientMessage(playerid, RED, "Jûs jau pasiëmete maiðà!");
       format(msg, 200, "{ffff00}[teisësaugos racija]: {ffcc00}Demesio! Gaujai pavyko apiplëðti WangCars ir %s pasiemë 8000€ bet jis yra paþymëtas bëgliu!", GetPlayerNameEx(playerid));
       ZinuteTeisesauga(BLUE, msg);
	   SendClientMessage(playerid, -1, "{878787}• • • {FFFFFF}Jums pavyko su gauja apiplëðti WangCars ir pasiëmei {878787}8000€ {FFFFFF}pristatykite juos á gaujos pickup");
       SetPlayerAttachedObject(playerid, 2, 11745, 5, 0.299999, 0.099999, 0.000000, 0.000000, -83.000000, 0.000000, 1.000000, 1.000000, 1.000000);
       gaujos_Maisas[playerid] = 3;
       //DestroyPickup(g_Money_tb);
       SetPlayerColor(playerid,0xFFD400AA);
       Pazymetas[playerid] = 1;
	}
	return 1;
}

CMD:plesti(playerid, params[])
{
    new id = zInfo[playerid][gaujosID];
    if(id == 0) return 1;
    if(isPlayerGangLeader(playerid))
	{
       gangPastgrob(playerid);
	}
	else
	{
       if(zInfo[playerid][gPav] != 1) return ErorMSG(playerid, "Jûs ne gaujos pavaduotojas!");
       gangPastgrob(playerid);
	}
	return true;
}

stock gangPastgrob(playerid)
{
       new onT;
	   foreach(Player, ply)
	   {
		  if(!zInfo[ply][AFK_Stat] && !zInfo[ply][Ofisas] && (zInfo[ply][specialybe] == 1 || zInfo[ply][specialybe] == 15)) onT ++;
	   }
	   if(onT < 2) return SendClientMessage(playerid, RED, "Nëra prisijunge ne AFK 2 teisësaugos nariai!");
	   if(IsPlayerInRangeOfPoint(playerid, 1.5, 2300.6121,310.5274,-22.8290))
	   {
          if(GalimaGroPas[playerid][0] == 1) return SendClientMessage(playerid, -1, "Po paskutinio Vyriausybëje apiplëðimo nepraëjo 1 val.!");
          ZinuteTeisesauga(-1,"{ffff00}[teisësaugos racija]: {ffcc00}Dëmesio! Gauja uþgrobë Vyriausybë");
          ZinuteTeisesauga(-1,"{ffff00}[teisësaugos racija]: {ffcc00}Dëmesio! Jos laikymas truks po 4 min. vaþiuokite apginti Vyriausybë!");
	      SendClientMessage(playerid, -1, "{878787}• GAUJA • {FFFFFF}Vyriausybë uþgrobta teks palaukti 4 min...");
		  SendClientMessage(playerid, -1, "{878787}• GAUJA • {FFFFFF}Turite bûti {878787}„Vyriausybëje“{FFFFFF}, atsidurus ligoninei grobimas pralaimëtas");
          //TogglePlayerControllable(playerid, false);
		  GalimaGroPas[playerid][0] = 1;
		  gInfo[playerid][gGrobia] = 1;
	      GrobimasEx[playerid] = SetTimerEx("GaujosVyriausybePlesia", 60000*4, false, "d", playerid);
	      return 1;
	   }
	   if(IsPlayerInRangeOfPoint(playerid, 1.5, -1951.1166,256.2085,35.4739))
	   {
          if(GalimaGroPas[playerid][1] == 1) return SendClientMessage(playerid, -1, "Po paskutinio WangCars apiplëðimo nepraëjo 1 val.!");
          ZinuteTeisesauga(-1,"{ffff00}[teisësaugos racija]: {ffcc00}Dëmesio! Gauja uþgrobë WangCars");
          ZinuteTeisesauga(-1,"{ffff00}[teisësaugos racija]: {ffcc00}Dëmesio! Jos laikymas truks po 8 min. vaþiuokite apginti WangCars!");
	      SendClientMessage(playerid, -1, "{878787}• GAUJA • {FFFFFF}WangCars uþgrobtas teks palaukti 8 min...");
		  SendClientMessage(playerid, -1, "{878787}• GAUJA • {FFFFFF}Turite bûti {878787}„WangCars“{FFFFFF}, atsidurus ligoninei grobimas pralaimëtas");
          //TogglePlayerControllable(playerid, false);
		  GalimaGroPas[playerid][1] = 1;
		  gInfo[playerid][gGrobia] = 1;
		  GrobimasEx[playerid] = SetTimerEx("GaujosTonybetPlesia", 60000*8, false, "d", playerid);
		  return 1;
	   }
       if(IsPlayerInRangeOfPoint(playerid, 1.5, 2228.4299,-1150.5200,1025.7969))
	   {
          if(GalimaGroPas[playerid][2] == 1) return SendClientMessage(playerid, -1, "Po paskutinio Vieðbutyje apiplëðimo nepraëjo 1 val.!");
          ZinuteTeisesauga(-1,"{ffff00}[teisësaugos racija]: {ffcc00}Dëmesio! Gauja uþgrobë Vieðbutá");
          ZinuteTeisesauga(-1,"{ffff00}[teisësaugos racija]: {ffcc00}Dëmesio! Jos laikymas truks po 5 min. vaþiuokite apginti Vieðbutá!");
	      SendClientMessage(playerid, -1, "{878787}• GAUJA • {FFFFFF}Vieðbutis uþgrobtas teks palaukti 5 min...");
		  SendClientMessage(playerid, -1, "{878787}• GAUJA • {FFFFFF}Turite bûti {878787}„Vieðbutyje“{FFFFFF}, atsidurus ligoninei grobimas pralaimëtas");
          //TogglePlayerControllable(playerid, false);
		  GalimaGroPas[playerid][2] = 1;
		  gInfo[playerid][gGrobia] = 1;
		  GrobimasEx[playerid] = SetTimerEx("GaujosViesbutiPlesia", 60000*5, false, "d", playerid);
		  return 1;
	   }
	   return 1;
}

forward GaujosViesbutiPlesia(playerid);
public GaujosViesbutiPlesia(playerid)
{
      switch(random(1))
      {
          case 0:
          {
              SendClientMessage(playerid, -1, "{878787}• GAUJA • {FFFFFF}Pavyko apiplëðti {878787}eikite {FFFFFF}link grobimo {878787}/plesti {FFFFFF}vietos su savu gaujø nariais!");
	          SetPlayerCheckpoint(playerid, 2228.4299,-1150.5200,1025.7969, 2.0);
              g_Money_vs = CreateDynamicPickup(11745, 2, 2228.4299,-1150.5200,1025.7969);
              SetTimerEx("AtstatoTases", 60000*2, false, "d", playerid);
          }
          /*case 1:
          {
              ZinuteTeisesauga(-1, "{ffff00}[teisësaugos racija]: {ffcc00}Demesio! Gaujai nepavyko apiplëðti Vieðbutá!");
              SendClientMessage(playerid, -1, "{878787}• • • {FFFFFF}Jums nepavyko {878787}apiplëðti {FFFFFF}Vieðbutá!");
              gInfo[playerid][gGrobia] = 0;
          }*/
      }
      SetTimer("GalimaGrobtiPastatus", 60000 * 60, true);
	  return 1;
}
forward GaujosTonybetPlesia(playerid);
public GaujosTonybetPlesia(playerid)
{
      switch(random(1))
      {
          case 0:
          {
              SendClientMessage(playerid, -1, "{878787}• GAUJA • {FFFFFF}Pavyko apiplëðti {878787}eikite {FFFFFF}link grobimo {878787}/plesti {FFFFFF}vietos su savu gaujø nariais!");
			  SetPlayerCheckpoint(playerid, -1951.1166,256.2085,35.4739, 2.0);
              g_Money_tb = CreateDynamicPickup(11745, 2, -1951.1166,256.2085,35.4739);
              SetTimerEx("AtstatoTases", 60000*2, false, "d", playerid);
          }
          /*case 1:
          {
              ZinuteTeisesauga(-1, "{ffff00}[teisësaugos racija]: {ffcc00}Demesio! Gaujai nepavyko apiplëðti WangCars!");
              SendClientMessage(playerid, -1, "{878787}• • • {FFFFFF}Jums nepavyko {878787}apiplëðti {FFFFFF}WangCars!");
              gInfo[playerid][gGrobia] = 0;
          }*/
      }
      SetTimer("GalimaGrobtiPastatus", 60000 * 60, true);
	  return 1;
}
forward GaujosVyriausybePlesia(playerid);
public GaujosVyriausybePlesia(playerid)
{
      switch(random(1))
      {
          case 0:
          {
              SendClientMessage(playerid, -1, "{878787}• GAUJA • {FFFFFF}Pavyko apiplëðti {878787}eikite {FFFFFF}link grobimo {878787}/plesti {FFFFFF}vietos su savu gaujø nariais!");
			  gInfo[playerid][gGrobia] = 0;
              SetPlayerCheckpoint(playerid, 2300.6121,310.5274,-22.8290, 2.0);
              g_Money_vr = CreateDynamicPickup(11745, 2, 2300.6121,310.5274,-22.8290);
              SetTimerEx("AtstatoTases", 60000*2, false, "d", playerid);
          }
          /*case 1:
          {
              ZinuteTeisesauga(-1, "{ffff00}[teisësaugos racija]: {ffcc00}Demesio! Gaujai nepavyko apiplëðti Vyriausybës!");
              SendClientMessage(playerid, -1, "{878787}• • • {FFFFFF}Jums nepavyko {878787}apiplëðti {FFFFFF}Vyriausybës!");
              gInfo[playerid][gGrobia] = 0;
          }*/
      }
      SetTimer("GalimaGrobtiPastatus", 60000 * 60, true);
	  return 1;
}
forward AtstatoTases(playerid);
public AtstatoTases(playerid)
{
	DestroyDynamicPickup(g_Money_vs);
	DestroyDynamicPickup(g_Money_vr);
	DestroyDynamicPickup(g_Money_tb);
	return 1;
}
