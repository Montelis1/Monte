


CMD:persirengti(playerid, params[])
{
	if (playerGang[playerid] == INVALID_GANG_ID && zInfo[playerid][specialybe] == 0)
		return ErrorMsg(playerid, "Neturi kitø aprangø");

	if (isnull(params))
		return ErrorMsg(playerid, "/persirengti [pap(rastus)/darbo/gaujos]");

	if (!strcmp(params, "pap", true, 20) || !strcmp(params, "paprastus", true, 20))
	{
		zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
		SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
		SendClientMessage(playerid, GREEN, "Persirengei á paprastus drabuþius");
	}
	else if (!strcmp(params, "darbo", true, 20))
	{
		if (zInfo[playerid][specialybe] == 0)
			return ErrorMsg(playerid, "Neturi darbo");

		zInfo[playerid][skinStatus] = SKINSTATUS_JOB;
		SetPlayerSkin(playerid, zInfo[playerid][uniforma]);
		SendClientMessage(playerid, GREEN, "Persirengei á darbo drabuþius");
	}
	else if (!strcmp(params, "gaujos", true, 20))
	{
		if (playerGang[playerid] == INVALID_GANG_ID)
			return ErrorMsg(playerid, "Neturi gaujos");
		if (!doGangHaveSkin(playerGang[playerid]))
			return ErrorMsg(playerid, "Tavo gauja neturi aprangos");

		zInfo[playerid][skinStatus] = SKINSTATUS_GANG;
		SetPlayerSkin(playerid, gangDB[playerGang[playerid]][gSkin]);
		SendClientMessage(playerid, GREEN, "Persirengei á gaujos drabuþius");
	}
	else ErrorMsg(playerid, "/persirengti [pap(rastus)/darbo/gaujos]");

	return 1;
}


setCorrectSkin(playerid)
{
	switch (zInfo[playerid][skinStatus])
	{
		case SKINSTATUS_NORMAL: SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
		case SKINSTATUS_JOB:
		{
			if (zInfo[playerid][specialybe] == 0)
				return zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL, SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);

			SetPlayerSkin(playerid, zInfo[playerid][uniforma]);
		}
		case SKINSTATUS_GANG:
		{
			if (playerGang[playerid] == INVALID_GANG_ID)
				return zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL, SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
			if (gangDB[playerGang[playerid]][gSkin] == 0)
				return zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL, SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);

			SetPlayerSkin(playerid, gangDB[playerGang[playerid]][gSkin]);
		}
	}

	return 1;
}