/* 

WEAPON CHEAT

*/

#include YSI\y_hooks

enum WEP_DATA {

	we_id,
	we_ammo,
	we_give
};
new WEAPON_AC[MAX_PLAYERS][13][WEP_DATA];

hook OnGameModeInit()
{
	SetTimer("anticheat_weapons_timer", 500, false);
	return 1;
}

forward anticheat_weapons_timer();
public anticheat_weapons_timer()
{
	foreach(new playerid : Player)
	{
		for(new slot = 0; slot < 13; slot ++)
		{
           if(AC_CheckWeapon(playerid, slot, true))
           {
           	  break;
           }
		}
	}
	SetTimer("anticheat_weapons_timer", 500, false);	
	return 1;
}

stock AC_CheckWeapon(playerid, id, bool:byslot)
{
    new slot;
    if(((slot = id) && byslot) || (((slot = AC_GetWeaponSlot(id)) != 0xFFFF) && !byslot))
    {
    	new a_data[2];
    	GetPlayerWeaponData(playerid, slot, a_data[0], a_data[1]);
    	if((WEAPON_AC[playerid][slot][we_id] != a_data[0] && a_data[0] != 0 && a_data[1] > 0) || (WEAPON_AC[playerid][slot][we_ammo] < a_data[1] && a_data[1] > 0 && a_data[0] > 0))
    	{
    		AC_ResetPlayerWeapons(playerid);
    		(funcidx("OnPlayerWeaponCheat") != -1) && CallLocalFunction("OnPlayerWeaponCheat", "ddd", playerid, a_data[0], a_data[1]);
    		return true;
    	}
    }
	return false;
}

hook OnPlayerConnect(playerid)
{
	for(new slot = 0; slot < 13; slot ++)
	{
		new ck_wep[WEP_DATA];
		WEAPON_AC[playerid][slot] = ck_wep;
	}
	return 1;
}

hook OnPlayerUpdate(playerid)
{
	if(GetPlayerWeapon(playerid) != AntiCheatSystem[playerid][CurrentWeapon])
	{
		AC_ChangeWeaponCheat(playerid, GetPlayerWeapon(playerid), AntiCheatSystem[playerid][CurrentWeapon]);
	}
	return 1;
}

stock AC_GetWeaponData(playerid, slotid, &weaponid, &ammo) //Ginklo išgavimas
{
	weaponid = WEAPON_AC[playerid][slotid][we_id];
	ammo = WEAPON_AC[playerid][slotid][we_ammo];
	return 1;
} 

/*stock AC_CheckSlotUsed(playerid, slotid) //Ginklo Slot ID tikrinimas
{
	new weaponid, ammo;
	AC_GetWeaponData(playerid, slotid, weaponid, ammo);
	id(weaponid != 0 && ammo > 0)
	{
		return weaponid;
	}
	return 0;
}*/

/*stock AC_CheckWeapon(playerid, weaponid = -1) //Ginklų tikrinimas
{
	if(weaponid != -1)
	{
		new slot = AC_GetWeaponSlot(weaponid), clear, ammo;
		GetPlayerWeaponData(playerid, slot, clear, ammo);
		if(((WEAPON_AC[playerid][slot][we_id] != weaponid && weaponid > 0 && ammo > 0) || WEAPON_AC[playerid][slot][we_ammo] < ammo) && (ammo > 0))
	    {
             AC_ResetPlayerWeapons(playerid);
             ErrorMsg(playerid, "Išmestas už neleistinų ginklų naudojimą.");
             _Kick(playerid);
             return true;
	    }
	    else
	    {
            new ac_value[2];

	    	for(new i = 0; i < 13; i++)
            {
            	GetPlayerWeaponData(playerid, i, ac_value[0], ac_value[1]);
            	if(((WEAPON_AC[playerid][i][we_id] != ac_value[0] && ac_value[0] > 0 && ac_value[1] > 0) || WEAPON_AC[playerid][i][we_ammo] < ac_value[1]) && (ac_value[1] > 0))
            	{
	    	         AC_ResetPlayerWeapons(playerid);
	    	         ErrorMsg(playerid, "Išmestas už neleistinų ginklų naudojimą");
	    	         _Kick(playerid);
	    	         return true;
	    	    }
	    	}         
	    }
	}
	return false;
}*/

