// gz +2
// burg +2


#define MAX_GANGS 				20
#define MAX_GANG_NAME 			32
#define INVALID_GANG_ID 		-1
#define MAX_GANG_MEMBERS		20
#define CHANGE_GANG_NAME_PRICE	50

#define REQ_XP_TO_CGANG			3000
#define REQ_EUR_TO_CGANG		10000

#define DIALOG_GANG_LEADER_MENU 816
#define DIALOG_GANG_INFO		817
#define DIALOG_GANG_MEMBERS		818
#define DIALOG_GANG_CONTROLMEM	819
#define DIALOG_GANG_CLOSE		820
#define DIALOG_GANG_CHANGENAME	821
#define DIALOG_GANG_INVITE		822
#define DIALOG_GANG_GANGMONEY	823
#define DIALOG_GANG_CO_MENU		824
#define DIALOG_GANG_ZONES		825

#define DIALOG_GANG_BASE_CON	827
#define DIALOG_GANG_BASE_CON_TR	828
#define DIALOG_BUY_GBASE		829

#define DIALOG_START_BURGLARY   830

#define DIALOG_GANG_AMM			831
#define DIALOG_GANG_AMM_INFO	832
#define DIALOG_GANG_AMM_ADD		833
#define DIALOG_GANG_AMM_TAKE	834
#define DIALOG_GANG_AMM_SHARE	835

#define GSKELB_REPS_REQ			100
#define GZ_REPS_REQ				30
#define GRACIJA_REPS_REQ 150

// is gauju zonu
#define GZ_PAYOUT	10				// kiek per valanda 1 zona uzdirbs eur

#include YSI\y_hooks

enum e_Gangs
{
	gID,
	gLeaderName[MAX_PLAYER_NAME],
	gName[MAX_GANG_NAME+1],
	gMoney,
	gReps,
	gSkin
}

new 
	gangDB[MAX_GANGS][e_Gangs],
	playerGang[MAX_PLAYERS] = {INVALID_GANG_ID, ...},
	bool: playerGangClothes[MAX_PLAYERS],
	bool: playerGangCo[MAX_PLAYERS],
	gang_editMember[MAX_PLAYERS][MAX_PLAYER_NAME],
	
	ganginv_gangID[MAX_PLAYERS] = {INVALID_GANG_ID, ...},
	ganginv_time[MAX_PLAYERS];


#define showdialog_gangleader(%0)\
	ShowPlayerDialog(%0, DIALOG_GANG_LEADER_MENU, DIALOG_STYLE_LIST, "Gaujos valdymas", "Gaujos informacija\nGaujos nariai\nKontroliuojamos zonos\nBazë\nGaujos pinigø fondas\nAmunicija\nPakviesti á gaujà\
	\n \nKeisti pavadinimà\nAprangos\nUþdaryti gaujà", "Pasirinkti", "Iðeiti")
#define showdialog_gangclose(%0)\
	ShowPlayerDialog(%0, DIALOG_GANG_CLOSE, DIALOG_STYLE_INPUT, "Gaujos uþdarymas", "Ar tikrai nori uþdaryti gaujà? Visas gaujos progresas bus prarastas.\n\
	Jeigu esi pilnai apsisprendæs áraðyk á langelá 'PATVIRTINU'", "Iðtrinti", "Atgal")
#define showdialog_gangchangename(%0)\
	ShowPlayerDialog(%0, DIALOG_GANG_CHANGENAME, DIALOG_STYLE_INPUT, "Gaujos pavadinimo keitimis", "Gaujos pavadinimo pakeitimui reikës 50 kreditø\n\
	Áraðykite naujà gaujos pavadinimà.", "Keisti", "Atgal")
#define showdialog_ganginvite(%0)\
	ShowPlayerDialog(%0, DIALOG_GANG_INVITE, DIALOG_STYLE_INPUT, "Þaidëjo pakvietimas", "Áraðykite þaidëjo vardà arba ID norëdami pasiûlyti jam prisijungti prie gaujos.\n ",\
	"Pakviesti", "Atgal")
#define showdialog_gangco(%0)\
	ShowPlayerDialog(%0, DIALOG_GANG_CO_MENU, DIALOG_STYLE_LIST, "Gaujos valdymas",\
	"Gaujos informacija\nGaujos nariai\nGaujos statistika\nKontroliuojamos zonos", "Pasirinkti", "Iðeiti")
