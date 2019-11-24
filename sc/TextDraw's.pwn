new Text:Degaline1,Text:Degaline2;
new Text:TDEditor_Degalai, Text:TDEditor_Degalai1, Text:TDEditor_Degalai2, Text:TDEditor_Degalai3, Text:TDEditor_Degalai4, Text:TDEditor_Degalai5, Text:TDEditor_Degalai6, Text:TDEditor_Degalai7;
new Text:InformacijosDezute[MAX_PLAYERS];
new Text:InfoBox[MAX_PLAYERS];
new Text:Textdraw0;
new Text:Textdraw1;
new 
	Text:Clock[2]

;
new
	Text: Burger,
	Text: Burger1,
	Text: Burger2,
	Text: AlkTD[ MAX_PLAYERS ],
	Text:taksimetras_p[MAX_PLAYERS][2],
	Text:TDEditor_TDProtokolas[14]
;

    new Text:TDEditor_TRR[17];
    new Text:TDEditor_SPEEDTD[1];
    new Text:TDEditor_TDMedicBuy[10];
    new Text:TDEditor_TDJobInvite[12];

stock SukuriameTextDraw()
{

    TDEditor_TDJobInvite[0] = TextDrawCreate(225.089706, 144.236892, "box");
    TextDrawLetterSize(    TDEditor_TDJobInvite[0], 0.000000, 1.163902);
    TextDrawTextSize(    TDEditor_TDJobInvite[0], 397.899200, 0.000000);
    TextDrawAlignment(    TDEditor_TDJobInvite[0], 1);
    TextDrawColor(    TDEditor_TDJobInvite[0], -1);
    TextDrawUseBox(    TDEditor_TDJobInvite[0], 1);
    TextDrawBoxColor(    TDEditor_TDJobInvite[0], 556016127);
    TextDrawSetShadow(    TDEditor_TDJobInvite[0], 0);
    TextDrawSetOutline(    TDEditor_TDJobInvite[0], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[0], 255);
    TextDrawFont(    TDEditor_TDJobInvite[0], 1);
    TextDrawSetProportional(    TDEditor_TDJobInvite[0], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[0], 0);

    TDEditor_TDJobInvite[1] = TextDrawCreate(226.185546, 145.133087, "box");
    TextDrawLetterSize(    TDEditor_TDJobInvite[1], 0.000000, 0.962427);
    TextDrawTextSize(    TDEditor_TDJobInvite[1], 397.000000, 0.000000);
    TextDrawAlignment(    TDEditor_TDJobInvite[1], 1);
    TextDrawColor(    TDEditor_TDJobInvite[1], -1);
    TextDrawUseBox(    TDEditor_TDJobInvite[1], 1);
    TextDrawBoxColor(    TDEditor_TDJobInvite[1], 1933918975);
    TextDrawSetShadow(    TDEditor_TDJobInvite[1], 0);
    TextDrawSetOutline(    TDEditor_TDJobInvite[1], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[1], 255);
    TextDrawFont(    TDEditor_TDJobInvite[1], 1);
    TextDrawSetProportional(    TDEditor_TDJobInvite[1], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[1], 0);

    TDEditor_TDJobInvite[2] = TextDrawCreate(225.089706, 160.537887, "box");
    TextDrawLetterSize(    TDEditor_TDJobInvite[2], 0.000000, 9.861205);
    TextDrawTextSize(    TDEditor_TDJobInvite[2], 398.000000, 0.000000);
    TextDrawAlignment(    TDEditor_TDJobInvite[2], 1);
    TextDrawColor(    TDEditor_TDJobInvite[2], -1);
    TextDrawUseBox(    TDEditor_TDJobInvite[2], 1);
    TextDrawBoxColor(    TDEditor_TDJobInvite[2], 556016127);
    TextDrawSetShadow(    TDEditor_TDJobInvite[2], 0);
    TextDrawSetOutline(    TDEditor_TDJobInvite[2], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[2], 255);
    TextDrawFont(    TDEditor_TDJobInvite[2], 1);
    TextDrawSetProportional(    TDEditor_TDJobInvite[2], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[2], 0);

    TDEditor_TDJobInvite[3] = TextDrawCreate(226.361877, 161.903610, "box");
    TextDrawLetterSize(    TDEditor_TDJobInvite[3], 0.000000, 0.780142);
    TextDrawTextSize(    TDEditor_TDJobInvite[3], 318.279663, 0.000000);
    TextDrawAlignment(    TDEditor_TDJobInvite[3], 1);
    TextDrawColor(    TDEditor_TDJobInvite[3], -1);
    TextDrawUseBox(    TDEditor_TDJobInvite[3], 1);
    TextDrawBoxColor(    TDEditor_TDJobInvite[3], 690760191);
    TextDrawSetShadow(    TDEditor_TDJobInvite[3], 0);
    TextDrawSetOutline(    TDEditor_TDJobInvite[3], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[3], 255);
    TextDrawFont(    TDEditor_TDJobInvite[3], 1);
    TextDrawSetProportional(    TDEditor_TDJobInvite[3], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[3], 0);

    TDEditor_TDJobInvite[4] = TextDrawCreate(226.500030, 174.604385, "box");
    TextDrawLetterSize(    TDEditor_TDJobInvite[4], 0.000000, 5.080005);
    TextDrawTextSize(    TDEditor_TDJobInvite[4], 318.399414, 0.000000);
    TextDrawAlignment(    TDEditor_TDJobInvite[4], 1);
    TextDrawColor(    TDEditor_TDJobInvite[4], -1);
    TextDrawUseBox(    TDEditor_TDJobInvite[4], 1);
    TextDrawBoxColor(    TDEditor_TDJobInvite[4], 690760191);
    TextDrawSetShadow(    TDEditor_TDJobInvite[4], 0);
    TextDrawSetOutline(    TDEditor_TDJobInvite[4], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[4], 255);
    TextDrawFont(    TDEditor_TDJobInvite[4], 1);
    TextDrawSetProportional(    TDEditor_TDJobInvite[4], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[4], 0);

    TDEditor_TDJobInvite[5] = TextDrawCreate(226.380950, 225.833465, "box");
    TextDrawLetterSize(    TDEditor_TDJobInvite[5], 0.000000, 2.442121);
    TextDrawTextSize(    TDEditor_TDJobInvite[5], 318.338806, 0.000000);
    TextDrawAlignment(    TDEditor_TDJobInvite[5], 1);
    TextDrawColor(    TDEditor_TDJobInvite[5], -1);
    TextDrawUseBox(    TDEditor_TDJobInvite[5], 1);
    TextDrawBoxColor(    TDEditor_TDJobInvite[5], 690760191);
    TextDrawSetShadow(    TDEditor_TDJobInvite[5], 0);
    TextDrawSetOutline(    TDEditor_TDJobInvite[5], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[5], 255);
    TextDrawFont(    TDEditor_TDJobInvite[5], 1);
    TextDrawSetProportional(    TDEditor_TDJobInvite[5], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[5], 0);

    TDEditor_TDJobInvite[6] = TextDrawCreate(322.680908, 161.729553, "box");
    TextDrawLetterSize(    TDEditor_TDJobInvite[6], 0.000000, 9.561760);
    TextDrawTextSize(    TDEditor_TDJobInvite[6], 396.439453, 0.000000);
    TextDrawAlignment(    TDEditor_TDJobInvite[6], 1);
    TextDrawColor(    TDEditor_TDJobInvite[6], -1);
    TextDrawUseBox(    TDEditor_TDJobInvite[6], 1);
    TextDrawBoxColor(    TDEditor_TDJobInvite[6], 690760191);
    TextDrawSetShadow(    TDEditor_TDJobInvite[6], 0);
    TextDrawSetOutline(    TDEditor_TDJobInvite[6], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[6], 255);
    TextDrawFont(    TDEditor_TDJobInvite[6], 1);
    TextDrawSetProportional(    TDEditor_TDJobInvite[6], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[6], 0);

    TDEditor_TDJobInvite[7] = TextDrawCreate(271.714355, 173.134063, "Informacija_apie_darba");
    TextDrawLetterSize(    TDEditor_TDJobInvite[7], 0.129427, 0.943184);
    TextDrawAlignment(    TDEditor_TDJobInvite[7], 2);
    TextDrawColor(    TDEditor_TDJobInvite[7], -102009857);
    TextDrawSetShadow(    TDEditor_TDJobInvite[7], 1);
    TextDrawSetOutline(    TDEditor_TDJobInvite[7], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[7], 255);
    TextDrawFont(    TDEditor_TDJobInvite[7], 2);
    TextDrawSetProportional(    TDEditor_TDJobInvite[7], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[7], 1);

    TDEditor_TDJobInvite[8] = TextDrawCreate(227.381134, 226.977783, "box");
    TextDrawLetterSize(    TDEditor_TDJobInvite[8], 0.000000, 0.792428);
    TextDrawTextSize(    TDEditor_TDJobInvite[8], 317.617553, 0.000000);
    TextDrawAlignment(    TDEditor_TDJobInvite[8], 1);
    TextDrawColor(    TDEditor_TDJobInvite[8], -1);
    TextDrawUseBox(    TDEditor_TDJobInvite[8], 1);
    TextDrawBoxColor(    TDEditor_TDJobInvite[8], 1114983167);
    TextDrawSetShadow(    TDEditor_TDJobInvite[8], 0);
    TextDrawSetOutline(    TDEditor_TDJobInvite[8], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[8], 255);
    TextDrawFont(    TDEditor_TDJobInvite[8], 1);
    TextDrawSetProportional(    TDEditor_TDJobInvite[8], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[8], 0);

    TDEditor_TDJobInvite[9] = TextDrawCreate(227.181121, 239.078521, "box");
    TextDrawLetterSize(    TDEditor_TDJobInvite[9], 0.000000, 0.792428);
    TextDrawTextSize(    TDEditor_TDJobInvite[9], 317.587707, 0.000000);
    TextDrawAlignment(    TDEditor_TDJobInvite[9], 1);
    TextDrawColor(    TDEditor_TDJobInvite[9], -1);
    TextDrawUseBox(    TDEditor_TDJobInvite[9], 1);
    TextDrawBoxColor(    TDEditor_TDJobInvite[9], 1933918975);
    TextDrawSetShadow(    TDEditor_TDJobInvite[9], 0);
    TextDrawSetOutline(    TDEditor_TDJobInvite[9], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[9], 255);
    TextDrawFont(    TDEditor_TDJobInvite[9], 1);
    TextDrawSetProportional(    TDEditor_TDJobInvite[9], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[9], 0);

    TDEditor_TDJobInvite[10] = TextDrawCreate(270.590545, 225.477722, "Isidarbinti");
    TextDrawLetterSize(    TDEditor_TDJobInvite[10], 0.164047, 0.914740);
    TextDrawAlignment(    TDEditor_TDJobInvite[10], 2);
    TextDrawColor(    TDEditor_TDJobInvite[10], -1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[10], 1);
    TextDrawSetOutline(    TDEditor_TDJobInvite[10], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[10], 0xFFFFFF00);
    TextDrawFont(    TDEditor_TDJobInvite[10], 2);
    TextDrawSetProportional(    TDEditor_TDJobInvite[10], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[10], 1);
    TextDrawSetSelectable(TDEditor_TDJobInvite[10], true);

    TDEditor_TDJobInvite[11] = TextDrawCreate(270.590545, 238.278503, "atsaukti");
    TextDrawLetterSize(    TDEditor_TDJobInvite[11], 0.164047, 0.914740);
    TextDrawAlignment(    TDEditor_TDJobInvite[11], 2);
    TextDrawColor(    TDEditor_TDJobInvite[11], -1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[11], 1);
    TextDrawSetOutline(    TDEditor_TDJobInvite[11], 0);
    TextDrawBackgroundColor(    TDEditor_TDJobInvite[11], 0xFFFFFF00);
    TextDrawFont(    TDEditor_TDJobInvite[11], 2);
    TextDrawSetProportional(    TDEditor_TDJobInvite[11], 1);
    TextDrawSetShadow(    TDEditor_TDJobInvite[11], 1);
    TextDrawSetSelectable(TDEditor_TDJobInvite[11], true);

    TDEditor_TDMedicBuy[0] = TextDrawCreate(312.724975, 158.179946, "LD_SPAC:white");
    TextDrawLetterSize(    TDEditor_TDMedicBuy[0], 0.000000, 0.000000);
    TextDrawTextSize(    TDEditor_TDMedicBuy[0], 105.000000, 18.000000);
    TextDrawAlignment(    TDEditor_TDMedicBuy[0], 1);
    TextDrawColor(    TDEditor_TDMedicBuy[0], 1532713983);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[0], 0);
    TextDrawSetOutline(    TDEditor_TDMedicBuy[0], 0);
    TextDrawBackgroundColor(    TDEditor_TDMedicBuy[0], 255);
    TextDrawFont(    TDEditor_TDMedicBuy[0], 4);
    TextDrawSetProportional(    TDEditor_TDMedicBuy[0], 0);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[0], 0);

    TDEditor_TDMedicBuy[1] = TextDrawCreate(233.750000, 176.386383, "LD_SPAC:white");
    TextDrawLetterSize(    TDEditor_TDMedicBuy[1], 0.000000, 0.000000);
    TextDrawTextSize(    TDEditor_TDMedicBuy[1], 184.000000, 127.000000);
    TextDrawAlignment(    TDEditor_TDMedicBuy[1], 1);
    TextDrawColor(    TDEditor_TDMedicBuy[1], 1532713983);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[1], 0);
    TextDrawSetOutline(    TDEditor_TDMedicBuy[1], 0);
    TextDrawBackgroundColor(    TDEditor_TDMedicBuy[1], 255);
    TextDrawFont(    TDEditor_TDMedicBuy[1], 4);
    TextDrawSetProportional(    TDEditor_TDMedicBuy[1], 0);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[1], 0);

    TDEditor_TDMedicBuy[2] = TextDrawCreate(224.825103, 173.926147, "");
    TextDrawLetterSize(    TDEditor_TDMedicBuy[2], 0.000000, 0.000000);
    TextDrawTextSize(    TDEditor_TDMedicBuy[2], 90.000000, 90.000000);
    TextDrawAlignment(    TDEditor_TDMedicBuy[2], 1);
    TextDrawColor(    TDEditor_TDMedicBuy[2], -1);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[2], 0);
    TextDrawSetOutline(    TDEditor_TDMedicBuy[2], 0);
    TextDrawBackgroundColor(    TDEditor_TDMedicBuy[2], 0);
    TextDrawFont(    TDEditor_TDMedicBuy[2], 5);
    TextDrawSetProportional(    TDEditor_TDMedicBuy[2], 0);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[2], 0);
    TextDrawSetPreviewModel(    TDEditor_TDMedicBuy[2], 11736);
    TextDrawSetPreviewRot(    TDEditor_TDMedicBuy[2], 80.000000, -46.000000, 2.000000, 1.000000);

    TDEditor_TDMedicBuy[3] = TextDrawCreate(339.874267, 160.879928, "Medicinos_centras");
    TextDrawLetterSize(    TDEditor_TDMedicBuy[3], 0.200000, 1.200000);
    TextDrawAlignment(    TDEditor_TDMedicBuy[3], 1);
    TextDrawColor(    TDEditor_TDMedicBuy[3], -1);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[3], 0);
    TextDrawSetOutline(    TDEditor_TDMedicBuy[3], 0);
    TextDrawBackgroundColor(    TDEditor_TDMedicBuy[3], 255);
    TextDrawFont(    TDEditor_TDMedicBuy[3], 1);
    TextDrawSetProportional(    TDEditor_TDMedicBuy[3], 1);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[3], 0);

    TDEditor_TDMedicBuy[4] = TextDrawCreate(312.500000, 195.026504, "pas_mus_galite_nusipirkti:");
    TextDrawLetterSize(    TDEditor_TDMedicBuy[4], 0.150000, 1.200000);
    TextDrawAlignment(    TDEditor_TDMedicBuy[4], 1);
    TextDrawColor(    TDEditor_TDMedicBuy[4], -1);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[4], 0);
    TextDrawSetOutline(    TDEditor_TDMedicBuy[4], 0);
    TextDrawBackgroundColor(    TDEditor_TDMedicBuy[4], 255);
    TextDrawFont(    TDEditor_TDMedicBuy[4], 2);
    TextDrawSetProportional(    TDEditor_TDMedicBuy[4], 1);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[4], 0);

    TDEditor_TDMedicBuy[5] = TextDrawCreate(312.500000, 210.527450, "Gyvybes~n~Sarvai~n~Pazyma~n~Nepriklausomybe");
    TextDrawLetterSize(    TDEditor_TDMedicBuy[5], 0.150000, 1.200000);
    TextDrawAlignment(    TDEditor_TDMedicBuy[5], 1);
    TextDrawColor(    TDEditor_TDMedicBuy[5], -1);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[5], 0);
    TextDrawSetOutline(    TDEditor_TDMedicBuy[5], 0);
    TextDrawBackgroundColor(    TDEditor_TDMedicBuy[5], 255);
    TextDrawFont(    TDEditor_TDMedicBuy[5], 2);
    TextDrawSetProportional(    TDEditor_TDMedicBuy[5], 1);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[5], 0);

    TDEditor_TDMedicBuy[6] = TextDrawCreate(243.000488, 281.833557, "LD_SPAC:white");
    TextDrawLetterSize(    TDEditor_TDMedicBuy[6], 0.000000, 0.000000);
    TextDrawTextSize(    TDEditor_TDMedicBuy[6], 84.000000, 20.000000);
    TextDrawAlignment(    TDEditor_TDMedicBuy[6], 1);
    TextDrawColor(    TDEditor_TDMedicBuy[6], -11579393);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[6], 0);
    TextDrawSetOutline(    TDEditor_TDMedicBuy[6], 0);
    TextDrawBackgroundColor(    TDEditor_TDMedicBuy[6], 255);
    TextDrawFont(    TDEditor_TDMedicBuy[6], 4);
    TextDrawSetProportional(    TDEditor_TDMedicBuy[6], 0);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[6], 0);
    TextDrawSetSelectable(    TDEditor_TDMedicBuy[6], true);

    TDEditor_TDMedicBuy[7] = TextDrawCreate(330.480865, 281.733551, "LD_SPAC:white");
    TextDrawLetterSize(    TDEditor_TDMedicBuy[7], 0.000000, 0.000000);
    TextDrawTextSize(    TDEditor_TDMedicBuy[7], 84.000000, 20.000000);
    TextDrawAlignment(    TDEditor_TDMedicBuy[7], 1);
    TextDrawColor(    TDEditor_TDMedicBuy[7], -11579393);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[7], 0);
    TextDrawSetOutline(    TDEditor_TDMedicBuy[7], 0);
    TextDrawBackgroundColor(    TDEditor_TDMedicBuy[7], 255);
    TextDrawFont(    TDEditor_TDMedicBuy[7], 4);
    TextDrawSetProportional(    TDEditor_TDMedicBuy[7], 0);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[7], 0);
    TextDrawSetSelectable(    TDEditor_TDMedicBuy[7], true);

    TDEditor_TDMedicBuy[8] = TextDrawCreate(275.397735, 285.532012, "Pirkti");
    TextDrawLetterSize(    TDEditor_TDMedicBuy[8], 0.150000, 1.200000);
    TextDrawAlignment(    TDEditor_TDMedicBuy[8], 1);
    TextDrawColor(    TDEditor_TDMedicBuy[8], -1);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[8], 0);
    TextDrawSetOutline(    TDEditor_TDMedicBuy[8], 0);
    TextDrawBackgroundColor(    TDEditor_TDMedicBuy[8], 255);
    TextDrawFont(    TDEditor_TDMedicBuy[8], 2);
    TextDrawSetProportional(    TDEditor_TDMedicBuy[8], 1);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[8], 0);

    TDEditor_TDMedicBuy[9] = TextDrawCreate(359.902893, 285.532012, "Atmesti");
    TextDrawLetterSize(    TDEditor_TDMedicBuy[9], 0.150000, 1.200000);
    TextDrawAlignment(    TDEditor_TDMedicBuy[9], 1);
    TextDrawColor(    TDEditor_TDMedicBuy[9], -1);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[9], 0);
    TextDrawSetOutline(    TDEditor_TDMedicBuy[9], 0);
    TextDrawBackgroundColor(    TDEditor_TDMedicBuy[9], 255);
    TextDrawFont(    TDEditor_TDMedicBuy[9], 2);
    TextDrawSetProportional(    TDEditor_TDMedicBuy[9], 1);
    TextDrawSetShadow(    TDEditor_TDMedicBuy[9], 0);

	Clock[0] = TextDrawCreate(527.000000, 2.333341, "2013.09.25");
	TextDrawLetterSize(Clock[0], 0.449999, 1.600000);
	TextDrawAlignment(Clock[0], 1);
	TextDrawColor(Clock[0], -1061109505);
	TextDrawSetShadow(Clock[0], 0);
	TextDrawSetOutline(Clock[0], 1);
	TextDrawBackgroundColor(Clock[0], 255);
	TextDrawFont(Clock[0], 3);
	TextDrawSetProportional(Clock[0], 1);

	Clock[1] = TextDrawCreate(555.500000, 15.000009, "22:35");
	TextDrawLetterSize(Clock[1], 0.547499, 2.370000);
	TextDrawAlignment(Clock[1], 1);
	TextDrawColor(Clock[1], -1061109505);
	TextDrawSetShadow(Clock[1], 0);
	TextDrawSetOutline(Clock[1], 1);
	TextDrawBackgroundColor(Clock[1], 255);
	TextDrawFont(Clock[1], 3);
	TextDrawSetProportional(Clock[1], 1);
	
    Textdraw0 = TextDrawCreate(43.294120, 323.166564, "SAUGI");
    TextDrawLetterSize(Textdraw0, 0.449999, 1.600000);
    TextDrawAlignment(Textdraw0, 1);
    TextDrawColor(Textdraw0, 16711935);
    TextDrawSetShadow(Textdraw0, 0);
    TextDrawSetOutline(Textdraw0, 1);
    TextDrawBackgroundColor(Textdraw0, 51);
    TextDrawFont(Textdraw0, 3);
    TextDrawSetProportional(Textdraw0, 1);

    Textdraw1 = TextDrawCreate(88.470611, 323.166656, "zona");
    TextDrawLetterSize(Textdraw1, 0.490470, 1.617500);
    TextDrawAlignment(Textdraw1, 1);
    TextDrawColor(Textdraw1, 16711935);
    TextDrawUseBox(Textdraw1, true);
    TextDrawBoxColor(Textdraw1, 0);
    TextDrawSetShadow(Textdraw1, 0);
    TextDrawSetOutline(Textdraw1, 1);
    TextDrawBackgroundColor(Textdraw1, 51);
    TextDrawFont(Textdraw1, 3);
    TextDrawSetProportional(Textdraw1, 1);

    TDEditor_TDProtokolas[0] = TextDrawCreate(203.904800, 152.548141, "box");
    TextDrawLetterSize(TDEditor_TDProtokolas[0], 0.000000, 14.609524);
    TextDrawTextSize(TDEditor_TDProtokolas[0], 425.000000, 0.000000);
    TextDrawAlignment(TDEditor_TDProtokolas[0], 1);
    TextDrawColor(TDEditor_TDProtokolas[0], -1);
    TextDrawUseBox(TDEditor_TDProtokolas[0], 1);
    TextDrawBoxColor(TDEditor_TDProtokolas[0], 1128481791);
    TextDrawSetShadow(TDEditor_TDProtokolas[0], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[0], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[0], 255);
    TextDrawFont(TDEditor_TDProtokolas[0], 1);
    TextDrawSetProportional(TDEditor_TDProtokolas[0], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[0], 0);

    TDEditor_TDProtokolas[1] = TextDrawCreate(203.904815, 289.733428, "box");
    TextDrawLetterSize(TDEditor_TDProtokolas[1], 0.000000, 1.341189);
    TextDrawTextSize(TDEditor_TDProtokolas[1], 425.000000, 0.000000);
    TextDrawAlignment(TDEditor_TDProtokolas[1], 1);
    TextDrawColor(TDEditor_TDProtokolas[1], -1);
    TextDrawUseBox(TDEditor_TDProtokolas[1], 1);
    TextDrawBoxColor(TDEditor_TDProtokolas[1], 1128481791);
    TextDrawSetShadow(TDEditor_TDProtokolas[1], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[1], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[1], 255);
    TextDrawFont(TDEditor_TDProtokolas[1], 1);
    TextDrawSetProportional(TDEditor_TDProtokolas[1], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[1], 0);

    TDEditor_TDProtokolas[2] = TextDrawCreate(262.571533, 187.155548, "vardas_pavarde~n~siuo_metu_turima_protokolu~n~paskutinis_protokolas");
    TextDrawLetterSize(TDEditor_TDProtokolas[2], 0.158476, 1.035852);
    TextDrawAlignment(TDEditor_TDProtokolas[2], 1);
    TextDrawColor(TDEditor_TDProtokolas[2], -1);
    TextDrawSetShadow(TDEditor_TDProtokolas[2], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[2], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[2], 255);
    TextDrawFont(TDEditor_TDProtokolas[2], 2);
    TextDrawSetProportional(TDEditor_TDProtokolas[2], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[2], 0);

    TDEditor_TDProtokolas[3] = TextDrawCreate(210.000000, 268.211669, "box");
    TextDrawLetterSize(TDEditor_TDProtokolas[3], 0.000000, 1.199998);
    TextDrawTextSize(TDEditor_TDProtokolas[3], 262.666595, 0.000000);
    TextDrawAlignment(TDEditor_TDProtokolas[3], 1);
    TextDrawColor(TDEditor_TDProtokolas[3], -1);
    TextDrawUseBox(TDEditor_TDProtokolas[3], 1);
    TextDrawBoxColor(TDEditor_TDProtokolas[3], 1633772031);
    TextDrawSetShadow(TDEditor_TDProtokolas[3], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[3], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[3], 255);
    TextDrawFont(TDEditor_TDProtokolas[3], 1);
    TextDrawSetProportional(TDEditor_TDProtokolas[3], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[3], 0);

    TDEditor_TDProtokolas[4] = TextDrawCreate(210.900054, 269.011718, "box");
    TextDrawLetterSize(TDEditor_TDProtokolas[4], 0.000000, 1.019989);
    TextDrawTextSize(TDEditor_TDProtokolas[4], 261.995117, 0.000000);
    TextDrawAlignment(TDEditor_TDProtokolas[4], 1);
    TextDrawColor(TDEditor_TDProtokolas[4], -1);
    TextDrawUseBox(TDEditor_TDProtokolas[4], 1);
    TextDrawBoxColor(TDEditor_TDProtokolas[4], 1469078271);
    TextDrawSetShadow(TDEditor_TDProtokolas[4], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[4], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[4], 255);
    TextDrawFont(TDEditor_TDProtokolas[4], 1);
    TextDrawSetProportional(TDEditor_TDProtokolas[4], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[4], 0);
    //TextDrawSetSelectable(TDEditor_TDProtokolas[4], true);

    TDEditor_TDProtokolas[5] = TextDrawCreate(270.099395, 268.211669, "box");
    TextDrawLetterSize(TDEditor_TDProtokolas[5], 0.000000, 1.199998);
    TextDrawTextSize(TDEditor_TDProtokolas[5], 322.765991, 0.000000);
    TextDrawAlignment(TDEditor_TDProtokolas[5], 1);
    TextDrawColor(TDEditor_TDProtokolas[5], -1);
    TextDrawUseBox(TDEditor_TDProtokolas[5], 1);
    TextDrawBoxColor(TDEditor_TDProtokolas[5], 1633772031);
    TextDrawSetShadow(TDEditor_TDProtokolas[5], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[5], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[5], 255);
    TextDrawFont(TDEditor_TDProtokolas[5], 1);
    TextDrawSetProportional(TDEditor_TDProtokolas[5], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[5], 0);

    TDEditor_TDProtokolas[6] = TextDrawCreate(271.100067, 269.011718, "box");
    TextDrawLetterSize(TDEditor_TDProtokolas[6], 0.000000, 1.019989);
    TextDrawTextSize(TDEditor_TDProtokolas[6], 322.195129, 0.000000);
    TextDrawAlignment(TDEditor_TDProtokolas[6], 1);
    TextDrawColor(TDEditor_TDProtokolas[6], -1);
    TextDrawUseBox(TDEditor_TDProtokolas[6], 1);
    TextDrawBoxColor(TDEditor_TDProtokolas[6], 1469078271);
    TextDrawSetShadow(TDEditor_TDProtokolas[6], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[6], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[6], 255);
    TextDrawFont(TDEditor_TDProtokolas[6], 1);
    TextDrawSetProportional(TDEditor_TDProtokolas[6], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[6], 0);
    //TextDrawSetSelectable(TDEditor_TDProtokolas[6], true);

    TDEditor_TDProtokolas[7] = TextDrawCreate(330.000000, 268.211669, "box");
    TextDrawLetterSize(TDEditor_TDProtokolas[7], 0.000000, 1.199998);
    TextDrawTextSize(TDEditor_TDProtokolas[7], 382.666595, 0.000000);
    TextDrawAlignment(TDEditor_TDProtokolas[7], 1);
    TextDrawColor(TDEditor_TDProtokolas[7], -1);
    TextDrawUseBox(TDEditor_TDProtokolas[7], 1);
    TextDrawBoxColor(TDEditor_TDProtokolas[7], 1633772031);
    TextDrawSetShadow(TDEditor_TDProtokolas[7], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[7], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[7], 255);
    TextDrawFont(TDEditor_TDProtokolas[7], 1);
    TextDrawSetProportional(TDEditor_TDProtokolas[7], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[7], 0);

    TDEditor_TDProtokolas[8] = TextDrawCreate(331.000061, 269.011718, "box");
    TextDrawLetterSize(TDEditor_TDProtokolas[8], 0.000000, 1.019989);
    TextDrawTextSize(TDEditor_TDProtokolas[8], 382.095123, 0.000000);
    TextDrawAlignment(TDEditor_TDProtokolas[8], 1);
    TextDrawColor(TDEditor_TDProtokolas[8], -1);
    TextDrawUseBox(TDEditor_TDProtokolas[8], 1);
    TextDrawBoxColor(TDEditor_TDProtokolas[8], 1469078271);
    TextDrawSetShadow(TDEditor_TDProtokolas[8], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[8], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[8], 255);
    TextDrawFont(TDEditor_TDProtokolas[8], 1);
    TextDrawSetProportional(TDEditor_TDProtokolas[8], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[8], 0);
    //TextDrawSetSelectable(TDEditor_TDProtokolas[8], true);

    TDEditor_TDProtokolas[9] = TextDrawCreate(212.666656, 269.170257, "Israsyti_protokola");
    TextDrawLetterSize(TDEditor_TDProtokolas[9], 0.107571, 0.840519);
    TextDrawAlignment(TDEditor_TDProtokolas[9], 1);
    TextDrawColor(TDEditor_TDProtokolas[9], -1);
    TextDrawSetShadow(TDEditor_TDProtokolas[9], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[9], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[9], 0xFFFFFF00);
    TextDrawFont(TDEditor_TDProtokolas[9], 2);
    TextDrawSetProportional(TDEditor_TDProtokolas[9], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[9], 0);
    TextDrawSetSelectable(TDEditor_TDProtokolas[9], true);
    //SelectTextDraw(playerid,0xEDB409FF);

    TDEditor_TDProtokolas[10] = TextDrawCreate(275.399719, 269.170257, "Nuimti_Protokola");
    TextDrawLetterSize(TDEditor_TDProtokolas[10], 0.107570, 0.840519);
    TextDrawAlignment(TDEditor_TDProtokolas[10], 1);
    TextDrawColor(TDEditor_TDProtokolas[10], -1);
    TextDrawSetShadow(TDEditor_TDProtokolas[10], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[10], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[10], 0xFFFFFF00);
    TextDrawFont(TDEditor_TDProtokolas[10], 2);
    TextDrawSetProportional(TDEditor_TDProtokolas[10], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[10], 0);
    TextDrawSetSelectable(TDEditor_TDProtokolas[10], true);
    //SelectTextDraw(playerid, 0x0000000);

    TDEditor_TDProtokolas[11] = TextDrawCreate(332.700164, 269.170257, "ziureti_protokolus");
    TextDrawLetterSize(TDEditor_TDProtokolas[11], 0.107569, 0.840519);
    TextDrawAlignment(TDEditor_TDProtokolas[11], 1);
    TextDrawColor(TDEditor_TDProtokolas[11], -1);
    TextDrawSetShadow(TDEditor_TDProtokolas[11], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[11], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[11], 0xFFFFFF00);
    TextDrawFont(TDEditor_TDProtokolas[11], 2);
    TextDrawSetProportional(TDEditor_TDProtokolas[11], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[11], 0);
    TextDrawSetSelectable(TDEditor_TDProtokolas[11], true);
    //SelectTextDraw(playerid,0xEDB409FF);

    TDEditor_TDProtokolas[12] = TextDrawCreate(276.285858, 291.781585, "protokolu_sistema");
    TextDrawLetterSize(TDEditor_TDProtokolas[12], 0.174095, 0.874666);
    TextDrawAlignment(TDEditor_TDProtokolas[12], 1);
    TextDrawColor(TDEditor_TDProtokolas[12], -1);
    TextDrawSetShadow(TDEditor_TDProtokolas[12], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[12], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[12], 255);
    TextDrawFont(TDEditor_TDProtokolas[12], 2);
    TextDrawSetProportional(TDEditor_TDProtokolas[12], 1);
    TextDrawSetShadow(TDEditor_TDProtokolas[12], 0);
    
    TDEditor_TDProtokolas[13] = TextDrawCreate(173.571578, 151.207397, "");
    TextDrawLetterSize(TDEditor_TDProtokolas[13], 0.000000, 0.000000);
    TextDrawTextSize(TDEditor_TDProtokolas[13], 111.000000, 108.000000);
    TextDrawAlignment(TDEditor_TDProtokolas[13], 1);
    TextDrawColor(TDEditor_TDProtokolas[13], -1);
    TextDrawSetShadow(TDEditor_TDProtokolas[13], 0);
    TextDrawSetOutline(TDEditor_TDProtokolas[13], 0);
    TextDrawBackgroundColor(TDEditor_TDProtokolas[13], 1090519040);
    TextDrawFont(TDEditor_TDProtokolas[13], 5);
    TextDrawSetProportional(TDEditor_TDProtokolas[13], 0);
    TextDrawSetShadow(TDEditor_TDProtokolas[13], 0);
    TextDrawSetPreviewModel(TDEditor_TDProtokolas[13], 100);
    TextDrawSetPreviewRot(TDEditor_TDProtokolas[13], -10.000000, 0.000000, 15.000000, 1.000000);
   
	TDEditor_TRR[0] = TextDrawCreate(177.238128, 153.496215, "box");
    TextDrawLetterSize(TDEditor_TRR[0], 0.000000, 18.114292);
    TextDrawTextSize(TDEditor_TRR[0], 440.000000, 0.000000);
    TextDrawAlignment(TDEditor_TRR[0], 1);
    TextDrawColor(TDEditor_TRR[0], -1);
    TextDrawUseBox(TDEditor_TRR[0], 1);
    TextDrawBoxColor(TDEditor_TRR[0], 286331391);
    TextDrawSetShadow(TDEditor_TRR[0], 0);
    TextDrawSetOutline(TDEditor_TRR[0], 0);
    TextDrawBackgroundColor(TDEditor_TRR[0], 255);
    TextDrawFont(TDEditor_TRR[0], 1);
    TextDrawSetProportional(TDEditor_TRR[0], 1);
    TextDrawSetShadow(TDEditor_TRR[0], 0);

    TDEditor_TRR[1] = TextDrawCreate(177.238143, 141.514587, "box");
    TextDrawLetterSize(TDEditor_TRR[1], 0.000000, 0.894141);
    TextDrawTextSize(TDEditor_TRR[1], 242.000000, 0.000000);
    TextDrawAlignment(TDEditor_TRR[1], 1);
    TextDrawColor(TDEditor_TRR[1], -1);
    TextDrawUseBox(TDEditor_TRR[1], 1);
    TextDrawBoxColor(TDEditor_TRR[1], 286331391);
    TextDrawSetShadow(TDEditor_TRR[1], 0);
    TextDrawSetOutline(TDEditor_TRR[1], 0);
    TextDrawBackgroundColor(TDEditor_TRR[1], 255);
    TextDrawFont(TDEditor_TRR[1], 1);
    TextDrawSetProportional(TDEditor_TRR[1], 1);
    TextDrawSetShadow(TDEditor_TRR[1], 0);

    TDEditor_TRR[2] = TextDrawCreate(183.333251, 141.644439, "Transporto_valdymas");
    TextDrawLetterSize(TDEditor_TRR[2], 0.104381, 0.795554);
    TextDrawAlignment(TDEditor_TRR[2], 1);
    TextDrawColor(TDEditor_TRR[2], -1);
    TextDrawSetShadow(TDEditor_TRR[2], 1);
    TextDrawSetOutline(TDEditor_TRR[2], 0);
    TextDrawBackgroundColor(TDEditor_TRR[2], 255);
    TextDrawFont(TDEditor_TRR[2], 2);
    TextDrawSetProportional(TDEditor_TRR[2], 1);
    TextDrawSetShadow(TDEditor_TRR[2], 1);

    TDEditor_TRR[3] = TextDrawCreate(182.766357, 186.677658, "box");
    TextDrawLetterSize(TDEditor_TRR[3], 0.000000, 5.123806);
    TextDrawTextSize(TDEditor_TRR[3], 261.000000, 0.000000);
    TextDrawAlignment(TDEditor_TRR[3], 1);
    TextDrawColor(TDEditor_TRR[3], -1);
    TextDrawUseBox(TDEditor_TRR[3], 1);
    TextDrawBoxColor(TDEditor_TRR[3], 656680191);
    TextDrawSetShadow(TDEditor_TRR[3], 0);
    TextDrawSetOutline(TDEditor_TRR[3], 0);
    TextDrawBackgroundColor(TDEditor_TRR[3], 255);
    TextDrawFont(TDEditor_TRR[3], 1);
    TextDrawSetProportional(TDEditor_TRR[3], 1);
    TextDrawSetShadow(TDEditor_TRR[3], 0);

    TDEditor_TRR[4] = TextDrawCreate(268.898712, 186.703613, "box");
    TextDrawLetterSize(TDEditor_TRR[4], 0.000000, 5.123806);
    TextDrawTextSize(TDEditor_TRR[4], 347.612945, 0.000000);
    TextDrawAlignment(TDEditor_TRR[4], 1);
    TextDrawColor(TDEditor_TRR[4], -1);
    TextDrawUseBox(TDEditor_TRR[4], 1);
    TextDrawBoxColor(TDEditor_TRR[4], 656680191);
    TextDrawSetShadow(TDEditor_TRR[4], 0);
    TextDrawSetOutline(TDEditor_TRR[4], 0);
    TextDrawBackgroundColor(TDEditor_TRR[4], 255);
    TextDrawFont(TDEditor_TRR[4], 1);
    TextDrawSetProportional(TDEditor_TRR[4], 1);
    TextDrawSetShadow(TDEditor_TRR[4], 0);

    TDEditor_TRR[5] = TextDrawCreate(355.280639, 187.177688, "box");
    TextDrawLetterSize(TDEditor_TRR[5], 0.000000, 5.123806);
    TextDrawTextSize(TDEditor_TRR[5], 434.000000, 0.000000);
    TextDrawAlignment(TDEditor_TRR[5], 1);
    TextDrawColor(TDEditor_TRR[5], -1);
    TextDrawUseBox(TDEditor_TRR[5], 1);
    TextDrawBoxColor(TDEditor_TRR[5], 656680191);
    TextDrawSetShadow(TDEditor_TRR[5], 0);
    TextDrawSetOutline(TDEditor_TRR[5], 0);
    TextDrawBackgroundColor(TDEditor_TRR[5], 255);
    TextDrawFont(TDEditor_TRR[5], 1);
    TextDrawSetProportional(TDEditor_TRR[5], 1);
    TextDrawSetShadow(TDEditor_TRR[5], 0);

    TDEditor_TRR[6] = TextDrawCreate(223.184524, 240.999954, "box");
    TextDrawLetterSize(TDEditor_TRR[6], 0.000000, 5.238093);
    TextDrawTextSize(TDEditor_TRR[6], 396.000000, 0.000000);
    TextDrawAlignment(TDEditor_TRR[6], 1);
    TextDrawColor(TDEditor_TRR[6], -1);
    TextDrawUseBox(TDEditor_TRR[6], 1);
    TextDrawBoxColor(TDEditor_TRR[6], 656680191);
    TextDrawSetShadow(TDEditor_TRR[6], 0);
    TextDrawSetOutline(TDEditor_TRR[6], 0);
    TextDrawBackgroundColor(TDEditor_TRR[6], 255);
    TextDrawFont(TDEditor_TRR[6], 1);
    TextDrawSetProportional(TDEditor_TRR[6], 1);
    TextDrawSetShadow(TDEditor_TRR[6], 0);

    TDEditor_TRR[7] = TextDrawCreate(395.600341, 141.618484, "box");
    TextDrawLetterSize(TDEditor_TRR[7], 0.000000, 0.895237);
    TextDrawTextSize(TDEditor_TRR[7], 439.933593, 0.000000);
    TextDrawAlignment(TDEditor_TRR[7], 1);
    TextDrawColor(TDEditor_TRR[7], -1);
    TextDrawUseBox(TDEditor_TRR[7], 1);
    TextDrawBoxColor(TDEditor_TRR[7], 286331391);
    TextDrawSetShadow(TDEditor_TRR[7], 0);
    TextDrawSetOutline(TDEditor_TRR[7], 0);
    TextDrawBackgroundColor(TDEditor_TRR[7], 255);
    TextDrawFont(TDEditor_TRR[7], 1);
    TextDrawSetProportional(TDEditor_TRR[7], 1);
    TextDrawSetShadow(TDEditor_TRR[7], 0);

    TDEditor_TRR[8] = TextDrawCreate(405.800140, 141.644454, "Isjungti");
    TextDrawLetterSize(TDEditor_TRR[8], 0.139046, 0.784591);
    TextDrawAlignment(TDEditor_TRR[8], 1);
    TextDrawColor(TDEditor_TRR[8], -818004225);
    TextDrawSetShadow(TDEditor_TRR[8], 0);
    TextDrawSetOutline(TDEditor_TRR[8], 0);
    TextDrawBackgroundColor(TDEditor_TRR[8], 255);
    TextDrawFont(TDEditor_TRR[8], 2);
    TextDrawSetProportional(TDEditor_TRR[8], 1);
    TextDrawSetShadow(TDEditor_TRR[8], 0);
    TextDrawSetSelectable(TDEditor_TRR[8], true);

    TDEditor_TRR[9] = TextDrawCreate(192.476257, 173.407440, "Pirmas_transportas");
    TextDrawLetterSize(TDEditor_TRR[9], 0.121142, 0.725036);
    TextDrawAlignment(TDEditor_TRR[9], 1);
    TextDrawColor(TDEditor_TRR[9], -1);
    TextDrawSetShadow(TDEditor_TRR[9], 0);
    TextDrawSetOutline(TDEditor_TRR[9], 0);
    TextDrawBackgroundColor(TDEditor_TRR[9], 255);
    TextDrawFont(TDEditor_TRR[9], 2);
    TextDrawSetProportional(TDEditor_TRR[9], 1);
    TextDrawSetShadow(TDEditor_TRR[9], 0);

    TDEditor_TRR[10] = TextDrawCreate(281.499481, 173.407440, "antras_transportas");
    TextDrawLetterSize(TDEditor_TRR[10], 0.121142, 0.725036);
    TextDrawAlignment(TDEditor_TRR[10], 1);
    TextDrawColor(TDEditor_TRR[10], -1);
    TextDrawSetShadow(TDEditor_TRR[10], 0);
    TextDrawSetOutline(TDEditor_TRR[10], 0);
    TextDrawBackgroundColor(TDEditor_TRR[10], 255);
    TextDrawFont(TDEditor_TRR[10], 2);
    TextDrawSetProportional(TDEditor_TRR[10], 1);
    TextDrawSetShadow(TDEditor_TRR[10], 0);

    TDEditor_TRR[11] = TextDrawCreate(366.999816, 173.407440, "trecias_transportas");
    TextDrawLetterSize(TDEditor_TRR[11], 0.121142, 0.725036);
    TextDrawAlignment(TDEditor_TRR[11], 1);
    TextDrawColor(TDEditor_TRR[11], -1);
    TextDrawSetShadow(TDEditor_TRR[11], 0);
    TextDrawSetOutline(TDEditor_TRR[11], 0);
    TextDrawBackgroundColor(TDEditor_TRR[11], 255);
    TextDrawFont(TDEditor_TRR[11], 2);
    TextDrawSetProportional(TDEditor_TRR[11], 1);
    TextDrawSetShadow(TDEditor_TRR[11], 0);

    TDEditor_TRR[12] = TextDrawCreate(280.157104, 294.696411, "Jusu_turimas_laivas");
    TextDrawLetterSize(TDEditor_TRR[12], 0.121142, 0.725036);
    TextDrawAlignment(TDEditor_TRR[12], 1);
    TextDrawColor(TDEditor_TRR[12], -1);
    TextDrawSetShadow(TDEditor_TRR[12], 0);
    TextDrawSetOutline(TDEditor_TRR[12], 0);
    TextDrawBackgroundColor(TDEditor_TRR[12], 255);
    TextDrawFont(TDEditor_TRR[12], 2);
    TextDrawSetProportional(TDEditor_TRR[12], 1);
    TextDrawSetShadow(TDEditor_TRR[12], 0);

    TDEditor_TRR[13] = TextDrawCreate(213.428543, 347.798004, "box");
    TextDrawLetterSize(TDEditor_TRR[13], 0.000000, 3.485715);
    TextDrawTextSize(TDEditor_TRR[13], 402.000000, 0.000000);
    TextDrawAlignment(TDEditor_TRR[13], 1);
    TextDrawColor(TDEditor_TRR[13], -1);
    TextDrawUseBox(TDEditor_TRR[13], 1);
    TextDrawBoxColor(TDEditor_TRR[13], 286331391);
    TextDrawSetShadow(TDEditor_TRR[13], 0);
    TextDrawSetOutline(TDEditor_TRR[13], 0);
    TextDrawBackgroundColor(TDEditor_TRR[13], 255);
    TextDrawFont(TDEditor_TRR[13], 1);
    TextDrawSetProportional(TDEditor_TRR[13], 1);
    TextDrawSetShadow(TDEditor_TRR[13], 0);

    TDEditor_TRR[14] = TextDrawCreate(208.857131, 340.281372, "box");
    TextDrawLetterSize(TDEditor_TRR[14], 0.000000, 1.466665);
    TextDrawTextSize(TDEditor_TRR[14], 220.000000, 0.000000);
    TextDrawAlignment(TDEditor_TRR[14], 1);
    TextDrawColor(TDEditor_TRR[14], -1);
    TextDrawUseBox(TDEditor_TRR[14], 1);
    TextDrawBoxColor(TDEditor_TRR[14], 572662527);
    TextDrawSetShadow(TDEditor_TRR[14], 0);
    TextDrawSetOutline(TDEditor_TRR[14], 0);
    TextDrawBackgroundColor(TDEditor_TRR[14], 255);
    TextDrawFont(TDEditor_TRR[14], 1);
    TextDrawSetProportional(TDEditor_TRR[14], 1);
    TextDrawSetShadow(TDEditor_TRR[14], 0);

    TDEditor_TRR[15] = TextDrawCreate(212.285720, 339.333465, "i");
    TextDrawLetterSize(TDEditor_TRR[15], 0.400000, 1.600000);
    TextDrawAlignment(TDEditor_TRR[15], 1);
    TextDrawColor(TDEditor_TRR[15], -1);
    TextDrawSetShadow(TDEditor_TRR[15], 0);
    TextDrawSetOutline(TDEditor_TRR[15], 0);
    TextDrawBackgroundColor(TDEditor_TRR[15], 255);
    TextDrawFont(TDEditor_TRR[15], 1);
    TextDrawSetProportional(TDEditor_TRR[15], 1);
    TextDrawSetShadow(TDEditor_TRR[15], 0);

    TDEditor_TRR[16] = TextDrawCreate(308.285705, 356.400085, "Norint_gauti_daugiau_informacijos_apie_masina~n~spauskite_ant_masinos_ir_jums_ismes_gui_langa.");
    TextDrawLetterSize(TDEditor_TRR[16], 0.163809, 0.888888);
    TextDrawAlignment(TDEditor_TRR[16], 2);
    TextDrawColor(TDEditor_TRR[16], -1);
    TextDrawSetShadow(TDEditor_TRR[16], 1);
    TextDrawSetOutline(TDEditor_TRR[16], 0);
    TextDrawBackgroundColor(TDEditor_TRR[16], 255);
    TextDrawFont(TDEditor_TRR[16], 2);
    TextDrawSetProportional(TDEditor_TRR[16], 1);
    TextDrawSetShadow(TDEditor_TRR[16], 1);

	//Degaline...
    Degaline1 = TextDrawCreate(611.000000, 130.000000, "       ");
	TextDrawBackgroundColor(Degaline1, 255);
	TextDrawFont(Degaline1, 1);
	TextDrawLetterSize(Degaline1, 0.500000, 1.000000);
	TextDrawColor(Degaline1, -1);
	TextDrawSetOutline(Degaline1, 0);
	TextDrawSetProportional(Degaline1, 1);
	TextDrawSetShadow(Degaline1, 1);
	TextDrawUseBox(Degaline1, 1);
	TextDrawBoxColor(Degaline1, 255);
	TextDrawTextSize(Degaline1, 502.000000, 0.000000);

	Degaline2 = TextDrawCreate(510.000000, 130.000000, " ");
	TextDrawBackgroundColor(Degaline2, 255);
	TextDrawFont(Degaline2, 1);
	TextDrawLetterSize(Degaline2, 0.300000, 1.000000);
	TextDrawColor(Degaline2, -1);
	TextDrawSetOutline(Degaline2, 0);
	TextDrawSetProportional(Degaline2, 1);
	TextDrawSetShadow(Degaline2, 1);

	Burger = TextDrawCreate(609.000000, 132.000000, "BOX");
	TextDrawBackgroundColor(Burger, 255);
	TextDrawFont(Burger, 1);
	TextDrawLetterSize(Burger, 0.000000, 1.450000);
	TextDrawColor(Burger, -1);
	TextDrawSetOutline(Burger, 0);
	TextDrawSetProportional(Burger, 1);
	TextDrawSetShadow(Burger, 1);
	TextDrawUseBox(Burger, 1);
	TextDrawBoxColor(Burger, 117);
	TextDrawTextSize(Burger, 495.000000, 0.000000);
	TextDrawSetSelectable(Burger, 0);

	Burger1 = TextDrawCreate(499.000000, 132.500000, "hud:radar_burgerShot");
	TextDrawBackgroundColor(Burger1, 255);
	TextDrawFont(Burger1, 4);
	TextDrawLetterSize(Burger1, 0.500000, 1.000000);
	TextDrawColor(Burger1, -1);
	TextDrawSetOutline(Burger1, 0);
	TextDrawSetProportional(Burger1, 1);
	TextDrawSetShadow(Burger1, 1);
	TextDrawUseBox(Burger1, 1);
	TextDrawBoxColor(Burger1, 255);
	TextDrawTextSize(Burger1, 15.000000, 12.000000);
	TextDrawSetSelectable(Burger1, 0);

	Burger2 = TextDrawCreate(590.000000, 132.500000, "hud:radar_burgerShot");
	TextDrawBackgroundColor(Burger2, 255);
	TextDrawFont(Burger2, 4);
	TextDrawLetterSize(Burger2, 0.500000, 1.000000);
	TextDrawColor(Burger2, -1);
	TextDrawSetOutline(Burger2, 0);
	TextDrawSetProportional(Burger2, 1);
	TextDrawSetShadow(Burger2, 1);
	TextDrawUseBox(Burger2, 1);
	TextDrawBoxColor(Burger2, 255);
	TextDrawTextSize(Burger2, 15.000000, 12.000000);
	TextDrawSetSelectable(Burger2, 0);
	
    TDEditor_SPEEDTD[0] = TextDrawCreate(512.542358, 333.450073, "Rida:~n~Dirzas_/_Salmas:~n~Autopilotas:");
    TextDrawLetterSize(TDEditor_SPEEDTD[0], 0.189998, 1.100000);
    TextDrawAlignment(TDEditor_SPEEDTD[0], 1);
    TextDrawColor(TDEditor_SPEEDTD[0], -1);
    TextDrawSetShadow(TDEditor_SPEEDTD[0], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[0], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[0], 255);
    TextDrawFont(TDEditor_SPEEDTD[0], 2);
    TextDrawSetProportional(TDEditor_SPEEDTD[0], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[0], 0);
	
    /*TDEditor_SPEEDTD[0] = TextDrawCreate(467.523864, 358.770324, "box");
    TextDrawLetterSize(TDEditor_SPEEDTD[0], 0.000000, 9.238098);
    TextDrawTextSize(TDEditor_SPEEDTD[0], 634.000000, 0.000000);
    TextDrawAlignment(TDEditor_SPEEDTD[0], 1);
    TextDrawColor(TDEditor_SPEEDTD[0], -1);
    TextDrawUseBox(TDEditor_SPEEDTD[0], 1);
    TextDrawBoxColor(TDEditor_SPEEDTD[0], 522133503);
    TextDrawSetShadow(TDEditor_SPEEDTD[0], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[0], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[0], 255);
    TextDrawFont(TDEditor_SPEEDTD[0], 2);
    TextDrawSetProportional(TDEditor_SPEEDTD[0], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[0], 0);

    TDEditor_SPEEDTD[1] = TextDrawCreate(602.550781, 360.666748, "box");
    TextDrawLetterSize(TDEditor_SPEEDTD[1], 0.000000, 8.830970);
    TextDrawTextSize(TDEditor_SPEEDTD[1], 632.171875, 0.000000);
    TextDrawAlignment(TDEditor_SPEEDTD[1], 1);
    TextDrawColor(TDEditor_SPEEDTD[1], -1);
    TextDrawUseBox(TDEditor_SPEEDTD[1], 1);
    TextDrawBoxColor(TDEditor_SPEEDTD[1], 707406591);
    TextDrawSetShadow(TDEditor_SPEEDTD[1], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[1], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[1], 255);
    TextDrawFont(TDEditor_SPEEDTD[1], 1);
    TextDrawSetProportional(TDEditor_SPEEDTD[1], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[1], 0);

    TDEditor_SPEEDTD[2] = TextDrawCreate(619.870544, 362.563110, "box");
    TextDrawLetterSize(TDEditor_SPEEDTD[2], 0.000000, 8.462101);
    TextDrawTextSize(TDEditor_SPEEDTD[2], 630.901855, 0.000000);
    TextDrawAlignment(TDEditor_SPEEDTD[2], 1);
    TextDrawColor(TDEditor_SPEEDTD[2], -1);
    TextDrawUseBox(TDEditor_SPEEDTD[2], 1);
    TextDrawBoxColor(TDEditor_SPEEDTD[2], 404494591);
    TextDrawSetShadow(TDEditor_SPEEDTD[2], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[2], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[2], 255);
    TextDrawFont(TDEditor_SPEEDTD[2], 1);
    TextDrawSetProportional(TDEditor_SPEEDTD[2], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[2], 0);

    TDEditor_SPEEDTD[3] = TextDrawCreate(621.166687, 363.329254, "box");
    TextDrawLetterSize(TDEditor_SPEEDTD[3], 0.000000, 8.262538);
    TextDrawTextSize(TDEditor_SPEEDTD[3], 630.349853, 0.000000);
    TextDrawAlignment(TDEditor_SPEEDTD[3], 1);
    TextDrawColor(TDEditor_SPEEDTD[3], -1);
    TextDrawUseBox(TDEditor_SPEEDTD[3], 1);
    TextDrawBoxColor(TDEditor_SPEEDTD[3], -1672129025);
    TextDrawSetShadow(TDEditor_SPEEDTD[3], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[3], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[3], 255);
    TextDrawFont(TDEditor_SPEEDTD[3], 1);
    TextDrawSetProportional(TDEditor_SPEEDTD[3], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[3], 0);

    TDEditor_SPEEDTD[4] = TextDrawCreate(604.174377, 362.563110, "box");
    TextDrawLetterSize(TDEditor_SPEEDTD[4], 0.000000, 8.462101);
    TextDrawTextSize(TDEditor_SPEEDTD[4], 615.205688, 0.000000);
    TextDrawAlignment(TDEditor_SPEEDTD[4], 1);
    TextDrawColor(TDEditor_SPEEDTD[4], -1);
    TextDrawUseBox(TDEditor_SPEEDTD[4], 1);
    TextDrawBoxColor(TDEditor_SPEEDTD[4], 404494591);
    TextDrawSetShadow(TDEditor_SPEEDTD[4], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[4], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[4], 255);
    TextDrawFont(TDEditor_SPEEDTD[4], 1);
    TextDrawSetProportional(TDEditor_SPEEDTD[4], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[4], 0);

    TDEditor_SPEEDTD[5] = TextDrawCreate(605.070617, 363.329254, "boxz");
    TextDrawLetterSize(TDEditor_SPEEDTD[5], 0.000000, 8.262538);
    TextDrawTextSize(TDEditor_SPEEDTD[5], 614.253784, 0.000000);
    TextDrawAlignment(TDEditor_SPEEDTD[5], 1);
    TextDrawColor(TDEditor_SPEEDTD[5], -1);
    TextDrawUseBox(TDEditor_SPEEDTD[5], 1);
    TextDrawBoxColor(TDEditor_SPEEDTD[5], 1435344127);
    TextDrawSetShadow(TDEditor_SPEEDTD[5], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[5], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[5], 255);
    TextDrawFont(TDEditor_SPEEDTD[5], 1);
    TextDrawSetProportional(TDEditor_SPEEDTD[5], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[5], 0);

    TDEditor_SPEEDTD[6] = TextDrawCreate(565.524291, 362.811340, "box");
    TextDrawLetterSize(TDEditor_SPEEDTD[6], 0.000000, 0.019046);
    TextDrawTextSize(TDEditor_SPEEDTD[6], 574.001464, 0.000000);
    TextDrawAlignment(TDEditor_SPEEDTD[6], 1);
    TextDrawColor(TDEditor_SPEEDTD[6], -1);
    TextDrawUseBox(TDEditor_SPEEDTD[6], 1);
    TextDrawBoxColor(TDEditor_SPEEDTD[6], 1435344127);
    TextDrawSetShadow(TDEditor_SPEEDTD[6], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[6], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[6], 255);
    TextDrawFont(TDEditor_SPEEDTD[6], 1);
    TextDrawSetProportional(TDEditor_SPEEDTD[6], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[6], 0);

    TDEditor_SPEEDTD[7] = TextDrawCreate(578.762329, 358.770355, "Degalai");
    TextDrawLetterSize(TDEditor_SPEEDTD[7], 0.105523, 0.798814);
    TextDrawAlignment(TDEditor_SPEEDTD[7], 1);
    TextDrawColor(TDEditor_SPEEDTD[7], -1);
    TextDrawSetShadow(TDEditor_SPEEDTD[7], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[7], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[7], 255);
    TextDrawFont(TDEditor_SPEEDTD[7], 2);
    TextDrawSetProportional(TDEditor_SPEEDTD[7], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[7], 0);

    TDEditor_SPEEDTD[8] = TextDrawCreate(565.524291, 369.811767, "box");
    TextDrawLetterSize(TDEditor_SPEEDTD[8], 0.000000, 0.019046);
    TextDrawTextSize(TDEditor_SPEEDTD[8], 574.001464, 0.000000);
    TextDrawAlignment(TDEditor_SPEEDTD[8], 1);
    TextDrawColor(TDEditor_SPEEDTD[8], -1);
    TextDrawUseBox(TDEditor_SPEEDTD[8], 1);
    TextDrawBoxColor(TDEditor_SPEEDTD[8], -1672129025);
    TextDrawSetShadow(TDEditor_SPEEDTD[8], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[8], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[8], 255);
    TextDrawFont(TDEditor_SPEEDTD[8], 1);
    TextDrawSetProportional(TDEditor_SPEEDTD[8], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[8], 0);

    TDEditor_SPEEDTD[9] = TextDrawCreate(578.762329, 365.970794, "bukle");
    TextDrawLetterSize(TDEditor_SPEEDTD[9], 0.105523, 0.798814);
    TextDrawAlignment(TDEditor_SPEEDTD[9], 1);
    TextDrawColor(TDEditor_SPEEDTD[9], -1);
    TextDrawSetShadow(TDEditor_SPEEDTD[9], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[9], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[9], 255);
    TextDrawFont(TDEditor_SPEEDTD[9], 2);
    TextDrawSetProportional(TDEditor_SPEEDTD[9], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[9], 0);

    TDEditor_SPEEDTD[10] = TextDrawCreate(472.476196, 362.088806, "Variklis~n~sviesos~n~bagazine~n~kapotas~n~rida~n~dirzai~n~autopilotas");
    TextDrawLetterSize(TDEditor_SPEEDTD[10], 0.145142, 0.932667);
    TextDrawAlignment(TDEditor_SPEEDTD[10], 1);
    TextDrawColor(TDEditor_SPEEDTD[10], -1);
    TextDrawSetShadow(TDEditor_SPEEDTD[10], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[10], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[10], 255);
    TextDrawFont(TDEditor_SPEEDTD[10], 2);
    TextDrawSetProportional(TDEditor_SPEEDTD[10], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[10], 0);

    TDEditor_SPEEDTD[11] = TextDrawCreate(473.619049, 431.389251, "box");
    TextDrawLetterSize(TDEditor_SPEEDTD[11], 0.000000, 0.209521);
    TextDrawTextSize(TDEditor_SPEEDTD[11], 553.000000, 0.000000);
    TextDrawAlignment(TDEditor_SPEEDTD[11], 1);
    TextDrawColor(TDEditor_SPEEDTD[11], -1);
    TextDrawUseBox(TDEditor_SPEEDTD[11], 1);
    TextDrawBoxColor(TDEditor_SPEEDTD[11], 1434623231);
    TextDrawSetShadow(TDEditor_SPEEDTD[11], 0);
    TextDrawSetOutline(TDEditor_SPEEDTD[11], 0);
    TextDrawBackgroundColor(TDEditor_SPEEDTD[11], 255);
    TextDrawFont(TDEditor_SPEEDTD[11], 1);
    TextDrawSetProportional(TDEditor_SPEEDTD[11], 1);
    TextDrawSetShadow(TDEditor_SPEEDTD[11], 0);*/
	
	/*speed_TD [ 0 ] = TextDrawCreate(638.000000, 374.000000, "BG");
    TextDrawBackgroundColor(speed_TD [ 0 ], 255);
    TextDrawFont(speed_TD [ 0 ], 1);
    TextDrawLetterSize(speed_TD [ 0 ], 0.000000, 7.499999);
    TextDrawColor(speed_TD [ 0 ], -1);
    TextDrawSetOutline(speed_TD [ 0 ], 0);
    TextDrawSetProportional(speed_TD [ 0 ], 1);
    TextDrawSetShadow(speed_TD [ 0 ], 1);
    TextDrawUseBox(speed_TD [ 0 ], 1);
    TextDrawBoxColor(speed_TD [ 0 ], 387389439);
    TextDrawTextSize(speed_TD [ 0 ], 430.000000, 0.000000);
    TextDrawSetSelectable(speed_TD [ 0 ], 0);

    speed_TD [ 1 ] = TextDrawCreate(636.500000, 389.000000, "BG");
    TextDrawBackgroundColor(speed_TD [ 1 ], 255);
    TextDrawFont(speed_TD [ 1 ], 1);
    TextDrawLetterSize(speed_TD [ 1 ], 0.000000, 5.599998);
    TextDrawColor(speed_TD [ 1 ], -1);
    TextDrawSetOutline(speed_TD [ 1 ], 0);
    TextDrawSetProportional(speed_TD [ 1 ], 1);
    TextDrawSetShadow(speed_TD [ 1 ], 1);
    TextDrawUseBox(speed_TD [ 1 ], 1);
    TextDrawBoxColor(speed_TD [ 1 ], 1414812927);
    TextDrawTextSize(speed_TD [ 1 ], 572.000000, 0.000000);
    TextDrawSetSelectable(speed_TD [ 1 ], 0);

    speed_TD [ 2 ] = TextDrawCreate(635.250000, 390.500000, "BG");
    TextDrawBackgroundColor(speed_TD [ 2 ], 255);
    TextDrawFont(speed_TD [ 2 ], 1);
    TextDrawLetterSize(speed_TD [ 2 ], 0.000000, 3.450000);
    TextDrawColor(speed_TD [ 2 ], -1);
    TextDrawSetOutline(speed_TD [ 2 ], 0);
    TextDrawSetProportional(speed_TD [ 2 ], 1);
    TextDrawSetShadow(speed_TD [ 2 ], 1);
    TextDrawUseBox(speed_TD [ 2 ], 1);
    TextDrawBoxColor(speed_TD [ 2 ], 387389439);
    TextDrawTextSize(speed_TD [ 2 ], 573.000000, 0.000000);
    TextDrawSetSelectable(speed_TD [ 2 ], 0);

    speed_TD [ 3 ] = TextDrawCreate(635.500000, 427.000000, "BG");
    TextDrawBackgroundColor(speed_TD [ 3 ], 255);
    TextDrawFont(speed_TD [ 3 ], 1);
    TextDrawLetterSize(speed_TD [ 3 ], 0.000000, 1.199998);
    TextDrawColor(speed_TD [ 3 ], -1);
    TextDrawSetOutline(speed_TD [ 3 ], 0);
    TextDrawSetProportional(speed_TD [ 3 ], 1);
    TextDrawSetShadow(speed_TD [ 3 ], 1);
    TextDrawUseBox(speed_TD [ 3 ], 1);
    TextDrawBoxColor(speed_TD [ 3 ], 387389439);
    TextDrawTextSize(speed_TD [ 3 ], 573.000000, 0.000000);
    TextDrawSetSelectable(speed_TD [ 3 ], 0);

    speed_TD [ 4 ] = TextDrawCreate(573.500000, 389.000000, "BG");
    TextDrawBackgroundColor(speed_TD [ 4 ], 255);
    TextDrawFont(speed_TD [ 4 ], 1);
    TextDrawLetterSize(speed_TD [ 4 ], 0.000000, 5.599998);
    TextDrawColor(speed_TD [ 4 ], -1);
    TextDrawSetOutline(speed_TD [ 4 ], 0);
    TextDrawSetProportional(speed_TD [ 4 ], 1);
    TextDrawSetShadow(speed_TD [ 4 ], 1);
    TextDrawUseBox(speed_TD [ 4 ], 1);
    TextDrawBoxColor(speed_TD [ 4 ], 1414812927);
    TextDrawTextSize(speed_TD [ 4 ], 432.000000, 0.000000);
    TextDrawSetSelectable(speed_TD [ 4 ], 0);

    speed_TD [ 5 ] = TextDrawCreate(572.250000, 390.500000, "BG");
    TextDrawBackgroundColor(speed_TD [ 5 ], 255);
    TextDrawFont(speed_TD [ 5 ], 1);
    TextDrawLetterSize(speed_TD [ 5 ], 0.000000, 5.250000);
    TextDrawColor(speed_TD [ 5 ], -1);
    TextDrawSetOutline(speed_TD [ 5 ], 0);
    TextDrawSetProportional(speed_TD [ 5 ], 1);
    TextDrawSetShadow(speed_TD [ 5 ], 1);
    TextDrawUseBox(speed_TD [ 5 ], 1);
    TextDrawBoxColor(speed_TD [ 5 ], 387389439);
    TextDrawTextSize(speed_TD [ 5 ], 433.000000, 0.000000);
    TextDrawSetSelectable(speed_TD [ 5 ], 0);*/
    
    TDEditor_Degalai = TextDrawCreate(234.380996, 173.407348, "box");
    TextDrawLetterSize(TDEditor_Degalai, 0.000000, 4.514274);
    TextDrawTextSize(TDEditor_Degalai, 396.000000, 0.000000);
    TextDrawAlignment(TDEditor_Degalai, 1);
    TextDrawColor(TDEditor_Degalai, -1);
    TextDrawUseBox(TDEditor_Degalai, 1);
    TextDrawBoxColor(TDEditor_Degalai, 286331391);
    TextDrawSetShadow(TDEditor_Degalai, 0);
    TextDrawSetOutline(TDEditor_Degalai, 0);
    TextDrawBackgroundColor(TDEditor_Degalai, 255);
    TextDrawFont(TDEditor_Degalai, 1);
    TextDrawSetProportional(TDEditor_Degalai, 1);
    TextDrawSetShadow(TDEditor_Degalai, 0);

    TDEditor_Degalai1 = TextDrawCreate(341.466522, 218.478698, "box");
    TextDrawLetterSize(TDEditor_Degalai1, 0.000000, 0.895234);
    TextDrawTextSize(TDEditor_Degalai1, 396.000000, 0.000000);
    TextDrawAlignment(TDEditor_Degalai1, 1);
    TextDrawColor(TDEditor_Degalai1, -1);
    TextDrawUseBox(TDEditor_Degalai1, 1);
    TextDrawBoxColor(TDEditor_Degalai1, 286331391);
    TextDrawSetShadow(TDEditor_Degalai1, 0);
    TextDrawSetOutline(TDEditor_Degalai1, 0);
    TextDrawBackgroundColor(TDEditor_Degalai1, 255);
    TextDrawFont(TDEditor_Degalai1, 1);
    TextDrawSetProportional(TDEditor_Degalai1, 1);
    TextDrawSetShadow(TDEditor_Degalai1, 0);

    TDEditor_Degalai2 = TextDrawCreate(346.361816, 218.278656, "atsaukti_pylima");
    TextDrawLetterSize(TDEditor_Degalai2, 0.128047, 0.789851);
    TextDrawAlignment(TDEditor_Degalai2, 1);
    TextDrawColor(TDEditor_Degalai2, -1084005377);
    TextDrawSetShadow(TDEditor_Degalai2, 1);
    TextDrawSetOutline(TDEditor_Degalai2, 0);
    TextDrawBackgroundColor(TDEditor_Degalai2, 255);
    TextDrawFont(TDEditor_Degalai2, 2);
    TextDrawSetProportional(TDEditor_Degalai2, 1);
    TextDrawSetShadow(TDEditor_Degalai2, 1);
    TextDrawSetSelectable(TDEditor_Degalai2, true);

    TDEditor_Degalai3 = TextDrawCreate(239.333480, 177.199966, "tr._pavadinimas~n~tarifas~n~ipilta~n~suma");
    TextDrawLetterSize(TDEditor_Degalai3, 0.174095, 0.874667);
    TextDrawAlignment(TDEditor_Degalai3, 1);
    TextDrawColor(TDEditor_Degalai3, -1);
    TextDrawSetShadow(TDEditor_Degalai3, 0);
    TextDrawSetOutline(TDEditor_Degalai3, 0);
    TextDrawBackgroundColor(TDEditor_Degalai3, 255);
    TextDrawFont(TDEditor_Degalai3, 2);
    TextDrawSetProportional(TDEditor_Degalai3, 1);
    TextDrawSetShadow(TDEditor_Degalai3, 0);

    TDEditor_Degalai4 = TextDrawCreate(302.085906, 176.977813, "hotring_racer");
    TextDrawLetterSize(TDEditor_Degalai4, 0.174095, 0.874667);
    TextDrawAlignment(TDEditor_Degalai4, 1);
    TextDrawColor(TDEditor_Degalai4, 1790234879);
    TextDrawSetShadow(TDEditor_Degalai4, 0);
    TextDrawSetOutline(TDEditor_Degalai4, 0);
    TextDrawBackgroundColor(TDEditor_Degalai4, 255);
    TextDrawFont(TDEditor_Degalai4, 2);
    TextDrawSetProportional(TDEditor_Degalai4, 1);
    TextDrawSetShadow(TDEditor_Degalai4, 0);

    TDEditor_Degalai5 = TextDrawCreate(270.984008, 184.878295, "15eur_uz_litra");
    TextDrawLetterSize(TDEditor_Degalai5, 0.174095, 0.874667);
    TextDrawAlignment(TDEditor_Degalai5, 1);
    TextDrawColor(TDEditor_Degalai5, 1792049663);
    TextDrawSetShadow(TDEditor_Degalai5, 0);
    TextDrawSetOutline(TDEditor_Degalai5, 0);
    TextDrawBackgroundColor(TDEditor_Degalai5, 255);
    TextDrawFont(TDEditor_Degalai5, 2);
    TextDrawSetProportional(TDEditor_Degalai5, 1);
    TextDrawSetShadow(TDEditor_Degalai5, 0);

    TDEditor_Degalai6 = TextDrawCreate(260.102416, 200.679260, "250EUR");
    TextDrawLetterSize(TDEditor_Degalai6, 0.174095, 0.874667);
    TextDrawAlignment(TDEditor_Degalai6, 1);
    TextDrawColor(TDEditor_Degalai6, 1792049663);
    TextDrawSetShadow(TDEditor_Degalai6, 0);
    TextDrawSetOutline(TDEditor_Degalai6, 0);
    TextDrawBackgroundColor(TDEditor_Degalai6, 255);
    TextDrawFont(TDEditor_Degalai6, 2);
    TextDrawSetProportional(TDEditor_Degalai6, 1);
    TextDrawSetShadow(TDEditor_Degalai6, 0);

    TDEditor_Degalai7 = TextDrawCreate(263.502624, 192.978790, "25L");
    TextDrawLetterSize(TDEditor_Degalai7, 0.174095, 0.874667);
    TextDrawAlignment(TDEditor_Degalai7, 1);
    TextDrawColor(TDEditor_Degalai7, -1160746241);
    TextDrawSetShadow(TDEditor_Degalai7, 0);
    TextDrawSetOutline(TDEditor_Degalai7, 0);
    TextDrawBackgroundColor(TDEditor_Degalai7, 255);
    TextDrawFont(TDEditor_Degalai7, 2);
    TextDrawSetProportional(TDEditor_Degalai7, 1);
    TextDrawSetShadow(TDEditor_Degalai7, 0);
    
    


	for(new p = 0; p < MAX_PLAYERS; p++)
	{
		
		/*speed_pTD [ p ] [ 0 ] = TextDrawCreate(605.500000, 428.000000, "00000075");
	    TextDrawAlignment(speed_pTD [ p ] [ 0 ], 2);
	    TextDrawBackgroundColor(speed_pTD [ p ] [ 0 ], 656877567);
	    TextDrawFont(speed_pTD [ p ] [ 0 ], 2);
	    TextDrawLetterSize(speed_pTD [ p ] [ 0 ], 0.169998, 0.899999);
	    TextDrawColor(speed_pTD [ p ] [ 0 ], -943208449);
	    TextDrawSetOutline(speed_pTD [ p ] [ 0 ], 0);
	    TextDrawSetProportional(speed_pTD [ p ] [ 0 ], 1);
	    TextDrawSetShadow(speed_pTD [ p ] [ 0 ], 0);

	    speed_pTD [ p ] [ 1 ] = TextDrawCreate(435.500000, 375.000000, "INFERNUS");
	    TextDrawBackgroundColor(speed_pTD [ p ] [ 1 ], 0);
	    TextDrawFont(speed_pTD [ p ] [ 1 ], 2);
	    TextDrawLetterSize(speed_pTD [ p ] [ 1 ], 0.189998, 0.999999);
	    TextDrawColor(speed_pTD [ p ] [ 1 ], -1);
	    TextDrawSetOutline(speed_pTD [ p ] [ 1 ], 0);
	    TextDrawSetProportional(speed_pTD [ p ] [ 1 ], 1);
	    TextDrawSetShadow(speed_pTD [ p ] [ 1 ], 0);

	    speed_pTD [ p ] [ 2 ] = TextDrawCreate(438.500000, 391.000000, "~w~Dirzas: ~g~uzsegtas~n~~w~Autopilotas: ~r~isjungtas~n~~w~Degalai: ~y~75L~n~~w~Radijas: ~y~ZIP FM~n~~w~Bukle: ~g~100%");
	    TextDrawBackgroundColor(speed_pTD [ p ] [ 2 ], 151587327);
	    TextDrawFont(speed_pTD [ p ] [ 2 ], 2);
	    TextDrawLetterSize(speed_pTD [ p ] [ 2 ], 0.169999, 0.999998);
	    TextDrawColor(speed_pTD [ p ] [ 2 ], -1);
	    TextDrawSetOutline(speed_pTD [ p ] [ 2 ], 1);
	    TextDrawSetProportional(speed_pTD [ p ] [ 2 ], 1);

	    speed_pTD [ p ] [ 3 ] = TextDrawCreate(605.500000, 396.000000, "259");
	    TextDrawAlignment(speed_pTD [ p ] [ 3 ], 2);
	    TextDrawBackgroundColor(speed_pTD [ p ] [ 3 ], 255);
	    TextDrawFont(speed_pTD [ p ] [ 3 ], 3);
	    TextDrawLetterSize(speed_pTD [ p ] [ 3 ], 0.549998, 2.099998);
	    TextDrawColor(speed_pTD [ p ] [ 3 ], -1);
	    TextDrawSetOutline(speed_pTD [ p ] [ 3 ], 1);
	    TextDrawSetProportional(speed_pTD [ p ] [ 3 ], 1);


		SpeedoText[p][0] = TextDrawCreate(638.000000, 361.000000, "          ");
		TextDrawBackgroundColor(SpeedoText[p][0], 255);
		TextDrawFont(SpeedoText[p][0], 1);
		TextDrawLetterSize(SpeedoText[p][0], 0.500000, 1.000000);
		TextDrawColor(SpeedoText[p][0], -1);
		TextDrawSetOutline(SpeedoText[p][0], 0);
		TextDrawSetProportional(SpeedoText[p][0], 1);
		TextDrawSetShadow(SpeedoText[p][0], 1);
		TextDrawUseBox(SpeedoText[p][0], 1);
		TextDrawBoxColor(SpeedoText[p][0], 255);
		TextDrawTextSize(SpeedoText[p][0], 427.000000, 3.000000);
		TextDrawSetSelectable(SpeedoText[p][0], 0);

		SpeedoText[p][1] = TextDrawCreate(635.000000, 364.000000, "          ");
		TextDrawBackgroundColor(SpeedoText[p][1], 255);
		TextDrawFont(SpeedoText[p][1], 1);
		TextDrawLetterSize(SpeedoText[p][1], 0.500000, 0.799999);
		TextDrawColor(SpeedoText[p][1], -1);
		TextDrawSetOutline(SpeedoText[p][1], 0);
		TextDrawSetProportional(SpeedoText[p][1], 1);
		TextDrawSetShadow(SpeedoText[p][1], 1);
		TextDrawUseBox(SpeedoText[p][1], 1);
		TextDrawBoxColor(SpeedoText[p][1], 1347440720);
		TextDrawTextSize(SpeedoText[p][1], 430.000000, 3.000000);
		TextDrawSetSelectable(SpeedoText[p][1], 0);

		SpeedoText[p][2] = TextDrawCreate(435.000000, 364.000000, "~y~Pavadinimas: ~b~Police Maverick~n~~y~Bukle: ~b~100%~n~~y~Rida: ~B~1000.00 KM~n~~y~Degalai: ~b~60 L~n~~y~Greitis: ~b~100 KM/H");
		TextDrawBackgroundColor(SpeedoText[p][2], 255);
		TextDrawFont(SpeedoText[p][2], 2);
		TextDrawLetterSize(SpeedoText[p][2], 0.290000, 1.400000);
		TextDrawColor(SpeedoText[p][2], -1);
		TextDrawSetOutline(SpeedoText[p][2], 0);
		TextDrawSetProportional(SpeedoText[p][2], 1);
		TextDrawSetShadow(SpeedoText[p][2], 1);
		TextDrawSetSelectable(SpeedoText[p][2], 0);*/
		
        
		/*TDEditor_PTDPasirinkimas[p][0] = TextDrawCreate(203.904769, 134.035171, "box");
        TextDrawLetterSize(TDEditor_PTDPasirinkimas[p][0], 0.000000, 1.272002);
        TextDrawTextSize(TDEditor_PTDPasirinkimas[p][0], 428.680664, 0.000000);
        TextDrawAlignment(TDEditor_PTDPasirinkimas[p][0], 1);
        TextDrawColor(TDEditor_PTDPasirinkimas[p][0], -1);
        TextDrawUseBox(TDEditor_PTDPasirinkimas[p][0], 1);
        TextDrawBoxColor(TDEditor_PTDPasirinkimas[p][0], 1504073983);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][0], 0);
        TextDrawSetOutline(TDEditor_PTDPasirinkimas[p][0], 0);
        TextDrawBackgroundColor(TDEditor_PTDPasirinkimas[p][0], 255);
        TextDrawFont(TDEditor_PTDPasirinkimas[p][0], 1);
        TextDrawSetProportional(TDEditor_PTDPasirinkimas[p][0], 1);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][0], 0);

        TDEditor_PTDPasirinkimas[p][1] = TextDrawCreate(253.809616, 135.559310, "Pasirinkite_kokiame_mieste_norite_pradeti_zaidima");
        TextDrawLetterSize(TDEditor_PTDPasirinkimas[p][1], 0.118857, 0.846296);
        TextDrawAlignment(TDEditor_PTDPasirinkimas[p][1], 1);
        TextDrawColor(TDEditor_PTDPasirinkimas[p][1], -1);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][1], 0);
        TextDrawSetOutline(TDEditor_PTDPasirinkimas[p][1], 0);
        TextDrawBackgroundColor(TDEditor_PTDPasirinkimas[p][1], 255);
        TextDrawFont(TDEditor_PTDPasirinkimas[p][1], 2);
        TextDrawSetProportional(TDEditor_PTDPasirinkimas[p][1], 1);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][1], 0);

        TDEditor_PTDPasirinkimas[p][2] = TextDrawCreate(210.761962, 156.814819, "box");
        TextDrawLetterSize(TDEditor_PTDPasirinkimas[p][2], 0.000000, 6.723808);
        TextDrawTextSize(TDEditor_PTDPasirinkimas[p][2], 310.000000, 0.000000);
        TextDrawAlignment(TDEditor_PTDPasirinkimas[p][2], 1);
        TextDrawColor(TDEditor_PTDPasirinkimas[p][2], -1);
        TextDrawUseBox(TDEditor_PTDPasirinkimas[p][2], 1);
        TextDrawBoxColor(TDEditor_PTDPasirinkimas[p][2], 1179010815);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][2], 0);
        TextDrawSetOutline(TDEditor_PTDPasirinkimas[p][2], 0);
        TextDrawBackgroundColor(TDEditor_PTDPasirinkimas[p][2], 255);
        TextDrawFont(TDEditor_PTDPasirinkimas[p][2], 1);
        TextDrawSetProportional(TDEditor_PTDPasirinkimas[p][2], 1);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][2], 0);

        TDEditor_PTDPasirinkimas[p][3] = TextDrawCreate(321.099731, 156.814819, "box");
        TextDrawLetterSize(TDEditor_PTDPasirinkimas[p][3], 0.000000, 6.723808);
        TextDrawTextSize(TDEditor_PTDPasirinkimas[p][3], 420.337066, 0.000000);
        TextDrawAlignment(TDEditor_PTDPasirinkimas[p][3], 1);
        TextDrawColor(TDEditor_PTDPasirinkimas[p][3], -1);
        TextDrawUseBox(TDEditor_PTDPasirinkimas[p][3], 1);
        TextDrawBoxColor(TDEditor_PTDPasirinkimas[p][3], 1179010815);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][3], 0);
        TextDrawSetOutline(TDEditor_PTDPasirinkimas[p][3], 0);
        TextDrawBackgroundColor(TDEditor_PTDPasirinkimas[p][3], 255);
        TextDrawFont(TDEditor_PTDPasirinkimas[p][3], 1);
        TextDrawSetProportional(TDEditor_PTDPasirinkimas[p][3], 1);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][3], 0);

        TDEditor_PTDPasirinkimas[p][4] = TextDrawCreate(234.388137, 226.105682, "SAN_FIERRO");
        TextDrawLetterSize(TDEditor_PTDPasirinkimas[p][4], 0.181714, 1.035852);
        TextDrawAlignment(TDEditor_PTDPasirinkimas[p][4], 1);
        TextDrawColor(TDEditor_PTDPasirinkimas[p][4], -1);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][4], 0);
        TextDrawSetOutline(TDEditor_PTDPasirinkimas[p][4], 0);
        TextDrawBackgroundColor(TDEditor_PTDPasirinkimas[p][4], 255);
        TextDrawFont(TDEditor_PTDPasirinkimas[p][4], 2);
        TextDrawSetProportional(TDEditor_PTDPasirinkimas[p][4], 1);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][4], 0);

        TDEditor_PTDPasirinkimas[p][5] = TextDrawCreate(372.701782, 226.105682, "Fort_Carson");
        TextDrawLetterSize(TDEditor_PTDPasirinkimas[p][5], 0.181714, 1.035852);
        TextDrawAlignment(TDEditor_PTDPasirinkimas[p][5], 2);
        TextDrawColor(TDEditor_PTDPasirinkimas[p][5], -1);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][5], 0);
        TextDrawSetOutline(TDEditor_PTDPasirinkimas[p][5], 0);
        TextDrawBackgroundColor(TDEditor_PTDPasirinkimas[p][5], 255);
        TextDrawFont(TDEditor_PTDPasirinkimas[p][5], 2);
        TextDrawSetProportional(TDEditor_PTDPasirinkimas[p][5], 1);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][5], 0);

        TDEditor_PTDPasirinkimas[p][6] = TextDrawCreate(208.238113, 137.933303, "");
        TextDrawLetterSize(TDEditor_PTDPasirinkimas[p][6], 0.000000, 0.000000);
        TextDrawTextSize(TDEditor_PTDPasirinkimas[p][6], 90.000000, 90.000000);
        TextDrawAlignment(TDEditor_PTDPasirinkimas[p][6], 1);
        TextDrawColor(TDEditor_PTDPasirinkimas[p][6], -1);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][6], 0);
        TextDrawSetOutline(TDEditor_PTDPasirinkimas[p][6], 0);
        TextDrawBackgroundColor(TDEditor_PTDPasirinkimas[p][6], 1090519040);
        TextDrawFont(TDEditor_PTDPasirinkimas[p][6], 5);
        TextDrawSetProportional(TDEditor_PTDPasirinkimas[p][6], 0);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][6], 0);
        TextDrawSetPreviewModel(TDEditor_PTDPasirinkimas[p][6], 6388);
        TextDrawSetPreviewRot(TDEditor_PTDPasirinkimas[p][6], 0.000000, 0.000000, 0.000000, 1.000000);
        TextDrawSetSelectable(TDEditor_PTDPasirinkimas[p][6], true);

        TDEditor_PTDPasirinkimas[p][7] = TextDrawCreate(303.653991, 136.349166, "");
        TextDrawLetterSize(TDEditor_PTDPasirinkimas[p][7], 0.000000, 0.000000);
        TextDrawTextSize(TDEditor_PTDPasirinkimas[p][7], 134.000000, 98.000000);
        TextDrawAlignment(TDEditor_PTDPasirinkimas[p][7], 1);
        TextDrawColor(TDEditor_PTDPasirinkimas[p][7], -1);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][7], 0);
        TextDrawSetOutline(TDEditor_PTDPasirinkimas[p][7], 0);
        TextDrawBackgroundColor(TDEditor_PTDPasirinkimas[p][7], 1090519040);
        TextDrawFont(TDEditor_PTDPasirinkimas[p][7], 5);
        TextDrawSetProportional(TDEditor_PTDPasirinkimas[p][7], 0);
        TextDrawSetShadow(TDEditor_PTDPasirinkimas[p][7], 0);
        TextDrawSetPreviewModel(TDEditor_PTDPasirinkimas[p][7], 10049);
        TextDrawSetPreviewRot(TDEditor_PTDPasirinkimas[p][7], 0.000000, 0.000000, 0.000000, 1.000000);
        TextDrawSetSelectable(TDEditor_PTDPasirinkimas[p][7], true);*/
		
		// Transporto informacija
		zInfo[p][vCarInfo] = TextDrawCreate(30.000000, 355.000000, "~w~Masinos pavadinimas: ~y~Buffalo~n~~w~Kaina: ~y~120000$~n~~w~Remonto kaina: ~y~77000~n~~w~Pagaminimo metai: ~y~2007");
		TextDrawBackgroundColor(zInfo[p][vCarInfo], 255);
		TextDrawFont(zInfo[p][vCarInfo], 2);
		TextDrawLetterSize(zInfo[p][vCarInfo], 0.189999, 0.799998);
		TextDrawColor(zInfo[p][vCarInfo], -1);
		TextDrawSetOutline(zInfo[p][vCarInfo], 0);
		TextDrawSetProportional(zInfo[p][vCarInfo], 1);
		TextDrawSetShadow(zInfo[p][vCarInfo], 1);

		InformacijosDezute[p] = TextDrawCreate( 13, 150, " " );
	   	TextDrawUseBox(InformacijosDezute[p],1);
	   	TextDrawBoxColor(InformacijosDezute[p],0x00000066);
	   	TextDrawTextSize(InformacijosDezute[p],159, 81);
	   	TextDrawAlignment(InformacijosDezute[p],0);
	   	TextDrawBackgroundColor(InformacijosDezute[p],0x000000ff);
	   	TextDrawFont(InformacijosDezute[p],2);
	   	TextDrawLetterSize(InformacijosDezute[p],0.199999,1.200005);
	   	TextDrawColor(InformacijosDezute[p],0xffffffff );
	   	TextDrawSetOutline(InformacijosDezute[p],1);
	   	TextDrawSetProportional(InformacijosDezute[p],1);
	   	TextDrawSetShadow(InformacijosDezute[p],1);

		InfoBox[p] = TextDrawCreate( 13, 150, " " );
	   	TextDrawUseBox(InfoBox[p],1);
	   	TextDrawBoxColor(InfoBox[p],0x00000066);
	   	TextDrawTextSize(InfoBox[p],159, 81);
	   	TextDrawAlignment(InfoBox[p],0);
	   	TextDrawBackgroundColor(InfoBox[p],0x000000ff);
	   	TextDrawFont(InfoBox[p],2);
	   	TextDrawLetterSize(InfoBox[p],0.199999,1.200005);
	   	TextDrawColor(InfoBox[p],0xffffffff );
	   	TextDrawSetOutline(InfoBox[p],1);
	   	TextDrawSetProportional(InfoBox[p],1);
	   	TextDrawSetShadow(InfoBox[p],1);

	   	AlkTD[ p ] = TextDrawCreate(552.000000, 133.000000, "~p~ALKIS: ~p~27%");
		TextDrawAlignment(AlkTD[ p ], 2);
		TextDrawBackgroundColor(AlkTD[ p ], 255);
		TextDrawFont(AlkTD[ p ], 2);
		TextDrawLetterSize(AlkTD[ p ], 0.280000, 1.100000);
		TextDrawColor(AlkTD[ p ], -1);
		TextDrawSetOutline(AlkTD[ p ], 1);
		TextDrawSetProportional(AlkTD[ p ], 1);
		TextDrawSetSelectable(AlkTD[ p ], 0);


		taksimetras_p[p][0] = TextDrawCreate(82.399940, 203.055419, "~w~1KM kaina:~g~ 100~w~euru");
		TextDrawLetterSize(taksimetras_p[p][0], 0.189000, 1.071111);
		TextDrawAlignment(taksimetras_p[p][0], 2);
		TextDrawColor(taksimetras_p[p][0], -1);
		TextDrawSetShadow(taksimetras_p[p][0], 0);
		TextDrawSetOutline(taksimetras_p[p][0], 0);
		TextDrawBackgroundColor(taksimetras_p[p][0], 255);
		TextDrawFont(taksimetras_p[p][0], 2);
		TextDrawSetProportional(taksimetras_p[p][0], 1);
		TextDrawSetShadow(taksimetras_p[p][0], 0);

		taksimetras_p[p][1] = TextDrawCreate(82.399940, 229.457031, "~w~nuvaziuota: ~p~15.15~w~km");
		TextDrawLetterSize(taksimetras_p[p][1], 0.189000, 1.071111);
		TextDrawAlignment(taksimetras_p[p][1], 2);
		TextDrawColor(taksimetras_p[p][1], -1);
		TextDrawSetShadow(taksimetras_p[p][1], 0);
		TextDrawSetOutline(taksimetras_p[p][1], 0);
		TextDrawBackgroundColor(taksimetras_p[p][1], 255);
		TextDrawFont(taksimetras_p[p][1], 2);
		TextDrawSetProportional(taksimetras_p[p][1], 1);
		TextDrawSetShadow(taksimetras_p[p][1], 0);
		//DARBO SUTARTIS
		/*Darbosutartis[p][0] = TextDrawCreate(443.504608, 226.029647, "box");
		TextDrawLetterSize(Darbosutartis[p][0], 0.000000, 10.266674);
		TextDrawTextSize(Darbosutartis[p][0], 634.600097, 0.000000);
		TextDrawAlignment(Darbosutartis[p][0], 1);
		TextDrawColor(Darbosutartis[p][0], -1);
		TextDrawUseBox(Darbosutartis[p][0], 1);
		TextDrawBoxColor(Darbosutartis[p][0], 471604479);
		TextDrawSetShadow(Darbosutartis[p][0], 0);
		TextDrawSetOutline(Darbosutartis[p][0], 0);
		TextDrawBackgroundColor(Darbosutartis[p][0], 255);
		TextDrawFont(Darbosutartis[p][0], 1);
		TextDrawSetProportional(Darbosutartis[p][0], 1);
		TextDrawSetShadow(Darbosutartis[p][0], 0);

		Darbosutartis[p][1] = TextDrawCreate(583.018371, 231.729934, "box");
		TextDrawLetterSize(Darbosutartis[p][1], 0.000000, 8.933333);
		TextDrawTextSize(Darbosutartis[p][1], 628.699829, 0.000000);
		TextDrawAlignment(Darbosutartis[p][1], 1);
		TextDrawColor(Darbosutartis[p][1], -1);
		TextDrawUseBox(Darbosutartis[p][1], 1);
		TextDrawBoxColor(Darbosutartis[p][1], 808135679);
		TextDrawSetShadow(Darbosutartis[p][1], 0);
		TextDrawSetOutline(Darbosutartis[p][1], 0);
		TextDrawBackgroundColor(Darbosutartis[p][1], 255);
		TextDrawFont(Darbosutartis[p][1], 1);
		TextDrawSetProportional(Darbosutartis[p][1], 1);
		TextDrawSetShadow(Darbosutartis[p][1], 0);

		Darbosutartis[p][2] = TextDrawCreate(561.397827, 227.741043, "");
		TextDrawLetterSize(Darbosutartis[p][2], 0.000000, 0.000000);
		TextDrawTextSize(Darbosutartis[p][2], 85.000000, 82.000000);
		TextDrawAlignment(Darbosutartis[p][2], 1);
		TextDrawColor(Darbosutartis[p][2], -1);
		TextDrawSetShadow(Darbosutartis[p][2], 0);
		TextDrawSetOutline(Darbosutartis[p][2], 0);
		TextDrawBackgroundColor(Darbosutartis[p][2], 0);
		TextDrawFont(Darbosutartis[p][2], 5);
		TextDrawSetProportional(Darbosutartis[p][2], 0);
		TextDrawSetShadow(Darbosutartis[p][2], 0);
		TextDrawSetPreviewModel(Darbosutartis[p][2], 311);
		TextDrawSetPreviewRot(Darbosutartis[p][2], 0.000000, 0.000000, -20.000000, 1.000000);

		Darbosutartis[p][3] = TextDrawCreate(448.018890, 300.466766, "box");
		TextDrawLetterSize(Darbosutartis[p][3], 0.000000, 1.276186);
		TextDrawTextSize(Darbosutartis[p][3], 575.000000, 0.000000);
		TextDrawAlignment(Darbosutartis[p][3], 1);
		TextDrawColor(Darbosutartis[p][3], -1);
		TextDrawUseBox(Darbosutartis[p][3], 1);
		TextDrawBoxColor(Darbosutartis[p][3], 808135679);
		TextDrawSetShadow(Darbosutartis[p][3], 0);
		TextDrawSetOutline(Darbosutartis[p][3], 0);
		TextDrawBackgroundColor(Darbosutartis[p][3], 255);
		TextDrawFont(Darbosutartis[p][3], 1);
		TextDrawSetProportional(Darbosutartis[p][3], 1);
		TextDrawSetShadow(Darbosutartis[p][3], 0);

		Darbosutartis[p][4] = TextDrawCreate(448.090606, 246.030090, "box");
		TextDrawLetterSize(Darbosutartis[p][4], 0.000000, 5.314279);
		TextDrawTextSize(Darbosutartis[p][4], 574.699584, 0.000000);
		TextDrawAlignment(Darbosutartis[p][4], 1);
		TextDrawColor(Darbosutartis[p][4], -1);
		TextDrawUseBox(Darbosutartis[p][4], 1);
		TextDrawBoxColor(Darbosutartis[p][4], 808135679);
		TextDrawSetShadow(Darbosutartis[p][4], 0);
		TextDrawSetOutline(Darbosutartis[p][4], 0);
		TextDrawBackgroundColor(Darbosutartis[p][4], 255);
		TextDrawFont(Darbosutartis[p][4], 1);
		TextDrawSetProportional(Darbosutartis[p][4], 1);
		TextDrawSetShadow(Darbosutartis[p][4], 0);

		Darbosutartis[p][5] = TextDrawCreate(479.714355, 230.770446, "POLICIJOS_DEP.");
		TextDrawLetterSize(Darbosutartis[p][5], 0.200000, 1.000000);
		TextDrawAlignment(Darbosutartis[p][5], 1);
		TextDrawColor(Darbosutartis[p][5], -2139062017);
		TextDrawSetShadow(Darbosutartis[p][5], 0);
		TextDrawSetOutline(Darbosutartis[p][5], 0);
		TextDrawBackgroundColor(Darbosutartis[p][5], 255);
		TextDrawFont(Darbosutartis[p][5], 2);
		TextDrawSetProportional(Darbosutartis[p][5], 1);
		TextDrawSetShadow(Darbosutartis[p][5], 0);

		Darbosutartis[p][6] = TextDrawCreate(509.272827, 301.407409, "Isidarbinti");
		TextDrawLetterSize(Darbosutartis[p][6], 0.250000, 1.000000);
		TextDrawAlignment(Darbosutartis[p][6], 2);
		TextDrawColor(Darbosutartis[p][6], -2139062017);
		TextDrawSetShadow(Darbosutartis[p][6], 0);
		TextDrawSetOutline(Darbosutartis[p][6], 0);
		TextDrawBackgroundColor(Darbosutartis[p][6], 255);
		TextDrawFont(Darbosutartis[p][6], 2);
		TextDrawSetProportional(Darbosutartis[p][6], 1);
		TextDrawSetShadow(Darbosutartis[p][6], 0);
		TextDrawSetSelectable(Darbosutartis[p][6], true);

		Darbosutartis[p][7] = TextDrawCreate(452.547546, 249.781524, "Reikalinga_xp_pat._5000_XP~n~~n~Darbo_pakvietimas._Neturi~n~~n~B_kat._teises._Turi");
		TextDrawLetterSize(Darbosutartis[p][7], 0.150000, 0.899999);
		TextDrawAlignment(Darbosutartis[p][7], 1);
		TextDrawColor(Darbosutartis[p][7], -1);
		TextDrawSetShadow(Darbosutartis[p][7], 0);
		TextDrawSetOutline(Darbosutartis[p][7], 0);
		TextDrawBackgroundColor(Darbosutartis[p][7], 255);
		TextDrawFont(Darbosutartis[p][7], 2);
		TextDrawSetProportional(Darbosutartis[p][7], 1);
		TextDrawSetShadow(Darbosutartis[p][7], 0);*/

        

		/*TDRegistracija_TD[p][0] = TextDrawCreate(435.882202, -10.666652, "box");
        TextDrawLetterSize(TDRegistracija_TD[p][0], 0.000000, 51.552906);
        TextDrawTextSize(TDRegistracija_TD[p][0], 638.000000, 0.000000);
        TextDrawAlignment(TDRegistracija_TD[p][0], 1);
        TextDrawColor(TDRegistracija_TD[p][0], -1);
        TextDrawUseBox(TDRegistracija_TD[p][0], 1);
        TextDrawBoxColor(TDRegistracija_TD[p][0], 336860415);
        TextDrawSetShadow(TDRegistracija_TD[p][0], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][0], 0);
        TextDrawBackgroundColor(TDRegistracija_TD[p][0], 255);
        TextDrawFont(TDRegistracija_TD[p][0], 1);
        TextDrawSetProportional(TDRegistracija_TD[p][0], 1);
        TextDrawSetShadow(TDRegistracija_TD[p][0], 0);

        TDRegistracija_TD[p][1] = TextDrawCreate(473.999908, 36.583374, "sancarson.lt");
        TextDrawLetterSize(TDRegistracija_TD[p][1], 0.478117, 2.545002);
        TextDrawAlignment(TDRegistracija_TD[p][1], 1);
        TextDrawColor(TDRegistracija_TD[p][1], -1);
        TextDrawSetShadow(TDRegistracija_TD[p][1], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][1], 1);
        TextDrawBackgroundColor(TDRegistracija_TD[p][1], 255);
        TextDrawFont(TDRegistracija_TD[p][1], 2);
        TextDrawSetProportional(TDRegistracija_TD[p][1], 1);
        TextDrawSetShadow(TDRegistracija_TD[p][1], 0);

        TDRegistracija_TD[p][2] = TextDrawCreate(433.058624, 0.416652, "box");
        TextDrawLetterSize(TDRegistracija_TD[p][2], 0.000000, 51.552936);
        TextDrawTextSize(TDRegistracija_TD[p][2], 433.000000, 0.000000);
        TextDrawAlignment(TDRegistracija_TD[p][2], 1);
        TextDrawColor(TDRegistracija_TD[p][2], -1);
        TextDrawUseBox(TDRegistracija_TD[p][2], 1);
        TextDrawBoxColor(TDRegistracija_TD[p][2], 255);
        TextDrawSetShadow(TDRegistracija_TD[p][2], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][2], 0);
        TextDrawBackgroundColor(TDRegistracija_TD[p][2], 255);
        TextDrawFont(TDRegistracija_TD[p][2], 1);
        TextDrawSetProportional(TDRegistracija_TD[p][2], 1);
        TextDrawSetShadow(TDRegistracija_TD[p][2], 0);

        TDRegistracija_TD[p][3] = TextDrawCreate(445.235168, 85.583320, "LD_SPAC:white");
        TextDrawLetterSize(TDRegistracija_TD[p][3], 0.000000, 0.000000);
        TextDrawTextSize(TDRegistracija_TD[p][3], 184.000000, 56.000000);
        TextDrawAlignment(TDRegistracija_TD[p][3], 1);
        TextDrawColor(TDRegistracija_TD[p][3], 673720575);
        TextDrawSetShadow(TDRegistracija_TD[p][3], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][3], 0);
        TextDrawBackgroundColor(TDRegistracija_TD[p][3], 255);
        TextDrawFont(TDRegistracija_TD[p][3], 4);
        TextDrawSetProportional(TDRegistracija_TD[p][3], 0);
        TextDrawSetShadow(TDRegistracija_TD[p][3], 0);
        TextDrawSetSelectable(TDRegistracija_TD[p][3], 1);

        TDRegistracija_TD[p][4] = TextDrawCreate(445.235198, 165.499984, "LD_SPAC:white");
        TextDrawLetterSize(TDRegistracija_TD[p][4], 0.000000, 0.000000);
        TextDrawTextSize(TDRegistracija_TD[p][4], 184.000000, 56.000000);
        TextDrawAlignment(TDRegistracija_TD[p][4], 1);
        TextDrawColor(TDRegistracija_TD[p][4], 673720575);
        TextDrawSetShadow(TDRegistracija_TD[p][4], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][4], 0);
        TextDrawBackgroundColor(TDRegistracija_TD[p][4], 255);
        TextDrawFont(TDRegistracija_TD[p][4], 4);
        TextDrawSetProportional(TDRegistracija_TD[p][4], 0);
        TextDrawSetShadow(TDRegistracija_TD[p][4], 0);
        TextDrawSetSelectable(TDRegistracija_TD[p][4], 1);

        TDRegistracija_TD[p][5] = TextDrawCreate(445.705810, 242.500030, "LD_SPAC:white");
        TextDrawLetterSize(TDRegistracija_TD[p][5], 0.000000, 0.000000);
        TextDrawTextSize(TDRegistracija_TD[p][5], 184.000000, 56.000000);
        TextDrawAlignment(TDRegistracija_TD[p][5], 1);
        TextDrawColor(TDRegistracija_TD[p][5], 673720575);
        TextDrawSetShadow(TDRegistracija_TD[p][5], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][5], 0);
        TextDrawBackgroundColor(TDRegistracija_TD[p][5], 255);
        TextDrawFont(TDRegistracija_TD[p][5], 4);
        TextDrawSetProportional(TDRegistracija_TD[p][5], 0);
        TextDrawSetShadow(TDRegistracija_TD[p][5], 0);

        TDRegistracija_TD[p][6] = TextDrawCreate(445.705902, 324.166748, "LD_SPAC:white");
        TextDrawLetterSize(TDRegistracija_TD[p][6], 0.000000, 0.000000);
        TextDrawTextSize(TDRegistracija_TD[p][6], 184.000000, 56.000000);
        TextDrawAlignment(TDRegistracija_TD[p][6], 1);
        TextDrawColor(TDRegistracija_TD[p][6], 673720575);
        TextDrawSetShadow(TDRegistracija_TD[p][6], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][6], 0);
        TextDrawBackgroundColor(TDRegistracija_TD[p][6], 255);
        TextDrawFont(TDRegistracija_TD[p][6], 4);
        TextDrawSetProportional(TDRegistracija_TD[p][6], 0);
        TextDrawSetShadow(TDRegistracija_TD[p][6], 0);

        TDRegistracija_TD[p][7] = TextDrawCreate(476.823547, 104.250015, "prisijungimas");
        TextDrawLetterSize(TDRegistracija_TD[p][7], 0.400000, 1.600000);
        TextDrawAlignment(TDRegistracija_TD[p][7], 1);
        TextDrawColor(TDRegistracija_TD[p][7], -1);
        TextDrawSetShadow(TDRegistracija_TD[p][7], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][7], 0);
        TextDrawBackgroundColor(TDRegistracija_TD[p][7], 255);
        TextDrawFont(TDRegistracija_TD[p][7], 2);
        TextDrawSetProportional(TDRegistracija_TD[p][7], 1);
        TextDrawSetShadow(TDRegistracija_TD[p][7], 0);
        //TextDrawSetSelectable(TDRegistracija_TD[p][7], 1);

        TDRegistracija_TD[p][8] = TextDrawCreate(479.647064, 185.916610, "registracija");
        TextDrawLetterSize(TDRegistracija_TD[p][8], 0.400000, 1.600000);
        TextDrawAlignment(TDRegistracija_TD[p][8], 1);
        TextDrawColor(TDRegistracija_TD[p][8], -1);
        TextDrawSetShadow(TDRegistracija_TD[p][8], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][8], 0);
        TextDrawBackgroundColor(TDRegistracija_TD[p][8], 255);
        TextDrawFont(TDRegistracija_TD[p][8], 2);
        TextDrawSetProportional(TDRegistracija_TD[p][8], 1);
        TextDrawSetShadow(TDRegistracija_TD[p][8], 0);
        //TextDrawSetSelectable(TDRegistracija_TD[p][8], 1);

        TDRegistracija_TD[p][9] = TextDrawCreate(479.647094, 262.916656, "informacija");
        TextDrawLetterSize(TDRegistracija_TD[p][9], 0.400000, 1.600000);
        TextDrawAlignment(TDRegistracija_TD[p][9], 1);
        TextDrawColor(TDRegistracija_TD[p][9], -1);
        TextDrawSetShadow(TDRegistracija_TD[p][9], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][9], 0);
        TextDrawBackgroundColor(TDRegistracija_TD[p][9], 255);
        TextDrawFont(TDRegistracija_TD[p][9], 2);
        TextDrawSetProportional(TDRegistracija_TD[p][9], 1);
        TextDrawSetShadow(TDRegistracija_TD[p][9], 0);

        TDRegistracija_TD[p][10] = TextDrawCreate(478.705932, 344.583282, "atnaujinimai");
        TextDrawLetterSize(TDRegistracija_TD[p][10], 0.400000, 1.600000);
        TextDrawAlignment(TDRegistracija_TD[p][10], 1);
        TextDrawColor(TDRegistracija_TD[p][10], -1);
        TextDrawSetShadow(TDRegistracija_TD[p][10], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][10], 0);
        TextDrawBackgroundColor(TDRegistracija_TD[p][10], 255);
        TextDrawFont(TDRegistracija_TD[p][10], 2);
        TextDrawSetProportional(TDRegistracija_TD[p][10], 1);
        TextDrawSetShadow(TDRegistracija_TD[p][10], 0);
        
        TDRegistracija_TD[p][11] = TextDrawCreate(450.941650, 401.750030, "Visos_teises_saugomos_sancarson.lt");
        TextDrawLetterSize(TDRegistracija_TD[p][11], 0.226353, 1.086665);
        TextDrawAlignment(TDRegistracija_TD[p][11], 1);
        TextDrawColor(TDRegistracija_TD[p][11], -1);
        TextDrawSetShadow(TDRegistracija_TD[p][11], 0);
        TextDrawSetOutline(TDRegistracija_TD[p][11], 0);
        TextDrawBackgroundColor(TDRegistracija_TD[p][11], 255);
        TextDrawFont(TDRegistracija_TD[p][11], 2);
        TextDrawSetProportional(TDRegistracija_TD[p][11], 1);
        TextDrawSetShadow(TDRegistracija_TD[p][11], 0);*/

        /*TDELentele_info[p][0] = TextDrawCreate(145.619033, 100.874061, "box");
        TextDrawLetterSize(TDELentele_info[p][0], 0.000000, 23.752370);
        TextDrawTextSize(TDELentele_info[p][0], 514.000000, 0.000000);
        TextDrawAlignment(TDELentele_info[p][0], 1);
        TextDrawColor(TDELentele_info[p][0], -1);
        TextDrawUseBox(TDELentele_info[p][0], 1);
        TextDrawBoxColor(TDELentele_info[p][0], 454629862);
        TextDrawSetShadow(TDELentele_info[p][0], 0);
        TextDrawSetOutline(TDELentele_info[p][0], 0);
        TextDrawBackgroundColor(TDELentele_info[p][0], 255);
        TextDrawFont(TDELentele_info[p][0], 1);
        TextDrawSetProportional(TDELentele_info[p][0], 1);
        TextDrawSetShadow(TDELentele_info[p][0], 0);

        TDELentele_info[p][1] = TextDrawCreate(329.694885, 107.036994, "Dzjamp_Stailas");
        TextDrawLetterSize(TDELentele_info[p][1], 0.200000, 1.200000);
        TextDrawAlignment(TDELentele_info[p][1], 2);
        TextDrawColor(TDELentele_info[p][1], 1386278655);
        TextDrawSetShadow(TDELentele_info[p][1], 1);
        TextDrawSetOutline(TDELentele_info[p][1], 0);
        TextDrawBackgroundColor(TDELentele_info[p][1], 255);
        TextDrawFont(TDELentele_info[p][1], 2);
        TextDrawSetProportional(TDELentele_info[p][1], 1);
        TextDrawSetShadow(TDELentele_info[p][1], 1);

        TDELentele_info[p][2] = TextDrawCreate(106.904853, 121.340690, "");
        TextDrawLetterSize(TDELentele_info[p][2], 0.000000, 0.000000);
        TextDrawTextSize(TDELentele_info[p][2], 187.000000, 177.000000);
        TextDrawAlignment(TDELentele_info[p][2], 1);
        TextDrawColor(TDELentele_info[p][2], -1);
        TextDrawSetShadow(TDELentele_info[p][2], 0);
        TextDrawSetOutline(TDELentele_info[p][2], 0);
        TextDrawBackgroundColor(TDELentele_info[p][2], 0);
        TextDrawFont(TDELentele_info[p][2], 5);
        TextDrawSetProportional(TDELentele_info[p][2], 0);
        TextDrawSetShadow(TDELentele_info[p][2], 0);
        TextDrawSetPreviewModel(TDELentele_info[p][2], 305);
        TextDrawSetPreviewRot(TDELentele_info[p][2], -12.000000, 0.000000, 12.000000, 1.000000);

        TDELentele_info[p][3] = TextDrawCreate(255.333343, 150.466369, "lytis~n~patirtis~n~Darbas___________~n~pinigai_rankoje~n~pinigai_banke~n~alga");
        TextDrawLetterSize(TDELentele_info[p][3], 0.150000, 0.980000);
        TextDrawAlignment(TDELentele_info[p][3], 1);
        TextDrawColor(TDELentele_info[p][3], -1);
        TextDrawSetShadow(TDELentele_info[p][3], 0);
        TextDrawSetOutline(TDELentele_info[p][3], 0);
        TextDrawBackgroundColor(TDELentele_info[p][3], 255);
        TextDrawFont(TDELentele_info[p][3], 2);
        TextDrawSetProportional(TDELentele_info[p][3], 1);
        TextDrawSetShadow(TDELentele_info[p][3], 0);

        TDELentele_info[p][4] = TextDrawCreate(274.309356, 150.478469, "vyras~n~______150.000xp~n~________100_________________100~n~___________________250.000eur~n~_______________140eur~n~150.000.000eur");
        TextDrawLetterSize(TDELentele_info[p][4], 0.150000, 0.980000);
        TextDrawAlignment(TDELentele_info[p][4], 1);
        TextDrawColor(TDELentele_info[p][4], 1386278655);
        TextDrawSetShadow(TDELentele_info[p][4], 0);
        TextDrawSetOutline(TDELentele_info[p][4], 0);
        TextDrawBackgroundColor(TDELentele_info[p][4], 255);
        TextDrawFont(TDELentele_info[p][4], 2);
        TextDrawSetProportional(TDELentele_info[p][4], 1);
        TextDrawSetShadow(TDELentele_info[p][4], 0);

        TDELentele_info[p][5] = TextDrawCreate(255.333343, 240.471862, "VIP_naryste~n~admin_naryste~n~direktorius~n~pavaduotojas~n~~n~~n~Admin_isp______________________Vip_isp____________________siandien_prazaide");
        TextDrawLetterSize(TDELentele_info[p][5], 0.150000, 0.980000);
        TextDrawAlignment(TDELentele_info[p][5], 1);
        TextDrawColor(TDELentele_info[p][5], -1);
        TextDrawSetShadow(TDELentele_info[p][5], 0);
        TextDrawSetOutline(TDELentele_info[p][5], 0);
        TextDrawBackgroundColor(TDELentele_info[p][5], 255);
        TextDrawFont(TDELentele_info[p][5], 2);
        TextDrawSetProportional(TDELentele_info[p][5], 1);
        TextDrawSetShadow(TDELentele_info[p][5], 0);

        TDELentele_info[p][6] = TextDrawCreate(340.666687, 219.392654, "privilegijos");
        TextDrawLetterSize(TDELentele_info[p][6], 0.200000, 1.200000);
        TextDrawAlignment(TDELentele_info[p][6], 1);
        TextDrawColor(TDELentele_info[p][6], 1386278655);
        TextDrawSetShadow(TDELentele_info[p][6], 1);
        TextDrawSetOutline(TDELentele_info[p][6], 0);
        TextDrawBackgroundColor(TDELentele_info[p][6], 255);
        TextDrawFont(TDELentele_info[p][6], 2);
        TextDrawSetProportional(TDELentele_info[p][6], 1);
        TextDrawSetShadow(TDELentele_info[p][6], 1);

        TDELentele_info[p][7] = TextDrawCreate(296.171508, 240.425964, "turi_(galioja_iki_2017-12-29)~n~_____savininkas(galiojimo_neturi)~n~medicinios_dapartemento~n~______neturi~n~~n~~n~_____2017-07-07____________________________________23min__________________________________9000min");
        TextDrawLetterSize(TDELentele_info[p][7], 0.150000, 0.980000);
        TextDrawAlignment(TDELentele_info[p][7], 1);
        TextDrawColor(TDELentele_info[p][7], 1386278655);
        TextDrawSetShadow(TDELentele_info[p][7], 0);
        TextDrawSetOutline(TDELentele_info[p][7], 0);
        TextDrawBackgroundColor(TDELentele_info[p][7], 255);
        TextDrawFont(TDELentele_info[p][7], 2);
        TextDrawSetProportional(TDELentele_info[p][7], 1);
        TextDrawSetShadow(TDELentele_info[p][7], 0);

        TDELentele_info[p][8] = TextDrawCreate(379.298736, 150.677749, "gaudomumo_lygis~n~darbo_isp~n~reputacijos_taskai~n~priimta_iskvietimu~n~kontraktas.~n~mute");
        TextDrawLetterSize(TDELentele_info[p][8], 0.150000, 0.980000);
        TextDrawAlignment(TDELentele_info[p][8], 1);
        TextDrawColor(TDELentele_info[p][8], -1);
        TextDrawSetShadow(TDELentele_info[p][8], 0);
        TextDrawSetOutline(TDELentele_info[p][8], 0);
        TextDrawBackgroundColor(TDELentele_info[p][8], 255);
        TextDrawFont(TDELentele_info[p][8], 2);
        TextDrawSetProportional(TDELentele_info[p][8], 1);
        TextDrawSetShadow(TDELentele_info[p][8], 0);

        TDELentele_info[p][9] = TextDrawCreate(402.000061, 150.784652, "____________________negaudomas~n~a,b,c~n~_________________________1587~n~____________________dar_nelaimejas~n~_______turi~n~__siuo_metu_zaidzia");
        TextDrawLetterSize(TDELentele_info[p][9], 0.150000, 0.980000);
        TextDrawAlignment(TDELentele_info[p][9], 1);
        TextDrawColor(TDELentele_info[p][9], 1386278655);
        TextDrawSetShadow(TDELentele_info[p][9], 0);
        TextDrawSetOutline(TDELentele_info[p][9], 0);
        TextDrawBackgroundColor(TDELentele_info[p][9], 255);
        TextDrawFont(TDELentele_info[p][9], 2);
        TextDrawSetProportional(TDELentele_info[p][9], 1);
        TextDrawSetShadow(TDELentele_info[p][9], 0);*/
        
       
        
	}
}
