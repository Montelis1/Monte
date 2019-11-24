/*

Vehicle Anticheat system

*/

#include YSI\y_hooks

stock RemovePlayerFromVehicleEx(playerid)
{
	zInfo[playerid][ACmasina] = INVALID_VEHICLE_ID;
	return RemovePlayerFromVehicle(playerid);
}
#if defined _AC_RemovePlayerFromVehicle
#undef RemovePlayerFromVehicle
#else
#define _AC_RemovePlayerFromVehicle
#endif
#define RemovePlayerFromVehicle RemovePlayerFromVehicleEx

#define AC_VEHICLE_SPAM
//#define DEFECTIONS 10

/*new 

  warp_into[MAX_PLAYERS],
  enter_vehicle[MAX_PLAYERS],
  last_into[MAX_PLAYERS],
  last_count[MAX_PLAYERS]

;  */

/*enum veh_set {

	bool:defect[DEFECTIONS]
};
new vehset[veh_set];*/

enum a_Info {

    damage_Info[4], 
    last_Damage
};
new ainfo[MAX_VEHICLES][a_Info];

hook OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
	if(zInfo[playerid][zaidzia] == 3)
	{
		/*if(vehset[defect][AC_VEHICLE_SPAM])
		{*/
			new panels, doors, lights, tires;
			GetVehicleDamageStatus(vehicleid, panels, doors, lights, tires);
			if(ainfo[vehicleid][damage_Info][0] != panels || ainfo[vehicleid][damage_Info][1] != doors || ainfo[vehicleid][damage_Info][2] != lights || ainfo[vehicleid][damage_Info][3] != tires)
	        {
	        	ainfo[vehicleid][last_Damage] ++;
	        	if(ainfo[vehicleid][last_Damage] > 10)
	        	{
                    new String[234];
                    format(String, sizeof(String), "{ffffff}>{ff3300} Þaidëjas ({ffffff}%s{ff3300}) buvo uþblokuotas visam laikui ið serverio uþ neleistinà VEHICLE SPAM naudojimà", GetPlayerNameEx(playerid));
                    SendClientMessageToAll(-1, String); 
				    //ResetVehicles();
				    _Kick(playerid);
	        		return 0;
	        	}
	        	else
	        	{
	        		ainfo[vehicleid][damage_Info][0] = panels;
	        		ainfo[vehicleid][damage_Info][1] = doors;
	        		ainfo[vehicleid][damage_Info][2] = lights;
	        		ainfo[vehicleid][damage_Info][3] = tires;
	        	}
	        }	
	}
	return 1;
}

/*hook OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER)
	{
		if(zInfo[playerid][ACmasina] == INVALID_VEHICLE_ID || zInfo[playerid][ACmasina] != GetPlayerVehicleID(playerid))
		{
			return ErrorMsg(playerid, "IÃ°mestas uÃ¾ #VEHICLE_WARP!"), _Kick(playerid);
		}
		zInfo[playerid][ACmasina] = INVALID_VEHICLE_ID;
		if(GetTickCount() - GetPVarInt(playerid, "VEHICLE_AC_TIME") < 1000) 
		{
			SetPVarInt(playerid, "VEHICLE_SPAM", GetPVarInt(playerid, "VEHICLE_SPAM") +1);
			if(GetPVarInt(playerid, "VEHICLE_SPAM") >= 3)
			{
				new String[234];
                format(String, sizeof(String), "{ffffff}>{ff3300} Þaidëjas ({ffffff}%s{ff3300}) buvo uþblokuotas visam laikui ið serverio uþ neleistinà VEHICLE SPAM naudojimà", GetPlayerNameEx(playerid));
                SendClientMessageToAll(-1, String); 
				ResetVehicles();
				return _Kick(playerid);
			}
		}
		SetPVarInt(playerid, "VEHICLE_AC_TIME", GetTickCount());
	}
	return 1;
}*/

/*stock GetTickDiff(newtick, oldtick)
{
	if(oldtick < 0 && newtick >= 0)
	{
		return newtick - oldtick;
	}
	else if(oldtick >= 0 && newtick < 0 || oldtick > newtick)
	{
		return (cellmax - oldtick + 1) - (cellmin - newtick);
	}
	return newtick - oldtick;
}*/

/*stock Reset_Vehicle_AC(playerid)
{
    warp_into[playerid] = 0;
    last_into[playerid] = 0;
    last_count[playerid] = 0;
	return 1;
}*/