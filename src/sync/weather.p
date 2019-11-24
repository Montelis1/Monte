
#include YSI\y_hooks

new 
    bool: goodWeather[MAX_PLAYERS];
    //SERVERIO_ORAS = 0;

hook OnGameModeInit()
{
    SetWeather(10);
    SERVERIO_ORAS = 10;
    SetTimer("changeWeather", 1000*60*30 + 1000*60*random(15), false);
    return 1;
}

hook OnPlayerConnect(playerid)
    return goodWeather[playerid] = false, 1;

hook OnPlayerSpawn(playerid)
    return SetPlayerWeather(playerid, SERVERIO_ORAS), 1;

forward changeWeather();
public changeWeather()
{
    SERVERIO_ORAS = random(16);
    SetTimer("changeWeather", 1000*60*30 + 1000*60*random(15), false);

    foreach(new p : Player)
        if (!goodWeather[p] && zInfo[p][disease] != 0) return SetPlayerWeather(p, SERVERIO_ORAS);
    
    return 1;
}

CMD:oras(playerid, params[])
{
    if (zInfo[playerid][disease] != 0) return SendClientMessage(playerid, RED, "Negalite keisti oro, nes sergate.");
    goodWeather[playerid] = true;
    SetPlayerWeather(playerid, 1);
    return 1;
}
CMD:giedra(playerid, params[]) return cmd_oras(playerid, params);
