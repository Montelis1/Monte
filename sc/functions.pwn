#define TEXTCOL_GREY 0x80808030
#define TEXTCOL_PINK 0xFF80FF30

//new commandAdminon[MAX_PLAYERS];

stock GetPlayerNameEx(playerid)
{
	new Vardas[ MAX_PLAYER_NAME ];
	GetPlayerName( playerid, Vardas, MAX_PLAYER_NAME );
	return Vardas;
}
stock IsNumeric(const string[]) // Mike
{
	for(new i = 0, j = strlen(string); i < j; i++) if(string[i] > '9' || string[i] < '0') return 0;
	return 1;
}
stock zIP(playerid)
{
    new ip[24];
    GetPlayerIp(playerid, ip, 24);
    return ip;
}
stock SuccesMSG(playerid, text[])
{
	new msg[256];
	format(msg, sizeof(msg), "{33CC33}• S • {FFFFFF}%s", text);
	SendClientMessage(playerid, 0x00FF00FF, msg);
	return (true);
}
stock ErorMSG(playerid, text[])
{
	new msg[256];
	format(msg, sizeof(msg), "{EB3232}• K • {FFFFFF}%s", text);
	SendClientMessage(playerid, 0xFF0000FF, msg);
	return (true);
}
stock InfoMSG(playerid, text[])
{
	new msg[256];
	format(msg, sizeof(msg), "{f48942}• I • {FFFFFF}%s", text);
	SendClientMessage(playerid, 0xFFD400FF, msg);
	return (true);
}
new likosedetitime[MAX_PLAYERS];
forward UnjailPlayer(playerid,Float:x,Float:y,Float:z,Float:a,interior);


