/*

- Padaryta kad u� nuosavus tr.priemon�s gautum 250 Eur
- Padaryta kad u� paprastas tr.priamon�s gautim 100 Eur
- Patalpintas � virtual gara�� ir prid�tas+1

*/

#include YSI\y_hooks

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if((newkeys == KEY_FIRE) && (IsPlayerInAnyVehicle(playerid)) && (GetPlayerState(playerid) == PLAYER_STATE_DRIVER))
	{
        	if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 525)
            {
            	new Float: aCoo[3];
            	GetPlayerPos(playerid, aCoo[0], aCoo[1], aCoo[2]);
            	new Float:aCook[3];
            	new NoVeh = 0;
            	new kv = 0;
            	while((kv < MAX_VEHICLES) && (!NoVeh))
            	{
            		kv ++;
            		GetVehiclePos(kv, aCook[0], aCook[1], aCook[2]);
                        if(GetVehicleModel(GetPlayerVehicleID(playerid)) == 591 || GetVehicleModel(GetPlayerVehicleID(playerid)) == 435) return SendClientMessage(playerid, -1, "Priekab� tempti!");
            		if((floatabs(aCoo[0]-aCook[0]) < 7.0) && (floatabs(aCoo[1]-aCook[1]) < 7.0) && (floatabs(aCoo[2]-aCook[2]) < 7.0) && (kv != GetPlayerVehicleID(playerid)))
            		{
            			NoVeh = 1;
            			if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
            			{
            				DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
            				return 1;
            			}
            			AttachTrailerToVehicle(kv, GetPlayerVehicleID(playerid));
            			SendClientMessage(playerid, -1, "{669966}� {FFFFFF}Pastatyti transport� � {669966}KMA {FFFFFF}gara�� /prdk komanda");
                              SetPlayerCheckpoint(playerid, -1527.0287,2634.0234,55.8817, 2.0);	
            		}	
            	}
            	if(!NoVeh)
            	{
            		SendClientMessage(playerid, RED, "�alia j�s� n�ra joki� tr.priemoni�!");
            	}	
            }  
	} 
	return 1;
}

CMD:prdk(playerid, params[])
{
	if(zInfo[playerid][specialybe] != 3) return SendClientMessage(playerid, RED, "Tik mechanikams!");
	if(!IsPlayerInRangeOfPoint(playerid, 10, -1527.0287,2634.0234,55.8817)) return SendClientMessage(playerid, RED, "Nesate prie KMA gara�o!");
	new vehid = GetVehicleTrailer(GetPlayerVehicleID(playerid));
	if(tInfo[vehid][vOwned])
	{
		SendClientMessage(playerid, YELLOW, "{669966}� {FFFFFF}Patalpinai nuosav� {669966}tr.priemon� {FFFFFF}ir gavai 500 Eur");
		GivePlayerMoneyA(playerid, 500);
		SetVehicleVirtualWorld(vehid, vehid+1);
		DetachTrailerFromVehicle(GetPlayerVehicleID(playerid));
		tInfo[vehid][vKma] = true;
            DisablePlayerCheckpoint(playerid);
	}
	return 1;
}
