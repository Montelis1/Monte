#define SELECT_RANG_SKIN 9999

#include <YSI\y_hooks>

#define SKINRANG_COLOR 0x000000AA

new
	kuriRanga[MAX_PLAYERS],
	skinSQLID[MAX_PLAYERS],
	PlayerText: pTD_rangVald[MAX_PLAYERS][12],
	skinLytis[MAX_PLAYERS]
;

CMD:aprangos(playerid, params[])
{
	if(zInfo[playerid][dyrikz]==0) return 0;
	SendClientMessage(playerid, RED, "< Norëdami iðjungti langà spauskite ESC.");

	show_skinaiValdDialog (playerid);

	return 1;
}

CMD:pridskindarbui(playerid, params[])
{
	if (zInfo[playerid][admin] < 5) return 0;
	new darbas, lytisz, skinid;
	if (sscanf(params, "iii", darbas, lytisz, skinid)) return SendClientMessage(playerid, RED, "/pridskindarbui darboid lytis[0=vyras 1=moteris] skinid");
	new zx[100];
	format(zx, sizeof zx, "INSERT INTO darbugalimiskinai (darboid, skinid, lytis) VALUES ('%d', '%d', '%d')", darbas, skinid, lytisz);
	mysql_query(zx);
	SendClientMessage(playerid, playerid, "Sëkmingai pridëjote skinà darbui");

	return 1;
}

hook OnPlayerClickPlayerTextDraw(playerid, PlayerText:textid)
{
	if (kuriRanga[playerid] == 0) return 1;

	if (textid == pTD_rangVald[playerid][11])
	{
		skinLytis[playerid] = 1;
		new sknid = get_rangSkin(zInfo[playerid][dyrikz], kuriRanga[playerid], skinLytis[playerid]);

		new zx[110];
		format(zx, sizeof zx, "SELECT id FROM darbugalimiskinai WHERE darboid = '%d' AND skinid = '%d' AND lytis = '%d'", 
		zInfo[playerid][dyrikz], sknid, skinLytis[playerid]);
		mysql_query(zx);
		mysql_store_result();

		skinSQLID[playerid] = mysql_fetch_int();
		mysql_free_result();
		update_pTD_rangSkin(playerid);
	}
	if (textid == pTD_rangVald[playerid][10])
	{
		skinLytis[playerid] = 0;
		new sknid = get_rangSkin(zInfo[playerid][dyrikz], kuriRanga[playerid], skinLytis[playerid]);

		new zx[110];
		format(zx, sizeof zx, "SELECT id FROM darbugalimiskinai WHERE darboid = '%d' AND skinid = '%d' AND lytis = '%d'", 
		zInfo[playerid][dyrikz], sknid, skinLytis[playerid]);
		mysql_query(zx);
		mysql_store_result();

		skinSQLID[playerid] = mysql_fetch_int();
		mysql_free_result();
		update_pTD_rangSkin(playerid);
	}
	if (textid == pTD_rangVald[playerid][8])
	{
		get_nextSkinSQLID(playerid);
		update_pTD_rangSkin(playerid);
	}
	if (textid == pTD_rangVald[playerid][7])
	{
		get_prevSkinSQLID(playerid);
		update_pTD_rangSkin(playerid);
	}
	if (textid == pTD_rangVald[playerid][9])
	{
		CancelSelectTextDraw(playerid);
		update_rangSkin (zInfo[playerid][dyrikz], get_skinBySQLID(skinSQLID[playerid]), kuriRanga[playerid], skinLytis[playerid]);
		update_allWorkersSkins(zInfo[playerid][dyrikz], kuriRanga[playerid], skinLytis[playerid]);
		del_rskin_textdraw(playerid);
	}

	return 1;
}

