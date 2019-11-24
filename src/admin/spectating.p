
stock Float:GetDistanceBetweenPoints(Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2) //By Gabriel "Larcius" Cordes
{
    return floatadd(floatadd(floatsqroot(floatpower(floatsub(x1,x2),2)),floatsqroot(floatpower(floatsub(y1,y2),2))),floatsqroot(floatpower(floatsub(z1,z2),2)));
}


#define COLOR_SPECTATING 0xFFFFFFFF

static

	PLAYER_SPECTATING_ID		[MAX_PLAYERS] = {INVALID_PLAYER_ID, ...},

	Text: pzuTD,
	PlayerText: pzuPTD			[MAX_PLAYERS];

#include YSI\y_hooks

forward PZU_SYNC();

CMD:stebeti(playerid, params[])
{
    if(zInfo[playerid][ikalintas]) return SendClientMessage(playerid, RED, "{EB3232}« Jûs kalëjime!");
    if(BankoBomba == 1 && IsPlayerInRangeOfPoint(playerid, 150, -451.4993,-1246.2987,2999.8909)) return SendClientMessage(playerid, -1, "Vyksta banko grobimas todël komandos naudoti negalite!");
    if(NarkuBomba == 1 && IsPlayerInRangeOfPoint(playerid, 150, 262.9246,228.1310,1007.6704)) return SendClientMessage(playerid, -1, "Vyksta narkotikø saugyklos grobimas todël komandos naudoti negalite!");

    if(zInfo[playerid][admin] < 1 && !zInfo[playerid][aPriziuretojas] && !zInfo[playerid][ePriziuretojas] && !zInfo[playerid][vPriziuretojas] && !zInfo[playerid][dPriziuretojas] && !zInfo[playerid][bPriziuretojas]) return 0;

    if (PLAYER_SPECTATING_ID[playerid] != INVALID_PLAYER_ID) return TogglePlayerPzuMode(playerid);

    if(Pazymetas[playerid] == 1) return SendClientMessage(playerid, RED, "{EB3232}« Jûs esate paþymëtas bëgliu!");
    if(Tazed[playerid]) return SendClientMessage(playerid, RED, "{EB3232}« Jûs esate paðautas tazerio!");

    new id;

    if(sscanf(params, "u",id)) return SendClientMessage(playerid, BLUE, "{ff9966}• I • {FFFFFF}Priþiûrëti þaidëja: /stebeti [Vardas_Pavarde]");
    else if(id == INVALID_PLAYER_ID) return SendClientMessage(playerid, RED, "{EB3232}« Tokio þaidëjo nëra");

    else if(zInfo[playerid][suristas] == true) return SendClientMessage(playerid, RED, "{EB3232}« Jûs esate suriðtas!");
    else if(zInfo[playerid][cuffed] == true) return SendClientMessage(playerid, RED, "{EB3232}« Jûs esate surakintas!");
    else if(zInfo[id][admin] == 5) return SendClientMessage(playerid, RED, "{EB3232}« Negraþu taip daryt :)");

    else if(id == playerid) return SendClientMessage(playerid, RED, "{EB3232}« Savæs stebëti negalite!");
    else TogglePlayerPzuMode(playerid, id);

    return 1;
}

