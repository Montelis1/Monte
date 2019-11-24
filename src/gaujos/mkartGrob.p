
#define isPlayerInMkart(%0) (IsPlayerInAreaEx(%0, 916.6, 2050.6, 999.6, 2181.6))

//#define PDG_SLOT 9
//#define PDG_TIME 600

#include YSI\y_hooks

new 
	gGrobiaMkart = -1,
	gMK_time,
	gMK_canGrob,
	kG_imaGun[4] = -1,
	Text3D:kG_ima3D[4],
	gunZone,
	gangCar[4],
	gangGate[2],
	carPak[MAX_PLAYERS],
	carBag[MAX_VEHICLES],

	bool: gMK_pack[MAX_PLAYERS]
;

new Text3D:gangCar3d[MAX_VEHICLES][4];

check_grobMK ()
{
	if (gGrobiaMkart == -1) return 1;

	new kiekGauj;
	foreach(Player, playerid)
	{
		if (isPlayerInMkart(playerid) && zInfo[playerid][gaujosID] == gGrobiaMkart) kiekGauj ++;
	}

	if (!kiekGauj)
	{
		foreach(Player, playerid)
		{ 
			if (zInfo[playerid][gaujosID] == gGrobiaMkart) SendClientMessage(playerid, RED, "Sandelio grobimas nepavyko.");
			//else if (zInfo[playerid][specialybe] == JOB_MKART) SendClientMessage(playerid, GREEN, "Bazë apginta, grobimas nepavyko.");
		}

		gGrobiaMkart = -1;
		gMK_time = 0;
		gMK_canGrob = gettime() + 900;
		GangZoneHideForAll(gunZone);
		return 1;
	}

	gMK_time ++;

	if (gMK_time >= PDG_TIME)
	{
		foreach(Player, playerid)
		{ 
			if (zInfo[playerid][gaujosID] == gGrobiaMkart) SendClientMessage(playerid, GREEN, "Ginklø sandelys iðlaikytas, atsirakino ginklø paketai."), SetPlayerCheckpoint(playerid, 938.6149,2059.2180,10.8203, 2.0);
			//else if (zInfo[playerid][specialybe] == JOB_MKART) SendClientMessage(playerid, RED, "Bazës apginti nepavyko, skubëkite nuðauti gaujinius");
		}

		//kG_imaGun = gGrobiaMkart;
		SetTimer("resetKGIMAGUN", 60000*15, false);
		CreateExplosion(977.67719, 2073.26636, 11.79340, 11, 3.0);
		MoveDynamicObject(gangGate[0], 977.67719, 2073.26636, 9.86420, 8,  -84.00000, 0.00000, 69.00000);
		kG_imaGun[0] = CreatePickup(2969, 1, 938.6149,2059.2180,10.8203);
		kG_ima3D[0] = Create3DTextLabel("{878787}» {FFFFFF}Ðiame pakete yra:\n Desert Eagle\n Shotgun\nMP5", COLOR_ORANGEX, 938.6149,2059.2180,10.8203, 50.0, 0, 0);
        kG_imaGun[1] = CreatePickup(2969, 1, 941.9501,2083.2371,10.8203);
        kG_ima3D[1] = Create3DTextLabel("{878787}» {FFFFFF}Ðiame pakete yra:\n Desert Eagle\n Shotgun\nMP5", COLOR_ORANGEX, 941.9501,2083.2371,10.8203, 50.0, 0, 0);
        kG_imaGun[2] = CreatePickup(2969, 1, 966.7886,2057.6316,10.8203);
        kG_ima3D[2] = Create3DTextLabel("{878787}» {FFFFFF}Ðiame pakete yra:\n Desert Eagle\n Shotgun\nMP5", COLOR_ORANGEX, 966.7886,2057.6316,10.8203, 50.0, 0, 0);
        kG_imaGun[3] = CreatePickup(2969, 1, 974.2227,2071.5986,10.8203);
        kG_ima3D[3] = Create3DTextLabel("{878787}» {FFFFFF}Ðiame pakete yra:\n Desert Eagle\n Shotgun\nMP5", COLOR_ORANGEX, 974.2227,2071.5986,10.8203, 50.0, 0, 0);
		gGrobiaMkart = -1;
		gMK_time = 0;
		gMK_canGrob = gettime() + 900;
		GangZoneHideForAll(gunZone);
		return 1;

	}

	new zx[20];
	format(zx, sizeof zx, "UZGROBTA : %d %%", gMK_time*100/PDG_TIME);

	foreach(Player, playerid)
	{
		if (isPlayerInMkart(playerid)) GameTextForPlayer(playerid, zx, 1100, 4);
	}

	return 1;
}

