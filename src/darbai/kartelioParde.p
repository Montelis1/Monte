
new 
	// kiek ko yra
	kP_cocaine,
	kP_weed,
	kP_guns[5],
	// kainos
	kPP_cocaine,
	kPP_weed,
	kPP_guns[5],

	kiekBombu[MAX_PLAYERS],

	kP_kaEditina[MAX_PLAYERS],
	/* ^^
	0 cocaine
	1 weed
	2 Baseball Bat
	3 Sniper Rifle
	4 9mm
	5 Shotgun
	6 AK-47
	7 atsiema gpak || perka bombas
	8 papildo gunus
	*/
	kP_kE_kategorija[MAX_PLAYERS] // 0 - nustato kaina, papildo sand, atsiema atgal

;

#define DIALOG_KP_EDIT	18212
#define DIALOG_KP_GLOBEDIT 18213
#define DIALOG_KP_SHOP 18214
#define DIALOG_KP_SHOP_ 18215


#include YSI\y_hooks

form_kP_shop_(playerid)
{
	if (kP_kaEditina[playerid] == 7)
	{
		ShowPlayerDialog(playerid, DIALOG_KP_SHOP_, DIALOG_STYLE_INPUT, " ", "Áraðyk kiek bombø nori pirkti", "Pirkti", "Iðeiti");
	}
	else
	{
		new zx[100];
		format (zx, sizeof zx, "Dabartinë %s kaina yra %d eur/vnt ir sandelyje yra %d\nÁraðyk kiek nori nusipirkti",
		getKPrekName(kP_kaEditina[playerid]), get_kP_price(kP_kaEditina[playerid]), get_kP_count(kP_kaEditina[playerid]));
		ShowPlayerDialog(playerid, DIALOG_KP_SHOP_, DIALOG_STYLE_INPUT, " ", zx, "Pirkti", "Atgal");
	}
	return 1;
}

form_kP_shop(playerid)
{
	new zx[400];
	format (zx, sizeof zx, "Prekë\tKaina\tSandelyje\nBomba\t2000 eur\t-\nMedeljino kartelio prekës\nKokainas\t%deur/vnt\t%d\nÞolë\t%deur/vnt\t%d",/*\nBaseball Bat\t%deur/vnt\t%d\\nSniper Rifle\t%deur/vnt\t%d\n9mm\t%deur/vnt\t%d\nShotgun\t%deur/vnt\t%d\nAK-47\t%deur/vnt\t%d",*/
	kPP_cocaine, kP_cocaine, kPP_weed, kP_weed, kPP_guns[0], kP_guns[0], kPP_guns[1], kP_guns[1], kPP_guns[2], kP_guns[2], kPP_guns[3], kP_guns[3], kPP_guns[4], kP_guns[4]);
	ShowPlayerDialog(playerid, DIALOG_KP_SHOP, DIALOG_STYLE_TABLIST_HEADERS, " ", zx, "Pirkti", "Iðeiti");
	return 1;
}

CMD:kpard(playerid, params[])
{
	if (zInfo[playerid][dyrikz] != 13) return 0;
	form_kP_editdialog(playerid);

	return 1;
}

form_kP_editdialog(playerid)
{
	new zx[1000], pwnSucks[200];

	format (pwnSucks, sizeof pwnSucks,
	"Kokainas (sandelyje %d vnt) (kaina %d eur/vnt)\n\
	Nustatyti kaina\n\
	Papildyti sandelá\n\
	Atsiimti kokainà\n", kP_cocaine, kPP_cocaine);
	strcat(zx, pwnSucks);

	format (pwnSucks, sizeof pwnSucks,
	"Þolë (sandelyje %d vnt) (kaina %d eur/vnt)\n\
	Nustatyti kaina\n\
	Papildyti sandelá\n\
	Atsiimti þolæ\n \n", kP_weed, kPP_weed);
	strcat(zx, pwnSucks);

	/*format (pwnSucks, sizeof pwnSucks,
	"Ginklai\n\
	Kainos keitimas\n\
	Baseball Bat (sandelyje %d vnt) (kaina %d eur/vnt)\n\
	Sniper Rifle (sandelyje %d vnt) (kaina %d eur/vnt)\n\
	9mm (sandelyje %d vnt) (kaina %d eur/vnt)\n", kP_guns[0], kPP_guns[0], kP_guns[1], kPP_guns[1], kP_guns[2], kPP_guns[2]);
	strcat(zx, pwnSucks);

	format (pwnSucks, sizeof pwnSucks,
	"Shotgun (sandelyje %d vnt) (kaina %d eur/vnt)\n\
	AK-47 (sandelyje %d vnt) (kaina %d eur/vnt)\n\
	Atsiimti g. paketus\n\
	Papildyti ginklais", kP_guns[3], kPP_guns[3], kP_guns[4], kPP_guns[4]);
	strcat(zx, pwnSucks);*/

	ShowPlayerDialog(playerid, DIALOG_KP_EDIT, DIALOG_STYLE_LIST, " ", zx, "Pasirinkti", "Iðeiti");
	
	return 1;
}