update_allWorkersSkins(jobid, rangid, lytisz)
{
	for (new i; i < MAX_PLAYERS; i++)
	{
        if(zInfo[i][JobRank] == rangid && zInfo[i][specialybe] == jobid && zInfo[i][lytis] == lytisz)
        {
        	zInfo[i][uniforma] = get_rangSkin (zInfo[i][specialybe], zInfo[i][JobRank], zInfo[i][lytis]);
        	if (zInfo[i][skinStatus] != SKINSTATUS_JOB) continue;
       		SetPlayerSkin(i, zInfo[i][uniforma]);
       		SendClientMessage(i, GREEN, "> Jûsø apranga buvo pakeista, nes direktorius nustatë jûsø rangui naujà aprangà.");
        }
	}

	return 1;
}


update_rangSkin (darboid, skinid, rangid, slytis)
{
	new zx[100];
	format(zx, sizeof zx, "UPDATE darbuskinai SET skinid = '%d' WHERE lytis = '%d' AND darboid = '%d' AND rangoid = '%d'", skinid, slytis, darboid, rangid);
	mysql_query(zx);
	return 1;
}

get_rangSkin (darboid, rangid, slytis)
{
	new zx[105];
	format(zx, sizeof zx, "SELECT skinid FROM darbuskinai WHERE darboid = '%d' AND rangoid = '%d' AND lytis = '%d'", darboid, rangid, slytis);
	mysql_query(zx);
	mysql_store_result();

	new sknid = mysql_fetch_int();

	mysql_free_result();

	return sknid;
}

get_skinBySQLID(sqlid)
{
	new zx[105];
	format(zx, sizeof zx, "SELECT skinid FROM darbugalimiskinai WHERE id = '%d'", sqlid);
	mysql_query(zx);
	mysql_store_result();

	new sknid = mysql_fetch_int(); 

	mysql_free_result();

	return sknid;
}

show_skinaiValdDialog (playerid)
{
	new zx[200];
	format(zx, sizeof zx, "SELECT Rangas1,Rangas2,Rangas3,Rangas4,Rangas5,Rangas6,Rangas7 FROM `rangai` WHERE `KokioDarboRangas` = '%s'", get_RangTableName(zInfo[playerid][dyrikz]));
	mysql_query(zx);
    mysql_store_result( );
    new RANGAS1[ 128 ], RANGAS2[ 128 ], RANGAS3[ 128 ], RANGAS4[ 128 ], RANGAS5[ 128 ], RANGAS6[ 128 ], RANGAS7[ 128 ];
    new KINTMASISRANGAMS[ 1048 ];
    new SAUGOMRANGUS[ 1048 ];
    while( mysql_fetch_row_format( KINTMASISRANGAMS ) )
    {
        sscanf(KINTMASISRANGAMS,"p<|>s[128]s[128]s[128]s[128]s[128]s[128]s[128]",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7 );
        format( SAUGOMRANGUS,2048,"Pasirinkite rangà kurio aprangà keisite\n1.%s\n2.%s\n3.%s\n4.%s\n5.%s\n6.%s\n7.%s\n",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7);
    }
    mysql_free_result( );

    ShowPlayerDialog(playerid, SELECT_RANG_SKIN, DIALOG_STYLE_LIST, "Aprangos", SAUGOMRANGUS, "Pasirinkti", "Iðeiti");

	return 1;
}

get_RangTableName (darboid)
{
	new jobName[15];

	switch (darboid)
	{
		case JOB_PD: jobName = "Policija";
		case JOB_FTB: jobName = "Aras";
		case JOB_MKART: jobName = "Yardies";
		case JOB_MEDIC: jobName = "Medikai";
		case JOB_TAXI: jobName = "Taxi";
		case JOB_TRV: jobName = "Furistai";
		case JOB_MECH: jobName = "Mechanikai";
	}

	return jobName;
}

hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if (clickedid == Text:INVALID_TEXT_DRAW && kuriRanga[playerid] != 0)
	{
		kuriRanga[playerid] = 0;
		del_rskin_textdraw(playerid);
	}

	return 1;
}

