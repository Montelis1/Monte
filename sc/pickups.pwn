enum pdata
{
	parasiutas,
	//Dm area
	dmevent,
	saudg,
	wangcars,
	restorp,
	degalubakelis,
	autoaibep,
	//---------------Darbu---------------------
	policijad,
	Taksid,
	mechanikaid[2],
	dyleriaid,
	medikaid[2],
	furistaid,
	GroveStreetd,
	Ballasd,
	swatd,
	armijad,
	elektriku,
	swatg,
	armijag,
	armijapar,
	//be pakvietimo
	pica,
	kpriz,
	elektrikai,
	autobusai,
	valytojai,
	traukiniai,
	picosemimas,
	//--------------Darbu gunai----------------
	dyleriug,
	furistug,
	GroveStreetg,
	Ballasg,
	policijosg,
	//----------------kita----------------------
	investicijos,
	baudap[2],
	paskola,
	pastininkai,
	zvejyba,
	reinfo,
	infona[2],
	//buspirk[8],
	teo,
	edalaspic,
	pasirasymas,
	edalasmes,
	burgerakr,
	burgerakr2,
	edalaskav,
	//edalasjail,
	edalashp,
	jailpab,
	hotdog,
	ligankst[2],
	geralas,
	turgus[2],
	turgus1[2],
	turgus2[2],
	turgus3[2],
	jailas,
	jailas1,
	jailas2,
	narkotik,
	TechinkosParduotuve,
	algos,
	tverslopick,
	teorija[3],
	Swedbanksask,
	pilotai,
	busast,
	kuzsakymas,
	Taros1,
	Taros2,
	//Taros3,
	//Taros4,
	TarosInfo,
	ginklai,
	dguns,
	kiosk,
	drabuziai,
	degaline,
	infoskelbimas,
	zinformacija,
	dyleriaisandelis,
	//KMA,
	praktikapick,
	BaseinoInfo,
	DazasvaidzioInfo,
	NewbieHeal[4],
	//gelbetojaig,
	kontraktopick,
	PriklausPick,
	plaukikoskin,
	boxininkoskin,
	PaprastuPasikrovimas1,
	SportiniuPasikrovimas1,
	MotocikluPasikrovimas1,
	LaivoShop[2],
	kombainoshop,
    kombEnter,
    kombExit,
    kombFasEnter,
    kombFasExit,
    kombPerEnter,
    kombPerExit,
    kombPerTable1,
    kombPerTable2,
    kombPerTable3,
    kombPerTable4,
    kombPerTable5,
    kombPerTable6,
    kombPerTable7,
    kombPerTable8,
    kombFasTable1,
    kombFasTable2,
    kombFasTable3,
   	SekluPickup,
   	ChemijosPickup,
   	GinkluPickup,
   	//JailFood
}
new pickups[2][pdata];