form_kP_atsgpakdlg(playerid)
{
	new zx[80];
	format (zx, sizeof zx, "Ðiuo metu gali atsiimti %d g. paketø\nÁraðyk kiek nori atsiimti", getEnoughPackCount());
	ShowPlayerDialog(playerid, DIALOG_KP_GLOBEDIT, DIALOG_STYLE_INPUT, " ", zx, "Atsiimti", "Atgal");

	return 1;
}

form_kP_papsanddlg(playerid)
{
	new zx[200];
	format (zx, sizeof zx, "Ðiuo metu gali padëti %d g. paketø\nÁraðyk kiek nori padëti\n \n1 paketas pridës :\
	\nBaseball Bat 10 lazdø\nSniper Rifle 100 kulkø\n9mm 500 kulkø\nShotgun 100 kulkø\nAK-47 500 kulkø", DyleriaiGun);
	ShowPlayerDialog(playerid, DIALOG_KP_GLOBEDIT, DIALOG_STYLE_INPUT, " ", zx, "Padëti", "Atgal");

	return 1;
}

form_kP_globedit(playerid)
{
	new zx[150];

	switch (kP_kE_kategorija[playerid])
	{
		case 0:
		{
			format (zx, sizeof zx, "Dabartinë %s kaina yra %d eur/vnt\nÁraðyk nauja %s kaina", 
			getKPrekName(kP_kaEditina[playerid]), get_kP_price(kP_kaEditina[playerid]), getKPrekName(kP_kaEditina[playerid]));
			ShowPlayerDialog(playerid, DIALOG_KP_GLOBEDIT, DIALOG_STYLE_INPUT, " ", zx, "Keisti", "Atgal");
		}
		case 1:
		{
			format (zx, sizeof zx, "Dabar %s sandelyje yra %d vnt\nÁraðyk kiek nori papildyt %s\nMafija turi %d vnt.", 
			getKPrekName(kP_kaEditina[playerid]), get_kP_count(kP_kaEditina[playerid]), getKPrekName(kP_kaEditina[playerid]), (!kP_kaEditina[playerid] ? DyleriaiNark : DyleriaiZole));
			ShowPlayerDialog(playerid, DIALOG_KP_GLOBEDIT, DIALOG_STYLE_INPUT, " ", zx, "Papildyti", "Atgal");
		}
		case 2:
		{
			format (zx, sizeof zx, "Dabar %s sandelyje yra %d vnt\nÁraðyk kiek nori atsiimti %s", 
			getKPrekName(kP_kaEditina[playerid]), get_kP_count(kP_kaEditina[playerid]), getKPrekName(kP_kaEditina[playerid]));
			ShowPlayerDialog(playerid, DIALOG_KP_GLOBEDIT, DIALOG_STYLE_INPUT, " ", zx, "Atsiimti", "Atgal");
		}
		case 3: form_kP_atsgpakdlg(playerid);
		case 4: form_kP_papsanddlg(playerid);
	}

	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_KP_EDIT)
	{
		if (!response) return 1;

		switch (listitem)
		{
			case 1, 2, 3, 5, 6, 7, 11, 12, 13, 14, 15, 16, 17:
			{
				if (listitem < 4)
				{
					kP_kaEditina[playerid] = 0;
					kP_kE_kategorija[playerid] = listitem-1;
				}
				else if (listitem < 8)
				{
					kP_kaEditina[playerid] = 1;
					kP_kE_kategorija[playerid] = listitem-5;
				}
				else if (listitem < 16)
				{
					kP_kaEditina[playerid] = listitem-9;
					kP_kE_kategorija[playerid] = 0;
				}
				/*else if (listitem == 16)
				{
					if (!isEnoughGuns(1)) return SendClientMessage(playerid, RED, "Nëra ginklø bent vienam ginklø paketui"), form_kP_editdialog(playerid);
					kP_kaEditina[playerid] = 7;
					kP_kE_kategorija[playerid] = 3;
				}
				else if (listitem == 17)
				{
					if (DyleriaiGun < 1) return SendClientMessage(playerid, RED, "Nëra bent vieno ginklø paketo"), form_kP_editdialog(playerid);
					kP_kaEditina[playerid] = 8;
					kP_kE_kategorija[playerid] = 4;
				}*/
			}
			default: return form_kP_editdialog(playerid);
		}
		form_kP_globedit(playerid);
		return 1;
	}

	if (dialogid == DIALOG_KP_GLOBEDIT)
	{
		if (!response) return form_kP_editdialog(playerid);
		if (!IsNumeric(inputtext) || isnull(inputtext) || strlen(inputtext) > 10) return form_kP_globedit(playerid);

		new index = strval(inputtext);

		if (index < 1) return form_kP_globedit(playerid), SendClientMessage(playerid, RED, "Skaièius negali bûti maþesnis nei 1");

		switch (kP_kE_kategorija[playerid])
		{
			case 0:
			{
				switch (kP_kaEditina[playerid])
				{
					case 0: kPP_cocaine = index;
					case 1: kPP_weed = index;
					case 2..6: kPP_guns[kP_kaEditina[playerid]-2] = index; 
				}
				form_kP_editdialog(playerid);
			}

			case 1:
			{
				if (!kP_kaEditina[playerid])
				{
					if (DyleriaiNark < index) return form_kP_globedit(playerid), SendClientMessage(playerid, RED, "Mafija tiek kokaino neturi");

					DyleriaiNark -= index;
					kP_cocaine += index;
					SendClientMessage(playerid, GREEN, "Sëkmingai papildei kokainu");
				}
				else
				{
					if (DyleriaiZole < index) return form_kP_globedit(playerid), SendClientMessage(playerid, RED, "Mafija tiek þoles neturi");

					DyleriaiZole -= index;
					kP_weed += index;
					SendClientMessage(playerid, GREEN, "Sëkmingai papildei þole");
				}

				form_kP_editdialog(playerid);
			}

			case 2:
			{
				if (!kP_kaEditina[playerid])
				{
					if (kP_cocaine < index) return form_kP_globedit(playerid), SendClientMessage(playerid, RED, "Tiek kokaino ten nëra");

					DyleriaiNark += index;
					kP_cocaine -= index;
					SendClientMessage(playerid, GREEN, "Sëkmingai atsiemei kokainà");

				}
				else
				{
					if (kP_weed < index) return form_kP_globedit(playerid), SendClientMessage(playerid, RED, "Tiek þolës ten nëra");

					DyleriaiZole += index;
					kP_weed -= index;
					SendClientMessage(playerid, GREEN, "Sëkmingai atsiemei þolæ");
				}
				form_kP_editdialog(playerid);
			}

			/*case 3:
			{
				if (!isEnoughGuns(index)) return form_kP_globedit(playerid), SendClientMessage(playerid, RED, "Tiek paketø nepasiimsi");

				DyleriaiGun += index;

				kP_guns[0] -= 10*index;
				kP_guns[1] -= 100*index;
				kP_guns[2] -= 500*index;
				kP_guns[3] -= 100*index;
				kP_guns[4] -= 500*index;
				SendClientMessage(playerid, GREEN, "Atsiemei paketus");
				form_kP_editdialog(playerid);
			}

			case 4:
			{
				if (DyleriaiGun < index) return form_kP_globedit(playerid), SendClientMessage(playerid, RED, "Tiek paketø neturit");

				DyleriaiGun -= index;

				kP_guns[0] += 10*index;
				kP_guns[1] += 100*index;
				kP_guns[2] += 500*index;
				kP_guns[3] += 100*index;
				kP_guns[4] += 500*index;
				SendClientMessage(playerid, GREEN, "Papildei ginklus");
				form_kP_editdialog(playerid);
			}*/
		}

		return 1;
	}

	if (dialogid == DIALOG_KP_SHOP)
	{
		if (!response) return 1;
		if (listitem == 1) return form_kP_shop(playerid);

		if (!listitem) kP_kaEditina[playerid] = 7;
		else kP_kaEditina[playerid] = listitem-2;
		form_kP_shop_(playerid);
	}

	if (dialogid == DIALOG_KP_SHOP_)
	{
		if (!response) return form_kP_shop(playerid);

		if (!IsNumeric(inputtext) || isnull(inputtext) || strlen(inputtext) > 10) return form_kP_shop_(playerid);

		new index = strval(inputtext);

		if (index < 1) return form_kP_shop_(playerid), SendClientMessage(playerid, RED, "Skaièius negali bûti maþesnis nei 1");

		switch (kP_kaEditina[playerid])
		{
			case 0:
			{
				if (kP_cocaine < index) return form_kP_shop_(playerid), SendClientMessage(playerid, RED, "Tiek nëra");
				if (GetPlayerMoneyA(playerid) < index*kPP_cocaine) return form_kP_shop_(playerid), SendClientMessage(playerid, RED, "Neturi tiek pinigø");
				zInfo[playerid][kokainas] += index;
				GivePlayerMoneyA(playerid, -index*kPP_cocaine);
				kP_cocaine -= index;
				Pelnas[7] += index*kPP_cocaine;

				SendClientMessage(playerid, GREEN, "Sëkmingai nusipirkote kokaino");
			}
			case 1:
			{
				if (kP_weed < index) return form_kP_shop_(playerid), SendClientMessage(playerid, RED, "Tiek nëra");
				if (GetPlayerMoneyA(playerid) < index*kPP_weed) return form_kP_shop_(playerid), SendClientMessage(playerid, RED, "Neturi tiek pinigø");
				zInfo[playerid][zole] += index;
				GivePlayerMoneyA(playerid, -index*kPP_weed);
				kP_weed -= index;
				Pelnas[7] += index*kPP_weed;

				SendClientMessage(playerid, GREEN, "Sëkmingai nusipirkote þolës");
			}
			case 7:
			{
				if (playerGang[playerid] == INVALID_GANG_ID)
					return 1;

				if (GetPlayerMoneyA(playerid) < index*2000) return form_kP_shop_(playerid), SendClientMessage(playerid, RED, "Neturi tiek pinigø");
				if (strcmp(gangDB[playerGang[playerid]][gLeaderName], GetPlayerNameEx(playerid)) != 0) return form_kP_shop_(playerid), SendClientMessage(playerid, RED, "Jûs ne gaujos vadas");
				kiekBombu[playerid] += index;
				GivePlayerMoneyA(playerid, -index*2000);

				SendClientMessage(playerid, GREEN, "Sëkmingai nusipirkote bombà(ø)");
			}
			default:
			{
				new ix = kP_kaEditina[playerid]-2;
				if (kP_guns[ix] < index) return form_kP_shop_(playerid), SendClientMessage(playerid, RED, "Tiek nëra");
				if (GetPlayerMoneyA(playerid) < index*kPP_guns[ix]) return form_kP_shop_(playerid), SendClientMessage(playerid, RED, "Neturi tiek pinigø");
				GivePlayerMoneyA(playerid, -index*kPP_guns[ix]);
				kP_guns[ix] -= index;
				Pelnas[7] += index*kPP_guns[ix];

				switch (ix)
				{
					case 0: GivePlayerWeaponsEx(playerid, 5, index);
					case 1: GivePlayerWeaponsEx(playerid, 34, index);
					case 2: GivePlayerWeaponsEx(playerid, 22, index);
					case 3: GivePlayerWeaponsEx(playerid, 25, index);
					case 4: GivePlayerWeaponsEx(playerid, 30, index);
				}
				SendClientMessage(playerid, GREEN, "Sëkmingai nusipirkote ginklø");
			}
		}
	}

	return 1;
}