hook OnPlayerConnect(playerid)
{
	kuriRanga[playerid] = 0;
	skinSQLID[playerid] = 0;
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == SELECT_RANG_SKIN)
	{
		if (!response) return 1;
		if (!listitem) return show_skinaiValdDialog(playerid);

		kuriRanga[playerid] = listitem;
		skinLytis[playerid] = 0;
		init_rskin_textdraw(playerid);

		new sknid = get_rangSkin(zInfo[playerid][dyrikz], kuriRanga[playerid], skinLytis[playerid]);

		new zx[110];
		format(zx, sizeof zx, "SELECT id FROM darbugalimiskinai WHERE darboid = '%d' AND skinid = '%d' AND lytis = '%d'", 
		zInfo[playerid][dyrikz], sknid, skinLytis[playerid]);
		mysql_query(zx);
		mysql_store_result();

		skinSQLID[playerid] = mysql_fetch_int();
		mysql_free_result();


		update_pTD_rangSkin(playerid);

		return 1;
	}

	return 1;
}

get_nextSkinSQLID(playerid)
{
	new zx[130];
	format(zx, sizeof zx, "SELECT id FROM darbugalimiskinai WHERE darboid = '%d' AND id > %d AND lytis = '%d' ORDER BY id ASC LIMIT 1", 
	zInfo[playerid][dyrikz], skinSQLID[playerid], skinLytis[playerid]);
	mysql_query(zx);
	mysql_store_result();

	if (!mysql_num_rows())
	{
		skinSQLID[playerid] = 0;
		mysql_free_result();
		return get_nextSkinSQLID(playerid);
	}

	skinSQLID[playerid] = mysql_fetch_int();
	mysql_free_result();

	return 1;
}

get_prevSkinSQLID(playerid)
{
	new zx[130];
	format(zx, sizeof zx, "SELECT id FROM darbugalimiskinai WHERE darboid = '%d' AND id < %d AND lytis = '%d' ORDER BY id DESC LIMIT 1", 
	zInfo[playerid][dyrikz], skinSQLID[playerid], skinLytis[playerid]);
	mysql_query(zx);
	mysql_store_result();

	if (!mysql_num_rows())
	{
		skinSQLID[playerid] = 1000;
		mysql_free_result();
		return get_prevSkinSQLID(playerid);
	}

	skinSQLID[playerid] = mysql_fetch_int();
	mysql_free_result();
	return 1;
}

update_pTD_rangSkin(playerid, skinid = -1)
{
	if (skinid == -1) skinid = get_skinBySQLID(skinSQLID[playerid]);
	PlayerTextDrawSetPreviewModel(playerid,  pTD_rangVald[playerid][0], skinid);
	new rangName[130];
	format(rangName, sizeof rangName, "%s", get_rangName(zInfo[playerid][dyrikz], kuriRanga[playerid]));
	for (new i; i < sizeof rangName; i++)
	{
		if (rangName[i] == ' ') rangName[i] = '_';
	}
	PlayerTextDrawSetString(playerid, pTD_rangVald[playerid][4], tdChar_lt(rangName));

	if (skinLytis[playerid]) PlayerTextDrawSetString(playerid, pTD_rangVald[playerid][5], "~y~MOTERISKA"), PlayerTextDrawSetString(playerid, pTD_rangVald[playerid][6], "VYRISKA");
	else PlayerTextDrawSetString(playerid, pTD_rangVald[playerid][6], "~y~VYRISKA"), PlayerTextDrawSetString(playerid, pTD_rangVald[playerid][5], "MOTERISKA");

	for (new i; i < 12; i ++) PlayerTextDrawShow(playerid, pTD_rangVald[playerid][i]);
	SelectTextDraw(playerid, SKINRANG_COLOR);

	return 1;
}

