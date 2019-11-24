/*
	SetPlayerAttachedObject(playerid, PDG_SLOT, 2969, 1, -0.048999, -0.142999, -0.036999, 94.999977, 0.000000, 0.000000);
	AddPlayerClass(3,285.6353,1956.5917,471.6011,310.8592,0,0,0,0,0,0); // pdPaketas
	AddPlayerClass(3,275.5474,1955.9324,471.6011,47.0066,0,0,0,0,0,0); // pdBustine

	if(!zInfo[playerid][AFK_Stat] && !zInfo[playerid][Ofisas])


	AddStaticVehicle(462,-152.7234,2694.1672,63.7883,91.4142,77,23); // sanchez

	-152.7234, 2694.1672, 63.7883, 90.0
	-152.7234, 2692.1672, 63.7883, 90.0
	-152.7234, 2690.1672, 63.7883, 90.0
	-152.7234, 2688.1672, 63.7883, 90.0
	-152.7234, 2686.1672, 63.7883, 90.0
	-152.7234, 2684.1672, 63.7883, 90.0

	AddStaticVehicle(462,-152.6019,2685.4521,63.7892,92.0876,77,23); // sanchez__

*/

#include YSI\y_hooks

#define isPlayerInPd(%0) (IsPlayerInAreaEx(%0, 521.1, 1115.1, 781.1, 1296.1))

#define PDG_SLOT 9
#define PDG_TIME 600

#define DIALOG_MUITINES_KAMEROS 12481
#define DIALOG_KART_KOMPIUTERIS 12482
#define DIALOG_KART_KOMPIUTERISA 12483

new 
	bool: arGrobiaPD,
	bool: arGrobiaA,
	gPD_time,
	gPD_canGrob,
	gPD_pup = -1,
	maf_pup = -1,
	Text3D:gMU_3DT,
	muiPak,
	muGate,
	bool: turiMafPack[MAX_PLAYERS],
	bool: arLauziaMU, 
	onMessage
;

new securityMu[2];

new cameraPos[MAX_PLAYERS][2];

check_grobPD ()
{
	if (!arGrobiaPD || !arGrobiaA) return 1;

	new kiekMaf;
	foreach(Player, playerid)
	{
		if(/*!zInfo[playerid][AFK_Stat] && !zInfo[playerid][Ofisas] &&*/ isPlayerInPd(playerid)) kiekMaf ++;
	}

	if (!kiekMaf)
	{
		arGrobiaPD = false;
		arGrobiaA = false;
		gPD_time = 0;
		gPD_canGrob = gettime() + 1200;
		
		GangZoneHideForAll(muiPak);
		
		arLauziaMU = false;
		
		ClearActorAnimations(securityMu[0]);
		ClearActorAnimations(securityMu[1]);

		foreach(Player, playerid)
		{
			if (zInfo[playerid][specialybe] == JOB_MKART) SendClientMessage(playerid, RED, "Muitinës sandëlis buvo atgrobtas");
			else if (zInfo[playerid][specialybe] == JOB_PD || zInfo[playerid][specialybe] == JOB_FTB) SendClientMessage(playerid, GREEN, "Muitinës sandëlis sëkmingai atgrobtas");
		}
	}

	gPD_time ++;

	if (gPD_time >= PDG_TIME)
	{
		arGrobiaPD = false;
		arGrobiaA = false;
		gPD_time = 0;
		gPD_canGrob = gettime() + 1200;
		gPD_pup = CreateDynamicPickup(2969, 2, 627.5825,1266.3291,11.7570);
		gMU_3DT = Create3DTextLabel("{878787}» {FFFFFF}Ðiame pakete yra:\n Sëklø: {878787}120 {FFFFFF}vnt\n Chemija: {878787}120 {FFFFFF}vnt\nGinklø: {878787}30 {FFFFFF}vnt", COLOR_ORANGEX, 627.5825,1266.3291,11.7570, 50.0, 0, 0);
		SetTimer("removeGPDPUP", 1000*60, false);
		
		GangZoneHideForAll(muiPak);
		
		
		arLauziaMU = false;
		
		ClearActorAnimations(securityMu[0]);
		ClearActorAnimations(securityMu[1]);

		foreach(Player, playerid)
		{
			if (zInfo[playerid][specialybe] == JOB_MKART)
			{
				SendClientMessage(playerid, GREEN, "Muitinës sandëlis buvo sëkmingai iðlaikytas");
				SendClientMessage(playerid, GREEN, "Pasiimkite paketus ir veþkite juos á bazæ");
			}
			else if (zInfo[playerid][specialybe] == JOB_PD || zInfo[playerid][specialybe] == JOB_FTB) SendClientMessage(playerid, RED, "Muitinës sandëlis buvo iðlaikytas pagrobëjø");
		}

		return 1;
	}

	new zx[20];
	format(zx, sizeof zx, "UZGROBTA : %d %%", gPD_time*100/PDG_TIME);

	foreach(Player, playerid)
	{
		if (isPlayerInPd(playerid)) GameTextForPlayer(playerid, zx, 1100, 4);
	}
	
	if(onMessage == 2)
	{
	   muiPak = GangZoneCreate( 521.1, 1115.1, 781.1, 1296.1);
	   GangZoneShowForAll(muiPak, 0xFF0000AA);

	   foreach(Player, ply)
	   {
		 if (zInfo[ply][specialybe] == JOB_MKART) SendClientMessage(ply, YELLOW, "Muitinës sandëlio grobimas sëkmingai pradëtas.");
		 else if (zInfo[ply][specialybe] == JOB_PD || zInfo[ply][specialybe] == JOB_FTB) SendClientMessage(ply, YELLOW, "Kartelis bando uþgrobti muitinës sandëlá. Skubëkite apginti");
	   }
	   onMessage = 0;
	}

	return 1;
}

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{
	if (pickupid == gPD_pup)
	{
		if (turiMafPack[playerid]) return 1;
		if (zInfo[playerid][specialybe] != JOB_MKART) return 1;

		SetPlayerAttachedObject(playerid, PDG_SLOT, 2969, 1, -0.048999, -0.142999, -0.036999, 94.999977, 0.000000, 0.000000);
		turiMafPack[playerid] = true;
		SendClientMessage(playerid, GREEN, "Pasiemei paketà, veþk á bazæ.");
		PaemeMedziagas[playerid] = 1;
	}

	if (pickupid == maf_pup)
	{
		if(PaemeMedziagas[playerid] == 1)
		{
	        if(IsPlayerAttachedObjectSlotUsed(playerid, 3)) RemovePlayerAttachedObject(playerid, 3);
			SendClientMessage(playerid, -1, "Padëjote narkotinës medþiagas á kartelio sandëlá.");
	        DyleriaiZole += 10;
	        DyleriaiNark += 10;
	        PaemeMedziagas[playerid] = 0;
	        Pazymetas[playerid] = 0;
    	}

		if (!turiMafPack[playerid]) return 1;
		if (zInfo[playerid][specialybe] != JOB_MKART) return 1;

		RemovePlayerAttachedObject(playerid, PDG_SLOT);
		turiMafPack[playerid] = false;

		DyleriaiGun += 30;
		DyleriaiSeklos += 120;
		DyleriaiChemija += 120;
	}
	return 1;
}

