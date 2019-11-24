/*

Transporto sutaisymo sistema

*/

#include YSI\y_hooks 

#define DIALOG_REPAIR_VEH_ONE 15462
#define DIALOG_REPAIR_VEH_TWO 15463
#define DIALOG_REPAIR_VEH_THEE 15464

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_REPAIR_VEH_ONE)
	{
		if(response){
		new vehicleid = zInfo[playerid][Transportas1];
		new repairprice = GetModelPrice(GetVehicleModel(vehicleid))/7;
        if(vehicleid == -1) return SendClientMessage(playerid, RED, "{EB3232}« Jûs neturite transporto!");
        if(GetPlayerMoneyA(playerid) < repairprice) return SendClientMessage(playerid, RED, "Neturite pinigø transportui atstatyti!");
	    SetVehiclePos(vehicleid, -83.5702, 1350.9775, 10.8689);
	    SetVehicleZAngle(vehicleid, 95.5000);
	    SendClientMessage(playerid, -1, "Pirmas transportas sutaisytas. Já rasite automobiliø salono aikðtelëje!");
	    GivePlayerMoneyA(playerid, -repairprice);
	    tInfo[vehicleid][Sudauzyta] = false;
		SetVehicleVirtualWorld(vehicleid, 0);
		}else SendClientMessage(playerid, RED, "Nesutikote su taisymu!");
	}
	if(dialogid == DIALOG_REPAIR_VEH_TWO)
	{
		if(response){
		new vehicleid = zInfo[playerid][Transportas2];
		new repairprice = GetModelPrice(GetVehicleModel(vehicleid))/7;
        if(vehicleid == -1) return SendClientMessage(playerid, RED, "{EB3232}« Jûs neturite transporto!");
        if(GetPlayerMoneyA(playerid) < repairprice) return SendClientMessage(playerid, RED, "Neturite pinigø transportui atstatyti!");
	    SetVehiclePos(vehicleid, -83.5702, 1350.9775, 10.8689);
	    SetVehicleZAngle(vehicleid, 95.5000);
	    SendClientMessage(playerid, -1, "Antras transportas sutaisytas. Já rasite automobiliø salono aikðtelëje!");
	    GivePlayerMoneyA(playerid, -repairprice);
	    tInfo[vehicleid][Sudauzyta] = false;
		SetVehicleVirtualWorld(vehicleid, 0);
		}else SendClientMessage(playerid, RED, "Nesutikote su taisymu!");
	}
	if(dialogid == DIALOG_REPAIR_VEH_THEE)
	{
		if(response){
		new vehicleid = zInfo[playerid][Transportas3];
		new repairprice = GetModelPrice(GetVehicleModel(vehicleid))/7;
        if(vehicleid == -1) return SendClientMessage(playerid, RED, "{EB3232}« Jûs neturite transporto!");
        if(GetPlayerMoneyA(playerid) < repairprice) return SendClientMessage(playerid, RED, "Neturite pinigø transportui atstatyti!");
	    SetVehiclePos(vehicleid, -83.5702, 1350.9775, 10.8689);
	    SetVehicleZAngle(vehicleid, 95.5000);
	    SendClientMessage(playerid, -1, "Treèias transportas sutaisytas. Já rasite automobiliø salono aikðtelëje!");
	    GivePlayerMoneyA(playerid, -repairprice);
	    tInfo[vehicleid][Sudauzyta] = false;
	    SetVehicleVirtualWorld(vehicleid, 0);
	    }else SendClientMessage(playerid, RED, "Nesutikote su taisymu!");
	}
	return 1;
}