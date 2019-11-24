/*

VELYKU SISTEMA

- Kiekviena diena visi �aid�jai tur�s ie�koti kiau�ini� po visa SAN ANDREAS LOKACIJA
- Kas daugiausiai per diena surinks kiau�ini� �aid�jas gaus (random) �iuos dalykus:
  * Geltonus da�us
  * �alius da�us
  * Raktas (Restorano virtuv�s)
  * Raudonus da�us
  * Svogunu lak�tus
- �aid�jai negal�s �eiti � restorana virtuv�s jei netur�s rakto
- �aid�jas kai pagamins savo kiau�inius negal�s i� naujo ie�koti kiau�ini�
*/

#include YSI\y_hooks 

#define EGGS_MINUTE 12 //Kiek minu�i� rodys kiau�inius

#define DIALOG_EGGS_PRIZE 13474
#define DIALOG_LAKS_PRIZE 13475

//Margu�i� da�ymas spalvomis ir jo prizai
#define PRIZE_EGGS_MONEY 30000   
#define PRIZE_EGGS_XP    3000    
#define PRIZE_EGGS_CREDITS 300  

//Margu�i� da�ymas lak�tai ir jo prizai
#define PRIZE_LAKS_MONEY 15000  
#define PRIZE_LAKS_XP 1500     
#define PRIZE_LAKS_CREDITS 150 

#define INTERIOR_EASTER_POS 422.5524,175.8230,451.0172 //Restorano vidaus interjero kordinat�s
#define EXTERIOR_EASTER_POS -48.1717,1190.3926,19.3594 //Restorano i��jimo lauko kordinat�s

#define PICKUP_OPEN_POS -53.8980,1188.7440,19.3594     //Restorano lauko duru kordinat�s i�jimo
#define PICKUP_CLOSE_POS 423.4464,177.3150,451.6344    //Restorano vidaus duru kordinat�s i��jimo

#define INTERIOR_EASTER_ID 0                           //Restorano interjero ID

//Restoranas
new aprangak[MAX_PLAYERS] = 0;
new kriaukle[MAX_PLAYERS] = 0;
new puodai[MAX_PLAYERS] = 0;
new virykle[MAX_PLAYERS] = 0;
new dazok[MAX_PLAYERS] = 0;
new saldytuvas[MAX_PLAYERS] = 0;
new kriauklen[MAX_PLAYERS] = 0;
new viryklen[MAX_PLAYERS] = 0;
new dazon[MAX_PLAYERS] = 0;

new Float: egg_pos[30][3] = // 70 rei�kia kad bus tiek kiau�ini� kordina�i� 3 rei�kia kad stulpeliai
{
	//FC, EQ, LB kiau�iniai
    {-144.58577, 1227.04553, 23.38181},
    {-18.43033, 1178.34045, 27.79368},
    {-296.93738, 1069.83850, 18.83818},
    {21.34015, 1406.88477, 10.56554},
    {173.41646, 2660.12476, 15.57485},
    {-674.28400, 2705.77637, 72.38305},
    {-1675.79529, 2767.99512, 101.77502},
    {-1514.50940, 2567.08545, 54.97482},
    {-1062.63733, 1562.48828, 32.31022},
    {-735.27417, 1552.82898, 39.35623},
    //Sanfierro kiau�iniai
    {-1966.58984, 293.85056, 40.18473},
    {-1915.53687, 44.66727, 29.13373},
    {-2150.60083, -94.90697, 40.76889},
    {-2722.20435, -316.80829, 6.72081},
    {-2721.38867, 127.68074, 6.15418},
    {-2490.22559, 757.41656, 34.90984},
    {-2660.02295, 1420.01379, 25.04165},
    {-2980.36670, 1039.20386, 0.08769},
    {-2492.35205, 539.74841, 29.19169},
    {-2214.31763, 620.38959, 34.29010},
    {-1639.35596, 595.58936, 34.09085},
    {-1651.47412, 1203.21899, 20.29753},
    {-1499.67920, 1380.66089, 3.15751},
    {-1784.24023, 765.13898, 24.08570},
    {-1847.06140, -184.13530, 17.86172},
    {-1971.61377, -991.20667, 31.48126},
    {-1855.51611, -1603.22998, 20.99090},
    {-2225.38159, -2394.97363, 31.62094},
    {-1459.34387, -1566.31006, 101.86136},
    {-970.52045, -972.75964, 129.87685}
};

new egg_server[50][3]; //50 rei�kia kad tiek kiausini� sugeneruos //3 skai�ius rei�kia 0 ID 1 objektas 2 Tekstas

new res_pick = -1, res_pick_exit = -1;