stock ZinutePolicija(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==1)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
stock ZinuteTeisesauga(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==16 || zInfo[i][specialybe]==15 || zInfo[i][specialybe]==1)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
//Administracijos pokalbis
stock ZinuteAdminAC(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][admin] && !zInfo[i][aPriziuretojas] && !zInfo[i][dPriziuretojas] && !zInfo[i][bPriziuretojas])
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
//Picerijos racija
stock ZinuteArmija(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==20)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
//Keliu priþ
stock ZinuteKelPriz(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==21)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
//Autobusai
stock ZinuteAutik(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==26)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
//Pilotai
stock ZinutePilot(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==24)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
//Miðkininkai
stock ZinuteTree(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==27)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
stock SendMessageToAdmins(color, text[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(!IsPlayerConnected(i) || IsPlayerNPC(i)) continue;
		if(zInfo[i][admin] < 1 && zInfo[i][PrzPlayer] < 1 && zInfo[i][dyrikz] < 1) continue;
		SendClientMessage(i, color, text);
	}
	return 1;
}
stock ZinuteTaksi(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==2)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
stock ZinuteMechanikai(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==3)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
//Gaisrininkai
stock ZinuteDyleriai(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==23)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
stock ZinuteMedikai(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==5)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
stock ZinuteFuristai(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==6)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
//Elektrikai
stock ZinuteBrigada(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==22)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
stock ZinuteYakuza(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==13)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
stock Zinuteswat(color,text[])
{
	for(new i=0; i<MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
			if(zInfo[i][specialybe]==15)
			{
				SendClientMessage(i,color,text);
			}
		}
	}
}
stock GetPlayerSpeed(playerid)
{
	new Float:ST[4];
	if(IsPlayerInAnyVehicle(playerid))
	GetVehicleVelocity(GetPlayerVehicleID(playerid),ST[0],ST[1],ST[2]);
	else GetPlayerVelocity(playerid,ST[0],ST[1],ST[2]);
	ST[3] = floatsqroot(floatpower(floatabs(ST[0]), 2.0) + floatpower(floatabs(ST[1]), 2.0) + floatpower(floatabs(ST[2]), 2.0)) * 180.3;
	return floatround(ST[3]);
}
stock GetWeaponSlot(playerid,weapon)
{
	new weid,ammo;

	for(new slot=0; slot < 13; slot++)
	{
		GetPlayerWeaponData(playerid,slot,weid,ammo);
		if(weid == weapon)
		{
			return slot;
		}
	}
	return -1;
}
stock StringToInt(string[])
{
	new thestring[8];
	strmid(thestring,string,0,strlen(string),sizeof(thestring));
	return strval(thestring);
}
stock CheckPass(file[],password[])
{
	if(!strcmp(dini_Get(file,"slaptazodis"), password)) return true;
	return false;
}
stock Stop(playerid)
{
	new Float:coo[3];
	GetPlayerPos(playerid,coo[0],coo[1],coo[2]);
	SetPlayerPos(playerid,coo[0],coo[1],coo[2]);
}
stock GetArgument(argument, const string[], untillend)
{
	new index = 0;
	new end = 0;
	new returns[256]="0";

	for(new loop = 0; loop < argument; loop++)
	{
		index = strfind(string," ",true,index)+1;
		if(!strcmp(string[index]," ",true,1)){return returns;}
		if (index == 0){return returns;}
	}
	if(untillend == 0)
	{
		end = strfind(string[index]," ",true,0);
	}
	if (end== -1 || untillend==1) end = 256-index;
	strmid(returns,string[index],0,end);
	return returns;
}
stock SendPagalba(recieverid,name[],recievername[],text[],playerid=INVALID_PLAYER_ID)
{
	new tex[400];
	format(tex,sizeof(tex),"{FFED66}Administratorius {ffffff}%s {FFED66}atsakë á {ffffff}%s {FFED66}klausimà:",name,recievername);

	if(recieverid != INVALID_PLAYER_ID)
	{
		PlaySound(recieverid, 1057);
		SendClientMessage(recieverid,YELLOW,tex);
		SendClientMessage(recieverid,WHITE,text);
	}

	if(playerid!=INVALID_PLAYER_ID)
	{
		SendClientMessage(playerid,YELLOW,tex);
		SendClientMessage(playerid,WHITE,text);
	}
}
stock SendSMS(recieverid,name[],recievername[],text[],playerid=INVALID_PLAYER_ID)
{
	new tex[128];
	format(tex,sizeof(tex),"{ffffff}> {0033ff}[SMS ÞINUTË] Siuntëjas:({ffffff}%s{0033ff}) | Gavëjas:({ffffff}%s{0033ff})",name,recievername);

	if(recieverid != INVALID_PLAYER_ID)
	{
		PlaySound(recieverid, 1057);
		SendClientMessage(recieverid,TEXTCOL_GREY,tex);
		SendClientMessage(recieverid,BLUE,text);
	}

	if(playerid!=INVALID_PLAYER_ID)
	{
		SendClientMessage(playerid,TEXTCOL_GREY,tex);
		SendClientMessage(playerid,BLUE,text);
	}
}
stock MakeToMeMinxMinyMaxxMaxy(Float:x1, Float:x2, Float:x3, Float:x4, Float:y1, Float:y2, Float:y3, Float:y4)
{
	new a, Float:C[4], Float:X[4], Float:Y[4];
	X[0] = x1; Y[0] = y1;
	X[1] = x2; Y[1] = y2;
	X[2] = x3; Y[2] = y3;
	X[3] = x4; Y[3] = y4;
	for(a = 0; a < 4; a++)
	{
		if(a == 0)
		{
			C[0] = X[a]; C[2] = Y[a];
			C[1] = X[a]; C[3] = Y[a];
			continue;
		}
		if(C[0] > X[a]) C[0] = X[a];
		if(C[1] < X[a]) C[1] = X[a];
		if(C[2] > Y[a]) C[2] = Y[a];
		if(C[3] < Y[a]) C[3] = Y[a];
	}
	printf("min_X: %.4f, min_Y: %.4f, max_X: %.4f, max_Y: %.4f", C[0], C[2], C[1], C[3]);
	return 1;
}
stock PlaySound ( playerid, sound )
{
	new Float:Xr, Float:Yr, Float:Zr;
	GetPlayerPos(playerid, Xr, Yr, Zr);
	PlayerPlaySound(playerid, sound, Xr, Yr, Zr);
	return sound;
}
stock PlayerToPoint(Float:radi, playerid, Float:x, Float:y, Float:z)
{
    if(IsPlayerConnected(playerid))
	{
		new Float:oldposx, Float:oldposy, Float:oldposz;
		new Float:tempposx, Float:tempposy, Float:tempposz;
		GetPlayerPos(playerid, oldposx, oldposy, oldposz);
		tempposx = (oldposx -x);
		tempposy = (oldposy -y);
		tempposz = (oldposz -z);
		if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
		{
			return 1;
		}
	}
	return 0;
}
stock Numbers(const string[])
{
	for (new i = 0, j = strlen(string); i < j; i++){
	if (string[i] > '9' || string[i] < '0') return 0;}
	return 1;
}
stock PlayerInZone(playerid, Float:min_X, Float:min_Y, Float:max_X, Float:max_Y)
{
    new Float:pos[3]; GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    if((pos[0] <= max_X && pos[0] >= min_X) && (pos[1] <= max_Y && pos[1] >= min_Y)) return 1;
    return 0;
}
stock GetPlayeridMid(name[])
{
	for (new i = 0; i < MAX_PLAYERS; i++)
	{
		if (IsPlayerConnected(i))
		{
			new gPlayerName[MAX_PLAYER_NAME];
			GetPlayerName(i, gPlayerName, MAX_PLAYER_NAME);
			if(strfind(gPlayerName, name, true) != -1)
			{
				return i;
			}
		}
	}
	return INVALID_PLAYER_ID;
}
stock GetPlayerJobRankName(playerid, bool: UseOnother = false, NZN = 0)
{
	new String[128], JobIDas = 0;

	if(zInfo[playerid][specialybe] > 0) JobIDas = zInfo[playerid][specialybe];
	if(UseOnother)
	{
		if(UseOnother) { JobIDas = NZN; }
	}

	if(JobIDas > 0)
	{
		if(JobIDas == Policija)
		{
			mysql_query( "SELECT Rangas1,Rangas2,Rangas3,Rangas4,Rangas5,Rangas6,Rangas7 FROM `rangai` WHERE `KokioDarboRangas` = 'Policija'" );
			mysql_store_result( );
			new RANGAS1[ 128 ];
			new RANGAS2[ 128 ];
			new RANGAS3[ 128 ];
			new RANGAS4[ 128 ];
			new RANGAS5[ 128 ];
			new RANGAS6[ 128 ];
			new RANGAS7[ 128 ];
			new KINTMASISRANGAMS[ 1048 ];
			while( mysql_fetch_row_format( KINTMASISRANGAMS ) )
			{
				sscanf(KINTMASISRANGAMS,"p<|>s[128]s[128]s[128]s[128]s[128]s[128]s[128]",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7 );
				if(zInfo[playerid][JobRank] == 1)
 				{
					format(String, sizeof(String), "%s",RANGAS1);
				}
				else if(zInfo[playerid][JobRank] == 2)
 				{
					format(String, sizeof(String), "%s",RANGAS2);
				}
				else if(zInfo[playerid][JobRank] == 3)
 				{
					format(String, sizeof(String), "%s",RANGAS3);
				}
				else if(zInfo[playerid][JobRank] == 4)
 				{
					format(String, sizeof(String), "%s",RANGAS4);
				}
				else if(zInfo[playerid][JobRank] == 5)
 				{
					format(String, sizeof(String), "%s",RANGAS5);
				}
				else if(zInfo[playerid][JobRank] == 6)
 				{
					format(String, sizeof(String), "%s",RANGAS6);
				}
				else if(zInfo[playerid][JobRank] == 7)
 				{
					format(String, sizeof(String), "%s",RANGAS7);
				}
			}
			mysql_free_result( );
		}
		if(JobIDas == Medikai)
		{
			mysql_query( "SELECT Rangas1,Rangas2,Rangas3,Rangas4,Rangas5,Rangas6,Rangas7 FROM `rangai` WHERE `KokioDarboRangas` = 'Medikai'" );
			mysql_store_result( );
			new RANGAS1[ 128 ];
			new RANGAS2[ 128 ];
			new RANGAS3[ 128 ];
			new RANGAS4[ 128 ];
			new RANGAS5[ 128 ];
			new RANGAS6[ 128 ];
			new RANGAS7[ 128 ];
			new KINTMASISRANGAMS[ 1048 ];
			while( mysql_fetch_row_format( KINTMASISRANGAMS ) )
			{
				sscanf(KINTMASISRANGAMS,"p<|>s[128]s[128]s[128]s[128]s[128]s[128]s[128]",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7 );
				if(zInfo[playerid][JobRank] == 1)
 				{
					format(String, sizeof(String), "%s",RANGAS1);
				}
				else if(zInfo[playerid][JobRank] == 2)
 				{
					format(String, sizeof(String), "%s",RANGAS2);
				}
				else if(zInfo[playerid][JobRank] == 3)
 				{
					format(String, sizeof(String), "%s",RANGAS3);
				}
				else if(zInfo[playerid][JobRank] == 4)
 				{
					format(String, sizeof(String), "%s",RANGAS4);
				}
				else if(zInfo[playerid][JobRank] == 5)
 				{
					format(String, sizeof(String), "%s",RANGAS5);
				}
				else if(zInfo[playerid][JobRank] == 6)
 				{
					format(String, sizeof(String), "%s",RANGAS6);
				}
				else if(zInfo[playerid][JobRank] == 7)
 				{
					format(String, sizeof(String), "%s",RANGAS7);
				}
			}
			mysql_free_result( );
		}
		if(JobIDas == Mechanikai)
		{
			mysql_query( "SELECT Rangas1,Rangas2,Rangas3,Rangas4,Rangas5,Rangas6,Rangas7 FROM `rangai` WHERE `KokioDarboRangas` = 'Mechanikai'" );
			mysql_store_result( );
			new RANGAS1[ 128 ];
			new RANGAS2[ 128 ];
			new RANGAS3[ 128 ];
			new RANGAS4[ 128 ];
			new RANGAS5[ 128 ];
			new RANGAS6[ 128 ];
			new RANGAS7[ 128 ];
			new KINTMASISRANGAMS[ 1048 ];
			while( mysql_fetch_row_format( KINTMASISRANGAMS ) )
			{
				sscanf(KINTMASISRANGAMS,"p<|>s[128]s[128]s[128]s[128]s[128]s[128]s[128]",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7 );
				if(zInfo[playerid][JobRank] == 1)
 				{
					format(String, sizeof(String), "%s",RANGAS1);
				}
				else if(zInfo[playerid][JobRank] == 2)
 				{
					format(String, sizeof(String), "%s",RANGAS2);
				}
				else if(zInfo[playerid][JobRank] == 3)
 				{
					format(String, sizeof(String), "%s",RANGAS3);
				}
				else if(zInfo[playerid][JobRank] == 4)
 				{
					format(String, sizeof(String), "%s",RANGAS4);
				}
				else if(zInfo[playerid][JobRank] == 5)
 				{
					format(String, sizeof(String), "%s",RANGAS5);
				}
				else if(zInfo[playerid][JobRank] == 6)
 				{
					format(String, sizeof(String), "%s",RANGAS6);
				}
				else if(zInfo[playerid][JobRank] == 7)
 				{
					format(String, sizeof(String), "%s",RANGAS7);
				}
			}
			mysql_free_result( );
		}
		if(JobIDas == Taksi)
		{
			mysql_query( "SELECT Rangas1,Rangas2,Rangas3,Rangas4,Rangas5,Rangas6,Rangas7 FROM `rangai` WHERE `KokioDarboRangas` = 'Taxi'" );
			mysql_store_result( );
			new RANGAS1[ 128 ];
			new RANGAS2[ 128 ];
			new RANGAS3[ 128 ];
			new RANGAS4[ 128 ];
			new RANGAS5[ 128 ];
			new RANGAS6[ 128 ];
			new RANGAS7[ 128 ];
			new KINTMASISRANGAMS[ 1048 ];
			while( mysql_fetch_row_format( KINTMASISRANGAMS ) )
			{
				sscanf(KINTMASISRANGAMS,"p<|>s[128]s[128]s[128]s[128]s[128]s[128]s[128]",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7 );
				if(zInfo[playerid][JobRank] == 1)
 				{
					format(String, sizeof(String), "%s",RANGAS1);
				}
				else if(zInfo[playerid][JobRank] == 2)
 				{
					format(String, sizeof(String), "%s",RANGAS2);
				}
				else if(zInfo[playerid][JobRank] == 3)
 				{
					format(String, sizeof(String), "%s",RANGAS3);
				}
				else if(zInfo[playerid][JobRank] == 4)
 				{
					format(String, sizeof(String), "%s",RANGAS4);
				}
				else if(zInfo[playerid][JobRank] == 5)
 				{
					format(String, sizeof(String), "%s",RANGAS5);
				}
				else if(zInfo[playerid][JobRank] == 6)
 				{
					format(String, sizeof(String), "%s",RANGAS6);
				}
				else if(zInfo[playerid][JobRank] == 7)
 				{
					format(String, sizeof(String), "%s",RANGAS7);
				}
			}
			mysql_free_result( );
		}
		if(JobIDas == Furistai)
		{
			mysql_query( "SELECT Rangas1,Rangas2,Rangas3,Rangas4,Rangas5,Rangas6,Rangas7 FROM `rangai` WHERE `KokioDarboRangas` = 'Furistai'" );
			mysql_store_result( );
			new RANGAS1[ 128 ];
			new RANGAS2[ 128 ];
			new RANGAS3[ 128 ];
			new RANGAS4[ 128 ];
			new RANGAS5[ 128 ];
			new RANGAS6[ 128 ];
			new RANGAS7[ 128 ];
			new KINTMASISRANGAMS[ 1048 ];
			while( mysql_fetch_row_format( KINTMASISRANGAMS ) )
			{
				sscanf(KINTMASISRANGAMS,"p<|>s[128]s[128]s[128]s[128]s[128]s[128]s[128]",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7 );
				if(zInfo[playerid][JobRank] == 1)
 				{
					format(String, sizeof(String), "%s",RANGAS1);
				}
				else if(zInfo[playerid][JobRank] == 2)
 				{
					format(String, sizeof(String), "%s",RANGAS2);
				}
				else if(zInfo[playerid][JobRank] == 3)
 				{
					format(String, sizeof(String), "%s",RANGAS3);
				}
				else if(zInfo[playerid][JobRank] == 4)
 				{
					format(String, sizeof(String), "%s",RANGAS4);
				}
				else if(zInfo[playerid][JobRank] == 5)
 				{
					format(String, sizeof(String), "%s",RANGAS5);
				}
				else if(zInfo[playerid][JobRank] == 6)
 				{
					format(String, sizeof(String), "%s",RANGAS6);
				}
				else if(zInfo[playerid][JobRank] == 7)
 				{
					format(String, sizeof(String), "%s",RANGAS7);
				}
			}
			mysql_free_result( );
		}
		if(JobIDas == Dyleriai)
		{
			mysql_query( "SELECT Rangas1,Rangas2,Rangas3,Rangas4,Rangas5,Rangas6,Rangas7 FROM `rangai` WHERE `KokioDarboRangas` = 'Dyleriai'" );
			mysql_store_result( );
			new RANGAS1[ 128 ];
			new RANGAS2[ 128 ];
			new RANGAS3[ 128 ];
			new RANGAS4[ 128 ];
			new RANGAS5[ 128 ];
			new RANGAS6[ 128 ];
			new RANGAS7[ 128 ];
			new KINTMASISRANGAMS[ 1048 ];
			while( mysql_fetch_row_format( KINTMASISRANGAMS ) )
			{
				sscanf(KINTMASISRANGAMS,"p<|>s[128]s[128]s[128]s[128]s[128]s[128]s[128]",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7 );
				if(zInfo[playerid][JobRank] == 1)
 				{
					format(String, sizeof(String), "%s",RANGAS1);
				}
				else if(zInfo[playerid][JobRank] == 2)
 				{
					format(String, sizeof(String), "%s",RANGAS2);
				}
				else if(zInfo[playerid][JobRank] == 3)
 				{
					format(String, sizeof(String), "%s",RANGAS3);
				}
				else if(zInfo[playerid][JobRank] == 4)
 				{
					format(String, sizeof(String), "%s",RANGAS4);
				}
				else if(zInfo[playerid][JobRank] == 5)
 				{
					format(String, sizeof(String), "%s",RANGAS5);
				}
				else if(zInfo[playerid][JobRank] == 6)
 				{
					format(String, sizeof(String), "%s",RANGAS6);
				}
				else if(zInfo[playerid][JobRank] == 7)
 				{
					format(String, sizeof(String), "%s",RANGAS7);
				}
			}
			mysql_free_result( );
		}
		if(JobIDas == GroveStreet)
		{
			mysql_query( "SELECT Rangas1,Rangas2,Rangas3,Rangas4,Rangas5,Rangas6,Rangas7 FROM `rangai` WHERE `KokioDarboRangas` = 'Yardies'" );
			mysql_store_result( );
			new RANGAS1[ 128 ];
			new RANGAS2[ 128 ];
			new RANGAS3[ 128 ];
			new RANGAS4[ 128 ];
			new RANGAS5[ 128 ];
			new RANGAS6[ 128 ];
			new RANGAS7[ 128 ];
			new KINTMASISRANGAMS[ 1048 ];
			while( mysql_fetch_row_format( KINTMASISRANGAMS ) )
			{
				sscanf(KINTMASISRANGAMS,"p<|>s[128]s[128]s[128]s[128]s[128]s[128]s[128]",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7 );
				if(zInfo[playerid][JobRank] == 1)
 				{
					format(String, sizeof(String), "%s",RANGAS1);
				}
				else if(zInfo[playerid][JobRank] == 2)
 				{
					format(String, sizeof(String), "%s",RANGAS2);
				}
				else if(zInfo[playerid][JobRank] == 3)
 				{
					format(String, sizeof(String), "%s",RANGAS3);
				}
				else if(zInfo[playerid][JobRank] == 4)
 				{
					format(String, sizeof(String), "%s",RANGAS4);
				}
				else if(zInfo[playerid][JobRank] == 5)
 				{
					format(String, sizeof(String), "%s",RANGAS5);
				}
				else if(zInfo[playerid][JobRank] == 6)
 				{
					format(String, sizeof(String), "%s",RANGAS6);
				}
				else if(zInfo[playerid][JobRank] == 7)
 				{
					format(String, sizeof(String), "%s",RANGAS7);
				}
			}
			mysql_free_result( );
		}
		if(JobIDas == Ballas)
		{
			mysql_query( "SELECT Rangas1,Rangas2,Rangas3,Rangas4,Rangas5,Rangas6,Rangas7 FROM `rangai` WHERE `KokioDarboRangas` = 'Corleone'" );
			mysql_store_result( );
			new RANGAS1[ 128 ];
			new RANGAS2[ 128 ];
			new RANGAS3[ 128 ];
			new RANGAS4[ 128 ];
			new RANGAS5[ 128 ];
			new RANGAS6[ 128 ];
			new RANGAS7[ 128 ];
			new KINTMASISRANGAMS[ 1048 ];
			while( mysql_fetch_row_format( KINTMASISRANGAMS ) )
			{
				sscanf(KINTMASISRANGAMS,"p<|>s[128]s[128]s[128]s[128]s[128]s[128]s[128]",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7 );
				if(zInfo[playerid][JobRank] == 1)
 				{
					format(String, sizeof(String), "%s",RANGAS1);
				}
				else if(zInfo[playerid][JobRank] == 2)
 				{
					format(String, sizeof(String), "%s",RANGAS2);
				}
				else if(zInfo[playerid][JobRank] == 3)
 				{
					format(String, sizeof(String), "%s",RANGAS3);
				}
				else if(zInfo[playerid][JobRank] == 4)
 				{
					format(String, sizeof(String), "%s",RANGAS4);
				}
				else if(zInfo[playerid][JobRank] == 5)
 				{
					format(String, sizeof(String), "%s",RANGAS5);
				}
				else if(zInfo[playerid][JobRank] == 6)
 				{
					format(String, sizeof(String), "%s",RANGAS6);
				}
				else if(zInfo[playerid][JobRank] == 7)
 				{
					format(String, sizeof(String), "%s",RANGAS7);
				}
			}
			mysql_free_result( );
		}
		if(JobIDas == Swat)
		{
			mysql_query( "SELECT Rangas1,Rangas2,Rangas3,Rangas4,Rangas5,Rangas6,Rangas7 FROM `rangai` WHERE `KokioDarboRangas` = 'Aras'" );
			mysql_store_result( );
			new RANGAS1[ 128 ];
			new RANGAS2[ 128 ];
			new RANGAS3[ 128 ];
			new RANGAS4[ 128 ];
			new RANGAS5[ 128 ];
			new RANGAS6[ 128 ];
			new RANGAS7[ 128 ];
			new KINTMASISRANGAMS[ 1048 ];
			while( mysql_fetch_row_format( KINTMASISRANGAMS ) )
			{
				sscanf(KINTMASISRANGAMS,"p<|>s[128]s[128]s[128]s[128]s[128]s[128]s[128]",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7 );
				if(zInfo[playerid][JobRank] == 1)
 				{
					format(String, sizeof(String), "%s",RANGAS1);
				}
				else if(zInfo[playerid][JobRank] == 2)
 				{
					format(String, sizeof(String), "%s",RANGAS2);
				}
				else if(zInfo[playerid][JobRank] == 3)
 				{
					format(String, sizeof(String), "%s",RANGAS3);
				}
				else if(zInfo[playerid][JobRank] == 4)
 				{
					format(String, sizeof(String), "%s",RANGAS4);
				}
				else if(zInfo[playerid][JobRank] == 5)
 				{
					format(String, sizeof(String), "%s",RANGAS5);
				}
				else if(zInfo[playerid][JobRank] == 6)
 				{
					format(String, sizeof(String), "%s",RANGAS6);
				}
				else if(zInfo[playerid][JobRank] == 7)
 				{
					format(String, sizeof(String), "%s",RANGAS7);
				}
			}
			mysql_free_result( );
		}
		if(JobIDas == Armija)
		{
			mysql_query( "SELECT Rangas1,Rangas2,Rangas3,Rangas4,Rangas5,Rangas6,Rangas7 FROM `rangai` WHERE `KokioDarboRangas` = 'Armija'" );
			mysql_store_result( );
			new RANGAS1[ 128 ];
			new RANGAS2[ 128 ];
			new RANGAS3[ 128 ];
			new RANGAS4[ 128 ];
			new RANGAS5[ 128 ];
			new RANGAS6[ 128 ];
			new RANGAS7[ 128 ];
			new KINTMASISRANGAMS[ 1048 ];
			while( mysql_fetch_row_format( KINTMASISRANGAMS ) )
			{
				sscanf(KINTMASISRANGAMS,"p<|>s[128]s[128]s[128]s[128]s[128]s[128]s[128]",RANGAS1,RANGAS2,RANGAS3,RANGAS4,RANGAS5,RANGAS6,RANGAS7 );
				if(zInfo[playerid][JobRank] == 1)
 				{
					format(String, sizeof(String), "%s",RANGAS1);
				}
				else if(zInfo[playerid][JobRank] == 2)
 				{
					format(String, sizeof(String), "%s",RANGAS2);
				}
				else if(zInfo[playerid][JobRank] == 3)
 				{
					format(String, sizeof(String), "%s",RANGAS3);
				}
				else if(zInfo[playerid][JobRank] == 4)
 				{
					format(String, sizeof(String), "%s",RANGAS4);
				}
				else if(zInfo[playerid][JobRank] == 5)
 				{
					format(String, sizeof(String), "%s",RANGAS5);
				}
				else if(zInfo[playerid][JobRank] == 6)
 				{
					format(String, sizeof(String), "%s",RANGAS6);
				}
				else if(zInfo[playerid][JobRank] == 7)
 				{
					format(String, sizeof(String), "%s",RANGAS7);
				}
			}
			mysql_free_result( );
		}
	}
	return String;
}
stock GautiDarba(job)
{
    if(job == Policija) return 1;
	if(job == Taksi) return 2;
	if(job == Mechanikai) return 3;
	if(job == Dyleriai) return 4;
	if(job == Medikai) return 5;
	if(job == Furistai) return 6;
	if(job == GroveStreet) return 13;
	if(job == Ballas) return 14;
	if(job == Swat) return 15;
	if(job == Armija) return 16;
	else return 3;
}
stock IsVehicleInRangeOfPoint(vehicleid, Float:radi, Float:x, Float:y, Float:z)
{
	new Float:oldposx, Float:oldposy, Float:oldposz;
 	new Float:tempposx, Float:tempposy, Float:tempposz;
  	GetVehiclePos(vehicleid, oldposx, oldposy, oldposz);
   	tempposx = (oldposx -x);
   	tempposy = (oldposy -y);
    tempposz = (oldposz -z);
    if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
    {
    	return 1;
    }
    return 0;
}
stock tohash(buf[])
{
	new length=strlen(buf);
    new s1 = 1;
    new s2 = 0;
    new n;
    for (n=0; n<length; n++)
    {
    	s1 = (s1 + buf[n]) % 65521;
    	s2 = (s2 + s1)     % 65521;
    }
    return (s2 << 16) + s1;
}
public UnjailPlayer(playerid,Float:x,Float:y,Float:z,Float:a,interior)
{
	if(!zInfo[playerid][ikalintas]) return;
	SetPlayerPos(playerid,x,y,z);
	SetPlayerFacingAngle(playerid,a);
	SetPlayerInterior(playerid,interior);
	TogglePlayerControllable(playerid,true);
	SetPlayerWantedLevel(playerid,0);
	SetPlayerWantedLevelEx(playerid, 0);
	zInfo[playerid][ikalintas]=false;
	zInfo[playerid][kalejimo_laikas]=0;
	zInfo[playerid][cuffed] = false;
	zInfo[playerid][suristas] = false;
	GameTextForPlayer(playerid," ",1,2);
	KillTimer( likosedetitime[ playerid ] );
	RemovePlayerAttachedObject(playerid,0);
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
	SetPlayerVirtualWorld(playerid,0);
}