TogglePlayerPzuMode(playerid, pzuplayer = INVALID_PLAYER_ID)
{
	if (pzuplayer != INVALID_PLAYER_ID) 
	{
		for(new slot=3; slot<12; slot++) GetPlayerWeaponData(playerid,slot,zInfo[playerid][spdata][slot],zInfo[playerid][spdata][12+slot]);

        zInfo[playerid][spdata][24] = GetPlayerSkin(playerid);
       	GetPlayerPos(playerid, zInfo[playerid][spos][0], zInfo[playerid][spos][1], zInfo[playerid][spos][2]);

        zInfo[playerid][spdata][26] = GetPlayerInterior(playerid);
        zInfo[playerid][spdata][27] = GetPlayerVirtualWorld(playerid);

        SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(pzuplayer));
        SetPlayerInterior(playerid, GetPlayerInterior(pzuplayer));

        TogglePlayerSpectating(playerid,true);
        PlayerSpectatePlayer(playerid,pzuplayer);

        new vardas[MAX_PLAYER_NAME], masyvas[128];

        GetPlayerName(pzuplayer, vardas, sizeof(vardas));
        format(masyvas, sizeof(masyvas), "*** Priþiûrite %s þaidëja.",vardas);
        SendClientMessage(playerid, GREEN, masyvas);

        AntiCheatSystem[playerid][pNoCheckAirbreak] = 5;
        zInfo[playerid][Mires] = 0;

        if(IsPlayerInAnyVehicle(pzuplayer))
        {
            TogglePlayerSpectating(playerid, 1);
            PlayerSpectateVehicle(playerid, GetPlayerVehicleID(pzuplayer));
        }
        else
        {
            TogglePlayerSpectating(playerid, 1);
            PlayerSpectatePlayer(playerid, pzuplayer);
        }

        new string[128];

        TextDrawShowForPlayer(playerid, pzuTD);
        format (string, sizeof string, "%s~n~~y~%d_PING~g~_%.1f_PL~r~_%d_kmh", GetPlayerNameEx(pzuplayer), GetPlayerPing(pzuplayer), NetStats_PacketLossPercent(pzuplayer), GetPlayerSpeed(pzuplayer));
		PlayerTextDrawSetString(playerid, pzuPTD[playerid], string);
		PlayerTextDrawShow(playerid, pzuPTD[playerid]);

        PLAYER_SPECTATING_ID[playerid] = pzuplayer;
	}
	else if (PLAYER_SPECTATING_ID[playerid] != INVALID_PLAYER_ID)
	{
		if(GetPlayerState(playerid) == PLAYER_STATE_SPECTATING)
        {
            TogglePlayerSpectating(playerid,false);

            for(new slot=0; slot<12; slot++) GivePlayerWeaponsEx(playerid,zInfo[playerid][spdata][slot],zInfo[playerid][spdata][12+slot]);

            SetPlayerSkin(playerid,zInfo[playerid][spdata][24]);
            SetPlayerPos(playerid,zInfo[playerid][spos][0],zInfo[playerid][spos][1],zInfo[playerid][spos][2]);

            SetPlayerInterior(playerid,zInfo[playerid][spdata][26]);
            SetPlayerVirtualWorld(playerid,zInfo[playerid][spdata][27]);

            AntiCheatSystem[playerid][pNoCheckAirbreak] = 5;
            zInfo[playerid][Mires] = 0;
            zInfo[playerid][vApmokymai] = 2;

            PlayerTextDrawHide(playerid, pzuPTD[playerid]);
			TextDrawHideForPlayer(playerid, pzuTD);

            PLAYER_SPECTATING_ID[playerid] = INVALID_PLAYER_ID;
        }
	}

	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	foreach(Player, i)
	{
		if (PLAYER_SPECTATING_ID[i] == playerid)
		{
			SendClientMessage(playerid, COLOR_SPECTATING, "[PZU] Stebimas þaidëjas atsijungë");
			TogglePlayerPzuMode(playerid, 0);
		}
	}

	if (PLAYER_SPECTATING_ID[playerid] != INVALID_PLAYER_ID)
	{
		TogglePlayerPzuMode(playerid, 0);
	}

	return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	foreach(Player, i)
	{
		if (PLAYER_SPECTATING_ID[i] == playerid)
		{
			if (newstate == PLAYER_STATE_ONFOOT)
			{
				PlayerSpectatePlayer(playerid, PLAYER_SPECTATING_ID[i]);
			}
			else if (newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
			{
				PlayerSpectateVehicle(playerid, GetPlayerVehicleID(PLAYER_SPECTATING_ID[i]));
			}
			else if (newstate == PLAYER_STATE_SPECTATING || newstate == PLAYER_STATE_NONE)
			{
				TogglePlayerPzuMode(playerid);
				SendClientMessage(playerid, COLOR_SPECTATING, "[PZU] Þaidëjo nebeámanoma stebëti");
			}
		}
	}

	return 1;
}