perf_gunPickup(playerid)
{
	//if (kG_imaGun == -1) return 1;
	//if (kG_imaGun != zInfo[playerid][gaujosID]) return SendClientMessage(playerid, RED, "Ne tavo gaujà uþgrobë kartelá"), 0;
	if (gMK_pack[playerid]) return SendClientMessage(playerid, RED, "Jau turi ginklø paketà"), 0;
	if (DyleriaiGun < 1) return SendClientMessage(playerid, RED, "Sandelyje nebëra ginklø paketø."), 0;

	SetPlayerAttachedObject(playerid, PDG_SLOT, 2969, 1, -0.048999, -0.142999, -0.036999, 94.999977, 0.000000, 0.000000);
	gMK_pack[playerid] = true;
	SendClientMessage(playerid, GREEN, "Pasiemei paketà, padëk á sandelio transportà.");
	gInfo[zInfo[playerid][gaujosID]][GaujosP] = 0;
	//DestroyPickup(kG_imaGun);
	DyleriaiGun --;
	return 1;
}

forward resetKGIMAGUN();
public resetKGIMAGUN()
{
	kG_imaGun[0] = -1;
	kG_imaGun[1] = -1;
	kG_imaGun[2] = -1;
	kG_imaGun[3] = -1;
	DestroyPickup(kG_imaGun[0]);
	DestroyPickup(kG_imaGun[1]);
	DestroyPickup(kG_imaGun[2]);
	DestroyPickup(kG_imaGun[3]);
	Delete3DTextLabel(kG_ima3D[0]);
	Delete3DTextLabel(kG_ima3D[1]);
	Delete3DTextLabel(kG_ima3D[2]);
	Delete3DTextLabel(kG_ima3D[3]);
	MoveDynamicObject(gangGate[0], 977.67719, 2073.26636, 11.79340, 10, 0.00000, 0.00000, 90.00000);
	return 1;
}


hook OnPlayerPickUpPickup(playerid, pickupid)
{
//gInfo[MAX_GANGS][GaujosPUP];

	if (!zInfo[playerid][gaujosID]) return 1;
	//if (!gMK_pack[playerid]) return 1;

	if(pickupid == kG_imaGun[0] || pickupid == kG_imaGun[1] || pickupid == kG_imaGun[2] || pickupid == kG_imaGun[3])
	{
		//SetPlayerCheckpoint(playerid, 971.2847, 2097.6350, 10.8211, 4.0);
        perf_gunPickup(playerid);
		zInfo[playerid][gunbox] = true;
	}

	/*if (pickupid == gInfo[zInfo[playerid][gaujosID]][GaujosPUP])
	{
	    if(gMK_pack[playerid] == true)
	    {
		   gInfo[zInfo[playerid][gaujosID]][gPak] += 3;
		   new zx[60];
		   format (zx, sizeof zx, "UPDATE gangs SET gpak = '%d' WHERE gId = '%d'", gInfo[zInfo[playerid][gaujosID]][gPak], zInfo[playerid][gaujosID]);
		   mysql_query (zx);

		   RemovePlayerAttachedObject(playerid, PDG_SLOT);
		   gMK_pack[playerid] = false;
		   SendClientMessage(playerid, GREEN, "Sëkmingai padëjai kelis paketus á gaujos sandelá. Ginklø gali pasiimti su komanda /gginklai.");
		}
	}*/

	return 1;
}
hook OnPlayerDeath(playerid, killerid, reason)
{
	if (playerid != INVALID_PLAYER_ID)
	{
		if (gMK_pack[playerid])
		{
			return RemovePlayerAttachedObject(playerid, PDG_SLOT), gMK_pack[zInfo[playerid][gaujosID]] = false;
		}
	}
	return 1;
}