stock LoadPickups()
{
	//pickups[0][SekluPickup]=CreatePickupA(1575 ,1, 1366.2372,2536.7512,10.8084);//VM
	//pickups[0][ChemijosPickup]=CreatePickupA(1579 ,1, 1367.2880,2572.3523,10.8084);//VM
	//pickups[0][GinkluPickup]=CreatePickupA(1576 ,1, 1099.5392,1785.1641,10.8203);//VM

	//pickups[0][picosemimas] = CreatePickupA(2814,14,174.4969,1176.5288,14.7785);

	//pickups[0][Taros1] = CreatePickupA(1239, 2, 2154.9758,2837.1563,10.8224);
	pickups[0][Taros2] = CreatePickupA(1239, 2, -1515.7699,2590.2502,55.8359);
	//pickups[0][Taros3] = CreatePickupA(1239, 2, -45.7608,1084.2869,19.6879);
	//pickups[0][Taros4] = CreatePickupA(1239, 2, -43.2134,1072.7665,19.7093);
	
	//pickups[0][TarosInfo] = CreatePickupA(1239, 2, 2151.4250,2837.6465,10.8203);

	//pickups[0][KMA]=CreatePickupA(1318 ,1, 1098.8689,2285.7458,10.8126);
	//pickups[1][KMA]=CreatePickupA(1318 ,1, 1103.1812,2285.6675,10.8203);

    pickups[0][PaprastuPasikrovimas1]=CreatePickupA(2485 ,14, 1606.6802,733.4780,10.8203);

    pickups[0][SportiniuPasikrovimas1]=CreatePickupA(2485 ,14, 1725.4883,733.4746,10.8203);
    
    pickups[0][MotocikluPasikrovimas1]=CreatePickupA(2485 ,14, 1664.2148,733.4662,10.8203);


    pickups[0][PriklausPick]=CreatePickupA(1241 ,2, -201.6960,-1739.3796,675.7687);//Dyleriø darbas... FC

	/*Darbai
	pickups[0][policijad]=CreatePickupA(1210 ,2, 242.1651,1416.5299,470.1775);//Policijos kaime FC
	pickups[0][armijad]=CreatePickupA(1210 ,2, 603.5590,1224.3289,2001.0487);//Miðkininkai kaime BB
	//pickups[0][Taksid]=CreatePickupA(1210 ,2, -2454.8533,503.9111,30.0778);//kurjeriai darbas... FC
	pickups[0][swatd]=CreatePickupA(1210 ,2, 1498.3508,-1065.7515,2001.0859); // FTB darbas F

	//------------------Darbai-----------------------//
	//pickups[0][dyleriaid]=CreatePickupA(1210 ,2, -2535.2415,-688.7201,139.8929);//Teisëjai darbas... FC
	pickups[0][mechanikaid][0]=CreatePickupA(1210 ,2, -2051.6404,-35.8413,35.3854);//Mechaniku darbas...SF
	pickups[0][mechanikaid][1]=CreatePickupA(1210 ,2, 148.4200,1228.4371,328.9453);//Mechaniku darbas...FC
    pickups[0][medikaid][0]=CreatePickupA(1210 ,2, 2476.6692,-4567.4648,1001.0859);//Medikai SF
	pickups[0][medikaid][1]=CreatePickupA(1210 ,2, 333.8680,-1507.9395,524.7869);//Medikai FC
	pickups[0][furistaid]=CreatePickupA(1210 ,2, -547.1619,2607.6736,500.7675);//Ilgûjø reisø vairuotojø darbas... FC
	pickups[0][GroveStreetd]=CreatePickupA(1210 ,2, -919.6978,-2512.0115,4.7652);//Tulpiniø darbas... FC
	//pickups[0][Ballasd]=CreatePickupA(1210 ,2, -688.1381,932.2990,13.6328);//Italu mafija... FC
	//be pakvieimo
	pickups[0][pica]=CreatePickupA(1210 ,2, 300.0510,1810.2574,1017.5730);//Pica kaimeliuose FC
	pickups[0][kpriz]=CreatePickupA(1210 ,2, -131.6711,1076.7410,19.7654);//Keliø kaimeliuose FC
	pickups[0][elektrikai]=CreatePickupA(1210 ,2, -2535.2415,-688.7201,139.8929);//Elektrikai kaimeliuose FC
	pickups[0][autobusai]=CreatePickupA(1210 ,2, -1697.9862,-13.5097,-79.3883);//Gaisrininkø darbas... FC
	pickups[0][pilotai]=CreatePickupA(1210 ,2, -1228.5588,56.2342,14.1313);//pilotai FC
	pickups[0][busast]=CreatePickupA(1210, 2, -2302.0847,542.0397,35.1678);//Autobusai
	//pickups[0][traukiniai] = CreatePickupA(1210 ,2, -863.3917,1746.7806,888.3400); //Paðtininkai FC*/
	//------------------Darbu gun-------------------//
	pickups[0][dyleriaisandelis]=CreatePickupA(1220 ,1, -926.0892,-2490.6008,4.7500);//Dyleriø ginklai... FC
	//pickups[0][furistug]=CreatePickupA(1220, 1,2847.6313,983.5352,10.7467);//Furistu ginklai
	//pickups[0][GroveStreetg]=CreatePickupA(1220 ,2, -2646.6536,1423.6693,906.4609);//grove ST ginklai... FC
	//pickups[0][Ballasg]=CreatePickupA(1220 ,2, -653.6652,970.5661,12.1479);//Italu ginklai... FC
	pickups[0][policijosg]=CreatePickupA(1220 ,2, 272.0167,1961.5770,471.6011);//policijos ginklai... SF
	//pickups[0][armijag]=CreatePickupA(19582 ,14, -2789.9177,398.2211,4.6283);//Iðkrovimas mësos pakuoèiø... BB
	//pickups[0][armijapar]=CreatePickupA(1274 ,14, -25.0281,1172.4517,19.3617);//Iðkrovimas tvarto gyvûnø... FC
	pickups[0][swatg]=CreatePickupA(1220 , 2, 85.0893,2245.6133,623.0970);//FTB ginklai FC
	//jailas
	pickups[0][jailas]=CreatePickupA(1247 ,2, -242.2138,950.9937,20.3035);//Policijos Jailas... FC
	//pickups[0][jailas1]=CreatePickupA(1247 ,2, 276.2536,-150.1578,-13.9684);//SWAT suemimas FC
	//pickups[0][jailas2]=CreatePickupA(1247 ,2, -1594.2123,716.2459,-4.9063);//Armijos suemimas FC
	//pickups[0][jailpab]=CreatePickupA(1274, 2, 3413.7927,1807.3202,8.9894);

	pickups[0][pasirasymas]=CreatePickupA(19064 ,1, -1516.8304,2569.7720,55.8359);//VM

	pickups[0][NewbieHeal][0]=CreatePickupA(1240 ,1, -87.5784,1165.9580,19.7900);//VM FC
	//pickups[0][NewbieHeal][1]=CreatePickupA(1240 ,1, -1965.3010,157.7472,26.2941);//SPAWN
	//pickups[0][NewbieHeal][2]=CreatePickupA(1240 ,1, -2651.0769,639.4955,14.3600);//Ligoninë
	pickups[0][NewbieHeal][3]=CreatePickupA(1240 ,1, -312.5792,1031.5669,19.7497);//Ligoninë FC
	//pickups[0][NewbieHeal][4]=CreatePickupA(1240 ,1, 11.6993,1059.4956,20.8509);//SPAWN FC

	//pickups[0][gelbetojaig]=CreatePickupA(1220 ,2, -2327.6338,-118.2043,35.3291);//policijos ginklai... FC

	//Akras
	pickups[0][BaseinoInfo] = CreatePickupA(1239, 2, 45.5607,2134.8906,-44.0420);
	//pickups[0][DazasvaidzioInfo] = CreatePickupA(1239, 2, 63.3538,2134.7261,-44.0420);
	pickups[0][DazasvaidzioInfo] = CreatePickupA(1239, 2, -975.3723,1089.5724,1344.9719);

	//pickups[0][elektriku]=CreatePickupA(18644 ,2,-2532.7510,-688.6525,139.8659); //elektriku irankiu

	//pickups[0][ligankst][0] = CreatePickupA(1239 ,2, 221.4751,1845.0736,473.5118); //Ligonine SF
	//pickups[0][ligankst][1] = CreatePickupA(1239 ,2, -293.5516,850.3491,-52.2700); //Ligonine FC


	//Laivo Shop
	pickups[0][LaivoShop][0]=CreatePickupA(1274,2,-2913.9167,-128.6199,5.9547);
	pickups[0][LaivoShop][1]=CreatePickupA(1239,2,-2911.1135,-139.5963,5.9737);

	/*TURGAUS
	pickups[0][turgus]=CreatePickupA(1274,2,98.0019,1157.3619,18.6565);
	pickups[1][turgus]=CreatePickupA(1274,2,89.3454,1157.1589,18.6565);
	pickups[0][turgus1]=CreatePickupA(1274,2,79.7887,1156.8661,18.6641);
	pickups[1][turgus1]=CreatePickupA(1274,2,74.9428,1156.6827,18.6641);
	pickups[0][turgus2]=CreatePickupA(1274,2,69.9566,1156.6816,18.6641);
	pickups[1][turgus2]=CreatePickupA(1274,2,66.7147,1178.0104,18.6641);
	pickups[0][turgus3]=CreatePickupA(1274,2,71.4374,1178.0114,18.6641);
	pickups[1][turgus3]=CreatePickupA(1274,2,106.9224,1174.7593,18.6641);*/

	//Medþioklë
	pickups[0][kombainoshop] = CreatePickupA(1274, 2, 283.0919,125.1073,4.6275); //BB naujas medþ
	//pickups[0][kombainoshop] = CreatePickupA(1274, 2, 1938.5846,165.4348,37.2813); // BB senas medþ

    pickups[0][kombPerTable1] = CreatePickupA(19198, 2, 2597.3320,461.3576,2000.9688);
    pickups[0][kombPerTable2] = CreatePickupA(19198, 2, 2600.6538,461.3707,2000.9482);
    pickups[0][kombPerTable3] = CreatePickupA(19198, 2, 2603.6182,461.3529,2000.9482);
    pickups[0][kombPerTable4] = CreatePickupA(19198, 2, 2607.1208,461.3776,2000.9688);
    pickups[0][kombPerTable5] = CreatePickupA(19198, 2, 2606.7390, 460.0046, 2500.9688);
    pickups[0][kombPerTable6] = CreatePickupA(19198, 2, 2606.6506, 462.6059, 2500.9688);
    pickups[0][kombPerTable7] = CreatePickupA(19198, 2, 2609.7773, 462.9547, 2500.9688);
    pickups[0][kombPerTable8] = CreatePickupA(19198, 2, 2609.4661, 460.0459, 2500.9688);
    pickups[0][kombFasTable1] = CreatePickupA(19198, 2, -2119.4382, 959.2258, 2079.4041);
    pickups[0][kombFasTable2] = CreatePickupA(19198, 2, -2119.3911, 955.7728, 2079.4041);
    pickups[0][kombFasTable3] = CreatePickupA(19198, 2, -2119.3357, 952.6861, 2079.4041);

    //BOX SKIN
    pickups[0][boxininkoskin]=CreatePickupA(1275,2,756.2297,4.2977,1000.6979); //RAUDONI skin
	pickups[1][boxininkoskin]=CreatePickupA(1275,2,756.2293,8.3773,1000.7000); //MELYNI SKIN
	
	//PLAUKIMO SKIN
	pickups[0][plaukikoskin]=CreatePickupA(1275,98,-2134.9175,-3342.6780,2.3833); //Vyriðka
	pickups[1][plaukikoskin]=CreatePickupA(1275,98,-2129.7568,-3342.5938,2.3833); //Moteriðka
	

		//ddm
		
	//pickups[0][dmevent]=CreatePickupA(19197 ,2,280.2536,-220.8272,1.5900); //dm event iejimas
	//pickups[1][dmevent]=CreatePickupA(19197 ,2,-1052.5116,1100.1522,1343.1320); //dm event isejimas
    pickups[0][zvejyba]=CreatePickupA(1274 ,2, -605.1339,1320.1641,1.5895); //FC
    //pickups[0][wangcars]=CreatePickupA(1274, 2, -1950.4604,272.5548,35.4688); //SF
    pickups[0][restorp]=CreatePickupA(1274, 2, 423.7732,174.4036,451.0172); //FC
    //pickups[0][autoaibep]=CreatePickupA(1274, 2, -2332.4919,-102.8410,35.3393); //SF
	//pickups[0][saudg]=CreatePickupA(1220 ,2,-974.9420,1088.2944,1344.9761); //saudymo ginklai
	//pickups[1][saudg]=CreatePickupA(1220 ,2,-1132.0621,1030.8533,1345.7301); //saudymo ginklai1
	//--------------------------Kita-------------------------
	pickups[0][geralas]=CreatePickupA(1512 ,2, 498.3979,-76.0408,998.7578);//
	pickups[1][geralas]=CreatePickupA(1512 ,2, 378.9536,-186.6793,1000.6328);//
	//Maistas
	pickups[0][edalaspic]=CreatePickupA(1274 ,2, 302.6532,1823.2306,1017.5730);// Picerijoje
	pickups[0][edalasmes]=CreatePickupA(1274 ,2, 376.5461,-67.4344,1001.5078);// Burger Shot
	pickups[0][burgerakr]=CreatePickupA(1274 ,2, 72.0400,2138.4006,-44.0356);// Burger Shot
	pickups[0][burgerakr2]=CreatePickupA(1274 ,2, 72.4603,2132.9067,-44.0356);// Burger Shot
	pickups[0][edalaskav]=CreatePickupA(1274 ,2, 449.4179,-84.0185,999.5547);// Kavinë
	//pickups[0][edalasjail]=CreatePickupA(1274 ,2, 143.2081,1388.8243,10.5835);// Jail
	//pickups[0][edalashp]=CreatePickupA(1274, 2, -2655.4238,634.1155,14.4543);// HP
	//pickups[0][hotdog]=CreatePickupA(1274, 2, -2655.3333,637.4739,14.4543); // HOT DOG
	//pickups[1][hotdog]=CreatePickupA(1274, 2, -2027.3451,-90.0706,35.3203); // HOT DOG
	
	//Kita
	pickups[0][TechinkosParduotuve]=CreatePickupA(1274 ,1, -2237.3606,130.1810,1035.4141);//tel pardë...
	pickups[0][parasiutas]=CreatePickupA(1274 ,2, -2231.9880,-1745.1488,480.8762);// Paraðiutas, tarp tpkalnas
	
	pickups[0][investicijos]=CreatePickupA(1559 ,2, 1241.7433,-796.3019,64.2159); // Investicijos
	//pickups[0][paskola]=CreatePickupA(1559, 2, -2454.8511,503.8383,30.0779); // Paskolos
	pickups[0][baudap][0]=CreatePickupA(1274 ,2, 325.2427,305.2769,999.1484);//Baudos sumokëjimas! FC
	pickups[0][baudap][1]=CreatePickupA(1274 ,2, 250.4470,1416.2073,470.1848);//Baudos sumokëjimas! SF
	//pickups[0][algos]=CreatePickupA(1559 ,2, 2300.1707,301.1127,-22.8292); // Algos pasiimimo pickupas 1
	//pickups[0][tverslopick]=CreatePickupA(1559 ,2, 2300.2190,303.1372,-22.8292); // Algos pasiimimo pickupas 1
	//pickups[0][kontraktopick]=CreatePickupA(1559 ,2, 2299.9697,298.6075,-22.8292); // Algos pasiimimo pickupas 1
	//CreatePickupA(1559 ,2, 358.2361,182.6774,1008.3828); // Algos pasiimimo pickupas 2
	//pickups[1][algos]=CreatePickupA(1559 ,2, 358.2374,186.3069,1008.3828); // Algos pasiimimo pickupas 3
	//pickups[0][kuzsakymas]=CreatePickupA(1274 ,2, -1729.3538,-105.6753,3.5489);//Kroviniø uþsakymas...

	pickups[0][teorija][0]=CreatePickupA(1274 ,2, 3156.3687,2883.9978,2000.5970);//Vm teorija...
	pickups[0][teorija][1]=CreatePickupA(1274 ,2, 3156.3506,2919.9004,2000.5970);//Vm teorija...
	pickups[0][teorija][2]=CreatePickupA(1274 ,2, 1490.6915,1307.7159,1093.2891);//Vm teorija...
	pickups[0][reinfo]=CreatePickupA(1239, 2,3141.2227,2901.5659,2001.1125);//vm info
	/*pickups[0][infona][0]=CreatePickupA(1239, 2,-2060.1045,364.9515,35.2199);//Moilers info paprasta
	pickups[0][infona][1]=CreatePickupA(1239, 2,-2064.8525,364.9515,35.2199);//Moilers info*/
	
	/*pickups[0][buspirk][0] = CreatePickupA(1239, 2, -2467.0032,523.5838,1050.8914); //SF kasa 1
	pickups[0][buspirk][1] = CreatePickupA(1239, 2, -2473.2388,523.5826,1050.8914); //SF kasa 2
	pickups[0][buspirk][2] = CreatePickupA(1239, 2, -2478.4539,523.5842,1050.8914); //SF kasa 3
	pickups[0][buspirk][3] = CreatePickupA(1239, 2, -2484.9939,523.5773,1050.8914); //SF kasa 4
	
	pickups[0][buspirk][4] = CreatePickupA(1239, 2, 72.5928,1096.6407,19.7871); //FC kasa 1
	pickups[0][buspirk][5] = CreatePickupA(1239, 2, 67.0506,1096.6388,19.7871); //FC kasa 2
	pickups[0][buspirk][6] = CreatePickupA(1239, 2, 61.9006,1096.6343,19.7871); //FC kasa 3
	pickups[0][buspirk][7] = CreatePickupA(1239, 2, 56.7721,1096.6417,19.7871); //FC kasa 4*/
	
	//pickups[0][reg]=CreatePickupA(1239, 2,1559.2491,1941.3240,10.8619);
	//pickups[0][teo]=CreatePickupA(1239, 2,1611.6372,1964.0872,10.8203);//VM Aikstelei
	//pickups[1][teo]=CreatePickupA(1239, 2,1612.9540,1969.7823,10.8203);//VM Aikstelei





	//pickups[0][ginklai]=CreatePickupA(1274 ,2, 312.7335,-166.1410,999.6010);//Ginklø shopas...
//	pickups[0][dguns]=CreatePickupA(1274, 2, -1708.1616,25.1131,3.5547);
	//pickups[1][ginklai]=CreatePickupA(1274 ,2, 295.5064,-38.5146,1001.5156);//Ginklø shopas2...
	pickups[0][praktikapick]=CreatePickupA(1274 ,2, 300.2306,-134.0972,1004.0625);//Ginklø lic... FC
	pickups[0][drabuziai]=CreatePickupA(1275 ,2, 204.1480,-43.7022,1001.8047);//Drabuþiø parduotuvë...
	pickups[0][Swedbanksask]=CreatePickupA(1274 ,2, -171.3214,1114.9280,560.0179);//Swedbank Saskaita...
	/*CreatePickupA(1274 ,2, -465.1441,-1222.9368,3000.9688);//Swedbank Saskaita...
	CreatePickupA(1274 ,2, -465.4922,-1241.8066,3000.9688);//Swedbank Saskaita...
	CreatePickupA(1274 ,2, 83.4852,2153.5518,-44.0356);
	CreatePickupA(1274 ,2, -1977.9359,182.6195,27.6949);//spawno bankomatas
	pickups[1][Swedbanksask]=CreatePickupA(1274 ,2, -470.9844,-1241.7362,3000.9688);//Swedbank Saskaita...*/
	//Benzinas...
	pickups[0][degaline]=/*CreatePickupA(1274 ,2,2639.8826,1100.3813,10.9609);
	CreatePickupA(1274 ,2,2639.8958,1111.1685,10.9609);
	CreatePickupA(1274 ,2,2645.2175,1112.3369,10.9609); 
	CreatePickupA(1274 ,2,2634.6384,1101.5319,10.9609); 
	CreatePickupA(1274 ,2,2114.8987,926.1038,10.9609); 
	CreatePickupA(1274 ,2,2109.0701,924.9281,10.9609); 
	CreatePickupA(1274 ,2,2114.8984,915.3052,10.9609); 
	CreatePickupA(1274 ,2,2120.8152,914.1350,10.9609); 
	CreatePickupA(1274 ,2,2208.2817,2474.7090,10.9952);
	CreatePickupA(1274 ,2,2207.1157,2480.2952,10.9952);
	CreatePickupA(1274 ,2,2196.3171,2470.2190,10.9952); 
	CreatePickupA(1274 ,2,2148.1196,2753.3425,10.9602); 
	CreatePickupA(1274 ,2,2146.9482,2742.5356,10.9602); 
	CreatePickupA(1274 ,2,1590.4342,2203.9082,11.0610);
	CreatePickupA(1274 ,2,1596.1984,2203.9089,11.0610);
	CreatePickupA(1274 ,2,1602.2775,2203.9121,11.0610);
	CreatePickupA(1274 ,2,-1685.4164,409.1074,7.3984);
	CreatePickupA(1274 ,2,-1681.2732,413.2525,7.3984);
	CreatePickupA(1274 ,2,-1675.9843,418.5525,7.3984);
	CreatePickupA(1274 ,2,-1671.6063,422.9420,7.3984);
	CreatePickupA(1274 ,2,-2410.0334,970.8549,45.4518);
	CreatePickupA(1274 ,2,-2410.0352,976.3596,45.4523);
	CreatePickupA(1274 ,2,-2410.0356,981.5940,45.4525);
	CreatePickupA(1274 ,2,1942.6077,-1767.3256,13.3906);
	CreatePickupA(1274 ,2,1942.6725,-1771.6735,13.3906);
	CreatePickupA(1274 ,2,-2025.8682,154.6973,27.6777);
	CreatePickupA(1274 ,2,-2025.8632,147.2972,27.6777);
	CreatePickupA(1274 ,2,-2033.2717,147.2311,27.6777);
	CreatePickupA(1274 ,2,-2033.3138,154.7213,27.6777);*/
	CreatePickupA(1274 ,2,74.5946,1216.3912,18.9176);//FC
	CreatePickupA(1274 ,2,-1275.7314,2722.0659,50.0652); //EQ
	//CreatePickupA(1274 ,2,-1270.3042,2711.2051,50.0652); //EQ
	//CreatePickupA(1274 ,2,67.2388,1218.3268,18.9410);
	pickups[1][degaline]=CreatePickupA(1274 ,2,2197.4849,2474.7173,10.9952); //FC
	//pickups[0][kiosk]=CreatePickupA(1274 ,2,-2635.7463,5.5470,4.3363); // Kioskas
	pickups[0][kiosk]=CreatePickupA(1274 ,2,-51.9252,996.6467,20.8681); // Kioskas
	//CreatePickupA(1274 ,2,2119.1829,1331.1890,10.8203); //garbes take
	//CreatePickupA(1274 ,2,-296.4444,1088.7350,19.7422); //Ligonine FC
	//CreatePickupA(1274 ,2,-1995.7252,84.7376,27.6949); //Spawn kioskas
	CreatePickupA(1274 ,2,-2685.3850,607.6508,14.3682);
	//CreatePickupA(1274 ,2,-2809.3259,422.0789,4.5965); //Akropolis
	//CreatePickupA(1274 ,2,-133.8802,1213.0698,19.7422); //FC SPAWN
	//CreatePickupA(1274 ,2,-2248.5625,548.1649,35.0305); //SF parkas
	//CreatePickupA(1274 ,2,-2283.5342,-129.0932,35.3304);//SF uþkandinë
	pickups[1][kiosk]=CreatePickupA(1274 ,2,2096.2476,991.8669,10.8203); // Kioskas
	pickups[0][degalubakelis]=CreatePickupA(1650,2,60.6312,1217.0764,18.8480);//Bakelio pirkimas FC
	//pickups[0][JailFood]=CreatePickupA(1582, 1, 3464.7490,1791.4922,501.1214);
	
	//Èia ðûdø ðûdas
	
	pickups[0][infoskelbimas]=CreatePickupA(1274, 1,2372.5854,-1123.7957,1051.3507); // Skelbimø kontoros informacija
	//pickups[0][zinformacija]=CreatePickupA(1239, 1,-2941.6626,482.3235,4.8947); // þvejybos laivais informacija
	
}
