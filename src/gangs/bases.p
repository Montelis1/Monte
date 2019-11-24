
#include YSI\y_hooks
//Xdikzkxcxz
#define BASES_COUNT				2
#define BASE_MAX_VEHICLES		5

#define FREE_BASE_PRICE			5000
#define BASE_REPS_REQ			100
#define BASE_TAKE_CD			3600*72
#define BASE_TAKE_TIME			1200

#define BASE_INTERIOR_ID 		10
#define BASE_INTERIOR_POS		420.5190, 2536.6877, 10.0000
#define BASE_INTERIOR_EPOS		422.0457, 2536.4509, 10.0000

#define BASE_HEAL_COOLDOWN		300

enum e_gang_base
{
	bVehicles[BASE_MAX_VEHICLES],
	bVehsModels[BASE_MAX_VEHICLES],

	bGangOwns,
	bLastTaken,

	bGangZone,

	bHealPUP,
	bGunPUP,
	bEntrancePUP,

	Float: bAreaPos[4] // minx miny maxx maxy
};

static const
	gb_avVehicles[] = {413, 419, 439, 445, 468, 492};

static
	Float: gb_vehsPos[BASES_COUNT][BASE_MAX_VEHICLES][4],
	gBase[BASES_COUNT][e_gang_base],

	tbUA_progress[BASES_COUNT],
	timer_gbtake[BASES_COUNT] = {-1, ...},

	gBase_toBuy[MAX_PLAYERS],
	gBase_lastHeal[MAX_PLAYERS],

	gBase_exitPUP = -1;

forward gangBase_takeSync(baseid, gangid);

