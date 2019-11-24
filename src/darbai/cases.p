/*

- Case system su coins

*/

#include YSI\y_hooks

new BRONZE_USER, SILVER_USER, GOLD_USER;

stock load_cases()
{
    mysql_query("SELECT bronze_user, silver_user, gold_user FROM `gambling`");
    mysql_store_result();

    new BRONZE_KINT, SILVER_KINT, GOLD_KINT, KINT_FET[200];
    while(mysql_fetch_row_format(KINT_FET))
    {
      sscanf(KINT_FET, "p<|>ddd", BRONZE_KINT, SILVER_KINT, GOLD_KINT);

      BRONZE_USER = BRONZE_KINT;
      SILVER_USER = SILVER_KINT;
      GOLD_USER = GOLD_KINT;
    }

    mysql_free_result();

    return 1;
}

stock save_cases()
{
    new SQL[100];
    mysql_query("SELECT * FROM `gambling`");
    mysql_store_result();

    if(mysql_num_rows())
    {
       format(SQL, sizeof(SQL), "UPDATE `gambling` SET `bronze_user` = '%d', `silver_user` = '%d', `gold_user` = '%d'", BRONZE_USER, SILVER_USER, GOLD_USER);
       mysql_query(SQL);
    }
    else 
    {
       format(SQL, sizeof(SQL), "INSERT INTO `gambling` (`bronze_user`, `silver_user`, `gold_user`) VALUES ('%d', '%d', '%d')", BRONZE_USER, SILVER_USER, GOLD_USER);
       mysql_query(SQL);
    }
    return 1;
}    


CMD:gambling(playerid, params[])
{
	//if(zInfo[playerid][admin] < 5) return 0;
  new str[500], fstr[60];
  format(fstr, 60, "{FFFFFF}Turimi {ff6666}%d {FFFFFF}coins", zInfo[playerid][coins]);
  format(str, 500, "{ff6666}Pavadinimas\t{FFFFFF}Atidarë\n{ff6666}• {FFFFFF}Bronze\t{ff6666}%d {FFFFFF}þaidëjø\n{ff6666}• {FFFFFF}Silver\t{ff6666}%d {FFFFFF}þaidëjø\n{ff6666}• {FFFFFF}Gold\t{ff6666}%d {FFFFFF}þaidëjø\n \n{ff6666}» {FFFFFF}Iðsiuskite þinute: \n{FFFFFF}iv3 {ff6666}tautvis96 %s {FFFFFF}coins \n{FFFFFF}numeriu {ff6666}1679 {FFFFFF}kaina 3.00€", BRONZE_USER, SILVER_USER, GOLD_USER, GetPlayerNameEx(playerid));

	ShowPlayerDialogEx(playerid, 12441, DIALOG_STYLE_TABLIST_HEADERS, fstr, str, "Pasirinkti", "Atðaukti");
    return 1;
}