#define showdialog_gangbase(%0)\
	ShowPlayerDialog(%0, DIALOG_GANG_BASE_CON, DIALOG_STYLE_LIST, "Bazës valdymas", "Transporto valdymas",\
	"Pasirinkti", "Atgal")
#define showdialog_ammunition(%0) \
	ShowPlayerDialog(%0, DIALOG_GANG_AMM, DIALOG_STYLE_LIST, "Amunicija", "Amunicija\nÁneðti ginklø\nPaimti ginklø\nPadalinti ginklø",\
	"Pasirinkti", "Atgal")
#define showdialog_amm_add(%0) \
	ShowPlayerDialog(%0, DIALOG_GANG_AMM_ADD, DIALOG_STYLE_INPUT, "Amunicija", "Kiek kulkø norëtum áneðti?",\
	 "Áneðti", "Atgal")
#define showdialog_amm_take(%0) \
	ShowPlayerDialog(%0, DIALOG_GANG_AMM_TAKE, DIALOG_STYLE_INPUT, "Amunicija", "Kiek kokio ginklo kulkø norëtum paimti?\n[ginklo id] [kulkø kiekis]",\
	 "Paimti", "Atgal")
#define showdialog_amm_share(%0) \
	ShowPlayerDialog(%0, DIALOG_GANG_AMM_SHARE, DIALOG_STYLE_INPUT, "Amunicija", "Kiek kokio ginklo kulkø norëtum padalinti prisijungusiems gaujos nariams?\n[ginklo id] [kulkø kiekis/gaujos nará]",\
	 "Padalinti", "Atgal")


showdialog_ganginfo(const playerid, gangid, bool: response = true)
{
	new 
		str[200];

	if (gangid == INVALID_GANG_ID) return 1;

	format(str, sizeof str,
		"Gaujos %s informacija\n \n\
		Vadas %s\n\
		Reputacija %d taðkø\n\
		Fonde %d eur",
	gangDB[gangid][gName], gangDB[gangid][gLeaderName], gangDB[gangid][gReps], gangDB[gangid][gMoney]);

	ShowPlayerDialog(playerid, response ? DIALOG_GANG_INFO : DIALOG_NONE, DIALOG_STYLE_MSGBOX, gangDB[gangid][gName], str, response ? ("Atgal") : ("Iðeiti"), "");
	return 1;
}

showdialog_gangnariai(playerid, gangid, bool: response = true)
{
	new
		str[150], str2[2], mainstr[MAX_GANG_MEMBERS*60+1], linestr[60];

	if (gangid == INVALID_GANG_ID) return 1;

	format(str, sizeof str, "SELECT vardas, gangCo FROM zaidejai WHERE gaujosID = '%d' AND vardas != '%s' AND vardas != '%s'", gangid, GetPlayerNameEx(playerid), gangDB[gangid][gLeaderName]);
	mysql_query(str);
	mysql_store_result();

	new i, j = mysql_num_rows();
	if (j == 0)
	{
		ErrorMsg(playerid, "Gaujoje nëra nariø!");
		showdialog_gangleader(playerid);
		mysql_free_result();
		return 1;
	}

	for (i = 0; i < j; i++)
	{
		mysql_retrieve_row();
		mysql_fetch_field_row(str, "vardas");
		mysql_fetch_field_row(str2, "gangCo");

		format(linestr, sizeof linestr, "%s {%s}•••\t{ffffff}%s\n", str, GetPlayeridMid(str) == INVALID_PLAYER_ID ? ("ce2525") : ("4fb783"), !!strval(str2) ? ("Pavaduotojas") : ("Narys"));
		strcat(mainstr, linestr);
	}

	mysql_free_result();

	ShowPlayerDialog(playerid, response ? DIALOG_GANG_MEMBERS : DIALOG_NONE, DIALOG_STYLE_LIST, gangDB[gangid][gName], mainstr, response ? ("Pasirinkti") : ("Iðeiti"), response ? ("Atgal") : (""));
	return 1;
}

