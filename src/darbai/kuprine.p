/*

- Padaryta kad eitu pasidëti / pasiimti / duoti (Maistà, Vaistus, Ginklus, Narkotikus)

*/

#include YSI\y_hooks

#define DIALOG_KUPRINE_TERAFLU 12506
#define DIALOG_KUPRINE_TERAFLU_DUOTI 12507

#define DIALOG_KUPRINE_GRIPEX 12508
#define DIALOG_KUPRINE_GRIPEX_DUOTI 12509

#define DIALOG_KUPRINE_ANTIBIOTIKAI 12510
#define DIALOG_KUPRINE_ANTIBIOTIKAI_DUOTI 12511

#define DIALOG_KUPRINE_BANDELE 12512
#define DIALOG_KUPRINE_BANDELE_DUOTI 12513

#define DIALOG_KUPRINE_JOGURTAS 12514
#define DIALOG_KUPRINE_JOGURTAS_DUOTI 12515

#define DIALOG_KUPRINE_PICA 12516
#define DIALOG_KUPRINE_PICA_DUOTI 12517

#define DIALOG_KUPRINE_GINKLAI 12518

#define DIALOG_KUPRINE_DEAGLE 12519
#define DIALOG_KUPRINE_DEAGLE_DUOTI 12520

#define DIALOG_KUPRINE_SHOTGUN 12521
#define DIALOG_KUPRINE_SHOTGUN_DUOTI 12522

#define DIALOG_KUPRINE_AK47 12523
#define DIALOG_KUPRINE_AK47_DUOTI 12524

#define DIALOG_KUPRINE_M4 12525
#define DIALOG_KUPRINE_M4_DUOTI 12526

#define DIALOG_KUPRINE_M4_PADETI 12527
#define DIALOG_KUPRINE_AK47_PADETI 12528
#define DIALOG_KUPRINE_SHOTGUN_PADETI 12529
#define DIALOG_KUPRINE_DEAGLE_PADETI 12530

#define DIALOG_KUPRINE_M4_PASIIMTI 12531
#define DIALOG_KUPRINE_AK47_PASIIMTI 12532
#define DIALOG_KUPRINE_SHOTGUN_PASIIMTI 12533
#define DIALOG_KUPRINE_DEAGLE_PASIIMTI 12534

#define DIALOG_KUPRINE_NARKOTIKAI 12535

#define DIALOG_KUPRINE_KOKAINAS 12536
#define DIALOG_KUPRINE_KOKAINAS_PASIIMTI 12537
#define DIALOG_KUPRINE_KOKAINAS_PADETI 12538
#define DIALOG_KUPRINE_KOKAINAS_DUOTI 12539

#define DIALOG_KUPRINE_ZOLE 12540
#define DIALOG_KUPRINE_ZOLE_PASIIMTI 12541
#define DIALOG_KUPRINE_ZOLE_PADETI 12542
#define DIALOG_KUPRINE_ZOLE_DUOTI 12543

#define DIALOG_KUPRINE 12544
 

new invListTD[MAX_PLAYERS];

new invTDoff[MAX_PLAYERS];

