/*
	DIALOG_GANG_AMM_INFO
	DIALOG_GANG_AMM_ADD
	DIALOG_GANG_AMM_SHARE

	mysql_table >> gangs_weps >> gangid, wepid, ammo
*/

#define gamm_clean mysql_query("DELETE FROM gangs_weps WHERE ammo = '0'")

showdialog_amm_info(playerid, gangid = -1)
{
	if (gangid == -1)
		gangid = playerGang[playerid];

	new str[60], strf[600], strx[150];
	format(strx, sizeof strx, "SELECT wepid, ammo FROM gangs_weps WHERE ammo > 0 AND gangid = '%d' ORDER BY wepid", gangid);
    mysql_query(strx);
    mysql_store_result();

    if (!mysql_num_rows())
    {
    	SendClientMessage(playerid, RED, "Neturit ginklø");
    	showdialog_gangleader(playerid);
    	mysql_free_result ();
    	return 1;
    }

    new wepid, ammo, tempstr[25];

    while(mysql_retrieve_row())
    {
    	mysql_fetch_field_row(tempstr, "wepid"); wepid = strval(tempstr);
    	mysql_fetch_field_row(tempstr, "ammo"); ammo = strval(tempstr);

    	GetWeaponName(wepid, tempstr, 25);

    	format(str, sizeof str, "%s(ID:%d) %d kulkø.\n", tempstr, wepid, ammo);
    	strcat(strf, str);
    }
    
    ShowPlayerDialog(playerid, DIALOG_GANG_AMM_INFO, DIALOG_STYLE_MSGBOX, "Amunicija", strf, "Gerai", "");

    mysql_free_result();
    return 1;
}

#include YSI\y_hooks


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_GANG_AMM)
	{
		if (playerGang[playerid] == INVALID_GANG_ID) 
			return 1;
		if (!response)
			return showdialog_gangleader(playerid);

		switch (listitem)
		{
			case 0: showdialog_amm_info(playerid);
			case 1:
			{
				if (IsPlayerInAnyVehicle(playerid))
					return ErrorMsg(playerid, "To tr. priemonëje negalima daryti"), showdialog_ammunition(playerid);

				switch (GetPlayerWeapon(playerid))
				{
					case 1..15, 22..34:
					{
						showdialog_amm_add(playerid);
					}
					default: return ErrorMsg(playerid, "Nelaikai ginklo rankose arba ginklo áneðti negalima."), showdialog_ammunition(playerid);
				}
			}
			case 2: showdialog_amm_take(playerid);
			case 3: showdialog_amm_share(playerid);
		}
	}

	if (dialogid == DIALOG_GANG_AMM_INFO)
		return showdialog_ammunition(playerid);
	
	if (dialogid == DIALOG_GANG_AMM_ADD)
	{
		if (playerGang[playerid] == INVALID_GANG_ID)
			return 1;

		if (!response)
			return showdialog_ammunition(playerid);

		if (IsPlayerInAnyVehicle(playerid))
			return ErrorMsg(playerid, "To tr. priemonëje negalima daryti"), showdialog_amm_add(playerid);

		new 
			wepx = GetPlayerWeapon(playerid);

		switch (wepx)
		{
			case 1..15, 22..34:
			{
				new 
					slot = GetWeaponSlotE(wepx), amount = strval(inputtext), wep, ammo;

				GetPlayerWeaponData(playerid, slot, wep, ammo);

				if (amount <= 0)
					return showdialog_amm_add(playerid);
				if (amount > ammo)
					return ErrorMsg(playerid, "Tiek rankose neturi"), showdialog_amm_add(playerid);

				RemovePlayerWeaponAmmo(playerid, wep, amount);
				gamm_add(playerGang[playerid], wep, amount);

			}
			default: return ErrorMsg(playerid, "Nelaikai ginklo rankose arba ginklo áneðti negalima."), showdialog_amm_add(playerid);
		}
	}

	if (dialogid == DIALOG_GANG_AMM_TAKE)
	{
		if (playerGang[playerid] == INVALID_GANG_ID)
			return 1;

		if (!response)
			return showdialog_ammunition(playerid);

		new wepid, ammo, avammo;

		if (sscanf(inputtext, "ii", wepid, ammo))
			return ErrorMsg(playerid, "[ginklo id] [kulkø kiekis]"), showdialog_amm_take(playerid);

		if(gamm_get(playerGang[playerid], wepid, avammo) == -1)
			return ErrorMsg(playerid, "Tokio ginklo id neturit"), showdialog_amm_take(playerid);

		if (avammo < ammo)
			return ErrorMsg(playerid, "Tiek kulkø neturit"), showdialog_amm_take(playerid);

		gamm_add(playerGang[playerid], wepid, -ammo);
		GivePlayerWeaponsEx(playerid, wepid, ammo);
		zInfo[playerid][NoGunsGang] = 1;
	}

	if (dialogid == DIALOG_GANG_AMM_SHARE)
	{
		if (playerGang[playerid] == INVALID_GANG_ID)
			return 1;

		if (!response)
			return showdialog_ammunition(playerid);

		new wepid, ammo, avammo, gmem = count_gangMembers(playerGang[playerid]);

		if (sscanf(inputtext, "ii", wepid, ammo))
			return ErrorMsg(playerid, "[ginklo id] [kulkø kiekis/gaujos nará]"), showdialog_amm_share(playerid);

		if(gamm_get(playerGang[playerid], wepid, avammo) == -1)
			return ErrorMsg(playerid, "Tokio ginklo id neturit"), showdialog_amm_share(playerid);

		if (avammo < ammo*gmem)
			return ErrorMsg(playerid, "Tiek kulkø neturit"), showdialog_amm_share(playerid);

		gamm_add(playerGang[playerid], wepid, -(ammo*gmem));

		foreach (new p : Player)
		{
			if (playerGang[p] == playerGang[playerid])
			{
				GivePlayerWeaponsEx(p, wepid, ammo);
				zInfo[p][NoGunsGang] = 1;
				SendClientMessage(p, GREEN, "Gaujos valdþia padalino ginklø");
			}
		}
		return 1;
	}

	return 1;
}


