

#define MAX_PB_WEAPONS 2

#define PAINTBALL_PICKUP_POS 110.3893,1106.6693,13.6094

#include YSI\y_hooks

enum _:PAINT_BALL_TEAMS
{
	INVALID_PAINTBALL_TEAM = -1,

	PAINTBALL_TEAM_RED,
	PAINTBALL_TEAM_BLUE
}

enum E_PAINTBALL_ROOM
{
	pb_MaxPlayers,
	pb_RoundTime,

	pb_name[32],
	pb_weapons[MAX_PB_WEAPONS],
	pb_skins[2],
	Float: pb_spawn[6],

	pb_interior
}

enum E_PAINTBALL_ROOM_IG
{
	pbg_RoundStarted,
	pbg_TeamPoints[2]
}

#define DIALOG_PAINTBALL 15975
#define DIALOG_PAINTBALL_TEAM 15977

forward PAINTBALL_SYNC();

static const
	
	PAINTBALL_ROOM [][E_PAINTBALL_ROOM] =
	{
		// MaxPlayers, RoundTime, Name, Weapons, Skins, Spawn, Interior
		{1, 300, "1v1", {24, 25}, {176, 170}, {-975.975708,1060.983032,1345.671875,  -1129.2850,1058.1288,1346.4141}, 10}, 
		{3, 300, "3v3", {24, 25}, {176, 170}, {1062.2499,2077.1077,10.8203, 1064.6577,2140.4011,10.8203}, 0},
		{5, 300, "5v5", {24, 25}, {176, 170}, {1301.0862,2.7379,1001.0239, 1276.8737,-56.6528,1002.5021}, 18}
	};