showdialog_membercontrol(playerid, membername[MAX_PLAYER_NAME])
{
	new
		str[150], str2[2], gangid = playerGang[playerid];

	if (gangid == INVALID_GANG_ID) return 1;

	format(str, sizeof str, "SELECT gangCo FROM zaidejai WHERE vardas = '%s'", membername);
	mysql_query(str);
	mysql_store_result();
	mysql_retrieve_row();
	mysql_fetch_field_row(str2, "gangCo");
	mysql_free_result();

	if (!playerGangCo[playerid]) format(str, sizeof str, "%s \n \n%s\nIðmesti", membername, strval(str2) ? ("Paþeminti iki nario") : ("Paaukðtinti á pavaduotojus"));
	else format(str, sizeof str, "%s \n \nIðmesti", membername);

	ShowPlayerDialog(playerid, DIALOG_GANG_CONTROLMEM, DIALOG_STYLE_LIST, gangDB[gangid][gName], str, "Pasirinkti", "Atgal");
	return 1;
}

showdialog_gangmoney(playerid)
{
	new 
		str[200], gangid = playerGang[playerid];

	if (gangid == INVALID_GANG_ID) return 1;

	format(str, sizeof str,
		"Gaujos fonde yra %d eur. Norëdami paimti pinigø raðykite PAIMTI [pinigø skaièius].\n\
		Norëdami áneðti pinigø raðykite INESTI [pinigø skaièius].\n \n[Pavyzdys] PAIMTI 2000", gangDB[gangid][gMoney]);

	ShowPlayerDialog(playerid, DIALOG_GANG_GANGMONEY, DIALOG_STYLE_INPUT, "Gaujos pinigø fondas", str, "Atlikti", "Atgal");

	return 1;
}

showdialog_gangzones(playerid)
{
	if (playerGang[playerid] == INVALID_GANG_ID)
		return 1;

	new 
		str[200], gzcount = countGZOwnerByGang(playerGang[playerid]);

	if (gzcount == 0)
		return playerGangCo[playerid] ? showdialog_gangco(playerid) : showdialog_gangleader(playerid), ErrorMsg(playerid, "Tavo gauja nekontroliuoja zonø");

	format(str, sizeof str, 
		" \nGauja kontroliuoja zonø : %d\nIð viso uþdirbama ið zonø (per val.) : %d", gzcount, gzcount*GZ_PAYOUT );
	ShowPlayerDialog(playerid, DIALOG_GANG_ZONES, DIALOG_STYLE_MSGBOX, "Gaujos zonos", str, "Atgal", "");

	return 1;
}

CMD:gauja(playerid, params[])
{
	new gang_id = playerGang[playerid];
	if (gang_id == INVALID_GANG_ID) return ErrorMsg(playerid, "Tu neesi gaujoje");

	if (!strcmp(gangDB[gang_id][gLeaderName], GetPlayerNameEx(playerid)) && !isnull(gangDB[gang_id][gLeaderName]))
	{
		showdialog_gangleader(playerid);
	}
	else if (playerGangCo[playerid])
	{
		showdialog_gangco(playerid);
	}
	else 
		showdialog_ganginfo(playerid, playerGang[playerid], false);

	return 1;
}

CMD:g(playerid, params[])
{
	if(zInfo[playerid][mutelaikas]>0) return SendClientMessage(playerid, RED, "{EB3232}« Jûs esate uþtildytas!");
	new tekstas[256];
	new gang_id = playerGang[playerid];
	if(gang_id == INVALID_GANG_ID) return ErrorMsg(playerid, "Tu neesi gaujoje");
	if (gangDB[gang_id][gReps] < GRACIJA_REPS_REQ)
		return ErrorMsg(playerid, "Tavo gaujà neturi ðios galimybës, nes neturi reikiamo kiekio rep taðkø ("#GRACIJA_REPS_REQ").");
	if(sscanf(params, "s[256]", tekstas)) return InfoMSG(playerid, "Racijos naudojimas: /g [tekstas]"); 
	new string[500];
	for(new i; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i) && playerGang[playerid] == playerGang[i])
		{
			format(string, sizeof(string), "[ „ %s “ GAUJA ] %s(%i): %s", gangDB[gang_id][gName], GetPlayerNameEx(playerid), playerid, tekstas);
			SendClientMessage(i, GREEN, string);
   		}	
	}	
	return 1;
}

