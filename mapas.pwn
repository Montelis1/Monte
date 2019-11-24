// This is a comment
// uncomment the line below if you want to write a filterscript
//#define FILTERSCRIPT

#include <a_samp>
#include <a_npc>
//#include <zcmd>
#include <sscanf>
#include <streamer>
//#include <progress>
main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}


//new Text:TDEditor_TD[7];
//new PlayerText:TDEditor_PTD[MAX_PLAYERS][20];
//oranzine sancarson 0xFF6F28FF
public OnGameModeInit()
{
SetGameModeText("Blank Script");
new scGame;
scGame = CreateDynamicObject(12946, -859.15887, 1527.22681, 20.33068,   0.00000, 0.00000, -179.52119);
SetDynamicObjectMaterial(scGame, 0,  8849, "vgeretail1", "alleywallyell", 0xFFFFFFFF);
CreateDynamicObject(970, -851.88428, 1539.61438, 22.06020,   0.00000, 0.00000, -2.28780);
CreateDynamicObject(970, -852.71808, 1546.28125, 22.59310,   0.00000, 0.00000, -0.38130);
CreateDynamicObject(1294, -850.75067, 1545.24463, 26.29700,   0.00000, 0.00000, 62.00000);
CreateDynamicObject(970, -866.88507, 1539.65430, 22.06020,   0.00000, 0.00000, -0.38130);
CreateDynamicObject(1294, -864.53577, 1540.97095, 26.06225,   0.00000, 0.00000, -90.86340);
CreateDynamicObject(970, -853.37231, 1564.40271, 24.09310,   0.00000, 0.00000, -0.38130);
CreateDynamicObject(970, -866.94720, 1571.11389, 24.66050,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(970, -858.94720, 1571.11389, 24.66050,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(1294, -850.12817, 1565.35815, 27.71721,   0.00000, 0.00000, -118.71950);
CreateDynamicObject(1294, -862.93451, 1569.80591, 28.52632,   0.00000, 0.00000, -268.29510);
CreateDynamicObject(761, -852.25317, 1552.13794, 22.86459,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(761, -852.75317, 1560.13794, 23.31265,   0.00000, 0.00000, 0.00000);
CreateDynamicObject(761, -852.25317, 1556.13794, 23.09290,   0.00000, 0.00000, 0.00000);
return 1;

}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
RemoveBuildingForPlayer(playerid, 11469, -861.7578, 1525.7500, 21.5859, 0.25);
RemoveBuildingForPlayer(playerid, 11470, -860.3828, 1526.5625, 30.4609, 0.25);
RemoveBuildingForPlayer(playerid, 649, -853.1484, 1550.7578, 22.4297, 0.25);
//inv(playerid);
return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
  return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/map", cmdtext, true, 10) == 0)
	{
		SetPlayerPos(playerid, -862.93451, 1569.80591, 28.52632);
		SetPlayerInterior(playerid, 0);
	    SetPlayerVirtualWorld(playerid, 0);
		//for(new ptkk = 0; ptkk < 20; ptkk++) PlayerTextDrawShow(playerid, TDEditor_PTD[playerid][ptkk]);
        //for(new ptk = 0; ptk < 10; ptk++) TextDrawShowForPlayer(playerid, TDEditor_TDMedicBuy[ptk]);
        //SelectTextDraw(playerid, 0xFF6F28FF);
		//new Float:degalai, Float:bukle;
        //bukle = (621.7 + (100 * 0.0915));
        //degalai = (605.3 + ( 50 * 0.0915)); //
        //PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][1], 0.0, bukle);
        //PlayerTextDrawShow(playerid,TDEditor_PTD[playerid][1]);
        //PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][2], 0.0, degalai);
        //PlayerTextDrawShow(playerid,TDEditor_PTD[playerid][2]);
		return 1;
	}
    /*if(strcmp("/tdoff", cmdtext, true, 10) == 0)
	{
		//SetPlayerPos(playerid, 42.2242, 1143.5717, 19.6963);
		//SetPlayerInterior(playerid, 0);
	    //SetPlayerVirtualWorld(playerid, 0);
		for(new ptkk = 0; ptkk < 13; ptkk++) PlayerTextDrawShow(playerid, TDEditor_SPEEDPTD[playerid][ptkk]);
        for(new ptk = 0; ptk < 12; ptk++) TextDrawShowForPlayer(playerid, TDEditor_SPEEDTD[ptk]);
        //SelectTextDraw(playerid, 0xFF6F28FF);
		//new Float:degalai, Float:bukle;
        //bukle = (621.7 + (100 * 0.0915));
        //degalai = (605.3 + ( 50 * 0.0915)); //
        //PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][1], 0.0, bukle);
        //PlayerTextDrawShow(playerid,TDEditor_PTD[playerid][1]);
        //PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][2], 0.0, degalai);
        //PlayerTextDrawShow(playerid,TDEditor_PTD[playerid][2]);
		return 1;
	}*/
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}

/*stock inv(playerid)
{
TDEditor_PTD[playerid][0] = CreatePlayerTextDraw(playerid, 166.310317, 144.499969, "box");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][0], 0.000000, 17.077224);
PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][0], 418.000000, 0.000000);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][0], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][0], -1);
PlayerTextDrawUseBox(playerid, TDEditor_PTD[playerid][0], 1);
PlayerTextDrawBoxColor(playerid, TDEditor_PTD[playerid][0], 606351359);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][0], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][0], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][0], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][0], 1);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][0], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][0], 0);

TDEditor_PTD[playerid][1] = CreatePlayerTextDraw(playerid, 171.975463, 158.116683, "LD_SPAC:white");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][1], 0.000000, 0.000000);
PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][1], 115.000000, 127.390296);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][1], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][1], -2002350081);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][1], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][1], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][1], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][1], 4);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][1], 0);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][1], 0);

TDEditor_PTD[playerid][2] = CreatePlayerTextDraw(playerid, 353.058654, 269.548706, "Kuprine");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][2], 0.400000, 1.600000);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][2], 2);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][2], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][2], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][2], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][2], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][2], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][2], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][2], 0);

TDEditor_PTD[playerid][3] = CreatePlayerTextDraw(playerid, 154.319366, 182.518386, "");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][3], 0.000000, 0.000000);
PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][3], 90.000000, 90.000000);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][3], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][3], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][3], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][3], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][3], 0);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][3], 5);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][3], 0);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][3], 0);
PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][3], true);
PlayerTextDrawSetPreviewModel(playerid, TDEditor_PTD[playerid][3], 3026);
PlayerTextDrawSetPreviewRot(playerid, TDEditor_PTD[playerid][3], 0.000000, 270.000000, 1.000000, 1.200000);

TDEditor_PTD[playerid][4] = CreatePlayerTextDraw(playerid, 183.705871, 243.699890, "Kuprine_tai_daiktas_kur_joje~n~galima_rasti_vaistu_maisto_bei~n~Pasid?ti_reikalingiausius_daiktus");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][4], 0.119998, 1.120000);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][4], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][4], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][4], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][4], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][4], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][4], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][4], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][4], 0);

TDEditor_PTD[playerid][5] = CreatePlayerTextDraw(playerid, 300.817077, 159.316513, "Nr__Pavadinimas__Vnt__Kategorija");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][5], 0.140000, 1.139999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][5], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][5], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][5], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][5], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][5], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][5], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][5], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][5], 0);

TDEditor_PTD[playerid][6] = CreatePlayerTextDraw(playerid, 300.817077, 176.117538, "__1._____Teraflu~n~__2._____Gripex~n~__3.___Antibiotikai~n~__4.____Bandele~n~__5.___Jogurtas~n~__6._______Pica~n~__7.____Ginkla");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][6], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][6], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][6], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][6], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][6], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][6], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][6], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][6], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][6], 0);

TDEditor_PTD[playerid][7] = CreatePlayerTextDraw(playerid, 301.285614, 248.005218, "__8.__Narkotikai~n~");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][7], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][7], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][7], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][7], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][7], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][7], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][7], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][7], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][7], 0);

TDEditor_PTD[playerid][8] = CreatePlayerTextDraw(playerid, 300.666961, 174.783828, "LD_SPAC:white");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][8], 0.000000, 0.000000);
PlayerTextDrawTextSize(playerid, TDEditor_PTD[playerid][8], 102.760162, -3.000000);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][8], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][8], -1429893121);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][8], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][8], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][8], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][8], 4);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][8], 0);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][8], 0);

TDEditor_PTD[playerid][9] = CreatePlayerTextDraw(playerid, 331.628601, 176.117492, "___________________________Vaistai~n~___________________________Vaistai~n~___________________________Vaistai~n~");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][9], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][9], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][9], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][9], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][9], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][9], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][9], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][9], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][9], 0);

TDEditor_PTD[playerid][10] = CreatePlayerTextDraw(playerid, 330.928558, 206.519348, "___________________________Maistas~n~___________________________Maistas~n~___________________________Maistas~n~");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][10], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][10], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][10], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][10], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][10], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][10], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][10], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][10], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][10], 0);

TDEditor_PTD[playerid][11] = CreatePlayerTextDraw(playerid, 330.928558, 237.421234, "___________________________Daiktas~n~___________________________Daiktas~n~");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][11], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][11], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][11], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][11], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][11], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][11], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][11], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][11], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][11], 0);

TDEditor_PTD[playerid][12] = CreatePlayerTextDraw(playerid, 355.930084, 175.917480, "10");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][12], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][12], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][12], -2002350081);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][12], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][12], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][12], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][12], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][12], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][12], 0);
PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][12], true);

TDEditor_PTD[playerid][13] = CreatePlayerTextDraw(playerid, 355.930084, 186.618133, "5");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][13], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][13], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][13], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][13], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][13], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][13], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][13], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][13], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][13], 0);
PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][13], true);

TDEditor_PTD[playerid][14] = CreatePlayerTextDraw(playerid, 355.930084, 197.018768, "8");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][14], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][14], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][14], -2002350081);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][14], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][14], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][14], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][14], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][14], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][14], 0);
PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][14], true);

TDEditor_PTD[playerid][15] = CreatePlayerTextDraw(playerid, 355.930084, 206.919372, "20");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][15], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][15], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][15], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][15], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][15], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][15], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][15], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][15], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][15], 0);
PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][15], true);

TDEditor_PTD[playerid][16] = CreatePlayerTextDraw(playerid, 355.930084, 217.019989, "11");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][16], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][16], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][16], -2002350081);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][16], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][16], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][16], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][16], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][16], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][16], 0);
PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][16], true);

TDEditor_PTD[playerid][17] = CreatePlayerTextDraw(playerid, 355.930084, 226.820587, "3");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][17], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][17], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][17], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][17], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][17], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][17], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][17], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][17], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][17], 0);
PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][17], true);

TDEditor_PTD[playerid][18] = CreatePlayerTextDraw(playerid, 355.930084, 237.921264, "9");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][18], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][18], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][18], -2002350081);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][18], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][18], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][18], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][18], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][18], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][18], 0);
PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][18], true);

TDEditor_PTD[playerid][19] = CreatePlayerTextDraw(playerid, 355.930084, 248.421905, "30");
PlayerTextDrawLetterSize(playerid, TDEditor_PTD[playerid][19], 0.129997, 1.129999);
PlayerTextDrawAlignment(playerid, TDEditor_PTD[playerid][19], 1);
PlayerTextDrawColor(playerid, TDEditor_PTD[playerid][19], -1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][19], 0);
PlayerTextDrawSetOutline(playerid, TDEditor_PTD[playerid][19], 0);
PlayerTextDrawBackgroundColor(playerid, TDEditor_PTD[playerid][19], 255);
PlayerTextDrawFont(playerid, TDEditor_PTD[playerid][19], 2);
PlayerTextDrawSetProportional(playerid, TDEditor_PTD[playerid][19], 1);
PlayerTextDrawSetShadow(playerid, TDEditor_PTD[playerid][19], 0);
PlayerTextDrawSetSelectable(playerid, TDEditor_PTD[playerid][19], true);
}*/