CMD:kuprine(playerid)
{
    new str[429];
	format(str, sizeof(str), "%s{339966}Pavadinimas\t{FFFFFF}Kiekis\t{339966}Kategorija\n{FFFFFF}Teraflu\t{339966}%d\t{FFFFFF}Vaistai\n{FFFFFF}Gripex\t{339966}%d\t{FFFFFF}Vaistai\n{FFFFFF}Antibiotikai\t{339966}%d\t{FFFFFF}Vaistai\n", str, zInfo[playerid][drugscure][0], zInfo[playerid][drugscure][1], zInfo[playerid][drugscure][2]);
	format(str, sizeof(str), "%s{FFFFFF}Bandelë\t{339966}%d\t{FFFFFF}Maistas\n{FFFFFF}Jogurtas\t{339966}%d\t{FFFFFF}Maistas\n{FFFFFF}Pica\t{339966}%d\t{FFFFFF}Maistas\n{FFFFFF}Ginklai\t{339966}2\t{FFFFFF}lygis\n{FFFFFF}Narkotikai\t{339966}2\t{FFFFFF}lygis", str, zInfo[playerid][maistas][0], zInfo[playerid][maistas][1], zInfo[playerid][maistas][2]);
	ShowPlayerDialogEx(playerid, DIALOG_KUPRINE, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Kuprine", str, "Pasirinkti", "Atðaukti");
	return 1;
}


hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_KUPRINE_TERAFLU) //Teraflu - naudoti sau
	{
		if(response)
		{
           if (zInfo[playerid][disease] != 1) return SuccesMSG(playerid, " Jûs neturite perðalimo arba iðvis nesergate!");
           if (zInfo[playerid][disease] == 1 && zInfo[playerid][drugscure][0] == 0) return SuccesMSG(playerid, " Jûs neturite vaistø nuo perðalimo!");
		   zInfo[playerid][disease] = 0;
           zInfo[playerid][drugscure][0] -= 1;
           KillTimer(DST);
           SetPlayerDrunkLevel(playerid, 0);
           SetPlayerWeather(playerid, SERVERIO_ORAS);
           SuccesMSG(playerid, " Sëkmingai iðsigydëte perðalimà!");
           invTDoff[playerid] ++;
		}
		else return invListTD[playerid] = 1, hpListIT(playerid);
	}
	if(dialogid == DIALOG_KUPRINE_TERAFLU_DUOTI) //Teraflu - duoti þaidëjui
	{
		if(response)
		{
           new kiekis = 0;
		   new id, tr = zInfo[playerid][drugscure][0];
		   if(sscanf(inputtext, "ud", id, tr)) return hpListIT(playerid);
		   if(tr < kiekis) return ErorMSG(playerid, "Neturite tiek teraflu!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!");
		   else if(id == playerid) return ErorMSG(playerid, "Sau teraflu duoti negalite!");
		   SelectTextDraw(playerid, -1);
		   zInfo[playerid][drugscure][0] -= tr;
		   SuccesMSG(playerid, " Davëte þaidëjui Teraflu vaistà");
		   zInfo[id][drugscure][0] += tr;
		   SuccesMSG(id, " Gavote Teraflu vaistà");
		   invListTD[playerid] = 0;
		}
		else
		{
		   invListTD[playerid] = 0;
		   invTDoff[playerid] ++;
		}
	}
	if(dialogid == DIALOG_KUPRINE_GRIPEX) //Gripex - naudoti sau
	{
		if(response)
		{
           if (zInfo[playerid][disease] != 2) return SuccesMSG(playerid, " Jums ne gripas arba iðvis nesergate!");
           if (zInfo[playerid][disease] == 2 && zInfo[playerid][drugscure][1] == 0) return SuccesMSG(playerid, " Jûs neturite vaistø nuo gripo!");
           zInfo[playerid][disease] = 0;
           zInfo[playerid][drugscure][1] -= 1;
           KillTimer(DST);
           SetPlayerDrunkLevel(playerid, 0);
           SetPlayerWeather(playerid, SERVERIO_ORAS);
           SuccesMSG(playerid, " Sëkmingai iðsigydëte gripà!");
        }
        else return invListTD[playerid] = 2, hpListIT(playerid);
	}
	if(dialogid == DIALOG_KUPRINE_GRIPEX_DUOTI) //Gripex - duoti þaidëjui
	{
		if(response)
		{
           new kiekis = 0;
           new id, tr = zInfo[playerid][drugscure][1];
		   if(sscanf(inputtext, "ud", id, tr)) return hpListIT(playerid);
		   if(tr < kiekis) return ErorMSG(playerid, "Neturite tiek gripex!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!");
		   else if(id == playerid) return ErorMSG(playerid, "Sau gripex duoti negalite!");
		   zInfo[playerid][drugscure][1] -= tr;
		   SuccesMSG(playerid, " Davëte þaidëjui Gripex vaistà");
		   zInfo[id][drugscure][1] += tr;
		   SuccesMSG(id, " Gavote Gripex vaistà");
		   invListTD[playerid] = 0;
		}
		else
		{
		   invListTD[playerid] = 0;
		   invTDoff[playerid] ++;
		}

	}
	if(dialogid == DIALOG_KUPRINE_ANTIBIOTIKAI) //Antibiotikai - naudoti sau
	{
		if(response)
		{
           if (zInfo[playerid][disease] != 3) return SuccesMSG(playerid, " Jums ne plauèiø uþdegimas arba iðvis nesergate!");
           if (zInfo[playerid][disease] == 3 && zInfo[playerid][drugscure][2] == 0) return SuccesMSG(playerid, " Jûs neturite vaistø nuo plauèiø uþdegimo!");
           zInfo[playerid][disease] = 0;
           zInfo[playerid][drugscure][2] -= 1;
           KillTimer(DST);
           SetPlayerDrunkLevel(playerid, 0);
           SetPlayerWeather(playerid, SERVERIO_ORAS);
           SuccesMSG(playerid, " Sëkmingai iðsigydëte plauèiø uþdegimà!");
        }
        else return invListTD[playerid] = 3, hpListIT(playerid);
	}
	if(dialogid == DIALOG_KUPRINE_ANTIBIOTIKAI_DUOTI) //Antibiotikai - duoti þaidëjui
	{
		if(response)
		{
           new kiekis = 0;
           new id, tr = zInfo[playerid][drugscure][2];
		   if(sscanf(inputtext, "ud", id, tr)) return hpListIT(playerid);
		   if(tr < kiekis) return ErorMSG(playerid, "Neturite tiek antibiotikø!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!");
		   else if(id == playerid) return ErorMSG(playerid, "Sau antibiotikø duoti negalite!");
		   zInfo[playerid][drugscure][2] -= tr;
		   SuccesMSG(playerid, " Davëte þaidëjui Antibiotikà vaistà");
		   zInfo[id][drugscure][2] += tr;
		   SuccesMSG(id, " Gavote Antibiotikà vaistà");
		   invListTD[playerid] = 0;
		}
		else
		{
		   invListTD[playerid] = 0;
		   invTDoff[playerid] ++;
		}
	}
	if(dialogid == DIALOG_KUPRINE_BANDELE) //Bandelë - valgyti sau
	{
		if(response)
		{
           if(zInfo[playerid][maistas][0] == 0) return SuccesMSG(playerid, "Neturite nusipirke bandeles!");
           new Float:hp;
           GetPlayerHealth(playerid, hp);
           if(hp<100){SetPlayerHealth(playerid, hp+5);}
           zInfo[playerid][alkis] += 5;
           if(zInfo[playerid][alkis] > 100)
           {
                  zInfo[playerid][alkis] = 100;
           }
           UpdateAlkanasTextdraw( playerid );
           zInfo[playerid][maistas][0] -= 1;
           ApplyAnimation(playerid,"VENDING","vend_eat1_P",4.1,0,0,0,0,0);
           SuccesMSG(playerid, "{ff9900}••• {FFFFFF}Valgote bandelæ!");
        }
        else return invListTD[playerid] = 4, hpListIT(playerid);
	}
    if(dialogid == DIALOG_KUPRINE_BANDELE_DUOTI) //Bandelë - duoti þaidëjui
	{
		if(response)
		{
           new kiekis = 0;
           new id, tr = zInfo[playerid][maistas][0];
		   if(sscanf(inputtext, "ud", id, tr)) return hpListIT(playerid);
		   if(tr < kiekis) return ErorMSG(playerid, "Neturite tiek bandeliø!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!");
		   else if(id == playerid) return ErorMSG(playerid, "Sau bandeles duoti negalite!");
		   zInfo[playerid][maistas][0] -= tr;
		   SuccesMSG(playerid, " Davëte þaidëjui bandelæ");
		   zInfo[id][maistas][0] += tr;
		   SuccesMSG(id, " Gavote bandelæ");
		   invListTD[playerid] = 0;
		}
		else
		{
		   invListTD[playerid] = 0;
		   invTDoff[playerid] ++;
		}
	}
    if(dialogid == DIALOG_KUPRINE_JOGURTAS) //Bandelë - valgyti sau
	{
		if(response)
		{
           if(zInfo[playerid][maistas][1] == 0) return SuccesMSG(playerid, "Neturite nusipirke jogurto!");
           new Float:hp;
           GetPlayerHealth(playerid, hp);
           if(hp<100){SetPlayerHealth(playerid, hp+2);}
           zInfo[playerid][alkis] += 2;
           if(zInfo[playerid][alkis] > 100)
           {
                  zInfo[playerid][alkis] = 100;
           }
           UpdateAlkanasTextdraw( playerid );
           zInfo[playerid][maistas][1] -= 1;
           ApplyAnimation(playerid,"VENDING","vend_eat1_P",4.1,0,0,0,0,0);
           SuccesMSG(playerid, "{ff9900}••• {FFFFFF}Geriate jogurtà!");
        }
        else return invListTD[playerid] = 5, hpListIT(playerid);
	}
	if(dialogid == DIALOG_KUPRINE_JOGURTAS_DUOTI) //Jogurtà - duoti þaidëjui
	{
		if(response)
		{
           new kiekis = 0;
           new id, tr = zInfo[playerid][maistas][1];
		   if(sscanf(inputtext, "ud", id, tr)) return hpListIT(playerid);
		   if(tr < kiekis) return ErorMSG(playerid, "Neturite tiek jogurto!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!");
		   else if(id == playerid) return ErorMSG(playerid, "Sau jogurto duoti negalite!");
		   zInfo[playerid][maistas][1] -= tr;
		   SuccesMSG(playerid, " Davëte þaidëjui jogurtà");
		   zInfo[id][maistas][1] += tr;
		   SuccesMSG(id, " Gavote jogurto");
		   invListTD[playerid] = 0;
		}
		else
		{
		   invListTD[playerid] = 0;
		   invTDoff[playerid] ++;
		}
	}
    if(dialogid == DIALOG_KUPRINE_PICA) //Pica - valgyti sau
	{
		if(response)
		{
           if(zInfo[playerid][maistas][2] == 0) return SuccesMSG(playerid, "Neturite nusipirke picos!");
           new Float:hp;
           GetPlayerHealth(playerid, hp);
           if(hp<100){SetPlayerHealth(playerid, hp+20);}
           zInfo[playerid][alkis] += 20;
           if(zInfo[playerid][alkis] > 100)
           {
                  zInfo[playerid][alkis] = 100;
           }
           UpdateAlkanasTextdraw( playerid );
           zInfo[playerid][maistas][2] -= 1;
           ApplyAnimation(playerid,"VENDING","vend_eat1_P",4.1,0,0,0,0,0);
           SuccesMSG(playerid, "{ff9900}••• {FFFFFF}Valgote picà!");
        }
        else return invListTD[playerid] = 6, hpListIT(playerid);
	}
	if(dialogid == DIALOG_KUPRINE_PICA_DUOTI) //Picà - duoti þaidëjui
	{
		if(response)
		{
           new kiekis = 0;
           new id, tr = zInfo[playerid][maistas][2];
		   if(sscanf(inputtext, "ud", id, tr)) return hpListIT(playerid);
		   if(tr < kiekis) return ErorMSG(playerid, "Neturite tiek picø!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!");
		   else if(id == playerid) return ErorMSG(playerid, "Sau picos duoti negalite!");
		   zInfo[playerid][maistas][2] -= tr;
		   SuccesMSG(playerid, " Davëte þaidëjui picà");
		   zInfo[id][maistas][2] += tr;
		   SuccesMSG(id, " Gavote picà");
		   invListTD[playerid] = 0;
		}
		else
		{
		   invListTD[playerid] = 0;
		   invTDoff[playerid] ++;
		}
	}
	if(dialogid == DIALOG_KUPRINE_GINKLAI) //Ginklai
	{
		if(response)
		{
			 if(listitem == 1)
			 {
			 
                new str[189+1];

                format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
                format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_DEAGLE, DIALOG_STYLE_LIST, "{FFFFFF}Deagle", str, "Pasirinkti", "Atðaukti");
			 }
			 if(listitem == 2)
			 {
			 
                new str[189+1];

                format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
                format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_SHOTGUN, DIALOG_STYLE_LIST, "{FFFFFF}Shotgun", str, "Pasirinkti", "Atðaukti");
			 }
             if(listitem == 3)
			 {
			 
                new str[189+1];

                format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
                format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_AK47, DIALOG_STYLE_LIST, "{FFFFFF}AK47", str, "Pasirinkti", "Atðaukti");
			 }
			 if(listitem == 4)
			 {
			 
                new str[189+1];

                format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
                format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_M4, DIALOG_STYLE_LIST, "{FFFFFF}M4", str, "Pasirinkti", "Atðaukti");
			 }
		}
		else invListTD[playerid] = 0, invTDoff[playerid] ++;
	}		
	if(dialogid == DIALOG_KUPRINE_DEAGLE)
	{
		if(response)
		{
		     invListTD[playerid] = 7;
		
			 if(listitem == 1)
			 {
                new str[32+1];

                format(str, sizeof(str), "{FFFFFF}Áraðykite kulkø skaièiø:");

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_DEAGLE_PASIIMTI, DIALOG_STYLE_INPUT, "{339966}Deagle", str, "Pasiimti", "Atðaukti");
			 }
             if(listitem == 2)
			 {
                new str[32+1];

                format(str, sizeof(str), "{FFFFFF}Áraðykite kulkø skaièiø:");

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_DEAGLE_PADETI, DIALOG_STYLE_INPUT, "{339966}Deagle", str, "Padëti", "Atðaukti");
			 }
			 if(listitem == 3)
			 {
                hpListIT(playerid);
			 }
		}
		else invListTD[playerid] = 0;
	}
	if(dialogid == DIALOG_KUPRINE_DEAGLE_PASIIMTI)
	{
		if(response)
		{
		   new kiekis = 0;
		   new kGun = zInfo[playerid][kDeagle];
		   if(sscanf(inputtext, "d", kiekis)) return invListTD[playerid] = 7, hpListIT(playerid);
		   if(kGun < kiekis) return ErorMSG(playerid, "Tiek kulkø neturite!");
		   zInfo[playerid][kDeagle] -= kiekis;
		   GivePlayerWeaponsEx(playerid, 24, kiekis);
		   SuccesMSG(playerid, "Pasiëmei Deagle kulkø");
	 	}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_DEAGLE, DIALOG_STYLE_LIST, "{FFFFFF}Deagle", str, "Pasirinkti", "Atðaukti");
	    }
	}
    if(dialogid == DIALOG_KUPRINE_DEAGLE_PADETI)
	{
		if(response)
		{
           new kiekis = 0;
		   new kAmmo = GetPlayerAmmo(playerid);
		   if(sscanf(inputtext, "d", kiekis)) return invListTD[playerid] = 7, hpListIT(playerid);
		   if(kAmmo < kiekis) return ErorMSG(playerid, "Tiek kulkø neturite!");
		   else if(zInfo[playerid][NoGunsPD] == 1) return ErorMSG(playerid, "Negalite padëti PD kulkas!");
		   else if(zInfo[playerid][NoGunsKart] == 1) return ErorMSG(playerid, "Negalite padëti Kartelio kulkas!");
		   else if(zInfo[playerid][NoGunsGang] == 1) return ErorMSG(playerid, "Negalite padëti Gaujø kulkas!");
		   zInfo[playerid][kDeagle] += kiekis;
           GivePlayerWeaponsEx(playerid, 24, -kiekis);
		   SuccesMSG(playerid, "Padëjai Deagle kulkø");
	 	}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_DEAGLE, DIALOG_STYLE_LIST, "{FFFFFF}Deagle", str, "Pasirinkti", "Atðaukti");
	    }
	}
	if(dialogid == DIALOG_KUPRINE_DEAGLE_DUOTI)
	{
	    if(response)
		{
           new kiekis = 0;
		   new id, gn = zInfo[playerid][kDeagle];
		   if(sscanf(inputtext, "ud", id, kiekis)) return invListTD[playerid] = 7, hpListIT(playerid);
		   if(gn < kiekis) return ErorMSG(playerid, "Jûs neturite tiek kuprinëje kulkø!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!"), invListTD[playerid] = 7, hpListIT(playerid);
		   else if(id == playerid) return ErorMSG(playerid, "Sau kulkø duoti negalite!"), invListTD[playerid] = 7, hpListIT(playerid);
		   zInfo[playerid][kDeagle] -= gn;
		   SuccesMSG(playerid, " Davëte þaidëjui deagle kulkø");
		   zInfo[id][kDeagle] += gn;
		   SuccesMSG(id, " Gavote deagle kulkø");
		   invListTD[playerid] = 0;
		}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_DEAGLE, DIALOG_STYLE_LIST, "{FFFFFF}Deagle", str, "Pasirinkti", "Atðaukti");
	    }
	}
    if(dialogid == DIALOG_KUPRINE_SHOTGUN)
	{
		if(response)
		{
		     invListTD[playerid] = 8;
		
			 if(listitem == 1)
			 {
                new str[32+1];

                format(str, sizeof(str), "{FFFFFF}Áraðykite kulkø skaièiø:");

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_SHOTGUN_PASIIMTI, DIALOG_STYLE_INPUT, "{339966}Shotgun", str, "Pasiimti", "Atðaukti");
			 }
             if(listitem == 2)
			 {
                new str[32+1];

                format(str, sizeof(str), "{FFFFFF}Áraðykite kulkø skaièiø:");

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_SHOTGUN_PADETI, DIALOG_STYLE_INPUT, "{339966}Shotgun", str, "Padëti", "Atðaukti");
			 }
			 if(listitem == 3)
			 {
                hpListIT(playerid);
			 }
		}
		else invTDoff[playerid] ++;
	}
    if(dialogid == DIALOG_KUPRINE_SHOTGUN_PASIIMTI)
	{
		if(response)
		{
           new kiekis = 0;
		   new kGun = zInfo[playerid][kShotgun];
		   if(sscanf(inputtext, "d", kiekis)) return invListTD[playerid] = 8, hpListIT(playerid);
		   if(kGun < kiekis) return ErorMSG(playerid, "Tiek kulkø neturite!");
		   zInfo[playerid][kShotgun] -= kiekis;
		   GivePlayerWeaponsEx(playerid, 25, kiekis);
		   SuccesMSG(playerid, "Pasiëmei Shotgun kulkø");
	 	}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_SHOTGUN, DIALOG_STYLE_LIST, "{FFFFFF}Shotgun", str, "Pasirinkti", "Atðaukti");
		}   
	}
    if(dialogid == DIALOG_KUPRINE_SHOTGUN_PADETI)
	{
		if(response)
		{
		   //new weaponid;	
		   new kiekis = strval(inputtext);
		   new kAmmo = GetPlayerAmmo(playerid);
		   //new slot = GetWeaponSlotE(25);
		   //GetPlayerWeaponData(playerid, slot, 25, kAmmo);
		   if(sscanf(inputtext, "d", kiekis)) return invListTD[playerid] = 8, hpListIT(playerid);
		   //if(kAmmo < kiekis) return ErorMSG(playerid, "Tiek kulkø neturite!");
		   if(kiekis <= 0) return ErorMSG(playerid, "Tiek kulkø neturite!");
		   if(kiekis > kAmmo) return ErorMSG(playerid, "Tiek kulkø neturite!");
		   else if(zInfo[playerid][NoGunsPD] == 1) return ErorMSG(playerid, "Negalite padëti PD kulkas!");
		   else if(zInfo[playerid][NoGunsKart] == 1) return ErorMSG(playerid, "Negalite padëti Kartelio kulkas!");
		   else if(zInfo[playerid][NoGunsGang] == 1) return ErorMSG(playerid, "Negalite padëti Gaujø kulkas!");
		   zInfo[playerid][kShotgun] += kiekis;
		   GivePlayerWeaponsEx(playerid, 25, -kiekis);
		   SuccesMSG(playerid, "Padëjai Shotgun kulkas");
	 	}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_SHOTGUN, DIALOG_STYLE_LIST, "{FFFFFF}Shotgun", str, "Pasirinkti", "Atðaukti");
		}  
	}
	if(dialogid == DIALOG_KUPRINE_SHOTGUN_DUOTI)
	{
	    if(response)
		{
		   new kiekis = 0;
		   new id, gn = zInfo[playerid][kShotgun];
		   if(sscanf(inputtext, "ud", id, kiekis)) return invListTD[playerid] = 8, hpListIT(playerid);
		   if(gn < kiekis) return ErorMSG(playerid, "Jûs neturite tiek kuprinëje kulkø!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!"), invListTD[playerid] = 8, hpListIT(playerid);
		   else if(id == playerid) return ErorMSG(playerid, "Sau kulkø duoti negalite!"), invListTD[playerid] = 8, hpListIT(playerid);
		   zInfo[playerid][kShotgun] -= gn;
		   SuccesMSG(playerid, " Davëte þaidëjui shotgun kulkø");
		   zInfo[id][kShotgun] += gn;
		   SuccesMSG(id, " Gavote shotgun kulkø");
		   invListTD[playerid] = 0;
		}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_SHOTGUN, DIALOG_STYLE_LIST, "{FFFFFF}Shotgun", str, "Pasirinkti", "Atðaukti");
		}  
	}
    if(dialogid == DIALOG_KUPRINE_AK47)
	{
		if(response)
		{
		     invListTD[playerid] = 9;
		
			 if(listitem == 1)
			 {
                new str[32+1];

                format(str, sizeof(str), "{FFFFFF}Áraðykite kulkø skaièiø:");

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_AK47_PASIIMTI, DIALOG_STYLE_INPUT, "{339966}AK47", str, "Pasiimti", "Atðaukti");
			 }
             if(listitem == 2)
			 {
                new str[32+1];

                format(str, sizeof(str), "{FFFFFF}Áraðykite kulkø skaièiø:");

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_AK47_PADETI, DIALOG_STYLE_INPUT, "{339966}AK47", str, "Padëti", "Atðaukti");
			 }
			 if(listitem == 3)
			 {
                hpListIT(playerid);
			 }
		}
		else invTDoff[playerid] ++;
	}
    if(dialogid == DIALOG_KUPRINE_AK47_PASIIMTI)
	{
		if(response)
		{
		   new kiekis = 0;
		   new kGun = zInfo[playerid][kAk47];
		   if(sscanf(inputtext, "d", kiekis)) return invListTD[playerid] = 9, hpListIT(playerid);
		   if(kGun < kiekis) return ErorMSG(playerid, "Tiek kulkø neturite!");
		   zInfo[playerid][kAk47] -= kiekis;
		   GivePlayerWeaponsEx(playerid, 30, kiekis);
		   SuccesMSG(playerid, "Pasiëmei AK47 kulkø");
	 	}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_AK47, DIALOG_STYLE_LIST, "{FFFFFF}AK47", str, "Pasirinkti", "Atðaukti");
	    }
	}
    if(dialogid == DIALOG_KUPRINE_AK47_PADETI)
	{
		if(response)
		{
		   new kiekis = 0;
		   new kAmmo = GetPlayerAmmo(playerid);
		   if(sscanf(inputtext, "d", kiekis)) return invListTD[playerid] = 9, hpListIT(playerid);
		   if(kAmmo < kiekis) return ErorMSG(playerid, "Tiek kulkø neturite!");
		   else if(zInfo[playerid][NoGunsPD] == 1) return ErorMSG(playerid, "Negalite padëti PD kulkas!");
		   else if(zInfo[playerid][NoGunsKart] == 1) return ErorMSG(playerid, "Negalite padëti Kartelio kulkas!");
		   else if(zInfo[playerid][NoGunsGang] == 1) return ErorMSG(playerid, "Negalite padëti Gaujø kulkas!");
		   zInfo[playerid][kAk47] += kiekis;
	       GivePlayerWeaponsEx(playerid, 30, -kiekis);
		   SuccesMSG(playerid, "Padëjai AK47 kulkø");
	 	}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_AK47, DIALOG_STYLE_LIST, "{FFFFFF}AK47", str, "Pasirinkti", "Atðaukti");
	    }
	}
	if(dialogid == DIALOG_KUPRINE_AK47_DUOTI)
	{
	    if(response)
		{
		   new kiekis = 0;
		   new id, gn = zInfo[playerid][kAk47];
		   if(sscanf(inputtext, "ud", id, kiekis)) return invListTD[playerid] = 9, hpListIT(playerid);
		   if(gn < kiekis) return ErorMSG(playerid, "Jûs neturite tiek kuprinëje kulkø!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!"), invListTD[playerid] = 9, hpListIT(playerid);
		   else if(id == playerid) return ErorMSG(playerid, "Sau kulkø duoti negalite!"), invListTD[playerid] = 9, hpListIT(playerid);
		   zInfo[playerid][kAk47] -= gn;
		   SuccesMSG(playerid, " Davëte þaidëjui ak47 kulkø");
		   zInfo[id][kAk47] += gn;
		   SuccesMSG(id, " Gavote ak47 kulkø");
		   invListTD[playerid] = 0;
		}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_AK47, DIALOG_STYLE_LIST, "{FFFFFF}AK47", str, "Pasirinkti", "Atðaukti");
	    }
	}
	if(dialogid == DIALOG_KUPRINE_M4)
	{
		if(response)
		{
		     invListTD[playerid] = 10;
		
			 if(listitem == 1)
			 {
                new str[32+1];

                format(str, sizeof(str), "{FFFFFF}Áraðykite kulkø skaièiø:");

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_M4_PASIIMTI, DIALOG_STYLE_INPUT, "{339966}M4", str, "Pasiimti", "Atðaukti");
			 }
             if(listitem == 2)
			 {
                new str[32+1];

                format(str, sizeof(str), "{FFFFFF}Áraðykite kulkø skaièiø:");

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_M4_PADETI, DIALOG_STYLE_INPUT, "{339966}M4", str, "Padëti", "Atðaukti");
			 }
			 if(listitem == 3)
			 {
                hpListIT(playerid);
			 }
		}
		else invListTD[playerid] = 0, invTDoff[playerid] ++;
	}
    if(dialogid == DIALOG_KUPRINE_M4_PASIIMTI)
	{
		if(response)
		{
		   new kiekis = 0;
		   new kGun = zInfo[playerid][kM4];
		   if(sscanf(inputtext, "d", kiekis)) return invListTD[playerid] = 10, hpListIT(playerid);
		   if(kGun < kiekis) return ErorMSG(playerid, "Tiek kulkø neturite!");
		   zInfo[playerid][kM4] -= kiekis;
		   GivePlayerWeaponsEx(playerid, 31, kiekis);
		   SuccesMSG(playerid, "Pasiëmei M4 kulkø");
	 	}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_M4, DIALOG_STYLE_LIST, "{FFFFFF}M4", str, "Pasirinkti", "Atðaukti");
	    }
	}
    if(dialogid == DIALOG_KUPRINE_M4_PADETI)
	{
		if(response)
		{
		   new kiekis = 0;
		   new kAmmo = GetPlayerAmmo(playerid);
		   if(sscanf(inputtext, "d", kiekis)) return invListTD[playerid] = 10, hpListIT(playerid);
		   if(kAmmo < kiekis) return ErorMSG(playerid, "Tiek kulkø neturite!");
		   else if(zInfo[playerid][NoGunsPD] == 1) return ErorMSG(playerid, "Negalite padëti PD kulkas!");
		   else if(zInfo[playerid][NoGunsKart] == 1) return ErorMSG(playerid, "Negalite padëti Kartelio kulkas!");
		   else if(zInfo[playerid][NoGunsGang] == 1) return ErorMSG(playerid, "Negalite padëti Gaujø kulkas!");
		   zInfo[playerid][kM4] += kiekis;
		   GivePlayerWeaponsEx(playerid, 31, -kiekis);
		   SuccesMSG(playerid, "Padëjai M4 kulkas");
	 	}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_M4, DIALOG_STYLE_LIST, "{FFFFFF}M4", str, "Pasirinkti", "Atðaukti");
	    }
	}
	if(dialogid == DIALOG_KUPRINE_M4_DUOTI)
	{
	    if(response)
		{
		   new kiekis = 0;
		   new id, gn = zInfo[playerid][kM4];
		   if(sscanf(inputtext, "ud", id, kiekis)) return invListTD[playerid] = 10, hpListIT(playerid);
		   if(gn < kiekis) return ErorMSG(playerid, "Jûs neturite tiek kuprinëje kulkø!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!"), invListTD[playerid] = 10, hpListIT(playerid);
		   else if(id == playerid) return ErorMSG(playerid, "Sau kulkø duoti negalite!"), invListTD[playerid] = 10, hpListIT(playerid);
		   zInfo[playerid][kM4] -= gn;
		   SuccesMSG(playerid, " Davëte þaidëjui M4 kulkø");
		   zInfo[id][kM4] += gn;
		   SuccesMSG(id, " Gavote M4 kulkø");
		   invListTD[playerid] = 0;
		}
		else
		{
		   new str[189+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}ginklà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti ginklà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}Duo", str);
           format(str, sizeof(str), "%sti {339966}ginklà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_M4, DIALOG_STYLE_LIST, "{FFFFFF}M4", str, "Pasirinkti", "Atðaukti");
	    }
	}
	if(dialogid == DIALOG_KUPRINE_NARKOTIKAI)
	{
	    if(response)
		{
		     if(listitem == 1)
			 {
			    new str[192+1];

                format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}kokainà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti kokainà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}D", str);
                format(str, sizeof(str), "%suoti {339966}kokainà {FFFFFF}þaidëjui", str);

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_KOKAINAS, DIALOG_STYLE_LIST, "Kokainas", str, "Pasirinkti", "Atðaukti");
			 }
			 if(listitem == 2)
			 {
			    new str[183+1];

                format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}þolæ {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti þolæ {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}D", str);
                format(str, sizeof(str), "%suoti {339966}þolæ {FFFFFF}þaidëjui", str);

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_ZOLE, DIALOG_STYLE_LIST, "Þolë", str, "Pasirinkti", "Atðaukti");
			 }
        }
		else invListTD[playerid] = 0;
    }
	if(dialogid == DIALOG_KUPRINE_KOKAINAS)
	{
	    if(response)
		{
		     invListTD[playerid] = 11;
		
		     if(listitem == 1)
			 {
			 
                new str[34+1];

                format(str, sizeof(str), "%s{FFFFFF}Áraðykite kokaino skaièiø:");

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_KOKAINAS_PASIIMTI, DIALOG_STYLE_INPUT, "{339966}Kokainas", str, "Pasiimti", "Atðaukti");			    
			 }
			 if(listitem == 2)
			 {
			 
			    new str[34+1];

                format(str, sizeof(str), "%s{FFFFFF}Áraðykite kokaino skaièiø:");

                ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_KOKAINAS_PADETI, DIALOG_STYLE_INPUT, "{339966}Kokainas", str, "Padëti", "Atðaukti");
			 }
			 if(listitem == 3)
			 {
				
			    hpListIT(playerid);
			 }
		}
		else invListTD[playerid] = 0;
    }
	if(dialogid == DIALOG_KUPRINE_KOKAINAS_PASIIMTI)
	{
	    if(response)
		{
		   new kiekis = 0;
		   new kok = zInfo[playerid][kNark][0];
		   if(sscanf(inputtext, "d", kiekis)) return ErorMSG(playerid, "Praðome ávesti skaièius!");
		   if(kok < kiekis) return ErorMSG(playerid, "Jûs neturite kuprinëje kokaino!");
		   zInfo[playerid][kokainas] += kiekis;
		   zInfo[playerid][kNark][0] -= kiekis;
		   SuccesMSG(playerid, "Pasiëmei kokaino ið kuprinës");
		}
		else
		{
		   new str[192+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}kokainà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti kokainà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}D", str);
           format(str, sizeof(str), "%suoti {339966}kokainà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_KOKAINAS, DIALOG_STYLE_LIST, "Kokainas", str, "Pasirinkti", "Atðaukti");
		}
	}
    if(dialogid == DIALOG_KUPRINE_KOKAINAS_PADETI)
	{
	    if(response)
		{
		   new kiekis = 0;
		   new kok = zInfo[playerid][kokainas];
		   if(sscanf(inputtext, "d", kiekis)) return ErorMSG(playerid, "Praðome ávesti skaièius!");
		   if(kok < kiekis) return ErorMSG(playerid, "Jûs neturite rankose kokaino!");
		   
		   zInfo[playerid][kNark][0] += kiekis;
		   zInfo[playerid][kokainas] -= kiekis;
		   SuccesMSG(playerid, "Padëjai kokainà á kuprine");
		}
		else
		{
		   new str[192+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}kokainà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti kokainà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}D", str);
           format(str, sizeof(str), "%suoti {339966}kokainà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_KOKAINAS, DIALOG_STYLE_LIST, "Kokainas", str, "Pasirinkti", "Atðaukti");
		}
	}
    if(dialogid == DIALOG_KUPRINE_KOKAINAS_DUOTI)
	{
	    if(response)
		{
		   new kiekis = 0;
		   new id, nk = zInfo[playerid][kNark][0];
		   if(sscanf(inputtext, "ud", id, kiekis)) return invListTD[playerid] = 11, hpListIT(playerid);
		   if(nk < kiekis) return ErorMSG(playerid, "Jûs neturite kuprinëje kokaino!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!"), invListTD[playerid] = 11, hpListIT(playerid);
		   else if(id == playerid) return ErorMSG(playerid, "Sau kokaino duoti negalite!"), invListTD[playerid] = 11, hpListIT(playerid);
		   
		   zInfo[id][kNark][0] += nk;
		   zInfo[playerid][kNark][0] -= nk;
		   
		   SuccesMSG(playerid, "Davëte þaidëjui kokainà");
		   SuccesMSG(id, "Gavote kokainà");
		   
		   invListTD[playerid] = 0;
		}
		else
		{
		   new str[192+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}kokainà {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti kokainà {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}D", str);
           format(str, sizeof(str), "%suoti {339966}kokainà {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_KOKAINAS, DIALOG_STYLE_LIST, "Kokainas", str, "Pasirinkti", "Atðaukti");
		}
	}	
    if(dialogid == DIALOG_KUPRINE_ZOLE)
    {	
	    if(response)
        {
		   invListTD[playerid] = 12;
		
		   if(listitem == 1)
		   {

		
		      new str[32+1];

              format(str, sizeof(str), "%s{FFFFFF}Áraðykite þolës skaièiø:");

              ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_ZOLE_PASIIMTI, DIALOG_STYLE_INPUT, "{339966}Þolë", str, "Pasiimti", "Atðaukti");
           }
		   if(listitem == 2)
		   {

		
		      new str[32+1];

              format(str, sizeof(str), "%s{FFFFFF}Áraðykite þolës skaièiø:");

              ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_ZOLE_PADETI, DIALOG_STYLE_INPUT, "{339966}Þolë", str, "Padëti", "Atðaukti");
		   }
		   if(listitem == 3)
		   {

		
		      hpListIT(playerid);
           }
	    }
        else invListTD[playerid] = 0;
	}
    if(dialogid == DIALOG_KUPRINE_ZOLE_PASIIMTI)
	{
	    if(response)
		{
		   new kiekis = 0;
		   new zol = zInfo[playerid][kNark][1];
		   if(sscanf(inputtext, "d", kiekis)) return ErorMSG(playerid, "Praðome ávesti skaièius!");
		   if(zol < kiekis) return ErorMSG(playerid, "Jûs neturite kuprinëje þolës!");
		   zInfo[playerid][zole] += kiekis;
		   zInfo[playerid][kNark][1] -= kiekis;
		   SuccesMSG(playerid, "Pasiëmei þolæ ið kuprinës");
		}
		else
        {
           new str[183+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}þolæ {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti þolæ {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}D", str);
           format(str, sizeof(str), "%suoti {339966}þolæ {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_ZOLE, DIALOG_STYLE_LIST, "Þolë", str, "Pasirinkti", "Atðaukti");
		}
	}
    if(dialogid == DIALOG_KUPRINE_ZOLE_PADETI)
	{
	    if(response)
		{
		   new kiekis = 0;
		   new zol = zInfo[playerid][zole];
		   if(sscanf(inputtext, "d", kiekis)) return ErorMSG(playerid, "Praðome ávesti skaièius!");
		   if(zol < kiekis) return ErorMSG(playerid, "Jûs neturite rankose þolës!");
		   
		   zInfo[playerid][kNark][1] += kiekis;
		   zInfo[playerid][zole] -= kiekis;
		   SuccesMSG(playerid, "Padëjai þolæ á kuprine");
		}
		else
        {
           new str[183+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}þolæ {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti þolæ {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}D", str);
           format(str, sizeof(str), "%suoti {339966}þolæ {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_ZOLE, DIALOG_STYLE_LIST, "Þolë", str, "Pasirinkti", "Atðaukti");
		}
	}
    if(dialogid == DIALOG_KUPRINE_ZOLE_DUOTI)
	{
	    if(response)
		{
           new kiekis = 0;
		   new id, zl = zInfo[playerid][kNark][1];
		   if(sscanf(inputtext, "ud", id, kiekis)) return invListTD[playerid] = 12, hpListIT(playerid);
		   if(zl < kiekis) return ErorMSG(playerid, "Jûs neturite kuprinëje þolës!");
		   if(strfind(inputtext,"-",true)!= -1) return ErorMSG(playerid, "Jûs minuso naudoti negalite!");
		   if(id == INVALID_PLAYER_ID) return ErorMSG(playerid, "Tokio þaidëjo nëra!"), invListTD[playerid] = 12, hpListIT(playerid);
		   else if(id == playerid) return ErorMSG(playerid, "Sau þolës duoti negalite!"), invListTD[playerid] = 12, hpListIT(playerid);
		   
		   zInfo[id][kNark][1] += zl;
		   zInfo[playerid][kNark][1] -= zl;
		   
		   SuccesMSG(playerid, "Davëte þaidëjui þolës");
		   SuccesMSG(id, "Gavote þolës");
		   
		   invListTD[playerid] = 0;
		}
		else
        {
           new str[183+1];

           format(str, sizeof(str), "%s\t\n\n\t{339966}• {FFFFFF}Pasiimti {339966}þolæ {FFFFFF}ið kuprinës\n\t{339966}• {FFFFFF}Padëti þolæ {339966}á {FFFFFF}kuprinë\n\t{339966}• {FFFFFF}D", str);
           format(str, sizeof(str), "%suoti {339966}þolæ {FFFFFF}þaidëjui", str);

           ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_ZOLE, DIALOG_STYLE_LIST, "Þolë", str, "Pasirinkti", "Atðaukti");
		}
	}
	if(dialogid == DIALOG_KUPRINE)
	{
		if(response)
		{
		    if(listitem == 0)
		    {
			   new str[53+1];

               format(str, sizeof(str), "\t{FFFFFF}Jûs turite: {339966}%d {FFFFFF}vnt{339966}.", zInfo[playerid][drugscure][0]);

               ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_TERAFLU, DIALOG_STYLE_MSGBOX, "{339966}Teraflu", str, "Naudoti", "Duoti"); 
		    }  
		    if(listitem == 1)
		    {
			   new str[53+1];

               format(str, sizeof(str), "\t{FFFFFF}Jûs turite: {339966}%d {FFFFFF}vnt{339966}.", zInfo[playerid][drugscure][1]);

               ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_GRIPEX, DIALOG_STYLE_MSGBOX, "{339966}Gripex", str, "Naudoti", "Duoti");
		    }
		    if(listitem == 2)
		    {
			   new str[53+1];

               format(str, sizeof(str), "\t\t{FFFFFF}Jûs turite: {339966}%d {FFFFFF}vnt{339966}.", zInfo[playerid][drugscure][2]);

               ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_ANTIBIOTIKAI, DIALOG_STYLE_MSGBOX, "{339966}Antibiotikai", str, "Naudoti", "Duoti");
		    }
		    if(listitem == 3)
		    {
			   new str[51+1];

               format(str, sizeof(str), "\t{FFFFFF}Jûs turite: {339966}%d {FFFFFF}vnt{339966}.", zInfo[playerid][maistas][0]);

               ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_BANDELE, DIALOG_STYLE_MSGBOX, "Bandelë", str, "Valgyti", "Duoti");
		    }
		    if(listitem == 4)
		    {
			   new str[51+1];

               format(str, sizeof(str), "\t{FFFFFF}Jûs turite: {339966}%d {FFFFFF}vnt{339966}.", zInfo[playerid][maistas][1]);

               ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_JOGURTAS, DIALOG_STYLE_MSGBOX, "Jogurtas", str, "Valgyti", "Duoti");
		    }
		    if(listitem == 5)
		    {
			   new str[51+1];

               format(str, sizeof(str), "\t{FFFFFF}Jûs turite: {339966}%d {FFFFFF}vnt{339966}.", zInfo[playerid][maistas][2]);

               ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_PICA, DIALOG_STYLE_MSGBOX, "Pica", str, "Valgyti", "Duoti");
		    }
		    if(listitem == 6)
		    {
			   new str[149+1];

               format(str, sizeof(str), "\t\n\t• {339966}Deagle {FFFFFF}- %d kulkø\n\t{339966}• {FFFFFF}Shotgun - %d kulkø\n\t• {339966}Ak-47 {FFFFFF}- %d kulkø\n\t{339966}• {FFFFFF}M4 - %d kulkø", zInfo[playerid][kDeagle],zInfo[playerid][kShotgun],zInfo[playerid][kAk47],zInfo[playerid][kM4],str);

               ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_GINKLAI, DIALOG_STYLE_LIST, "{FFFFFF}Ginklai", str, "Pasirinkti", "Atðaukti");
		    }
		    if(listitem == 7)
		    {
			   new str[79+1];

               format(str, sizeof(str), "\t\n\t• {339966}Kokainas {FFFFFF}- %d vnt\n\t{339966}• {FFFFFF}Þolë - %d vnt\n", zInfo[playerid][kNark][0], zInfo[playerid][kNark][1]);

               ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_NARKOTIKAI, DIALOG_STYLE_LIST, "Narkotikai", str, "Pasirinkti", "Atðaukti");
		    }
		}
	}	
	return 1;
}

