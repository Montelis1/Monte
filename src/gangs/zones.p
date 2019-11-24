
#include YSI\y_hooks

#define GZ_COL_SIL	0xf5f5c6AA		// nieko nevyksta zonoje
#define GZ_COL_OWN	0x4e9525AA		// kai zaidejo gauja turi zona
#define GZ_COL_UA	0xce2525AA		// kai uzemineja

#define GZ_COUNT 	38

#define GZ_COOLDOWN	750				// sekundemis laikas kiek zonas negales buti uziminejama
#define GZ_TAKETIME	600				// sekundemis laikas kiek zona reikes laikyti

enum e@gang_zones
{
	Float: gz_minx, Float: gz_miny, Float: gz_maxx, Float: gz_maxy,
	gz_id,

	gz_gid, gz_lastfight, bool: gz_underAttack
};

static
	gzDB[GZ_COUNT][e@gang_zones],
	timer_gztake[GZ_COUNT],
	gzUA_progress[GZ_COUNT];


forward gzTakeSync(gangid, zoneid);
forward gzMoneySync();

gz_load()
{
	new const Float: gzz[GZ_COUNT][4] =
	{
		{-2962.0, 1042.0, -2863.0, 1214.0},
		{-2863.0, 998.0, -2764.0, 1250.0},
		{-2962.0, 791.0, -2863.0, 1043.0},
		{-2863.0, 746.0, -2764.0, 998.0},
		{-2962.0, 638.0, -2863.0, 791.0},
		{-2764.0, 1135.0, -2664.0, 1273.0},
		{-2764.0, 997.0, -2525.0, 1135.0},
		{-2764.0, 916.0, -2524.0, 997.0},
		{-2764.0, 812.0, -2603.0, 916.0},
		{-2603.0, 812.0, -2524.0, 916.0},
		{-2524.0, 806.0, -2383.0, 916.0},
		{-2525.0, 917.0, -2384.0, 1137.0},
		{-2384.0, 807.0, -2261.0, 962.0},
		{-2261.0, 807.0, -2138.0, 1025.0},
		{-2261.0, 1025.0, -2138.0, 1176.0},
		{-2384.0, 962.0, -2261.0, 1137.0},
		{-2665.0, 1131.0, -2477.0, 1273.0},
		{-2477.0, 1135.0, -2261.0, 1275.0},
		{-2261.0, 1176.0, -2100.0, 1274.0},
		{-2100.0, 1176.0, -1887.0, 1275.0},
		{-2138.0, 1079.0, -1966.0, 1176.0},
		{-1966.0, 1079.0, -1888.0, 1176.0},
		{-2138.0, 966.0, -2002.0, 1079.0},
		{-2138.0, 897.0, -2002.0, 967.0},
		{-2138.0, 809.0, -2002.0, 898.0},
		{-2002.0, 930.0, -1888.0, 1079.0},
		{-1887.0, 930.0, -1791.0, 1101.0},
		{-1887.0, 1102.0, -1791.0, 1191.0},
		{-1791.0,  930.0, -1711.0, 1101.0},
		{-1791.0, 1103.0, -1710.0, 1191.0},
		{-2666.0, 1273.0, -2478.0, 1413.0},
		{-2477.0, 1273.0, -2289.0, 1413.0},
		{-2289.0, 1274.0, -2101.0, 1372.0},
		{-2103.0, 1274.0, -1917.0, 1372.0},
		{-1886.0, 1191.0, -1708.0, 1275.0},
		{-1917.0, 1275.0, -1669.0, 1371.0},
		{-1709.0, 933.0, -1565.0, 1275.0},
		{-2001.0, 845.0, -1714.0, 929.0}
	};

	for (new i, g; i < GZ_COUNT; i++)
	{
		g = GangZoneCreate(floatsub(gzz[i][0], floatfract(gzz[i][0])), floatsub(gzz[i][1], floatfract(gzz[i][1])), floatsub(gzz[i][2], floatfract(gzz[i][2])), floatsub(gzz[i][3], floatfract(gzz[i][3])));
		
		gzDB[i][gz_id] = g;

		gzDB[i][gz_minx] = gzz[i][0];
		gzDB[i][gz_miny] = gzz[i][1];
		gzDB[i][gz_maxx] = gzz[i][2];
		gzDB[i][gz_maxy] = gzz[i][3];
	}

	mysql_query ("SELECT * FROM gangs_zones");
	mysql_store_result();

	new x, temp[50];

	for (new i; i < GZ_COUNT; i++)
		gzDB[i][gz_gid] = INVALID_GANG_ID;

	while (mysql_retrieve_row())
	{
		mysql_fetch_field_row(temp, "zoneid"); 
		x = strval(temp);
		mysql_fetch_field_row(temp, "gangid"); gzDB[x][gz_gid] = strval(temp);
		mysql_fetch_field_row(temp, "lastfight"); gzDB[x][gz_lastfight] = strval(temp);
	}

	mysql_free_result();

	/*new 
		File: zx = fopen("gangzones.txt", io_read), 
		buf[128], a;
	 
	if (zx)
	{
		while(fread(zx, buf) && a != GZ_COUNT)
		{
			sscanf(buf, "ii", gzDB[a][gz_gid], gzDB[a][gz_lastfight]);
			a++;
		}

		fclose(zx);
	}
	else print("[gangs/zones.p] nerastas gangzones.txt failas");*/

	return 1;
}