hook OnGameModeInit()
{
    new scGame;
    gangGate[0] = CreateDynamicObject(3055, 977.67719, 2073.26636, 11.79340,   0.00000, 0.00000, 90.00000);
    scGame = CreateDynamicObject(7914, 977.69214, 2070.60815, 17.37844,   0.00000, 0.00000, 90.09900);
    SetDynamicObjectMaterialText(scGame, 0, "{ffffff}Ginklø sandëlis", 130, "Ariel", 35, 1, 0xFFFFFFFF, 0x00000000, 1);
    gangGate[1] = CreateDynamicObject(7657, 997.12726, 2133.21655, 11.55200,   0.00000, 0.00000, 90.09900);
    scGame = CreateDynamicObject(7914, 977.74609, 2066.19165, 17.91734,   0.00000, 0.00000, 90.09900);
    SetDynamicObjectMaterialText(scGame, 0, "{ffffff}3", 90, "GTAWEAPON3", 55, 0, -256, 0x00000000, 1);
	
    gangCar[0] = AddVehicle(498, 971.2847, 2097.6350, 10.8211, -90.0066, -1, -1, 600, VT_GANGCAR, 0);
    gangCar[1] = AddVehicle(498, 971.2847, 2109.1150, 10.8211, -90.0066, -1, -1, 600, VT_GANGCAR, 1);
    gangCar[2] = AddVehicle(498, 971.2847, 2119.6111, 10.8211, -90.0066, -1, -1, 600, VT_GANGCAR, 2);
    gangCar[3] = AddVehicle(498, 971.2847, 2139.6189, 10.8211, -90.0066, -1, -1, 600, VT_GANGCAR, 3);
	
	new gunText3Dcar[70][4];
	format(gunText3Dcar[0], 70, "{878787}• G • {FFFFFF}Transporte yra {878787}%d {FFFFFF}ginklø paketø", carBag[gangCar[0]]);
	gangCar3d[gangCar[0]][0] = Create3DTextLabel(gunText3Dcar[0], COLOR_ORANGEX, 971.2847, 2097.6350, 10.8211, 50.0, 0, 0);
	Attach3DTextLabelToVehicle(gangCar3d[gangCar[0]][0], gangCar[0], 0.0, 0.0, 1.0);
	
	format(gunText3Dcar[1], 70, "{878787}• G • {FFFFFF}Transporte yra {878787}%d {FFFFFF}ginklø paketø", DyleriaiGun);
	gangCar3d[gangCar[1]][1] = Create3DTextLabel(gunText3Dcar[1], COLOR_ORANGEX, 971.2847, 2109.1150, 10.8211, 50.0, 0, 0);
	Attach3DTextLabelToVehicle(gangCar3d[gangCar[1]][1], gangCar[1], 0.0, 0.0, 1.0);
	
	format(gunText3Dcar[2], 70, "{878787}• G • {FFFFFF}Transporte yra {878787}%d {FFFFFF}ginklø paketø", DyleriaiGun);
	gangCar3d[gangCar[2]][2] = Create3DTextLabel(gunText3Dcar[2], COLOR_ORANGEX, 971.2847, 2119.6111, 10.8211, 50.0, 0, 0);
	Attach3DTextLabelToVehicle(gangCar3d[gangCar[2]][2], gangCar[2], 0.0, 0.0, 1.0);
	
	format(gunText3Dcar[3], 70, "{878787}• G • {FFFFFF}Transporte yra {878787}%d {FFFFFF}ginklø paketø", DyleriaiGun);
	gangCar3d[gangCar[3]][3] = Create3DTextLabel(gunText3Dcar[3], COLOR_ORANGEX, 971.2847, 2139.6189, 10.8211, 50.0, 0, 0);
	Attach3DTextLabelToVehicle(gangCar3d[gangCar[3]][3], gangCar[3], 0.0, 0.0, 1.0);
	return 1;
}

hook OnPlayerConnect(playerid)
{
	gMK_pack[playerid] = false;
	RemoveBuildingForPlayer(playerid, 3474, 978.2891, 2094.9922, 16.7422, 0.25);
	return 1;
}