/*hook OnPlayerSpawn(playerid)
{
	if(zInfo[playerid][admin] == 5)
	{
		SuccesMSG(playerid, "Papildë 24 coins.");
		zInfo[playerid][coins] += 24;
	}
	return 1;
}*/

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == 12441) //Case sistema b•t• renka i•coins 
    {
		if(response)
		{
			 switch(listitem)
			 {
				 case 0: ShowPlayerDialogEx(playerid, 12442, DIALOG_STYLE_MSGBOX, "Bronze case","{FFFFFF}Atrakinus Bronze case gausite (random):\n{ff6666}• {FFFFFF}300 kreditø\n{ff6666}• {FFFFFF}Administratorius 2 lygio statusà(30 dienø)\n{ff6666}• {FFFFFF}8500 patirties taðkø","Atrakinti","Atðaukti");
				 case 1: ShowPlayerDialogEx(playerid, 12443, DIALOG_STYLE_MSGBOX, "Silver case","{FFFFFF}Atrakinus Silver case gausite (random):\n{ff6666}• {FFFFFF}600 kreditø\n{ff6666}• {FFFFFF}Iðkirtinë apranga (Vidutinës klasës)\n{ff6666}• {FFFFFF}70.000€ serverio pinigø","Atrakinti","Atðaukti");
	 			 case 2: ShowPlayerDialogEx(playerid, 12444, DIALOG_STYLE_MSGBOX, "Gold case","{FFFFFF}Atrakinus Gold case gausite (random):\n{ff6666}• {FFFFFF}Iðkirtinis transportas\n{ff6666}• {FFFFFF}1200 kreditø\n{ff6666}• {FFFFFF}Iðkirtinë aprangà(Aukðtos klasës)","Atrakinti","Atðaukti");
			 }
		}
	}
	if(dialogid == 12442)
	{
		if(response)
		{
			    if(zInfo[playerid][coins] < 3) return ErrorMsg(playerid, "Neturite 3 coins!"); //Pigiausias case 3 eur = 3 coins

                BRONZE_USER ++;
                  save_cases();

                new case_rand = randomEx(1, 3);
                if(case_rand == 1)
                {
                	SendClientMessage(playerid, YELLOW, "300 kreditø laimëjote :)");
                    zInfo[playerid][kreditai] += 300;
                	zInfo[playerid][coins] -= 3;
                }
                else if(case_rand == 2)
                {
                	SendClientMessage(playerid, YELLOW, "2 lygio administratoriaus statusà laimëjote :)");
                    zInfo[playerid][admin] = 2;
                    zInfo[playerid][AdminLaikas] = gettime() + 2592000;
                	zInfo[playerid][coins] -= 3;
                }
                else if(case_rand == 3)
                {
                	SendClientMessage(playerid, YELLOW, "8500 patirties taðkø laimëjote :)");
                    SetPlayerScore(playerid, GetPlayerScore(playerid) + 8500);
                	zInfo[playerid][coins] -= 3;
                }
             //else ErrorMsg(playerid, "Neturite coins pasipildykite!");
		}
	}
    if(dialogid == 12443)
	{
		if(response)
		{
			    if(zInfo[playerid][coins] < 6) return ErrorMsg(playerid, "Neturite 6 coins!"); //Vidutinio dyd•io case 6 eur = 6 coins
        
                SILVER_USER ++;
                  save_cases(); 

                new case_rand = randomEx(1, 3);
                if(case_rand == 1)
                {
                	SendClientMessage(playerid, YELLOW, "600 kreditø laimëjote :)");
                    zInfo[playerid][kreditai] += 600;
                	zInfo[playerid][coins] -= 6;
                }
                else if(case_rand == 2)
                {
                    new case_r2 = random(3);
                    switch(case_r2)
                    {
                        case 0: 
                        {
                          if(zInfo[playerid][lytis] == 1)
                          { 
                             zInfo[playerid][drabuziai] = 12;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë Rich Woman (Vidutinës klasës) skin laimëjote :)");
                          }
                          else 
                          {
                             zInfo[playerid][drabuziai] = 36;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë Golfer (Vidutinës klasës) skin laimëjote :)");
                          }  
                        }
                        case 1: 
                        {
                          if(zInfo[playerid][lytis] == 1)
                          { 
                             zInfo[playerid][drabuziai] = 40;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë Normal Ped (Vidutinës klasës) skin laimëjote :)");
                          }
                          else 
                          {
                             zInfo[playerid][drabuziai] = 35;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë Gardener (Vidutinës klasës) skin laimëjote :)");
                          } 
                        }
                        case 2:
                        {
                          if(zInfo[playerid][lytis] == 1)
                          { 
                             zInfo[playerid][drabuziai] = 63;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë Prostitute (Vidutinës klasës) skin laimëjote :)");
                          }
                          else 
                          {
                             zInfo[playerid][drabuziai] = 51;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë Mountain Biker (Vidutinës klasës) skin laimëjote :)");
                          }
                        }
                    }
                	zInfo[playerid][coins] -= 6;
                }
                else if(case_rand == 3)
                {
                	SendClientMessage(playerid, YELLOW, "70.000€ serverio pinigø laimëjote :)");
                    GivePlayerMoneyA(playerid, 70000);
                	zInfo[playerid][coins] -= 6;
                }
             //else ErrorMsg(playerid, "Neturite coins pasipildykite!");
		}
	}
    if(dialogid == 12444)
	{
		if(response)
		{
			    if(zInfo[playerid][coins] < 12) return ErrorMsg(playerid, "Neturite 12 coins!"); //Brangiausias case 12 eur = 12 coins
    
                GOLD_USER ++;
                  save_cases();

                new case_rand = randomEx(1, 3);
                if(case_rand == 1)
                {
                    new case_rc2 = random(3);
                    switch(case_rc2)
                    {
                        case 0: carBuy(playerid, 495, "SandKing", 0);
                        case 1: carBuy(playerid, 434, "Hotknife", 0);
                        case 2: carBuy(playerid, 444, "Monster", 0);
                        case 3: carBuy(playerid, 503, "Hotring B", 0);
                        case 4: carBuy(playerid, 572, "Mover", 0);
                        case 5: carBuy(playerid, 545, "Hustler", 0);
                    }
                	zInfo[playerid][coins] -= 12;
                }
                else if(case_rand == 2)
                {
                    new case_r3 = random(3);
                    switch(case_r3)
                    {
                        case 0: 
                        {
                          if(zInfo[playerid][lytis] == 1)
                          { 
                             zInfo[playerid][drabuziai] = 76;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë Stewardess (Aukðtos klasës) skin laimëjote :)");
                          }
                          else 
                          {
                             zInfo[playerid][drabuziai] = 83;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë White Elvis (Aukðtos klasës) skin laimëjote :)");
                          }  
                        }
                        case 1: 
                        {
                          if(zInfo[playerid][lytis] == 1)
                          { 
                             zInfo[playerid][drabuziai] = 90;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë Jogger (Aukðtos klasës) skin laimëjote :)");
                          }
                          else 
                          {
                             zInfo[playerid][drabuziai] = 97;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë Lifeguard (Aukðtos klasës) skin laimëjote :)");
                          } 
                        }
                        case 2:
                        {
                          if(zInfo[playerid][lytis] == 1)
                          { 
                             zInfo[playerid][drabuziai] = 195;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë Denise Robinson (Aukðtos klasës) skin laimëjote :)");
                          }
                          else 
                          {
                             zInfo[playerid][drabuziai] = 119;
                             SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
                             zInfo[playerid][skinStatus] = SKINSTATUS_NORMAL;
                             SendClientMessage(playerid, YELLOW, "Iðkirtinë Johhny Sindacco (Aukðtos klasës) skin laimëjote :)");
                          }
                        }
                    }
                	zInfo[playerid][coins] -= 12;
                }
                else if(case_rand == 3)
                {
                	SendClientMessage(playerid, YELLOW, "1200 kreditø laimëjote :)");
                    zInfo[playerid][kreditai] += 1200;
                	zInfo[playerid][coins] -= 12;
                }
             //else ErrorMsg(playerid, "Neturite coins pasipildykite!");
		}
	}
	return 1;
}