getKPrekName(prekesid)
{
	new prekName[20];

	switch (prekesid)
	{
		case 0: prekName = "kokaino";
		case 1: prekName = "þolës";
		case 2: prekName = "Baseball Bat";
		case 3: prekName = "Sniper Rifle";
		case 4: prekName = "9mm";
		case 5: prekName = "Shotgun";
		case 6: prekName = "AK-47";
	}

	return prekName;
}

get_kP_price(prekesid)
{
	switch (prekesid)
	{
		case 0: return kPP_cocaine;
		case 1: return kPP_weed;
		case 2..6: return kPP_guns[prekesid-2]; 
	}
	return 1;
}

get_kP_count(prekesid)
{
	switch (prekesid)
	{
		case 0: return kP_cocaine;
		case 1: return kP_weed;
		case 2..6: return kP_guns[prekesid-2]; 
	}
	return 1;
}



/*isEnoughGuns (hmuch)
{
	if (kP_guns[0] >= 10*hmuch && kP_guns[1] >= 100*hmuch && kP_guns[2] >= 500*hmuch && kP_guns[3] >= 100*hmuch && kP_guns[4] >= 500*hmuch) return 1;
	return 0;
}*/

getEnoughPackCount()
{
	new gpp[5], kiek;
	gpp[0] = kP_guns[0];
	gpp[1] = kP_guns[1];
	gpp[2] = kP_guns[2];
	gpp[3] = kP_guns[3];
	gpp[4] = kP_guns[4];

	while (gpp[0] >= 10 && gpp[1] >= 100 && gpp[2] >= 500 && gpp[3] >= 100 && gpp[4] >= 500)
	{
		kiek ++;
		gpp[0] -= 10;
		gpp[1] -= 100;
		gpp[2] -= 500;
		gpp[3] -= 100;
		gpp[4] -= 500;
	}

	return kiek;
}