hook OnVehicleSpawn(vehicleid)
{
    new m = GetVehicleModel(vehicleid);
    if(vInd[vehicleid][vehType] == VT_GANGCAR && m == 498)
	{
       carBag[vehicleid] = 0;
	   new gunText3Dcar[70];
	   format(gunText3Dcar, 70, "{878787}• G • {FFFFFF}Transporte yra {878787}%d {FFFFFF}ginklø paketø", carBag[vehicleid]);
	
	   if(vehicleid == gangCar[0]) Update3DTextLabelText(gangCar3d[vehicleid][0], -1, gunText3Dcar);
	   else if(vehicleid == gangCar[1]) Update3DTextLabelText(gangCar3d[vehicleid][1], -1, gunText3Dcar);
	   else if(vehicleid == gangCar[2]) Update3DTextLabelText(gangCar3d[vehicleid][2], -1, gunText3Dcar);
	   else if(vehicleid == gangCar[3]) Update3DTextLabelText(gangCar3d[vehicleid][3], -1, gunText3Dcar);
	}
    return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_YES)
	{
       if(zInfo[playerid][gunbox] == true)
	   {
	      new Float:gunX, Float:gunY, Float:gunZ;
		  new Float:gunXa, Float:gunYa, Float:gunZa;
		  new Float:gunXb, Float:gunYb, Float:gunZb;
		  new Float:gunXc, Float:gunYc, Float:gunZc;
	      GetVehiclePos(gangCar[0], gunX, gunY, gunZ);
		  GetVehiclePos(gangCar[1], gunXa, gunYa, gunZa);
		  GetVehiclePos(gangCar[2], gunXb, gunYb, gunZb);
		  GetVehiclePos(gangCar[3], gunXc, gunYc, gunZc);
	      if(IsPlayerInRangeOfPoint(playerid, 4.3, gunX, gunY-3, gunZ)) return carPak[playerid] = 0;
		  else if(IsPlayerInRangeOfPoint(playerid, 4.3, gunXa, gunYa-3, gunZa)) return carPak[playerid] = 1;
		  else if(IsPlayerInRangeOfPoint(playerid, 4.3, gunXb, gunYb-3, gunZb)) return carPak[playerid] = 2;
		  else if(IsPlayerInRangeOfPoint(playerid, 4.3, gunXc, gunYc-3, gunZc)) return carPak[playerid] = 3;
		  new gunText3Dcar[70][4];
	      if(carPak[playerid] == 0)
	      {
		     if(carBag[gangCar[0]] < 30)
		     {
		        carBag[gangCar[0]] ++;
		        SendClientMessage(playerid, GREEN, "Paketà sëkmingai padëjote á sandëlio transportà");
	            format(gunText3Dcar[0], 70, "{878787}• G • {FFFFFF}Transporte yra {878787}%d {FFFFFF}ginklø paketø", carBag[gangCar[0]]);
				Update3DTextLabelText(gangCar3d[gangCar[0]][0], COLOR_ORANGEX, gunText3Dcar[0]);
			    carPak[playerid] = -1;
			    DisablePlayerCheckpoint(playerid);
			    zInfo[playerid][gunbox] = false;
				RemovePlayerAttachedObject(playerid, PDG_SLOT);
		        gMK_pack[playerid] = false;
		     }
			 else SendClientMessage(playerid, RED, "Transporte telpa tik 30 paketø!");
	      }
		  if(carPak[playerid] == 1)
	      {
		     if(carBag[gangCar[1]] < 30)
		     {
		        carBag[gangCar[1]] ++;
		        SendClientMessage(playerid, GREEN, "Paketà sëkmingai padëjote á sandëlio transportà");
	            format(gunText3Dcar[1], 70, "{878787}• G • {FFFFFF}Transporte yra {878787}%d {FFFFFF}ginklø paketø", carBag[gangCar[1]]);
				Update3DTextLabelText(gangCar3d[gangCar[1]][1], COLOR_ORANGEX, gunText3Dcar[1]);
			    carPak[playerid] = -1;
			    DisablePlayerCheckpoint(playerid);
			    zInfo[playerid][gunbox] = false;
				RemovePlayerAttachedObject(playerid, PDG_SLOT);
		        gMK_pack[playerid] = false;
		     }
			 else SendClientMessage(playerid, RED, "Transporte telpa tik 30 paketø!");
	      }
		  if(carPak[playerid] == 2)
	      {
		     if(carBag[gangCar[2]] < 30)
		     {
		        carBag[gangCar[2]] ++;
		        SendClientMessage(playerid, GREEN, "Paketà sëkmingai padëjote á sandëlio transportà");
	            format(gunText3Dcar[2], 70, "{878787}• G • {FFFFFF}Transporte yra {878787}%d {FFFFFF}ginklø paketø", carBag[gangCar[2]]);
				Update3DTextLabelText(gangCar3d[gangCar[2]][2], COLOR_ORANGEX, gunText3Dcar[2]);
			    carPak[playerid] = -1;
			    DisablePlayerCheckpoint(playerid);
			    zInfo[playerid][gunbox] = false;
				RemovePlayerAttachedObject(playerid, PDG_SLOT);
		        gMK_pack[playerid] = false;
		     }
			 else SendClientMessage(playerid, RED, "Transporte telpa tik 30 paketø!");
	      }
		  if(carPak[playerid] == 3)
	      {
		     if(carBag[gangCar[3]] < 30)
		     {
		        carBag[gangCar[3]] ++;
		        SendClientMessage(playerid, GREEN, "Paketà sëkmingai padëjote á sandëlio transportà");
	            format(gunText3Dcar[3], 70, "{878787}• G • {FFFFFF}Transporte yra {878787}%d {FFFFFF}ginklø paketø", carBag[gangCar[3]]);
				Update3DTextLabelText(gangCar3d[gangCar[3]][3], COLOR_ORANGEX, gunText3Dcar[3]);
			    carPak[playerid] = -1;
			    DisablePlayerCheckpoint(playerid);
			    zInfo[playerid][gunbox] = false;
				RemovePlayerAttachedObject(playerid, PDG_SLOT);
		        gMK_pack[playerid] = false;
		     }
			 else SendClientMessage(playerid, RED, "Transporte telpa tik 30 paketø!");
	      }
	   }	  
	}   
    return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER)
	{
       new vehicleid = GetPlayerVehicleID(playerid);
	   new m = GetVehicleModel(vehicleid);
       if(vInd[vehicleid][vehType] == VT_GANGCAR && m == 498)
	   {
	      if(!isPlayerGangLeader(playerid)) return RemovePlayerFromVehicle(playerid);
	      new gidas = getPlayerGangID(playerid);
	      SetPlayerCheckpointEx(playerid, 45, gInfo[gidas][gPos][0], gInfo[gidas][gPos][1], gInfo[gidas][gPos][2], 9.0);
	      SendClientMessage(playerid, GREEN, "Vaþiuokite kuo greièiau á gaujos pickup iðkrauti paketus");
		  carPak[playerid] = 1;
	   }
	}   
    return 1;
}