forward load_eggs();
public load_eggs()
{
	new bool: blackeggPos[sizeof egg_pos];
	for(new i; i < sizeof egg_server; i++)
	{
		new index;
		do
		{
			index = random(sizeof egg_pos);
		}
		while(blackeggPos[index]);

		blackeggPos[index] = true;
		egg_server[i][0] = index;
		egg_server[i][1] = CreateDynamicObject(19344, egg_pos[index][0], egg_pos[index][1], egg_pos[index][2], 0.00000, 0.00000, 0.00000);
		egg_server[i][2] = _:CreateDynamic3DTextLabel("{ffff66}Velyk� kiau�inis\n{FFFFFF}Nor�dami paimti spauskite {ffff66}ALT {FFFFFF}klavi��", -1, egg_pos[index][0], egg_pos[index][1], egg_pos[index][2], 3.0);
        SetPlayerMapIcon(i, 80, egg_pos[egg_server[i][0]][0], egg_pos[egg_server[i][0]][1], egg_pos[egg_server[i][0]][2], 0, 946881535, MAPICON_GLOBAL);
	    SendClientMessage(i, BLUE, "{ffff66}� VELYKOS 2019 � {FFFFFF}Atsirado {ffff66}kiau�inis {FFFFFF}pa�ym�toje vietoje ({ffff66}MINI-MAP{FFFFFF}) skub�kite paimti.");
	}

}

