#include <a_samp>
#include "streamer"

main ()
{
	printf("Objektø texturinimas");
	printf("fort-carson.lt @2019-20**");
}

public OnGameModeInit()
{

    SetGameModeText("#Texture");
	//new scGame;
    CreateDynamicObject(19799, 2143.17676, 1627.17017, 994.24615,   0.00000, 0.00000, -181.50000);
    CreateDynamicObject(18643, 2142.74951, 1606.57532, 993.82336,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(18643, 2142.74951, 1606.57532, 994.32343,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(18643, 2142.74951, 1606.57532, 993.32343,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(19273, 2142.66064, 1606.61621, 994.33020,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(19273, 2145.53516, 1626.89417, 994.33020,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(19377, 2150.96802, 1601.54175, 997.94611,   0.00000, 0.00000, 89.00000);
    CreateDynamicObject(1569, 2147.34058, 1601.53064, 996.73914,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(14576, 2144.17969, 1619.40625, 1000.75781,   0.00000, 0.00000, 0.00000);
	return 1;

}

public OnPlayerRequestSpawn(playerid)
{
    SpawnPlayer(playerid);
    return 1;
}

public OnPlayerConnect(playerid)
{
	RemoveBuildingForPlayer(playerid, 14636, 2172.1250, 1611.3125, 1000.4219, 0.25);
    RemoveBuildingForPlayer(playerid, 14576, 2144.1797, 1619.4063, 1000.7578, 0.25);
	return 1;
}
public OnPlayerSpawn(playerid)
{
	AddStaticTeleport(playerid, 2147.34058, 1601.53064, 996.73914, 1);
	return 1;
}

stock AddStaticTeleport(playerid, Float:x, Float:y, Float:z, int)
{
	SetPlayerPos(playerid, x, y, z);
	SetPlayerFacingAngle(playerid, 90.00000);
	SetPlayerInterior(playerid, int);
	return true;
}