stock JailPlayer(playerid,Float:x,Float:y,Float:z,Float:a,time,interior,Float:unX,Float:unY,Float:unZ,Float:unA,unInterior,bool:controlable)
{
	KillTimer( likosedetitime[ playerid ] );
	SetTimerEx("UnjailPlayer",time,0,"iffffi",playerid,unX,unY,unZ,unA,unInterior);
	likosedetitime[playerid]=SetTimerEx("LikoSedeti",1000,true,"i",playerid);
	SetPlayerInterior(playerid,interior);
	SetPlayerPos(playerid,x,y,z);
	SetPlayerFacingAngle(playerid,a);
	TogglePlayerControllable(playerid,controlable);
	SetPlayerWantedLevel(playerid,0);
	zInfo[playerid][ikalintas]=true;
	zInfo[playerid][cuffed] = false;
	zInfo[playerid][suristas] = false;
	SetPlayerWantedLevelEx(playerid, 0);
	RemovePlayerAttachedObject(playerid,0);
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
}
static const Ratai[] =
        {
                1025, 1073, 1074, 1075,
                1076, 1077, 1078, 1079,
                1080, 1081, 1082, 1083,
                1084, 1085, 1096, 1097, 1098
        }
;

static const GalimosMasinosDalys[][] = {
        {0x08090A0D, 0x12131415, 0x1819494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x00000000, 0x00000000, 0x00000000, 0}, // 400
        {0x01030405, 0x06070809, 0x0A0D1113, 0x1419494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x8E8F9091, 0x00000000, 0}, // 401
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 402
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 403
        {0x00020708, 0x090A0D10, 0x11131415, 0x19494A4B, 0x4C4D4E4F, 0x50515253, 0x54555657, 0x60616200, 0x00000000, 0x00000000, 0}, // 404
        {0x00010809, 0x0A0E1213, 0x14151719, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0}, // 405
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 406
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 407
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 408
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 409
        {0x01030708, 0x090A0D11, 0x13141517, 0x1819494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x00000000, 0x00000000, 0}, // 410
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 411
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 412
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 413
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 414
        {0x01030708, 0x090A1112, 0x13171949, 0x4A4B4C4D, 0x4E4F5051, 0x52535455, 0x56576061, 0x62000000, 0x00000000, 0x00000000, 0}, // 415
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 416
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 417
        {0x02060809, 0x0A101415, 0x19494A4B, 0x4C4D4E4F, 0x50515253, 0x54555657, 0x60616200, 0x00000000, 0x00000000, 0x00000000, 0}, // 418
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 419
        {0x01030405, 0x08090A13, 0x1519494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x00000000, 0x00000000, 0x00000000, 0}, // 420
        {0x0008090A, 0x0E101213, 0x14151719, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0}, // 421
        {0x0708090A, 0x0D111314, 0x1519494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x00000000, 0x00000000, 0x00000000, 0}, // 422
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 423
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 424
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 425
        {0x01030405, 0x0608090A, 0x13151949, 0x4A4B4C4D, 0x4E4F5051, 0x52535455, 0x56576061, 0x62000000, 0x00000000, 0x00000000, 0}, // 426
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 427
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 428
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 429
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 430
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 431
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 432
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 433
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 434
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 435
        {0x01030607, 0x08090A0D, 0x11131415, 0x1619494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x00000000, 0x00000000, 0}, // 436
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 437
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 438
        {0x01030708, 0x090A0D11, 0x1719494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x8E8F9091, 0x00000000, 0x00000000, 0}, // 439
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 440
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 441
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 442
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 443
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 444
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 445
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 446
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 447
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 448
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 449
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 450
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 451
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 452
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 453
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 454
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 455
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 456
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 457
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 458
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 459
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 460
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 461
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 462
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 463
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 464
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 465
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 466
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 467
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 468
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 469
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 470
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 471
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 472
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 473
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 474
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 475
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 476
        {0x06070809, 0x0A111213, 0x14151949, 0x4A4B4C4D, 0x4E4F5051, 0x52535455, 0x56576061, 0x62000000, 0x00000000, 0x00000000, 0}, // 477
        {0x04050809, 0x0A0C0D14, 0x15161819, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0}, // 478
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 479
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 480
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 481
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 482
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 483
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 484
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 485
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 486
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 487
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 488
        {0x00020405, 0x0608090A, 0x0D101213, 0x14181949, 0x4A4B4C4D, 0x4E4F5051, 0x52535455, 0x56576061, 0x62000000, 0x00000000, 0}, // 489
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 490
        {0x03070809, 0x0A0E1112, 0x13141517, 0x19494A4B, 0x4C4D4E4F, 0x50515253, 0x54555657, 0x6061628E, 0x8F909100, 0x00000000, 0}, // 491
        {0x00040506, 0x08090A10, 0x19494A4B, 0x4C4D4E4F, 0x50515253, 0x54555657, 0x60616200, 0x00000000, 0x00000000, 0x00000000, 0}, // 492
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 493
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 494
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 495
        {0x01020306, 0x0708090A, 0x0B111314, 0x1719494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x8E8F0000, 0x00000000, 0}, // 496
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 497
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 498
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 499
        {0x08090A0D, 0x13141518, 0x19494A4B, 0x4C4D4E4F, 0x50515253, 0x54555657, 0x60616200, 0x00000000, 0x00000000, 0x00000000, 0}, // 500
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 501
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 502
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 503
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 504
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 505
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 506
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 507
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 508
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 509
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 510
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 511
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 512
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 513
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 514
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 515
        {0x00020407, 0x08090A0F, 0x10111213, 0x14151949, 0x4A4B4C4D, 0x4E4F5051, 0x52535455, 0x56576061, 0x62000000, 0x00000000, 0}, // 516
        {0x02030708, 0x090A1011, 0x12131417, 0x19494A4B, 0x4C4D4E4F, 0x50515253, 0x54555657, 0x6061628E, 0x8F909100, 0x00000000, 0}, // 517
        {0x01030506, 0x0708090A, 0x0D111214, 0x1719494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x8E8F9091, 0x00000000, 0}, // 518
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 519
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 520
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 521
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 522
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 523
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 524
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 525
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 526
        {0x01070809, 0x0A0E0F11, 0x12141519, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0}, // 527
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 528
        {0x01030607, 0x08090A0B, 0x0C111213, 0x14171949, 0x4A4B4C4D, 0x4E4F5051, 0x52535455, 0x56576061, 0x62000000, 0x00000000, 0}, // 529
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 530
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 531
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 532
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 533
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61626465, 0x6A7A7B7C, 0x7D7E7FB2, 0xB3B4B900, 0x00000000, 0}, // 534
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61626D6E, 0x71727374, 0x75767778, 0x79000000, 0x00000000, 0}, // 535
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61626768, 0x696B6C80, 0xB5B6B7B8, 0x00000000, 0x00000000, 0}, // 536
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 537
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 538
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 539
        {0x01040607, 0x08090A11, 0x12131417, 0x1819494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x8E8F9091, 0x00000000, 0}, // 540
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 541
        {0x08090A0E, 0x0F121314, 0x1519494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x90910000, 0x00000000, 0x00000000, 0}, // 542
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 543
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 544
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 545
        {0x01020406, 0x0708090A, 0x11121317, 0x1819494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x8E8F9091, 0x00000000, 0}, // 546
        {0x00030809, 0x0A101213, 0x14151949, 0x4A4B4C4D, 0x4E4F5051, 0x52535455, 0x56576061, 0x628E8F00, 0x00000000, 0x00000000, 0}, // 547
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 548
        {0x01030708, 0x090A0B0C, 0x11121314, 0x1719494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x8E8F9091, 0x00000000, 0}, // 549
        {0x01030405, 0x0608090A, 0x12131417, 0x19494A4B, 0x4C4D4E4F, 0x50515253, 0x54555657, 0x6061628E, 0x8F909100, 0x00000000, 0}, // 550
        {0x02030506, 0x08090A10, 0x12131415, 0x1719494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x00000000, 0x00000000, 0}, // 551
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 552
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 553
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 554
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 555
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 556
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 557
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565758, 0x595A5B5C, 0x5D5E5F60, 0x6162A3A4, 0xA5A6A7A8, 0x00000000, 0}, // 558
        {0x08090A19, 0x41424344, 0x45464748, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61629E9F, 0xA0A1A2AD, 0x00000000, 0}, // 559
        {0x08090A19, 0x1A1B1C1D, 0x1E1F2021, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61628A8B, 0x8C8DA9AA, 0x00000000, 0}, // 560
        {0x08090A19, 0x1A1B1E1F, 0x3738393A, 0x3B3C3D3E, 0x3F40494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x9A9B9C9D, 0}, // 561
        {0x08090A19, 0x22232425, 0x26272829, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61629293, 0x9495ABAC, 0x00000000, 0}, // 562
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 563
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 564
        {0x08090A19, 0x2D2E2F30, 0x31323334, 0x3536494A, 0x4B4C4D4E, 0x4F505152, 0x53545556, 0x57606162, 0x96979899, 0x00000000, 0}, // 565
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 566
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61626681, 0x82838485, 0xBABBBCBD, 0x00000000, 0x00000000, 0}, // 567
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 568
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 569
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 570
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 571
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 572
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 573
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 574
        {0x08090A19, 0x2A2B2C49, 0x4A4B4C4D, 0x4E4F5051, 0x52535455, 0x56576061, 0x6263AEAF, 0xB0B10000, 0x00000000, 0x00000000, 0}, // 575
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61628687, 0x8889BEBF, 0xC0C10000, 0x00000000, 0x00000000, 0}, // 576
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 577
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 578
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 579
        {0x01060708, 0x090A1112, 0x14171949, 0x4A4B4C4D, 0x4E4F5051, 0x52535455, 0x56576061, 0x62000000, 0x00000000, 0x00000000, 0}, // 580
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 581
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 582
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 583
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 584
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 585
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 586
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 587
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 588
        {0x00040506, 0x0708090A, 0x0D101112, 0x14181949, 0x4A4B4C4D, 0x4E4F5051, 0x52535455, 0x56576061, 0x62909100, 0x00000000, 0}, // 589
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 590
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 591
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 592
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 593
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 594
        {0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 595
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 596
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 597
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 598
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 599
        {0x04050607, 0x08090A0D, 0x11121416, 0x19494A4B, 0x4C4D4E4F, 0x50515253, 0x54555657, 0x60616200, 0x00000000, 0x00000000, 0}, // 600
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 601
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 602
        {0x01060708, 0x090A1112, 0x13141718, 0x19494A4B, 0x4C4D4E4F, 0x50515253, 0x54555657, 0x6061628E, 0x8F909100, 0x00000000, 0}, // 603
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 604
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 605
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 606
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 607
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 608
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 609
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}, // 610
        {0x08090A19, 0x494A4B4C, 0x4D4E4F50, 0x51525354, 0x55565760, 0x61620000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0}  // 611
};
bool:MasinosRatai(componentid) {

    new
                Ratai2[17] =
                {
                        1025, 1073, 1074, 1075,
                        1076, 1077, 1078, 1079,
                        1080, 1081, 1082, 1083,
                        1084, 1085, 1096, 1097, 1098
                }
        ;

	for (new i = 0; i < sizeof(Ratai2); i++) {

                if (componentid == Ratai2[i])
                        return true;
    }

    return false;
}