showdialog_contransport(playerid)
{
	if (playerGang[playerid] == INVALID_GANG_ID)
		return 1;

	new 
		str[500] = "Norëdamas pakeisti kurio nors transporto modelá turi áraðyti transporto id bei modelá.\n \nGalimi modeliai : ",
		tempstr[40],
		i, baseid = GetBaseIDOfGang(playerGang[playerid]);

	if (baseid == INVALID_GANG_ID) return 1;

	for (i = 0; i < sizeof gb_avVehicles; i++)
	{
		format(tempstr, sizeof tempstr, "%d (%s) ", gb_avVehicles[i], TransportoPavadinimai[gb_avVehicles[i]-400]);
		strcat(str, tempstr);
	}

	strcat(str, "\nTransporto id turi bûti nuo 1 iki "#BASE_MAX_VEHICLES"\n \n");

	for (i = 0; i < BASE_MAX_VEHICLES; i++)
	{
		format(tempstr, sizeof tempstr, "Transportas %d - %s(%d)\n", i+1, TransportoPavadinimai[gBase[baseid][bVehsModels][i]-400], gBase[baseid][bVehsModels][i]);
		strcat(str, tempstr);
	}

	ShowPlayerDialog(playerid, DIALOG_GANG_BASE_CON_TR, DIALOG_STYLE_INPUT, "Transporto valdymas", str, "Keisti", "Atgal");
	return 1;
}

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{

	new gid = GetBaseIDOfGang(playerGang[playerid]),
		bid = GetPlayerBaseAreaID(playerid);

	if (gid != INVALID_GANG_ID && bid != INVALID_GANG_ID)
	{
		if (gBase[bid][bGangOwns] == playerGang[playerid])
		{
			if (pickupid == gBase[bid][bHealPUP])
			{
				if (gBase_lastHeal[playerid] > gettime())
					return ErrorMsg(playerid, "Dar negali pasigydyti.");
				if (timer_gbtake[bid] != -1)
					return ErrorMsg(playerid, "Negali pasigydyti kai tavo gaujos bazë puolama.");

				SetPlayerHealth(playerid, 99.5);
				SetPlayerArmour(playerid, 99.5);
				gBase_lastHeal[playerid] = gettime() + BASE_HEAL_COOLDOWN;
			}

			if (pickupid == gBase[bid][bGunPUP])
			{

			}

			if (pickupid == gBase[bid][bEntrancePUP])
			{
				if (HOLDING_STOLEN_MONEY__(playerid) != 0 && IsPlayerAttachedObjectSlotUsed(playerid, 2))
				{
					gangDB[playerGang[playerid]][gMoney] += HOLDING_STOLEN_MONEY__(playerid);

					SendClientMessage(playerid, COLOR_GREEN, "Sëkmingai padëjai pavogtus pinigus");
					NULL_HOLDING_STOLEN_MONEY(playerid);
					RemovePlayerAttachedObject(playerid, 2);
					return 1;
				}

				SetPlayerInterior(playerid, BASE_INTERIOR_ID);
				SetPlayerPos(playerid, BASE_INTERIOR_POS);
				SetPlayerVirtualWorld(playerid, bid);
			}
		}
	}

	if (gBase_exitPUP == pickupid)
	{
		new vw = GetPlayerVirtualWorld(playerid);

		if (vw < BASES_COUNT)
		{
			new Float: x, Float: y, Float: z;

			Streamer_GetFloatData(STREAMER_TYPE_PICKUP, gBase[vw][bEntrancePUP], E_STREAMER_X, x);
			Streamer_GetFloatData(STREAMER_TYPE_PICKUP, gBase[vw][bEntrancePUP], E_STREAMER_Y, y);
			Streamer_GetFloatData(STREAMER_TYPE_PICKUP, gBase[vw][bEntrancePUP], E_STREAMER_Z, z);
			SetPlayerInterior(playerid, 0);
			SetPlayerPos(playerid, x, y, z);
			SetPlayerVirtualWorld(playerid, 0);
		}
	}

	return 1;
}

/*LoadBasesInfo()
{
	mysql_query ("SELECT * FROM gangs_bases");
	mysql_store_result ();
	mysql_retrieve_row ();

	new 
		temp[30], bid;

	mysql_fetch_field_row(temp, "baseid"); bid = strval(temp);

	mysql_fetch_field_row(temp, "owns"); gBase[bid][bGangOwns] = strval(temp);
	mysql_fetch_field_row(temp, "lastTaken"); gBase[bid][bLastTaken] = strval(temp);

	mysql_fetch_field_row(temp, "0"); gBase[bid][bVehsModels][0] = strval(temp);
	mysql_fetch_field_row(temp, "1"); gBase[bid][bVehsModels][1] = strval(temp);
	mysql_fetch_field_row(temp, "2"); gBase[bid][bVehsModels][2] = strval(temp);
	mysql_fetch_field_row(temp, "3"); gBase[bid][bVehsModels][3] = strval(temp);
	mysql_fetch_field_row(temp, "4"); gBase[bid][bVehsModels][4] = strval(temp);

	mysql_retrieve_row ();

	mysql_fetch_field_row(temp, "baseid"); bid = strval(temp);

	mysql_fetch_field_row(temp, "owns"); gBase[bid][bGangOwns] = strval(temp);
	mysql_fetch_field_row(temp, "lastTaken"); gBase[bid][bLastTaken] = strval(temp);

	mysql_fetch_field_row(temp, "0"); gBase[bid][bVehsModels][0] = strval(temp);
	mysql_fetch_field_row(temp, "1"); gBase[bid][bVehsModels][1] = strval(temp);
	mysql_fetch_field_row(temp, "2"); gBase[bid][bVehsModels][2] = strval(temp);
	mysql_fetch_field_row(temp, "3"); gBase[bid][bVehsModels][3] = strval(temp);
	mysql_fetch_field_row(temp, "4"); gBase[bid][bVehsModels][4] = strval(temp);


	mysql_free_result();


	new 
		File: zx = fopen("gangbases.txt", io_read), 
		buf[128], a;
	 

	if (zx)
	{
		while(fread(zx, buf) && a != BASES_COUNT)
		{
			sscanf(buf, "iiiiiii", gBase[a][bGangOwns], gBase[a][bLastTaken], 
				gBase[a][bVehsModels][0], gBase[a][bVehsModels][1], gBase[a][bVehsModels][2], gBase[a][bVehsModels][3], gBase[a][bVehsModels][4]);
			a++;
		}

		fclose(zx);
	}
	else print("[gangs/bases.p] nerastas gangbases.txt failas");
}*/

SaveBasesInfo()
{

	new 
		str[200];

	format(str, sizeof str,
		"UPDATE gangs_bases SET owns = '%d', lastTaken = '%d', `0` = '%d', `1` = '%d', `2` = '%d', `3` = '%d', `4` = '%d' WHERE baseid = '0'",
		gBase[0][bGangOwns], gBase[0][bLastTaken], gBase[0][bVehsModels][0], gBase[0][bVehsModels][1], gBase[0][bVehsModels][2],
		gBase[0][bVehsModels][3], gBase[0][bVehsModels][4]);
	mysql_query(str);

	format(str, sizeof str,
		"UPDATE gangs_bases SET owns = '%d', lastTaken = '%d', `0` = '%d', `1` = '%d', `2` = '%d', `3` = '%d', `4` = '%d' WHERE baseid = '1'",
		gBase[1][bGangOwns], gBase[1][bLastTaken], gBase[1][bVehsModels][0], gBase[1][bVehsModels][1], gBase[1][bVehsModels][2],
		gBase[1][bVehsModels][3], gBase[1][bVehsModels][4]);
	mysql_query(str);

	/*new 
		File: zx = fopen("gangbases.txt", io_write), 
		buf[128];

	if (zx)
	{
		for (new a; a < BASES_COUNT; a++)
		{
			format(buf, sizeof buf, "%i %i %i %i %i %i %i \n", gBase[a][bGangOwns], gBase[a][bLastTaken], 
				gBase[a][bVehsModels][0], gBase[a][bVehsModels][1], gBase[a][bVehsModels][2], gBase[a][bVehsModels][3], gBase[a][bVehsModels][4]);
			fwrite(zx, buf);
		}
		fclose(zx);
	}
	else print("[gangs/bases.p] nerastas gangbases.txt failas");*/
}

/*hook OnGameModeInit()
{
	#include "src/gangs/basesmaps.p"
	LoadBasesInfo();

	CreateGangBase(0, Float:{ 635.7384, -505.9447, 16.3359 }, Float:{ 633.5136, -505.9883, 16.3359 }, Float:{ 632.4113, -509.6285, 16.3359 }, 
		Float:{600.0, -526.0, 682.0, -483.0}, 
		Float:{ 656.598, -499.000, 16.135, 0.169 }, Float:{ 633.560, -490.258, 16.055, 88.303 }, Float:{ 625.991, -490.210, 16.067, 87.542 },
		Float:{ 649.415, -507.859, 16.442, 359.451 }, Float:{ 639.288, -499.657, 16.451, 269.361 });


	CreateGangBase(1, Float:{ -1317.8436, 2500.2415, 87.042 }, Float:{ -1315.3022, 2500.2261, 87.042 }, Float:{ -1322.3846, 2498.0513, 87.046 }, 
		Float:{-1337.0, 2491.0, -1305.0, 2521.0}, 
		Float:{ -1309.546, 2496.952, 86.755, 269.457 }, Float:{ -1294.994, 2512.116, 86.821, 0.111 }, Float:{ -1311.335, 2516.865, 86.954, 268.699 },
		Float:{ -1311.829, 2510.531, 86.823, 0.027 }, Float:{ -1330.804, 2511.775, 86.830, 181.614 });

	gBase_exitPUP = CreateDynamicPickup(1318, 2, BASE_INTERIOR_EPOS, -1);

	return 1;
}*/

OnGameModeExit_BASES()
{
	SaveBasesInfo();
	return 1;
}

CMD:uzimtibaze(playerid, params[])
{
	if (playerGang[playerid] == INVALID_GANG_ID) 
		return 0;
	if (!playerGangCo[playerid] && strcmp(gangDB[playerGang[playerid]][gLeaderName], GetPlayerNameEx(playerid)) != 0)
		return ErrorMsg(playerid, "Negali naudoti ðios komandos.");

	if (gangDB[playerGang[playerid]][gReps] < BASE_REPS_REQ)
		return ErrorMsg(playerid, "Tavo gauja neturi pakankamai rep taðkø ("#BASE_REPS_REQ").");

	new 
		baseid = GetPlayerBaseAreaID(playerid);

	if (baseid == INVALID_GANG_ID)
		return ErrorMsg(playerid, "Neesi jokios bazës zonoje");
	if (GetBaseIDOfGang(playerGang[playerid]) != INVALID_GANG_ID)
		return ErrorMsg(playerid, "Tavo gaujai jau priklauso kita bazë.");
	if (gBase[baseid][bLastTaken] > gettime())
		return ErrorMsg(playerid, "Ðios zonos dar negalima uþimti");
	if (gBase[baseid][bGangOwns] == INVALID_GANG_ID)
	{
		gBase_toBuy[playerid] = baseid;
		ShowPlayerDialog(playerid, DIALOG_BUY_GBASE, DIALOG_STYLE_MSGBOX, "Bazës pirkimas", 
		"Ði gaujos bazë nepriklauso jokiai gaujai, todël jos uþimti negalima.\nGaujos bazæ galima nusipirkti uþ "#FREE_BASE_PRICE". Jeigu nori nusipirkti spausk 'PIRKTI'.", "Pirkti", "Iðeiti");
		return 1;
	}
	if (gBase[baseid][bGangOwns] == playerGang[playerid])
		return ErrorMsg(playerid, "Savo bazës uþiminëti nereikia");
	if (timer_gbtake[baseid] != -1)
		return ErrorMsg(playerid, "Kita gauja puola ðià bazæ.");
	tbUA_progress[baseid] = BASE_TAKE_TIME;
	timer_gbtake[baseid] = SetTimerEx("gangBase_takeSync", 1000, true, "ii", baseid, playerGang[playerid]);
	gBase[baseid][bLastTaken] = gettime() + BASE_TAKE_CD;

	gang_message(playerGang[playerid], smallf("Jûsø gauja sëkmingai uþpuolë %s gaujos bazæ.", gangDB[gBase[baseid][bGangOwns]][gName]), GREEN);
	gang_message(gBase[baseid][bGangOwns], smallf("Gaujos bazë buvo uþpulta %s gaujos.", gangDB[playerGang[playerid]][gName]), RED);
	return 1;
}

GetPlayerBaseAreaID(playerid)
{
	for (new i; i < BASES_COUNT; i++)
	{
		if (IsPlayerInBaseArea(playerid, i))
			return i;
	}

	return INVALID_GANG_ID;
}

IsPlayerInBaseArea(playerid, baseid)
{
    new
    	Float:PosX, Float:PosY, Float:PosZ;

    GetPlayerPos(playerid, PosX, PosY, PosZ);
    if((gBase[baseid][ bAreaPos ][0] < PosX) && (gBase[baseid][ bAreaPos ][2] > PosX) && (gBase[baseid][ bAreaPos ][1] < PosY) && (gBase[baseid][ bAreaPos ][3] > PosY)) return true;
    else return false;
}

GetBaseIDOfGang(gangid)
{
	if(gangid == INVALID_GANG_ID)
		return INVALID_GANG_ID;
	for (new i; i < BASES_COUNT; i++)
	{
		if (gBase[i][bGangOwns] == gangid)
			return i;
	}
	return INVALID_GANG_ID;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_BUY_GBASE)
	{
		if (!response)
			return 1;

		if (playerGang[playerid] == INVALID_GANG_ID) 
			return 0;

		if (!playerGangCo[playerid] && strcmp(gangDB[playerGang[playerid]][gLeaderName], GetPlayerNameEx(playerid)) != 0)
			return ErrorMsg(playerid, "Negali naudoti ðios komandos.");

		if (gangDB[playerGang[playerid]][gReps] < BASE_REPS_REQ)
			return ErrorMsg(playerid, "Tavo gauja neturi pakankamai rep taðkø ("#BASE_REPS_REQ").");

		if (!IsPlayerInBaseArea(playerid, gBase_toBuy[playerid]))
			return ErrorMsg(playerid, "Jau nebe bazës teritorijoje...");
		if (GetPlayerMoneyA(playerid) < FREE_BASE_PRICE)
			return ErrorMsg(playerid, "Neturi pakankamai pinigø.");
		if (GetBaseIDOfGang(playerGang[playerid]) != INVALID_GANG_ID)
			return ErrorMsg(playerid, "Tavo gaujai jau priklauso kita bazë.");
		if (gBase[gBase_toBuy[playerid]][bGangOwns] != INVALID_GANG_ID)
			return ErrorMsg(playerid, "Bazës jau nebenusipirksi...");

		GivePlayerMoneyA(playerid, -FREE_BASE_PRICE);
		gBase[gBase_toBuy[playerid]][bGangOwns] = playerGang[playerid];

		gang_message(playerGang[playerid], "Sëkmingai nusipirkote bazæ.");
	}

	if (dialogid == DIALOG_GANG_BASE_CON_TR)
	{
		if (playerGang[playerid] == INVALID_GANG_ID) 
			return 1;
		if (!response)
			return showdialog_gangleader(playerid);

		new tid, model, i, baseid = GetBaseIDOfGang(playerGang[playerid]);

		if (baseid == INVALID_GANG_ID)
			return ErrorMsg(playerid, "?? nebër bazës.");

		if (sscanf(inputtext, "ii", tid, model))
			return showdialog_contransport(playerid), ErrorMsg(playerid, "[Transporto ID] [Modelio ID]");

		if (tid < 1 || tid > BASE_MAX_VEHICLES)
			return showdialog_contransport(playerid), ErrorMsg(playerid, "[Transporto ID](1-"#BASE_MAX_VEHICLES") [Modelio ID]");

		for (i = 0; i < sizeof gb_avVehicles; i++)
		{
			if (gb_avVehicles[i] == model)
			{
				i = -1;
				break;
			}
		}
		if (i != -1)
			return showdialog_contransport(playerid), ErrorMsg(playerid, "Naudokite tik galimus modelius!");

		BaseCar_SetModel(baseid, tid-1, model);
		showdialog_contransport(playerid);
	}

	return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if (newstate == PLAYER_STATE_DRIVER)
	{
		new vid = GetPlayerVehicleID(playerid);
		if (vInd[vid][vehType] == VT_GANGCAR && vInd[vid][vehOwner] != GetBaseIDOfGang(playerGang[playerid]))
			return RemovePlayerFromVehicle(playerid), ErrorMsg(playerid, "Negali vairuoti ðios maðinos, nes já priklauso gaujai.");
	}

	return 1;
}

BaseCar_SetModel(baseid, tid, newmodel)
{
	gBase[baseid][bVehsModels][tid] = newmodel;
	DestroyVehicle(gBase[baseid][bVehicles][tid]);
	gBase[baseid][bVehicles][tid] = AddVehicle(newmodel, gb_vehsPos[baseid][tid][0], gb_vehsPos[baseid][tid][1], gb_vehsPos[baseid][tid][2], gb_vehsPos[baseid][tid][3], 0, 0, 900, VT_GANGCAR, baseid);
}

public gangBase_takeSync(baseid, gangid)
{

	if (countGBaseGangs(gangid, baseid) == 0)
	{
		KillTimer(timer_gbtake[baseid]);
		timer_gbtake[baseid] = -1;

		foreach(new p : Player)
		{
			if (playerGang[p] == gangid)
			{
				SendClientMessage(p, RED, "Bazës perimti neiðëjo.");
				syncGBaseZone(p);
			}
			if (gBase[baseid][bGangOwns] != INVALID_GANG_ID)
			{
				if (playerGang[p] == gBase[baseid][bGangOwns])
				{
					SendClientMessage(p, GREEN, "Bazë apginta sëkmingai");
					syncGBaseZone(p);
				}
			}
		}

		return 1;
	}

	if (--tbUA_progress[baseid] == 0)
	{
		KillTimer(timer_gbtake[baseid]);
		timer_gbtake[baseid] = -1;

		new oldgangid = gBase[baseid][bGangOwns];
		gBase[baseid][bGangOwns] = gangid;

		foreach(new p : Player)
		{
			if (playerGang[p] == gangid)
			{
				SendClientMessage(p, GREEN, "Gaujai pavyko perimti kitos gaujos bazæ");
				syncGBaseZone(p);
			}
			if (oldgangid != INVALID_GANG_ID)
			{
				if (playerGang[p] == oldgangid)
				{
					SendClientMessage(p, RED, "Gaujos bazë prarasta");
					syncGBaseZone(p);
				}
			}
		}

		return 1;
	}

	new 
		str[50];

	format(str, sizeof str, "Iki bazes perimimo liko   %d s", tbUA_progress[baseid]);

	foreach(new p : Player)
	{
		if (playerGang[p] == gangid && IsPlayerInBaseArea(p, baseid))
		{
			GameTextForPlayer(p, str, 1100, 4);
		}
	}

	return 1;
}

countGBaseGangs(gangid, baseid)
{
	new b;

	foreach(new p : Player)
		if (playerGang[p] == gangid && IsPlayerInBaseArea(p, baseid)) b++;
	return b;
}

syncGBaseZone(playerid)
{
	for(new i; i < BASES_COUNT; i++)
	{
		if (gBase[i][bGangOwns] == INVALID_GANG_ID || gBase[i][bGangOwns] != playerGang[playerid])
			GangZoneShowForPlayer(playerid, gBase[i][bGangZone], GZ_COL_UA);
		else 
			GangZoneShowForPlayer(playerid, gBase[i][bGangZone], GZ_COL_OWN);
	}
}


resetGB(gangid)
{
	for (new a; a < BASES_COUNT; a++)
	{
		if (gBase[a][bGangOwns] == gangid)
			gBase[a][bGangOwns] = INVALID_GANG_ID;
	}
}

//hook 
OnGameModeInit_BASES()
{
	for (new xx; xx < BASES_COUNT; xx++)
	{
		for(new vx; vx < BASE_MAX_VEHICLES; vx++) gBase[xx][bVehsModels][vx] = gb_avVehicles[0];
		gBase[xx][bGangOwns] = INVALID_GANG_ID;
	}

	#include "src/gangs/basesmaps.p"
	
	mysql_query ("SELECT * FROM gangs_bases");
	mysql_store_result ();
	mysql_retrieve_row ();

	new 
		temp[30], bid;

	mysql_fetch_field_row(temp, "baseid"); bid = strval(temp);

	mysql_fetch_field_row(temp, "owns"); gBase[bid][bGangOwns] = strval(temp);
	mysql_fetch_field_row(temp, "lastTaken"); gBase[bid][bLastTaken] = strval(temp);

	mysql_fetch_field_row(temp, "0"); gBase[bid][bVehsModels][0] = strval(temp);
	mysql_fetch_field_row(temp, "1"); gBase[bid][bVehsModels][1] = strval(temp);
	mysql_fetch_field_row(temp, "2"); gBase[bid][bVehsModels][2] = strval(temp);
	mysql_fetch_field_row(temp, "3"); gBase[bid][bVehsModels][3] = strval(temp);
	mysql_fetch_field_row(temp, "4"); gBase[bid][bVehsModels][4] = strval(temp);

	mysql_retrieve_row ();

	mysql_fetch_field_row(temp, "baseid"); bid = strval(temp);

	mysql_fetch_field_row(temp, "owns"); gBase[bid][bGangOwns] = strval(temp);
	mysql_fetch_field_row(temp, "lastTaken"); gBase[bid][bLastTaken] = strval(temp);

	mysql_fetch_field_row(temp, "0"); gBase[bid][bVehsModels][0] = strval(temp);
	mysql_fetch_field_row(temp, "1"); gBase[bid][bVehsModels][1] = strval(temp);
	mysql_fetch_field_row(temp, "2"); gBase[bid][bVehsModels][2] = strval(temp);
	mysql_fetch_field_row(temp, "3"); gBase[bid][bVehsModels][3] = strval(temp);
	mysql_fetch_field_row(temp, "4"); gBase[bid][bVehsModels][4] = strval(temp);

	mysql_free_result();

	gBase[0][bAreaPos] = Float:{600.0, -526.0, 682.0, -483.0};
	gBase[0][bHealPUP] = CreateDynamicPickup(1240, 2, 635.7384, -505.9447, 16.3359, 0);
	gBase[0][bEntrancePUP] = CreateDynamicPickup(1318, 2, 632.4113, -509.6285, 16.3359, 0);
	gBase_exitPUP = CreateDynamicPickup(1318, 2, BASE_INTERIOR_EPOS, -1);

	gb_vehsPos[0][0] = Float:{ 656.598, -499.000, 16.135, 0.169 };
	gb_vehsPos[0][1] = Float:{ 633.560, -490.258, 16.055, 88.303 };
	gb_vehsPos[0][2] = Float:{ 625.991, -490.210, 16.067, 87.542 };
	gb_vehsPos[0][3] = Float:{ 649.415, -507.859, 16.442, 359.451 };
	gb_vehsPos[0][4] = Float:{ 639.288, -499.657, 16.451, 269.361 };

	for(new vz; vz < BASE_MAX_VEHICLES; vz++)
		gBase[0][bVehicles][vz] = AddVehicle (gBase[0][bVehsModels][vz], gb_vehsPos[0][vz][0], gb_vehsPos[0][vz][1], gb_vehsPos[0][vz][2], gb_vehsPos[0][vz][3], 0, 0, 900, VT_GANGCAR, 0);

	gBase[0][bGangZone] = GangZoneCreate(600.0, -526.0, 682.0, -483.0);




	gBase[1][bAreaPos] = Float:{-1337.0, 2491.0, -1305.0, 2521.0};
	gBase[1][bHealPUP] = CreateDynamicPickup(1240, 2, -1317.8436, 2500.2415, 87.042, 0);
	gBase[1][bEntrancePUP] = CreateDynamicPickup(1318, 2, -1322.3846, 2498.0513, 87.046, 0);
	gBase_exitPUP = CreateDynamicPickup(1318, 2, BASE_INTERIOR_EPOS, -1);

	gb_vehsPos[1][0] = Float:{ -1309.546, 2496.952, 86.755, 269.457 };
	gb_vehsPos[1][1] = Float:{ -1294.994, 2512.116, 86.821, 0.111 };
	gb_vehsPos[1][2] = Float:{ -1311.335, 2516.865, 86.954, 268.699 };
	gb_vehsPos[1][3] = Float:{ -1311.829, 2510.531, 86.823, 0.027 };
	gb_vehsPos[1][4] = Float:{ -1330.804, 2511.775, 86.830, 181.614 };

	for(new vz; vz < BASE_MAX_VEHICLES; vz++)
		gBase[1][bVehicles][vz] = AddVehicle (gBase[1][bVehsModels][vz], gb_vehsPos[1][vz][0], gb_vehsPos[1][vz][1], gb_vehsPos[1][vz][2], gb_vehsPos[1][vz][3], 0, 0, 900, VT_GANGCAR, 0);
	
	gBase[1][bGangZone] = GangZoneCreate(-1337.0, 2491.0, -1305.0, 2521.0);

}




/*hook OnGameModeInit()
{
	#include "src/gangs/basesmaps.p"
	LoadBasesInfo();

	CreateGangBase(0, Float:{ 635.7384, -505.9447, 16.3359 }, Float:{ 633.5136, -505.9883, 16.3359 }, Float:{ 632.4113, -509.6285, 16.3359 }, 
		Float:{600.0, -526.0, 682.0, -483.0}, 
		Float:{ 656.598, -499.000, 16.135, 0.169 }, Float:{ 633.560, -490.258, 16.055, 88.303 }, Float:{ 625.991, -490.210, 16.067, 87.542 },
		Float:{ 649.415, -507.859, 16.442, 359.451 }, Float:{ 639.288, -499.657, 16.451, 269.361 });


	CreateGangBase(1, Float:{ -1317.8436, 2500.2415, 87.042 }, Float:{ -1315.3022, 2500.2261, 87.042 }, Float:{ -1322.3846, 2498.0513, 87.046 }, 
		Float:{-1337.0, 2491.0, -1305.0, 2521.0}, 
		Float:{ -1309.546, 2496.952, 86.755, 269.457 }, Float:{ -1294.994, 2512.116, 86.821, 0.111 }, Float:{ -1311.335, 2516.865, 86.954, 268.699 },
		Float:{ -1311.829, 2510.531, 86.823, 0.027 }, Float:{ -1330.804, 2511.775, 86.830, 181.614 });

	gBase_exitPUP = CreateDynamicPickup(1318, 2, BASE_INTERIOR_EPOS, -1);

	return 1;
}

CreateGangBase(bid, Float: healPos[3], Float: gunPos[3], Float: entrancePos[3], Float: areaPos[4], Float: vehsPos0[4], Float: vehsPos1[4], Float: vehsPos2[4], Float: vehsPos3[4], Float: vehsPos4[4])
{
	#pragma unused gunPos
	gBase[bid][bAreaPos] = areaPos;

	gBase[bid][bHealPUP] = CreateDynamicPickup(1240, 2, healPos[0], healPos[1], healPos[2], 0);
	//gBase[bid][bGunPUP] = CreateDynamicPickup(2044, 2, gunPos[0], gunPos[1], gunPos[2], 0);
	gBase[bid][bEntrancePUP] = CreateDynamicPickup(1318, 2, entrancePos[0], entrancePos[1], entrancePos[2], 0);

	gb_vehsPos[bid][0] = vehsPos0;
	gb_vehsPos[bid][1] = vehsPos1;
	gb_vehsPos[bid][2] = vehsPos2;
	gb_vehsPos[bid][3] = vehsPos3;
	gb_vehsPos[bid][4] = vehsPos4;

	for(new vz; vz < BASE_MAX_VEHICLES; vz++)
		gBase[bid][bVehicles][vz] = AddVehicle (gBase[bid][bVehsModels][vz], gb_vehsPos[bid][vz][0], gb_vehsPos[bid][vz][1], gb_vehsPos[bid][vz][2], gb_vehsPos[bid][vz][3], 0, 0, 900, VT_GANGCAR, bid);

	gBase[bid][bGangZone] = GangZoneCreate(floatsub(areaPos[0], floatfract(areaPos[0])), floatsub(areaPos[1], floatfract(areaPos[1])), floatsub(areaPos[2], floatfract(areaPos[2])), floatsub(areaPos[3], floatfract(areaPos[3])));
}*/



