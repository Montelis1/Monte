#define REP_REQ_BV 250

#define TIME_FOR_GANGS_BV 60*7 // seconds
#define TIME_TO_RESET_BV TIME_FOR_GANGS_BV*4

#define BV_SELLOUT_POS 2209.1797, -2295.2520, 14.7647

#define BV_ATTACH_SLOT 8

#include YSI\y_hooks

#define DIALOG_BV 12334

//forward SYNC_BV();
forward BV_RESET();

static const
	
	BV_itemsNames[][] =
	{
		"Flakonëlis", "Padanga", "Bumperis", "Stogas", "Duslintuvas", "Akumuliatorius", "Langas", "Kapoto dangtis", "Bagaþinës dangtis", "Valituvai"
	};

new 
	bool: BV_isOpen,
	Float: BV_pos[4],
	bool: BV_itemsInside[sizeof BV_itemsNames],

	BV_OBJECT = INVALID_STREAMER_ID,
	Text3D: BV_TEXT3D,

	bool: BVV_itemsInside[MAX_VEHICLES][sizeof BV_itemsNames],

	BV_SELECTED_VEHICLE[MAX_PLAYERS] = {-1, ...},
	BV_HOLDING_ITEM[MAX_PLAYERS] = {-1, ...};


public BV_RESET()
{
	if (BV_isOpen)
	{
		DestroyDynamicObject(BV_OBJECT);
		DestroyDynamic3DTextLabel(BV_TEXT3D);

		BV_isOpen = false;
	}

	return 1;
}

hook OnVehicleDeath(vehicleid, killerid)
{

	new bool: VEHICLE_OWNED_BY_PLAYER;

	 foreach(Player, playerid)
     {
     	if (zInfo[playerid][Transportas1] == vehicleid || zInfo[playerid][Transportas2] == vehicleid || zInfo[playerid][Transportas3] == vehicleid || zInfo[playerid][lTransportas1] == vehicleid)
     	VEHICLE_OWNED_BY_PLAYER = true;  
    }

    if (VEHICLE_OWNED_BY_PLAYER)
    {
		if (!BV_isOpen)
		{
			new Float: xyzr[4];

			GetVehiclePos(vehicleid, xyzr[0], xyzr[1], xyzr[2]);
			GetVehicleZAngle(vehicleid, xyzr[3]);

			BV_pos = xyzr;

			BV_OBJECT = CreateDynamicObject(3593, BV_pos[0], BV_pos[1], BV_pos[2], BV_pos[3], 0.0, 0.0);
			BV_TEXT3D = CreateDynamic3DTextLabel("/bvtr", -1, BV_pos[0], BV_pos[1], BV_pos[2], 5.0);

			SetTimer("BV_RESET", TIME_TO_RESET_BV*1000, false);

			BV_isOpen = true;
		}
	}

	return 1;
}

ShowDialog_BV(playerid, vehicleid = -1)
{
	new 
		dialogStr[1024];

	if (vehicleid == -1)
	{
		for (new i; i < sizeof BV_itemsNames; i++)
		{
			if (BV_itemsInside[i])
			{
				strcat(dialogStr, BV_itemsNames[i]);
				strcat(dialogStr, "\n");
			}
		}
	}
	else
	{
		if (vInd[vehicleid][vehType] == VT_GANGCAR && vInd[vehicleid][vehOwner] != GetBaseIDOfGang(playerGang[playerid]))
			return 1;

		for (new i; i < sizeof BV_itemsNames; i++)
		{
			if (BVV_itemsInside[vehicleid][i])
			{
				strcat(dialogStr, BV_itemsNames[i]);
				strcat(dialogStr, "\n");
			}
		}
	}

	BV_SELECTED_VEHICLE[playerid] = -1;
	ShowPlayerDialog(playerid, DIALOG_BV, DIALOG_STYLE_LIST, " ", dialogStr, "Paimti", "Iðeiti");

	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_BV)
	{
		if (!response)
			return 1;

		if (BV_HOLDING_ITEM[playerid] != -1)
			return 1;

		new itemid = -1;

		for (new i; i < sizeof BV_itemsNames; i++)
		{
			if (!strcmp(BV_itemsNames[i], inputtext))
			{
				itemid = i;
				break;
			}
		}

		if (itemid == -1)
			return ShowDialog_BV(playerid, BV_SELECTED_VEHICLE[playerid]);

		if (BV_SELECTED_VEHICLE[playerid] == -1)
		{
			if (!BV_itemsInside[itemid])
				return ShowDialog_BV(playerid, BV_SELECTED_VEHICLE[playerid]);

			BV_itemsInside[itemid] = false;
			BV_GivePart(playerid, itemid);

			SendClientMessage(playerid, -1, "Á transportà gali padëti su /bvpadeti");
		}
	}

	return 1;
}

