/*

- Pervëþëjø tarnybos transportai Packer (443) Burrito (482) Mule (414).
- Perveþëjø tarnyba veþa tokius dalykus: Skalbimo priemonës, Transportà, El prekës, Maisto prekes.
- Perveþëjø tarnyba su Burrito (482) transportø veþa keleivius ir turi rodyti taksometrà.
Taipat galëtø vaþiuoti á random bot iðkvietimus paimti ið kito miesto þaidæjà ir nugabenti á kita miestà su lagaminais.

*/
#include YSI\y_hooks

#define DIALOG_KROVINIU_UZSAKYMAI 12487

new krovuzsakymai = -1; //Uþsakymo pickup'as

new krvuzs[MAX_PLAYERS] = 0; //Pasirenka uþsakytas krovinys

new skalb_uzs[MAX_PLAYERS] = 0, elek_uzs[MAX_PLAYERS] = 0, food_uzs[MAX_PLAYERS] = 0;

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{
	if(pickupid == krovuzsakymai)
	{
	   if(zInfo[playerid][specialybe] != 6) return ErorMSG(playerid, "Uþsakymus vygdyti gali tik perveþëjø tarnyba!");
	   ShowPlayerDialogEx(playerid, DIALOG_KROVINIU_UZSAKYMAI, DIALOG_STYLE_LIST, "{FFFFFF}Uþsakymai","{cccc99}• {FFFFFF}Transportas\n{cccc99}• {FFFFFF}Skalbimo priemones\n{cccc99}• {FFFFFF}El.prekës\n{cccc99}• {FFFFFF}Maisto produktai","Uþsisakyti","Atðaukti");
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_KROVINIU_UZSAKYMAI)
	{
		if(response)
		{
		   switch(listitem)
	       {
			   case 0:
			   {
				  if(krvuzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte transportà!");
                  if(skalb_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte skalbimo priemones!");
                  if(elek_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte el.prekes!");
                  if(food_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte maisto produktus!");
				  InfoMSG(playerid, "Uþsakymas sëkmingas, vaþiuokite á „Transportas“ pasikrovimo vietà geltonam (mini-map) taðke");
				  SetPlayerMapIcon(playerid, 86, 1606.6802,733.4780,10.8203, 0, 0xFFD400AA, MAPICON_LOCAL_CHECKPOINT);
				  krvuzs[playerid] = 1;
			   }
			   case 1:
			   {
                  if(krvuzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte transportà!");
                  if(skalb_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte skalbimo priemones!");
                  if(elek_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte el.prekes!");
                  if(food_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte maisto produktus!");
				  InfoMSG(playerid, "Uþsakymas sëkmingas, vaþiuokite á „Skalbimo priemoniø“ pasikrovimo vietà geltonam (mini-map) taðke");
				  SetPlayerMapIcon(playerid, 87, -550.0900,-485.5209,25.6479, 0, 0xFFD400AA, MAPICON_LOCAL_CHECKPOINT);
				  skalb_uzs[playerid] = 1;
			   }
			   case 2:
			   {
                  if(krvuzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte transportà!");
                  if(skalb_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte skalbimo priemones!");
                  if(elek_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte el.prekes!");
                  if(food_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte maisto produktus!");
				  InfoMSG(playerid, "Uþsakymas sëkmingas, vaþiuokite á „El.prekiø“ pasikrovimo vietà geltonam (mini-map) taðke");
				  SetPlayerMapIcon(playerid, 88, -540.0226,-486.4988,25.6405, 0, 0xFFD400AA, MAPICON_LOCAL_CHECKPOINT);
				  elek_uzs[playerid] = 1;
			   }
			   case 3:
			   {
                  if(krvuzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte transportà!");
                  if(skalb_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte skalbimo priemones!");
                  if(elek_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte el.prekes!");
                  if(food_uzs[playerid] == 1) return ErorMSG(playerid, "Jûs jau uþsisakëte maisto produktus!");
				  InfoMSG(playerid, "Uþsakymas sëkmingas, vaþiuokite á „Maisto produktø“ pasikrovimo vietà geltonam (mini-map) taðke");
				  SetPlayerMapIcon(playerid, 89, -545.5826,-486.6649,25.6416, 0, 0xFFD400AA, MAPICON_LOCAL_CHECKPOINT);
				  food_uzs[playerid] = 1;
			   }
          }
	   }
	}
	return 1;
}

hook OnGameModeInit()
{
	krovuzsakymai = CreateDynamicPickup(1274, 1, -553.8680,2595.2849,500.7749);

	new tranAc[4];
	tranAc[0] = CreateActor(298, -545.2686,2608.1387,500.7675,92.9173); //Isidarbinimo aktorë
	tranAc[1] = CreateActor(272, -555.7109,2595.7424,500.7749,271.3948); //Uþsakymø aktorius
	tranAc[2] = CreateActor(202, -550.4416,2588.9402,500.7737,3.5720); //Direktorius aktorius
	tranAc[3] = CreateActor(56, -545.6106,2598.7693,500.7675,96.2802); //Aktorë darbuotojø statistikà (-547.4594,2598.6372,500.7749)

    new scGame;
    scGame = CreateObject(19498, -554.37903, 2598.97021, 501.35345,   0.00000, 0.00000, 0.00000, 300.000);
    SetObjectMaterial(scGame, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF); //Grindys
    SetObjectMaterial(scGame, 1, 16011, "des_ntown", "des_ntwnwall1", 0xFFFFFFFF); //Siena
    SetObjectMaterial(scGame, 2, 9593, "hosbibalsfw", "ceiling_256", 0xFFFFFFFF); //Lubos
    SetObjectMaterial(scGame, 3, 16011, "des_ntown", "des_ntwnwall1", 0xFFFFFFFF); //Siena 1
    SetObjectMaterial(scGame, 4, 9593, "hosbibalsfw", "ceiling_256", 0xFFFFFFFF); //Lubos 1
    scGame = CreateDynamicObject(1569, -555.91992, 2598.08545, 499.67911,   0.00000, 0.00000, 90.00660);
    SetDynamicObjectMaterial(scGame, 0,  12980, "sw_block10", "sw_door17", 0xFFFFFFFF);
    sptdurys3 = CreateDynamicObject(1569, -548.68488, 2593.53735, 499.67911,   0.00000, 0.00000, -0.02640);
    SetDynamicObjectMaterial(sptdurys3, 0,  12964, "sw_block09", "sw_door19", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19377, -556.12378, 2588.37793, 497.63989,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 4586, "skyscrap3_lan2", "sl_dthotelwin1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19377, -558.92914, 2605.87158, 497.65994,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 4586, "skyscrap3_lan2", "sl_dthotelwin1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19377, -544.72101, 2598.75220, 497.63989,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 4586, "skyscrap3_lan2", "sl_dthotelwin1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19377, -544.72101, 2608.00513, 497.63989,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 4586, "skyscrap3_lan2", "sl_dthotelwin1", 0xFFFFFFFF);
    CreateDynamicObject(1704, -558.22449, 2602.72119, 499.73489,   0.00000, 0.00000, 90.00660);
    CreateDynamicObject(1704, -558.22449, 2607.59131, 499.73489,   0.00000, 0.00000, 90.00660);
    CreateDynamicObject(2161, -558.82013, 2605.17432, 500.89557,   0.00000, 0.00000, 90.00660);
    CreateDynamicObject(2165, -546.22620, 2607.49194, 499.69720,   0.00000, 0.00000, 90.00660);
    CreateDynamicObject(2165, -546.22620, 2598.23901, 499.69720,   0.00000, 0.00000, 90.00660);
    CreateDynamicObject(2637, -556.86823, 2605.42212, 500.05161,   0.00000, 0.00000, 90.00660);
    CreateDynamicObject(2464, -556.85645, 2605.45264, 500.59531,   0.00000, 0.00000, -93.52970);
    CreateDynamicObject(2165, -555.01202, 2595.80176, 499.69720,   0.00000, 0.00000, -89.05940);
    CreateDynamicObject(2164, -544.83948, 2605.38623, 499.71970,   0.00000, 0.00000, -90.00660);
    CreateDynamicObject(2610, -544.83948, 2596.13330, 500.57922,   0.00000, 0.00000, -90.00660);
    CreateDynamicObject(2610, -544.83948, 2595.23926, 500.57925,   0.00000, 0.00000, -90.00660);
    CreateDynamicObject(2608, -551.87451, 2593.79565, 501.38062,   0.00000, 0.00000, 180.48351);
    scGame = CreateObject(8661, -552.50952, 2583.50317, 499.77371,   0.00000, 0.00000, 0.00000, 300.000);
    SetObjectMaterial(scGame, 0, 12954, "sw_furniture", "CJ_WOOD5", 0xFFFFFFFF); //Grindys 1
    scGame = CreateDynamicObject(19377, -556.21356, 2592.91211, 497.63989,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 4586, "skyscrap3_lan2", "sl_dthotelwin1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19377, -551.78705, 2588.23999, 497.63989,   0.00000, 0.00000, 90.00660);
    SetDynamicObjectMaterial(scGame, 0, 4586, "skyscrap3_lan2", "sl_dthotelwin1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(1569, -545.02869, 2592.48511, 499.67911,   0.00000, 0.00000, -90.00660);
    SetDynamicObjectMaterial(scGame, 0,  12964, "sw_block09", "sw_door19", 0xFFFFFFFF);
    scGame = CreateDynamicObject(18762, -551.22632, 2602.21191, 500.47650,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 5413, "motel_lae", "fakestone1_LA", 0xFFFFFFFF);
    CreateDynamicObject(2164, -547.03912, 2588.58203, 499.71970,   0.00000, 0.00000, -179.98680);
    CreateDynamicObject(2165, -550.81671, 2589.44360, 499.69720,   0.00000, 0.00000, 0.02640);
    CreateDynamicObject(2079, -555.76617, 2589.78882, 500.37341,   0.00000, 0.00000, -180.03300);
    CreateDynamicObject(2079, -555.76617, 2590.76270, 500.37341,   0.00000, 0.00000, -180.03300);
    CreateDynamicObject(2079, -555.76617, 2591.73682, 500.37341,   0.00000, 0.00000, -180.03300);
    CreateDynamicObject(2000, -552.99103, 2593.00684, 499.74100,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2000, -552.50403, 2593.00684, 499.74100,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2000, -550.55603, 2593.00684, 499.74100,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2000, -550.06897, 2593.00684, 499.74100,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2241, -551.26093, 2603.15503, 500.18430,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2241, -555.63062, 2597.53174, 500.18430,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(2241, -551.53735, 2593.01001, 500.18430,   0.00000, 0.00000, 0.00000);
    scGame = CreateDynamicObject(19327, -551.81848, 2609.95239, 501.35120,   0.00000, 0.00000, -0.02640);
    SetDynamicObjectMaterial(scGame, 0, 17072, "truckedepotlawn", "ws_RShaul_dirt", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -556.54602, 2605.43872, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -551.18903, 2605.43872, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -551.18903, 2608.36060, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -551.18903, 2599.59473, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -551.18903, 2596.67261, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -546.80603, 2596.67261, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -546.80603, 2602.51660, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -546.80603, 2607.38672, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -546.80603, 2591.80273, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -550.21503, 2589.85474, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -550.21503, 2591.80273, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19584, -553.62402, 2591.80273, 502.71289,   0.00000, 0.00000, 0.00000);
    SetDynamicObjectMaterial(scGame, 0, 9169, "vgslowbuild", "ws_white_wall1", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19327, -544.82629, 2602.35132, 501.38611,   0.00000, 0.00000, -89.65510);
    SetDynamicObjectMaterial(scGame, 0, 10249, "ottos2_sfw", "ottos_pics_sfe", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19442, -559.62262, 2602.43457, 500.93839,   0.00000, 0.00000, 82.55610);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19442, -559.61719, 2603.93481, 500.93839,   0.00000, 0.00000, 93.48350);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19442, -559.63251, 2606.63965, 500.93839,   0.00000, 0.00000, 82.05940);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19442, -559.63049, 2608.52759, 500.93839,   0.00000, 0.00000, 91.99340);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19435, -556.92188, 2596.03857, 500.73529,   0.00000, 0.00000, 84.00000);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19435, -556.92188, 2596.03857, 500.73529,   0.00000, 0.00000, 84.00000);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19435, -556.91528, 2594.15405, 500.73529,   0.00000, 0.00000, 84.00000);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19435, -556.91528, 2594.15405, 500.73529,   0.00000, 0.00000, 84.00000);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19435, -556.91528, 2594.15405, 500.73529,   0.00000, 0.00000, 84.00000);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19435, -556.78052, 2592.69434, 500.35699,   0.00000, 0.00000, 84.49670);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19435, -556.80090, 2588.84985, 500.35699,   0.00000, 0.00000, 83.50330);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19435, -551.75867, 2587.53442, 500.38571,   0.00000, 0.00000, 178.04620);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19435, -544.00702, 2599.31519, 500.75116,   0.00000, 0.00000, 86.98020);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19442, -544.0079, 2607.5961, 500.9384,   0.0000, 0.0000, 86.0330);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
    scGame = CreateDynamicObject(19435, -549.60541, 2587.53198, 500.38571,   0.00000, 0.00000, 178.04620);
    SetDynamicObjectMaterial(scGame, 0, 16150, "ufo_bar", "GEwhite1_64", 0xFFFFFFFF);
	return 1;
}