CMD:gikurti(playerid, params[])
{
	if (zInfo[playerid][gBlist]) return ErrorMsg(playerid, "Negali ákurti gaujos ,nes esi b-liste.");
	if (playerGang[playerid] != INVALID_GANG_ID) return ErrorMsg(playerid, "Tu jau esi gaujoje!");
	if (isnull(params) || strlen(params) < 3) return ErrorMsg(playerid, "/gikurti [gaujos pavadinimas]");

	if (GetPlayerScore(playerid) < REQ_XP_TO_CGANG) return ErrorMsg(playerid, "Neesi pakankamai patyræs, turi turëti bent "#REQ_XP_TO_CGANG" XP taðkø.");
	if (GetPlayerMoneyA(playerid) < REQ_EUR_TO_CGANG) return ErrorMsg(playerid, "Neturi pakankamai pinigø kiðenëje, turi turëti bent "#REQ_EUR_TO_CGANG" eurø.");

	if(zInfo[playerid][specialybe] == 1 && zInfo[playerid][specialybe] == 5 && zInfo[playerid][specialybe] == 15 && zInfo[playerid][specialybe] == 13) return ErrorMsg(playerid, "Negalite kurtis gaujos nes dirbate!");

	if (countGangs() == MAX_GANGS || gang_GetFreeID() == INVALID_GANG_ID) return ErrorMsg(playerid, "Pasiektas gaujø limitas, susisiekite su administracija.");
	if (strlen(params) > MAX_GANG_NAME) return ErrorMsg(playerid, "Gaujos pavadinimas negali bûti ilgesnis nei "#MAX_GANG_NAME" simboliai.");
	if (strfind(params, "%") != -1) return ErrorMsg(playerid, "Pavadinime negali bûti %% simbolio.");
	if (gang_exists(params)) return ErrorMsg(playerid, "Gauja su tokiu pavadinimu jau egzistuoja!");

	new 
		query[150],
		index = gang_GetFreeID();

	mysql_real_escape_string(params, params);

	format(query, sizeof query, "INSERT INTO gangs2 (gID, gLeaderName, gName) VALUES ('%d', '%s', '%s')", index, GetPlayerNameEx(playerid), params);
	mysql_query(query);

	format(gangDB[index][gLeaderName], MAX_PLAYER_NAME, "%s", GetPlayerNameEx(playerid));
	format(gangDB[index][gName], MAX_GANG_NAME, "%s", params);
	gangDB[index][gMoney] = 0;
	gangDB[index][gReps] = 0;
	gangDB[index][gSkin] = 0;
	gangDB[index][gID] = index;

	format(query, sizeof query, "UPDATE zaidejai SET gaujosID = '%d' WHERE vardas = '%s'", index, GetPlayerNameEx(playerid));
	mysql_query(query);

	GivePlayerMoneyA(playerid, -REQ_EUR_TO_CGANG);

	playerGang[playerid] = index;

	format(query, sizeof query, "Gauja pavadinimu \"%s\" sëkmingai sukurta. Gaujos valdymas /gauja", params);
	SendClientMessage(playerid, GREEN, query);

	syncGZToPlayer(playerid);

	if(!zInfo[playerid][Pasiekimas3])
    {
		zInfo[playerid][Pasiekimas3] = true;
		zInfo[playerid][paskutpas] = 8;
        format(query, sizeof(query), "UPDATE zaidejai SET Pasiekimas3 = '1' WHERE vardas = '%s'",GetPlayerNameEx(playerid));
        mysql_query(query);
		SendClientMessage(playerid, -1, "{ff9966}• P • {FFFFFF}Ivygdei gaujos pasiekima, gavai {ff9966}5 {FFFFFF}kreditø, {ff9966}100XP {FFFFFF}ir {ff9966}2500€!");
        zInfo[playerid][kreditai]+=5;
        SetPlayerScore(playerid, GetPlayerScore(playerid) + 100);
        GivePlayerMoneyA(playerid,2500);
    }
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_GANG_LEADER_MENU)
	{
		if (!response) 
			return 1;

		if (playerGang[playerid] == INVALID_GANG_ID) return 1;

		switch (listitem)
		{
			case 0: showdialog_ganginfo(playerid, playerGang[playerid]);
			case 1: showdialog_gangnariai(playerid, playerGang[playerid]);
			//case 2: // statistika
			case 2: showdialog_gangzones(playerid);
			case 3: 
			{
				if(GetBaseIDOfGang(playerGang[playerid]) != INVALID_GANG_ID) 
					showdialog_gangbase(playerid);
				else 
					ErrorMsg(playerid, "Tavo gauja nevaldo bazës"), showdialog_ganginfo(playerid, playerGang[playerid]);
			}
			case 4: showdialog_gangmoney(playerid);
			case 5: showdialog_ammunition(playerid);
			case 6: showdialog_ganginvite(playerid);
			case 8: showdialog_gangchangename(playerid);
			case 9: showtd_gangskin(playerid, true);
			case 10: showdialog_gangclose(playerid);
			default: showdialog_gangleader(playerid);
		}

		return 1;
	}

	if (dialogid == DIALOG_GANG_INFO && playerGang[playerid] != INVALID_GANG_ID)
		return playerGangCo[playerid] ? showdialog_gangco(playerid) : showdialog_gangleader(playerid);
	if (dialogid == DIALOG_GANG_ZONES)
		return playerGangCo[playerid] ? showdialog_gangco(playerid) : showdialog_gangleader(playerid);

	if (dialogid == DIALOG_GANG_MEMBERS)
	{
		if (playerGang[playerid] == INVALID_GANG_ID) return 1;
		if (!response) 
			return playerGangCo[playerid] ? showdialog_gangco(playerid) : showdialog_gangleader(playerid);

		new
			memberName[MAX_PLAYER_NAME];

		sscanf(inputtext, "s["#MAX_PLAYER_NAME"] ", memberName);
		format(gang_editMember[playerid], MAX_PLAYER_NAME, "%s", memberName);
		showdialog_membercontrol(playerid, memberName);
	}

	if (dialogid == DIALOG_GANG_CONTROLMEM)
	{
		if (playerGang[playerid] == INVALID_GANG_ID) return 1;
		if (!response) 
			return showdialog_gangnariai(playerid, playerGang[playerid]);
		new 
			memberid = GetPlayeridMid(gang_editMember[playerid]),
			str[120];

		if (listitem == 2 && playerGangCo[playerid]) listitem = 3;

		switch (listitem)
		{
			case 2:
			{
				if (memberid != INVALID_PLAYER_ID)
				{
					playerGangCo[memberid] = !playerGangCo[memberid];

					if (playerGangCo[memberid]) SendClientMessage(playerid, GREEN, "Gaujos vadas paskyrë tave gaujos pavaduotoju.");
					else SendClientMessage(playerid, RED, "Gaujos vadas nuðalino tave nuo gaujos pavaduotojo pareigø");
				}
				
				format(str, sizeof str,
					"UPDATE zaidejai SET gangCo = IF(gangCo = 1, '0', '1') WHERE vardas = '%s'", gang_editMember[playerid]);
				mysql_query(str);
				showdialog_membercontrol(playerid, gang_editMember[playerid]);
			}
			case 3:
			{
				if (memberid != INVALID_PLAYER_ID)
				{
					playerGang[memberid] = INVALID_GANG_ID;
					playerGangCo[memberid] = false;
					SendClientMessage(memberid, RED, "Gaujos vadas tave iðmetë ið gaujos");
					zInfo[playerid][NoGunsGang] = 0;

					if (playerGangClothes[memberid])
					{
						SetPlayerSkin(memberid,zInfo[memberid][drabuziai]);
					    zInfo[memberid][skinStatus] = SKINSTATUS_NORMAL;
					}	
				}

				format(str, sizeof str, "UPDATE zaidejai SET gaujosID = '-1', gangClothes = '0', gangCo = '0', nogunsgang = '0' WHERE vardas = '%s'", gang_editMember[playerid]);
				mysql_query(str);
				showdialog_gangnariai(playerid, playerGang[playerid]);
			}
			default: showdialog_membercontrol(playerid, gang_editMember[playerid]);
		}
	}

	if (dialogid == DIALOG_GANG_CLOSE)
	{
		if (playerGang[playerid] == INVALID_GANG_ID) 
			return 1;
		if (!response)
			return showdialog_gangleader(playerid);
		if (!strcmp(inputtext, "PATVIRTINU") && !isnull(inputtext))
		{
			destroyGang(playerGang[playerid]);
			syncGZToPlayer(playerid);
		}
		else showdialog_gangclose(playerid), ErrorMsg(playerid, "Neáraðiai 'PATVIRTINU'.");
	}

	if (dialogid == DIALOG_GANG_CHANGENAME)
	{
		if (playerGang[playerid] == INVALID_GANG_ID) 
			return 1;
		if (!response)
			return showdialog_gangleader(playerid);

		if (zInfo[playerid][kreditai] < CHANGE_GANG_NAME_PRICE) return ErrorMsg(playerid, "Neturi reikiamo kreditø skaièiaus! Reikalinga bent jau 50 kreditø."), showdialog_gangleader(playerid);

		if (strlen(inputtext) > MAX_GANG_NAME || strlen(inputtext) < 3 || isnull(inputtext)) return ErrorMsg(playerid, "Gaujos pavadinimas negali bûti ilgesnis nei "#MAX_GANG_NAME" simboliai."), showdialog_gangchangename(playerid);
		if (strfind(inputtext, "%") != -1) return ErrorMsg(playerid, "Pavadinime negali bûti %% simbolio."), showdialog_gangchangename(playerid);

		new 
			gangid = playerGang[playerid], str[100];

		if (gang_exists(inputtext) && strcmp(gangDB[gangid][gName], inputtext) != 0) return ErrorMsg(playerid, "Gauja su tokiu pavadinimu jau egzistuoja!"), showdialog_gangchangename(playerid);

		format(gangDB[gangid][gName], MAX_GANG_NAME, "%s", inputtext);

		zInfo[playerid][kreditai] -= CHANGE_GANG_NAME_PRICE;

		format(str, sizeof str,
			"UPDATE gangs2 SET gName = '%s' WHERE gID = '%d'", inputtext, playerGang[playerid]);
		mysql_query(str);

		showdialog_gangleader(playerid);
	}

	if (dialogid == DIALOG_GANG_INVITE)
	{
		if (playerGang[playerid] == INVALID_GANG_ID) 
			return 1;
		if (!response)
			return showdialog_gangleader(playerid);

		new 
			ply, str[300];

		if (isnull(inputtext)) return showdialog_ganginvite(playerid);
		if (sscanf(inputtext, "u", ply)) return showdialog_ganginvite(playerid), ErrorMsg(playerid, "Áraðykite þaidëjo vardà");
		if (ply == INVALID_PLAYER_ID) return showdialog_ganginvite(playerid), ErrorMsg(playerid, "Toks þaidëjas neegzistuoja");

		if (playerGang[ply] != INVALID_GANG_ID) return showdialog_ganginvite(playerid), ErrorMsg(playerid, "Ðis þaidëjas jau turi gaujà");
		if (GetPlayerScore(ply) < 1000) return showdialog_ganginvite(playerid), ErrorMsg(playerid, "Ðis þaidëjas nëra pakankamai patyræs, jis turi turëti bent jau 1,000XP");
		
		if (ganginv_time[ply] > gettime()) return showdialog_ganginvite(playerid), ErrorMsg(playerid, "Ðis þaidëjas nesenai buvo pakviestas kitos gaujos, palaukite");

		ganginv_gangID[ply] = playerGang[playerid];
		ganginv_time[ply] = gettime()+30;

		format(str, sizeof str,
			"%s tave kvieèia á \"%s\" gaujà. Pasiûlymas galios tik 30 sek., norëdamas sutikti raðyk /istotig",
			GetPlayerNameEx(playerid), gangDB[playerGang[playerid]]);
		SendClientMessage(ply, GREEN, str);

		showdialog_gangleader(playerid);
	}

	if (dialogid == DIALOG_GANG_GANGMONEY)
	{
		if (!response) 
			return showdialog_gangleader(playerid);

		new
			veiksm[10], amount, str[150], gangid = playerGang[playerid];

		if (gangid == INVALID_GANG_ID) return 1;


		if(sscanf(inputtext, "s[10]i", veiksm, amount))
			return showdialog_gangmoney(playerid);

		if (amount < 1 || isnull(veiksm)) 
			return showdialog_gangmoney(playerid);

		if (!strcmp(veiksm, "PAIMTI"))
		{
			if (gangDB[gangid][gMoney] < amount) 
				return showdialog_gangmoney(playerid), ErrorMsg(playerid, "Tiek pinigø fonde nëra");

			gangDB[gangid][gMoney] -= amount;
			GivePlayerMoneyA(playerid, amount);

			format(str, sizeof str,
				"Sëkmingai paëmei %d eur ið gaujos fondo.", amount);
			SendClientMessage(playerid, GREEN, str);
			showdialog_gangleader(playerid);
		}
		else if (!strcmp(veiksm, "INESTI"))
		{
			if (GetPlayerMoneyA(playerid) < amount) 
				return showdialog_gangmoney(playerid), ErrorMsg(playerid, "Tiek pinigø tu neturi");

			gangDB[gangid][gMoney] += amount;
			GivePlayerMoneyA(playerid, -amount);

			format(str, sizeof str,
				"Sëkmingai áneðei %d eur á gaujos fondà.", amount);
			SendClientMessage(playerid, GREEN, str);
			showdialog_gangleader(playerid);
		}
		else showdialog_gangmoney(playerid), ErrorMsg(playerid, "[PAIMTI/INESTI] [pinigø skaièius]");
	}

	if (dialogid == DIALOG_GANG_CO_MENU)
	{
		if (!response)
			return 1;
		if (playerGang[playerid] == INVALID_GANG_ID) return 1;

		switch(listitem)
		{
			case 0: showdialog_ganginfo(playerid, playerGang[playerid]);
			case 1: showdialog_gangnariai(playerid, playerGang[playerid]);
			//case 2:
			case 3: showdialog_gangzones(playerid);
		}
	}

	if (dialogid == DIALOG_GANG_BASE_CON)
	{
		if (playerGang[playerid] == INVALID_GANG_ID) 
			return 1;
		if (!response)
			return showdialog_gangleader(playerid);

		switch (listitem)
		{
			case 0: showdialog_contransport(playerid);
		}
	}

	return 1;
}

hook OnGameModeInit() 
{
	for (new i; i < MAX_GANGS; i++) gangDB[i][gID] = INVALID_GANG_ID;
	return 1;
}

gang_resetVars(gang_id)
{
	gangDB[gang_id][gLeaderName][0] = EOS;
	gangDB[gang_id][gName][0] = EOS;
	gangDB[gang_id][gMoney] = 0;
	gangDB[gang_id][gReps] = 0;
	gangDB[gang_id][gSkin] = 0;
}

loadGangs()
{
	mysql_query("SELECT * FROM gangs2");
	mysql_store_result();

	new 
		str[12], g;

	for(new i, j = mysql_num_rows(); i < j; i++)
	{
		mysql_retrieve_row();

		mysql_fetch_field_row(str, "gID"); 
		g = strval(str);
		gangDB[g][gID] = g;
		mysql_fetch_field_row(gangDB[g][gLeaderName], "gLeaderName");
		mysql_fetch_field_row(gangDB[g][gName], "gName");
		mysql_fetch_field_row(str, "gMoney"); gangDB[g][gMoney] = strval(str);
		mysql_fetch_field_row(str, "gReps"); gangDB[g][gReps] = strval(str);
		mysql_fetch_field_row(str, "gSkin"); gangDB[g][gSkin] = strval(str);
	}

	mysql_free_result();
	return 1;
}

saveGangs()
{
	new 
		query[120];

	for (new i; i < MAX_GANGS; i++)
	{
		if (gangDB[i][gID] == INVALID_GANG_ID) continue;
		format(query, sizeof query, "UPDATE gangs2 SET gMoney = '%d', gReps = '%d', gSkin = '%d' WHERE gID = '%d'", gangDB[i][gMoney], gangDB[i][gReps], gangDB[i][gSkin], i);
		mysql_query(query);
	}
	return 1;
}

gang_exists(gang_name[])
{
	new 
		qer[100];

	format(qer, sizeof qer, "SELECT gID FROM gangs2 WHERE gName = '%s' LIMIT 1", gang_name);
	mysql_query(qer);
	mysql_store_result();
	new z = mysql_num_rows();
	mysql_free_result();

	return !!z;
}

gang_GetFreeID()
{
	for (new x; x < MAX_GANGS; x++)
		if (gangDB[x][gID] == INVALID_GANG_ID) return x;
	return INVALID_GANG_ID;
}

countGangs()
{
	mysql_query("SELECT gID FROM gangs2");
	mysql_store_result();
	new c = mysql_num_rows();
	mysql_free_result();	
	return c;
}

count_gangMembers(gangid)
{
	new x;
	foreach (new p : Player)
	{
		if (playerGang[p] == gangid) x++;
	}
	return x;
}

isActiveGangLeads(gangid)
{
	foreach(new i : Player)
	{
		if (playerGang[i] != gangid) continue;
		if (playerGangCo[i] || !strcmp(GetPlayerNameEx(i), gangDB[playerGang[i]][gLeaderName]))
			return true;
	}

	return false;
}

gang_message(gangid, msg[], col = -1)
{
	foreach(new i : Player)
	{
		if (playerGang[i] == gangid) 
			SendClientMessage(i, col, msg);
	}

	return 1;
}

gang_messageToAll(msg[], col = -1)
{
	foreach(new i : Player)
	{
		if (playerGang[i] != INVALID_GANG_ID) 
			SendClientMessage(i, col, msg);
	}

	return 1;
}

CMD:istotig(playerid, params[])
{
	if (ganginv_gangID[playerid] == INVALID_GANG_ID || ganginv_time[playerid] < gettime()) return ErrorMsg(playerid, "Neesi kvieèiamas á jokià gaujà");
	if (playerGang[playerid] != INVALID_GANG_ID) return 0;

	if(zInfo[playerid][specialybe] == 1 && zInfo[playerid][specialybe] == 5 && zInfo[playerid][specialybe] == 15 && zInfo[playerid][specialybe] == 13) return ErrorMsg(playerid, "Negalite ástoti á gaujà nes dirbate!");

	new
		str[70];

	playerGang[playerid] = ganginv_gangID[playerid];

	format(str, sizeof str,
		"Ástojai á \"%s\" gaujà.", gangDB[playerGang[playerid]][gName]);
	SendClientMessage(playerid, GREEN, str);

	ganginv_gangID[playerid] = INVALID_GANG_ID;
	ganginv_time[playerid] = 0;
	playerGangCo[playerid] = false;

	syncGZToPlayer(playerid);
	return 1;
}

CMD:gpalikti(playerid, params[])
{
	if (playerGang[playerid] == INVALID_GANG_ID) return ErrorMsg(playerid, "Tu neturi gaujos...");

	new 
		gangid = playerGang[playerid];

	if (!strcmp(gangDB[gangid][gLeaderName], GetPlayerNameEx(playerid))) return ErrorMsg(playerid, "Jeigu nori uþdaryti gaujà gali tai padaryti per /gauja");

	playerGang[playerid] = INVALID_GANG_ID;
	playerGangCo[playerid] = false;
	if (playerGangClothes[playerid])
	{
		SetPlayerSkin(playerid,zInfo[playerid][drabuziai]);
		zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
	}

    zInfo[playerid][NoGunsGang] = 0;

	SendClientMessage(playerid, GREEN, "Palikai gaujà.");
	syncGZToPlayer(playerid);

	return 1;
}

CMD:gskelb(playerid, params[])
{
	new 
		gangid = playerGang[playerid],
		str[128];

	if (gangid == INVALID_GANG_ID)
		return ErrorMsg(playerid, "Neturi gaujos");
	if (!playerGangCo[playerid] && strcmp(gangDB[gangid][gLeaderName], GetPlayerNameEx(playerid)) != 0)
		return ErrorMsg(playerid, "Negali naudoti ðios komandos.");
	if (gangDB[gangid][gReps] < GSKELB_REPS_REQ)
		return ErrorMsg(playerid, "Tavo gaujà neturi ðios galimybës, nes neturi reikiamo kiekio rep taðkø ("#GSKELB_REPS_REQ").");
	if (isnull(params) || strlen(params) > 60) 
		return SendClientMessage(playerid, YELLOW, "/gskelb [tekstas]");

	format(str, sizeof str,
		"%s gaujos %s %s : %s", 
		gangDB[gangid][gName], playerGangCo[playerid] ? ("pavaduotojas") : ("vadas"), GetPlayerNameEx(playerid), params);

	SendClientMessageToAll(PURPLE, str);

	return 1;
}


