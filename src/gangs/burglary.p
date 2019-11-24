
#define MAX_BURGLARY_HOUSES MAX_GANGS
#define MAX_BURGLARY_OBJECTS 27

#define BURGLARY_HOUSES_TYPES 1
#define BURGLARY_TAKE_RAGE 1.5

#define BURGLARY_COOLDOWN 60*15

#include YSI\y_hooks

enum e_burglary
{
	bool: b_inProgress,
	b_houseID,
	b_objects[MAX_BURGLARY_OBJECTS],
	b_houseType,
	b_timerID
};

static
	burglaryExitPUP[BURGLARY_HOUSES_TYPES],
	bool: b_HSI[MAX_PLAYERS],
	b_vehs[4][2],
	gang_bcd[MAX_GANGS];

new 
	burglaryDB[MAX_BURGLARY_HOUSES][e_burglary],
	bPlayer_houseID[MAX_PLAYERS] = {-1, ...},
	Float: burglaryTypes[BURGLARY_HOUSES_TYPES][7] = {{2317.9150,-1026.4121,1050.2178, 2320.0388,-1024.5654,1050.2109, 9.0}}; // pickupo pos(isejimui), kur nutelinti iejus, interior id;

//9 2319.1272,-1023.9562,1050.2109, 167.3959 Safe House group 3 ;

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if (playerGang[playerid] != INVALID_GANG_ID)
	{
		if (!(newkeys & KEY_YES)) return 1;

		if (IsPlayerInRangeOfPoint(playerid, 2.5, -2637.6631, 1328.2549, 7.1953))
		{
			if (playerGangCo[playerid] || !strcmp(GetPlayerNameEx(playerid), gangDB[playerGang[playerid]][gLeaderName]))
			{
				if (burglaryDB[playerGang[playerid]][b_inProgress])
					return 1;

				if (gang_bcd[playerGang[playerid]] > gettime())
					return ErrorMsg(playerid, "Gráþk vëliau");

				ShowPlayerDialog(playerid, DIALOG_START_BURGLARY, DIALOG_STYLE_MSGBOX, " ", "Ar tikrai nori pradëti namo apiplëðimà?\nTaip pat turësi sumokëti 5000 eur uþ informacijà", "Pradëti", "Iðeiti");
			}
			else
				return ErrorMsg(playerid, "Turi bûti gaujos vadu arba pavaduotoju.");

			return 1;
		}

		if (bPlayer_houseID[playerid] != -1 && !b_HSI[playerid])
		{
			new Float: x, Float: y, Float: z, model;

			for (new i; i < MAX_BURGLARY_OBJECTS; i++)
			{
				if (burglaryDB[playerGang[playerid]][b_objects][i] == INVALID_OBJECT_ID)
					continue;

				Streamer_GetFloatData(STREAMER_TYPE_OBJECT, burglaryDB[playerGang[playerid]][b_objects][i], E_STREAMER_X, x);
				Streamer_GetFloatData(STREAMER_TYPE_OBJECT, burglaryDB[playerGang[playerid]][b_objects][i], E_STREAMER_Y, y);
				Streamer_GetFloatData(STREAMER_TYPE_OBJECT, burglaryDB[playerGang[playerid]][b_objects][i], E_STREAMER_Z, z);

				model = Streamer_GetIntData(STREAMER_TYPE_OBJECT, burglaryDB[playerGang[playerid]][b_objects][i], E_STREAMER_MODEL_ID);

				if (IsPlayerInRangeOfPoint(playerid, BURGLARY_TAKE_RAGE, x, y, z))
				{
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
					SetPlayerAttachedObject(playerid, 7, model, 6, 0.077999, 0.043999, -0.170999, -13.799953, 79.70, 0.0);

					b_HSI[playerid] = true;

					DestroyDynamicObject(burglaryDB[playerGang[playerid]][b_objects][i]);
					burglaryDB[playerGang[playerid]][b_objects][i] = INVALID_OBJECT_ID;
					SendClientMessage(playerid, GREEN, "Pakrausk pavogtà daiktà á sunkveþimá. Daikto iðmetimui : /ismestidaikta");
				}
			}
		}
		else if (b_HSI[playerid])
		{
			new Float: x, Float: y, Float: z;

			for (new i; i < sizeof b_vehs; i++)
			{
				GetVehiclePos(b_vehs[i][0], x, y, z);

				if (IsPlayerInRangeOfPoint(playerid, 3.5, x, y, z))
				{
					b_vehs[i][1] += 150 + random(50);

					RemovePlayerAttachedObject(playerid, 7);
					SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
					b_HSI[playerid] = false;
					
					break;
				}
			}
		}
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_START_BURGLARY)
	{
		if (playerGang[playerid] == INVALID_GANG_ID)
			return 1;

		if (!response)
			return 1;

		if (GetPlayerMoneyA(playerid) < 5000)
			return ErrorMsg(playerid, "Neturi 5000 eur...");

		if (burglaryDB[playerGang[playerid]][b_inProgress])
			return 1;

		GivePlayerMoneyA(playerid, -5000);
		createBurglary(playerGang[playerid]);

		return 1;
	}

	return 1;
}