stock AC_GetWeaponSlot(weaponid) //Ginklų SLOTAI
{
	switch(weaponid)
	{
		case 1: return 0;
		case 2..9: return 1;
		case 22..24: return 2;
		case 25..27: return 3;
		case 28, 29, 32: return 4;
		case 30, 31: return 5;
		case 33, 34: return 6;
		case 35..38: return 7;
		case 16..18, 39: return 8;
		case 41..43: return 9;
		case 10..15: return 10;
		case 44..46: return 11;
		case 40: return 12;
	}
	return 0xFFFF;
}

stock AC_ResetPlayerWeapons(playerid)
{
	new ac_weapons[WEP_DATA];
	for(new i = 0; i < 13; i++)
	{
		WEAPON_AC[playerid][i] = ac_weapons;
	}
	return ResetPlayerWeapons(playerid);
}

stock AC_GivePlayerWeapon(playerid, weaponid, ammo)
{
	//new slot = AC_GetWeaponSlot(weaponid);
	for(new slot = 0; slot < 13; slot ++){
	if(weaponid < 0 || weaponid > 46 || ammo < 0) return false;
	if(WEAPON_AC[playerid][slot][we_id] != weaponid)
	{
		if(WEAPON_AC[playerid][slot][we_id] != 0)
		{
		   AC_ClearWeaponSlot(playerid, slot);
		   AntiCheatSystem[playerid][pNoCheckWeapons] = 3;	
		}
		WEAPON_AC[playerid][slot][we_ammo] = ammo;
		WEAPON_AC[playerid][slot][we_id] = weaponid;
	}
	else if(WEAPON_AC[playerid][slot][we_id] == weaponid)
	{
		WEAPON_AC[playerid][slot][we_ammo] += ammo;
	}} 
	return GivePlayerWeapon(playerid, weaponid, ammo);
}

stock AC_ClearWeaponSlot(playerid, slot)
{
	new wepdata[13][2];
	AntiCheatSystem[playerid][pNoCheckWeapons] = 2;
	AC_ResetPlayerWeapons(playerid);
	for(new i = 0; i < 13; i++)
	{
		if(wepdata[i][0] != 0 && wepdata[i][1] > 0 && i != slot)
		{
			AC_GivePlayerWeapon(playerid, wepdata[i][0], wepdata[i][1]);
		}
	}
	return 1;
}

forward AC_ChangeWeaponCheat(playerid, newweapon, oldweapon);
public AC_ChangeWeaponCheat(playerid, newweapon, oldweapon)
{
	if(newweapon != 0)
	{
       new newslot = AC_GetWeaponSlot(playerid);
       new newammo;
       GetPlayerWeaponData(playerid, newslot, newammo, newammo);
       if(WEAPON_AC[playerid][newslot][we_id] !=  newweapon && newweapon != 0 && newammo > 0)
       {
       	  ErrorMsg(playerid, "Išmestas už neleistinų ginklų / kulkų naudojimą");
       	  _Kick(playerid);
       	  return 1;
       }
       if(WEAPON_AC[playerid][newslot][we_ammo] < newammo)
       {
          ErrorMsg(playerid, "Išmestas už neleistinų ginklų / kulkų naudojimą");
       	  _Kick(playerid);
       	  return 1;
       }
       else if(WEAPON_AC[playerid][newslot][we_ammo] > newammo)
       {
       	  WEAPON_AC[playerid][newslot][we_ammo] = newammo;
       }
	}
	return 1;
}