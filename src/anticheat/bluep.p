
#include YSI\y_hooks

new
	bool:be_FirstSpawn[MAX_PLAYERS];

public OnBlueEclipseDetected(playerid)
{
	SetTimerEx("KickPlayerE", 1000, false, "i", playerid);

	SendClientMessage(playerid, -1, "Jûs iðmestas ið serverio. Prieþastis: {FFF000}cheat aptiktas");
	return 1;
}

hook OnPlayerConnect(playerid)
{
	be_FirstSpawn[playerid] = true;

	return 1;
}

hook OnPlayerSpawn(playerid)
{
	if(be_FirstSpawn[playerid])
	{
		BlueEclipseCheck(playerid);
	}

	be_FirstSpawn[playerid] = false;
	return 1;
}

forward KickPlayerE(playerid);
public KickPlayerE(playerid) return _Kick(playerid);