createBurglary(burglary)
{

	if (burglaryDB[burglary][b_inProgress])
		destroyBurglary(burglary);

	burglaryDB[burglary][b_houseID] = GetRandomHouse();
	burglaryDB[burglary][b_inProgress] = true;
	burglaryDB[burglary][b_houseType] = random(BURGLARY_HOUSES_TYPES);

	gangDB[burglary][gReps] += 6;

	new 
		str[100], i;
	
	format(str, sizeof str, "Jûsø gauja pradëjo namo apiplëðimà. Namo numeris %d", burglaryDB[burglary][b_houseID]);
	gang_message(burglary, str, GREEN);

	for (i = 0; i < MAX_BURGLARY_OBJECTS; i++)
	{
		if (burglaryDB[burglary][b_objects][i] != INVALID_OBJECT_ID)
		{ 
			DestroyDynamicObject(burglaryDB[burglary][b_objects][i]); 
			burglaryDB[burglary][b_objects][i] = INVALID_OBJECT_ID;
		}
	}

	burglaryDB[burglary][b_timerID] = SetTimerEx("end_burglary", 1000*60*30, false, "i", burglary);

	switch (burglaryDB[burglary][b_houseType])
	{
		case 0:
		{
			burglaryDB[burglary][b_objects][0] = CreateDynamicObject(1429, 2323.488769, -1026.310302, 1049.450927, 0.0, 0.0, 450.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][1] = CreateDynamicObject(1429, 2326.008789, -1015.045532, 1050.481323, 0.0, 0.0, 180.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][2] = CreateDynamicObject(1429, 2317.457519, -1007.696777, 1050.491577, 0.0, 0.0, -88.499969, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][3] = CreateDynamicObject(1719, 2322.461181, -1009.965698, 1054.729248, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][4] = CreateDynamicObject(1719, 2322.347412, -1020.459289, 1049.210937, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][5] = CreateDynamicObject(2226, 2326.131591, -1017.542602, 1049.210937, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][6] = CreateDynamicObject(2226, 2318.213378, -1015.279113, 1049.210937, 0.0, 0.0, 90.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][7] = CreateDynamicObject(2226, 2327.471679, -1008.944274, 1049.210937, 0.0, 0.0, 180.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][8] = CreateDynamicObject(2102, 2325.940429, -1009.481018, 1054.218872, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][9] = CreateDynamicObject(2102, 2322.252441, -1006.315429, 1053.718750, 0.0, 0.0, 180.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][10] = CreateDynamicObject(2028, 2329.838378, -1013.904052, 1053.718750, 0.0, 0.0, 0.0, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][11] = CreateDynamicObject(2028, 2324.790039, -1011.696411, 1049.760864, 0.0, 0.0, 0.0, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][12] = CreateDynamicObject(11745, 2319.839355, -1007.814819, 1049.390991, 0.0, 0.0, -81.899986, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][13] = CreateDynamicObject(11745, 2328.076904, -1020.325378, 1049.381103, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][14] = CreateDynamicObject(11745, 2326.114501, -1015.483642, 1053.858886, 0.0, 0.0, -92.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][15] = CreateDynamicObject(11745, 2327.775878, -1007.693603, 1053.838867, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][16] = CreateDynamicObject(11745, 2316.296386, -1006.143127, 1053.848754, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][17] = CreateDynamicObject(11745, 2323.493896, -1015.103515, 1050.401611, 0.0, 0.0, -93.700004, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][18] = CreateDynamicObject(11745, 2327.259521, -1011.633178, 1049.831542, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][19] = CreateDynamicObject(1809, 2324.110351, -1017.637512, 1049.210937, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][20] = CreateDynamicObject(1809, 2322.754638, -1007.416259, 1049.190551, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][21] = CreateDynamicObject(1809, 2312.229736, -1013.027587, 1050.231445, 0.0, 0.0, 450.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][22] = CreateDynamicObject(1809, 2322.434814, -1014.157470, 1053.681030, 0.0, 0.0, 90.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][23] = CreateDynamicObject(1809, 2322.588134, -1007.215332, 1053.718750, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][24] = CreateDynamicObject(1809, 2321.595703, -1007.484069, 1049.210937, 0.0, 0.0, 270.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][25] = CreateDynamicObject(2421, 2314.373046, -1007.223876, 1050.210937, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
			burglaryDB[burglary][b_objects][26] = CreateDynamicObject(2421, 2317.651367, -1009.379760, 1050.221435, 0.0, 0.0, 0.000000, burglary, -1, -1, 50.00, 50.00); 
		}
	}
}

destroyBurglary(burglary)
{
	burglaryDB[burglary][b_inProgress] = false;

	KillTimer(burglaryDB[burglary][b_timerID]);

	for (new i = 0; i < MAX_BURGLARY_OBJECTS; i++)
		if (burglaryDB[burglary][b_objects][i] != INVALID_OBJECT_ID) DestroyDynamicObject(burglaryDB[burglary][b_objects][i]), burglaryDB[burglary][b_objects][i] = INVALID_OBJECT_ID;

	return 1;
}

hook OnPlayerDeath(playerid)
{
	if (b_HSI[playerid])
	{
		RemovePlayerAttachedObject(playerid, 7);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		b_HSI[playerid] = false;
	}

	return 1;
}

hook OnPlayerConnect(playerid)
{
	b_HSI[playerid] = false;
	return 1;
}

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{
	for (new i; i < BURGLARY_HOUSES_TYPES; i++)
	{
		if (pickupid == burglaryExitPUP[i])
		{
			if (bPlayer_houseID[playerid] == -1)
			{
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				ErrorMsg(playerid, "Buvai nuteleportuotas á spawn.");
				SetPlayerPos(playerid,-48.9388,1000.6045,23.3957);
			}
			else
			{
				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetPlayerPos(playerid, hInfo[bPlayer_houseID[playerid]][ExitX], hInfo[bPlayer_houseID[playerid]][ExitY], hInfo[bPlayer_houseID[playerid]][ExitZ]);
			}
			break;
		}
	}

	return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if (newstate == PLAYER_STATE_DRIVER)
	{
		new 
			vehicleid = GetPlayerVehicleID(playerid);

		if (!IsPlayerInAnyVehicle(playerid))
			return 0;

		for (new i; i < sizeof b_vehs; i++)
		{
			if (vehicleid != b_vehs[i][0])
				continue;

			if (playerGang[playerid] == INVALID_GANG_ID)
				return RemovePlayerFromVehicle(playerid);

			if (b_vehs[i][1] > 0)
			{
				SetPlayerMapIcon(playerid, 99, 2209.1797, -2295.2520, 14.7647, 0, 0xFFF4426E, MAPICON_GLOBAL);
				SendClientMessage(playerid, GREEN, "Daiktø pridavimo punktà þymá gelsvas kvadratas/trikampis þemëlapyje.");
			}
		}
	}
	if (oldstate == PLAYER_STATE_DRIVER)
	{
		RemovePlayerMapIcon(playerid, 99);
	}

	return 1;
}

hook OnVehicleSpawn(vehicleid)
{
	for (new i; i < sizeof b_vehs; i++)
	{
		if (vehicleid == b_vehs[i][0])
		{
			b_vehs[i][1] = 0;
			break;
		}
	}

	return 1;
}

hook OnGameModeInit()
{

	for (new g, z; g < MAX_BURGLARY_HOUSES; g++)
	{
		burglaryDB[g][b_inProgress] = false;
		burglaryDB[g][b_houseID] = -1;
		burglaryDB[g][b_timerID] = -1;
		for (z = 0; z < MAX_BURGLARY_OBJECTS; z++) burglaryDB[g][b_objects][z] = INVALID_OBJECT_ID;
		burglaryDB[g][b_houseType] = 0;
	}

	for (new x; x < BURGLARY_HOUSES_TYPES; x++)
		burglaryExitPUP[x] = CreateDynamicPickup(1318, 2, burglaryTypes[x][0], burglaryTypes[x][1], burglaryTypes[x][2]);

	b_vehs[0][0] = AddVehicle(498, -2643.771, 1333.709, 7.249, 270.540, 0, 0, 60*30, VT_BURGLARYCAR, -1);
	b_vehs[1][0] = AddVehicle(498, -2644.102, 1339.322, 7.229, 270.238, 0, 0, 60*30, VT_BURGLARYCAR, -1);
	b_vehs[2][0] = AddVehicle(498, -2644.046, 1344.729, 7.230, 271.150, 0, 0, 60*30, VT_BURGLARYCAR, -1);
	b_vehs[3][0] = AddVehicle(498, -2643.822, 1349.883, 7.229, 270.968, 0, 0, 60*30, VT_BURGLARYCAR, -1);

	CreateDynamicActor(273, -2637.6631, 1328.2549, 7.1953, 0.0);
	CreateDynamic3DTextLabel("Pasikalbëti (spausti Y)", -1, -2637.6631, 1328.2549, 7.1953, 10.0);

	CreateDynamic3DTextLabel("/priduotidaiktus", -1, 2209.1797, -2295.2520, 14.7647, 10.0);

	return 1;
}

CMD:ismestidaikta(playerid, params[])
{
	if (b_HSI[playerid])
	{
		RemovePlayerAttachedObject(playerid, 7);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		b_HSI[playerid] = false;
	}

	return 1;
}

CMD:priduotidaiktus(playerid, params[])
{
	if (!IsPlayerInRangeOfPoint(playerid, 5.0, 2209.1797, -2295.2520, 14.7647))
		return 1;

	if (!IsPlayerInAnyVehicle(playerid))
		return 0;

	if (playerGang[playerid] == INVALID_GANG_ID)
		return 1;

	new 
		vehicleid = GetPlayerVehicleID(playerid);

	for (new i; i < sizeof b_vehs; i++)
	{
		if (vehicleid != b_vehs[i][0])
			continue;

		if (b_vehs[i][1] > 0)
		{
			new str[100];

			format(str, sizeof str, "Gaujos narys %s sëkmingai uþdirbo %d eur gaujos fondui uþ pavogtus daiktus.", GetPlayerNameEx(playerid), b_vehs[i][1]);
			gang_message(playerGang[playerid], str);

			gangDB[playerGang[playerid]][gMoney] += b_vehs[i][1];
			b_vehs[i][1] = 0;

			return 1;
		}
		else return ErrorMsg(playerid, "Transporte nieko nëra");
	}

	return 1;
}

forward end_burglary(burglary);
public end_burglary(burglary)
{
	destroyBurglary(burglary);
	burglaryDB[burglary][b_timerID] = -1;
	return 1;
}

CMD:crob(playerid, params[])
{
	if (zInfo[playerid][admin] < 5)
		return 0;

	burglaryDB[playerGang[playerid]][b_houseID] = strval(params);

	return 1;
}


CMD:maph(playerid, params[])
{
	new house;

	if (sscanf(params, "i", house))
		return ErrorMsg(playerid, "/maph [namo id]");

	if (!(0 < house < MAX_HOUSES))
		return ErrorMsg(playerid, "/maph [namo id]");

	house --;

	if (!hInfo[house][hCreated])
		return ErrorMsg(playerid, "/maph [namo id]");

	SetPlayerMapIcon(playerid, 98, hInfo[house][ExitX], hInfo[house][ExitY], hInfo[house][ExitZ], 32, -1, MAPICON_GLOBAL);
	SendClientMessage(playerid, -1, "Namas paþymëtas raudonu nameliu þemëlapyje");

	return 1;
}

GetRandomHouse()
{
	mysql_query("SELECT Idas FROM houses ORDER BY RAND() LIMIT 1");
	mysql_store_result();

	new 
		temp[10], tempp;

	mysql_fetch_field_row(temp, "ID"); 
	tempp = strval(temp) + 1; 

	mysql_free_result();
	return tempp;
}