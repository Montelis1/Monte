
#define REQ_REP_SMFB 450

#define DIALOG_UPGRADE_BUSS_ALAMR 14214
#define BUSSINESS_ALARM_UPGRADE_PRICE 25000

enum E_BUSSINESS_ALARMS
{
	BUSSINESS_ALARM_NONE,
	BUSSINESS_ALARM_UPGRADED
};

forward SYNC_SMFB();

// bInfo[biz][Uzdirbta]
// b_alarm

static
	
	HOLDING_STOLEN_MONEY[MAX_PLAYERS],

	GANG_ROBBING_BUSSINESS[MAX_GANGS] = {-1, ...},
	GANG_ROBBING_TIME[MAX_GANGS];

//bInfo[biz][Uzdirbta]

COUNT_GANG_MEMBERS_IN_RANGE(gang, Float: range, Float: x, Float: y, Float: z)
{
	new mem;

	foreach (new p : Player)
	{
		if (IsPlayerInRangeOfPoint(p, range, x, y, z) && playerGang[p] == gang)
			mem ++;
	}

	return mem;
}

public SYNC_SMFB()
{
	for (new i; i < MAX_GANGS; i++)
	{
		if (GANG_ROBBING_BUSSINESS[i] != -1)
		{
			if (!COUNT_GANG_MEMBERS_IN_RANGE(i, 10.0, bInfo[GANG_ROBBING_BUSSINESS[i]][bpX], bInfo[GANG_ROBBING_BUSSINESS[i]][bpY], bInfo[GANG_ROBBING_BUSSINESS[i]][bpZ]))
			{
				GANG_ROBBING_BUSSINESS[i] = -1;
				gang_message(i, "Verslo apiplëðimas nepavyko", COLOR_RED);
			}

			if (GANG_ROBBING_TIME[i] <= gettime())
			{
				if (bInfo[GANG_ROBBING_BUSSINESS[i]][Uzdirbta] <= 0)
					return gang_message(i, "Versle nieko nebuvo", COLOR_RED);

				foreach (new p : Player)
				{
					if (playerGang[p] == i && IsPlayerInRangeOfPoint(p, 10.0, bInfo[GANG_ROBBING_BUSSINESS[i]][bpX], bInfo[GANG_ROBBING_BUSSINESS[i]][bpY], bInfo[GANG_ROBBING_BUSSINESS[i]][bpZ]) && HOLDING_STOLEN_MONEY[p] == 0)
					{
						if (bInfo[GANG_ROBBING_BUSSINESS[i]][Uzdirbta] <= 0)
							return SendClientMessage(p, COLOR_RED, "Versle nieko nebeliko"), bInfo[GANG_ROBBING_BUSSINESS[i]][Uzdirbta] = 0;

						SetPlayerAttachedObject(p, 2, 11745, 5, 0.299999, 0.099999, 0.000000, 0.000000, -83.000000, 0.000000, 1.000000, 1.000000, 1.000000);

						HOLDING_STOLEN_MONEY[p] = floatround(bInfo[GANG_ROBBING_BUSSINESS[i]][Uzdirbta]*0.03);
						bInfo[GANG_ROBBING_BUSSINESS[i]][Uzdirbta] -= bInfo[GANG_ROBBING_BUSSINESS[i]][Uzdirbta]*0.03;

						SendClientMessage(p, COLOR_GREEN, "Gavote pinigø maiðà. Veþkite á bazæ (áëjimo pickup)");
					}
				}

				GANG_ROBBING_BUSSINESS[i] = -1;
			}
		}
	}

	return 1;
}

CMD:plestiversla(playerid, params[])
{
	if (playerGang[playerid] == INVALID_GANG_ID)
		return 0;

	if (gangDB[playerGang[playerid]][gReps] < REP_REQ_BV)
		return ErrorMsg(playerid, "Tavo gauja neturi pakankamai reputacijos");

	if (GANG_ROBBING_BUSSINESS[playerGang[playerid]] != -1)
		return ErrorMsg(playerid, "Jau pleðiate verslà");

	new bussiness = -1, text[100];

	for (new i; i < MAX_BUSSINESS; i++)
	{
		if (bInfo[i][bCreated] && IsPlayerInRangeOfPoint(playerid, 5.0, bInfo[i][bpX], bInfo[i][bpY], bInfo[i][bpZ]))
		{
			bussiness = i;
			break;
		}
	}

	if (bussiness == -1)
		return 0;

	if (bInfo[bussiness][b_alarm] == BUSSINESS_ALARM_UPGRADED)
	{
		if (COUNT_POLICE_MANS() < 2)
			return ErrorMsg(playerid, "Nëra pakankamai policininkø serveryje");

		format(text, sizeof text, "[RACIJA] Plëðiamas verslas id %d", bussiness);

		foreach (new p : Player)
		{
			if (zInfo[p][specialybe] == JOB_PD)
			{
				SendClientMessage(p, COLOR_YELLOW, text);
			}
		}
	}

	gang_message(playerGang[playerid], "Palaikykite atstuma prie verslo, kad galëtumëte apipðlëðti");

	GANG_ROBBING_TIME[playerGang[playerid]] = gettime()+60*20;
	GANG_ROBBING_BUSSINESS[playerGang[playerid]] = bussiness; 

	return 1;
}

COUNT_POLICE_MANS()
{
	new mem;

	foreach (new p : Player)
	{
		if (zInfo[p][specialybe] == COLOR_RED)
			mem++;
	}

	return mem;
}

HOLDING_STOLEN_MONEY__(playerid) return HOLDING_STOLEN_MONEY[playerid];
NULL_HOLDING_STOLEN_MONEY(playerid) HOLDING_STOLEN_MONEY[playerid] = 0;

#include YSI\y_hooks 

hook OnGameModeInit()
{ 
	return SetTimer("SYNC_SMFB", 1000, true);
}

