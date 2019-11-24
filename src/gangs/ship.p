#define MAX_SHIP_SPOTS 5

#define GSHIP_COOLDOWN 60*20
#define GSHIP_PICK_CD 20

#define GSHIP_DEAGLE_KOF 	2
#define GSHIP_AK47_KOF 		7
#define GSHIP_SHOTGUN_KOF 	3

enum E_GANG_SHIP_SPOT_TYPES
{
	GSS_AK47,
	GSS_DEAGLE,
	GSS_SHOTGUN,
	GSS_WEED,
	GSS_COCAINE
};

enum E_GANG_SHIP
{
	E_GANG_SHIP_SPOT_TYPES: gs_type,
	gs_defAmount,
	Float: gs_pos[3]
};

static 
	gShipDB[MAX_SHIP_SPOTS][E_GANG_SHIP] =
	{
		{ GSS_DEAGLE, 100, {-1556.3779, 53.8434, 17.4251} },
		{ GSS_WEED, 100, {-1555.7275, 55.1908, 20.3385} },
		{ GSS_AK47, 100, {-1566.3059, 63.0276, 17.4351} },
		{ GSS_COCAINE, 100, {-1572.5140, 61.9662, 17.4351} },
		{ GSS_SHOTGUN, 100, {-1569.8527, 52.0340, 21.0385} }
	},

	gs_dynPUP[MAX_SHIP_SPOTS],
	Text3D: gs_dynText[MAX_SHIP_SPOTS],

	gs_pickCD[MAX_PLAYERS],

	gs_lastTimeItWas,
	bool: gs_isOn;


gs_check_ship()
{
	new hh;

	if (gs_lastTimeItWas < gettime(hh) && !gs_isOn)
	{
		if ((12 <= hh <= 23) && random(10) == 1)
		{
			gs_start_ship();
		}
	}
}

gs_start_ship()
{
	gs_isOn = true;

	new __@[5][14] = {"Desert Eagle", "Þolë", "AK-47", "Kokainas", "Shotgun"};

	for (new i; i < MAX_SHIP_SPOTS; i++)
	{
		gs_dynPUP[i] = CreateDynamicPickup(1254, 1, gShipDB[i][gs_pos][0], gShipDB[i][gs_pos][1], gShipDB[i][gs_pos][2]);
		gs_dynText[i] = CreateDynamic3DTextLabel(__@[i], -1, gShipDB[i][gs_pos][0], gShipDB[i][gs_pos][1], gShipDB[i][gs_pos][2], 2.5);
		gShipDB[i][gs_defAmount] = 100;
	}

	gang_messageToAll("Atsidarë laivas, paskubëk!", GREEN);
	SetTimer("gs_end_ship", 1000*60*15, false);
}

#include YSI\y_hooks

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{
	if (gs_isOn && playerGang[playerid] != INVALID_GANG_ID)
	{
		for (new i; i < MAX_SHIP_SPOTS; i++)
		{
			if (pickupid == gs_dynPUP[i] && gs_pickCD[playerid] < gettime())
			{
				if (gShipDB[i][gs_defAmount] == 0)
					break;

				gShipDB[i][gs_defAmount] --;
				gs_pickCD[playerid] = gettime() + GSHIP_PICK_CD;

				GameTextForPlayer(playerid, "~G~PAIEMEI", 2000, 5);

				switch (gShipDB[i][gs_type])
				{
					case GSS_AK47: gamm_add(playerGang[playerid], WEAPON_AK47, GSHIP_AK47_KOF);
					case GSS_DEAGLE: gamm_add(playerGang[playerid], WEAPON_DEAGLE, GSHIP_DEAGLE_KOF);
					case GSS_SHOTGUN: gamm_add(playerGang[playerid], WEAPON_SHOTGUN, GSHIP_SHOTGUN_KOF);
					case GSS_WEED: zInfo[playerid][zole]++;
					case GSS_COCAINE: zInfo[playerid][kokainas]++;
				}
				break;
			}
		}
	}

	return 1;
}

forward gs_end_ship();
public gs_end_ship()
{
	gs_isOn = false;
	gs_lastTimeItWas = gettime() + GSHIP_COOLDOWN;

	for (new i; i < MAX_SHIP_SPOTS; i++)
	{
		DestroyDynamicPickup(gs_dynPUP[i]);
		DestroyDynamic3DTextLabel(gs_dynText[i]);
		gShipDB[i][gs_defAmount] = 0;
	}
	return 1;
}

hook OnGameModeInit()
{
	CreateDynamicObject(2934, -1572.286376, 57.074497, 17.738121, 0.000000, 0.000000, 135.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19321, -1569.453125, 51.837551, 21.401540, 0.000000, 0.000000, 225.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(8341, -1575.509521, 51.717697, 19.938123, 0.000000, 0.000000, -45.299968, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3062, -1571.989746, 54.320365, 21.291536, 0.000000, 0.000000, 45.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19321, -1572.363037, 62.030147, 17.798124, 0.000000, 0.000000, 315.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3062, -1573.750122, 58.415039, 17.708127, 0.000000, 0.000000, 135.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19321, -1566.710205, 62.889038, 17.798124, 0.000000, 0.000000, 135.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3062, -1565.323486, 66.496269, 17.725767, 0.000000, 0.000000, -45.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2934, -1569.595092, 60.790214, 20.700088, 0.000000, 0.000000, 135.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19321, -1556.369018, 53.868587, 17.788135, 0.000000, 0.000000, -45.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3062, -1558.860473, 51.347469, 17.738130, 0.000000, 0.000000, 135.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2934, -1554.772705, 59.890766, 17.688127, 0.000000, 0.000000, 45.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(19321, -1555.927368, 54.764640, 20.701549, 0.000000, 0.000000, 135.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(3062, -1553.438842, 57.268093, 20.631546, 0.000000, 0.000000, 315.000000, -1, -1, -1, 300.00, 300.00); 
	CreateDynamicObject(2934, -1563.260742, 46.226013, 17.688125, 0.000000, 0.000000, 135.000000, -1, -1, -1, 300.00, 300.00); 

	return 1;
}

CMD:startship(playerid)
{
	if (zInfo[playerid][admin] < 4) return 0;
	gs_start_ship();
	return 1;
}