CMD:bvpadeti(playerid, params[])
{
	if (IsPlayerInAnyVehicle(playerid))
		return 1;

	if (BV_HOLDING_ITEM[playerid] == -1)
		return 0;

	new vid = BV_GetClosestVehicle(playerid, 5.0);

	if (vid == INVALID_VEHICLE_ID)
		return 1;

	if (vInd[vid][vehType] == VT_GANGCAR && vInd[vid][vehOwner] != GetBaseIDOfGang(playerGang[playerid]))
		return ErrorMsg(playerid, "Negali naudoti ðios maðinos, nes já priklauso gaujai.");

	BVV_itemsInside[vid][BV_HOLDING_ITEM[playerid]] = true;
	BV_RemPart(playerid);

	SendClientMessage(playerid, -1, "Padejai");

	return 1;
}

CMD:bvtr(playerid, params[])
{
	if (playerGang[playerid] == INVALID_GANG_ID)
		return 0;

	if (BV_HOLDING_ITEM[playerid] != -1)
		return 1;

	if (gangDB[playerGang[playerid]][gReps] < REP_REQ_BV)
		return ErrorMsg(playerid, "Tavo gauja neturi pakankamai reputacijos");

	if (IsPlayerInRangeOfPoint(playerid, 5.0, BV_pos[0], BV_pos[1], BV_pos[2]))
	{
		ShowDialog_BV(playerid);
	}

	return 1;
}

CMD:bvsell(playerid, params[])
{
	if (playerGang[playerid] == INVALID_GANG_ID)
		return 0;

	if (GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
		return ErrorMsg(playerid, "Turi bûti vairuotojas");

	new 
		count,
		vehicleid = GetPlayerVehicleID(playerid);

	for (new i; i < sizeof BV_itemsNames; i++)
		if (BVV_itemsInside[vehicleid][i]) count ++;

	if (!count)
		return 0;

	gangDB[playerGang[playerid]][gMoney] += count*500;
	gang_message(playerGang[playerid], "Sëkmingai pristatytas detaliø krovinis", COLOR_GREEN);

	return 1;
}

BV_GivePart(playerid, itemid)
{
	BV_HOLDING_ITEM[playerid] = itemid;
	SetPlayerAttachedObject(playerid, BV_ATTACH_SLOT, 2969, 1, -0.048999, -0.142999, -0.036999, 94.999977, 0.000000, 0.000000);
}

BV_RemPart(playerid)
{
	BV_HOLDING_ITEM[playerid] = -1;
	RemovePlayerAttachedObject(playerid, BV_ATTACH_SLOT);
}

hook OnGameModeInit()
{
	CreateDynamic3DTextLabel("/bvsell", -1, BV_SELLOUT_POS, 5.0);

	return 1;
}

static BV_GetClosestVehicle(playerid, Float:range)
{
    new     Float:p_X;
    new     Float:p_Y;
    new     Float:p_Z;

    new     Float:Distance;
    new     Float:PretendentDistance = range +1;
    new     Pretendent = INVALID_VEHICLE_ID;

    GetPlayerPos(playerid, p_X, p_Y, p_Z);

    for(new vehicleid=1; vehicleid < MAX_VEHICLES; vehicleid++)
    {
        Distance = GetVehicleDistanceFromPoint(vehicleid, p_X, p_Y, p_Z);

        if(Distance <= range && Distance <= PretendentDistance)
        {
            Pretendent = vehicleid;
            PretendentDistance = Distance;
        }
    }

    return Pretendent;
}