gamm_add(gangid, wep, ammo)
{
	new qstr[200];

	format(qstr, sizeof qstr, "INSERT INTO gangs_weps (gangid, wepid, ammo) VALUES (%d, %d, %d) ON DUPLICATE KEY UPDATE ammo = ammo + %d;", gangid, wep, ammo, ammo);
	mysql_query(qstr);

	return 1;
}

gamm_get(gangid, wepid, &ammo)
{
	new str[100], tempstr[10];
	format( str, sizeof str, "SELECT ammo FROM gangs_weps WHERE gangid = '%d' AND wepid = '%d'", gangid, wepid);
	mysql_query(str);
	mysql_store_result();

	if (!mysql_retrieve_row())
	{
		mysql_free_result();
		return -1;
	}

    mysql_fetch_field_row(tempstr, "ammo"); ammo = strval(tempstr);

	mysql_free_result();

	return 1;
}

GetWeaponSlotE(weaponid)
{
	new slot;
	switch(weaponid)
	{
		case 0,1: slot = 0;
		case 2 .. 9: slot = 1;
		case 10 .. 15: slot = 10;
		case 16 .. 18, 39: slot = 8;
		case 22 .. 24: slot =2;
		case 25 .. 27: slot = 3;
		case 28, 29, 32: slot = 4;
		case 30, 31: slot = 5;
		case 33, 34: slot = 6;
		case 35 .. 38: slot = 7;
		case 40: slot = 12;
		case 41 .. 43: slot = 9;
		case 44 .. 46: slot = 11;
	}
	return slot;
}

hook OnGameModeInit()
{
	gamm_clean;
	return 1;
}

RemovePlayerWeaponAmmo(playerid, weaponid, ammo)
{
    if(!IsPlayerConnected(playerid) || weaponid < 0 || weaponid > 50)
        return;
    new saveweapon[13], saveammo[13];
    for(new slot = 0; slot < 13; slot++)
        GetPlayerWeaponData(playerid, slot, saveweapon[slot], saveammo[slot]);
    ResetPlayerWeapons(playerid);
    for(new slot; slot < 13; slot++)
    {
        if(saveammo[slot] == 0)
            continue;
        if (saveweapon[slot] == weaponid)
       		saveammo[slot] -= ammo;
        
        GivePlayerWeaponsEx(playerid, saveweapon[slot], saveammo[slot]);
    }
}