bool:MasinuNitro(modelid) {

    new
                nitro[29] =
                {
                        581, 523, 462, 521,
                        463, 522, 461, 448,
                        468, 586, 509, 481,
                        510, 472, 473, 493,
                        595, 484, 430, 453,
                        452, 446, 454, 590,
                        569, 537, 538, 570, 449
                }
        ;

    for (new i = 0; i < sizeof(nitro); i++) {

                if (modelid == nitro[i])
                        return true;
    }
    return false;
}

addVehicleComponent(vehicleid, ...) { 

        addVehicleComponent(vehicleid, Ratai[random(sizeof(Ratai))]);

        ChangeVehiclePaintjob(vehicleid, random(3));
        for (new i = 1; i < numargs(); i++) {

                if (!GalimiTuneDalys(GetVehicleModel(vehicleid), getarg(i, 0)))
                        continue;

                AddVehicleComponent(vehicleid, getarg(i, 0));
        }
        return 1;
}

GalimiTuneDalys(vehicleid, componentid) {

    new
        GalimiMasinosDalys = false
    ;
	if ((MasinosRatai(componentid)) ||
    (componentid == 1086) ||
    (componentid == 1087) ||
    (componentid >= 1008 && componentid <= 1010))
    {
	    new
	        BlokuojamNitro = MasinuNitro(vehicleid)
	    ;
	    if (!BlokuojamNitro)
	    	GalimiMasinosDalys = true;
	}
    else 
    {

	    for (new i = 0; i < sizeof(GalimosMasinosDalys); i++) 
	    {

            if (GalimosMasinosDalys[i]{0} == vehicleid) {

                for (new j = 1; j < 22; j++) {

                    if (GalimosMasinosDalys[i]{j} == componentid)
                    GalimiMasinosDalys = true;
                }
            }
	    }
    }

    return GalimiMasinosDalys;
}
