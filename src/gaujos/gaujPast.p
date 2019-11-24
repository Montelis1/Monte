#include YSI\y_hooks

new g_Money_vr = -1, g_Money_vs = -1, g_Money_tb = -1;

new gaujos_Maisas[MAX_PLAYERS];

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{
	if(pickupid == g_Money_vr)
	{
       new msg[200];
       if (!zInfo[playerid][gaujosID]) return 1;
       if(gaujos_Maisas[playerid] == 1) return SendClientMessage(playerid, RED, "J�s jau pasi�mete mai��!");
       format(msg, 200, "{ffff00}[teis�saugos racija]: {ffcc00}Demesio! Gaujai pavyko apipl��ti Vyriausyb� ir %s pasiem� 4000� bet jis yra pa�ym�tas b�gliu!", GetPlayerNameEx(playerid));
	   ZinuteTeisesauga(BLUE, msg);
	   SendClientMessage(playerid, -1, "{878787}� � � {FFFFFF}Jums pavyko su gauja apipl��ti Vyriausyb� ir pasi�mei {878787}4000� {FFFFFF}pristatykite juos � gaujos pickup");
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
       if(gaujos_Maisas[playerid] == 2) return SendClientMessage(playerid, RED, "J�s jau pasi�mete mai��!");
       format(msg, 200, "{ffff00}[teis�saugos racija]: {ffcc00}Demesio! Gaujai pavyko apipl��ti Vie�but� ir %s pasiem� 5000� bet jis yra pa�ym�tas b�gliu!", GetPlayerNameEx(playerid));
       ZinuteTeisesauga(BLUE, msg);
	   SendClientMessage(playerid, -1, "{878787}� � � {878787}Jums pavyko su gauja apipl��ti Vie�but� ir pasi�mei {878787}5000� {FFFFFF}pristatykite juos � gaujos pickup");
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
       if(gaujos_Maisas[playerid] == 3) return SendClientMessage(playerid, RED, "J�s jau pasi�mete mai��!");
       format(msg, 200, "{ffff00}[teis�saugos racija]: {ffcc00}Demesio! Gaujai pavyko apipl��ti WangCars ir %s pasiem� 8000� bet jis yra pa�ym�tas b�gliu!", GetPlayerNameEx(playerid));
       ZinuteTeisesauga(BLUE, msg);
	   SendClientMessage(playerid, -1, "{878787}� � � {FFFFFF}Jums pavyko su gauja apipl��ti WangCars ir pasi�mei {878787}8000� {FFFFFF}pristatykite juos � gaujos pickup");
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
       if(zInfo[playerid][gPav] != 1) return ErorMSG(playerid, "J�s ne gaujos pavaduotojas!");
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
	   if(onT < 2) return SendClientMessage(playerid, RED, "N�ra prisijunge ne AFK 2 teis�saugos nariai!");
	   if(IsPlayerInRangeOfPoint(playerid, 1.5, 2300.6121,310.5274,-22.8290))
	   {
          if(GalimaGroPas[playerid][0] == 1) return SendClientMessage(playerid, -1, "Po paskutinio Vyriausyb�je apipl��imo nepra�jo 1 val.!");
          ZinuteTeisesauga(-1,"{ffff00}[teis�saugos racija]: {ffcc00}D�mesio! Gauja u�grob� Vyriausyb�");
          ZinuteTeisesauga(-1,"{ffff00}[teis�saugos racija]: {ffcc00}D�mesio! Jos laikymas truks po 4 min. va�iuokite apginti Vyriausyb�!");
	      SendClientMessage(playerid, -1, "{878787}� GAUJA � {FFFFFF}Vyriausyb� u�grobta teks palaukti 4 min...");
		  SendClientMessage(playerid, -1, "{878787}� GAUJA � {FFFFFF}Turite b�ti {878787}�Vyriausyb�je�{FFFFFF}, atsidurus ligoninei grobimas pralaim�tas");
          //TogglePlayerControllable(playerid, false);
		  GalimaGroPas[playerid][0] = 1;
		  gInfo[playerid][gGrobia] = 1;
	      GrobimasEx[playerid] = SetTimerEx("GaujosVyriausybePlesia", 60000*4, false, "d", playerid);
	      return 1;
	   }
	   if(IsPlayerInRangeOfPoint(playerid, 1.5, -1951.1166,256.2085,35.4739))
	   {
          if(GalimaGroPas[playerid][1] == 1) return SendClientMessage(playerid, -1, "Po paskutinio WangCars apipl��imo nepra�jo 1 val.!");
          ZinuteTeisesauga(-1,"{ffff00}[teis�saugos racija]: {ffcc00}D�mesio! Gauja u�grob� WangCars");
          ZinuteTeisesauga(-1,"{ffff00}[teis�saugos racija]: {ffcc00}D�mesio! Jos laikymas truks po 8 min. va�iuokite apginti WangCars!");
	      SendClientMessage(playerid, -1, "{878787}� GAUJA � {FFFFFF}WangCars u�grobtas teks palaukti 8 min...");
		  SendClientMessage(playerid, -1, "{878787}� GAUJA � {FFFFFF}Turite b�ti {878787}�WangCars�{FFFFFF}, atsidurus ligoninei grobimas pralaim�tas");
          //TogglePlayerControllable(playerid, false);
		  GalimaGroPas[playerid][1] = 1;
		  gInfo[playerid][gGrobia] = 1;
		  GrobimasEx[playerid] = SetTimerEx("GaujosTonybetPlesia", 60000*8, false, "d", playerid);
		  return 1;
	   }
       if(IsPlayerInRangeOfPoint(playerid, 1.5, 2228.4299,-1150.5200,1025.7969))
	   {
          if(GalimaGroPas[playerid][2] == 1) return SendClientMessage(playerid, -1, "Po paskutinio Vie�butyje apipl��imo nepra�jo 1 val.!");
          ZinuteTeisesauga(-1,"{ffff00}[teis�saugos racija]: {ffcc00}D�mesio! Gauja u�grob� Vie�but�");
          ZinuteTeisesauga(-1,"{ffff00}[teis�saugos racija]: {ffcc00}D�mesio! Jos laikymas truks po 5 min. va�iuokite apginti Vie�but�!");
	      SendClientMessage(playerid, -1, "{878787}� GAUJA � {FFFFFF}Vie�butis u�grobtas teks palaukti 5 min...");
		  SendClientMessage(playerid, -1, "{878787}� GAUJA � {FFFFFF}Turite b�ti {878787}�Vie�butyje�{FFFFFF}, atsidurus ligoninei grobimas pralaim�tas");
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
              SendClientMessage(playerid, -1, "{878787}� GAUJA � {FFFFFF}Pavyko apipl��ti {878787}eikite {FFFFFF}link grobimo {878787}/plesti {FFFFFF}vietos su savu gauj� nariais!");
	          SetPlayerCheckpoint(playerid, 2228.4299,-1150.5200,1025.7969, 2.0);
              g_Money_vs = CreateDynamicPickup(11745, 2, 2228.4299,-1150.5200,1025.7969);
              SetTimerEx("AtstatoTases", 60000*2, false, "d", playerid);
          }
          /*case 1:
          {
              ZinuteTeisesauga(-1, "{ffff00}[teis�saugos racija]: {ffcc00}Demesio! Gaujai nepavyko apipl��ti Vie�but�!");
              SendClientMessage(playerid, -1, "{878787}� � � {FFFFFF}Jums nepavyko {878787}apipl��ti {FFFFFF}Vie�but�!");
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
              SendClientMessage(playerid, -1, "{878787}� GAUJA � {FFFFFF}Pavyko apipl��ti {878787}eikite {FFFFFF}link grobimo {878787}/plesti {FFFFFF}vietos su savu gauj� nariais!");
			  SetPlayerCheckpoint(playerid, -1951.1166,256.2085,35.4739, 2.0);
              g_Money_tb = CreateDynamicPickup(11745, 2, -1951.1166,256.2085,35.4739);
              SetTimerEx("AtstatoTases", 60000*2, false, "d", playerid);
          }
          /*case 1:
          {
              ZinuteTeisesauga(-1, "{ffff00}[teis�saugos racija]: {ffcc00}Demesio! Gaujai nepavyko apipl��ti WangCars!");
              SendClientMessage(playerid, -1, "{878787}� � � {FFFFFF}Jums nepavyko {878787}apipl��ti {FFFFFF}WangCars!");
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
              SendClientMessage(playerid, -1, "{878787}� GAUJA � {FFFFFF}Pavyko apipl��ti {878787}eikite {FFFFFF}link grobimo {878787}/plesti {FFFFFF}vietos su savu gauj� nariais!");
			  gInfo[playerid][gGrobia] = 0;
              SetPlayerCheckpoint(playerid, 2300.6121,310.5274,-22.8290, 2.0);
              g_Money_vr = CreateDynamicPickup(11745, 2, 2300.6121,310.5274,-22.8290);
              SetTimerEx("AtstatoTases", 60000*2, false, "d", playerid);
          }
          /*case 1:
          {
              ZinuteTeisesauga(-1, "{ffff00}[teis�saugos racija]: {ffcc00}Demesio! Gaujai nepavyko apipl��ti Vyriausyb�s!");
              SendClientMessage(playerid, -1, "{878787}� � � {FFFFFF}Jums nepavyko {878787}apipl��ti {FFFFFF}Vyriausyb�s!");
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