hook OnPlayerEnterCheckpoint(playerid)
{
    new cpid = pCPID[playerid];
	switch(cpid)
	{ 
	    case 45:
		{
	      if(IsPlayerInAnyVehicle(playerid))
	      {
	         DisablePlayerCheckpoint(playerid);
		     new vehicleid = GetPlayerVehicleID(playerid);
		     new m = GetVehicleModel(vehicleid);
		     if(m != 498) return 0;
		     if(carBag[vehicleid] < 1) return SendClientMessage(playerid, RED, "Transporte nëra paketø!");
		  
		     new gunText3Dcar[70];
	         format(gunText3Dcar, 70, "{878787}• G • {FFFFFF}Transporte yra {878787}%d {FFFFFF}ginklø paketø", carBag[vehicleid]);
		  
		     gInfo[zInfo[playerid][gaujosID]][gPak] += carBag[vehicleid]*1;
		  
		     new zx[60];
		     format (zx, sizeof zx, "UPDATE gangs SET gpak = '%d' WHERE gId = '%d'", gInfo[zInfo[playerid][gaujosID]][gPak], zInfo[playerid][gaujosID]);
		     mysql_query (zx);
		     
			 carBag[vehicleid] = 0;
			 
			 SetVehicleToRespawn(vehicleid);
			 
			 SetTimerEx("RespawngCar", 1000, false, "d", playerid);
			 
			 for(new i; i < MAX_PLAYERS; i++)
			 {
			     if(IsPlayerConnected(i))
				 {
			        if(zInfo[i][gaujosID])
			        {
			           new str[120];
			           format(str, 120, "%s gauja sëkmingai iðkrovë ginklø paketus\nO kurie pralaimëjo transportai perkraunami á sandëlio vietà.", gInfo[zInfo[i][gaujosID]][gName]);
			           SendClientMessage(i, GREEN, str);
					}
			     }		
		     }		
		  
		     if(IsPlayerInVehicle(playerid, gangCar[0])) Update3DTextLabelText(gangCar3d[vehicleid][0], -1, gunText3Dcar);
		     else if(IsPlayerInVehicle(playerid, gangCar[1])) Update3DTextLabelText(gangCar3d[vehicleid][1], -1, gunText3Dcar);
		     else if(IsPlayerInVehicle(playerid, gangCar[2])) Update3DTextLabelText(gangCar3d[vehicleid][2], -1, gunText3Dcar);
		     else if(IsPlayerInVehicle(playerid, gangCar[3])) Update3DTextLabelText(gangCar3d[vehicleid][3], -1, gunText3Dcar);
		  
	      }
	   }	  
	}
    return 1;
}

