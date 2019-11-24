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

    format(str, sizeof(str), "%s{ff9966}� {FFFFFF}Elektroninis pa�tas\n{ff9966}� {FFFFFF}Saugus klausimas\n{ff9966}� {FFFFFF}Slapta�odis", str);

    ShowPlayerDialogEx(playerid, DIALOG_ACCOUNT_SECURITY, DIALOG_STYLE_LIST, "{FFFFFF}Paskyros saugumas", str, "Pasirinkti", "At�aukti"); 
	return 1;
}

stock emailDialogsec(playerid)
{
	new str[104+1];

    format(str, sizeof(str), "%s{ff9966}� {ffffff}Nor�dam� pakeisti el pa�t� � {ff9966}laukel� {FFFFFF}�ra�ykite kod� kur� gavote el pa�te", str);

    ShowPlayerDialogEx(playerid, DIALOG_EMAIL_CHANGE_SECURITY, DIALOG_STYLE_INPUT, "{FFFFFF}Elektroninis pa�tas", str, "Keisti", "Gr��ti");
    return 1;
}

stock helpDialogsec(playerid)
{
    if(zInfo[playerid][helpMode] != -1) return ErrorMsg(playerid, "Saugos klausim� galima sukurti tik vien� kart�!");

	new str[92+1];

    format(str, sizeof(str), "%s{ff9966}� {ffffff}�ra�ykite savo saugos klausim�\n\nPavizdys: Mano �i�rimiausia influencer�?", str);

    ShowPlayerDialogEx(playerid, DIALOG_HELP_SECURITY, DIALOG_STYLE_INPUT, "{FFFFFF}Saugos klausimas", str, "�ra�yti", "Gr��ti");
	return 1;
}

stock answerDialogsec(playerid)
{
	new str[69+1];

    format(str, sizeof(str), "%s{ff9966}� {ffffff}�ra�ykite savo saugos atsakym�\n\nPavizdys: Griuks�", str);

    ShowPlayerDialogEx(playerid, DIALOG_ANSWER_SECURITY, DIALOG_STYLE_INPUT, "{FFFFFF}Saugos atsakymas", str, "�ra�yti", "Gr��ti");
	return 1;
}

stock passwordDialogsec(playerid)
{
	new str[101+1];

    format(str, sizeof(str), "%s{ff9966}� {ffffff}Nor�dam� pakeisti slapta�od� � {ff9966}laukel� {FFFFFF}�ra�ykite naujaj� slapta�od�", str);

    ShowPlayerDialogEx(playerid, DIALOG_PASSWORD_SECURITY, DIALOG_STYLE_INPUT, "{FFFFFF}Slapta�odis", str, "Keisti", "Gr��ti");
	return 1;
}

stock emailDialogsecOne(playerid)
{
	new str[104+1];

    format(str, sizeof(str), "%s{ff9966}� {ffffff}Nor�dam� pakeisti el pa�t� � {ff9966}laukel� {FFFFFF}�ra�ykite nauj� el pa�t�", str);

    ShowPlayerDialogEx(playerid, DIALOG_EMAIL_CHANGE_SECURITY_ONE, DIALOG_STYLE_INPUT, "{FFFFFF}Elektroninis pa�tas", str, "Keisti", "Gr��ti");
    return 1;
}

stock emailcode(playerid)
{
	new str[204+1];

    format(str, sizeof(str), "%s{ff9966}� {ffffff}Mes jums i�siunt�me kod� � {ff9966}elektronin� pa�t� {FFFFFF}tai kod� �ra�ykite �ia {ff9966}� {FFFFFF}lentele", str);

    ShowPlayerDialogEx(playerid, 15461, DIALOG_STYLE_INPUT, "{FFFFFF}El pa�to patvirtinimo kodas", str, "Keisti", "Gr��ti");
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
                format(String, 550, "Sveikas(-a) %s, j�s� kodas yra: %d\nPra�ome �vesti kod� � �aidimo lentel� kopijuodami (CTRL + X ) o �klijuokite (CTRL + V).\n \nSmagaus �aidimo jums linki sanCarson.lt administracija.", GetPlayerNameEx(playerid), zInfo[playerid][verifcode]);
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
		else SendClientMessage(playerid, RED, "I�jung�te lentel�");
	}
	if(dialogid == DIALOG_EMAIL_CHANGE_SECURITY)
	{
		if(response)
		{
			//if(!IsNumeric(inputtext)) return ErrorMsg(playerid, "Tik skai�iai!"), emailDialogsec(playerid);
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
			//if(!IsNumeric(inputtext)) return ErrorMsg(playerid, "Saugos klausime skai�i� neturi b�ti!"), helpDialogsec(playerid);
			if(strfind(inputtext, "%") != -1) return ErrorMsg(playerid, "Procent� naudoti negalite!"), helpDialogsec(playerid);
            if(sscanf(inputtext, "s[150]", helptext)) return helpDialogsec(playerid);
            if(strlen(helptext) < 4) return ErrorMsg(playerid, "Saugus klausimas yra per trumpas!"), helpDialogsec(playerid);
            else if(strlen(helptext) > 140) return ErrorMsg(playerid, "Saugus klausimas yra per ilgas!"), helpDialogsec(playerid);

            new query[128];
            format(query, 128, "INSERT INTO zaidejai (helpText) VALUES (%s)", inputtext);
            mysql_query(query);

            format(query, 128, "J�s� saugos klausimas yra %s", inputtext);
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
			//if(!IsNumeric(inputtext)) return ErrorMsg(playerid, "Saugos atsakyme skai�i� neturi b�ti!"), answerDialogsec(playerid);
			if(strfind(inputtext, "%") != -1) return ErrorMsg(playerid, "Procent� naudoti negalite!"), answerDialogsec(playerid);
            if(sscanf(inputtext, "s[150]", answertext)) return answerDialogsec(playerid);
            if(strlen(answertext) < 4) return ErrorMsg(playerid, "Saugus atsakymas yra per trumpas!"), answerDialogsec(playerid);
            else if(strlen(answertext) > 150) return ErrorMsg(playerid, "Saugus atsakymas yra per ilgas!"), answerDialogsec(playerid);

            new query[128];
            format(query, 128, "INSERT INTO zaidejai (answerText) VALUES (%s)", inputtext);
            mysql_query(query);

            format(query, 128, "J�s� saugos atsakymas yra %s", inputtext);
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
			if(strlen(passwordtext) < 4) return ErrorMsg(playerid, "Naujas slapta�odis per trumpas!");
			else if(strlen(passwordtext) > 20) return ErrorMsg(playerid, "Naujas slapta�odis per ilgas!");

			new query[128];
			format(query, 128, "UPDATE zaidejai SET pass = '%s' WHERE vardas = '%s'", inputtext, GetPlayerNameEx(playerid));
			mysql_query(query);

			format(query, 128, "J�s� naujas slapta�odis yra %s", inputtext);
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

            format(query, 200, "J�s� el pa�tas pakeistas � %s", inputtext);
            SuccesMSG(playerid, query);
		}
		else accountDialogsec(playerid);
	}
	return 1;	
}