hook OnGameModeInit()
{
    securityMu[0] = CreateActor(71,662.7228,1258.0103,13.0969,20.0493);
	securityMu[1] = CreateActor(71,668.4810,1261.3156,13.0969,114.4934);

	maf_pup = CreateDynamicPickup(2969, 2, -2721.0898, 109.6172, 838.8580);
	new pofka;//MUITINËS SANDËLIS
	pofka = CreateObject(4571, 637.413391, 1261.646850, -53.258598, 0.0, 0.0, 30.0,450.0);
	SetObjectMaterial(pofka, 1, 13364, "cetown3cs_t", "floor_tileone_256", 0xFFFFFFFF);
	pofka = CreateObject(4571, 637.229125, 1247.222900, -53.268501, 0.0, 0.0, 30.0,450.0);
	SetObjectMaterial(pofka, 1, 12802, "cunteroads2", "sw_gasground", 0xFFFFFFFF);
	pofka = CreateObject(4571, 670.907287, 1266.652099, -53.278499, 0.0, 0.0, 30.0,450.0);
	SetObjectMaterial(pofka, 1, 12802, "cunteroads2", "sw_gasground", 0xFFFFFFFF);
	pofka = CreateObject(4571, 625.239501, 1268.027832, -53.276500, 0.0, 0.0, 30.0,450.0);
	SetObjectMaterial(pofka, 1, 12802, "cunteroads2", "sw_gasground", 0xFFFFFFFF);
	pofka = CreateObject(4571, 660.009521, 1288.099853, -53.268501, 0.0, 0.0, 30.0,450.0);
	SetObjectMaterial(pofka, 1, 12802, "cunteroads2", "sw_gasground", 0xFFFFFFFF);
	pofka = CreateObject(18765, 663.941101, 1262.411987, 9.596899, 0.0, 0.0, 30.0,450.0);
	SetObjectMaterial(pofka, 0, 13364, "cetown3cs_t", "floor_tileone_256", 0xFFFFFFFF);
	pofka = CreateDynamicObject(8659, 639.082153, 1285.993896, 10.690099, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(8659, 676.537109, 1260.256103, 10.720100, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(8659, 637.807312, 1237.835815, 10.720100, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(8659, 633.917907, 1235.637451, 10.710100, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(8659, 613.681579, 1241.076660, 10.690099, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(8659, 607.818725, 1251.211425, 10.680100, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(8659, 613.442077, 1271.191406, 10.690099, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(8659, 643.247558, 1288.420654, 10.680100, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(8659, 694.584350, 1287.788330, 10.710100, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(8659, 674.758178, 1293.095947, 10.700099, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(16000, 673.027404, 1258.014892, 10.582500, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 641.601623, 1239.893310, 10.592499, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 630.341674, 1233.411987, 10.592499, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 615.708129, 1237.334228, 10.592499, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 605.747802, 1254.608276, 10.582500, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 609.673583, 1269.242431, 10.582500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 628.163330, 1279.912475, 10.582500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 646.623107, 1290.589721, 10.592499, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 661.291137, 1286.656616, 10.582500, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 670.804687, 1290.891113, 10.592499, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 678.123107, 1295.111816, 10.582500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 703.482971, 1272.637329, 10.592499, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 692.787719, 1291.163208, 10.582500, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3630, 658.956237, 1275.707153, 12.114700, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 3066, "ammotrx", "ammotrn92crate64", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3633, 632.491333, 1256.059692, 11.224699, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(18257, 612.330993, 1257.028686, 10.673500, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(5262, 651.664672, 1283.613281, 13.608799, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 4, 3066, "ammotrx", "ammotrn92crate64", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 5, 3066, "ammotrx", "ammotrn92crate64", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 6, 3066, "ammotrx", "ammotrn92crate64", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3576, 653.616516, 1276.331420, 12.198399, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 3, 3066, "ammotrx", "ammotrn92crate64", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3066, 644.976135, 1274.237915, 11.800299, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 2, 1370, "cj_exp_props", "CJ_GAS_CAN", 0xFFFFFFFF);
	pofka = CreateDynamicObject(18785, 669.257263, 1231.700683, 8.225199, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 12802, "cunteroads2", "sw_gasground", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 658.317993, 1291.771972, 6.475049, 0.0, 0.0, 30.100009,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(19376, 659.435791, 1289.784545, 6.455049, 0.0, 0.0, 30.100009,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(942, 626.574584, 1239.572265, 13.081199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFF858585);
	pofka = CreateDynamicObject(8659, 709.478820, 1262.037597, 10.710260, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(16000, 677.136413, 1254.034423, 10.592499, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 714.175842, 1254.107177, 10.592499, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 710.282592, 1239.432495, 10.574500, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16000, 691.754882, 1239.426147, 10.574500, 0.0, 0.0, 150.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 2, 11631, "mp_ranchcut", "mpCJ_Black_metal", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 3, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 4, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(8673, 681.424499, 1310.854492, 12.185299, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 691.625793, 1293.188842, 12.185299, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 667.157958, 1314.649169, 12.185299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 649.458618, 1304.436401, 12.185299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 631.748474, 1294.209350, 12.185299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 614.040100, 1283.981567, 12.185299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 597.385070, 1274.361083, 12.185299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 593.941955, 1260.353149, 12.185299, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 604.154479, 1242.658813, 12.185299, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 614.360168, 1224.992675, 12.185299, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 615.136596, 1223.654418, 12.185299, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 628.794738, 1219.960449, 12.185299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 646.502380, 1230.181030, 12.185299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(8673, 681.545532, 1250.378417, 12.185299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 9902, "coastground", "coasty_fencet_sfe", 0xFF656565);
	pofka = CreateDynamicObject(19453, 662.929870, 1254.254028, 15.499099, 90.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16091, 656.942871, 1249.507080, 12.037300, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, -1, "none", "none", 0xFF656565);
	SetDynamicObjectMaterial(pofka, 2, -1, "none", "none", 0xFF656565);
	pofka = CreateDynamicObject(16091, 656.950927, 1249.491088, 10.800800, 0.0, 180.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, -1, "none", "none", 0xFF656565);
	SetDynamicObjectMaterial(pofka, 2, -1, "none", "none", 0xFF656565);
	muGate = CreateDynamicObject(16773, 656.287353, 1250.365478, 14.765199, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(muGate, 0, 13059, "ce_fact03", "sw_newcorrug", 0xFF858585);
	pofka = CreateDynamicObject(19453, 649.907470, 1246.743652, 15.499099, 90.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 644.952697, 1245.822753, 15.067099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 636.646484, 1241.034179, 15.067099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 628.320556, 1236.234130, 15.067099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 621.722412, 1237.959228, 15.067099, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 616.926269, 1246.241088, 15.067099, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 612.147155, 1254.554809, 15.067099, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 608.870605, 1260.219848, 15.067099, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 610.953979, 1266.181274, 15.067099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 619.241577, 1270.979248, 15.067099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 627.523620, 1275.765625, 15.067099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 635.854797, 1280.549682, 15.067099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 666.200012, 1258.125854, 15.067099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 667.897644, 1264.541015, 15.067099, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 644.196655, 1285.367309, 15.067099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 652.483764, 1290.189575, 15.067099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 663.119079, 1272.857421, 15.067099, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 658.310607, 1281.188110, 15.067099, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 655.284240, 1286.438720, 15.067099, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(16091, 655.892517, 1251.314697, 12.037300, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, -1, "none", "none", 0xFF656565);
	SetDynamicObjectMaterial(pofka, 2, -1, "none", "none", 0xFF656565);
	pofka = CreateDynamicObject(16091, 655.897216, 1251.308227, 10.800800, 0.0, 180.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, -1, "none", "none", 0xFF656565);
	SetDynamicObjectMaterial(pofka, 2, -1, "none", "none", 0xFF656565);
	pofka = CreateDynamicObject(19453, 645.925476, 1266.681884, 15.499099, 90.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19453, 648.224914, 1266.083618, 15.499099, 90.0, 90.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19453, 646.531677, 1268.965576, 15.483099, 90.0, 90.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19453, 648.834289, 1268.358520, 15.483099, 90.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19453, 631.285583, 1256.312622, 15.499099, 90.0, 90.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19453, 631.893188, 1258.596679, 15.491100, 90.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19453, 629.611694, 1259.210083, 15.491100, 90.0, 90.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19453, 629.005310, 1256.930297, 15.491100, 90.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 659.658935, 1260.130737, 15.067099, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(18765, 660.453613, 1264.759399, 8.767700, 0.0, -10.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 13364, "cetown3cs_t", "floor_tileone_256", 0xFFC0C0C0);
	pofka = CreateDynamicObject(18765, 668.672729, 1269.503784, 9.588899, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 13364, "cetown3cs_t", "floor_tileone_256", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19453, 658.736572, 1265.067504, 15.483099, 90.0, 90.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19453, 661.758850, 1266.812255, 15.483099, 90.0, 90.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3576, 613.881469, 1265.779296, 12.198399, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 3, 3066, "ammotrx", "ammotrn92crate64", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3761, 630.933776, 1276.198974, 12.751500, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 3, 1560, "7_11_door", "cj_sheetmetal2", 0xFF858585);
	pofka = CreateDynamicObject(939, 624.316223, 1243.472900, 13.081199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFF858585);
	pofka = CreateDynamicObject(942, 621.862182, 1247.708374, 13.081199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFF858585);
	pofka = CreateDynamicObject(939, 619.218261, 1252.138671, 13.081199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFF858585);
	pofka = CreateDynamicObject(939, 636.263488, 1246.760498, 13.081199, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFF858585);
	pofka = CreateDynamicObject(942, 635.908874, 1253.510253, 13.081199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFF858585);
	pofka = CreateDynamicObject(939, 632.347106, 1244.508666, 13.081199, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFF858585);
	pofka = CreateDynamicObject(939, 640.281494, 1249.026733, 13.081199, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFF858585);
	pofka = CreateDynamicObject(942, 630.937683, 1250.501220, 13.081199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFF858585);
	pofka = CreateDynamicObject(3761, 632.877441, 1272.865722, 12.751500, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 3, 1560, "7_11_door", "cj_sheetmetal2", 0xFF858585);
	pofka = CreateDynamicObject(3761, 621.619567, 1268.450683, 12.751500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 3, 1560, "7_11_door", "cj_sheetmetal2", 0xFF858585);
	pofka = CreateDynamicObject(3761, 618.542846, 1266.680786, 12.751500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 3, 1560, "7_11_door", "cj_sheetmetal2", 0xFF858585);
	pofka = CreateDynamicObject(3633, 647.798034, 1264.903198, 11.224699, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(937, 626.904052, 1274.055419, 11.219300, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, 12978, "ce_payspray", "sf_spray_floor2", 0xFF959595);
	pofka = CreateDynamicObject(937, 628.729858, 1270.907714, 11.219300, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, 12978, "ce_payspray", "sf_spray_floor2", 0xFF959595);
	pofka = CreateDynamicObject(937, 630.654235, 1267.572021, 11.219300, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, 12978, "ce_payspray", "sf_spray_floor2", 0xFF959595);
	pofka = CreateDynamicObject(937, 629.687927, 1269.243774, 11.219300, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, 12978, "ce_payspray", "sf_spray_floor2", 0xFF959595);
	pofka = CreateDynamicObject(3761, 634.672119, 1269.626953, 12.751500, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 3, 1560, "7_11_door", "cj_sheetmetal2", 0xFF858585);
	pofka = CreateDynamicObject(937, 624.132873, 1267.400756, 11.219300, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, 12978, "ce_payspray", "sf_spray_floor2", 0xFF959595);
	pofka = CreateDynamicObject(937, 623.130615, 1269.108154, 11.219300, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, 12978, "ce_payspray", "sf_spray_floor2", 0xFF959595);
	pofka = CreateDynamicObject(937, 622.024047, 1271.064453, 11.219300, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, 12978, "ce_payspray", "sf_spray_floor2", 0xFF959595);
	pofka = CreateDynamicObject(937, 626.632385, 1268.884155, 11.219300, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, 12978, "ce_payspray", "sf_spray_floor2", 0xFF959595);
	pofka = CreateDynamicObject(937, 625.514648, 1270.789184, 11.219300, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 1560, "7_11_door", "cj_sheetmetal2", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, 12978, "ce_payspray", "sf_spray_floor2", 0xFF959595);
	pofka = CreateDynamicObject(3761, 645.048950, 1281.638549, 12.751500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 3, 1560, "7_11_door", "cj_sheetmetal2", 0xFF858585);
	pofka = CreateDynamicObject(3761, 638.426818, 1278.033935, 12.751500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 3, 1560, "7_11_door", "cj_sheetmetal2", 0xFF858585);
	pofka = CreateDynamicObject(3761, 641.887145, 1279.807861, 12.751500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 3, 1560, "7_11_door", "cj_sheetmetal2", 0xFF858585);
	pofka = CreateDynamicObject(19370, 664.421508, 1270.398315, 13.801500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 13363, "cephotoblockcs_t", "alleydoor3", 0xFFC0C0C0);
	pofka = CreateDynamicObject(19370, 667.894104, 1264.385742, 13.801500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 13363, "cephotoblockcs_t", "alleydoor3", 0xFFC0C0C0);
	pofka = CreateDynamicObject(6959, 628.555053, 1256.493774, 20.299100, 0.0, 180.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0xFFFFFFFF);
	pofka = CreateDynamicObject(6959, 647.776306, 1267.607543, 20.307100, 0.0, 180.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0xFFFFFFFF);
	pofka = CreateDynamicObject(8661, 678.858642, 1271.635375, 20.342300, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0xFFFFFFFF);
	pofka = CreateDynamicObject(8661, 688.591369, 1277.204833, 20.334299, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0xFFFFFFFF);
	pofka = CreateDynamicObject(8661, 700.190185, 1257.056518, 20.326299, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 698.890014, 1241.074462, 20.228599, 0.0, 90.0, 150.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19376, 689.912902, 1246.547363, 20.236600, 0.0, 90.0, 150.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0xFFFFFFFF);
	pofka = CreateDynamicObject(8661, 681.401489, 1266.992431, 20.318300, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1483, 650.638000, 1294.904296, 12.442099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1483, 644.116027, 1291.195068, 12.442099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1483, 633.256225, 1284.980590, 12.442099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1483, 627.098815, 1281.404663, 12.442099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1483, 620.962524, 1277.675292, 12.442099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1483, 603.895874, 1267.960327, 12.442099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1483, 609.906127, 1271.520507, 12.442099, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19370, 616.346923, 1273.065795, 12.492699, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 13363, "cephotoblockcs_t", "alleydoor3", 0xFFC0C0C0);
	pofka = CreateDynamicObject(19370, 638.798400, 1286.120361, 12.492699, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 13363, "cephotoblockcs_t", "alleydoor3", 0xFFC0C0C0);
	pofka = CreateDynamicObject(19370, 663.893249, 1287.057250, 12.492699, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 13363, "cephotoblockcs_t", "alleydoor3", 0xFFC0C0C0);
	pofka = CreateDynamicObject(2885, 671.007934, 1291.004028, 17.379100, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(2885, 681.456787, 1297.124023, 17.379100, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19305, 663.180297, 1252.239746, 12.166000, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(966, 670.997009, 1244.581176, 10.734299, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 19278, "skydiveplatforms", "hazardtile15-3", 0xFFFFFFFF);
	pofka = CreateDynamicObject(966, 657.138854, 1236.545288, 10.734299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 19278, "skydiveplatforms", "hazardtile15-3", 0xFFFFFFFF);
	pofka = CreateDynamicObject(968, 657.088073, 1236.516967, 11.487099, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 19278, "skydiveplatforms", "hazardtile19-2", 0xFFFFFFFF);
	pofka = CreateDynamicObject(968, 671.001708, 1244.586425, 11.487099, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 19278, "skydiveplatforms", "hazardtile19-2", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3034, 628.117126, 1232.100463, 17.161689, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3034, 638.769958, 1238.225708, 17.161689, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3034, 605.900268, 1267.120483, 17.161699, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3034, 621.741088, 1276.247802, 17.161699, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3034, 632.248718, 1282.287597, 17.161699, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3034, 651.998168, 1293.832519, 17.161699, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3034, 691.465026, 1293.507690, 17.161699, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3034, 700.897583, 1277.157470, 17.161699, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3034, 715.895935, 1251.134155, 17.161699, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3034, 712.398681, 1257.219970, 17.161699, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(8659, 675.096252, 1257.769042, 10.720100, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 1, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(19376, 686.663513, 1242.354858, 6.454800, 0.0, 0.0, 60.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(19376, 695.010620, 1237.567260, 6.454800, 0.0, 0.0, 60.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(19376, 696.822509, 1236.544677, 6.454800, 0.0, 0.0, 60.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 5123, "chemgrnd_las2", "newall1-3seamless", 0xFFC0C0C0);
	pofka = CreateDynamicObject(1483, 626.266479, 1229.083496, 12.442099, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1483, 632.274841, 1232.584716, 12.442099, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1483, 638.349731, 1236.058349, 12.442099, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3576, 673.154418, 1255.729248, 12.198399, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 3, 3066, "ammotrx", "ammotrn92crate64", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3066, 645.682067, 1240.471679, 11.800299, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 2, 1370, "cj_exp_props", "CJ_GAS_CAN", 0xFFFFFFFF);
	pofka = CreateDynamicObject(8659, 659.875732, 1250.784057, 20.234800, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	SetDynamicObjectMaterial(pofka, 1, 3816, "bighangarsfxr", "ws_breezeblocks", 0xFFFFFFFF);
	pofka = CreateDynamicObject(3066, 671.120422, 1314.266723, 11.800299, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 2, 1370, "cj_exp_props", "CJ_GAS_CAN", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1692, 678.310363, 1261.773437, 21.169099, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1692, 675.284606, 1267.110717, 21.169099, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1692, 664.190307, 1280.013549, 21.161100, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1692, 668.712646, 1282.604492, 21.161100, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1692, 659.732238, 1277.355468, 21.161100, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, -1, "none", "none", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19479, 689.403320, 1240.744262, 17.945661, 0.0, 0.0, -120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterialText(pofka, 0, "MUITINËS", 130, "Ariel", 65, 1, 0xFF020202, 0x00000000, 1);
	pofka = CreateDynamicObject(19479, 689.794555, 1240.541381, 16.395660, 0.0, 0.0, -120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterialText(pofka, 0, "SANDËLIS", 130, "Ariel", 70, 1, 0xFF020202, 0x00000000, 1);
	pofka = CreateDynamicObject(19479, 689.794555, 1240.541381, 16.285659, 0.0, 0.0, -120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterialText(pofka, 0, "_________", 130, "Ariel", 70, 1, 0xFF020202, 0x00000000, 1);
	pofka = CreateDynamicObject(19479, 689.794555, 1240.541381, 19.635662, 0.0, 0.0, -120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterialText(pofka, 0, "_________", 130, "Ariel", 70, 1, 0xFF020202, 0x00000000, 1);
	pofka = CreateDynamicObject(19453, 662.288513, 1267.095214, 15.483099, 90.0, 90.0, 30.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19453, 662.263427, 1267.138549, 18.533102, 180.0, 180.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(19453, 662.273437, 1267.121215, 17.293098, 180.0, 180.0, 120.0,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 17545, "burnsground", "newall10_seamless", 0xFFFFFFFF);
	pofka = CreateDynamicObject(1671, 668.942871, 1261.233642, 12.504201, 0.0, 0.0, -78.500000,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 1560, "7_11_door", "cj_sheetmetal2");
	pofka = CreateDynamicObject(1671, 663.060119, 1257.545654, 12.504201, 0.0, 0.0, -168.199996,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 0, 1560, "7_11_door", "cj_sheetmetal2");
	pofka = CreateDynamicObject(1432, 661.239440, 1261.154907, 12.181761, 0.0, 0.0, 55.699996,-1,-1,-1,310.0,310.0);
	SetDynamicObjectMaterial(pofka, 2, 1560, "7_11_door", "cj_sheetmetal2");

	pofka = CreateDynamicObject(1421, 638.715148, 1255.086669, 11.491200, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1348, 630.888977, 1255.286743, 11.471500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(669, 566.738586, 1215.165893, 10.856249, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(669, 583.622924, 1237.991943, 10.250229, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(669, 718.060546, 1232.380615, 12.445030, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1348, 659.986938, 1257.911010, 11.471500, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1348, 656.213562, 1268.775268, 11.471500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 648.945312, 1249.977783, 11.491200, 0.0, 0.0, 140.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 628.307861, 1256.767700, 11.491200, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 632.130920, 1259.773193, 11.491200, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 645.195617, 1266.629272, 11.491200, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 623.828002, 1265.597534, 11.491200, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 633.832763, 1267.664184, 11.491200, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1575, 629.003051, 1270.521484, 11.644800, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1576, 625.435668, 1271.038818, 11.644800, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1578, 624.567260, 1267.055419, 11.644800, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1578, 626.759582, 1269.479370, 11.644800, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1575, 622.360046, 1270.682739, 11.644800, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(931, 619.067932, 1254.935302, 11.777199, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(931, 620.347229, 1262.422363, 11.777199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(931, 655.630249, 1274.353515, 11.777199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 627.011596, 1245.348876, 11.491200, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 621.670349, 1239.335937, 11.491200, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 632.351684, 1239.413208, 11.491200, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1348, 639.868347, 1243.601318, 11.471500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1348, 613.799499, 1253.498291, 11.471500, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 648.296386, 1265.956176, 14.633399, 0.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 631.520202, 1256.283691, 14.633399, 0.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 614.690490, 1268.206909, 16.268800, 0.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 626.350524, 1274.958129, 16.268800, 0.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 628.646118, 1276.261108, 16.268800, 0.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 646.643310, 1286.648803, 16.268800, 0.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 631.632995, 1259.294311, 16.268800, 0.0, 90.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 613.933410, 1251.700805, 16.268800, 0.0, 90.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 618.315490, 1244.090942, 16.268800, 0.0, 90.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 644.246582, 1245.601928, 16.268800, 0.0, 90.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 641.125915, 1243.765380, 16.268800, 0.0, 90.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 663.393066, 1272.168579, 16.268800, 0.0, 90.0, 210.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 661.827026, 1274.853393, 16.268800, 0.0, 90.0, 210.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 642.098022, 1265.539062, 19.588899, 0.0, 180.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 635.274108, 1261.598144, 19.588899, 0.0, 180.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 628.462829, 1257.657714, 19.580900, 0.0, 180.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 616.798889, 1255.031005, 19.580900, 0.0, 180.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 621.656005, 1253.723510, 19.588899, 0.0, 180.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 612.868286, 1261.735839, 19.580900, 0.0, 180.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 611.850402, 1263.484741, 19.572900, 0.0, 180.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 638.568969, 1258.699951, 19.580900, 0.0, 180.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 642.487976, 1251.906127, 19.580900, 0.0, 180.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 644.443969, 1248.479980, 19.572900, 0.0, 180.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 645.552978, 1255.042480, 19.588899, 0.0, 180.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 652.379882, 1258.966918, 19.588899, 0.0, 180.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 659.160217, 1262.895751, 19.580900, 0.0, 180.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2653, 665.856628, 1266.758666, 19.572900, 0.0, 180.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(18608, 623.202026, 1264.367431, 18.892700, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(18608, 649.704833, 1261.648681, 18.892700, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(18608, 642.053588, 1275.274169, 18.892700, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(18608, 630.427429, 1249.932495, 18.892700, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1622, 674.409301, 1257.865600, 18.468900, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1622, 647.645507, 1242.898803, 18.468900, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(647, 699.558654, 1232.113769, 12.699589, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(647, 675.915344, 1243.922973, 11.669190, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(647, 681.684204, 1241.763671, 11.670149, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(647, 653.965454, 1230.984130, 11.669190, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 638.981994, 1237.402832, 11.491200, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 626.600219, 1226.825073, 11.491200, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 648.441345, 1230.556152, 11.451199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 666.742370, 1253.097290, 11.451199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(931, 669.220886, 1254.216430, 11.777199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1348, 676.513122, 1248.269409, 11.471500, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1348, 677.988464, 1250.641723, 11.471500, 0.0, 0.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1294, 651.272644, 1243.200561, 15.025409, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1294, 665.133422, 1251.510620, 15.025409, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1294, 622.096557, 1226.494384, 15.025409, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 664.323059, 1312.024047, 11.451199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 653.253295, 1295.403930, 11.451199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 632.598999, 1286.975952, 11.451199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 619.182250, 1278.987060, 11.451199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 611.544860, 1271.522949, 11.451199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 590.686401, 1269.730834, 11.451199, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 591.368286, 1265.963867, 11.451199, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 613.170532, 1240.044555, 11.451199, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 615.124450, 1236.861816, 11.451199, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1689, 631.375183, 1246.624267, 21.507299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1689, 648.509704, 1256.767333, 21.507299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1689, 617.605407, 1253.535644, 21.507299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1689, 651.186706, 1273.000488, 21.507299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1689, 633.387634, 1262.932373, 21.507299, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1689, 698.134765, 1252.940185, 21.507299, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1689, 686.127868, 1274.267456, 21.507299, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(669, 609.050598, 1218.451782, 10.250229, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(669, 645.898254, 1202.417358, 10.571880, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(669, 671.236450, 1205.895629, 10.571880, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(669, 629.359985, 1194.329956, 10.571880, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(669, 632.626892, 1175.196655, 10.571880, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(669, 586.589050, 1264.908569, 10.250229, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(669, 690.977294, 1310.072265, 10.233579, 0.0, 0.0, 0.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(11730, 662.561645, 1266.777343, 12.076698, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(11730, 660.024353, 1265.312377, 12.076698, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(11729, 660.664672, 1265.698974, 12.058102, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(11729, 661.530639, 1266.199096, 12.058102, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 658.539245, 1261.847900, 16.268800, 0.0, 90.0, 210.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 660.394165, 1258.635009, 16.268800, 0.0, 90.0, 210.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 664.198852, 1257.124755, 16.268800, 0.0, 90.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 667.368713, 1258.955078, 16.268800, 0.0, 90.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2165, 661.820983, 1258.020629, 12.078001, 0.0, 0.0, 30.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2165, 668.313903, 1260.234252, 12.078001, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 658.647277, 1263.575195, 12.801201, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 666.840026, 1259.344848, 12.801201, 0.0, 0.0, 210.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2986, 659.078186, 1265.111450, 16.268800, 0.0, 90.0, 300.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2612, 660.233642, 1259.407226, 14.435664, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(2612, 659.218688, 1261.165039, 14.435664, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	pofka = CreateDynamicObject(1421, 666.126037, 1266.321533, 12.801201, 0.0, 0.0, 120.0,-1,-1,-1,310.0,310.0);
	return 1;
}

forward removeGPDPUP();
public removeGPDPUP()
{
	DestroyDynamicPickup(gPD_pup);
	MoveDynamicObject(muGate, 656.28735, 1250.36548, 14.76520, 10,  0.00000, 0.00000, 210.00000);
	gPD_pup = -1;
	Delete3DTextLabel(gMU_3DT);
	return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{
	if (playerid != INVALID_PLAYER_ID)
	{
		if (turiMafPack[playerid])
		{
			return RemovePlayerAttachedObject(playerid, PDG_SLOT);
		}
	}
	return 1;
}

hook OnPlayerConnect(playerid)
{
	turiMafPack[playerid] = false;
	RemoveBuildingForPlayer(playerid, 3338, 629.343, 1279.679, 7.320, 0.250);
    RemoveBuildingForPlayer(playerid, 16620, 620.359, 1249.328, 24.890, 0.250);
    RemoveBuildingForPlayer(playerid, 16621, 579.437, 1249.164, 22.500, 0.250);
    RemoveBuildingForPlayer(playerid, 16272, 579.437, 1249.164, 22.500, 0.250);
    RemoveBuildingForPlayer(playerid, 16271, 620.359, 1249.328, 24.890, 0.250);
    RemoveBuildingForPlayer(playerid, 3244, 629.343, 1279.679, 7.320, 0.250);
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == DIALOG_MUITINES_KAMEROS)
	{
	    if(response)
		{
	         switch(listitem)
		     {
		         case 0:
			     {
				    if(arLauziaMU == true) return SendClientMessage(playerid, RED, "Ávyko kameros tinklo klaidà!");
			        //Pirma muitinës kamera
                    SetPlayerCameraPos(playerid,674.4771,1258.8259,14.2397);
                    SetPlayerCameraLookAt(playerid,658.7378,1225.6711,15.5821);
			        SetPlayerPos(playerid, 638.0734,1242.3695,11.7570);
			        SetPlayerFacingAngle(playerid, 195.5021);
			        SetPlayerVirtualWorld(playerid, 0);
			     }
			     case 1:
			     {
				    if(arLauziaMU == true) return SendClientMessage(playerid, RED, "Ávyko kameros tinklo klaidà!");
			        //Antra muitinës kamera
                    SetPlayerCameraPos(playerid,645.5283,1242.3622,15.6234);
                    SetPlayerCameraLookAt(playerid,670.5447,1229.5934,13.8440);
			        SetPlayerPos(playerid, 638.0734,1242.3695,11.7570);
			        SetPlayerFacingAngle(playerid, 195.5021);
			        SetPlayerVirtualWorld(playerid, 0);
			     }
			     case 2: 
				 {
					   //PD
                       //if(IsPlayerInRangeOfPoint(playerid, 10, 246.7918,1411.0203,470.1775) || IsPlayerInRangeOfPoint(playerid, 10, 638.0734,1242.3695,11.7570) || IsPlayerInRangeOfPoint(playerid, 10, 1512.6202,-1067.1697,2001.0959))
	                   //{
                          if(cameraPos[playerid][0] != -1)
                          {
			                 SetCameraBehindPlayer(playerid);
		                     SetPlayerPos(playerid, 246.7918,1411.0203,470.1775);
		                     SendClientMessage(playerid, RED, "Iðëjote ið kameros valdymo");
		                     cameraPos[playerid][0] = -1;
						  }
		               //}
					   //Kartelis
                       //else if(IsPlayerInRangeOfPoint(playerid, 10, -930.3031,-2512.7427,4.7652) || IsPlayerInRangeOfPoint(playerid, 10, 638.0734,1242.3695,11.7570))
	                   //{
                          else if(cameraPos[playerid][1] != -1)
                          {
		     	             SetCameraBehindPlayer(playerid);
		                     SetPlayerPos(playerid, -930.3031,-2512.7427,4.7652);
		                     SendClientMessage(playerid, RED, "Iðëjote ið kameros valdymo");
		                     cameraPos[playerid][1] = -1;
                          }
                       //}
                       //FTB
                       //else if(IsPlayerInRangeOfPoint(playerid, 10, 1512.6202,-1067.1697,2001.0959) || IsPlayerInRangeOfPoint(playerid, 10, 638.0734,1242.3695,11.7570))
                       //{
                          /*if(cameraPos[playerid][1] != -1)
                          {
                             SetCameraBehindPlayer(playerid);
		                     SetPlayerPos(playerid, 1512.6202,-1067.1697,2001.0959);
		                     SendClientMessage(playerid, RED, "Iðëjote ið kameros valdymo");
		                     cameraPos[playerid][1] --;
		                  }*/
                       //}
				 }
		     }
		}
        else 
		{
			 //PD
		     //if(IsPlayerInRangeOfPoint(playerid, 10, 246.7918,1411.0203,470.1775) || IsPlayerInRangeOfPoint(playerid, 10, 638.0734,1242.3695,11.7570) || IsPlayerInRangeOfPoint(playerid, 10, 1512.6202,-1067.1697,2001.0959))
	         //{
                 if(cameraPos[playerid][0] != -1)
                 {
			        SetCameraBehindPlayer(playerid);
		            SetPlayerPos(playerid, 246.7918,1411.0203,470.1775);
		            SendClientMessage(playerid, RED, "Atðaukëte kameros stebëjimà");
		            cameraPos[playerid][0] = -1;
                 }
		     //}
			 //Kartelis
             //else if(IsPlayerInRangeOfPoint(playerid, 10, -930.3031,-2512.7427,4.7652) || IsPlayerInRangeOfPoint(playerid, 10, 638.0734,1242.3695,11.7570))
	         //{
                else if(cameraPos[playerid][1] != -1)
                {
		     	   SetCameraBehindPlayer(playerid);
		           SetPlayerPos(playerid, -930.3031,-2512.7427,4.7652);
		           SendClientMessage(playerid, RED, "Atðaukëte kameros stebëjimà");
		           cameraPos[playerid][1] = -1;
                }
             //}
             //FTB
             //else if(IsPlayerInRangeOfPoint(playerid, 10, 1512.6202,-1067.1697,2001.0959) || IsPlayerInRangeOfPoint(playerid, 10, 638.0734,1242.3695,11.7570))
             //{
                /*if(cameraPos[playerid][1] != -1)
                {
                   SetCameraBehindPlayer(playerid);
		           SetPlayerPos(playerid, 1512.6202,-1067.1697,2001.0959);
		           SendClientMessage(playerid, RED, "Atðaukëte kameros stebëjimà");
		           cameraPos[playerid][1] --;
                }*/
             //}/
        }			 
        return 1;		
	}
	if(dialogid == DIALOG_KART_KOMPIUTERIS)
	{
	    if(response)
		{
            new teisN;
	        foreach(Player, ply)
	        {
		      if ( !zInfo[ply][AFK_Stat] && !zInfo[ply][Ofisas] && (zInfo[ply][specialybe] == JOB_PD || zInfo[ply][specialybe] == JOB_FTB)) teisN ++;
	        }
	        if (teisN < 2) return SendClientMessage(playerid, RED, "Nëra prisijunge ne AFK 2 teisësaugos nariai");
		    if(arLauziaMU == true) return SendClientMessage(playerid, RED, "Ávyko kameros tinklo klaidà!");
		    ShowPlayerDialogEx(playerid, DIALOG_KART_KOMPIUTERISA, DIALOG_STYLE_MSGBOX, "{FFFFFF}Kameros nulauþimas","{FFFFFF}Ar norite {ffff66}mëginti {FFFFFF}nulauþti muitinës kameras?","Taip","Ne");
		}
		else
		{		    
		    ShowPlayerDialogEx(playerid, DIALOG_MUITINES_KAMEROS, DIALOG_STYLE_LIST, "Muitinës kameros","Pirma lauko kamera\nAntra lauko kamera\nIðjungti kameros stebëjimà","Þiurëti","Atðaukti");				 
        }
		return 1;
	}
	if(dialogid == DIALOG_KART_KOMPIUTERISA)
	{
	    if(response)
		{
	        SetTimerEx("destroyOnecamera", 10000, false, "d", playerid);
	        TDtext(playerid, "~y~Lauziame kamera...");
		}
        else 
		{
		    SendClientMessage(playerid, RED, "Atðaukëte kameros nulauþimà");	
        }
        return 1;		
	}
    return 1;	
}

hook OnPlayerUpdate(playerid)
{
    new actorid = GetPlayerTargetActor(playerid);
	if(actorid == INVALID_ACTOR_ID) return 1;
    if(IsValidActor(actorid) && GetPlayerWeapon(playerid) != 0)
	if(actorid == securityMu[0])
	{
	   if (arGrobiaA) return 1;
	   if (gPD_canGrob > gettime()) return 1;
	   if(!arLauziaMU) return 1;
	   TDtext(playerid, "~y~Nusitaikei!");
	   arGrobiaA = true;
	   ApplyActorAnimation(securityMu[0], "ROB_BANK","SHP_HandsUp_Scr", 4.0, 0, 1, 1, 1, 0);
	   onMessage ++;
	}
	if(actorid == securityMu[1])
	{
	   if (arGrobiaPD) return 1;
	   if (gPD_canGrob > gettime()) return 1;
	   if(!arLauziaMU) return 1;
	   TDtext(playerid, "y~Nusitaikei!");
	   arGrobiaPD = true;
	   ApplyActorAnimation(securityMu[1], "ROB_BANK","SHP_HandsUp_Scr", 4.0, 0, 1, 1, 1, 0);
	   onMessage ++;
	}
    return 1;
}

CMD:mgrobti(playerid, params[])
{
    if (zInfo[playerid][dyrikz] != JOB_MKART && zInfo[playerid][pavaz] != JOB_MKART) return 0;
	if (!isPlayerInPd(playerid)) return SendClientMessage(playerid, RED, "Nesate muitinës sandëlá");
	if (arGrobiaPD || arGrobiaA) return SendClientMessage(playerid, RED, "Muitinës sandëlis jau grobiamas");
	if (gPD_canGrob > gettime()) return SendClientMessage(playerid, RED, "Dar negalite grobti");
	if(!arLauziaMU) return SendClientMessage(playerid, RED, "Turite nulauþti kameras, norint padëti bombà!");

	new teisN;

	foreach(Player, ply)
	{
		if( !zInfo[ply][AFK_Stat] && !zInfo[ply][Ofisas] && zInfo[ply][specialybe] == JOB_PD || zInfo[ply][specialybe] == JOB_FTB) teisN ++;
	}
	if (teisN < 2) return SendClientMessage(playerid, RED, "Nëra prisijunge ne AFK 2 teisësaugos nariai");
	gPD_time = 0;
	TDtext(playerid, "~y~Bomba sprogs uz 60 sec");
	SetTimer("BombExp", 6000, false);
	return 1;
}

CMD:muitinepd(playerid, params[])
{
    if(zInfo[playerid][specialybe] != JOB_PD) return SendClientMessage(playerid, RED, "Turite dirbti policijoje!");
    if(IsPlayerInRangeOfPoint(playerid, 10, 246.7918,1411.0203,470.1775) || IsPlayerInRangeOfPoint(playerid, 10, 638.0734,1242.3695,11.7570))
	{
       ShowPlayerDialogEx(playerid, DIALOG_MUITINES_KAMEROS, DIALOG_STYLE_LIST, "Muitinës kameros","Pirma lauko kamera\nAntra lauko kamera\nIðjungti kameros stebëjimà","Þiurëti","Atðaukti");
       cameraPos[playerid][0] = 1;
	}
	return 1;
}

/*CMD:muitineftb(playerid, params[])
{
    if(zInfo[playerid][specialybe] != JOB_FTB) return SendClientMessage(playerid, RED, "Turite dirbti FTB biure!");
    if(IsPlayerInRangeOfPoint(playerid, 10, 1512.6202,-1067.1697,2001.0959) || IsPlayerInRangeOfPoint(playerid, 10, 638.0734,1242.3695,11.7570))
	{
       ShowPlayerDialogEx(playerid, DIALOG_MUITINES_KAMEROS, DIALOG_STYLE_LIST, "Muitinës kameros","Pirma lauko kamera\nAntra lauko kamera\nIðjungti kameros stebëjimà","Þiurëti","Atðaukti");
       cameraPos[playerid][1] ++;
	}
	return 1;
}*/

CMD:kompiuteris(playerid, params[])
{
    if(IsPlayerInRangeOfPoint(playerid, 10, -930.3031,-2512.7427,4.7652) || IsPlayerInRangeOfPoint(playerid, 10, 638.0734,1242.3695,11.7570))
	{
	   if(zInfo[playerid][specialybe] != JOB_MKART) return SendClientMessage(playerid, RED, "Turite dirbti kartelyje !");
       ShowPlayerDialogEx(playerid, DIALOG_KART_KOMPIUTERIS, DIALOG_STYLE_MSGBOX, "{FFFFFF}Kartelio kompiuteris","{FFFFFF}Ðiame {ffff66}kartelio {FFFFFF}kompiuteryje, galite nulauþti arba stebëti {ffff66}muitinës {FFFFFF}kameras ir nepastebëtiems padëti {ffff66}bombà {FFFFFF}ant muitinës sandëlio\nJeigu norëti {ffff66}nulauþti {FFFFFF}muitinës kameras apaèioje paspauskite {ffff66}lauþti {FFFFFF}mygtukà","Lauþti","Kameros");
       cameraPos[playerid][1] = 1;
	}
	return 1;
}

forward destroyOnecamera(playerid);
public destroyOnecamera(playerid)
{
    new desMucamera = random(3);
	switch(desMucamera)
	{
	     case 0: TDtext(playerid, "~r~ Nepavyko nulauzti kameros bandykite dar karta!");
		 case 1: arLauziaMU = true, TDtext(playerid, "~y~ Pavyko nulauzti kameras");
		 case 2: TDtext(playerid, "~r~ Nepavyko nulauzti kameros bandykite dar karta!");
	}	 
    return 1;
}

forward BombExp();
public BombExp()
{
    CreateExplosion(656.28741, 1250.36548, 5.90920, 11, 3.0);
	MoveDynamicObject(muGate,  656.28741, 1250.36548, 5.90920, 8,  0.00000, 0.00000, 210.00000);
	return 1;
}