hook OnGameModeInit()
{
	SetTimer("load_eggs", 1000*60*EGGS_MINUTE, true);

    res_pick = CreateDynamicPickup(19606, 1, PICKUP_OPEN_POS);
    res_pick_exit = CreateDynamicPickup(19606, 1, PICKUP_CLOSE_POS);

    //Restoranas (virtuv�)
    new tmpobjid;
    tmpobjid =     CreateDynamicObject(19510, 423.50000, 174.41745, 452.69690,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16150, "ufo_bar", "dinerfloor01_128", 0xFFFFFFFF);
    SetDynamicObjectMaterial(    tmpobjid, 2, 10932, "station_sfse", "ws_stationfloor", 0xFFFFFFFF);
    SetDynamicObjectMaterial(    tmpobjid, 1, 13066, "sw_fact01a", "Upt_Conc floorClean", 0xFFFFFFFF);
    CreateDynamicObject(1569, 423.37726, 168.69495, 449.97604,   0.00000, 0.00000, 0.00000);
    CreateDynamicObject(1569, 422.61624, 177.72325, 450.53577,   0.00000, 0.00000, 0.00000);
    tmpobjid =     CreateDynamicObject(19446, 416.59802, 177.77893, 451.31650,   0.00000, 0.00000, 90.00660, -1, -1, -1, 400.00, 400.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 3629, "arprtxxref_las", "grn_window2_16", 0xFFFFFFFF);
    tmpobjid =     CreateDynamicObject(19446, 424.21509, 175.60451, 449.49966,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 10932, "station_sfse", "ws_stationfloor", 0xFFFFFFFF);
    CreateDynamicObject(19916, 425.92218, 168.91882, 449.89859,   0.00000, 0.00000, 179.98680, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19930, 427.70667, 169.08261, 449.89859,   0.00000, 0.00000, 270.41751, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19931, 426.75262, 169.08429, 449.89859,   0.00000, 0.00000, 270.41751, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19929, 427.91159, 174.35989, 449.91370,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19927, 427.87769, 171.99849, 449.91370,   0.00000, 0.00000, -360.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19923, 428.14319, 176.67490, 449.85391,   0.00000, 0.00000, -89.46370, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19924, 428.19150, 176.63901, 453.02286,   0.00000, 0.00000, -0.49670, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 424.15948, 176.00740, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 424.15948, 174.05940, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 424.15948, 172.11140, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 421.72449, 172.11140, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 421.72449, 174.05940, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 421.72449, 176.49440, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 426.59451, 176.00740, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 426.59451, 174.05940, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 426.59451, 172.11140, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 419.77649, 176.49440, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 419.77649, 173.57240, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19883, 419.77649, 171.62440, 453.33051,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(2505, 428.14828, 170.38319, 451.32590,   0.00000, 0.00000, -91.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(2505, 428.14828, 169.89619, 451.32590,   0.00000, 0.00000, -91.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(2027, 420.45441, 176.01961, 450.56161,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(2027, 420.45441, 170.17560, 450.56161,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(2027, 420.45441, 173.09760, 450.56161,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(1984, 424.80890, 173.11169, 449.83301,   0.00000, 0.00000, -269.96701);
    tmpobjid =     CreateDynamicObject(19446, 430.23401, 177.77890, 451.31650,   0.00000, 0.00000, 90.00660, -1, -1, -1, 400.00, 400.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 3629, "arprtxxref_las", "grn_window2_16", 0xFFFFFFFF);
    tmpobjid =     CreateDynamicObject(19446, 418.59308, 168.63641, 451.31650,   0.00000, 0.00000, 90.00660, -1, -1, -1, 400.00, 400.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 3629, "arprtxxref_las", "grn_window2_16", 0xFFFFFFFF);
    tmpobjid =     CreateDynamicObject(4735, 418.80948, 173.34009, 452.18851,   0.00000, 0.00000, -178.45050, -1, -1, -1, 400.00, 400.00);
    SetDynamicObjectMaterialText(    tmpobjid, 0, "{ffffff}Restoranas", 120, "Ariel", 35, 1, 0xFF153F49, 0x00000000, 1);
    CreateDynamicObject(19584, 427.73279, 174.19330, 450.96689,   0.00000, 0.00000, 47.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19585, 427.74673, 173.78693, 451.00641,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19585, 427.74670, 175.73489, 451.00641,   0.00000, 0.00000, 0.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19584, 427.73279, 175.16730, 450.96689,   0.00000, 0.00000, 47.00000, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19566, 428.30170, 174.89452, 451.43430,   -0.02640, 0.42410, 87.92080, -1, -1, -1, 400.00, 400.00);
    CreateDynamicObject(19565, 428.28351, 173.91220, 451.43430,   -0.02640, 0.42410, 87.92080, -1, -1, -1, 400.00, 400.00);

    //Restorano virtuv�
    Create3DTextLabel("{ffff66}Vyr�jo apranga\n{ffffff}Nor�dami prad�ti pasiimkite aprang� paspaude �{ffff66}N{ffffff}� klavi��", 0xAAAAFFFF, 424.0667,169.1118,451.0172, 5, 0, 1);
    Create3DTextLabel("{ffff66}�aldytuvas\n{ffffff}Nor�dami pad�ti kiau�inius spauskite �{ffff66}N{ffffff}� klavi��", 0xAAAAFFFF, 425.9021,169.7773,451.0244, 5, 0, 1);
    Create3DTextLabel("{ffff66}Stalas\n{ffffff}Nor�dami nuda�yti kiau�inius spauskite �{ffff66}N{ffffff}� klavi��", 0xAAAAFFFF, 427.1109,169.8761,451.0244, 5, 0, 1);
    Create3DTextLabel("{ffff66}Kriaukl�\n{ffffff}Nor�dami nuplauti kiau�inius spauskite �{ffff66}N{ffffff}� klavi��", 0xAAAAFFFF, 427.0902,171.8937,451.0172, 5, 0, 1);
    Create3DTextLabel("{ffff66}Puodas\n{ffffff}Nor�dami pad�ti kiau�inius spauskite �{ffff66}N{ffffff}� klavi��", 0xAAAAFFFF, 427.1313,174.1862,451.0172, 5, 0, 1);
    Create3DTextLabel("{ffff66}Virykl�\n{ffffff}Nor�dami pad�ti kiau�inius spauskite �{ffff66}N{ffffff}� klavi��", 0xAAAAFFFF, 427.0517,176.6549,451.0172, 5, 0, 1);

	return 1;
}

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{
	if(pickupid == res_pick)
	{
		SetPlayerPos(playerid, INTERIOR_EASTER_POS);
	}
	if(pickupid == res_pick_exit)
	{
		SetPlayerPos(playerid, EXTERIOR_EASTER_POS);
		SetPlayerInterior(playerid, INTERIOR_EASTER_ID);
        aprangak[playerid] = 0;
        SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_EGGS_PRIZE)
	{
		if(!response)
		{
			ShowPlayerDialogEx(playerid, DIALOG_EGGS_PRIZE, DIALOG_STYLE_LIST, "{FFFFFF}Velykiniai prizai ({ffff66}2019{FFFFFF})", "{ffff66}� {FFFFFF}"#PRIZE_EGGS_CREDITS" {ffff66}kredit�\n{ffff66}� {FFFFFF}"#PRIZE_EGGS_MONEY" {ffff66}�\n{ffff66}� {FFFFFF}"#PRIZE_EGGS_XP" {ffff66}XP", "Atsiimti","At�aukti");
		}
		if(response)
		{
			if(listitem == 0)
			{
               zInfo[playerid][kreditai] += PRIZE_EGGS_CREDITS;
               SendClientMessage(playerid, -1, "{ffff66}� EVENT PRIZE � {FFFFFF}U� margu�i� �vykdym� gavote {ffff66}"#PRIZE_EGGS_CREDITS" {FFFFFF}kredit�");
               zInfo[playerid][total_eggs] = 0;
               zInfo[playerid][color_egg] = 0;
			}
			if(listitem == 1)
			{
			   GivePlayerMoneyA(playerid, PRIZE_EGGS_MONEY);
			   SendClientMessage(playerid, -1, "{ffff66}� EVENT PRIZE � {FFFFFF}U� margu�i� �vykdym� gavote {ffff66}"#PRIZE_EGGS_MONEY" {FFFFFF}�");	
			   zInfo[playerid][total_eggs] = 0;
               zInfo[playerid][color_egg] = 0;
			}
			if(listitem == 2)
			{
               SetPlayerScore(playerid, GetPlayerScore(playerid) + PRIZE_EGGS_XP); 
               SendClientMessage(playerid, -1, "{ffff66}� EVENT PRIZE � {FFFFFF}U� margu�i� �vykdym� gavote {ffff66}"#PRIZE_EGGS_XP" {FFFFFF}XP");
               zInfo[playerid][total_eggs] = 0; 
               zInfo[playerid][color_egg] = 0;
			}
		}
	}
	if(dialogid == DIALOG_LAKS_PRIZE)
	{
		if(!response)
		{
			ShowPlayerDialogEx(playerid, DIALOG_EGGS_PRIZE, DIALOG_STYLE_LIST, "{FFFFFF}Velykiniai prizai ({ffff66}2019{FFFFFF})", "{ffff66}� {FFFFFF}"#PRIZE_LAKS_CREDITS" {ffff66}kredit�\n{ffff66}� {FFFFFF}"#PRIZE_LAKS_MONEY" {ffff66}�\n{ffff66}� {FFFFFF}"#PRIZE_LAKS_XP" {ffff66}XP", "Atsiimti","At�aukti");
		}
		if(response)
		{
			if(listitem == 0)
			{
               zInfo[playerid][kreditai] += PRIZE_LAKS_CREDITS;
               SendClientMessage(playerid, -1, "{ffff66}� EVENT PRIZE � {FFFFFF}U� margu�i� �vykdym� gavote {ffff66}"#PRIZE_LAKS_CREDITS" {FFFFFF}kredit�");
               zInfo[playerid][total_eggs] = 0;
               zInfo[playerid][color_egg] = 0;
			}
			if(listitem == 1)
			{
			   GivePlayerMoneyA(playerid, PRIZE_LAKS_MONEY);
			   SendClientMessage(playerid, -1, "{ffff66}� EVENT PRIZE � {FFFFFF}U� margu�i� �vykdym� gavote {ffff66}"#PRIZE_LAKS_MONEY" {FFFFFF}�");	
			   zInfo[playerid][total_eggs] = 0;
               zInfo[playerid][color_egg] = 0;
			}
			if(listitem == 2)
			{
               SetPlayerScore(playerid, GetPlayerScore(playerid) + PRIZE_LAKS_XP); 
               SendClientMessage(playerid, -1, "{ffff66}� EVENT PRIZE � {FFFFFF}U� margu�i� �vykdym� gavote {ffff66}"#PRIZE_LAKS_XP" {FFFFFF}XP");
               zInfo[playerid][total_eggs] = 0; 
               zInfo[playerid][color_egg] = 0;
			}
		}
	}
	return 1;
}

CMD:eastrand(playerid, param[])
{
	if(zInfo[playerid][admin] < 5) return 0;
	new e = strval(param);
    SetPlayerMapIcon(playerid, 80, egg_pos[egg_server[e][0]][0], egg_pos[egg_server[e][0]][1], egg_pos[egg_server[e][0]][2], 0, 946881535, MAPICON_GLOBAL);
	SendClientMessage(playerid, BLUE, "{ffff66}� VELYKOS 2019 � {FFFFFF}Atsirado {ffff66}kiau�inis {FFFFFF}pa�ym�toje vietoje ({ffff66}MINI-MAP{FFFFFF}) skub�kite paimti.");
	return 1;
}

CMD:velykos(playerid)
{
	new str[1625+1];
	format(str, sizeof(str), "%s{FFFFFF}Labas {99cc66}%s{FFFFFF}, nor��iau pasveikinti jus su art�jan�iomis {99cc66}�v. Velykomis {FFFFFF}bei turiu jums siurpriz�. \nPo visa SAN", str, GetPlayerNameEx(playerid));
	format(str, sizeof(str), "%s ANDREAS {99cc66}�em�lapio teritorija {FFFFFF}yra i�m�tyti {99cc66}70 {FFFFFF}kiau�ini�. Kiekvienas �aid�jas turi surinkti kuo daugiau kiau�ini�,\nkad {99cc66}atsidurtu {FFFFFF}TOP dienos var�ybose.", str);
	format(str, sizeof(str), "%sI� var�yb� yra paskelbiamas {99cc66}vienas nugal�tojas {FFFFFF}ir jis gauna ({99cc66}random{FFFFFF}) �iuos daiktus:\n \n{99cc66}� {FFFFFF}geltonus da�us\n{99cc66}� {FFFFFF}�alius da�us\n{99cc66}� {FFFFFF}raudonus d", str);
	format(str, sizeof(str), "%sa�us\n{99cc66}� {FFFFFF}svog�n� lak�tus\n{99cc66}� {FFFFFF}restorano raktas\n \n{FFFFFF}Kaip {99cc66}gauti {FFFFFF}kiau�inius?\n \nKiekviena dien� kas {99cc66}12 minu�i� {FFFFFF}atsiras serveryje {9", str);
	format(str, sizeof(str), "%s9cc66}MINI-MAP {FFFFFF}kiau�inio lokacija.\n�aid�jai {99cc66}tur�s {FFFFFF}skub�ti kuo grei�iau � bet kur� {FFFFFF}SAN ANDREAS {99cc66}vieta {FFFFFF}paimti kiau�in�.\nKas pirmas paims tas ir {99cc66}g", str);
	format(str, sizeof(str), "%saus kiau�in�{FFFFFF}, o kas nesp�s tur�s laukti v�l lokacijos u� {99cc66}12 minu�i�{FFFFFF}.\n \n{ff6666}Be �i� daikt� j�s nieko padaryti virtuv�je negal�site. Kaip sakoma kiekvienas �aid�jas tur�s kovoti\nd�l", str); 
	format(str, sizeof(str), "%s pirmos TOP dienos var�yb� vietos, kad patektu 2019.04.21 � restorano virtuv� j� rasite /gps > Restoranas\nIki 2019.04.21 galite ie�koti kiau�ini�, o paskui tie kurie paims TOP dienos var�ybas tur�s ei", str);
	format(str, sizeof(str), "%sti � virtuve.\nKiekvien� dien� 00:00 kiau�iniai anuliuojasi, bet i� random daikt� tik vien� daikt� gaus per dien� nugal�tojas.\nNorint pagaminti kiau�inius jums reik�s virtuv�s rak", str);
	format(str, sizeof(str), "%sto ir (geltonos, �alios, raudonos) spalvos da�us arba svog�n� lak�tus.", str);
	ShowPlayerDialogEx(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "{99cc66}VELYKOS 2019", str ,"Supratau","");
	return 1;
}


hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_WALK)
	{
		if(IsPlayerInAnyVehicle(playerid)) return 1;

		for(new i; i < sizeof egg_server; i++)
		{
			if(egg_server[i][1] == INVALID_OBJECT_ID) return 1;

			if(IsPlayerInRangeOfPoint(playerid, 2.0, egg_pos[egg_server[i][0]][0], egg_pos[egg_server[i][0]][1], egg_pos[egg_server[i][0]][2]))
			{
				zInfo[playerid][eggs] ++;
				zInfo[playerid][total_eggs] ++;
				new eq[95];
				format(eq, sizeof eq, "UPDATE zaidejai SET vienkiausiniu = '%d', visokiausiniu = '%d WHERE vardas = '%s'", zInfo[playerid][eggs], zInfo[playerid][total_eggs], GetPlayerNameEx(playerid));
				mysql_query(eq);
                
                format(eq, sizeof eq, "{ffff66}� {FFFFFF}J�s radote {ffff66}kiau�in�{FFFFFF}, dabar viso turite: {ffff66}%d", zInfo[playerid][eggs]);
                SendClientMessage(playerid, YELLOW, eq);

                DestroyDynamicObject(egg_server[i][1]);
                DestroyDynamic3DTextLabel(Text3D:egg_server[i][2]);

                egg_server[i][1] = INVALID_OBJECT_ID;
                egg_server[i][2] = INVALID_3DTEXT_ID;

                RemovePlayerMapIcon(playerid, 80);

                break;

			}
		}
	}
 
    if(newkeys & KEY_NO)
    {
    	load_eggs_key(playerid);
    }
	return 1;
}

stock top_eggs(playerid)
{
    new str[120], v;

    mysql_query("SELECT vardas, vienkiausiniu FROM zaidejai WHERE vienkiausiniu > 0 AND WHERE Admin != '5' ORDER BY vienkiausiniu DESC LIMIT 5");
    mysql_store_result();

    if(!mysql_num_rows())
    {
        ErrorMsg(playerid, "Dar niekas nerinko kiau�ini�!");
        mysql_free_result();
        return 1;
    }

    while(mysql_retrieve_row())
    {
        v ++;
        new egg_name[MAX_PLAYER_NAME], egg_count;
        mysql_fetch_field_row(egg_name, "vardas");
        mysql_fetch_field_row(egg_name, "vienkiausiniu");
        egg_count = strval(egg_name);
        format(str, 120, "{ffff66}%d {FFFFFF}vt. {ffff66}%s {FFFFFF}turi {ffff66}%d {FFFFFF}dienos kiau�ini�\n", v, egg_name, egg_count);
    }
    ShowPlayerDialogEx(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "Dienos TOP 5 kiau�iniai", str, "Supratau", "");
    mysql_free_result();
    return 1;
}

stock reset_eggs_winner()
{
    new v, str[200], query[300];
    mysql_query("SELECT * FROM zaidejai WHERE Admin != '5' ORDER BY vienkiausiniu DESC LIMIT 1");
    mysql_store_result();
    while(mysql_retrieve_row())
    {
        new egg_name[MAX_PLAYER_NAME], egg_count;
        mysql_fetch_field_row(egg_name, "vardas");
        mysql_fetch_field_row(egg_name, "vienkiausiniu");
        egg_count = strval(egg_name);
        format(str, 200, "{ffff66}� {FFFFFF}Dienos kiau�ini� var�ybas laim�jo %s ir jis surinko %d kiau�ini� per dien�", egg_name, egg_count);
        SendClientMessageToAll(-1, str);
        mysql_query("UPDATE zaidejai SET vienkiausiniu = '0'");

        new easter_rand = random(5);
        switch(easter_rand)
        {
            case 0: format(query, sizeof(query), "UPDATE zaidejai SET EastUnlock = '1' WHERE vardas = '%s'", egg_name), mysql_query(query), SendClientMessage(egg_name, "{ffff66}� WINNER PRIZE � {FFFFFF}Gavote restorano virtuv�s rakt�");
            case 1: format(query, sizeof(query), "UPDATE zaidejai SET ColorEgg = '1' WHERE vardas = '%s'", egg_name), mysql_query(query), SendClientMessage(egg_name, "{ffff66}� WINNER PRIZE � {FFFFFF}Gavote geltonus da�us");
            case 2: format(query, sizeof(query), "UPDATE zaidejai SET ColorEgg = '2' WHERE vardas = '%s'", egg_name), mysql_query(query), SendClientMessage(egg_name, "{ffff66}� WINNER PRIZE � {FFFFFF}Gavote �alius da�us");
            case 3: format(query, sizeof(query), "UPDATE zaidejai SET ColorEgg = '3' WHERE vardas = '%s'", egg_name), mysql_query(query), SendClientMessage(egg_name, "{ffff66}� WINNER PRIZE � {FFFFFF}Gavote raudonus da�us");
            case 4: format(query, sizeof(query), "UPDATE zaidejai SET ColorEgg = '4' WHERE vardas = '%s'", egg_name), mysql_query(query), SendClientMessage(egg_name, "{ffff66}� WINNER PRIZE � {FFFFFF}Gavote svogunu lak�tus");
        }
    }
    return 1;
}

stock load_eggs_key(playerid)
{
	    if(IsPlayerInRangeOfPoint(playerid, 1.0, 424.0667,169.1118,451.0172)) //Apranga
        {
			if(aprangak[playerid] >= 1) return TDtext(playerid, "~r~Jus jau apsirenge sia apranga!");
			if(zInfo[playerid][color_egg] < 3 && zInfo[playerid][color_egg] < 4) return TDtext(playerid, "~r~Neturite geltonu zaliu raudonu dazu arba svogunu lakstu!");
			else if(zInfo[playerid][lytis] == 1)
			{
			   SetPlayerSkin(playerid, 205);
			   aprangak[playerid] = 1;
			}
			else
			{
			   SetPlayerSkin(playerid, 209);
			   aprangak[playerid] = 1;
			} 
			new str[499+1];
			format(str, sizeof(str), "%s{ffffff}Labas {ffff66}%s, {FFFFFF}atvyk�s(-us�) � {ffff66}restorano virtuv� {ffffff}j�s tur�site nuplauti{FFFFFF} i�virti nuda�yti \nkiau�inius{F", str, GetPlayerNameEx(playerid));
			format(str, sizeof(str), "%sFFFFF} ir pad�ti juos � {ffff66}�aldytuv�{FFFFFF}. U� atlikta u�duot� j�s gausite {ffff66}pasirinkti {FFFFFF}�iuos \nprizus:\n\n{ffff66}� {FFFFFF}Patirties ta�kai\n{ffff66}� {FFFFFF}Serverio pinigai\n", str);
			format(str, sizeof(str), "%s{ffff66}� {FFFFFF}Kreditai \n \n{ffffff}Tai pat gavote �{ffff66}vyr�jo(-os){ffffff}� drabu�ius", str);
			ShowPlayerDialogEx(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "{ffff66}Informacija", str, "Supratau","");

        }
        else if(IsPlayerInRangeOfPoint(playerid, 1.0, 425.9021,169.7773,451.0244)) //�aldytuvas
        {
            if(saldytuvas[playerid] >= 1) return TDtext(playerid, "~r~Jus jau padejote margucius i saldytuva!");
            if(dazon[playerid] != 1) return TDtext(playerid, "~r~Jus neturite nudazytu marguciu!");
            if(aprangak[playerid] != 1) return TDtext(playerid, "~r~Jus neturite vyrejo(-os) aprangos!");
            else if(zInfo[playerid][color_egg] == 3)
            {
               new str[100];
               format(str, sizeof(str), "{ffff66}� EVENT FINISH � {FFFFFF}Pad�jote � �aldytuv� {ffff66}%d {FFFFFF}nuda�yt� spalvot� margu�i�", floatround(zInfo[playerid][total_eggs] * 0.80));	
               SendClientMessage(playerid, -1, str);

               ShowPlayerDialogEx(playerid, DIALOG_EGGS_PRIZE, DIALOG_STYLE_LIST, "{FFFFFF}Velykiniai prizai ({ffff66}2019{FFFFFF})", "{ffff66}� {FFFFFF}"#PRIZE_EGGS_CREDITS" {ffff66}kredit�\n{ffff66}� {FFFFFF}"#PRIZE_EGGS_MONEY" {ffff66}�\n{ffff66}� {FFFFFF}"#PRIZE_EGGS_XP" {ffff66}XP", "Atsiimti","At�aukti");

               saldytuvas[playerid] = 1;
			}
			else if(zInfo[playerid][color_egg] == 4)
            {
               new str[100];
               format(str, sizeof(str), "{ffff66}� EVENT FINISH � {FFFFFF}Pad�jote � �aldytuv� {ffff66}%d {FFFFFF}nuda�yt� margu�i� lak�tais", floatround(zInfo[playerid][total_eggs] * 0.80));	
               SendClientMessage(playerid, -1, str);	
               
               ShowPlayerDialogEx(playerid, DIALOG_LAKS_PRIZE, DIALOG_STYLE_LIST, "{FFFFFF}Velykiniai prizai ({ffff66}2019{FFFFFF})", "{ffff66}� {FFFFFF}"#PRIZE_LAKS_CREDITS" {ffff66}kredit�\n{ffff66}� {FFFFFF}"#PRIZE_LAKS_MONEY" {ffff66}�\n{ffff66}� {FFFFFF}"#PRIZE_LAKS_XP" {ffff66}XP", "Atsiimti","At�aukti");
			   
			   saldytuvas[playerid] = 1;
			}
			else if(zInfo[playerid][color_egg] > 4)
            {
               new str[100];
               format(str, sizeof(str), "{ffff66}� EVENT FINISH � {FFFFFF}Pad�jote � �aldytuv� {ffff66}%d {FFFFFF}nuda�yt� spalvot� margu�i�", floatround(zInfo[playerid][total_eggs] * 0.80));	
               SendClientMessage(playerid, -1, str);

               ShowPlayerDialogEx(playerid, DIALOG_EGGS_PRIZE, DIALOG_STYLE_LIST, "{FFFFFF}Velykiniai prizai ({ffff66}2019{FFFFFF})", "{ffff66}� {FFFFFF}"#PRIZE_EGGS_CREDITS" {ffff66}kredit�\n{ffff66}� {FFFFFF}"#PRIZE_EGGS_MONEY" {ffff66}�\n{ffff66}� {FFFFFF}"#PRIZE_EGGS_XP" {ffff66}XP", "Atsiimti","At�aukti");

               saldytuvas[playerid] = 1;
			}
			kriauklen[playerid] = 0;
			viryklen[playerid] = 0;
			dazon[playerid] = 0;
			puodai[playerid] = 0;
			//aprangak[playerid] = 0;
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1.0, 427.1109,169.8761,451.0244)) //Da�yti kiau�inius
        {
            if(dazok[playerid] >= 1) return TDtext(playerid, "~r~Margucio dazymas truks 1 min!");
            if(dazon[playerid] >= 1) return TDtext(playerid, "~r~Marguciai jau dazyti!");
            if(viryklen[playerid] != 1) return TDtext(playerid, "~r~Kiausiniai nera isvirti!");
            if(kriauklen[playerid] != 1) return TDtext(playerid, "~r~Kiausiniai nera nuplauti!");
            if(aprangak[playerid] != 1) return TDtext(playerid, "~r~Jus neturite vyrejo(-os) aprangos!");
            if(!zInfo[playerid][total_eggs]) return TDtext(playerid, "~r~Neturite kiausiniu puode!");
            SetTimerEx("DazoKiausinius",60000*1, false,"i",playerid);
            //SetTimerEx("DazoKiausinius", 1*60000, false, "i",playerid);
            cD_StartBar(playerid, "DAZOTE MARGUTI...", 1000*60);
            TogglePlayerControllable(playerid, false);
            dazok[playerid] = 1;
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1.0, 427.0902,171.8937,451.0172)) //Nuplauti kiau�inius
        {
            if(kriaukle[playerid] >= 1) return TDtext(playerid, "~r~Kiausiniu plovimas truks 1 min!");
            if(puodai[playerid] != 1) return TDtext(playerid, "~r~Jus nepasiemete puodo!");
            if(kriauklen[playerid] >= 1) return TDtext(playerid, "~r~Kiausiniai jau nuplauti!");
            if(aprangak[playerid] != 1) return TDtext(playerid, "~r~Jus neturite vyrejo(-os) aprangos!");
            if(!zInfo[playerid][total_eggs]) return TDtext(playerid, "~r~Neturite kiausiniu!");
            SetTimerEx("PlaunaKiausinius",60000*1, false,"i",playerid);
            //SetTimerEx("PlaunaKiausinius1", 1*60000, false, "i",playerid);
            cD_StartBar(playerid, "PLAUNATE KIAUSINIUS...", 1000*60);
            TogglePlayerControllable(playerid, false);
            kriaukle[playerid] = 1;

        }
        else if(IsPlayerInRangeOfPoint(playerid, 1.0, 427.1313,174.1862,451.0172)) //Puodas
        {
            if(aprangak[playerid] != 1) return TDtext(playerid, "~r~Jus neturite vyrejo(-os) aprangos!");
            if(!zInfo[playerid][total_eggs]) return TDtext(playerid, "~r~Neturite kiausiniu!");
            if(puodai[playerid] >= 1) return TDtext(playerid, "~r~Jus jau pasiemete puoda!");
            TDtext(playerid, "~y~Paemei puoda");
			puodai[playerid] = 1;
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1.0, 427.0517,176.6549,451.0172)) //Vyrikl�
        {
            if(virykle[playerid] >= 1) return TDtext(playerid, "~r~Kiausiniu virymas truks 1 min!");
            if(!zInfo[playerid][total_eggs]) return TDtext(playerid, "~r~Neturite kiausiniu puode!");
            if(puodai[playerid] != 1) return TDtext(playerid, "~r~Jus nepasiemete puodo!");
            if(kriauklen[playerid] != 1) return TDtext(playerid, "~r~Kiausiniai nera nuplauti!");
            if(viryklen[playerid] >= 1) return TDtext(playerid, "~r~Kiausiniai jau isvirti!");
            if(aprangak[playerid] != 1) return TDtext(playerid, "~r~Jus neturite vyrejo(-os) aprangos!");
            SetTimerEx("VerdaKiausinius",60000*1, false,"i",playerid);
            //SetTimerEx("VerdaKiausinius1",1*60000, false, "i",playerid);
            cD_StartBar(playerid, "VERDATE KIAUSINIUS...", 1000*60);
            TogglePlayerControllable(playerid, false);
			virykle[playerid] = 1;
        }
	    return 1;
}

//Kiau�iniai
/*forward PlaunaKiausinius1(playerid);
public PlaunaKiausinius1(playerid)
{
    kriaukle[playerid] = 0;
    kriauklen[playerid] = 1;
    return 1;
}*/
forward PlaunaKiausinius(playerid);
public PlaunaKiausinius(playerid)
{
	TDtext(playerid, "~y~Nuplovete ~y~kiausinius");
    TogglePlayerControllable(playerid, true);
    kriaukle[playerid] = 0;
    kriauklen[playerid] = 1;
	return 1;
}
/*forward VerdaKiausinius1(playerid);
public VerdaKiausinius1(playerid)
{
    virykle[playerid] = 0;
    viryklen[playerid] = 1;
	return 1;
}*/
forward VerdaKiausinius(playerid);
public VerdaKiausinius(playerid)
{
	TDtext(playerid, "~y~Isvirei ~y~kiausinius");
    
    TogglePlayerControllable(playerid, true);
    virykle[playerid] = 0;
    viryklen[playerid] = 1;
    return 1;
}
/*forward DazoKiausinius1(playerid);
public DazoKiausinius1(playerid)
{
    dazok[playerid] = 0;
    dazon[playerid] = 1;
	return 1;
}*/
forward DazoKiausinius(playerid);
public DazoKiausinius(playerid)
{
    TDtext(playerid, "~y~Nudazei ~y~kiausinius");
    TogglePlayerControllable(playerid, true);
    dazok[playerid] = 0;
    dazon[playerid] = 1;
	return 1;
}