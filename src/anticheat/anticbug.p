/*

APSAUGA ANTI C-BUG sistema kurta ES.^

*/

#include YSI\y_hooks

new jAACB[MAX_PLAYERS][3], bool:cbugComb[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
   jAACB[playerid][0] = 0;
   jAACB[playerid][1] = 0;
   jAACB[playerid][2] = 0;
   cbugComb[playerid] = false;
   return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
   if(newkeys & 2)
   {
	  if(IsACBugWeapon(GetPlayerWeapon(playerid)))
	  {
		 jAACB[playerid][2] = GetTickCount();
	  }
   }
   if(newkeys & 128)
   {
	  if(IsACBugWeapon(GetPlayerWeapon(playerid)))
	  {
		 new t = GetTickCount() - jAACB[playerid][2], weaponid = GetPlayerWeapon(playerid);
		 if(weaponid == 24 && t < 650 || weaponid == 25 && t < 1000 || weaponid == 27 && t < 300)
		 {
			cbugComb[playerid] = true;
		 }
	  }
   }
   return 1;
}

hook OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fx, Float:fy, Float:fz)
{
   new gtc = GetTickCount();
   if(IsACBugWeapon(GetPlayerWeapon(playerid)))
   {
	  if(!cbugComb[playerid] && jAACB[playerid][0] == weaponid)
	  {
		  new t = gtc - jAACB[playerid][1];
		  if(weaponid == 24 && t < 650 || weaponid == 25 && t < 1000 || weaponid == 27 && t < 300)
		  {
			 jAACB[playerid][0] = weaponid;
			 jAACB[playerid][1] = gtc;
			 cbugComb[playerid] = false;
			 new query[59];
             format(query, 59, "INSERT INTO bans (Vardas, Adminas) VALUES ('%s','Serveris')",GetPlayerNameEx(playerid));
             zInfo[playerid][Uzbanintas] = true;
			 return 0;
		  }
	  }
	  jAACB[playerid][0] = weaponid;
	  jAACB[playerid][1] = gtc;
	  cbugComb[playerid] = false;
   }
   return 1;
}

IsACBugWeapon(weaponid)
{
   switch(weaponid)
   {
	   case 24, 25, 27: return true;
   }
   return false;
}
