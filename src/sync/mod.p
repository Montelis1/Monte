/*

Priþiûrëtojø sistemà

*/

#include YSI\y_hooks

//AVB priþiûrëtojas
#define AVB_MOD 15465
#define AVB_MOD_WRITE 15466
#define AVB_MOD_ADMIN_ON_WARN 15467
#define AVB_MOD_ADMIN_OFF_WARN 15468
#define AVB_MOD_VIP_ON_WARN 15469
#define AVB_MOD_VIP_OFF_WARN 15470
#define AVB_MOD_UNBAN_IP 15471
#define AVB_MOD_UNBAN_TIME 15472

//DPKT priþiûrëtojas
#define DPKT_MOD 15473
#define DPKT_MOD_WRITE 15474
#define DPKT_MOD_ADD_LEADER 15475
#define DPKT_MOD_ADD_CLEADER 15476 
#define DPKT_MOD_REMOVE_LEADER 15477
#define DPKT_MOD_REMOVE_CLEADER 15488
#define DPKT_MOD_JOB_ID 15479
#define DPKT_MOD_LEADER_ON_WARN 15480
#define DPKT_MOD_LEADER_OFF_WARN 15481
#define DPKT_MOD_REMOVE_CONTRACT 15482
#define DPKT_MOD_REMOVE_LEADER_WARN 15483

//Gaujø priþiûrëtojas
#define GP_MOD 15484
#define GP_MOD_WRITE 15485
#define GP_MOD_GANG_REMOVE 15486

