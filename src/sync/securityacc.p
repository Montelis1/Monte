/*

PASKYROS SAUGUMAS

*/

#include YSI\y_hooks

#define DIALOG_ACCOUNT_SECURITY 15455

#define DIALOG_EMAIL_CHANGE_SECURITY 15456

#define DIALOG_HELP_SECURITY 15457

#define DIALOG_ANSWER_SECURITY 15458

#define DIALOG_PASSWORD_SECURITY 15459

#define DIALOG_EMAIL_CHANGE_SECURITY_ONE 15460


CMD:saugumas(playerid)
{
	accountDialogsec(playerid);
	return 1;
}

stock accountDialogsec(playerid)
{
	new str[122+1];

    format(str, sizeof(str), "%s{ff9966}• {FFFFFF}Elektroninis paðtas\n{ff9966}• {FFFFFF}Saugus klausimas\n{ff9966}• {FFFFFF}Slaptaþodis", str);

    ShowPlayerDialogEx(playerid, DIALOG_ACCOUNT_SECURITY, DIALOG_STYLE_LIST, "{FFFFFF}Paskyros saugumas", str, "Pasirinkti", "Atðaukti"); 
	return 1;
}

stock emailDialogsec(playerid)
{
	new str[104+1];

    format(str, sizeof(str), "%s{ff9966}» {ffffff}Norëdamá pakeisti el paðtà á {ff9966}laukelá {FFFFFF}áraðykite kodà kurá gavote el paðte", str);

    ShowPlayerDialogEx(playerid, DIALOG_EMAIL_CHANGE_SECURITY, DIALOG_STYLE_INPUT, "{FFFFFF}Elektroninis paðtas", str, "Keisti", "Gráþti");
    return 1;
}

stock helpDialogsec(playerid)
{
    if(zInfo[playerid][helpMode] != -1) return ErrorMsg(playerid, "Saugos klausimà galima sukurti tik vienà kartà!");

	new str[92+1];

    format(str, sizeof(str), "%s{ff9966}» {ffffff}Áraðykite savo saugos klausimà\n\nPavizdys: Mano þiûrimiausia influencerë?", str);

    ShowPlayerDialogEx(playerid, DIALOG_HELP_SECURITY, DIALOG_STYLE_INPUT, "{FFFFFF}Saugos klausimas", str, "Áraðyti", "Gráþti");
	return 1;
}

stock answerDialogsec(playerid)
{
	new str[69+1];

    format(str, sizeof(str), "%s{ff9966}» {ffffff}Áraðykite savo saugos atsakymà\n\nPavizdys: Griuksë", str);

    ShowPlayerDialogEx(playerid, DIALOG_ANSWER_SECURITY, DIALOG_STYLE_INPUT, "{FFFFFF}Saugos atsakymas", str, "Áraðyti", "Gráþti");
	return 1;
}

stock passwordDialogsec(playerid)
{
	new str[101+1];

    format(str, sizeof(str), "%s{ff9966}» {ffffff}Norëdamá pakeisti slaptaþodá á {ff9966}laukelá {FFFFFF}áraðykite naujajá slaptaþodá", str);

    ShowPlayerDialogEx(playerid, DIALOG_PASSWORD_SECURITY, DIALOG_STYLE_INPUT, "{FFFFFF}Slaptaþodis", str, "Keisti", "Gráþti");
	return 1;
}

stock emailDialogsecOne(playerid)
{
	new str[104+1];

    format(str, sizeof(str), "%s{ff9966}» {ffffff}Norëdamá pakeisti el paðtà á {ff9966}laukelá {FFFFFF}áraðykite naujà el paðtà", str);

    ShowPlayerDialogEx(playerid, DIALOG_EMAIL_CHANGE_SECURITY_ONE, DIALOG_STYLE_INPUT, "{FFFFFF}Elektroninis paðtas", str, "Keisti", "Gráþti");
    return 1;
}