gz_save()
{
	new
		str[300];

	mysql_query("TRUNCATE TABLE gangs_zones;");

	for (new i; i < GZ_COUNT; i++)
	{
		format(str, sizeof str,
			"INSERT INTO gangs_zones (zoneid, gangid, lastfight) VALUES (%d, %d, %d);",
			i, gzDB[i][gz_gid], gzDB[i][gz_lastfight]);
		mysql_query(str);
	}
}

/*gz_save()
{
	new 
		File: zx = fopen("gangzones.txt", io_write), 
		buf[128];

	if (zx)
	{
		for (new i; i < GZ_COUNT; i++)
		{
			format(buf, sizeof buf, "%i %i \n", gzDB[i][gz_gid], gzDB[i][gz_lastfight]);
			fwrite(zx, buf);
		}
		fclose(zx);
	}
	else print("[gangs/zones.p] nerastas gangzones.txt failas");
}*/

gz_getzoneid(playerid)
{
	for (new i; i < GZ_COUNT; i++)
	{
		if(IsPlayerInGangZone(playerid, i)) return i;
	}

	return INVALID_GANG_ID;
}

CMD:uzimtizona(playerid, params[])
{
	if (playerGang[playerid] == INVALID_GANG_ID) 
		return 0;

	if (gangDB[playerGang[playerid]][gReps] < GZ_REPS_REQ)
		return ErrorMsg(playerid, "Tavo gauja neturi pakankamai rep taðkø ("#GZ_REPS_REQ").");

	new 
		g = gz_getzoneid(playerid), Float: x, Float: y;

	if (g == INVALID_GANG_ID) return ErrorMsg(playerid, "Neesi gaujos zonoje!");
	if (gzDB[g][gz_lastfight] > gettime()) return ErrorMsg(playerid, "Ðios zonos dar uþimti negalimà!");
	if (gzDB[g][gz_gid] == INVALID_GANG_ID)
	{
		timer_gztake[g] = SetTimerEx("gzTakeSync", 1000, true, "ii", playerGang[playerid], g);
		gzDB[g][gz_lastfight] = gettime() + GZ_COOLDOWN;
		gzDB[g][gz_underAttack] = true;
		gzUA_progress[g] = GZ_TAKETIME;

		gang_message(playerGang[playerid], "{00CC00}Laisva gaujø zona pradëta uþiminëti...");
		foreach(new p : Player)
			syncGZToPlayer(p);

		return 1;
	}
	if (gzDB[g][gz_gid] == playerGang[playerid]) return ErrorMsg(playerid, "Savo gaujos zonos uþiminëti nereikia!");
	if (!isActiveGangLeads(gzDB[g][gz_gid])) return ErrorMsg(playerid, "Nëra aktyviø gaujos zonos savininkø");

	if (!strcmp(GetPlayerNameEx(playerid), gangDB[playerGang[playerid]][gLeaderName]) || playerGangCo[playerid])
	{
		timer_gztake[g] = SetTimerEx("gzTakeSync", 1000, true, "ii", playerGang[playerid], g);
		gzDB[g][gz_lastfight] = gettime() + GZ_COOLDOWN;
		gzDB[g][gz_underAttack] = true;
		gzUA_progress[g] = GZ_TAKETIME;

		GetZoneMiddlePos(g, x, y);

		new 
			str[100];

		format(str, sizeof str, "Gaujai priklausanti zona esanti %s buvo uþpulta %s gaujos.", GetZoneName(x, y, 20.0), gangDB[playerGang[playerid]][gName]);

		foreach(new p : Player)
		{
			if (playerGang[p] == playerGang[playerid])
			{
				SendClientMessage(p, GREEN, "Kitos gaujos zona sëkmingai pradëta uþiminëti");
				syncGZToPlayer(p);
			}
			if (playerGang[p] == gzDB[g][gz_gid])
			{
				SendClientMessage(p, RED, str);
				syncGZToPlayer(p);
			}
		}

	}
	else ErrorMsg(playerid, "Neesi savo gaujos pavaduotojas arba vadas!");

	return 1;
}

syncGZToPlayer(playerid)
{
	for (new i; i < GZ_COUNT; i++)
	{
		if (playerGang[playerid] == INVALID_GANG_ID) 
		{
			GangZoneHideForPlayer(playerid, gzDB[i][gz_id]); 
			continue;
		}
		if (gzDB[i][gz_gid] == playerGang[playerid])
			GangZoneShowForPlayer(playerid, gzDB[i][gz_id], GZ_COL_OWN);
		else
			GangZoneShowForPlayer(playerid, gzDB[i][gz_id], GZ_COL_SIL);

		if (gzDB[i][gz_underAttack])
			GangZoneFlashForPlayer(playerid, gzDB[i][gz_id], GZ_COL_UA);
		else
			GangZoneStopFlashForPlayer(playerid, gzDB[i][gz_id]);
	}

	return 1;
}

countZoneGangs(gangid, zoneid)
{
	new x;

	foreach(new p : Player)
		if (playerGang[p] == gangid && IsPlayerInGangZone(p, zoneid)) x++;
	return x;
}

GetZoneMiddlePos(zoneid, &Float:x, &Float:y)
{
	x = (gzDB[zoneid][gz_maxx]+gzDB[zoneid][gz_minx]) / 2;
	y = (gzDB[zoneid][gz_maxy]+gzDB[zoneid][gz_miny]) / 2;
}

public gzTakeSync(gangid, zoneid)
{
	if (countZoneGangs(gangid, zoneid) == 0)
	{
		gzDB[zoneid][gz_underAttack] = false;
		KillTimer(timer_gztake[zoneid]);
		timer_gztake[zoneid] = -1;

		foreach(new p : Player)
		{
			if (playerGang[p] == gangid)
			{
				SendClientMessage(p, RED, "Zonos perimti neiðëjo.");
				syncGZToPlayer(p);
			}
			if (gzDB[zoneid][gz_gid] != INVALID_GANG_ID)
			{
				if (playerGang[p] == gzDB[zoneid][gz_gid])
				{
					SendClientMessage(p, GREEN, "Zona apginta sëkmingai");
					syncGZToPlayer(p);
				}
			}
		}

		return 1;
	}

	if (--gzUA_progress[zoneid] == 0)
	{
		gzDB[zoneid][gz_underAttack] = false;
		KillTimer(timer_gztake[zoneid]);
		timer_gztake[zoneid] = -1;

		new oldgangid = gzDB[zoneid][gz_gid];
		gzDB[zoneid][gz_gid] = gangid;

		gangDB[gangid][gReps] += 6;

		foreach(new p : Player)
		{
			if (playerGang[p] == gangid)
			{
				SendClientMessage(p, GREEN, "Gaujai pavyko perimti zona");
				syncGZToPlayer(p);
			}
			if (oldgangid != INVALID_GANG_ID)
			{
				if (playerGang[p] == oldgangid)
				{
					SendClientMessage(p, RED, "Gaujos zona prarasta");
					syncGZToPlayer(p);
				}
			}
		}

		return 1;
	}

	new 
		str[50];

	format(str, sizeof str, "Iki zonos perimimo liko   %d s", gzUA_progress[zoneid]);

	foreach(new p : Player)
	{	
		if (playerGang[p] == gangid && IsPlayerInArea(p, gzDB[zoneid][gz_maxx], gzDB[zoneid][gz_minx], gzDB[zoneid][gz_maxy], gzDB[zoneid][gz_miny]))
		{
			GameTextForPlayer(p, str, 1100, 4);
		}
	}

	return 1;
}

OnGameModeInit_ZONES()
{
	gz_load();
	SetTimer("gzMoneySync", 60000*60, true);
	return 1;
}

OnGameModeExit_ZONES()
{
	gz_save();
	return 1;
}

public gzMoneySync()
{
	for (new i; i < GZ_COUNT; i++)
	{
		if (gzDB[i][gz_gid] != INVALID_GANG_ID)
			gangDB[gzDB[i][gz_gid]][gMoney] += GZ_PAYOUT;
	}

	return 1;
}

IsPlayerInGangZone(playerid, zoneid)
{
    new
    	Float:PosX, Float:PosY, Float:PosZ;

    GetPlayerPos(playerid, PosX, PosY, PosZ);
    if((gzDB[ zoneid ][ gz_minx ] < PosX) && (gzDB[ zoneid ][ gz_maxx ] > PosX) && (gzDB[ zoneid ][ gz_miny ] < PosY) && (gzDB[ zoneid ][ gz_maxy ] > PosY)) return true;
    else return false;
}

countGZOwnerByGang(gangid)
{
	new j;
	for (new i; i < GZ_COUNT; i++)
	{
		if (gzDB[i][gz_gid] == gangid)
			j++;
	}
	return j;
}


resetGZ(gangid)
{
	for (new i; i < GZ_COUNT; i++)
	{
		if (gzDB[i][gz_gid] == gangid)
			gzDB[i][gz_gid] = INVALID_GANG_ID;
	}
}