get_rangName (darboid, rangid)
{
	new zx[75];
	format(zx, sizeof zx, "SELECT Rangas%d FROM rangai WHERE KokioDarboRangas = '%s'", rangid, get_RangTableName(darboid));
	mysql_query(zx);
	mysql_store_result();

	new skinstr[130];

	mysql_fetch_row_format(skinstr);

	mysql_free_result();

	return skinstr;
}

init_rskin_textdraw(playerid)
{
	pTD_rangVald[playerid][0] = CreatePlayerTextDraw(playerid,259.000000, 136.000000, "skinas");
	PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][0], 2);
	PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][0], 170);
	PlayerTextDrawFont(playerid, pTD_rangVald[playerid][0], 5);
	PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][0], 0.500000, 1.600000);
	PlayerTextDrawColor(playerid, pTD_rangVald[playerid][0], -1);
	PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][0], 0);
	PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][0], 1);
	PlayerTextDrawSetShadow(playerid, pTD_rangVald[playerid][0], 1);
	PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][0], 1);
	PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][0], 170);
	PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][0], 122.000000, 141.000000);
	PlayerTextDrawSetPreviewModel(playerid,  pTD_rangVald[playerid][0], 123);
	PlayerTextDrawSetPreviewRot(playerid,  pTD_rangVald[playerid][0], 0.000000, 0.000000, 0.000000, 1.000000);
	PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][0], 0);

	pTD_rangVald[playerid][1] = CreatePlayerTextDraw(playerid,320.000000, 281.000000, "NUSTATYTI");
	PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][1], 2);
	PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][1], 255);
	PlayerTextDrawFont(playerid, pTD_rangVald[playerid][1], 2);
	PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][1], 0.200000, 1.200000);
	PlayerTextDrawColor(playerid, pTD_rangVald[playerid][1], -1);
	PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][1], 1);
	PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][1], 1);
	PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][1], 170);
	PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][1], 17.000000, -70.000000);
	PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][1], 0);

	pTD_rangVald[playerid][2] = CreatePlayerTextDraw(playerid,368.000000, 281.000000, ">");
	PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][2], 2);
	PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][2], 255);
	PlayerTextDrawFont(playerid, pTD_rangVald[playerid][2], 2);
	PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][2], 0.200000, 1.200000);
	PlayerTextDrawColor(playerid, pTD_rangVald[playerid][2], -1);
	PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][2], 1);
	PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][2], 1);
	PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][2], 170);
	PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][2], 17.000000, -30.000000);
	PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][2], 0);

	pTD_rangVald[playerid][3] = CreatePlayerTextDraw(playerid,272.000000, 281.000000, "<");
	PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][3], 2);
	PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][3], 255);
	PlayerTextDrawFont(playerid, pTD_rangVald[playerid][3], 2);
	PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][3], 0.200000, 1.200000);
	PlayerTextDrawColor(playerid, pTD_rangVald[playerid][3], -1);
	PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][3], 1);
	PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][3], 1);
	PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][3], 170);
	PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][3], 17.000000, -30.000000);
	PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][3], 0);

	pTD_rangVald[playerid][4] = CreatePlayerTextDraw(playerid,320.000000, 122.500000, "RANGO_PAVADINIMAS");
	PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][4], 2);
	PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][4], 255);
	PlayerTextDrawFont(playerid, pTD_rangVald[playerid][4], 2);
	PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][4], 0.150000, 1.099999);
	PlayerTextDrawColor(playerid, pTD_rangVald[playerid][4], -1);
	PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][4], 1);
	PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][4], 1);
	PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][4], 170);
	PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][4], 0.000000, -126.000000);
	PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][4], 0);

	pTD_rangVald[playerid][5] = CreatePlayerTextDraw(playerid,352.000000, 300.000000, "MOTERISKA");
	PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][5], 2);
	PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][5], 255);
	PlayerTextDrawFont(playerid, pTD_rangVald[playerid][5], 2);
	PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][5], 0.200000, 1.200000);
	PlayerTextDrawColor(playerid, pTD_rangVald[playerid][5], -1);
	PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][5], 1);
	PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][5], 1);
	PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][5], 170);
	PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][5], 17.000000, -62.000000);
	PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][5], 0);

	pTD_rangVald[playerid][6] = CreatePlayerTextDraw(playerid,288.000000, 300.000000, "VYRISKA");
	PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][6], 2);
	PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][6], 255);
	PlayerTextDrawFont(playerid, pTD_rangVald[playerid][6], 2);
	PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][6], 0.200000, 1.200000);
	PlayerTextDrawColor(playerid, pTD_rangVald[playerid][6], -1);
	PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][6], 1);
	PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][6], 1);
	PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][6], 1);
	PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][6], 170);
	PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][6], 17.000000, -62.000000);
	PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][6], 0);

	pTD_rangVald[playerid][7] = CreatePlayerTextDraw(playerid,259.000000, 278.000000, "<");
    PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][7], 2);
    PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][7], 0xFFFFFF00);
    PlayerTextDrawFont(playerid, pTD_rangVald[playerid][7], 5);
    PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][7], 0.500000, 1.000000);
    PlayerTextDrawColor(playerid, pTD_rangVald[playerid][7], -1);
    PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][7], 0);
    PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][7], 1);
    PlayerTextDrawSetShadow(playerid, pTD_rangVald[playerid][7], 1);
    PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][7], 1);
    PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][7], 0x00000000);
    PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][7], 26.000000, 17.000000);
    PlayerTextDrawSetPreviewModel(playerid,  pTD_rangVald[playerid][7], 19482);
    PlayerTextDrawSetPreviewRot(playerid,  pTD_rangVald[playerid][7], -16.000000, 0.000000, -55.000000, 0.000000);
    PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][7], 1);

    pTD_rangVald[playerid][8] = CreatePlayerTextDraw(playerid,355.000000, 278.000000, ">");
    PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][8], 2);
    PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][8], 0xFFFFFF00);
    PlayerTextDrawFont(playerid, pTD_rangVald[playerid][8], 5);
    PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][8], 0.500000, 1.000000);
    PlayerTextDrawColor(playerid, pTD_rangVald[playerid][8], -1);
    PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][8], 0);
    PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][8], 1);
    PlayerTextDrawSetShadow(playerid, pTD_rangVald[playerid][8], 1);
    PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][8], 1);
    PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][8], 0x00000000);
    PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][8], 26.000000, 17.000000);
    PlayerTextDrawSetPreviewModel(playerid,  pTD_rangVald[playerid][8], 19482);
    PlayerTextDrawSetPreviewRot(playerid,  pTD_rangVald[playerid][8], -16.000000, 0.000000, -55.000000, 0.000000);
    PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][8], 1);

    pTD_rangVald[playerid][9] = CreatePlayerTextDraw(playerid,287.000000, 278.000000, "nustat");
    PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][9], 2);
    PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][9], 0xFFFFFF00);
    PlayerTextDrawFont(playerid, pTD_rangVald[playerid][9], 5);
    PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][9], 0.500000, 1.000000);
    PlayerTextDrawColor(playerid, pTD_rangVald[playerid][9], -1);
    PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][9], 0);
    PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][9], 1);
    PlayerTextDrawSetShadow(playerid, pTD_rangVald[playerid][9], 1);
    PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][9], 1);
    PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][9], 0x00000000);
    PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][9], 67.000000, 17.000000);
    PlayerTextDrawSetPreviewModel(playerid,  pTD_rangVald[playerid][9], 19482);
    PlayerTextDrawSetPreviewRot(playerid,  pTD_rangVald[playerid][9], -16.000000, 0.000000, -55.000000, 0.000000);
    PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][9], 1);

    pTD_rangVald[playerid][10] = CreatePlayerTextDraw(playerid,259.000000, 298.000000, "vyr");
    PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][10], 2);
    PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][10], 0xFFFFFF00);
    PlayerTextDrawFont(playerid, pTD_rangVald[playerid][10], 5);
    PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][10], 0.500000, 1.000000);
    PlayerTextDrawColor(playerid, pTD_rangVald[playerid][10], -1);
    PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][10], 0);
    PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][10], 1);
    PlayerTextDrawSetShadow(playerid, pTD_rangVald[playerid][10], 1);
    PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][10], 1);
    PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][10], 0x00000000);
    PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][10], 58.000000, 15.000000);
    PlayerTextDrawSetPreviewModel(playerid,  pTD_rangVald[playerid][10], 19482);
    PlayerTextDrawSetPreviewRot(playerid,  pTD_rangVald[playerid][10], -16.000000, 0.000000, -55.000000, 0.000000);
    PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][10], 1);

    pTD_rangVald[playerid][11] = CreatePlayerTextDraw(playerid,323.000000, 298.000000, "mot");
    PlayerTextDrawAlignment(playerid, pTD_rangVald[playerid][11], 2);
    PlayerTextDrawBackgroundColor(playerid, pTD_rangVald[playerid][11], 0xFFFFFF00);
    PlayerTextDrawFont(playerid, pTD_rangVald[playerid][11], 5);
    PlayerTextDrawLetterSize(playerid, pTD_rangVald[playerid][11], 0.500000, 1.000000);
    PlayerTextDrawColor(playerid, pTD_rangVald[playerid][11], -1);
    PlayerTextDrawSetOutline(playerid, pTD_rangVald[playerid][11], 0);
    PlayerTextDrawSetProportional(playerid, pTD_rangVald[playerid][11], 1);
    PlayerTextDrawSetShadow(playerid, pTD_rangVald[playerid][11], 1);
    PlayerTextDrawUseBox(playerid, pTD_rangVald[playerid][11], 1);
    PlayerTextDrawBoxColor(playerid, pTD_rangVald[playerid][11], 0x00000000);
    PlayerTextDrawTextSize(playerid, pTD_rangVald[playerid][11], 58.000000, 15.000000);
    PlayerTextDrawSetPreviewModel(playerid,  pTD_rangVald[playerid][11], 19482);
    PlayerTextDrawSetPreviewRot(playerid,  pTD_rangVald[playerid][11], -16.000000, 0.000000, -55.000000, 0.000000);
    PlayerTextDrawSetSelectable(playerid, pTD_rangVald[playerid][11], 1);

	return 1;
}