stock emailcode(playerid)
{
	new str[204+1];

    format(str, sizeof(str), "%s{ff9966}» {ffffff}Mes jums iðsiuntëme kodà á {ff9966}elektroniná paðtà {FFFFFF}tai kodà áraðykite èia {ff9966}á {FFFFFF}lentele", str);

    ShowPlayerDialogEx(playerid, 15461, DIALOG_STYLE_INPUT, "{FFFFFF}El paðto patvirtinimo kodas", str, "Keisti", "Gráþti");
    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_ACCOUNT_SECURITY)
	{
		if(response)
		{
			if(listitem == 0)
			{
				zInfo[playerid][verifcode] = RandomEx(1000,9999);
                new String[350];
                format(String, 550, "Sveikas(-a) %s, jûsø kodas yra: %d\nPraðome ávesti kodà á þaidimo lentelë kopijuodami (CTRL + X ) o áklijuokite (CTRL + V).\n \nSmagaus þaidimo jums linki sanCarson.lt administracija.", GetPlayerNameEx(playerid), zInfo[playerid][verifcode]);
                SendMail(zInfo[playerid][receive], "sancarson@sancarson.lt", "sanCarson.lt - dykumos kaimeliai", "serverio el pasto keitimo kodas", String);

				emailDialogsec(playerid);
			}
			if(listitem == 1)
			{
				helpDialogsec(playerid);
			}
			if(listitem == 2)
			{
				passwordDialogsec(playerid);
			}
		}
		else SendClientMessage(playerid, RED, "Iðjungëte lentelë");
	}
	if(dialogid == DIALOG_EMAIL_CHANGE_SECURITY)
	{
		if(response)
		{
			//if(!IsNumeric(inputtext)) return ErrorMsg(playerid, "Tik skaièiai!"), emailDialogsec(playerid);
			if(strfind(inputtext, "%") != -1) return ErrorMsg(playerid, "Procentai serveryje negalimi!"), emailDialogsec(playerid);
			//if(strfind(inputtext, "@") == 1) return ErrorMsg(playerid, "Privalomas @ simbolis!"), emailDialogsec(playerid);
			if(zInfo[playerid][verifcode] == strval(inputtext))
			{
			   InfoMSG(playerid, "Kodas teisingas");
			   emailDialogsecOne(playerid);
			}
			else ErrorMsg(playerid, "Neteisingas kodas!");
		}
		else accountDialogsec(playerid);
	}
	if(dialogid == DIALOG_HELP_SECURITY)
	{
		if(response)
		{
			new helptext[150]; 
			//if(!IsNumeric(inputtext)) return ErrorMsg(playerid, "Saugos klausime skaièiø neturi bûti!"), helpDialogsec(playerid);
			if(strfind(inputtext, "%") != -1) return ErrorMsg(playerid, "Procentø naudoti negalite!"), helpDialogsec(playerid);
            if(sscanf(inputtext, "s[150]", helptext)) return helpDialogsec(playerid);
            if(strlen(helptext) < 4) return ErrorMsg(playerid, "Saugus klausimas yra per trumpas!"), helpDialogsec(playerid);
            else if(strlen(helptext) > 140) return ErrorMsg(playerid, "Saugus klausimas yra per ilgas!"), helpDialogsec(playerid);

            new query[128];
            format(query, 128, "INSERT INTO zaidejai (helpText) VALUES (%s)", inputtext);
            mysql_query(query);

            format(query, 128, "Jûsø saugos klausimas yra %s", inputtext);
            SuccesMSG(playerid, query);

            answerDialogsec(playerid);
		}
		else accountDialogsec(playerid);
	}
	if(dialogid == DIALOG_ANSWER_SECURITY)
	{
		if(response)
		{
			new answertext[150];
			//if(!IsNumeric(inputtext)) return ErrorMsg(playerid, "Saugos atsakyme skaièiø neturi bûti!"), answerDialogsec(playerid);
			if(strfind(inputtext, "%") != -1) return ErrorMsg(playerid, "Procentø naudoti negalite!"), answerDialogsec(playerid);
            if(sscanf(inputtext, "s[150]", answertext)) return answerDialogsec(playerid);
            if(strlen(answertext) < 4) return ErrorMsg(playerid, "Saugus atsakymas yra per trumpas!"), answerDialogsec(playerid);
            else if(strlen(answertext) > 150) return ErrorMsg(playerid, "Saugus atsakymas yra per ilgas!"), answerDialogsec(playerid);

            new query[128];
            format(query, 128, "INSERT INTO zaidejai (answerText) VALUES (%s)", inputtext);
            mysql_query(query);

            format(query, 128, "Jûsø saugos atsakymas yra %s", inputtext);
            SuccesMSG(playerid, query);

            zInfo[playerid][helpMode] = 1;
		}
		else accountDialogsec(playerid);
	}
	if(dialogid == DIALOG_PASSWORD_SECURITY)
	{
		if(response)
		{
			new passwordtext[20];
			if(sscanf(inputtext, "s[20]", passwordtext)) return passwordDialogsec(playerid);
			if(strlen(passwordtext) < 4) return ErrorMsg(playerid, "Naujas slaptaþodis per trumpas!");
			else if(strlen(passwordtext) > 20) return ErrorMsg(playerid, "Naujas slaptaþodis per ilgas!");

			new query[128];
			format(query, 128, "UPDATE zaidejai SET pass = '%s' WHERE vardas = '%s'", inputtext, GetPlayerNameEx(playerid));
			mysql_query(query);

			format(query, 128, "Jûsø naujas slaptaþodis yra %s", inputtext);
			SuccesMSG(playerid, query);
		}
		else accountDialogsec(playerid);
	}
	if(dialogid == DIALOG_EMAIL_CHANGE_SECURITY_ONE)
	{
		if(response)
		{
            if(strfind(inputtext, "%") != -1) return ErrorMsg(playerid, "Procentai serveryje negalimi!"), emailDialogsecOne(playerid);
			if(strfind(inputtext, "@") == 1) return ErrorMsg(playerid, "Privalomas @ simbolis!"), emailDialogsecOne(playerid);
			if(strlen(inputtext) < 6) return emailDialogsecOne(playerid);
			else if(strlen(inputtext) > 50) return emailDialogsecOne(playerid);
			
            new query[200];
            format(query, 200, "UPDATE zaidejai SET email = '%s' WHERE vardas = '%s'", inputtext, GetPlayerNameEx(playerid));
            mysql_query(query);

            format(query, 200, "Jûsø el paðtas pakeistas á %s", inputtext);
            SuccesMSG(playerid, query);
		}
		else accountDialogsec(playerid);
	}
	return 1;	
}
