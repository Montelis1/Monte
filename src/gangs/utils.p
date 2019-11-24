destroyGang(gangid)
{
	if (gangid == INVALID_GANG_ID) 
		return INVALID_GANG_ID;

	if (!(0 <= gangid < MAX_GANGS))
		return INVALID_GANG_ID;

	if (gangDB[gangid][gID] == INVALID_GANG_ID)
		return INVALID_GANG_ID;

	new 
		qer[100],
		qez[100];

	format(qer, sizeof qer, "UPDATE zaidejai SET gaujosID = '-1', gangCo = '0' WHERE gaujosID = '%d'", gangid);
	mysql_query(qer);

	resetGZ(gangid);
	resetGB(gangid);

	foreach(new p : Player)
	{
		if (playerGang[p] == gangid)
		{
			playerGang[p] = INVALID_GANG_ID;
			SendClientMessage(p, RED, "Jûsø gauja buvo uþdaryta.");
			zInfo[p][NoGunsGang] = 0;
			syncGZToPlayer(p);
			syncGBaseZone(p);

			if (zInfo[p][skinStatus] == SKINSTATUS_GANG)
			{
				SetPlayerSkin(p,zInfo[p][drabuziai]);
		       	zInfo[p][skinStatus] = SKINSTATUS_NORMAL;
			}
		}
	}

	gangDB[gangid][gID] = INVALID_GANG_ID;

    format(qer, sizeof qer, "DELETE FROM gangs2 WHERE gID = '%d'", gangid);
    mysql_query(qer);

    format(qez, sizeof qez, "DELETE FROM gangs_weps WHERE gangid = '%d'", gangid);
    mysql_query(qez);

    gang_resetVars(gangid);
	   
	mysql_free_result();   

	return 1;
}
