
#define MAX_SKINS 20
#define GANG_SKIN_PRICE 5000
//SelectTextDraw(playerid, 0x00000050);

#include YSI\y_hooks

static
	Text: textDraw_gangSkin[12],
	PlayerText: textDraw_pGangSkin[MAX_PLAYERS],

	gangSkinPage[MAX_PLAYERS] = {-1, ...},
	gangSkinSelectedSkin[MAX_PLAYERS] = {-1, ...};

static const
	gangSkinsDB[MAX_SKINS] = { 105, 106, 107, 102, 103, 104, 114, 115, 116, 108, 109, 110, 173, 174, 175, 247, 248, 254, 124, 125 };

// gangDB[][gSkin]

showtd_gangskin(playerid, bool: first = false)
{
	if (first)
		gangSkinPage[playerid] = 0, gangSkinSelectedSkin[playerid] = -1;

	TextDrawShowForPlayer(playerid, textDraw_gangSkin[0]);
	TextDrawShowForPlayer(playerid, textDraw_gangSkin[9]);
	TextDrawShowForPlayer(playerid, textDraw_gangSkin[10]);
	TextDrawShowForPlayer(playerid, textDraw_gangSkin[11]);

	new 
		skinArray[MAX_SKINS],
		skinsav = gangskin_countAv(),
		asd = gangSkinPage[playerid]*8;

	genAvSkinArray(skinArray);

	for (new i = 1; i < 9; i++)
	{
		if (i-1+asd > skinsav || skinArray[asd+i-1] == 0)
		{
			TextDrawHideForPlayer(playerid, textDraw_gangSkin[i]);
		}
		else
		{
			TextDrawSetPreviewModel(textDraw_gangSkin[i], skinArray[asd+i-1]);

			if (skinArray[i-1+asd] == gangSkinSelectedSkin[playerid])
				TextDrawBackgroundColor(textDraw_gangSkin[i], 0x00000050);
			else 
				TextDrawBackgroundColor(textDraw_gangSkin[i], -247);

			TextDrawShowForPlayer(playerid, textDraw_gangSkin[i]);
		}
	}

	SelectTextDraw(playerid, 0x00000050);

	PlayerTextDrawSetString(playerid, textDraw_pGangSkin[playerid], !doGangHaveSkin(playerGang[playerid]) ? ("APRANGOS PIRKIMAS~g~ (K: "#GANG_SKIN_PRICE" Eur)") : ("APRANGOS PIRKIMAS~g~ (K: "#GANG_SKIN_PRICE" Eur) ~r~ (JAU TURITE APRANGA)"));
	PlayerTextDrawShow(playerid, textDraw_pGangSkin[playerid]);
} 

hidetd_gangskin(playerid)
{
	for (new i; i < 12; i++)
		TextDrawHideForPlayer(playerid, textDraw_gangSkin[i]);
	PlayerTextDrawHide(playerid, textDraw_pGangSkin[playerid]);

	CancelSelectTextDraw(playerid);

	gangSkinPage[playerid] = -1;
	gangSkinSelectedSkin[playerid] = -1;

	showdialog_gangleader(playerid);
	return 1;	
}


hook OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	if (gangSkinPage[playerid] == -1)
			return 1;

	if (clickedid == Text: INVALID_TEXT_DRAW)
	{
		hidetd_gangskin(playerid);
		return 1;
	}

	if (textDraw_gangSkin[9] == clickedid)
	{
		new 
			skinsav = gangskin_countAv(),
			avPages;

		for (avPages = 1; avPages < 4; avPages++)
		{
			if (skinsav <= avPages*8)
				break;
		}
		avPages --;


		if (++gangSkinPage[playerid] > avPages)
			gangSkinPage[playerid] = 0;

		showtd_gangskin(playerid);

		return 1;
	}

	if (textDraw_gangSkin[10] == clickedid)
	{
		new 
			skinsav = gangskin_countAv(),
			avPages;

		for (avPages = 1; avPages < 4; avPages++)
		{
			if (skinsav <= avPages*8)
				break;
		}
		avPages --;


		if (--gangSkinPage[playerid] == -1)
			gangSkinPage[playerid] = avPages;

		showtd_gangskin(playerid);

		return 1;
	}

	if (textDraw_gangSkin[11] == clickedid)
	{

		if (gangSkinSelectedSkin[playerid] == -1)
			return ErrorMsg(playerid, "Nieko nepasirinkai!");

		new 
			arrayy[MAX_SKINS],
			j = genAvSkinArray(arrayy),
			i;

		for (i = 0; i < j; i++)
		{
			if (arrayy[i] == gangSkinSelectedSkin[playerid])
			{
				i = -1;
				break;
			}
		}

		if (i != -1)
			return ErrorMsg(playerid, "Pasirinkta skinà jau nupirko kaþkas kitas");

		if (GetPlayerMoneyA(playerid) < GANG_SKIN_PRICE)
			return ErrorMsg(playerid, "Neuþtenka pinigø ("#GANG_SKIN_PRICE" eur)");

		GivePlayerMoneyA(playerid, -GANG_SKIN_PRICE);
		gangDB[playerGang[playerid]][gSkin] = gangSkinSelectedSkin[playerid];
		SendClientMessage(playerid, GREEN, "Sëkmingai nupirkai savo gaujai skinà");
		hidetd_gangskin(playerid);

		new str[100];
		format(str, sizeof str, 
			"UPDATE gangs2 SET gSkin = '%d' WHERE gID = '%d'",gangDB[playerGang[playerid]][gSkin], gangDB[playerGang[playerid]][gID]);
		mysql_query(str);

		updateGangSkins(playerGang[playerid]);

		return 1;
	}

	for (new i = 1; i < 9; i++)
	{
		if (textDraw_gangSkin[i] != clickedid)
			continue;

		new 
			arrayy[MAX_SKINS];

		genAvSkinArray(arrayy);

		if (gangSkinPage[playerid] * 8 + i-1 < MAX_SKINS) 
			gangSkinSelectedSkin[playerid] = arrayy[gangSkinPage[playerid] * 8 + i-1];

		showtd_gangskin(playerid);

		return 1;
	}

	return 1;
}

gangskin_IsSkinAv(skin)
{
	for (new i; i < MAX_GANGS; i++)
		if (gangDB[i][gSkin] == skin) return false;
	return true;
}

doGangHaveSkin(gangid)
{
	if (gangid == INVALID_GANG_ID)
		return INVALID_GANG_ID;
	for (new i; i < MAX_SKINS; i++)
		if (gangDB[gangid][gSkin] == gangSkinsDB[i]) return true;
	return false;
}

gangskin_countAv()
{
	new x;
	for (new i; i < MAX_SKINS; i++)
		if (gangskin_IsSkinAv(gangSkinsDB[i])) x++;
	return x;
}

genAvSkinArray(array[MAX_SKINS])
{
	new i, j;
	for (; i < MAX_SKINS; i++)
	{	
		if (gangskin_IsSkinAv(gangSkinsDB[i]))
		{
			array[j] = gangSkinsDB[i], j++;
		}
		else array[i] = -1;
	}
	return j;
}

updateGangSkins(gangid)
{
	if (gangid == INVALID_GANG_ID)
		return 1;

	foreach(new p : Player)
	{
		if (playerGang[p] == gangid && zInfo[p][skinStatus] == SKINSTATUS_GANG)
		{
			SetPlayerSkin(p, gangDB[playerGang[p]][gSkin]);
			SendClientMessage(p, GREEN, "Pasikeitë gaujos apranga.");
		}
	}

	return 1;
}

hook OnGameModeInit()
{
	textDraw_gangSkin[0] = TextDrawCreate(151.000000, 120.000000, "BOX");
	TextDrawBackgroundColor(textDraw_gangSkin[0], 255);
	TextDrawFont(textDraw_gangSkin[0], 1);
	TextDrawLetterSize(textDraw_gangSkin[0], 0.500000, 19.699998);
	TextDrawColor(textDraw_gangSkin[0], 0);
	TextDrawSetOutline(textDraw_gangSkin[0], 0);
	TextDrawSetProportional(textDraw_gangSkin[0], 1);
	TextDrawSetShadow(textDraw_gangSkin[0], 0);
	TextDrawUseBox(textDraw_gangSkin[0], 1);
	TextDrawBoxColor(textDraw_gangSkin[0], 170);
	TextDrawTextSize(textDraw_gangSkin[0], 443.000000, 0.000000);
	TextDrawSetSelectable(textDraw_gangSkin[0], 0);

	textDraw_gangSkin[1] = TextDrawCreate(154.000000, 136.000000, "SKIN");
	TextDrawBackgroundColor(textDraw_gangSkin[1], -247);
	TextDrawFont(textDraw_gangSkin[1], 5);
	TextDrawLetterSize(textDraw_gangSkin[1], 0.500000, 1.000000);
	TextDrawColor(textDraw_gangSkin[1], -1);
	TextDrawSetOutline(textDraw_gangSkin[1], 1);
	TextDrawSetProportional(textDraw_gangSkin[1], 1);
	TextDrawUseBox(textDraw_gangSkin[1], 1);
	TextDrawBoxColor(textDraw_gangSkin[1], 0);
	TextDrawTextSize(textDraw_gangSkin[1], 69.000000, 70.000000);
	TextDrawSetPreviewModel(textDraw_gangSkin[1], 15);
	TextDrawSetPreviewRot(textDraw_gangSkin[1], -16.000000, 0.000000, 0.000000, 1.000000);
	TextDrawSetSelectable(textDraw_gangSkin[1], 1);

	textDraw_gangSkin[2] = TextDrawCreate(226.000000, 136.000000, "SKIN");
	TextDrawBackgroundColor(textDraw_gangSkin[2], -247);
	TextDrawFont(textDraw_gangSkin[2], 5);
	TextDrawLetterSize(textDraw_gangSkin[2], 0.500000, 1.000000);
	TextDrawColor(textDraw_gangSkin[2], -1);
	TextDrawSetOutline(textDraw_gangSkin[2], 1);
	TextDrawSetProportional(textDraw_gangSkin[2], 1);
	TextDrawUseBox(textDraw_gangSkin[2], 1);
	TextDrawBoxColor(textDraw_gangSkin[2], 0);
	TextDrawTextSize(textDraw_gangSkin[2], 69.000000, 70.000000);
	TextDrawSetPreviewModel(textDraw_gangSkin[2], 15);
	TextDrawSetPreviewRot(textDraw_gangSkin[2], -16.000000, 0.000000, 0.000000, 1.000000);
	TextDrawSetSelectable(textDraw_gangSkin[2], 1);

	textDraw_gangSkin[3] = TextDrawCreate(298.000000, 136.000000, "SKIN");
	TextDrawBackgroundColor(textDraw_gangSkin[3], -247);
	TextDrawFont(textDraw_gangSkin[3], 5);
	TextDrawLetterSize(textDraw_gangSkin[3], 0.500000, 1.000000);
	TextDrawColor(textDraw_gangSkin[3], -1);
	TextDrawSetOutline(textDraw_gangSkin[3], 1);
	TextDrawSetProportional(textDraw_gangSkin[3], 1);
	TextDrawUseBox(textDraw_gangSkin[3], 1);
	TextDrawBoxColor(textDraw_gangSkin[3], 0);
	TextDrawTextSize(textDraw_gangSkin[3], 69.000000, 70.000000);
	TextDrawSetPreviewModel(textDraw_gangSkin[3], 15);
	TextDrawSetPreviewRot(textDraw_gangSkin[3], -16.000000, 0.000000, 0.000000, 1.000000);
	TextDrawSetSelectable(textDraw_gangSkin[3], 1);

	textDraw_gangSkin[4] = TextDrawCreate(371.000000, 136.000000, "SKIN");
	TextDrawBackgroundColor(textDraw_gangSkin[4], -247);
	TextDrawFont(textDraw_gangSkin[4], 5);
	TextDrawLetterSize(textDraw_gangSkin[4], 0.500000, 1.000000);
	TextDrawColor(textDraw_gangSkin[4], -1);
	TextDrawSetOutline(textDraw_gangSkin[4], 1);
	TextDrawSetProportional(textDraw_gangSkin[4], 1);
	TextDrawUseBox(textDraw_gangSkin[4], 1);
	TextDrawBoxColor(textDraw_gangSkin[4], 0);
	TextDrawTextSize(textDraw_gangSkin[4], 69.000000, 70.000000);
	TextDrawSetPreviewModel(textDraw_gangSkin[4], 15);
	TextDrawSetPreviewRot(textDraw_gangSkin[4], -16.000000, 0.000000, 0.000000, 1.000000);
	TextDrawSetSelectable(textDraw_gangSkin[4], 1);

	textDraw_gangSkin[5] = TextDrawCreate(154.000000, 210.000000, "SKIN");
	TextDrawBackgroundColor(textDraw_gangSkin[5], -247);
	TextDrawFont(textDraw_gangSkin[5], 5);
	TextDrawLetterSize(textDraw_gangSkin[5], 0.500000, 1.000000);
	TextDrawColor(textDraw_gangSkin[5], -1);
	TextDrawSetOutline(textDraw_gangSkin[5], 1);
	TextDrawSetProportional(textDraw_gangSkin[5], 1);
	TextDrawUseBox(textDraw_gangSkin[5], 1);
	TextDrawBoxColor(textDraw_gangSkin[5], 0);
	TextDrawTextSize(textDraw_gangSkin[5], 69.000000, 70.000000);
	TextDrawSetPreviewModel(textDraw_gangSkin[5], 15);
	TextDrawSetPreviewRot(textDraw_gangSkin[5], -16.000000, 0.000000, 0.000000, 1.000000);
	TextDrawSetSelectable(textDraw_gangSkin[5], 1);

	textDraw_gangSkin[6] = TextDrawCreate(226.000000, 210.000000, "SKIN");
	TextDrawBackgroundColor(textDraw_gangSkin[6], -247);
	TextDrawFont(textDraw_gangSkin[6], 5);
	TextDrawLetterSize(textDraw_gangSkin[6], 0.500000, 1.000000);
	TextDrawColor(textDraw_gangSkin[6], -1);
	TextDrawSetOutline(textDraw_gangSkin[6], 1);
	TextDrawSetProportional(textDraw_gangSkin[6], 1);
	TextDrawUseBox(textDraw_gangSkin[6], 1);
	TextDrawBoxColor(textDraw_gangSkin[6], 0);
	TextDrawTextSize(textDraw_gangSkin[6], 69.000000, 70.000000);
	TextDrawSetPreviewModel(textDraw_gangSkin[6], 15);
	TextDrawSetPreviewRot(textDraw_gangSkin[6], -16.000000, 0.000000, 0.000000, 1.000000);
	TextDrawSetSelectable(textDraw_gangSkin[6], 1);

	textDraw_gangSkin[7] = TextDrawCreate(298.000000, 209.000000, "SKIN");
	TextDrawBackgroundColor(textDraw_gangSkin[7], -247);
	TextDrawFont(textDraw_gangSkin[7], 5);
	TextDrawLetterSize(textDraw_gangSkin[7], 0.500000, 1.000000);
	TextDrawColor(textDraw_gangSkin[7], -1);
	TextDrawSetOutline(textDraw_gangSkin[7], 1);
	TextDrawSetProportional(textDraw_gangSkin[7], 1);
	TextDrawUseBox(textDraw_gangSkin[7], 1);
	TextDrawBoxColor(textDraw_gangSkin[7], 0);
	TextDrawTextSize(textDraw_gangSkin[7], 69.000000, 70.000000);
	TextDrawSetPreviewModel(textDraw_gangSkin[7], 15);
	TextDrawSetPreviewRot(textDraw_gangSkin[7], -16.000000, 0.000000, 0.000000, 1.000000);
	TextDrawSetSelectable(textDraw_gangSkin[7], 1);

	textDraw_gangSkin[8] = TextDrawCreate(371.000000, 209.000000, "SKIN");
	TextDrawBackgroundColor(textDraw_gangSkin[8], -247);
	TextDrawFont(textDraw_gangSkin[8], 5);
	TextDrawLetterSize(textDraw_gangSkin[8], 0.500000, 1.000000);
	TextDrawColor(textDraw_gangSkin[8], -1);
	TextDrawSetOutline(textDraw_gangSkin[8], 1);
	TextDrawSetProportional(textDraw_gangSkin[8], 1);
	TextDrawUseBox(textDraw_gangSkin[8], 1);
	TextDrawBoxColor(textDraw_gangSkin[8], 0);
	TextDrawTextSize(textDraw_gangSkin[8], 69.000000, 70.000000);
	TextDrawSetPreviewModel(textDraw_gangSkin[8], 15);
	TextDrawSetPreviewRot(textDraw_gangSkin[8], -16.000000, 0.000000, 0.000000, 1.000000);
	TextDrawSetSelectable(textDraw_gangSkin[8], 1);

	textDraw_gangSkin[9] = TextDrawCreate(426.000000, 285.000000, ">>");
	TextDrawBackgroundColor(textDraw_gangSkin[9], 255);
	TextDrawFont(textDraw_gangSkin[9], 1);
	TextDrawLetterSize(textDraw_gangSkin[9], 0.210000, 1.000000);
	TextDrawColor(textDraw_gangSkin[9], -1);
	TextDrawSetOutline(textDraw_gangSkin[9], 1);
	TextDrawSetProportional(textDraw_gangSkin[9], 1);
	TextDrawUseBox(textDraw_gangSkin[9], 1);
	TextDrawBoxColor(textDraw_gangSkin[9], -247);
	TextDrawTextSize(textDraw_gangSkin[9], 438.000000, 285.000000);
	TextDrawSetSelectable(textDraw_gangSkin[9], 1);

	textDraw_gangSkin[10] = TextDrawCreate(408.000000, 285.000000, "<<");
	TextDrawBackgroundColor(textDraw_gangSkin[10], 255);
	TextDrawFont(textDraw_gangSkin[10], 1);
	TextDrawLetterSize(textDraw_gangSkin[10], 0.210000, 1.000000);
	TextDrawColor(textDraw_gangSkin[10], -1);
	TextDrawSetOutline(textDraw_gangSkin[10], 1);
	TextDrawSetProportional(textDraw_gangSkin[10], 1);
	TextDrawUseBox(textDraw_gangSkin[10], 1);
	TextDrawBoxColor(textDraw_gangSkin[10], -247);
	TextDrawTextSize(textDraw_gangSkin[10], 420.000000, 285.000000);
	TextDrawSetSelectable(textDraw_gangSkin[10], 1);

	textDraw_gangSkin[11] = TextDrawCreate(379.000000, 285.000000, "PIRKTI");
	TextDrawBackgroundColor(textDraw_gangSkin[11], 255);
	TextDrawFont(textDraw_gangSkin[11], 1);
	TextDrawLetterSize(textDraw_gangSkin[11], 0.209998, 1.000000);
	TextDrawColor(textDraw_gangSkin[11], -1);
	TextDrawSetOutline(textDraw_gangSkin[11], 1);
	TextDrawSetProportional(textDraw_gangSkin[11], 1);
	TextDrawUseBox(textDraw_gangSkin[11], 1);
	TextDrawBoxColor(textDraw_gangSkin[11], -247);
	TextDrawTextSize(textDraw_gangSkin[11], 402.000000, 285.000000);
	TextDrawSetSelectable(textDraw_gangSkin[11], 1);
	
	return 1;
}

hook OnPlayerConnect(playerid)
{
	textDraw_pGangSkin[playerid] = CreatePlayerTextDraw(playerid, 155.000000, 122.000000, "APRANGOS PIRKIMAS~r~ (NUSIPIRKUS APRANGA SENOJI BUS PAKEISTA)");
	PlayerTextDrawBackgroundColor(playerid, textDraw_pGangSkin[playerid], 255);
	PlayerTextDrawFont(playerid, textDraw_pGangSkin[playerid], 1);
	PlayerTextDrawLetterSize(playerid, textDraw_pGangSkin[playerid], 0.210000, 1.000000);
	PlayerTextDrawColor(playerid, textDraw_pGangSkin[playerid], -1);
	PlayerTextDrawSetOutline(playerid, textDraw_pGangSkin[playerid], 1);
	PlayerTextDrawSetProportional(playerid, textDraw_pGangSkin[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, textDraw_pGangSkin[playerid], 0);

	return 1;
}