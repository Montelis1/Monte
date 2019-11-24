/*
- Padaryta kad jeigu 0% nusidevi apranga uþdëtø neðvaru skin
- Padaryta kad su 0% neitu persirengti aprangos turëtum eiti ásikalbti á serverio skalbykla
- Padaryta kad nuo pickup skalbykloje eitu á random checkpoint mini-map iðsiskalbti
*/

#include YSI\y_hooks

#define DIALOG_SKALBYKLA 12486

new skalbP = -1; //Skalbyklos pickup'as

new sLoad[MAX_PLAYERS]; //Skalbyklos pasirinkimas

new clickskal[MAX_PLAYERS]; //Jau skalbia drabuþius

new milteliai[MAX_PLAYERS];

hook OnGameModeInit()
{
	new skActor;
	new Float: aPos[3];
	skActor = CreateActor(9,-1658.8197,1131.7203,-63.8238,260.1304);
	SetActorInvulnerable(skActor, true);
	GetActorPos(skActor, aPos[0], aPos[1], aPos[2]);
	skalbP = CreateDynamicPickup(1274, 1, -1656.0417,1131.4551,-63.8238);
	//Skalbyklos exterjeras by Tex_Tas
    new tmpobjid;
    tmpobjid = CreateDynamicObject(19455, -1616.512939, 1099.496215, 8.770184, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 18996, "mattextures", "lime", 0x00000000);
    tmpobjid = CreateDynamicObject(9131, -1616.772216, 1094.360107, 7.239065, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 7985, "vgsswarehse02c", "muddywater", 0xFF00FFFF);
    tmpobjid = CreateDynamicObject(9131, -1616.772216, 1094.360107, 9.379066, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 7985, "vgsswarehse02c", "muddywater", 0xFF00FFFF);
    tmpobjid = CreateDynamicObject(19455, -1616.512939, 1099.496215, 5.280174, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 18996, "mattextures", "lime", 0x00000000);
    tmpobjid = CreateDynamicObject(9131, -1616.772216, 1110.055297, 7.239065, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 7985, "vgsswarehse02c", "muddywater", 0xFF00FFFF);
    tmpobjid = CreateDynamicObject(9131, -1616.772216, 1110.055297, 9.379066, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 7985, "vgsswarehse02c", "muddywater", 0xFF00FFFF);
    tmpobjid = CreateDynamicObject(19455, -1616.512939, 1105.566406, 8.770184, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 18996, "mattextures", "lime", 0x00000000);
    tmpobjid = CreateDynamicObject(19455, -1616.512939, 1105.566406, 5.300173, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 18996, "mattextures", "lime", 0x00000000);
    tmpobjid = CreateDynamicObject(18766, -1618.877075, 1098.983276, 10.909068, 90.000000, 180.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 7985, "vgsswarehse02c", "muddywater", 0x00000000);
    tmpobjid = CreateDynamicObject(18766, -1618.877075, 1105.475585, 10.909068, 90.000000, 180.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 7985, "vgsswarehse02c", "muddywater", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, -1617.191528, 1100.532958, 6.889073, 0.000007, 0.000000, 89.999977, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 7985, "vgsswarehse02c", "muddywater", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, -1617.191528, 1103.854980, 6.889070, 0.000007, 0.000000, 89.999977, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 7985, "vgsswarehse02c", "muddywater", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, -1617.191528, 1102.194335, 8.709066, 0.000000, -89.999984, 90.000007, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 7985, "vgsswarehse02c", "muddywater", 0x00000000);
    tmpobjid = CreateDynamicObject(19426, -1617.191528, 1102.183959, 6.889073, 0.000007, 0.000000, 89.999977, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 7985, "vgsswarehse02c", "muddywater", 0x00000000);
    tmpobjid = CreateDynamicObject(19353, -1616.503540, 1097.564208, 7.579056, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 6390, "sancliff_law2", "pharmacy1_1256", 0x00000000);
    tmpobjid = CreateDynamicObject(19353, -1616.503540, 1106.917846, 7.579056, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 6390, "sancliff_law2", "pharmacy1_1256", 0x00000000);
    tmpobjid = CreateDynamicObject(19353, -1614.673461, 1095.792968, 6.099049, 0.000000, 90.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14815, "whore_main", "WH_tiles2", 0x00000000);
    tmpobjid = CreateDynamicObject(19353, -1614.673461, 1098.964477, 6.099049, 0.000000, 90.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14815, "whore_main", "WH_tiles2", 0x00000000);
    tmpobjid = CreateDynamicObject(19353, -1614.673461, 1102.156250, 6.099049, 0.000000, 90.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14815, "whore_main", "WH_tiles2", 0x00000000);
    tmpobjid = CreateDynamicObject(19353, -1614.673461, 1105.367309, 6.099049, 0.000000, 90.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14815, "whore_main", "WH_tiles2", 0x00000000);
    tmpobjid = CreateDynamicObject(19353, -1614.673461, 1108.579589, 6.099049, 0.000000, 90.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14815, "whore_main", "WH_tiles2", 0x00000000);
    tmpobjid = CreateDynamicObject(19477, -1616.416992, 1102.046997, 9.589073, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 10101, "2notherbuildsfe", "Bow_church_grass_alt", 0x00000000);
    SetDynamicObjectMaterialText(    tmpobjid, 0, "{FFFFFF} Skalbykla", 90, "Ariel", 60, 1, 0x00000000, 0x00000000, 1);
    tmpobjid = CreateDynamicObject(737, -1612.292846, 1094.849121, 6.239065, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14383, "burg_1", "carpet4kb", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 1, 17958, "burnsalpha", "plantb256", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 2, 18028, "cj_bar2", "GB_nastybar08", 0xFF663300);
    tmpobjid = CreateDynamicObject(737, -1612.292846, 1109.548461, 6.239065, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14383, "burg_1", "carpet4kb", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 1, 17958, "burnsalpha", "plantb256", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 2, 18028, "cj_bar2", "GB_nastybar08", 0xFF663300);
    tmpobjid = CreateDynamicObject(1280, -1616.110961, 1097.575073, 6.537507, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "metpat64", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1280, -1616.110961, 1106.957641, 6.537507, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "metpat64", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(970, -1612.905517, 1097.833374, 6.709067, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 18996, "mattextures", "lime", 0x00000000);
    tmpobjid = CreateDynamicObject(970, -1612.905517, 1106.545410, 6.709067, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 18996, "mattextures", "lime", 0x00000000);
    tmpobjid = CreateDynamicObject(737, -1612.281982, 1102.217407, 6.239065, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14383, "burg_1", "carpet4kb", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 1, 17958, "burnsalpha", "plantb256", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 2, 18028, "cj_bar2", "GB_nastybar08", 0xFF663300);
    tmpobjid = CreateDynamicObject(949, -1616.048828, 1099.756713, 6.797503, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnutLite", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 3, 4830, "airport2", "bevflower2", 0x00000000);
    tmpobjid = CreateDynamicObject(949, -1616.048828, 1104.658325, 6.797503, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnutLite", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 3, 4830, "airport2", "bevflower2", 0x00000000);
    tmpobjid = CreateDynamicObject(949, -1616.048828, 1109.098388, 6.797503, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnutLite", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 3, 4830, "airport2", "bevflower2", 0x00000000);
    tmpobjid = CreateDynamicObject(949, -1616.048828, 1095.438354, 6.797503, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "ab_walnutLite", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 3, 4830, "airport2", "bevflower2", 0x00000000);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    tmpobjid = CreateDynamicObject(1522, -1616.464965, 1102.253295, 6.129060, 0.000007, 0.000000, 89.999977, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1522, -1616.474975, 1102.133178, 6.129060, -0.000007, -0.000000, -89.999977, -1, -1, -1, 300.00, 300.00);
    //Skalbyklos interjeras by Tex_Tas
    tmpobjid = CreateDynamicObject(18981, -1653.546142, 1130.392456, -65.323783, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14534, "ab_wooziea", "dt_office_roof", 0x00000000);
    tmpobjid = CreateDynamicObject(19455, -1642.020019, 1132.388793, -63.283779, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1642.020019, 1122.787597, -63.283779, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1642.020019, 1141.990356, -63.283779, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1646.859741, 1120.617187, -63.283779, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1656.479614, 1120.617187, -63.283779, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1646.859741, 1142.184936, -63.283779, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1656.470947, 1142.184936, -63.283779, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1660.121337, 1124.598510, -63.283779, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1660.121337, 1134.219238, -63.283779, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1660.121337, 1143.801391, -63.283779, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(1368, -1658.781250, 1142.032836, -62.673789, 270.000000, 360.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1656.240478, 1142.032836, -62.673789, 270.000000, 360.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(19455, -1643.989379, 1126.548217, -63.283779, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1658.121215, 1126.548217, -63.283779, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1658.114013, 1136.248779, -63.283779, -0.000022, -0.000007, -89.999938, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(19455, -1643.982177, 1136.248779, -63.283779, -0.000022, -0.000007, -89.999938, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "carparkwall12_256", 0xFF66FF99);
    tmpobjid = CreateDynamicObject(1256, -1657.437988, 1122.996948, -64.193786, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14668, "711c", "CJ_7_11_win", 0x00000000);
    tmpobjid = CreateDynamicObject(1256, -1657.458007, 1123.797607, -64.193786, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14668, "711c", "CJ_7_11_win", 0x00000000);
    tmpobjid = CreateDynamicObject(1256, -1644.667114, 1123.797607, -64.193786, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14668, "711c", "CJ_7_11_win", 0x00000000);
    tmpobjid = CreateDynamicObject(1256, -1644.647949, 1122.996948, -64.193786, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14668, "711c", "CJ_7_11_win", 0x00000000);
    tmpobjid = CreateDynamicObject(1256, -1657.450195, 1139.813232, -64.183723, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14668, "711c", "CJ_7_11_win", 0x00000000);
    tmpobjid = CreateDynamicObject(1256, -1657.430175, 1139.012451, -64.183723, 0.000000, 0.000000, 450.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14668, "711c", "CJ_7_11_win", 0x00000000);
    tmpobjid = CreateDynamicObject(1256, -1644.650146, 1139.012451, -64.183723, 0.000000, 0.000000, 450.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14668, "711c", "CJ_7_11_win", 0x00000000);
    tmpobjid = CreateDynamicObject(1256, -1644.670043, 1139.813232, -64.183723, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14668, "711c", "CJ_7_11_win", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1643.348388, 1120.712402, -62.673789, 270.000000, 360.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1645.879028, 1120.712402, -62.673789, 270.000000, 360.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1648.399902, 1120.712402, -62.673789, 270.000000, 360.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1650.930053, 1120.712402, -62.673789, 270.000000, 360.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1653.451171, 1120.712402, -62.673789, 270.000000, 360.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1655.991088, 1120.712402, -62.673789, 270.000000, 360.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1658.531616, 1120.712402, -62.673789, 270.000000, 360.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1661.051635, 1120.712402, -62.673789, 270.000000, 360.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1653.730590, 1142.032836, -62.673789, 270.000000, 360.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1651.190307, 1142.032836, -62.673789, 270.000000, 360.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1648.680053, 1142.032836, -62.673789, 270.000000, 360.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1646.169921, 1142.032836, -62.673789, 270.000000, 360.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1643.649291, 1142.032836, -62.673789, 270.000000, 360.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(1368, -1641.148559, 1142.032836, -62.673789, 270.000000, 360.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    tmpobjid = CreateDynamicObject(18981, -1653.546142, 1130.392456, -61.183807, 0.000000, 90.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 0, 16640, "a51", "stormdrain7", 0x00000000);
    tmpobjid = CreateDynamicObject(1572, -1649.675903, 1135.936523, -64.283782, 0.000000, 0.000000, 57.200000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(1572, -1643.140136, 1127.583251, -64.283760, 0.000000, 0.000000, 119.299964, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(1572, -1655.757324, 1138.070678, -64.283760, 0.000000, 0.000000, 119.299964, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 1, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
    tmpobjid = CreateDynamicObject(949, -1648.459838, 1125.979492, -64.203788, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
    tmpobjid = CreateDynamicObject(949, -1653.730346, 1125.979492, -64.203788, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
    tmpobjid = CreateDynamicObject(949, -1653.730346, 1136.689697, -64.203788, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
    tmpobjid = CreateDynamicObject(949, -1648.420410, 1136.689697, -64.203788, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    SetDynamicObjectMaterial(    tmpobjid, 1, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
    SetDynamicObjectMaterial(    tmpobjid, 2, 17958, "burnsalpha", "plantb256", 0x00000000);
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    tmpobjid = CreateDynamicObject(1208, -1642.463623, 1121.000854, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1642.463623, 1121.000854, -63.923793, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1643.124267, 1121.000854, -64.823783, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1644.445556, 1121.000854, -63.923793, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1643.784912, 1121.000854, -64.823783, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1643.784912, 1121.000854, -63.923793, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1644.445556, 1121.000854, -64.823783, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1643.124267, 1121.000854, -63.923793, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1645.116088, 1121.000854, -64.823783, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1645.116088, 1121.000854, -63.923793, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1645.776733, 1121.000854, -64.823783, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1645.776733, 1121.000854, -63.923793, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1646.445678, 1121.000854, -64.823783, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1646.445678, 1121.000854, -63.923793, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1647.106323, 1121.000854, -64.823783, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1648.427612, 1121.000854, -63.923793, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1647.766967, 1121.000854, -64.823783, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1647.766967, 1121.000854, -63.923793, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1648.427612, 1121.000854, -64.823783, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1647.106323, 1121.000854, -63.923793, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1649.098144, 1121.000854, -64.823783, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1649.098144, 1121.000854, -63.923793, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1649.758789, 1121.000854, -64.823783, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1649.758789, 1121.000854, -63.923793, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1650.434204, 1121.000854, -64.823783, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1650.434204, 1121.000854, -63.923793, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1651.094848, 1121.000854, -64.823783, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1652.416137, 1121.000854, -63.923793, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1651.755493, 1121.000854, -64.823783, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1651.755493, 1121.000854, -63.923793, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1652.416137, 1121.000854, -64.823783, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1651.094848, 1121.000854, -63.923793, 0.000000, 0.000015, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1653.086669, 1121.000854, -64.823783, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1653.086669, 1121.000854, -63.923793, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1653.747314, 1121.000854, -63.923793, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1654.416259, 1121.000854, -64.823783, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1654.416259, 1121.000854, -63.923793, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1655.076904, 1121.000854, -64.823783, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1656.398193, 1121.000854, -63.923793, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1655.737548, 1121.000854, -64.823783, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1655.737548, 1121.000854, -63.923793, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1656.398193, 1121.000854, -64.823783, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1655.076904, 1121.000854, -63.923793, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1657.068725, 1121.000854, -64.823783, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1657.068725, 1121.000854, -63.923793, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1657.729370, 1121.000854, -64.823783, 0.000000, 0.000045, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1657.729370, 1121.000854, -63.923793, 0.000000, 0.000045, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1653.747314, 1121.000854, -64.833786, 0.000000, 0.000030, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1658.399291, 1121.000854, -64.823783, 0.000000, 0.000045, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1658.399291, 1121.000854, -63.923793, 0.000000, 0.000045, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1659.059936, 1121.000854, -64.823783, 0.000000, 0.000053, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1659.059936, 1121.000854, -63.923793, 0.000000, 0.000053, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1659.709838, 1121.000854, -64.823783, 0.000000, 0.000053, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1659.709838, 1121.000854, -63.923793, 0.000000, 0.000053, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1642.621948, 1126.032348, -64.843780, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1644.582641, 1126.032348, -64.843780, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1646.542602, 1126.032348, -64.843780, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1654.642333, 1126.032348, -64.843780, 0.000000, -0.000007, 179.999954, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1656.603027, 1126.032348, -64.843780, 0.000000, -0.000007, 179.999954, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1658.562988, 1126.032348, -64.843780, 0.000000, -0.000007, 179.999954, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1659.639770, 1141.796142, -64.823783, 0.000007, -0.000022, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1659.639770, 1141.796142, -63.923793, 0.000007, -0.000022, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1658.979125, 1141.796142, -64.823783, 0.000007, -0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1657.657836, 1141.796142, -63.923793, 0.000007, -0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1658.318481, 1141.796142, -64.823783, 0.000007, -0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1658.318481, 1141.796142, -63.923793, 0.000007, -0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1657.657836, 1141.796142, -64.823783, 0.000007, -0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1658.979125, 1141.796142, -63.923793, 0.000007, -0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1656.987304, 1141.796142, -64.823783, 0.000007, -0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1656.987304, 1141.796142, -63.923793, 0.000007, -0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1656.326660, 1141.796142, -64.823783, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1656.326660, 1141.796142, -63.923793, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1655.657714, 1141.796142, -64.823783, 0.000007, -0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1655.657714, 1141.796142, -63.923793, 0.000007, -0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1654.997070, 1141.796142, -64.823783, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1653.675781, 1141.796142, -63.923793, 0.000007, 0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1654.336425, 1141.796142, -64.823783, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1654.336425, 1141.796142, -63.923793, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1653.675781, 1141.796142, -64.823783, 0.000007, 0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1654.997070, 1141.796142, -63.923793, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1653.005249, 1141.796142, -64.823783, 0.000007, 0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1653.005249, 1141.796142, -63.923793, 0.000007, 0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1652.344604, 1141.796142, -64.823783, 0.000007, 0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1652.344604, 1141.796142, -63.923793, 0.000007, 0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1651.669189, 1141.796142, -64.823783, 0.000007, -0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1651.669189, 1141.796142, -63.923793, 0.000007, -0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1651.008544, 1141.796142, -64.823783, 0.000007, -0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1649.687255, 1141.796142, -63.923793, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1650.347900, 1141.796142, -64.823783, 0.000007, -0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1650.347900, 1141.796142, -63.923793, 0.000007, -0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1649.687255, 1141.796142, -64.823783, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1651.008544, 1141.796142, -63.923793, 0.000007, -0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1649.016723, 1141.796142, -64.823783, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1649.016723, 1141.796142, -63.923793, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1648.356079, 1141.796142, -63.923793, 0.000007, 0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1647.687133, 1141.796142, -64.823783, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1647.687133, 1141.796142, -63.923793, 0.000007, 0.000000, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1647.026489, 1141.796142, -64.823783, 0.000007, 0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1645.705200, 1141.796142, -63.923793, 0.000007, 0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1646.365844, 1141.796142, -64.823783, 0.000007, 0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1646.365844, 1141.796142, -63.923793, 0.000007, 0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1645.705200, 1141.796142, -64.823783, 0.000007, 0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1647.026489, 1141.796142, -63.923793, 0.000007, 0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1645.034667, 1141.796142, -64.823783, 0.000007, 0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1645.034667, 1141.796142, -63.923793, 0.000007, 0.000015, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1644.374023, 1141.796142, -64.823783, 0.000007, 0.000022, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1644.374023, 1141.796142, -63.923793, 0.000007, 0.000022, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1648.356079, 1141.796142, -64.833786, 0.000007, 0.000007, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1643.704101, 1141.796142, -64.823783, 0.000007, 0.000022, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1643.704101, 1141.796142, -63.923793, 0.000007, 0.000022, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1643.043457, 1141.796142, -64.823783, 0.000007, 0.000030, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1643.043457, 1141.796142, -63.923793, 0.000007, 0.000030, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1642.393554, 1141.796142, -64.823783, 0.000007, 0.000030, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1642.393554, 1141.796142, -63.923793, 0.000007, 0.000030, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1208, -1641.732910, 1141.796142, -64.823783, 0.000007, 0.000038, 179.999740, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1659.481445, 1136.764648, -64.843780, -0.000007, 0.000022, 0.000007, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1657.520751, 1136.764648, -64.843780, -0.000007, 0.000022, 0.000007, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1655.560791, 1136.764648, -64.843780, -0.000007, 0.000022, 0.000007, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1647.481079, 1136.764648, -64.843780, -0.000007, 0.000015, -0.000038, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1645.520385, 1136.764648, -64.843780, -0.000007, 0.000015, -0.000038, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2180, -1643.560791, 1136.764648, -64.843780, -0.000007, 0.000015, -0.000038, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1522, -1642.108398, 1131.369506, -64.823783, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1522, -1642.128417, 1131.429199, -64.823783, 0.000000, 0.000000, 270.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2184, -1657.304443, 1130.392822, -64.823783, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1514, -1657.700561, 1130.642700, -63.813781, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2412, -1642.876708, 1130.136352, -64.823783, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2412, -1642.876708, 1133.356933, -64.823783, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1885, -1642.580200, 1133.703369, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1885, -1642.580200, 1133.703369, -64.343795, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1885, -1642.580200, 1133.703369, -63.853794, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1885, -1642.580200, 1129.161254, -64.823783, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1885, -1642.580200, 1129.161254, -64.343795, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1885, -1642.580200, 1129.161254, -63.853794, 0.000000, 0.000007, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1885, -1642.580200, 1128.600708, -64.823783, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1885, -1642.580200, 1128.600708, -64.343795, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1885, -1642.580200, 1128.600708, -63.853794, 0.000000, 0.000022, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1885, -1642.580200, 1134.230957, -64.823783, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1885, -1642.580200, 1134.230957, -64.343795, 0.000000, 0.000038, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2371, -1647.007934, 1135.572143, -64.853782, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2371, -1653.857543, 1127.102416, -64.853782, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2372, -1653.794921, 1136.090576, -64.823783, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2373, -1645.685913, 1126.440917, -64.863769, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2394, -1654.435302, 1135.891723, -64.133743, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2394, -1647.603759, 1135.891723, -64.133743, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2394, -1647.603759, 1135.251098, -64.133743, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2394, -1646.123779, 1126.850463, -64.263748, 0.000000, 0.000000, 180.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2846, -1655.197998, 1137.965087, -64.833786, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2846, -1648.519775, 1133.835571, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2846, -1651.363159, 1124.066894, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2846, -1644.580200, 1124.408813, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2844, -1645.931884, 1137.784057, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2844, -1649.792358, 1139.748291, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2844, -1654.812377, 1132.090942, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2844, -1646.789672, 1128.995117, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2845, -1654.647460, 1133.994506, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2845, -1653.568969, 1128.898925, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2845, -1648.277587, 1131.512817, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2845, -1658.799438, 1140.927612, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2845, -1643.544189, 1139.930664, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2845, -1657.765625, 1134.695922, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2845, -1657.588256, 1128.217285, -64.823783, 0.000000, 0.000000, 0.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(955, -1659.572875, 1128.049926, -64.463768, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(956, -1659.687500, 1129.255126, -64.453781, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2164, -1660.035156, 1134.862304, -64.823783, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(2164, -1660.035156, 1133.091918, -64.823783, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(1806, -1659.158569, 1131.163208, -64.823783, 0.000000, 0.000000, -65.000007, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(18075, -1646.902465, 1136.857910, -61.633831, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(18075, -1646.902465, 1125.703979, -61.633831, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(18075, -1659.565063, 1125.703979, -61.633831, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
    tmpobjid = CreateDynamicObject(18075, -1659.632568, 1136.857910, -61.633831, 0.000000, 0.000000, 90.000000, -1, -1, -1, 300.00, 300.00);
	return 1;
}

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{
	if(pickupid == skalbP)
	{
	   ShowPlayerDialogEx(playerid, DIALOG_SKALBYKLA, DIALOG_STYLE_LIST, "{669966}Skalbykla","{FFFFFF}Uþsisakyti skalbimà ({669966}50 Eur{FFFFFF})\n{FFFFFF}Pirkti miltelius ({669966}25 Eur{FFFFFF})","Pasirinkti","Atðaukti");
	}
	return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(dialogid == DIALOG_SKALBYKLA)
	{
		if(response)
		{
			 if(listitem == 0)
			 {
				//if(sLimit == 2) return ErorMSG(playerid, "Skalbykla uþimta, joje skalbtis galima tik dviems þaidëjams!");
				if(zInfo[playerid][sktime] != 0) return ErorMSG(playerid, "Jûsø drabuþiai ðvarûs nereikia skalbti!");
				if(sLoad[playerid] == 1 && sLoad[playerid] == 2) return ErorMSG(playerid, "Jûs jau uþsisakëte skalbimà!");
				if(milteliai[playerid] != 1) return ErorMSG(playerid, "Jûs nenusipirkote skalbimo milteliø!");
				new sCheck = random(2);
				switch(sCheck)
				{
				    case 0: sLoad[playerid] = 1, InfoMSG(playerid, "Uþsisakëte skalbimà, eikite á {f48942}raudonà {FFFFFF}taðkà ({f48942}mini-map{FFFFFF})"), InfoMSG(playerid, "Padëti drabuþius galite paspaude Y raide"), SetPlayerMapIcon(playerid, 85, -1651.0482,1141.0051,-63.8238, 0, 0xFF0000AA, MAPICON_LOCAL_CHECKPOINT);
				    case 1: sLoad[playerid] = 2, InfoMSG(playerid, "Uþsisakëte skalbimà, eikite á {f48942}raudonà {FFFFFF}taðkà ({f48942}mini-map{FFFFFF})"), InfoMSG(playerid, "Padëti drabuþius galite paspaude Y raide"), SetPlayerMapIcon(playerid, 85, -1651.1091,1121.9031,-63.8238, 0, 0xFF0000AA, MAPICON_LOCAL_CHECKPOINT);
				}
				//SetPlayerAttachedObject( playerid, 4, 2845, 1, 0.002953, 0.469660, -0.009797, 269.851104, 88.443557, 0.000000, 0.804894, 1.000000, 0.822361 );
				GivePlayerMoneyA(playerid, -50);
			 }
			 if(listitem == 1)
			 {
				if(SkalbPriemones < 1) return ErorMSG(playerid, "Neturime parduoti skalbimo milteliø!");
				if(milteliai[playerid] == 1) return ErorMSG(playerid, "Jûs jau turite miltelius!");
				InfoMSG(playerid, "Nusipirkote skalbimo miltelius");
				GivePlayerMoneyA(playerid, -25);
				milteliai[playerid] = 1;
			 }
		}
	}
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES)
	{
	   if(IsPlayerInRangeOfPoint(playerid, 5.0, -1651.0482,1141.0051,-63.8238))
	   {
	      if(sLoad[playerid] == 1)
	      {
			 if(clickskal[playerid] != 0) return ErorMSG(playerid, "Jau skalbiate drabuþius!");
	         SetTimerEx("sOne", 60000*1, false, "d", playerid);
	         cD_StartBar(playerid, "Skalbiame drabuzius", 1000*60);
	         RemovePlayerMapIcon(playerid, 85);
	         TogglePlayerControllable(playerid, false);
			 //RemovePlayerAttachedObject(playerid, 4);
	         clickskal[playerid] ++;
	         milteliai[playerid] = 0;
	      }
	   }
	   else if(IsPlayerInRangeOfPoint(playerid, 5.0, -1651.1091,1121.9031,-63.8238))
	   {
	      if(sLoad[playerid] == 2)
	      {
		     if(clickskal[playerid] != 0) return ErorMSG(playerid, "Jau skalbiate drabuþius!");
             SetTimerEx("sTwo", 60000*1, false, "d", playerid);
	         cD_StartBar(playerid, "Skalbiame drabuzius", 1000*60);
	         RemovePlayerMapIcon(playerid, 85);
	         TogglePlayerControllable(playerid, false);
	         //RemovePlayerAttachedObject(playerid, 4);
	         clickskal[playerid] ++;
	         milteliai[playerid] = 0;
	      }
	   }
	}
	return 1;
}

forward sOne(playerid);
public sOne(playerid)
{
	zInfo[playerid][sktime] += 100;
	SuccesMSG(playerid, "Drabuþiai iðkalbti.");
	TogglePlayerControllable(playerid, true);
	sLoad[playerid] = 0;
	clickskal[playerid] = 0;
	SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
	return 1;
}

forward sTwo(playerid);
public sTwo(playerid)
{
	zInfo[playerid][sktime] += 100;
	SuccesMSG(playerid, "Drabuþiai iðkalbti.");
	TogglePlayerControllable(playerid, true);
	sLoad[playerid] = 0;
	clickskal[playerid] = 0;
	SetPlayerSkin(playerid, zInfo[playerid][drabuziai]);
	return 1;
}