del_rskin_textdraw(playerid)
{
	for (new i; i < 12; i ++)
	{
		PlayerTextDrawHide(playerid, pTD_rangVald[playerid][i]);
		PlayerTextDrawDestroy(playerid, pTD_rangVald[playerid][i]);
	}
	return 1;
}

tdChar_lt(string[])
{
	new strlenght = strlen(string),
		str[126];
	format(str, sizeof str, string);
	for(new i = 0; i < strlenght; i++)
	{
		if(str[i] == 'À') str[i] = 'A';
		if(str[i] == 'a') str[i] = 'a';
		if(str[i] == 'È') str[i] = 'C';
		if(str[i] == 'è') str[i] = 'c';
		if(str[i] == 'Æ') str[i] = 'E';
		if(str[i] == 'æ') str[i] = 'e';
		if(str[i] == 'Ë') str[i] = 'E';
		if(str[i] == 'ë') str[i] = 'e';
		if(str[i] == 'Á') str[i] = 'I';
		if(str[i] == 'á') str[i] = 'i';
		if(str[i] == 'Ð') str[i] = 'S';
		if(str[i] == 'ð') str[i] = 's';
		if(str[i] == 'Ø') str[i] = 'U';
		if(str[i] == 'ø') str[i] = 'u';
		if(str[i] == 'Û') str[i] = 'U';
		if(str[i] == 'û') str[i] = 'U';
		if(str[i] == 'Þ') str[i] = 'Z';
		if(str[i] == 'þ') str[i] = 'z';
	}
	return str;
}