public PZU_SYNC()
{
	new
		string[128];

	foreach(Player, i)
	{
		if (PLAYER_SPECTATING_ID[i] != INVALID_PLAYER_ID)
		{
			if (!IsPlayerConnected(PLAYER_SPECTATING_ID[i]))
			{
				TogglePlayerPzuMode(i);
				continue;
			}

			TextDrawShowForPlayer(i, pzuTD);
			format (string, sizeof string, "%s~n~~y~%d_PING~g~_%.1f_PL~r~_%d_kmh", GetPlayerNameEx(PLAYER_SPECTATING_ID[i]), GetPlayerPing(PLAYER_SPECTATING_ID[i]), NetStats_PacketLossPercent(PLAYER_SPECTATING_ID[i]), GetPlayerSpeed(PLAYER_SPECTATING_ID[i]));
			PlayerTextDrawSetString(i, pzuPTD[i], string);
			PlayerTextDrawShow(i, pzuPTD[i]);
		}
	}

	return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
	new string[128], weaponname[32], Float: pxyz[3], Float: kxyz[3];

	if (killerid != INVALID_PLAYER_ID)
	{
		GetWeaponName(reason, weaponname, sizeof weaponname);

		GetPlayerPos(playerid, pxyz[0],  pxyz[1],  pxyz[2]);
		GetPlayerPos(killerid, kxyz[0],  kxyz[1],  kxyz[2]);

		format (string, sizeof string, "[PZU] Stebimas þaidëjas nuþudë %s su %s (atstumas %.1f)", GetPlayerNameEx(playerid), weaponname, GetDistanceBetweenPoints(pxyz[0],  pxyz[1],  pxyz[2],    kxyz[0],  kxyz[1],  kxyz[2]));

		foreach(Player, i)
		{
			if (PLAYER_SPECTATING_ID[i] == killerid)
			{
				SendClientMessage(i, -1, string);
			}
		}
	}

	return 1;
}

hook OnGameModeInit()
{
	SetTimer("PZU_SYNC", 400, true);

	pzuTD = TextDrawCreate(500.5000, 151.5000, "box");
	TextDrawFont(pzuTD, 1);
	TextDrawLetterSize(pzuTD, -0.0000, 2.5000);
	TextDrawColor(pzuTD, -256);
	TextDrawSetShadow(pzuTD, 0);
	TextDrawSetOutline(pzuTD, 0);
	TextDrawBackgroundColor(pzuTD, 170);
	TextDrawSetProportional(pzuTD, 1);
	TextDrawUseBox(pzuTD, 1);
	TextDrawBoxColor(pzuTD, 170);
	TextDrawTextSize(pzuTD, 610.0000, 340.0000);

	return 1;
}

hook OnPlayerConnect(playerid)
{
	PLAYER_SPECTATING_ID[playerid] = INVALID_PLAYER_ID;

	pzuPTD[playerid] = CreatePlayerTextDraw(playerid, 503.5000, 152.5000, "Me~n~~y~20_PING~g~_0.1_PL~r~_50_kmh");
	PlayerTextDrawFont(playerid, pzuPTD[playerid], 1);
	PlayerTextDrawLetterSize(playerid, pzuPTD[playerid], 0.2500, 1.1000);
	PlayerTextDrawColor(playerid, pzuPTD[playerid], -1);
	PlayerTextDrawSetShadow(playerid, pzuPTD[playerid], 0);
	PlayerTextDrawSetOutline(playerid, pzuPTD[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, pzuPTD[playerid], 255);
	PlayerTextDrawSetProportional(playerid, pzuPTD[playerid], 1);
	PlayerTextDrawTextSize(playerid, pzuPTD[playerid], 750.0000, 100.0000);

	return 1;
}
