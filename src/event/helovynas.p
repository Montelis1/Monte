/*

Helovyno sistema

- Padaryti kad kaþkiek valandø atsirastø 3 klounai SF ar FC mieste
- Padaryti kad nuðovus 3 klounus atsirastu moliugas
- Padaryti kad moliuga reikëtu iðlupti su peiliu ir ið ten pasiimsite nedaug random (XP, Eur, Kreditø)
- Padaryti kad peilá galëtø nusipirkti kioske
- Padaryti kad visame serveryje bûtø naktis kur yra helovyno sistema

*/

#include YSI\y_hooks

new halloCloun[3];


hook OnGameModeInit()
{
	halloCloun[0] = CreateDynamicActor(264,-2641995.6028,289.3254,33.9862,85.5701, 0, 100.0, halloCloun[0], 0, -1, STREAMER_ACTOR_SD, -1, 0); // klounas 1
    halloCloun[1] = CreateDynamicActor(264,-2013.8672,308.6890,35.1101,207.3110, 0, 100.0, halloCloun[1], 0, -1, STREAMER_ACTOR_SD, -1, 0); // klounas 2
    halloCloun[2] = CreateDynamicActor(264,-2003.9967,339.3001,35.0156,172.7371, 0, 100.0, halloCloun[2], 0, -1, STREAMER_ACTOR_SD, -1, 0); // klounas 3
	
	return 1;
}

CMD:hall(playerid)
{
	//SetPlayerPos(playerid, -2641995.6028,289.3254,33.9862);
	GivePlayerWeapon(playerid, 24, 1000);
	SendClientMessage(playerid, -1, "Nusikëlete prie klouno!");
	return 1;
}

hook OnPlayerGiveDamageDynActor(playerid, STREAMER_TAG_ACTOR actorid, Float:amount, weaponid, bodypart)
{
	if(IsValidDynamicActor(STREAMER_TAG_ACTOR actorid) && GetPlayerWeapon(playerid) != 0)
	if(actorid != INVALID_ACTOR_ID)
	{	
	   if(actorid == halloCloun[1])
	   {	
		     TDtext(playerid, "Pataikei i klouna");
             new Float:health;
             GetDynamicActorHealth(halloCloun[1], health);
             SetDynamicActorHealth(halloCloun[1], health - amount);
	   }
	   if(actorid == halloCloun[2])
	   {	
		     TDtext(playerid, "Pataikei i klouna");
		     new Float:health;
             GetDynamicActorHealth(halloCloun[1], health);
             SetDynamicActorHealth(halloCloun[1], health - amount);
	   }
	}   	
	return 1;
}

/*hook OnPlayerUpdate(playerid) 
{
	new actorid = GetPlayerTargetDynamicActor(playerid);
	if(actorid == INVALID_ACTOR_ID) return 1;
    if(IsValidDynamicActor(STREAMER_TAG_ACTOR actorid) && GetPlayerWeapon(playerid) != 0)
    if(actorid == halloCloun[0])
    {
       	  TDtext(playerid, "Pataikei i klouna");	
    }
    if(actorid == halloCloun[1])
    {
       	  TDtext(playerid, "Pataikei i klouna");	
    }
    if(actorid == halloCloun[2])
    {
       	  TDtext(playerid, "Pataikei i klouna");	
    }	

    new Float:halloClounHP[3];
    GetDynamicActorHealth(STREAMER_TAG_ACTOR halloCloun[0], halloClounHP[0]); 
    GetDynamicActorHealth(STREAMER_TAG_ACTOR halloCloun[1], halloClounHP[1]);
    GetDynamicActorHealth(STREAMER_TAG_ACTOR halloCloun[2], halloClounHP[2]);

    if(halloClounHP[0] <= 0)
    {
    	DestroyDynamicActor(STREAMER_TAG_ACTOR halloCloun[0]);
    }

    if(halloClounHP[1] <= 0)
    {
    	DestroyDynamicActor(STREAMER_TAG_ACTOR halloCloun[1]);
    }

    if(halloClounHP[2] <= 0)
    {
    	DestroyDynamicActor(STREAMER_TAG_ACTOR halloCloun[2]);
    }	


	return 1;
}*/

CMD:stats(playerid, params[])
{
	new str[300];
	new Float:halloClounHP[3];
    GetDynamicActorHealth(STREAMER_TAG_ACTOR halloCloun[0], halloClounHP[0]); 
    GetDynamicActorHealth(STREAMER_TAG_ACTOR halloCloun[1], halloClounHP[1]);
    GetDynamicActorHealth(STREAMER_TAG_ACTOR halloCloun[2], halloClounHP[2]);
	format(str, sizeof(str), "1 ID = %.0f HP\n2 ID = %.0f HP\n3 ID = %.0f HP", halloClounHP[0], halloClounHP[1], halloClounHP[2]);
	ShowPlayerDialogEx(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "Statistika", str, "Supratau", "");
	return 1;
}

CMD:helovynas(playerid, params[])
{
    new str[402+1];

    format(str, sizeof(str), "%s{FFFFFF}Tavo draugas vardu {ff0000}Johnson {FFFFFF}yra pagrobtas klounø invazijos. \nJis yra laikomaspaslaptingoje {ff0000}saloje {FFFFFF}pozicija ðiuo me", str);
    format(str, sizeof(str), "%stø neþinoma.\n Kad iðgelbëtum savo {ff0000}draugà {FFFFFF}tau reikia susirinkti {ff0000}20 {FFFFFF} iðmëtytus moliûgus po visa {ff0000}San Andreas {FFFFFF}teritorija, kad {ff0000}atsirakintu {FFFFFF}", str);
    format(str, sizeof(str), "%suþduotis {ff0000}apie {FFFFFF}paslaptingà salà.", str);

    ShowPlayerDialogEx(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "{FFFFFF}Helovynas 2018 ", str, "Vykdyti", "Atðaukti");
	return 1;
}