/*CMD:kuprine(playerid, p
	SelectTextDraw(playerid, -1);
	invTDoff[playerid] ++;
	return 1;
}*/

stock hpListIT(playerid)
{
	if(invListTD[playerid] == 1)
	{
       new str[145+1];

       format(str, sizeof(str), "{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}Teraflu {FFFFFF}vaistà{339966}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_TERAFLU_DUOTI, DIALOG_STYLE_INPUT, "{339966}Vaisto davimas", str, "Duoti", "Iðeiti");
    }
    else if(invListTD[playerid] == 2)
	{
       new str[144+1];

       format(str, sizeof(str), "{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}Gripex {FFFFFF}vaistà{339966}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_GRIPEX_DUOTI, DIALOG_STYLE_INPUT, "{339966}Vaisto davimas", str, "Duoti", "Iðeiti");
    }
    else if(invListTD[playerid] == 3)
	{
       new str[149+1];

       format(str, sizeof(str), "{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}Antibiotikà {FFFFFF}vaistà{339966}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_ANTIBIOTIKAI_DUOTI, DIALOG_STYLE_INPUT, "{339966}Vaisto davimas", str, "Duoti", "Iðeiti");
    }
    else if(invListTD[playerid] == 4)
    {
       new str[130+1];

       format(str, sizeof(str), "{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}bandelë{FFFFFF}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_BANDELE_DUOTI, DIALOG_STYLE_INPUT, "Maisto davimas", str, "Duoti", "Iðeiti");
    }
    else if(invListTD[playerid] == 5)
    {
       new str[130+1];

       format(str, sizeof(str), "{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}jogurtà{FFFFFF}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_JOGURTAS_DUOTI, DIALOG_STYLE_INPUT, "Maisto davimas", str, "Duoti", "Iðeiti");
    }
    else if(invListTD[playerid] == 6)
    {
       new str[127+1];

       format(str, sizeof(str), "{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}pica{FFFFFF}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_PICA_DUOTI, DIALOG_STYLE_INPUT, "Maisto davimas", str, "Duoti", "Iðeiti");
    }
	else if(invListTD[playerid] == 7)
	{
	   new str[129+1];

       format(str, sizeof(str), "{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}ginkla{FFFFFF}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_DEAGLE_DUOTI, DIALOG_STYLE_INPUT, "Ginklo davimas", str, "Duoti", "Iðeiti");
	}
	else if(invListTD[playerid] == 8)
	{
	   new str[129+1];

       format(str, sizeof(str), "{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}ginkla{FFFFFF}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_SHOTGUN_DUOTI, DIALOG_STYLE_INPUT, "Ginklo davimas", str, "Duoti", "Iðeiti");
	}
	else if(invListTD[playerid] == 9)
	{
	   new str[129+1];

       format(str, sizeof(str), "{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}ginkla{FFFFFF}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_AK47_DUOTI, DIALOG_STYLE_INPUT, "Ginklo davimas", str, "Duoti", "Iðeiti");
	}
	else if(invListTD[playerid] == 10)
	{
	   new str[129+1];

       format(str, sizeof(str), "{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}ginkla{FFFFFF}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_M4_DUOTI, DIALOG_STYLE_INPUT, "Ginklo davimas", str, "Duoti", "Iðeiti");
	}
	else if(invListTD[playerid] == 11)
	{
	   new str[130+1];

       format(str, sizeof(str), "%s{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}kokainà{FFFFFF}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_KOKAINAS_DUOTI, DIALOG_STYLE_INPUT, "Kokainas", str, "Duoti", "Atðaukti");
	}
	else if(invListTD[playerid] == 12)
	{
	   new str[127+1];

       format(str, sizeof(str), "%s{FFFFFF}Áraðykite þaidëjo {339966}Vardas_Pavardë {FFFFFF} ir {339966}vienetus {FFFFFF}kuriam norite duoti {339966}þolæ{FFFFFF}.");

       ShowPlayerDialogEx(playerid, DIALOG_KUPRINE_ZOLE_DUOTI, DIALOG_STYLE_INPUT, "Þolë", str, "Duoti", "Atðaukti");
	}
    return 1;
}
