/*

Sistemos dinamiðkumas perkant tr.priemonë

*/

#include YSI\y_hooks

#define DIALOG_BUY_CAR_LIST 12426
#define DIALOG_BUY_CLASSIC_CAR 12427
#define DIALOG_BUY_MOTO_CAR 12428
#define DIALOG_BUY_SPORT_CAR 12429

//new motoitem[MAX_PLAYERS] = 0;

/*CMD:testcar(playerid)
{	
	carList(playerid);
	return 1;
}*/

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_BUY_CAR_LIST)
	{
	    if(response)
	    {
		   if(listitem == 0)
		   {
		      carClassic(playerid);	
		   }
		   if(listitem == 1)
		   {
		      carMoto(playerid);
		   }  
		   if(listitem == 2)
		   {
		      carSport(playerid);	
		   }
		}   	
	}
	if(dialogid == DIALOG_BUY_CLASSIC_CAR)
	{
		if(response)
		{
			if(listitem == 0)
			{
			   if(GaunamLikuti(565) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);	
               carBuy(playerid, 565, "„Flash“", 32000);
			}
			if(listitem == 1)
			{
			   if(GaunamLikuti(489) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 489, "„Rancher“", 92000);
			}
			if(listitem == 2)
			{
			   if(GaunamLikuti(587) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 587, "„Euros“", 100000);
			}
			if(listitem == 3)
			{
			   if(GaunamLikuti(579) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 579, "„Huntley“", 110000);
			}
			if(listitem == 4)
			{
			   if(GaunamLikuti(482) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);	
               carBuy(playerid, 482, "„Burrito“", 120000);
			}
			if(listitem == 5)
			{
			   if(GaunamLikuti(480) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 480, "„Comet“", 45000);
			}
			if(listitem == 6)
			{
			   if(GaunamLikuti(445) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 445, "„Admiral“", 80000);
			}
			if(listitem == 7)
			{
			   if(GaunamLikuti(551) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 551, "„Merrit“", 30000);
			}
			if(listitem == 8)
			{
			   if(GaunamLikuti(533) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 533, "„Feltzer“", 12000);
			}
			if(listitem == 9)
			{
			   if(GaunamLikuti(555) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 555, "„Windsor“", 18000);
			}
			if(listitem == 10)
			{
			   if(GaunamLikuti(549) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 549, "„Tampa“", 12000);
			}
			if(listitem == 11)
			{
			   if(GaunamLikuti(480) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 480, "„Blista“", 35000);
			}
			if(listitem == 12)
			{
			   if(GaunamLikuti(479) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 479, "„Regina“", 10000);
			}
			if(listitem == 13)
			{
			   if(GaunamLikuti(526) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 526, "„Fortune“", 15000);
			}
			if(listitem == 14)
			{
			   if(GaunamLikuti(536) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 536, "„Blade“", 20000);
			}
			if(listitem == 15)
			{
			   if(GaunamLikuti(561) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 561, "„Stratum“", 18000);
			}
			if(listitem == 16)
			{
			   if(GaunamLikuti(550) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 550, "„Sunrice“", 28000);
			}
			if(listitem == 17)
			{
			   if(GaunamLikuti(410) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 410, "„Manana“", 38000);
			}
			if(listitem == 18)
			{
			   if(GaunamLikuti(439) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 439, "„Stallion“", 12000);
			}
			if(listitem == 19)
			{
			   if(GaunamLikuti(558) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 558, "„Uranus“", 14000);
			}
			if(listitem == 20)
			{
			   if(GaunamLikuti(546) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 546, "„Intruder“", 16000);
			}
			if(listitem == 21)
			{
			   if(GaunamLikuti(458) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carClassic(playerid);		
               carBuy(playerid, 458, "„Solair“", 10000);
			}	
		}
		else carList(playerid);	
	}
	if(dialogid == DIALOG_BUY_MOTO_CAR)
	{
		if(response)
		{
			if(listitem == 0)
			{
			   if(GaunamLikuti(463) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carMoto(playerid);	
               carBuy(playerid, 463, "„Freeway“", 80000);
			}
			if(listitem == 1)
			{
			   if(GaunamLikuti(468) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carMoto(playerid);		
               carBuy(playerid, 468, "„Sanchez“", 28000);
			}
			if(listitem == 2)
			{
			   if(GaunamLikuti(522) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carMoto(playerid);		
               carBuy(playerid, 522, "„NRG-500“", 210000);
			}
			if(listitem == 3)
			{
			   if(GaunamLikuti(586) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carMoto(playerid);		
               carBuy(playerid, 586, "„Wayfarer“", 40000);
			}
			if(listitem == 4)
			{
			   if(GaunamLikuti(581) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carMoto(playerid);		
               carBuy(playerid, 581, "„BF-400“", 50000);
			}
			if(listitem == 5)
			{
			   if(GaunamLikuti(471) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carMoto(playerid);	
               carBuy(playerid, 471, "„Quad“", 25000);
			}
			if(listitem == 6)
			{
			   if(GaunamLikuti(461) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carMoto(playerid);		
               carBuy(playerid, 461, "„PCJ-600“", 70000);
			}	
		}
		else carList(playerid);	
	}
	if(dialogid == DIALOG_BUY_SPORT_CAR)
	{
		if(response)
		{
			if(listitem == 0)
			{
			   if(GaunamLikuti(411) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carSport(playerid);	
               carBuy(playerid, 411, "„Infernus“", 1000000);
			}
			if(listitem == 1)
			{
			   if(GaunamLikuti(506) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carSport(playerid);		
               carBuy(playerid, 506, "„SuperGT“", 500000);
			}
			if(listitem == 2)
			{
			   if(GaunamLikuti(560) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carSport(playerid);		
               carBuy(playerid, 560, "„Sultan“", 200000);
			}
			if(listitem == 3)
			{
			   if(GaunamLikuti(402) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carSport(playerid);		
               carBuy(playerid, 402, "„Buffalo“", 98000);
			}
			if(listitem == 4)
			{
			   if(GaunamLikuti(451) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carSport(playerid);		
               carBuy(playerid, 451, "„Turismo“", 620000);
			}
			if(listitem == 5)
			{
			   if(GaunamLikuti(429) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carSport(playerid);	
               carBuy(playerid, 429, "„Banshee“", 50000);
			}
			if(listitem == 6)
			{
			   if(GaunamLikuti(541) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carSport(playerid);		
               carBuy(playerid, 541, "„Bullet“", 200000);
			}
			if(listitem == 7)
			{
			   if(GaunamLikuti(477) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carSport(playerid);		
               carBuy(playerid, 477, "„ZR-350“", 350000);
			}
			if(listitem == 8)
			{
			   if(GaunamLikuti(562) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carSport(playerid);		
               carBuy(playerid, 562, "„Elegy“", 100000);
			}
			if(listitem == 9)
			{
			   if(GaunamLikuti(415) < 0) return ErorMSG(playerid, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!"), carSport(playerid);		
               carBuy(playerid, 415, "„Cheetah“", 150000);
			}		
		}
		else carList(playerid);	
	}			
	return 1;	
}

stock carList(playerid)
{
	new msg[151];
	format(msg, 151, "{C9AD90}• {FFFFFF}Paprastø tr.priemoniø pirkimas\n{C9AD90}• {FFFFFF}Motociklø pirkimas\n{C9AD90}• {FFFFFF}Sportiniø tr.priemoniø pirkimas");
	ShowPlayerDialogEx(playerid, DIALOG_BUY_CAR_LIST, DIALOG_STYLE_LIST, "Automobiliø salonas", msg, "Pasirinkti", "Atðaukti");
	return 1;
}

stock carClassic(playerid)
{
    new stringas[1600], String[440];
	strcat(stringas, "{C9AD90}Transporto pavadinimas\t{FFFFFF}Degalø sanaudos\t{C9AD90}Bako tûris\t{FFFFFF}Kaina\n");
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}32,000 €\n",TransportoPavadinimai[565-400],DegaluSanaudos[565-400],DegaluBakai[565-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}92,000 €\n",TransportoPavadinimai[489-400],DegaluSanaudos[489-400],DegaluBakai[489-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}100,000 €\n",TransportoPavadinimai[587-400],DegaluSanaudos[587-400],DegaluBakai[587-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}110,000 €\n",TransportoPavadinimai[579-400],DegaluSanaudos[579-400],DegaluBakai[579-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}120,000 €\n",TransportoPavadinimai[482-400],DegaluSanaudos[482-400],DegaluBakai[482-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}45,000 €\n",TransportoPavadinimai[480-400],DegaluSanaudos[480-400],DegaluBakai[480-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}80,000 €\n",TransportoPavadinimai[445-400],DegaluSanaudos[445-400],DegaluBakai[445-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}30,000 €\n",TransportoPavadinimai[551-400],DegaluSanaudos[551-400],DegaluBakai[551-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}12,000 €\n",TransportoPavadinimai[533-400],DegaluSanaudos[533-400],DegaluBakai[533-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}18,000 €\n",TransportoPavadinimai[555-400],DegaluSanaudos[555-400],DegaluBakai[555-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}12,000 €\n",TransportoPavadinimai[549-400],DegaluSanaudos[549-400],DegaluBakai[549-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}35,000 €\n",TransportoPavadinimai[480-400],DegaluSanaudos[480-400],DegaluBakai[480-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}10,000 €\n",TransportoPavadinimai[479-400],DegaluSanaudos[479-400],DegaluBakai[479-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}15,000 €\n",TransportoPavadinimai[526-400],DegaluSanaudos[526-400],DegaluBakai[526-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}20,000 €\n",TransportoPavadinimai[536-400],DegaluSanaudos[536-400],DegaluBakai[536-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}18,000 €\n",TransportoPavadinimai[561-400],DegaluSanaudos[561-400],DegaluBakai[561-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}28,000 €\n",TransportoPavadinimai[550-400],DegaluSanaudos[550-400],DegaluBakai[550-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}38,000 €\n",TransportoPavadinimai[410-400],DegaluSanaudos[410-400],DegaluBakai[410-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}12,000 €\n",TransportoPavadinimai[439-400],DegaluSanaudos[439-400],DegaluBakai[439-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}14,000 €\n",TransportoPavadinimai[558-400],DegaluSanaudos[558-400],DegaluBakai[558-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}16,000 €\n",TransportoPavadinimai[546-400],DegaluSanaudos[546-400],DegaluBakai[546-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}10,000 €\n",TransportoPavadinimai[458-400],DegaluSanaudos[458-400],DegaluBakai[458-400]);
	strcat(stringas, String);
	ShowPlayerDialogEx(playerid, DIALOG_BUY_CLASSIC_CAR, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Paprastø tr.priemoniø pirkimas", stringas, "Pirkti", "Atgal");
	return 1;
}

stock carMoto(playerid)
{
	new stringas[600], String[440];
	strcat(stringas, "{C9AD90}Transporto pavadinimas\t{FFFFFF}Degalø sanaudos\t{C9AD90}Bako tûris\t{FFFFFF}Kaina\n");
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}80,000 €\n",TransportoPavadinimai[463-400],DegaluSanaudos[463-400],DegaluBakai[463-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}28,000 €\n",TransportoPavadinimai[468-400],DegaluSanaudos[468-400],DegaluBakai[468-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}210,000 €\n",TransportoPavadinimai[522-400],DegaluSanaudos[522-400],DegaluBakai[522-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}40,000 €\n",TransportoPavadinimai[586-400],DegaluSanaudos[586-400],DegaluBakai[586-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}50,000 €\n",TransportoPavadinimai[581-400],DegaluSanaudos[581-400],DegaluBakai[581-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}25,000 €\n",TransportoPavadinimai[471-400],DegaluSanaudos[471-400],DegaluBakai[471-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}70,000 €\n",TransportoPavadinimai[461-400],DegaluSanaudos[461-400],DegaluBakai[461-400]);
	strcat(stringas, String);
	ShowPlayerDialogEx(playerid, DIALOG_BUY_MOTO_CAR, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Motociklø pirkimas", stringas, "Pirkti", "Atgal");
	return 1;
}

stock carSport(playerid)
{
	new stringas[1000], String[440];
	strcat(stringas, "{C9AD90}Transporto pavadinimas\t{FFFFFF}Degalø sanaudos\t{C9AD90}Bako tûris\t{FFFFFF}Kaina\n");
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}1,000000 €\n",TransportoPavadinimai[411-400],DegaluSanaudos[411-400],DegaluBakai[411-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}500,000 €\n",TransportoPavadinimai[506-400],DegaluSanaudos[506-400],DegaluBakai[506-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}200,000 €\n",TransportoPavadinimai[560-400],DegaluSanaudos[560-400],DegaluBakai[560-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}98,000 €\n",TransportoPavadinimai[402-400],DegaluSanaudos[402-400],DegaluBakai[402-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}620,000 €\n",TransportoPavadinimai[451-400],DegaluSanaudos[451-400],DegaluBakai[451-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}50,000 €\n",TransportoPavadinimai[429-400],DegaluSanaudos[429-400],DegaluBakai[429-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}200,000 €\n",TransportoPavadinimai[541-400],DegaluSanaudos[541-400],DegaluBakai[541-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}350,000 €\n",TransportoPavadinimai[477-400],DegaluSanaudos[477-400],DegaluBakai[477-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}100,000 €\n",TransportoPavadinimai[562-400],DegaluSanaudos[562-400],DegaluBakai[562-400]);
	strcat(stringas, String);
	format(String, sizeof(String), "{FFFFFF}• {EECBA5}%s\t{FFFFFF}%d km\t{EECBA5}%d l\t{FFFFFF}150,000 €\n",TransportoPavadinimai[415-400],DegaluSanaudos[415-400],DegaluBakai[415-400]);
	strcat(stringas, String);
	ShowPlayerDialogEx(playerid, DIALOG_BUY_SPORT_CAR, DIALOG_STYLE_TABLIST_HEADERS, "{FFFFFF}Sportiniø tr.priemoniø pirkimas", stringas, "Pirkti", "Atgal");
	return 1;
}

stock carBuy(playerid, vehID, vText[], price)
{
            //new model = GetVehicleModel(vehID);	
            if(GaunamLikuti(vehID) < 0)
            {
                SendClientMessage(playerid, RED, "{EB3232}« Transporto priemonës ðiuo metu turguje nëra!");
                return true;
            }         
            if(zInfo[playerid][Transportas1] !=-1 && zInfo[playerid][Transportas2] !=-1 && zInfo[playerid][Transportas3] != -1)
            {
               
                SendClientMessage(playerid, RED, "{EB3232}« Jûs jau turite 3 transporto priemonës");
                return true;
			}
            if(zInfo[playerid][Transportas1] == -1)
            {
                if(GetPlayerMoneyA(playerid) < price)
                {
                    SendClientMessage(playerid, RED, "{EB3232}« Jûs neturite tiek pinigø!");
                    return 1;
                }
                new vID;
                new MasinosVieta = random(5);
                switch(MasinosVieta)
                {
                    //Paprastos maðinos
                    case 0: vID = AddVehicle(vehID, -83.5702, 1350.9775, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 1: vID = AddVehicle(vehID, -83.5702, 1350.9775, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 2: vID = AddVehicle(vehID, -83.0832, 1347.0815, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 3: vID = AddVehicle(vehID, -82.5962, 1342.6985, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 4: vID = AddVehicle(vehID, -82.1092, 1338.8025, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                }
                //ShowPlayerDialogEx(playerid, 12475, DIALOG_STYLE_LIST, "Pasirinkite transporto nukëlimo vietà","Moilers salonas - SanFierro\nAutomobiliø salonas- FortCarson\nMoto salonas - SanFierro","Pasirinkti","Atmesti");
                //tInfo[vID][Turgaus_Car] = true;
                format(tInfo[vID][Savininkas], MAX_PLAYER_NAME, "%s", GetPlayerNameEx(playerid));
                new query[150];
                format(query, sizeof(query), "INSERT INTO `vehicle` (Savininkas) VALUES ('%s')", GetPlayerNameEx(playerid));
                mysql_query( query );
                new msg[150];
                format(msg, 150, "{999900}[TRANSPORTAS]: {999933}Sveikiname jûsø pirma tr. priemonæ %s. Jà rasite paraðæ ~ {999900}/transportas", vText);
                SendClientMessage(playerid, -1, msg);
                zInfo[playerid][Transportas1] = vID;
                GivePlayerMoneyA(playerid, -price);
                SumazinamLikuti(vehID);
                Pelnas[8]+=price/8;
                SaveBVP();
                new /*str1[500],*/ RandomColor;
                RandomColor = random(126);
                /*format(str1, 500,"{C9AD90}Transporto priemonës pavadinimas: {EECBA5}%s\n{C9AD90}Degalø sanaudos {EECBA5}%d litrai á kilometrà\n{C9AD90}Bendrasis kuro bako tûris {EECBA5}%d litrai\n{C9AD90}Transporto pirkimo kaina {EECBA5}%d eurø\n{C9AD90}Ðiuo metu turima {EECBA5}%d vnt.",TransportoPavadinimai[model-400],DegaluSanaudos[model-400],DegaluBakai[model-400],GetModelPrice(model),GaunamLikuti(model));
                Update3DTextLabelText(tInfo[model][Turgaus3D], -1, str1);*/
                SetVehicleHealth(vID , 1000.0);
                //ChangeVehicleColor(vID, 0);
                for(new tune = 0; tune < 13; tune++) tInfo[vID][vTune][tune] = 0;
                tInfo[vID][Paintjob] = -1;
                tInfo[vID][Uzraktas]= true;
                tInfo[vID][Rida] = 0.0;
                tInfo[vID][Registruota] = false;
                tInfo[vID][Technikine] = false;
                tInfo[vID][MasinaParduodama] = false;
                tInfo[vID][mParduodamaKaina] = 0;
                tInfo[vID][vOwned] = true;
                tInfo[vID][Color1] = RandomColor;
                tInfo[vID][Color2] = RandomColor;
                format(tInfo[vID][Tranzitiniai], 24, "{FF0000}%i%i%i%i%iBJ", random(10), random(10), random(10), random(10), random(10));
                SetVehicleNumberPlate(vID, tInfo[vID][Tranzitiniai]);
                SetVehicleToRespawn(vID);
                tInfo[vID][Degalai] = DegaluBakai[GetVehicleModel(vID)-400];
                switch(GetVehicleModel(vID))
                {
                    //benzinas
                    case 461, 462, 463, 468, 471, 521, 522, 402, 562, 411, 451, 560, 506, 415, 429, 480, 541, 555, 559, 495, 426, 517, 534, 561: tInfo[vID][DegaluTipas]= 0;
                    //dyzelis
                    case 565, 400, 489, 554, 579, 436, 439, 445, 458, 529, 549, 550: tInfo[vID][DegaluTipas]= 1;
                }
                SavePlayerVehicle(playerid, false);
               
                if(!zInfo[playerid][Pasiekimas7])
                {
		            zInfo[playerid][Pasiekimas7] = true;
		            zInfo[playerid][paskutpas] = 2;
                    format(query, sizeof(query), "UPDATE zaidejai SET Pasiekimas7 = '1' WHERE vardas = '%s'",GetPlayerNameEx(playerid));
                    mysql_query(query);
		            SendClientMessage(playerid, -1, "{ff9966}• P • {FFFFFF}Ávygdei transporto pasiekima, gavai {ff9966}5 {FFFFFF}kreditø, {ff9966}100XP {FFFFFF}ir {ff9966}1500€!");
                    zInfo[playerid][kreditai]+=5;
                    SetPlayerScore(playerid, GetPlayerScore(playerid) + 100);
                    GivePlayerMoneyA(playerid,1500);
                }
            }
            else if(zInfo[playerid][Transportas2] == -1)
            {
                if(GetPlayerMoneyA(playerid) < price)
                {
                    SendClientMessage(playerid, RED, "{EB3232}« Jûs neturite tiek pinigø!");
                    return 1;
                }
                new vID;
                new MasinosVieta = random(5);
                switch(MasinosVieta)
                {
                    //Paprastos maðinos
                    case 0: vID = AddVehicle(vehID, -83.5702, 1350.9775, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 1: vID = AddVehicle(vehID, -83.5702, 1350.9775, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 2: vID = AddVehicle(vehID, -83.0832, 1347.0815, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 3: vID = AddVehicle(vehID, -82.5962, 1342.6985, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 4: vID = AddVehicle(vehID, -82.1092, 1338.8025, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                }
                //ShowPlayerDialogEx(playerid, 12475, DIALOG_STYLE_LIST, "Pasirinkite transporto nukëlimo vietà","Moilers salonas - SanFierro\nAutomobiliø salonas- FortCarson\nMoto salonas - SanFierro","Pasirinkti","Atmesti");
                //tInfo[vID][Turgaus_Car] = true;
                format(tInfo[vID][Savininkas], MAX_PLAYER_NAME, "%s", GetPlayerNameEx(playerid));
                new query[150];
                format(query, sizeof(query), "INSERT INTO `vehicle2` (Savininkas) VALUES ('%s')", GetPlayerNameEx(playerid));
                mysql_query( query );
                new msg[150];
                format(msg, 150, "{999900}[TRANSPORTAS]: {999933}Sveikiname jûsø antra tr. priemonæ %s. Jà rasite paraðæ ~ {999900}/transportas", vText);
                SendClientMessage(playerid, -1, msg);
                zInfo[playerid][Transportas2] = vID;
                GivePlayerMoneyA(playerid, -price);
                SumazinamLikuti(vehID);
                Pelnas[8]+=price/8;
                SaveBVP();
                new /*str1[500],*/ RandomColor;
                RandomColor = random(126);
                /*format(str1, 500,"{C9AD90}Transporto priemonës pavadinimas: {EECBA5}%s\n{C9AD90}Degalø sanaudos {EECBA5}%d litrai á kilometrà\n{C9AD90}Bendrasis kuro bako tûris {EECBA5}%d litrai\n{C9AD90}Transporto pirkimo kaina {EECBA5}%d eurø\n{C9AD90}Ðiuo metu turima {EECBA5}%d vnt.",TransportoPavadinimai[model-400],DegaluSanaudos[model-400],DegaluBakai[model-400],GetModelPrice(model),GaunamLikuti(model));
                Update3DTextLabelText(tInfo[model][Turgaus3D], -1, str1);*/
                SetVehicleHealth(vID , 1000.0);
                //ChangeVehicleColor(vID, 0);
                for(new tune = 0; tune < 13; tune++) tInfo[vID][vTune][tune] = 0;
                tInfo[vID][Paintjob] = -1;
                tInfo[vID][Uzraktas]= true;
                tInfo[vID][Rida] = 0.0;
                tInfo[vID][Registruota] = false;
                tInfo[vID][Technikine] = false;
                tInfo[vID][MasinaParduodama] = false;
                tInfo[vID][mParduodamaKaina] = 0;
                tInfo[vID][vOwned] = true;
                tInfo[vID][Color1] = RandomColor;
                tInfo[vID][Color2] = RandomColor;
                format(tInfo[vID][Tranzitiniai], 24, "{FF0000}%i%i%i%i%iBJ", random(10), random(10), random(10), random(10), random(10));
                SetVehicleNumberPlate(vID, tInfo[vID][Tranzitiniai]);
                SetVehicleToRespawn(vID);
                tInfo[vID][Degalai] = DegaluBakai[GetVehicleModel(vID)-400];
                switch(GetVehicleModel(vID))
                {
                    //benzinas
                    case 461, 462, 463, 468, 471, 521, 522, 402, 562, 411, 451, 560, 506, 415, 429, 480, 541, 555, 559, 495, 426, 517, 534, 561: tInfo[vID][DegaluTipas]= 0;
                    //dyzelis
                    case 565, 400, 489, 554, 579, 436, 439, 445, 458, 529, 549, 550: tInfo[vID][DegaluTipas]= 1;
                }
                SavePlayerVehicle2(playerid, false);
               
            }
            else if(zInfo[playerid][Transportas3] == -1)
            {
                if(GetPlayerMoneyA(playerid) < price)
                {
                    SendClientMessage(playerid, RED, "{EB3232}« Jûs neturite tiek pinigø!");
                    return 1;
                }
                new vID;
                new MasinosVieta = random(5);
                switch(MasinosVieta)
                {
                    //Paprastos maðinos
                    case 0: vID = AddVehicle(vehID, -83.5702, 1350.9775, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 1: vID = AddVehicle(vehID, -83.5702, 1350.9775, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 2: vID = AddVehicle(vehID, -83.0832, 1347.0815, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 3: vID = AddVehicle(vehID, -82.5962, 1342.6985, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                    case 4: vID = AddVehicle(vehID, -82.1092, 1338.8025, 10.8689, 95.5000, -1, -1, -1, VT_PLAYER, playerid);
                }
                //ShowPlayerDialogEx(playerid, 12475, DIALOG_STYLE_LIST, "Pasirinkite transporto nukëlimo vietà","Moilers salonas - SanFierro\nAutomobiliø salonas- FortCarson\nMoto salonas - SanFierro","Pasirinkti","Atmesti");
                //tInfo[vID][Turgaus_Car] = true;
                format(tInfo[vID][Savininkas], MAX_PLAYER_NAME, "%s", GetPlayerNameEx(playerid));
                new query[150];
                format(query, sizeof(query), "INSERT INTO `vehicle3` (Savininkas) VALUES ('%s')", GetPlayerNameEx(playerid));
                mysql_query( query );
                new msg[150];
                format(msg, 150, "{999900}[TRANSPORTAS]: {999933}Sveikiname jûsø treèia tr. priemonæ %s. Jà rasite paraðæ ~ {999900}/transportas", vText);
                SendClientMessage(playerid, -1, msg);
                zInfo[playerid][Transportas3] = vID;
                GivePlayerMoneyA(playerid, -price);
                SumazinamLikuti(vehID);
                Pelnas[8]+=price/8;
                SaveBVP();
                new /*str1[500],*/ RandomColor;
                RandomColor = random(126);
                /*format(str1, 500,"{C9AD90}Transporto priemonës pavadinimas: {EECBA5}%s\n{C9AD90}Degalø sanaudos {EECBA5}%d litrai á kilometrà\n{C9AD90}Bendrasis kuro bako tûris {EECBA5}%d litrai\n{C9AD90}Transporto pirkimo kaina {EECBA5}%d eurø\n{C9AD90}Ðiuo metu turima {EECBA5}%d vnt.",TransportoPavadinimai[model-400],DegaluSanaudos[model-400],DegaluBakai[model-400],GetModelPrice(model),GaunamLikuti(model));
                Update3DTextLabelText(tInfo[model][Turgaus3D], -1, str1);*/
                SetVehicleHealth(vID , 1000.0);
                //ChangeVehicleColor(vID, 0);
                for(new tune = 0; tune < 13; tune++) tInfo[vID][vTune][tune] = 0;
                tInfo[vID][Paintjob] = -1;
                tInfo[vID][Uzraktas]= true;
                tInfo[vID][Rida] = 0.0;
                tInfo[vID][Registruota] = false;
                tInfo[vID][Technikine] = false;
                tInfo[vID][MasinaParduodama] = false;
                tInfo[vID][mParduodamaKaina] = 0;
                tInfo[vID][vOwned] = true;
                tInfo[vID][Color1] = RandomColor;
                tInfo[vID][Color2] = RandomColor;
                format(tInfo[vID][Tranzitiniai], 24, "{FF0000}%i%i%i%i%iBJ", random(10), random(10), random(10), random(10), random(10));
                SetVehicleNumberPlate(vID, tInfo[vID][Tranzitiniai]);
                SetVehicleToRespawn(vID);
                tInfo[vID][Degalai] = DegaluBakai[GetVehicleModel(vID)-400];
                switch(GetVehicleModel(vID))
                {
                    //benzinas
                    case 461, 462, 463, 468, 471, 521, 522, 402, 562, 411, 451, 560, 506, 415, 429, 480, 541, 555, 559, 495, 426, 517, 534, 561: tInfo[vID][DegaluTipas]= 0;
                    //dyzelis
                    case 565, 400, 489, 554, 579, 436, 439, 445, 458, 529, 549, 550: tInfo[vID][DegaluTipas]= 1;
                }
                SavePlayerVehicle3(playerid, false);
                return 1;
               
			}
	        return 1;
}