hook OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid)
{
    if(issuerid != zInfo[playerid][gaujosID])
	{
	   if(IsPlayerInAreaEx(playerid, 916.6, 2050.6, 999.6, 2181.6))
	   {
	      new Float:ghealt; GetPlayerHealth(playerid, ghealt);
		  new Float:g2healt; GetPlayerHealth(issuerid, g2healt);
		  SetPlayerHealth(playerid, ghealt + amount);
		  SetPlayerHealth(issuerid, g2healt + amount);
	      TDtext(issuerid, "~r~Sandelys grobiamas saudyti i gaujinius negalima!"); 
	   }
    }
    return 1;	
}

CMD:bomb(playerid, params[])
{
	new Hour; gettime(Hour);
	if (!isPlayerGangLeader(playerid)) return 0;
	if (!isPlayerInMkart(playerid)) return SendClientMessage(playerid, RED, "Nesate ginklø sandelio zonoje");
	if (gGrobiaMkart != -1) return SendClientMessage(playerid, RED, "Ginklø sandelys jau grobiamas kitos gaujos");
	if (gMK_canGrob > gettime()) return SendClientMessage(playerid, RED, "Dar negalite grobti");
	if (Hour >= 19 && Hour < 23)
	{
	    new teisN;

	    foreach(Player, ply)
	    {
		  if ( !zInfo[ply][AFK_Stat] && !zInfo[ply][Ofisas] && !isPlayerGangLeader(ply)) teisN ++;
	    }
	    if (teisN < 1) return SendClientMessage(playerid, RED, "Nëra prisijungusio bent dviejø ne AFK gaujø valdþios");

    	gMK_time = 0;
	
	    gGrobiaMkart = zInfo[playerid][gaujosID];
	
	    gunZone = GangZoneCreate(916.6, 2050.6, 999.6, 2181.6);
	    GangZoneShowForAll(gunZone, 0xFF0000AA);

	    foreach(Player, ply)
	    {
		   if (zInfo[ply][gaujosID] == gGrobiaMkart) SendClientMessage(ply, YELLOW, "Sandelio grobimas pradëtas.");
		   //else if (zInfo[ply][specialybe] == JOB_MKART) SendClientMessage(ply, YELLOW, "Gaujos nariai bando uþgrobti jûsø sandelá, skubëkite apginti.");
	    }
	}
	else
	{
       SendClientMessage(playerid, RED, "Grobti galima nuo 19:00 iki 22:00 valandos!");
       return 1;
	}

	return 1;
}

CMD:gginklai(playerid, prm[])
{
	if (!zInfo[playerid][gaujosID]) return SendClientMessage(playerid, RED, "Neturi gaujos");
	new zx[60];
	format (zx, sizeof zx, "SELECT gpak FROM gangs WHERE gId = '%d'", zInfo[playerid][gaujosID]);
	mysql_query (zx);
	mysql_store_result ();
	new gpakc = mysql_fetch_int();
	mysql_free_result ();
  
	if (!gpakc) return SendClientMessage(playerid, RED, "Tavo gauja neturi ginklø paketø.");

	gInfo[zInfo[playerid][gaujosID]][gPak] --;
	
	format (zx, sizeof zx, "UPDATE gangs SET gpak = '%d' WHERE gId = '%d'", gInfo[zInfo[playerid][gaujosID]][gPak], zInfo[playerid][gaujosID]);
	mysql_query(zx);

	GivePlayerWeaponEx(playerid, 24, 100);
	GivePlayerWeaponEx(playerid, 25, 50);
	GivePlayerWeaponEx(playerid, 29, 250);

	return 1;
}

CMD:uzminuotivartus(playerid, param[])
{
	//-143.0831,2635.9771,63.7227

	return 1;
}


forward RespawngCar(playerid);
public RespawngCar(playerid)
{
    for(new i; i < MAX_VEHICLES; i++)
	{
	    if(vInd[i][vehType] == VT_GANGCAR) SetVehicleToRespawn(i);
	}
	return 1;
}
