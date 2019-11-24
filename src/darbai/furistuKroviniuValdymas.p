
//kuriRanga[playerid]

#define DIALOG_EDIT_FKROV 9998
#define DIALOG_RANG_FKROV 9997

CMD:kroviniai(playerid)
{	
	if (zInfo[playerid][specialybe] == 6 && zInfo[playerid][dyrikz] != 6)
	{
		new xz[100];
		format(xz, sizeof xz, "SELECT * FROM furistukroviniai WHERE rangoid = '%d'", zInfo[playerid][JobRank]);
		mysql_query(xz);
		mysql_store_result();

		new fetch[10];
		new krovI[6];

		mysql_retrieve_row();

		mysql_fetch_field_row(fetch, "vaistai"); 		krovI[0] = strval(fetch);
		mysql_fetch_field_row(fetch, "elprekes"); 		krovI[1] = strval(fetch);
		mysql_fetch_field_row(fetch, "mproduktai"); 	krovI[2] = strval(fetch);
		mysql_fetch_field_row(fetch, "paptr"); 			krovI[3] = strval(fetch);
		mysql_fetch_field_row(fetch, "sporttr"); 		krovI[4] = strval(fetch);
		mysql_fetch_field_row(fetch, "mototr"); 		krovI[5] = strval(fetch);
		/*mysql_fetch_field_row(fetch, "chemija"); 		krovI[6] = strval(fetch);
		mysql_fetch_field_row(fetch, "seklos"); 		krovI[7] = strval(fetch);
		mysql_fetch_field_row(fetch, "ginklai"); 		krovI[8] = strval(fetch);*/
		
		mysql_free_result();

		new diaText[1000];

		format(diaText, sizeof diaText, 
		"Gali veþti visus krovinius paþymëtus þaliai\n\
		%sSkalbimo priemones\n%sEl. prekës\n%sMaisto produktai\n%sPaprastos maðinos\n%sSportinës maðinos\n%sMotociklai",/*\n%sChemija\n%sSëklos\n%sGinklai",*/
		(krovI[0] ? ("{7DC383}") : ("{F65454}")), (krovI[1] ? ("{7DC383}") : ("{F65454}")), (krovI[2] ? ("{7DC383}") : ("{F65454}")), (krovI[3] ? ("{7DC383}") : ("{F65454}")),
	 	(krovI[4] ? ("{7DC383}") : ("{F65454}")), (krovI[5] ? ("{7DC383}") : ("{F65454}"))); /*(krovI[6] ? ("{7DC383}") : ("{F65454}")), (krovI[7] ? ("{7DC383}") : ("{F65454}")),
	 	(krovI[8] ? ("{7DC383}") : ("{F65454}")));*/

		ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_LIST, "Kroviniai", diaText, "Gerai", "");

		return 1;
	}

	if (zInfo[playerid][dyrikz] != 6) return 0;
	show_krovValdDialog(playerid);
	return 1;
}


galiPasikrauti(rangoid, krovName[])
{
	new xz[100];
	format(xz, sizeof xz, "SELECT %s FROM furistukroviniai WHERE rangoid = '%d'", krovName, rangoid);
	mysql_query(xz);
	mysql_store_result();
	new argal = mysql_fetch_int();
	mysql_free_result();
	return !!argal;
}


formKroviniuValdDialog(playerid, rangid)
{
	new xz[100];
	format(xz, sizeof xz, "SELECT * FROM furistukroviniai WHERE rangoid = '%d'", rangid);
	mysql_query(xz);
	mysql_store_result();

	new fetch[10];
	new krovI[6];

	mysql_retrieve_row();

	mysql_fetch_field_row(fetch, "vaistai"); 		krovI[0] = strval(fetch);
	mysql_fetch_field_row(fetch, "elprekes"); 		krovI[1] = strval(fetch);
	mysql_fetch_field_row(fetch, "mproduktai"); 	krovI[2] = strval(fetch);
	mysql_fetch_field_row(fetch, "paptr"); 			krovI[3] = strval(fetch);
	mysql_fetch_field_row(fetch, "sporttr"); 		krovI[4] = strval(fetch);
	mysql_fetch_field_row(fetch, "mototr"); 		krovI[5] = strval(fetch);
	/*mysql_fetch_field_row(fetch, "chemija"); 		krovI[6] = strval(fetch);
	mysql_fetch_field_row(fetch, "seklos"); 		krovI[7] = strval(fetch);
	mysql_fetch_field_row(fetch, "ginklai"); 		krovI[8] = strval(fetch);*/
	
	mysql_free_result();

	new diaText[1000];

	format(diaText, sizeof diaText,
	"Gali veþti visus krovinius paþymëtus þaliai\n\
	%sSkalbimo priemones\n%sEl. prekës\n%sMaisto produktai\n%sPaprastos maðinos\n%sSportinës maðinos\n%sMotociklai",/*\n%sChemija\n%sSëklos\n%sGinklai",*/
	(krovI[0] ? ("{7DC383}") : ("{F65454}")), (krovI[1] ? ("{7DC383}") : ("{F65454}")), (krovI[2] ? ("{7DC383}") : ("{F65454}")), (krovI[3] ? ("{7DC383}") : ("{F65454}")),
	(krovI[4] ? ("{7DC383}") : ("{F65454}")), (krovI[5] ? ("{7DC383}") : ("{F65454}"))); /*(krovI[6] ? ("{7DC383}") : ("{F65454}")), (krovI[7] ? ("{7DC383}") : ("{F65454}")),
	(krovI[8] ? ("{7DC383}") : ("{F65454}")));*/

	ShowPlayerDialog(playerid, DIALOG_EDIT_FKROV, DIALOG_STYLE_LIST, "Kroviniai", diaText, "Pakeisti", "Iðeiti");

	return 1;
}

#include YSI\y_hooks

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if (dialogid == DIALOG_EDIT_FKROV)
	{
		if (!response) return 1;
		if (!listitem) return formKroviniuValdDialog(playerid, kuriRanga[playerid]);

		new qer[100], krovPav[15];

		switch(listitem)
		{
			case 1:   krovPav  =  "vaistai";
			case 2:   krovPav  =  "elprekes";
			case 3:   krovPav  =  "mproduktai";
			case 4:	  krovPav  =  "paptr";
			case 5:   krovPav  =  "sporttr";
			case 6:   krovPav  =  "mototr";
			/*case 7:   krovPav  =  "chemija";
			case 8:   krovPav  =  "seklos";
			case 9:   krovPav  =  "ginklai";*/

		}

		format(qer, sizeof qer, "UPDATE furistukroviniai SET %s = IF(%s = 1, '0', '1') WHERE rangoid = '%d'", krovPav, krovPav, kuriRanga[playerid]);
		mysql_query(qer);
		formKroviniuValdDialog(playerid, kuriRanga[playerid]);
		return 1;
	}

	if (dialogid == DIALOG_RANG_FKROV)
	{
		if (!response) return 1;
		if (!listitem) return show_krovValdDialog(playerid);

		kuriRanga[playerid] = listitem;
		formKroviniuValdDialog(playerid, kuriRanga[playerid]);

		return 1;
	}
	return 1;
}

show_krovValdDialog (playerid)
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

    ShowPlayerDialog(playerid, DIALOG_RANG_FKROV, DIALOG_STYLE_LIST, "Kroviniø valdymas", SAUGOMRANGUS, "Pasirinkti", "Iðeiti");

	return 1;
}