CMD:priziuretojas(playerid)
{
    if(!zInfo[playerid][aPriziuretojas] && !zInfo[playerid][dPriziuretojas] && !zInfo[playerid][bPriziuretojas] && zInfo[playerid][admin] < 4) return false;
    ShowPlayerDialogEx(playerid, DIALOG_PRIZIURETOJAS, DIALOG_STYLE_LIST, "Priþiûrëtojas", "AVB priþiûrëtojas\nDirektoriø priþiûrëtojas\nGaujø priþiûrëtojas", "Rinktis", "Iðeiti");
    return true;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_PRIZIURETOJAS)
	{
		if(response)
		{
			if(listitem == 0)
			{
				str_AVB(playerid);
			}
			if(listitem == 1)
			{
				str_DPKT(playerid);
			}
			if(listitem == 2)
			{
				str_GP(playerid);
			}
		}
	}
	if(dialogid == AVB_MOD)
	{
		if(response)
		{
			if(listitem == 1)
			{
               ShowPlayerDialogEx(playerid, AVB_MOD_WRITE, DIALOG_STYLE_INPUT, "Vieðas praneðimas", "Áraðykite tekstà kurá vieðai paskelbsite", "Áraðyti","Ne");
			}
			if(listitem == 2)
			{
               ShowPlayerDialogEx(playerid, AVB_MOD_ADMIN_ON_WARN, DIALOG_STYLE_INPUT, "Áspëti administratoriø (ONLINE)", "Áraðykite administratoriaus Vardas_Pavarde", "Áraðyti","Ne");
			}
			if(listitem == 3)
			{
               ShowPlayerDialogEx(playerid, AVB_MOD_ADMIN_OFF_WARN, DIALOG_STYLE_INPUT, "Áspëti administratoriø (OFFLINE)", "Áraðykite administratoriaus Vardas_Pavarde", "Áraðyti","Ne");
			}
			if(listitem == 4)
			{
               ShowPlayerDialogEx(playerid, AVB_MOD_VIP_ON_WARN, DIALOG_STYLE_INPUT, "Áspëti VIP nará (ONLINE)", "Áraðykite VIP nario Vardas_Pavarde", "Áraðyti","Ne");
			}
			if(listitem == 5)
			{
               ShowPlayerDialogEx(playerid, AVB_MOD_VIP_OFF_WARN, DIALOG_STYLE_INPUT, "Áspëti VIP nará (OFFLINE)", "Áraðykite VIP nario Vardas_Pavarde", "Áraðyti","Ne");
			}
			if(listitem == 6)
			{
               ShowPlayerDialogEx(playerid, AVB_MOD_UNBAN_IP, DIALOG_STYLE_INPUT, "Atblokuoti IP adresà", "Áraðykite þaidëjo Vardas_Pavarde", "Áraðyti","Ne");
			}
			if(listitem == 7)
			{
               ShowPlayerDialogEx(playerid, AVB_MOD_UNBAN_TIME, DIALOG_STYLE_INPUT, "Nuimti laikinà uþblokavimà", "Áraðykite þaidëjo Vardas_Pavarde", "Áraðyti","Ne");
			}
			if(listitem == 9)
			{
               new str[160];
               format(str, 160, "Pavadinimas\tPuslapis\nUþblokuoti þaidëjai\tNr.1\nUþblokuoti þaidëjai\tNr.2\nUþblokuoti þaidëjai\tNr.3\nUþblokuoti þaidëjai\tNr.4\nUþblokuoti þaidëjai\tNr.5");
	           ShowPlayerDialogEx(playerid, 12505, DIALOG_STYLE_TABLIST_HEADERS, "Ban sàraðas", str ,"Pasirinkti","Atðaukti");
			}
			if(listitem == 10)
			{
               mysql_query("SELECT vardas,Admin FROM zaidejai WHERE Admin > '0'");
	           mysql_store_result();
	           new aVardas[MAX_PLAYER_NAME], a, resultline[50], str[330], String[1697], aAdmin[20], aStatus[20], kAdmin;
	           while(mysql_fetch_row_format(resultline))
	           {
                  a++;
                  sscanf(resultline,"p<|>s[24]d", aVardas, kAdmin);
                  if(kAdmin > 0)
		          {
		            if(kAdmin == 1) aAdmin = "1";
		            else if(kAdmin == 2) aAdmin = "2";
		            else if(kAdmin == 3) aAdmin = "3";
		            else if(kAdmin == 4) aAdmin = "4";
		            else if(kAdmin == 5) aAdmin = "5";
		          }
		          if(GetPlayeridMid(aVardas) != INVALID_PLAYER_ID ) { aStatus = "{00FF00}yra"; } else { aStatus = "{FF0000}nëra"; }
		          format(str, sizeof(str), "{669966}%d {FFFFFF}Administratorius: {669966}%s | {FFFFFF}Lygis: {669966}%s | {FFFFFF}Online: {669966}%s\n", a, aVardas, aAdmin, aStatus);
		          strcat(String, str);
		       }   
	           ShowPlayerDialogEx(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "Administratoriø sàraðas", String, "Uþdaryti","");
	           mysql_free_result();
			}
		}
	}
	if(dialogid == AVB_MOD_WRITE)
	{
		if(response)
		{
           new leader_name[MAX_PLAYER_NAME], leader_text[256], leader_tp[156];
           GetPlayerName(playerid, leader_name, MAX_PLAYER_NAME);
           format(leader_tp, 156, "{cc9966}AVB priþiûrëtojas {cc9933}%s{cc9966}({cc9933}%i{cc9966}) praneða:", leader_name, playerid);
		   format(leader_text, 256, "{FFFFFF}%s", inputtext);
		   SendClientMessageToAll(-1, leader_tp);
		   SendClientMessageToAll(-1, leader_text);
		}
		else str_AVB(playerid);
	}
	if(dialogid == AVB_MOD_ADMIN_ON_WARN)
	{
		if(response)
		{
           new player_name[MAX_PLAYER_NAME], str[225];
           strmid(player_name, inputtext, 0, sizeof(player_name));
           new id = GetPlayeridMid(player_name);
           GetPlayerName(id, player_name, sizeof(player_name));
           if(sscanf(inputtext, "u", id)) return ShowPlayerDialogEx(playerid, AVB_MOD_ADMIN_ON_WARN, DIALOG_STYLE_INPUT, "Áspëti administratoriø (ONLINE)", "Áraðykite administratoriaus Vardas_Pavarde", "Áraðyti","Ne");
           zInfo[id][AdminIspejimai] ++;
           format(str, 225, "Jûs %s davëte administratoriaus áspëjimà %s ið viso jis turi (%d/3)",GetPlayerNameEx(playerid), player_name, zInfo[id][AdminIspejimai]);
           SendClientMessage(playerid, -1, str);
           format(str, 225, "Gavote nuo %s administratoriaus áspëjimà ið viso turite (%d/3).", GetPlayerNameEx(playerid), zInfo[id][AdminIspejimai]);
		   SendClientMessage(id, -1, str);
           SavePlayerData(id);
           if(zInfo[id][AdminIspejimai] > 2)
           {
           	  format(str, 225, "Jûs praradote administratoriaus pareigas nes %s uþdëjo treèià áspëjimà", GetPlayerNameEx(playerid));
           	  SendClientMessage(id, -1, str);
           	  format(str, 225, "Paðalinote ið administratoriaus pareigø %s nes surinko 3 áspëjimus", player_name);
           	  SendClientMessage(playerid, -1, str);
           	  zInfo[id][admin] = 0;
           	  zInfo[id][AdminIspejimai] = 0;
           	  zInfo[id][AdminLaikas] = 0;
           	  SavePlayerData(id);
           }
		}
		else str_AVB(playerid);   
	}
	if(dialogid == AVB_MOD_ADMIN_OFF_WARN)
	{
		if(response)
		{
           new player_name[MAX_PLAYER_NAME], str[225], AdminYes, AdminWarnings;
           strmid(player_name, inputtext, 0, sizeof(player_name));
           new id = GetPlayeridMid(player_name);
           GetPlayerName(id, player_name, sizeof(player_name));
           if(sscanf(inputtext, "u", id)) return ShowPlayerDialogEx(playerid, AVB_MOD_ADMIN_OFF_WARN, DIALOG_STYLE_INPUT, "Áspëti administratoriø (OFFLINE)", "Áraðykite administratoriaus Vardas_Pavarde", "Áraðyti","Ne");
		   if(id != INVALID_PLAYER_ID) return ShowPlayerDialogEx(playerid, AVB_MOD_ADMIN_OFF_WARN, DIALOG_STYLE_INPUT, "Áspëti administratoriø (OFFLINE)", "ÞAIDËJAS YRA ÞAIDIME! Áraðykite administratoriaus Vardas_Pavarde", "Áraðyti","Ne");
           format(str, 225, "SELECT * FROM zaidejai WHERE vardas = '%s'", player_name);
           mysql_query(str);
           mysql_store_result();
           mysql_retrieve_row();
           if(mysql_num_rows())
           {
           	  mysql_fetch_field_row(str, "Admin"); AdminYes = strval(str);
           	  mysql_fetch_field_row(str, "AdminIspejimai"); AdminWarnings = strval(str);

           	  if(AdminYes == -1)
           	  {
                 if(AdminWarnings > 1)
                 {
                 	SendClientMessage(playerid, RED, "Þaidëjas surinko 3 áspëjimas todël iðmestas ið administratoriaus pareigø.");
                 	format(str, 225, "UPDATE zaidejai SET Admin = '0', AdminIspejimai = '0', AdminLaikas = '0' WHERE vardas = '%s'", player_name);
                 	mysql_query(str);
                 }
                 else
                 {
                 	SendClientMessage(playerid, BLUE, "Administratorius gavo + 1 áspëjimà");
                 	format(str, 225, "UPDATE zaidejai SET AdminIspejimai = '%d', WHERE vardas = '%s'", (AdminWarnings + 1), player_name);
                 	mysql_query(str);
                 }

                 

           	  }
           	  else ErrorMsg(playerid, "Þaidëjas nëra administratorius!");
           }
           else ErrorMsg(playerid, "Tokio þaidëjo duomenø bazëje nëra!");

		}
		else str_AVB(playerid);
	}
	if(dialogid == AVB_MOD_VIP_ON_WARN)
	{
		if(response)
		{
           new player_name[MAX_PLAYER_NAME], str[225];
           strmid(player_name, inputtext, 0, sizeof(player_name));
           new id = GetPlayeridMid(player_name);
           GetPlayerName(id, player_name, sizeof(player_name));
           if(sscanf(inputtext, "u", id)) return ShowPlayerDialogEx(playerid, AVB_MOD_VIP_ON_WARN, DIALOG_STYLE_INPUT, "Áspëti VIP nará (ONLINE)", "Áraðykite VIP nario Vardas_Pavarde", "Áraðyti","Ne");
           zInfo[id][VipIspejimai] ++;
           format(str, 225, "Jûs %s davëte VIP nario áspëjimà %s ið viso jis turi (%d/3)",GetPlayerNameEx(playerid), player_name, zInfo[id][VipIspejimai]);
           SendClientMessage(playerid, -1, str);
           format(str, 225, "Gavote nuo %s VIP nario áspëjimà ið viso turite (%d/3).", GetPlayerNameEx(playerid), zInfo[id][VipIspejimai]);
		   SendClientMessage(id, -1, str);
           SavePlayerData(id);
           if(zInfo[id][VipIspejimai] > 2)
           {
           	  format(str, 225, "Jûs praradote VIP nario pareigas nes %s uþdëjo treèià áspëjimà", GetPlayerNameEx(playerid));
           	  SendClientMessage(id, -1, str);
           	  format(str, 225, "Paðalinote ið VIP nario pareigø %s nes surinko 3 áspëjimus", player_name);
           	  SendClientMessage(playerid, -1, str);
           	  zInfo[id][vip] = 0;
           	  zInfo[id][VipIspejimai] = 0;
           	  zInfo[id][vplaikas] = 0;
           	  SavePlayerData(id);
           }
		}
		else str_AVB(playerid);
	}
	if(dialogid == AVB_MOD_VIP_OFF_WARN)
	{
		if(response)
		{
           new player_name[MAX_PLAYER_NAME], str[225], VipYes, VipWarnings;
           strmid(player_name, inputtext, 0, sizeof(player_name));
           new id = GetPlayeridMid(player_name);
           GetPlayerName(id, player_name, sizeof(player_name));
           if(sscanf(inputtext, "u", id)) return ShowPlayerDialogEx(playerid, AVB_MOD_VIP_OFF_WARN, DIALOG_STYLE_INPUT, "Áspëti VIP nará (OFFLINE)", "Áraðykite VIP nario Vardas_Pavarde", "Áraðyti","Ne");
		   if(id != INVALID_PLAYER_ID) return ShowPlayerDialogEx(playerid, AVB_MOD_VIP_OFF_WARN, DIALOG_STYLE_INPUT, "Áspëti VIP nará (OFFLINE)", "Áraðykite VIP nario Vardas_Pavarde", "Áraðyti","Ne");
           format(str, 225, "SELECT * FROM zaidejai WHERE vardas = '%s'", player_name);
           mysql_query(str);
           mysql_store_result();
           mysql_retrieve_row();
           if(mysql_num_rows())
           {
           	  mysql_fetch_field_row(str, "vip"); VipYes = strval(str);
           	  mysql_fetch_field_row(str, "VipIspejimai"); VipWarnings = strval(str);

           	  if(VipYes == -1)
           	  {
                 if(VipWarnings > 1)
                 {
                 	SendClientMessage(playerid, RED, "Þaidëjas surinko 3 áspëjimas todël iðmestas ið VIP nario pareigø.");
                 	format(str, 225, "UPDATE zaidejai SET vip = '0', VipIspejimai = '0', vplaikas = '0' WHERE vardas = '%s'", player_name);
                 	mysql_query(str);
                 }
                 else
                 {
                 	SendClientMessage(playerid, BLUE, "VIP narys gavo + 1 áspëjimà");
                 	format(str, 225, "UPDATE zaidejai SET VipIspejimai = '%d', WHERE vardas = '%s'", (VipWarnings + 1), player_name);
                 	mysql_query(str);
                 }

                 

           	  }
           	  else ErrorMsg(playerid, "Þaidëjas nëra VIP narys!");
           }
           else ErrorMsg(playerid, "Tokio þaidëjo duomenø bazëje nëra!");
		}
		else str_AVB(playerid);
	}
	if(dialogid == AVB_MOD_UNBAN_IP)
	{
		if(response)
		{
           new player_name[MAX_PLAYER_NAME], str[225], Banned;
           strmid(player_name, inputtext, 0, sizeof(player_name));
           new id = GetPlayeridMid(player_name);
           GetPlayerName(id, player_name, sizeof(player_name));
           if(sscanf(inputtext, "u", id)) return ShowPlayerDialogEx(playerid, AVB_MOD_UNBAN_IP, DIALOG_STYLE_INPUT, "Atblokuoti IP adresà", "Áraðykite þaidëjo Vardas_Pavarde", "Áraðyti","Ne");
		   if(id != INVALID_PLAYER_ID) return ShowPlayerDialogEx(playerid, AVB_MOD_UNBAN_IP, DIALOG_STYLE_INPUT, "Atblokuoti IP adresà", "Áraðykite þaidëjo Vardas_Pavarde", "Áraðyti","Ne");
           format(str, 225, "SELECT * FROM zaidejai WHERE vardas = '%s'", player_name);
           mysql_query(str);
           mysql_store_result();
           mysql_retrieve_row();
           if(mysql_num_rows())
           {
              mysql_fetch_field_row(str, "Uzbanintas"); Banned = strval(str);

              if(Banned != -1)
              {
              	 SendClientMessage(playerid, -1, "Þaidëjo IP adresas atblokuotas");
                 format(str, 225, "UPDATE zaidejai SET Uzbanintas = '0' WHERE Vardas = '%s'", player_name);
                 mysql_query(str);
                 format(str, 225, "SELECT * FROM bans WHERE Vardas = '%s'", player_name);
                 mysql_query(str);
                 mysql_store_result();
                 mysql_retrieve_row();
                 if(mysql_num_rows())
                 {
                 	format(str, 225, "DELETE FROM bans WHERE Vardas = '%s'", player_name);
                 	mysql_query(str);
                 }
              }
              else ErrorMsg(playerid, "Þaidëjas nëra uþblokuotas!");
		
           }
           else ErrorMsg(playerid, "Tokio þaidëjo duomenø bazëje nëra!");
		}
		else str_AVB(playerid);

	}
	if(dialogid == AVB_MOD_UNBAN_TIME)
	{
		if(response)
		{
           new player_name[MAX_PLAYER_NAME], str[225], BannedTime;
           strmid(player_name, inputtext, 0, sizeof(player_name));
           new id = GetPlayeridMid(player_name);
           GetPlayerName(id, player_name, sizeof(player_name));
           if(sscanf(inputtext, "u", id)) return ShowPlayerDialogEx(playerid, AVB_MOD_UNBAN_TIME, DIALOG_STYLE_INPUT, "Nuimti laikinà uþblokavimà", "Áraðykite þaidëjo Vardas_Pavarde", "Áraðyti","Ne");
		       if(id != INVALID_PLAYER_ID) return ShowPlayerDialogEx(playerid, AVB_MOD_UNBAN_TIME, DIALOG_STYLE_INPUT, "Nuimti laikinà uþblokavimà", "Áraðykite þaidëjo Vardas_Pavarde", "Áraðyti","Ne");
           format(str, 225, "SELECT * FROM zaidejai WHERE vardas = '%s'", player_name);
           mysql_query(str);
           mysql_store_result();
           mysql_retrieve_row();
           if(mysql_num_rows())
           {
              mysql_fetch_field_row(str, "UzbanintasLaikui"); BannedTime = strval(str);

              if(BannedTime != -1)
              {
              	 SendClientMessage(playerid, -1, "Þaidëjui laiko uþblokavimas nuimtas");
                 format(str, 225, "UPDATE zaidejai SET KiekLaikoBan = '0' WHERE Vardas = '%s'", player_name);
                 mysql_query(str);
              }
              else ErrorMsg(playerid, "Þaidëjas nëra uþblokuotas!");
		
           }
           else ErrorMsg(playerid, "Tokio þaidëjo duomenø bazëje nëra!");
		}
		else str_AVB(playerid);
	}
	if(dialogid == DPKT_MOD)
    {
		if(response)
		{
			if(listitem == 1)
			{
               ShowPlayerDialogEx(playerid, DPKT_MOD_WRITE, DIALOG_STYLE_INPUT, "Vieðas praneðimas", "Áraðykite tekstà kurá vieðai paskelbsite", "Áraðyti","Ne");
			}
      if(listitem == 2)
      {
               ShowPlayerDialogEx(playerid, DPKT_MOD_ADD_LEADER, DIALOG_STYLE_INPUT, "Uþdëti direktoriø", "Áraðykite þaidëjo slapyvardá ir darbo ID", "Áraðyti","Ne");
      }
      if(listitem == 3)
      {
               ShowPlayerDialogEx(playerid, DPKT_MOD_ADD_CLEADER, DIALOG_STYLE_INPUT, "Uþdëti pavaduotojà", "Áraðykite þaidëjo slapyvardá ir darbo ID (Áraðius 0 ID tiesiog nuimsite direktoriø)", "Áraðyti","Ne");
      }
      if(listitem == 4)
      {
               ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_LEADER, DIALOG_STYLE_INPUT, "Nuimti direktoriø (OFF)", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
      }
      if(listitem == 5)
      {
               ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_CLEADER, DIALOG_STYLE_INPUT, "Nuimti pavaduotojà (OFF)", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
      }
      if(listitem == 6)
      {
               return cmd_darbuid(playerid);
      }
      if(listitem == 7)
      {
               ShowPlayerDialogEx(playerid, DPKT_MOD_LEADER_ON_WARN, DIALOG_STYLE_INPUT, "Áspëti direktoriø (ONLINE)", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
      }
      if(listitem == 8)
      {
               ShowPlayerDialogEx(playerid, DPKT_MOD_LEADER_OFF_WARN, DIALOG_STYLE_INPUT, "Áspëti direktoriø (OFFLINE)", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
      }
      if(listitem == 9)
      {
               ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_CONTRACT, DIALOG_STYLE_INPUT, "Nuimti kontraktà", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
      }
      if(listitem == 10)
      {
               ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_LEADER_WARN, DIALOG_STYLE_INPUT, "Nuimti áspëjimà", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
      }
		}
	}	
	if(dialogid == DPKT_MOD_WRITE)
	{
		if(response)
		{
           new leader_name[MAX_PLAYER_NAME], leader_text[256], leader_tp[156];
           GetPlayerName(playerid, leader_name, MAX_PLAYER_NAME);
           format(leader_tp, 156, "{cc9966}Direktoriø priþiûrëtojas {cc9933}%s{cc9966}({cc9933}%i{cc9966}) praneða:", leader_name, playerid);
		   format(leader_text, 256, "{FFFFFF}%s", inputtext);
		   SendClientMessageToAll(-1, leader_tp);
		   SendClientMessageToAll(-1, leader_text);
		}
		else str_DPKT(playerid);
	}
  if(dialogid == DPKT_MOD_ADD_LEADER)
  {
    if(response)
    {
      new leader_id, job_id, post[24], masyvas[128];
      if(sscanf(inputtext, "ud", leader_id, job_id)) return ShowPlayerDialogEx(playerid, DPKT_MOD_ADD_LEADER, DIALOG_STYLE_INPUT, "Uþdëti direktoriø", "Áraðykite þaidëjo slapyvardá ir darbo ID", "Áraðyti","Ne");
      else if(!IsPlayerConnected(playerid)) return ShowPlayerDialogEx(playerid, DPKT_MOD_ADD_LEADER, DIALOG_STYLE_INPUT, "Uþdëti direktoriø", "TOKIO ÞAIDËJO NËRA! Áraðykite þaidëjo slapyvardá ir darbo ID", "Áraðyti","Ne");
      else
      {
        if(job_id == 0)
        {
            SendClientMessage(playerid, GREEN, "* Jus ka tik nuëmëte þaidëjui Direktoriø!");
            SendClientMessage(leader_id, RED, "{ffff00}[PAREIGOS]:{999999} Jûs esate paðalintas ið direktoriaus posto!");
            zInfo[leader_id][dyrikz]=0;
            return 1;
        }
        if(job_id ==1) format(post, 24, "Policijos");
        else if(job_id ==2) format(post, 24, "Taksistø");
        else if(job_id ==3) format(post, 24, "Mechanikø");
        //else if(job_id ==4) format(post, 24, "Prekeiviø");
        else if(job_id ==5) format(post, 24, "Medikø");
        else if(job_id ==6) format(post, 24, "Perveþëjø tarnybos");
        else if(job_id ==13) format(post, 24, "Medeljino kartelio");
        //else if(job_id ==14) format(post, 24, "Italø mafijos");
        else if(job_id ==15) format(post, 24, "FTB");
        //else if(job_id ==16) format(post, 24, "Teisësaugos");
        else format(post, 24, "Jokiu"), zInfo[leader_id][dyrikz]=0;
        zInfo[leader_id][dyrikz] = job_id;
        format(masyvas, sizeof(masyvas), "* Sveikiname, jûs paskirtas naujuoju %s direktoriumi!",post);
        SendClientMessage(leader_id, GREEN, masyvas);
        zInfo[leader_id][DrkIspejimai] = 0;
        zInfo[leader_id][KontraktoLaikas] = 0;
        //zInfo[id][PicerijosStazas]+=168;
        format(masyvas, sizeof(masyvas), "* Paskyrëte %s naujuoju %s direktoriumi!",GetPlayerNameEx(leader_id),post);
        SendClientMessage(playerid, GREEN, masyvas);

        format(masyvas, sizeof(masyvas), "UPDATE zaidejai SET direktorius = '%d' WHERE vardas = '%s'", zInfo[leader_id][dyrikz], GetPlayerNameEx(leader_id));
        mysql_query(masyvas);

        if(!zInfo[leader_id][Pasiekimas1])
        {
            zInfo[leader_id][Pasiekimas1] = true;
            zInfo[leader_id][paskutpas] = 6;
            new query[200];
            format(query, sizeof(query), "UPDATE zaidejai SET Pasiekimas1 = '1' WHERE vardas = '%s'",GetPlayerNameEx(leader_id));
            mysql_query(query);
            SendClientMessage(leader_id, -1, "{ff9966}• P • {FFFFFF}Ivygdei direktoriaus pasiekima, gavai {ff9966}5 {FFFFFF}kreditø, {ff9966}100XP {FFFFFF}ir {ff9966}2500€!");
            zInfo[playerid][kreditai]+=5;
            SetPlayerScore(leader_id, GetPlayerScore(leader_id) + 100);
            GivePlayerMoneyA(leader_id,2500);
        }
      }
    }
    else str_DPKT(playerid);
  }
  if(dialogid == DPKT_MOD_ADD_CLEADER)
  {
    if(response)
    {
      new leader_id, job_id, post[24], masyvas[128];
      if(sscanf(inputtext, "ud", leader_id, job_id)) return ShowPlayerDialogEx(playerid, DPKT_MOD_ADD_CLEADER, DIALOG_STYLE_INPUT, "Uþdëti pavaduotojà", "Áraðykite þaidëjo slapyvardá ir darbo ID", "Áraðyti","Ne");
      else if(!IsPlayerConnected(playerid)) return ShowPlayerDialogEx(playerid, DPKT_MOD_ADD_CLEADER, DIALOG_STYLE_INPUT, "Uþdëti pavaduotojà", "TOKIO ÞAIDËJO NËRA! Áraðykite þaidëjo slapyvardá ir darbo ID", "Áraðyti","Ne");
      else
      {
        if(job_id == 0)
        {
            SendClientMessage(playerid, GREEN, "* Jus ka tik nuëmëte þaidëjui Pavaduotojà!");
            SendClientMessage(leader_id, RED, "{ffff00}[PAREIGOS]:{999999} Jûs esate paðalintas ið pavaduotojo posto!");
            zInfo[leader_id][pavaz]=0;
            return 1;
        }
        if(job_id ==1) format(post, 24, "Policijos");
        else if(job_id ==2) format(post, 24, "Taksistø");
        else if(job_id ==3) format(post, 24, "Mechanikø");
        //else if(job_id ==4) format(post, 24, "Prekeiviø");
        else if(job_id ==5) format(post, 24, "Medikø");
        else if(job_id ==6) format(post, 24, "Perveþëjø tarnybos");
        else if(job_id ==13) format(post, 24, "Medeljino kartelio");
        //else if(job_id ==14) format(post, 24, "Italø mafijos");
        else if(job_id ==15) format(post, 24, "FTB");
        //else if(job_id ==16) format(post, 24, "Teisësaugos");
        else format(post, 24, "Jokiu"), zInfo[leader_id][pavaz]=0;
        zInfo[leader_id][pavaz] = job_id;
        format(masyvas, sizeof(masyvas), "* Sveikiname, jûs paskirtas naujuoju %s pavaduotoju!",post);
        SendClientMessage(leader_id, GREEN, masyvas);
        //zInfo[id][DrkIspejimai] = 0;
        zInfo[leader_id][KontraktoLaikas] = 0;
        //zInfo[id][PicerijosStazas]+=168;
        format(masyvas, sizeof(masyvas), "* Paskyrëte %s naujuoju %s pavaduotoju!",GetPlayerNameEx(leader_id),post);
        SendClientMessage(playerid, GREEN, masyvas);

        format(masyvas, sizeof(masyvas), "UPDATE zaidejai SET pavaduotojas = '%d' WHERE vardas = '%s'", zInfo[leader_id][pavaz], GetPlayerNameEx(leader_id));
        mysql_query(masyvas);
      }
    }
    else str_DPKT(playerid);
  }
  if(dialogid == DPKT_MOD_REMOVE_LEADER)
  {
    if(response)
    {
           new player_name[MAX_PLAYER_NAME], str[225], lead_off;
           strmid(player_name, inputtext, 0, sizeof(player_name));
           new id = GetPlayeridMid(player_name);
           GetPlayerName(id, player_name, sizeof(player_name));
           if(sscanf(inputtext, "u", id)) return ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_LEADER, DIALOG_STYLE_INPUT, "Nuimti direktoriø", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
           if(id != INVALID_PLAYER_ID) return ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_LEADER, DIALOG_STYLE_INPUT, "Nuimti direktoriø", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
           format(str, 225, "SELECT * FROM zaidejai WHERE vardas = '%s'", player_name);
           mysql_query(str);
           mysql_store_result();
           mysql_retrieve_row();
           if(mysql_num_rows())
           {
              mysql_fetch_field_row(str, "direktorius"); lead_off = strval(str);

              if(!lead_off)
              {
                  ErrorMsg(playerid, "Þaidëjas nëra direktorius!");
              }
              else
              {
                 if(lead_off > 0)
                 {
                    SendClientMessage(playerid, RED, "Þaidëjas iðmestas ið direktoriaus pareigø.");
                    format(str, 225, "UPDATE zaidejai SET direktorius = '0' WHERE vardas = '%s'", player_name);
                    mysql_query(str);
                 }
              }
           }
           else ErrorMsg(playerid, "Tokio þaidëjo duomenø bazëje nëra!");
    }
    else str_DPKT(playerid);
  }
  if(dialogid == DPKT_MOD_REMOVE_CLEADER)
  {
    if(response)
    {
           new player_name[MAX_PLAYER_NAME], str[225], clead_off;
           strmid(player_name, inputtext, 0, sizeof(player_name));
           new id = GetPlayeridMid(player_name);
           GetPlayerName(id, player_name, sizeof(player_name));
           if(sscanf(inputtext, "u", id)) return ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_CLEADER, DIALOG_STYLE_INPUT, "Nuimti pavaduotojà", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
           if(id != INVALID_PLAYER_ID) return ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_CLEADER, DIALOG_STYLE_INPUT, "Nuimti pavaduotojà", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
           format(str, 225, "SELECT * FROM zaidejai WHERE vardas = '%s'", player_name);
           mysql_query(str);
           mysql_store_result();
           mysql_retrieve_row();
           if(mysql_num_rows())
           {
              mysql_fetch_field_row(str, "pavaduotojas"); clead_off = strval(str);

              if(clead_off == -1)
              {
                  SendClientMessage(playerid, RED, "Þaidëjas iðmestas ið pavaduotojaus pareigø.");
                  format(str, 225, "UPDATE zaidejai SET pavaduotojas = '0' WHERE vardas = '%s'", player_name);
                  mysql_query(str);

              }
              //else ErrorMsg(playerid, "Þaidëjas nëra pavaduotojas!");
           }
           else ErrorMsg(playerid, "Tokio þaidëjo duomenø bazëje nëra!");
    }
    else str_DPKT(playerid);
  }
  if(dialogid == DPKT_MOD_LEADER_ON_WARN)  
  {
    if(response)
    {
      new leader_id, masyvas[128], vardas[MAX_PLAYER_NAME];
      if(sscanf(inputtext, "u", leader_id)) return ShowPlayerDialogEx(playerid, DPKT_MOD_LEADER_ON_WARN, DIALOG_STYLE_INPUT, "Áspëti direktoriø (ONLINE)", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
      else if(!IsPlayerConnected(playerid)) return ShowPlayerDialogEx(playerid, DPKT_MOD_LEADER_ON_WARN, DIALOG_STYLE_INPUT, "Áspëti direktoriø (ONLINE)", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
      else
      {
        zInfo[leader_id][DrkIspejimai] += 1;
        GetPlayerName(leader_id, vardas, sizeof(vardas));
        format(masyvas, 128, "* Áspëjote direktoriø %s, jis dabar turi %d áspëjimus!",vardas,zInfo[leader_id][DrkIspejimai]);
        SendClientMessage(playerid, RED, masyvas);

        format(masyvas, 128, "* Jûs gavote direktoriø áspëjimà ir dabar turite %d áspëjimus!",zInfo[leader_id][DrkIspejimai]);
        SendClientMessage(leader_id, RED, masyvas);
        if(zInfo[leader_id][DrkIspejimai] >= 3)
        {
            zInfo[leader_id][dyrikz] = 0;
            zInfo[leader_id][DrkIspejimai] = 0;
            format(masyvas, 128, "* Direktorius %s surinko 3 áspëjimus, todël buvo paðalintas ið pareigø!",vardas);
            SendClientMessage(playerid, RED, masyvas);

            SendClientMessage(leader_id, RED, "Jûs surinkote 3 direktoriaus áspëjimus, todël buvote paðalintas ið pareigø!");
        }
      }  
    }
    else str_DPKT(playerid);
  }
  if(dialogid == DPKT_MOD_LEADER_OFF_WARN)
  {
    if(response)
    {
    new uQuerry[150], arAdminas, aIspejimai, zzVardas[MAX_PLAYER_NAME];
    if(sscanf(inputtext, "s[24]", zzVardas)) return ShowPlayerDialogEx(playerid, DPKT_MOD_LEADER_OFF_WARN, DIALOG_STYLE_INPUT, "Áspëti direktoriø (OFFLINE)", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
    new pID = GetPlayeridMid(zzVardas);
    if(pID != INVALID_PLAYER_ID) return ShowPlayerDialogEx(playerid, DPKT_MOD_LEADER_OFF_WARN, DIALOG_STYLE_INPUT, "Áspëti direktoriø (OFFLINE)", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
    format(uQuerry, 150, "SELECT * FROM `zaidejai` WHERE `vardas` = '%s'", zzVardas);
    mysql_query(uQuerry);
    mysql_store_result();
    mysql_retrieve_row();
    if(mysql_num_rows())
    {
        mysql_fetch_field_row(uQuerry, "direktorius"); arAdminas = strval(uQuerry);
        mysql_fetch_field_row(uQuerry, "DrkIspejimai"); aIspejimai = strval(uQuerry);
        if(arAdminas == 0)
        {
            SendClientMessage(playerid, RED, "{EB3232}« Þaidëjas ne direktorius!");
        }
        else
        {
            if(aIspejimai > 1)
            {
                SendClientMessage(playerid, RED, "{ffffff}>{0066ff} Þaidëjas surinko 3/3 áspëjimus ir buvo iðmestas ið direktoriaus pareigø.");
                format(uQuerry, 150, "UPDATE zaidejai SET `direktorius` = '0', `DrkIspejimai` = '0' WHERE `vardas` = '%s'", zzVardas);
                mysql_query(uQuerry);
            }
            else
            {
                format(uQuerry, 150, "UPDATE zaidejai SET `DrkIspejimai` = '%d' WHERE `vardas` = '%s'", (aIspejimai + 1), zzVardas);
                mysql_query(uQuerry);
                SendClientMessage(playerid, BLUE, "{ffffff}>{0066ff} Direktorius gavo 1 áspëjimà!");
            }
        }
    }
    else
    {
        SendClientMessage(playerid, RED, "{EB3232}« Tokio vartotojo duomenø bazëje nëra.");
    }
    }
    else str_DPKT(playerid);
  }
  if(dialogid == DPKT_MOD_REMOVE_CONTRACT)
  {
    if(response)
    {
    new id;
    if(sscanf(inputtext, "u",id)) return ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_CONTRACT, DIALOG_STYLE_INPUT, "Nuimti kontraktà", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
    else if(!IsPlayerConnected(id)) return ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_CONTRACT, DIALOG_STYLE_INPUT, "Nuimti kontraktà", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
    else
    {
        zInfo[id][KontraktoLaikas] = gettime();
        SendClientMessage(playerid, -1, "Þaidëjui nuëmëte darbo kontraktà!");
        SendClientMessage(id, -1, "Jums buvo nuimtas darbo kontraktas!");
    }
    }
    else str_DPKT(playerid);
  }
  if(dialogid == DPKT_MOD_REMOVE_LEADER_WARN)
  {
    if(response)
    {
    new id, vardas[MAX_PLAYER_NAME], masyvas[128];
    if(sscanf(inputtext, "u",id)) return ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_LEADER_WARN, DIALOG_STYLE_INPUT, "Nuimti áspëjimà", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
    else if(!IsPlayerConnected(id)) return ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_LEADER_WARN, DIALOG_STYLE_INPUT, "Nuimti áspëjimà", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
    else if(zInfo[id][dyrikz] == 0) return ShowPlayerDialogEx(playerid, DPKT_MOD_REMOVE_LEADER_WARN, DIALOG_STYLE_INPUT, "Nuimti áspëjimà", "Áraðykite þaidëjo slapyvardá", "Áraðyti","Ne");
    else
    {
        if(zInfo[id][DrkIspejimai] != 0)
        {
            zInfo[id][DrkIspejimai] -= 1;
            GetPlayerName(id, vardas, sizeof(vardas));
            format(masyvas, 128, "* Nuëmëte áspëjimà direktoriui %s, jis dabar turi %d áspëjimus!",vardas,zInfo[id][DrkIspejimai]);
            SendClientMessage(playerid, RED, masyvas);

            format(masyvas, 128, "* Jums nuëmë direktoriaus áspëjimà ir dabar turite %d áspëjimus!",vardas,zInfo[id][DrkIspejimai]);
            SendClientMessage(id, RED, masyvas);
        }
        else
        {
            SendClientMessage(playerid, RED, "Direktorius áspëjimø neturi.");
            return 1;
        }

    }
    }
    else str_DPKT(playerid);
  }
	if(dialogid == GP_MOD)
    {
		if(response)
		{
			if(listitem == 1)
			{
               ShowPlayerDialogEx(playerid, GP_MOD_WRITE, DIALOG_STYLE_INPUT, "Vieðas praneðimas", "Áraðykite tekstà kurá vieðai paskelbsite", "Áraðyti","Ne");
			}
			if(listitem == 2)
			{
               return cmd_gaujos(playerid);
			}
			if(listitem == 3)
			{
               ShowPlayerDialogEx(playerid, GP_MOD_GANG_REMOVE, DIALOG_STYLE_INPUT, "Gaujos sunaikinimas", "Áraðykite ID kurià gaujà norite panaikinti", "Áraðyti","Ne");
			}
			if(listitem == 4)
			{
               mysql_query("UPDATE `zaidejai` SET `gaujosID` = '-1'");
               SendClientMessage(playerid, YELLOW, "Visoms gaujoms nariø sàraðas sëkmingas pravalytas.");
			}
		}
	}	
	if(dialogid == GP_MOD_WRITE)
	{
		if(response)
		{
           new leader_name[MAX_PLAYER_NAME], leader_text[256], leader_tp[156];
           GetPlayerName(playerid, leader_name, MAX_PLAYER_NAME);
           format(leader_tp, 156, "{cc9966}Gaujø priþiûrëtojas {cc9933}%s{cc9966}({cc9933}%i{cc9966}) praneða:", leader_name, playerid);
		   format(leader_text, 256, "{FFFFFF}%s", inputtext);
		   SendClientMessageToAll(-1, leader_tp);
		   SendClientMessageToAll(-1, leader_text);
		}
		else str_GP(playerid);
	}
	if(dialogid == GP_MOD_GANG_REMOVE)
	{
		if(response)
		{
           new gang;

	       if (sscanf(inputtext, "i", gang)) return ShowPlayerDialogEx(playerid, GP_MOD_GANG_REMOVE, DIALOG_STYLE_INPUT, "Gaujos sunaikinimas", "Áraðykite gaujos ID kurià norite panaikinti", "Áraðyti","Ne");

	       if (destroyGang(gang) == INVALID_GANG_ID)
	       {
		       ErrorMsg(playerid, "Tokia gauja neegzistuoja");
		       return 1;
	       }

	       SendClientMessage(playerid, GREEN, "Gauja sëkmingai sunaikinta");
		}
		else str_GP(playerid);
	}
	return 1;
}

stock str_AVB(playerid)
{
    if(!zInfo[playerid][aPriziuretojas]) return ErrorMsg(playerid, "Jûs ne AVB priþiûrëtojas!"), false;

	new str[454+1];
	format(str, sizeof(str), "%sJûsø statusas: {ff9966}AVB\n", str);
    format(str, sizeof(str), "%s{ff9966}• {FFFFFF}Raðyti praneðimà\n{ff9966}• {FFFFFF}Áspëti administratoriø\n{ff9966}• {FFFFFF}Áspëti atsijungusá administra", str);
    format(str, sizeof(str), "%storiø\n{ff9966}• {FFFFFF}Áspëti VIP nará\n{ff9966}• {FFFFFF}Áspëti atsijungusá VIP nará", str);
    format(str, sizeof(str), "%s\n{ff9966}• {FFFFFF}Atblokuoti þaidëjo IP adresà\n{ff9966}• {FFFFFF}Atblokuoti þadëjà kuris gavo (laiko ban)\n \n", str);
    format(str, sizeof(str), "%s{ff9966}» {FFFFFF}Perþiûrësite uþblokuotus þaidëjus\n{ff9966}» {FFFFFF}Perþiûrësite serverio administratorius\n \n{ff9966}» {FFFFFF}Administratoriø komandos /akomandos", str);
	ShowPlayerDialogEx(playerid, AVB_MOD, DIALOG_STYLE_LIST, "Priþiûrëtojo valdymas", str, "Pasirinkti", "Atðaukti");
	return 1;
}

stock str_DPKT(playerid)
{
    if(!zInfo[playerid][dPriziuretojas]) return ErrorMsg(playerid, "Jûs ne DPKT priþiûrëtojas!"), false;

	new str[454+70];
	format(str, sizeof(str), "%sJûsø statusas: {ff9966}DPKT\n", str);
    format(str, sizeof(str), "%s{ff9966}• {FFFFFF}Raðyti praneðimà\n{ff9966}• {FFFFFF}Uþdëti þaidëjui direktoriø\n{ff9966}• {FFFFFF}Uþdëti þaidëjui pavad", str);
    format(str, sizeof(str), "%suotojà\n{ff9966}• {FFFFFF}Nuimti þaidëjui direktoriø\n{ff9966}• {FFFFFF}Nuimti þaidëjui pavaduotojà", str);
    format(str, sizeof(str), "%s\n{ff9966}• {FFFFFF}Darbø ID sàraðas\n{ff9966}• {FFFFFF}Áspëti direktoriø þaidime\n", str);
    format(str, sizeof(str), "%s{ff9966}• {FFFFFF}Áspëti direktoriø atsijungusá\n{ff9966}• {FFFFFF}Nuimti þaidëjui kontraktà\n{ff9966}• {FFFFFF}Nuimti direktoriui áspëjimà\n \n{ff9966}» {FFFFFF}Administratoriø komandos /akomandos", str);
	ShowPlayerDialogEx(playerid, DPKT_MOD, DIALOG_STYLE_LIST, "Priþiûrëtojo valdymas", str, "Pasirinkti", "Atðaukti");
	return 1;
}

stock str_GP(playerid)
{
	if(!zInfo[playerid][bPriziuretojas]) return ErrorMsg(playerid, "Jûs ne GP priþiûrëtojas!"), false;
	
	new str[454+1];
	format(str, sizeof(str), "%sJûsø statusas: {ff9966}GP\n", str);
    format(str, sizeof(str), "%s{ff9966}• {FFFFFF}Raðyti praneðimà\n{ff9966}• {FFFFFF}Perþiûrëti visas gaujas\n{ff9966}• {FFFFFF}Panaikinti serverio gaujà", str);
    format(str, sizeof(str), "%s\n{ff9966}• {FFFFFF}Visø gaujø nariø pravalymas\n \n{ff9966}» {FFFFFF}Administratoriø komandos /akomandos", str);
	ShowPlayerDialogEx(playerid, GP_MOD, DIALOG_STYLE_LIST, "Priþiûrëtojo valdymas", str, "Pasirinkti", "Atðaukti");
	return 1;
}