static

	PAINTBALL_ROOM_IG [sizeof PAINTBALL_ROOM][E_PAINTBALL_ROOM_IG],
	PLAYER_PAINTBALL_TEAM [MAX_PLAYERS] = {INVALID_PAINTBALL_TEAM, ...},
	PLAYER_PAINTBALL_ROOM [MAX_PLAYERS] = {-1, ...},

	PlayerText: paintballPTD[MAX_PLAYERS][3],

	PAINTBALL_PICKUP,
	PLAYER_SELECTED_ROOM [MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
	PLAYER_PAINTBALL_TEAM[playerid] = INVALID_PAINTBALL_TEAM;

	paintballPTD[playerid][0] = CreatePlayerTextDraw(playerid, 300.5000, 19.5000, "300");
	PlayerTextDrawFont(playerid, paintballPTD[playerid][0], 3);
	PlayerTextDrawLetterSize(playerid, paintballPTD[playerid][0], 0.4499, 3.5000);
	PlayerTextDrawAlignment(playerid, paintballPTD[playerid][0], 2);
	PlayerTextDrawColor(playerid, paintballPTD[playerid][0], -1);
	PlayerTextDrawSetShadow(playerid, paintballPTD[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, paintballPTD[playerid][0], 3);
	PlayerTextDrawBackgroundColor(playerid, paintballPTD[playerid][0], 255);
	PlayerTextDrawSetProportional(playerid, paintballPTD[playerid][0], 1);
	PlayerTextDrawTextSize(playerid, paintballPTD[playerid][0], 0.0000, 0.0000);

	paintballPTD[playerid][1] = CreatePlayerTextDraw(playerid, 266.5000, 24.5000, "blue");
	PlayerTextDrawFont(playerid, paintballPTD[playerid][1], 3);
	PlayerTextDrawLetterSize(playerid, paintballPTD[playerid][1], 0.4000, 2.5000);
	PlayerTextDrawAlignment(playerid, paintballPTD[playerid][1], 2);
	PlayerTextDrawColor(playerid, paintballPTD[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, paintballPTD[playerid][1], 0);
	PlayerTextDrawSetOutline(playerid, paintballPTD[playerid][1], 3);
	PlayerTextDrawBackgroundColor(playerid, paintballPTD[playerid][1], 421097727);
	PlayerTextDrawSetProportional(playerid, paintballPTD[playerid][1], 1);
	PlayerTextDrawTextSize(playerid, paintballPTD[playerid][1], 0.0000, 0.0000);

	paintballPTD[playerid][2] = CreatePlayerTextDraw(playerid, 334.5000, 24.5000, "red");
	PlayerTextDrawFont(playerid, paintballPTD[playerid][2], 3);
	PlayerTextDrawLetterSize(playerid, paintballPTD[playerid][2], 0.4000, 2.5000);
	PlayerTextDrawAlignment(playerid, paintballPTD[playerid][2], 2);
	PlayerTextDrawColor(playerid, paintballPTD[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, paintballPTD[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, paintballPTD[playerid][2], 3);
	PlayerTextDrawBackgroundColor(playerid, paintballPTD[playerid][2], -1962934017);
	PlayerTextDrawSetProportional(playerid, paintballPTD[playerid][2], 1);
	PlayerTextDrawTextSize(playerid, paintballPTD[playerid][2], 0.0000, 0.0000);

	return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
	if (PLAYER_PAINTBALL_TEAM[playerid] != INVALID_PAINTBALL_TEAM)
	{	
		TogglePlayerPaintball (playerid);
	}	

	return 1;
}

hook OnPlayerSpawn(playerid)
{
	if (PLAYER_PAINTBALL_TEAM[playerid] != INVALID_PAINTBALL_TEAM)
	{
		GivePlayerWeaponsEx(playerid, PAINTBALL_ROOM[PLAYER_PAINTBALL_ROOM[playerid]][pb_weapons][0], 5000);
		GivePlayerWeaponsEx(playerid, PAINTBALL_ROOM[PLAYER_PAINTBALL_ROOM[playerid]][pb_weapons][1], 5000);

		SetPlayerTeam(playerid, PLAYER_PAINTBALL_TEAM[playerid]);

		SetPlayerArmour(playerid, 99);
		SetPlayerHealth(playerid, 99);

		new 
			team = PLAYER_PAINTBALL_TEAM[playerid],
			room = PLAYER_PAINTBALL_ROOM[playerid];

		SetPlayerVirtualWorld(playerid, PLAYER_PAINTBALL_ROOM[playerid]+1000);
		SetPlayerInterior(playerid, PAINTBALL_ROOM[room][pb_interior]);
		SetPlayerSkin(playerid, PAINTBALL_ROOM[room][pb_skins][team]);

	    if (team == PAINTBALL_TEAM_RED)
	    {
	    	SetPlayerPos(playerid, PAINTBALL_ROOM[room][pb_spawn][0], PAINTBALL_ROOM[room][pb_spawn][1], PAINTBALL_ROOM[room][pb_spawn][2]+0.1);
	    }
	    else
	    {
	    	SetPlayerPos(playerid, PAINTBALL_ROOM[room][pb_spawn][3], PAINTBALL_ROOM[room][pb_spawn][4], PAINTBALL_ROOM[room][pb_spawn][5]+0.1);
	    }
	}

	return 1;
}

TogglePlayerPaintball (playerid, room = -1, team = INVALID_PAINTBALL_TEAM)
{
	if (PLAYER_PAINTBALL_TEAM[playerid] != INVALID_PAINTBALL_TEAM)
	{
		for(new slot=0; slot<12; slot++) GivePlayerWeaponsEx(playerid,zInfo[playerid][spdata][slot],zInfo[playerid][spdata][12+slot]);
            
        SetPlayerSkin(playerid,zInfo[playerid][spdata][24]);
        SetPlayerPos(playerid,zInfo[playerid][spos][0],zInfo[playerid][spos][1],zInfo[playerid][spos][2]);

        SetPlayerInterior(playerid,zInfo[playerid][spdata][26]);
        SetPlayerVirtualWorld(playerid,zInfo[playerid][spdata][27]);

        PLAYER_PAINTBALL_TEAM[playerid] = INVALID_PAINTBALL_TEAM;

        PlayerTextDrawHide(playerid, paintballPTD[playerid][0]);
        PlayerTextDrawHide(playerid, paintballPTD[playerid][1]);
        PlayerTextDrawHide(playerid, paintballPTD[playerid][2]);

        SetPlayerTeam(playerid, NO_TEAM);
	}
	else
	{
		for(new slot=3; slot<12; slot++) GetPlayerWeaponData(playerid,slot,zInfo[playerid][spdata][slot],zInfo[playerid][spdata][12+slot]);
        
        zInfo[playerid][spdata][24] = GetPlayerSkin(playerid);
       	GetPlayerPos(playerid, zInfo[playerid][spos][0], zInfo[playerid][spos][1], zInfo[playerid][spos][2]);

        zInfo[playerid][spdata][26] = GetPlayerInterior(playerid);
        zInfo[playerid][spdata][27] = GetPlayerVirtualWorld(playerid);



        PLAYER_PAINTBALL_TEAM[playerid] = team;
        PLAYER_PAINTBALL_ROOM[playerid] = room;

        ResetPlayerWeaponsEx(playerid);

        if (team == PAINTBALL_TEAM_RED)
        {
        	SetSpawnInfo(playerid, team, PAINTBALL_ROOM[room][pb_skins][team], PAINTBALL_ROOM[room][pb_spawn][0], PAINTBALL_ROOM[room][pb_spawn][1], PAINTBALL_ROOM[room][pb_spawn][2],
        	0.0, 0, 0, 0, 0, 0, 0);
        }
        else
        {
        	SetSpawnInfo(playerid, team, PAINTBALL_ROOM[room][pb_skins][team], PAINTBALL_ROOM[room][pb_spawn][3], PAINTBALL_ROOM[room][pb_spawn][4], PAINTBALL_ROOM[room][pb_spawn][5],
        	0.0, 0, 0, 0, 0, 0, 0);
        }

        GivePlayerWeaponsEx(playerid, PAINTBALL_ROOM[PLAYER_PAINTBALL_ROOM[playerid]][pb_weapons][0], 5000);
		GivePlayerWeaponsEx(playerid, PAINTBALL_ROOM[PLAYER_PAINTBALL_ROOM[playerid]][pb_weapons][1], 5000);

		SetPlayerTeam(playerid, PLAYER_PAINTBALL_TEAM[playerid]);

		SetPlayerArmour(playerid, 99);
		SetPlayerHealth(playerid, 99);

		SetPlayerVirtualWorld(playerid, PLAYER_PAINTBALL_ROOM[playerid]+1000);
		SetPlayerInterior(playerid, PAINTBALL_ROOM[room][pb_interior]);
		SetPlayerSkin(playerid, PAINTBALL_ROOM[room][pb_skins][team]);

		if (team == PAINTBALL_TEAM_RED)
	    {
	    	SetPlayerPos(playerid, PAINTBALL_ROOM[room][pb_spawn][0], PAINTBALL_ROOM[room][pb_spawn][1], PAINTBALL_ROOM[room][pb_spawn][2]+0.1);
	    }
	    else
	    {
	    	SetPlayerPos(playerid, PAINTBALL_ROOM[room][pb_spawn][3], PAINTBALL_ROOM[room][pb_spawn][4], PAINTBALL_ROOM[room][pb_spawn][5]+0.1);
	    }

        new string[5];

        format (string, sizeof string, "%d", PAINTBALL_ROOM_IG[room][pbg_RoundStarted] - gettime());
        PlayerTextDrawSetString(playerid, paintballPTD[playerid][0], string);

        format (string, sizeof string, "%d", PAINTBALL_ROOM_IG[room][pbg_TeamPoints][PAINTBALL_TEAM_RED]);
        PlayerTextDrawSetString(playerid, paintballPTD[playerid][2], string);

		format (string, sizeof string, "%d", PAINTBALL_ROOM_IG[room][pbg_TeamPoints][PAINTBALL_TEAM_BLUE]);
		PlayerTextDrawSetString(playerid, paintballPTD[playerid][1], string);

		PlayerTextDrawShow(playerid, paintballPTD[playerid][0]);
        PlayerTextDrawShow(playerid, paintballPTD[playerid][1]);
        PlayerTextDrawShow(playerid, paintballPTD[playerid][2]);
	}
}

SendMessageToPaintBall(room, const string[])
{
	foreach (Player, playerid)
	{
		if (PLAYER_PAINTBALL_ROOM[playerid] == room)
		{
			SendClientMessage(playerid, -1, string);
		}
	}
}

hook OnPlayerDeath(playerid, killerid, reason)
{
	if (PLAYER_PAINTBALL_TEAM[playerid] != INVALID_PAINTBALL_TEAM && PLAYER_PAINTBALL_ROOM[playerid] != -1)
	{
		if (killerid != INVALID_PLAYER_ID)
		{
			if (PLAYER_PAINTBALL_TEAM[killerid] == PLAYER_PAINTBALL_TEAM[playerid])
				return 1;

			new string[128], string0[5], string1[5];

			PAINTBALL_ROOM_IG[PLAYER_PAINTBALL_ROOM[playerid]][pbg_TeamPoints][PLAYER_PAINTBALL_TEAM[killerid]] ++;

			format (string, sizeof string, "[DAÞASVAIDYS] %s%s{ffffff} nuþudë %s%s {ffffff}(taðkai {FF0000}%d {00B8D8}%d)",
			(PLAYER_PAINTBALL_TEAM[killerid] == PAINTBALL_TEAM_RED ? ("{FF0000}") : ("{00B8D8}")), GetPlayerNameEx(killerid),
			(PLAYER_PAINTBALL_TEAM[playerid] == PAINTBALL_TEAM_RED ? ("{FF0000}") : ("{00B8D8}")), GetPlayerNameEx(playerid),
			PAINTBALL_ROOM_IG[PLAYER_PAINTBALL_ROOM[killerid]][pbg_TeamPoints][0], PAINTBALL_ROOM_IG[PLAYER_PAINTBALL_ROOM[killerid]][pbg_TeamPoints][1]);

			SendMessageToPaintBall(PLAYER_PAINTBALL_ROOM[killerid], string);

			format (string0, sizeof string0, "%d", PAINTBALL_ROOM_IG[PLAYER_PAINTBALL_ROOM[playerid]][pbg_TeamPoints][PAINTBALL_TEAM_RED]);
			format (string1, sizeof string1, "%d", PAINTBALL_ROOM_IG[PLAYER_PAINTBALL_ROOM[playerid]][pbg_TeamPoints][PAINTBALL_TEAM_BLUE]);
			
			foreach (Player, p)
			{
				if (PLAYER_PAINTBALL_TEAM[p] != INVALID_PAINTBALL_TEAM)
				{
					PlayerTextDrawSetString(p, paintballPTD[p][1], string1);
					PlayerTextDrawSetString(p, paintballPTD[p][2], string0);

					PlayerTextDrawShow(p, paintballPTD[p][1]);
       				PlayerTextDrawShow(p, paintballPTD[p][2]);
				}
			}

			ResetPlayerWeaponsEx(playerid);

			new 
				team = PLAYER_PAINTBALL_TEAM[playerid],
				room = PLAYER_PAINTBALL_ROOM[playerid];

	        if (team == PAINTBALL_TEAM_RED)
	        {
	        	SetSpawnInfo(playerid, team, PAINTBALL_ROOM[room][pb_skins][team], PAINTBALL_ROOM[room][pb_spawn][0], PAINTBALL_ROOM[room][pb_spawn][1], PAINTBALL_ROOM[room][pb_spawn][2],
	        	0.0, 0, 0, 0, 0, 0, 0);
	        }
	        else
	        {
	        	SetSpawnInfo(playerid, team, PAINTBALL_ROOM[room][pb_skins][team], PAINTBALL_ROOM[room][pb_spawn][3], PAINTBALL_ROOM[room][pb_spawn][4], PAINTBALL_ROOM[room][pb_spawn][5],
	        	0.0, 0, 0, 0, 0, 0, 0);
	        }
		}
	}

	return 1;
}

public PAINTBALL_SYNC()
{
	new string[10];

	for (new i; i < sizeof PAINTBALL_ROOM; i++)
	{
		if (PAINTBALL_ROOM_IG[i][pbg_RoundStarted] < gettime())
		{
			ploop(playerid)
			{
				if (PLAYER_PAINTBALL_ROOM[playerid] == i && PLAYER_PAINTBALL_TEAM[playerid] != INVALID_PAINTBALL_TEAM)
				{
					if (PAINTBALL_ROOM_IG[i][pbg_TeamPoints][PAINTBALL_TEAM_RED] > PAINTBALL_ROOM_IG[i][pbg_TeamPoints][PAINTBALL_TEAM_BLUE])
					{
						SendClientMessage(playerid, -1, "[DAÞASVAIDYS] Naujas raundas! Laimëjo raudonieji");
					}
					else if (PAINTBALL_ROOM_IG[i][pbg_TeamPoints][PAINTBALL_TEAM_RED] < PAINTBALL_ROOM_IG[i][pbg_TeamPoints][PAINTBALL_TEAM_BLUE])
					{
						SendClientMessage(playerid, -1, "[DAÞASVAIDYS] Naujas raundas! Laimëjo mëlynieji");
					}
					else
					{
						SendClientMessage(playerid, -1, "[DAÞASVAIDYS] Naujas raundas! Lygiosios");
					}

					PlayerTextDrawSetString(playerid, paintballPTD[playerid][1], "0");
					PlayerTextDrawSetString(playerid, paintballPTD[playerid][2], "0");

					PlayerTextDrawShow(playerid, paintballPTD[playerid][1]);
       				PlayerTextDrawShow(playerid, paintballPTD[playerid][2]);

					new 
						team = PLAYER_PAINTBALL_TEAM[playerid],
						room = PLAYER_PAINTBALL_ROOM[playerid];

			        if (team == PAINTBALL_TEAM_RED)
			        {
			        	SetSpawnInfo(playerid, team, PAINTBALL_ROOM[room][pb_skins][team], PAINTBALL_ROOM[room][pb_spawn][0], PAINTBALL_ROOM[room][pb_spawn][1], PAINTBALL_ROOM[room][pb_spawn][2],
			        	0.0, 0, 0, 0, 0, 0, 0);
			        }
			        else
			        {
			        	SetSpawnInfo(playerid, team, PAINTBALL_ROOM[room][pb_skins][team], PAINTBALL_ROOM[room][pb_spawn][3], PAINTBALL_ROOM[room][pb_spawn][4], PAINTBALL_ROOM[room][pb_spawn][5],
			        	0.0, 0, 0, 0, 0, 0, 0);
			        }

			        SpawnPlayer(playerid);
				}
				else
				{
					PLAYER_PAINTBALL_ROOM[playerid] = -1;
					PLAYER_PAINTBALL_TEAM[playerid] = INVALID_PAINTBALL_TEAM;
				}
			}

			PAINTBALL_ROOM_IG[i][pbg_RoundStarted] = gettime() + PAINTBALL_ROOM[i][pb_RoundTime];
			PAINTBALL_ROOM_IG[i][pbg_TeamPoints][PAINTBALL_TEAM_RED] = 0;
			PAINTBALL_ROOM_IG[i][pbg_TeamPoints][PAINTBALL_TEAM_BLUE] = 0;
		}

		ploop(playerid)
		{
			if (PLAYER_PAINTBALL_TEAM[playerid] != INVALID_PAINTBALL_TEAM)
			{
				format (string, sizeof string, "%d", PAINTBALL_ROOM_IG[i][pbg_RoundStarted] - gettime());

				PlayerTextDrawSetString(playerid, paintballPTD[playerid][0], string);
				PlayerTextDrawShow(playerid, paintballPTD[playerid][0]);
			}
		}
	}

	return 1;
}

CMD:paliktipb(playerid, params[])
{
	if (PLAYER_PAINTBALL_TEAM[playerid] != INVALID_PAINTBALL_TEAM)
	{
		TogglePlayerPaintball (playerid);
		return 1;
	}

	return 0;
}


hook OnGameModeInit()
{
	PAINTBALL_PICKUP = CreatePickup(2061, 2, PAINTBALL_PICKUP_POS);
	SetTimer("PAINTBALL_SYNC", 1000, true);

	for (new i; i < sizeof PAINTBALL_ROOM; i++) PAINTBALL_ROOM_IG[i][pbg_RoundStarted] = gettime() + PAINTBALL_ROOM[i][pb_RoundTime];

	return 1;
}

hook OnPlayerPickUpPickup(playerid, pickupid)
{
	if (pickupid == PAINTBALL_PICKUP)
	{
		new dialogStr[1024];

		for (new i; i < sizeof PAINTBALL_ROOM; i++)
		{
			format (dialogStr, sizeof dialogStr, "[%s] {FF0000}%s{ffffff} prieð{00B8D8} %d]\n", dialogStr, PAINTBALL_ROOM[i][pb_name], CountPlayerInPaintball(i, PAINTBALL_TEAM_RED), CountPlayerInPaintball(i, PAINTBALL_TEAM_BLUE));
		}

		ShowPlayerDialog(playerid, DIALOG_PAINTBALL, DIALOG_STYLE_LIST, "DAÞASVAIDYS", dialogStr, "Þaisti", "Iðeiti");

		return -1;
	}

	return 1;
}

CountPlayerInPaintball(room, team)
{
	new count;

	foreach(Player, playerid)
	{
		if (PLAYER_PAINTBALL_TEAM[playerid] == team && PLAYER_PAINTBALL_ROOM[playerid] == room)
		{
			count ++;
		}
	}

	return count;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_PAINTBALL)
	{
		if (!response)
			return 1;

		PLAYER_SELECTED_ROOM[playerid] = listitem;
		ShowPlayerDialog(playerid, DIALOG_PAINTBALL_TEAM, DIALOG_STYLE_LIST, "DAÞASVAIDYS : Pasirinkite komandà", "Mëlynieji\nRaudonieji", "Pasirinkti", "Iðeiti");

	}

	if (dialogid == DIALOG_PAINTBALL_TEAM)
	{
		if (!response)
			return 1;

		if (PAINTBALL_ROOM[PLAYER_SELECTED_ROOM[playerid]][pb_MaxPlayers] == CountPlayerInPaintball(PLAYER_SELECTED_ROOM[playerid], listitem))
			return SendClientMessage(playerid, -1, "[DAÞASVAIDYS] Komanda pilna");

		TogglePlayerPaintball (playerid, PLAYER_SELECTED_ROOM[playerid], listitem);
	}

	return 1;
}

IsPlayerPlayingPaintball(playerid)
	return (PLAYER_PAINTBALL_TEAM[playerid]);