new kp_pup;

save_kpard ()
{
	new zx[400];
	format (zx, sizeof zx, "UPDATE karteliopard SET \
	cocaine = '%d', cocainePrice = '%d', weed = '%d', weedPrice = '%d', \
	gun1 = '%d', gunPrice1 = '%d', gun2 = '%d', gunPrice2 = '%d', \
	gun3 = '%d', gunPrice3 = '%d', gun4 = '%d', gunPrice4 = '%d', \
	gun5 = '%d', gunPrice5 = '%d'",
	kP_cocaine, kPP_cocaine, kP_weed, kPP_weed, kP_guns[0], kPP_guns[0],
	kP_guns[1], kPP_guns[1], kP_guns[2], kPP_guns[2], kP_guns[3], kPP_guns[3],
	kP_guns[4], kPP_guns[4]);
	mysql_query (zx);

	return 1;
}

load_kpart ()
{
	//kp_pup = CreateDynamicPickup(1274, 2, -134.4986,2641.2847,63.9589);

	new zx[100];
	format (zx, sizeof zx, "SELECT * FROM karteliopard");
	mysql_query (zx);
	mysql_store_result ();
	mysql_retrieve_row ();

	new 
		temp[10];

	mysql_fetch_field_row(temp, "cocaine"); kP_cocaine = strval(temp); 
	mysql_fetch_field_row(temp, "cocainePrice"); kPP_cocaine = strval(temp); 
	mysql_fetch_field_row(temp, "weed"); kP_weed = strval(temp);
	mysql_fetch_field_row(temp, "weedPrice"); kPP_weed = strval(temp);
	mysql_fetch_field_row(temp, "gun1"); kP_guns[0] = strval(temp);
	mysql_fetch_field_row(temp, "gunPrice1"); kPP_guns[0] = strval(temp);
	mysql_fetch_field_row(temp, "gun2"); kP_guns[1] = strval(temp);
	mysql_fetch_field_row(temp, "gunPrice2"); kPP_guns[1] = strval(temp);
	mysql_fetch_field_row(temp, "gun3"); kP_guns[2] = strval(temp);
	mysql_fetch_field_row(temp, "gunPrice3"); kPP_guns[2] = strval(temp);
	mysql_fetch_field_row(temp, "gun4"); kP_guns[3] = strval(temp);
	mysql_fetch_field_row(temp, "gunPrice4"); kPP_guns[3] = strval(temp);
	mysql_fetch_field_row(temp, "gun5"); kP_guns[4] = strval(temp);
	mysql_fetch_field_row(temp, "gunPrice5"); kPP_guns[4] = strval(temp);

	mysql_free_result ();

	return 1;
}

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{
	if (kp_pup == pickupid) form_kP_shop(playerid);
	return 1;
}

hook OnPlayerConnect(playerid)
{
	new zx[100];
	format (zx, sizeof zx, "SELECT bombos FROM zaidejai WHERE vardas = '%s'", GetPlayerNameEx(playerid));
	mysql_query (zx);
	mysql_store_result ();

	if (mysql_num_rows() != 0) kiekBombu[playerid] = mysql_fetch_int();
	else kiekBombu[playerid] = 0;

	mysql_free_result ();

	return 1;
}

savePlayerBombos(playerid)
{
	new zx[100];
	format (zx, sizeof zx, "UPDATE zaidejai SET bombos = '%d' WHERE vardas = '%s'", kiekBombu[playerid], GetPlayerNameEx(playerid));
	mysql_query (zx);
}
