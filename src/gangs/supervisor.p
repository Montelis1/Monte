
showdialog_spgangs(playerid)
{
	new 
		linestr[250], mainstr[MAX_GANGS*140+100] = "{FFFFFF}Pavadinimas\t{FFFFFF}Vadas\t{FFFFFF}Fonde\t{FFFFFF}Reputacija\n";

	for(new i; i < MAX_GANGS; i++)
	{
		if (gangDB[i][gID] == INVALID_GANG_ID) continue;

		format(linestr, sizeof linestr,
			"{999933}~ {FFFFFF}%s ({999933}ID:%d{FFFFFF})\t{999933}~ {FFFFFF}%s,\t{999933}~ {FFFFFF}%d eur,\t{999933}~ {FFFFFF}%d taðkø.\n",
			gangDB[i][gName], gangDB[i][gID], gangDB[i][gLeaderName], gangDB[i][gMoney], gangDB[i][gReps]);
		strcat(mainstr, linestr);
	}

	ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Serverio {999933}gaujø {FFFFFF}saraðas", mainstr, "Iðeiti", "");
}

/*showdialog_srvgangs(playerid)
{
	new 
		linestr[140], mainstr[MAX_GANGS*140+100] = "Pavadinimas\tVadas\tReputacija\n \n";

	for(new i; i < MAX_GANGS; i++)
	{
		if (gangDB[i][gID] == INVALID_GANG_ID) continue;

		format(linestr, sizeof linestr,
			"%s\t%s\t%d REP\n",
			gangDB[i][gName], gangDB[i][gLeaderName], gangDB[i][gReps]);
		strcat(mainstr, linestr);
	}

	ShowPlayerDialog(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "Gaujos", mainstr, "Iðeiti", "");
}*/

CMD:gaujos(playerid)
{
	//if(!zInfo[playerid][bPriziuretojas] && zInfo[playerid][admin] < 4) showdialog_spgangs(playerid);
	showdialog_spgangs(playerid);
	return 1;
}

/*CMD:panaikinti(playerid, params[])
{
	if(!zInfo[playerid][bPriziuretojas]) return false;
	
	new gang;

	if (sscanf(params, "i", gang))
		return ErrorMsg(playerid, "/panaikinti [gaujos id]");

	if (destroyGang(gang) == INVALID_GANG_ID)
	{
		ErrorMsg(playerid, "Tokia gauja neegzistuoja");
		return 1;
	}

	SendClientMessage(playerid, GREEN, "Gauja sëkmingai sunaikinta");
	
	//destroyGang(gang);

	return 1;
}*/





/*
017: undefined symbol "check_grobMK"
C:\Users\matoo\Desktop\samp\gamemodes\sancarson.pwn(1417) : warning 203: symbol is never used: "gPakviestas"
C:\Users\matoo\Desktop\samp\gamemodes\sancarson.pwn(1417 -- 66170) : warning 203: symbol is never used: "getGangsMembers"
C:\Users\matoo\Desktop\samp\gamemodes\sancarson.pwn(1417 -- 66170) : warning 203: symbol is never used: "getGangsNumber"
C:\Users\matoo\Desktop\samp\gamemodes\sancarson.pwn(1417 -- 66170) : warning 203: symbol is never used: "getPlayerGangID"

*/
