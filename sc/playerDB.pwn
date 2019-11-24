#define Policija 1
#define Taksi 2
#define Mechanikai 3
#define Dyleriai 4
#define Medikai 5
#define Furistai 6
#define GroveStreet 13
#define Ballas 14
#define Swat 15
#define Armija 16


forward WantPickup(playerid);

enum Item
{
	bool:pzu,
	bool:pakviestas[255],
	bool:naujokas,
	elpastas,
	helpMode,
	zaidzia,
	bool:bsaskaita,
	bool:pickup,
	bool:pila,
	bool:glicenzija,
	bool:glicteorija,
	bool:aikstele,
	bool:cteises,
	bool:fteises,
	bool:mteises,
	bool:auteises,
	bool:pteises,
	bool:teorija,
	//bool:uniform,
	bool:dkvietimas[60],
	bool:suristas,
	bool:salmas,
	bool:cuffed,
	bool:ikalintas,
	bool:Navigacija,
	bool:vPriziuretojas,
	bool:aPriziuretojas,
	bool:ePriziuretojas,
	bool:dPriziuretojas,
	bool:bPriziuretojas,
	bool:Emigruotas,
	bool:Uzbanintas,
	bool:UzbanintasLaikui,
	bool:MasinuIeskojimas1,
	bool:MasinuIeskojimas2,
	bool:MasinuIeskojimas3,
	bool:MasinuIeskojimas4,
	bool:MasinuIeskojimas5,
	bool:Pasiekimas1,
	bool:Pasiekimas2,
	bool:Pasiekimas3,
	bool:Pasiekimas4,
	bool:Pasiekimas5,
	bool:Pasiekimas6,
	bool:Pasiekimas7,
	bool:Pasiekimas8,
	bool:Pasiekimas9,
	bool:Pasiekimas10,
	bool:pAlga,
	bool:Suzeistas,
	bool:Ofisas,
	bool:StabdauZaideja,
	bool:TaxiWithdrawingMoney,
	bool:Priklausomybe,
	bool:gunbox,
	bool:tzenklasleid,
	bool:DazasOnline,
	bool:krepselisV,
	bool:degalubak,
	bool:nwkuprine,
	bakelis,
	PriklausBalai,
	NewPasiekimai[15],
	neivygdytasP,
	LaimejoVar,
	GavoZala,
	KiekIsprende,
	lTransportas1,
	LaikasLigonineje,
	KiekLaikoBan,
	KiekIspCbug,
	KiekIspBan,
	medzioklesleidimas,
	medikupazyma,
	paskoloslaikas,
	vplaikas,
	Sanfierro,
	Fortcarson,
	vApmokymai,
	mesoskg,
	pasirase,
	velykos1,
	velykos2,
	velykos3,
	velykos4,
	velykos5,
	velykos6,
	velykos7,
	velykos8,
	velykos9,
	velykos10,
	velykos11,
	velykos12,
	velykos13,
	velykos14,
	velykos15,
	/*Vasara1,
	Vasara2,
	Vasara3,
	Vasara4,
	Vasara5,
	Vasara6,
	Vasara7,
	Vasara8,
	Vasara9,
	Vasara10,
	Vasara11,
	Vasara12,
	Vasara13,
	Vasara14,
	Vasara15,
	Vasara16,
	Vasara17,
	Vasara18,
	Vasara19,*/
	radokiausini,
	ChristmasCase[5],
	Dovana[6],
	Iziebta,
	mechleidimas,
	menke,
	lasisa,
	pleksne,
	eserys,
	irankiai,
	mechirankis,
	mechdeze,
	LastSkydineID,
	LastKontikasID,
	IsvalytasKaminas,
	lydeka,
	kokiaPastoCar,
	kokiaGunCar,
	kokiaMiskoCar,
	kokiaTvartoCar,
	playerTD,
    bool:pastobox,
	bool: meskere,
	masalas,
	bool: valas,
	bool: zvejoja,
	kiekistrauke,
	kiekpasikrove,
	bool: laikastraukti,
	PriimtiIskvietimai,
	DuotaBaudu,
	NuveztaKroviniu,
	SekamasZaidejas,
	PlayerText: InfoText,
	CanTakeHouse,
	HouseCost,
	tara,
	KontraktoLaikas,
	NamoID,
	StabdomoZtimeris,
	KiekTuriRepTasku,
	KelintaNMisija,
	KelintaPMisija,
	KelintaSMisija,
	StabdomasZaidejas,
	tVerslas,
	tVerslasPelnas,
	Text:vCarInfo,
	AlgosLaikas,
	KraunamasAkumuliatorius,
	CanTakeCar,
	LeidimasT,
	LeidimasHUNT,
	LeidimasH,
	kDeagle,
	kShotgun,
	kAk47,
	kM4,
	kNark[2],
	SellCar,
	PolicijosStazas,
	MedikuStazas,
	TaksistuStazas,
	MechanikuStazas,
	DyleriuStazas,
	FuristuStazas,
	SWATStazas,
	BallasStazas,
	GrooveStazas,
	ArmijosStazas,
	PicerijosStazas,
	GaisrininkuStazas,
	ValytojuStazas,
	ElektrikuStazas,
	PilotuStazas,
	PastininkuStazas,
	PlayerDialog,
	KadaVipGydes,
	KadaZaideKauliuku,
	KadaSkelbe,
	TaxiPassanger,
	TaxiDriverID,
	BizID,
	SellBiz,
	SellBizCost,
	SellBizID,
	NickBanai,
	KadaGydes,
	GinkluEme,
	DirbuEme,
	KadaSkydas,
	KadaVartojo,
	ChoosedPlayer,
	BanPlayer,
	PrzPlayer,
	Nuskriaude,
	alkis,
	zvaigzdutes,
	liga,
	FakeKill,
	prazaide,
	diena,
	kamuoliai,
	eggs,
	total_eggs,
	color_egg,
	VMCP, //Ma�inos
	VMCPM, //Moto
	VMCPFF, //F�rist�
	VMCPA, //Autobus�
	VMCPP, //Pilot�
	GreitiMatuoja,
	investicija,
	skambutis,
	Transportas1,
	Transportas2,
	Transportas3,
	ACmasina,
    VipLaikas,
	bega,
	kalejimo_laikas,
	AlgosKiekis,
	textas,
	rkaina[4],
	rid[9],
	rkiekis[2],
	JobRank,
	//
	kvieciu1,
	kvieciu2,
	kvieciu3,
	kvieciu4,
	kvieciu5,
	kvieciu6,
	kvieciu7,
	//
	varau1,
	varau2,
	varau3,
	varau4,
	varau5,
	varau6,
	varau7,
	//
	atvaziuoja1,
	atvaziuoja2,
	atvaziuoja3,
	atvaziuoja4,
	atvaziuoja5,
	atvaziuoja6,
	atvaziuoja7,
	//
	teorijost,
	uniforma,
	pinigai,
	verifcode,
	jungiasi,
	DrkIspejimai,
	DarboIspejimai,
	AdminIspejimai,
	VipIspejimai,
	admin,
	AdminLaikas,
	vip,
	kokainas,
	zole,
	alga,
	Float:PaskPoz[3],
	specialybe,
	NoGunsPD,
	NoGunsKart,
	NoGunsGang,
	mutelaikas,
	bool:carsavin[3],
	namuose,
	masina,
	savininkas,
	kreditai,
	coins,
	vasarost,
	dTaskai,
	protokolas,
	protokolop[5],
	sktime,
	paskutpas,
	gwtaskai,
	Paskolost,
	Paskola,
	Kreditai2,
	fejerverkai,
	lektuvas,
	drabuziai,
	gdrabuziai,
	sdrabuziai,
	lazeris,
	skinai,
	gaujosID,
	gLeidimas,
	gBlist,
	gPav,
	bilietas[6],
	dyrikz,
	pavaz,
	igaliotinis,
	uzsiseges,
	spdata[30],
	Daverep,
	Raseadmin,
	Raseprz,
	Rasedrk,
	Rasevip,
	Float:spos[3],
	skinaim,
	Mires,
	pinkodas,
	banke,
	mp3,
	laikrodis,
	//Telefono
	telefonas,
	kortele,
	telefonostat,
	KoksTelefonas,
	mobsas,
	lytis,
	BaninoPaprastai,
	bool:AFK_Stat,
	bool:ANTI_AFK,
	Text3D:AFK_Label,
	AFK_Time,
	disease,
	drugscure[3],
	maistas[3],
	gApranga[7],
	birthdayOne,
	bool:dKomandaR,
	bool:dKomandaM,
	regdata[50],
	lastOnline[50],
	receive[150],
	help[150],
	answer[150],
	pass[150],
	warning_pass,
	Statusas,

	e_skinStatus: skinStatus
}
new zInfo[MAX_PLAYERS][Item];

public WantPickup(playerid) zInfo[playerid][pickup]=true;
