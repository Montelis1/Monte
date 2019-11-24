/*
    Ðiame faile bus:

    - Ligoninës sistema
    - Mediko darbas

*/

#include YSI\y_hooks

//new walkHP[MAX_PLAYERS][2];

new rancherMed[3];

new bool:mAddItem[MAX_PLAYERS];

new medicBoot[MAX_VEHICLES];

new hpFloat[MAX_PLAYERS];

new med_pa = -1, med_is = -1;

hook OnGameModeInit()
{
    

	/*--------------------------------------------------------------------------
	LigoninÃ«s aktoriai
    --------------------------------------------------------------------------*/
    //CreateDynamicActor(93,2479.1382,-4574.8472,1001.0859,92.9726, 1, 100.0, 93, 2, -1, STREAMER_ACTOR_SD, -1, 0);
    //CreateDynamicActor(71,2476.5999,-4574.7134,1001.0859,266.3394, 1, 100.0, 71, 2, -1, STREAMER_ACTOR_SD, -1, 0);
    CreateDynamicActor(93,327.4609,-1506.1743,524.7797,179.6241, 1, 100.0, 93, 2, -1, STREAMER_ACTOR_SD, -1, 0); // FC
    CreateDynamicActor(93,333.6670,-1506.2336,524.7797,173.6858, 1, 100.0, 93, 2, -1, STREAMER_ACTOR_SD, -1, 0); // FC

    rancherMed[0] = AddVehicle(489, -324.4357, 1025.6847, 19.7105, 0.0000, 6, 3, 600, VT_JOB, JOB_MEDIC);
    rancherMed[1] = AddVehicle(489, -329.4807, 1034.2489, 19.7105, 0.0000, 6, 3, 600, VT_JOB, JOB_MEDIC);
    rancherMed[2] = AddVehicle(489, -329.2547, 1025.3073, 19.7105, 0.0000, 6, 3, 600, VT_JOB, JOB_MEDIC);

    AddVehicle(416, -336.6682, 1061.3376, 19.5749, 270.0000, 6, 3, 600, VT_JOB, JOB_MEDIC);
    AddVehicle(416, -336.6705, 1039.7684, 19.5749, 270.0000, 6, 3, 600, VT_JOB, JOB_MEDIC);
    AddVehicle(416, -336.6071, 1045.3320, 19.5749, 270.0000, 6, 3, 600, VT_JOB, JOB_MEDIC);
    AddVehicle(416, -336.4773, 1050.5975, 19.5749, 270.0000, 6, 3, 600, VT_JOB, JOB_MEDIC);
    AddVehicle(416, -336.6448, 1055.4764, 19.5749, 270.0000, 6, 3, 600, VT_JOB, JOB_MEDIC);

    med_pa = CreateDynamicPickup(2654, 1, -318.5539,1051.8473,19.7697);

    med_is = CreateDynamicPickup(2654, 1, -1224.3757,1838.2511,41.6193);

    Create3DTextLabel("{ff9966}Mediko pakuoèiø paëmimas\n{ffffff}Uþlipkite èia!", 0xAAAAFFFF, -318.5539,1051.8473,19.7697, 10, 0, 1);

    Create3DTextLabel("{ff9966}Vaistø sandëlis\n{ffffff}Uþlipkite èia!", 0xAAAAFFFF, -1224.3757,1838.2511,41.6193, 10, 0, 1);

   new tmpobjid;

   tmpobjid = CreateDynamicObject(19360, -303.337585, 1051.883544, 20.446247, 0.000000, 0.000000, 24.900024, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -302.675018, 1048.875244, 20.451332, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -303.053253, 1045.760620, 20.451332, 0.000000, 0.000000, -14.199996, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -308.775573, 1053.287719, 20.451168, 0.000000, 0.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -302.685028, 1048.875244, 23.911338, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -303.346649, 1051.879394, 23.906253, 0.000000, 0.000000, 24.900024, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -303.062957, 1045.763061, 23.901330, 0.000000, 0.000000, -14.199996, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -314.972595, 1052.529541, 20.451332, 0.000000, 0.000000, 118.499984, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -308.175628, 1044.256469, 20.411167, 0.000000, 0.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -313.045166, 1039.355712, 20.411167, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -313.045166, 1029.746093, 20.411167, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -316.475158, 1025.015258, 20.411167, 0.000000, 0.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -321.205230, 1029.915039, 20.411167, 0.000000, 0.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -321.205230, 1039.544921, 20.411167, 0.000000, 0.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -321.215240, 1043.543701, 20.411167, 0.000000, 0.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -317.690063, 1050.874389, 20.451332, 0.000000, 0.000000, 126.399932, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 8391, "ballys01", "vgncorpdoor1_512", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -319.861602, 1049.235961, 20.451332, 0.000000, 0.000000, 126.399932, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16639, "a51_labs", "a51_labwall1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -308.175628, 1044.276489, 23.921173, 0.000000, 0.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -311.744934, 1039.393676, 23.911165, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19517, "noncolored", "gen_white", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -311.744934, 1029.784301, 23.911165, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19517, "noncolored", "gen_white", 0x00000000);
   tmpobjid = CreateDynamicObject(19379, -316.486145, 1030.175781, 22.247722, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19379, -316.486145, 1040.534912, 22.247722, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19449, -313.024841, 1034.822753, 20.463760, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 8391, "ballys01", "vgncorpdoor1_512", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -316.475158, 1025.015258, 23.911155, 0.000000, 0.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -321.205230, 1029.915039, 23.911167, 0.000000, 0.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -321.205230, 1039.544921, 23.901182, 0.000000, 0.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -321.175323, 1043.543701, 23.901163, 0.000000, 0.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -308.795593, 1053.287719, 23.901178, 0.000007, 0.000000, 89.999977, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -314.992614, 1052.529541, 23.901342, 0.000006, -0.000003, 118.499961, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -317.692321, 1050.850219, 23.901342, 0.000006, -0.000003, 126.399909, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -319.875701, 1049.227905, 23.901342, 0.000006, -0.000003, 126.399909, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10056, "bigoldbuild_sfe", "vgnburgwal3_256", 0x00000000);

   tmpobjid = CreateObject(19378, -326.492187, 1026.608276, 18.662185, 0.000000, 90.000000, 0.000000, 300.000);
   SetObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateObject(19378, -326.492187, 1036.248291, 18.662185, 0.000000, 90.000000, 0.000000, 300.000);
   SetObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateObject(19378, -326.492187, 1045.867675, 18.662185, 0.000000, 90.000000, 0.000000, 300.000);
   SetObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateObject(19378, -326.492187, 1055.477905, 18.662185, 0.000000, 90.000000, 0.000000, 300.000);
   SetObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);

   tmpobjid = CreateObject(19378, -336.982086, 1051.307128, 18.662185, 0.000000, 90.000000, 0.000000, 300.000);
   SetObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateObject(19378, -336.972137, 1060.907592, 18.662185, 0.000000, 90.000000, 0.000000, 300.000);
   SetObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateObject(19378, -326.482086, 1060.907592, 18.652185, 0.000000, 90.000000, 0.000000, 300.000);
   SetObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateObject(19378, -336.982086, 1041.687744, 18.662185, 0.000000, 90.000000, 0.000000, 300.000);
   SetObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);

   tmpobjid = CreateDynamicObject(19448, -308.175628, 1045.916137, 22.241159, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -304.652832, 1046.164062, 22.251308, 0.000000, 90.000000, -14.199996, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -304.325073, 1048.875244, 22.251327, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -304.834136, 1051.189086, 22.246242, 0.000000, 90.000000, 24.900024, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -308.765563, 1051.627075, 22.251163, 0.000007, 90.000000, 89.999977, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -314.157562, 1051.116699, 22.241342, 0.000006, 90.000000, 118.499961, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -316.650970, 1049.555175, 22.241334, 0.000006, 89.999992, 126.399909, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -318.888519, 1047.905883, 22.241331, 0.000006, 89.999992, 126.399909, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -319.545379, 1043.543701, 22.241140, 0.000000, 90.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.682373, 1030.797119, 19.393753, 90.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.682373, 1030.797119, 21.313741, 90.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19430, -311.088592, 1031.780029, 22.260122, 0.000007, 90.000015, 89.999984, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
   tmpobjid = CreateDynamicObject(19430, -311.088592, 1035.199951, 22.260122, 0.000007, 90.000015, 89.999984, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
   tmpobjid = CreateDynamicObject(19430, -311.088592, 1038.680175, 22.260122, 0.000007, 90.000015, 89.999984, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
   tmpobjid = CreateDynamicObject(19430, -309.578735, 1031.780029, 22.260122, 0.000022, 90.000015, 89.999938, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
   tmpobjid = CreateDynamicObject(19430, -309.578735, 1035.199951, 22.260122, 0.000022, 90.000015, 89.999938, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
   tmpobjid = CreateDynamicObject(19430, -309.578735, 1038.680175, 22.260122, 0.000022, 90.000015, 89.999938, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.472290, 1031.017333, 19.663757, 90.000000, 90.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.472290, 1031.017333, 21.203752, 90.000000, 90.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.682250, 1031.217529, 21.203752, 90.000000, 90.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.682250, 1031.217529, 19.203756, 90.000000, 90.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.892425, 1031.007324, 19.203756, 90.000000, 90.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.892425, 1031.007324, 21.213768, 90.000000, 90.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.682373, 1039.187988, 19.393753, 89.999992, 270.000000, -90.000007, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.682373, 1039.187988, 21.213756, 89.999992, 270.000000, -90.000007, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.472290, 1039.408203, 19.663757, 89.999992, 0.000007, -90.000022, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.472290, 1039.408203, 21.203752, 89.999992, 0.000007, -90.000022, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.682250, 1039.608398, 21.203752, 89.999992, 90.000000, -89.999977, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.682250, 1039.608398, 19.203756, 89.999992, 90.000000, -89.999977, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.892425, 1039.398193, 19.203756, 89.999992, 180.000000, -89.999992, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -309.892425, 1039.398193, 21.213768, 89.999992, 180.000000, -89.999992, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19377, -313.233581, 1026.509765, 18.663745, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
   tmpobjid = CreateDynamicObject(19377, -313.213470, 1036.139892, 18.663745, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
   tmpobjid = CreateDynamicObject(19377, -314.343597, 1045.769897, 18.663745, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
   tmpobjid = CreateDynamicObject(19377, -305.773651, 1043.177612, 18.673746, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
   tmpobjid = CreateDynamicObject(19377, -305.773651, 1051.072021, 18.663745, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
   tmpobjid = CreateDynamicObject(19377, -315.983764, 1051.072021, 18.683746, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
   tmpobjid = CreateDynamicObject(19377, -320.823822, 1054.304199, 18.653745, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
   tmpobjid = CreateDynamicObject(19377, -315.993621, 1026.509765, 18.683746, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
   tmpobjid = CreateDynamicObject(19378, -295.322601, 1048.758300, 18.512182, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateDynamicObject(19378, -295.322601, 1039.130249, 18.512182, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateDynamicObject(19378, -295.322601, 1029.500122, 18.512182, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateDynamicObject(19378, -295.322601, 1019.870056, 18.512182, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateDynamicObject(19378, -295.322601, 1010.240112, 18.512182, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateDynamicObject(19378, -304.032775, 1010.240112, 18.522182, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateDynamicObject(19378, -304.032775, 1019.838745, 18.522182, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateDynamicObject(19378, -304.032775, 1029.458007, 18.522182, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateDynamicObject(19378, -304.032775, 1039.087646, 18.522182, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 9514, "711_sfw", "ws_carpark2", 0x00000000);
   tmpobjid = CreateDynamicObject(19482, -311.605926, 1032.883666, 24.228120, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterialText(   tmpobjid, 0, "FORT CARSON", 130, "Ariel", 50, 0, 0xFF3366CC, 0x00000000, 1);
   tmpobjid = CreateDynamicObject(19482, -311.605926, 1034.434204, 23.668113, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterialText(   tmpobjid, 0, "MEDICAL CENTRE", 130, "Ariel", 50, 0, 0xFF3366CC, 0x00000000, 1);
   tmpobjid = CreateDynamicObject(19482, -311.605926, 1035.474243, 24.218122, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterialText(   tmpobjid, 0, "h", 130, "Webdings", 90, 0, 0xFF3366CC, 0x00000000, 1);
   tmpobjid = CreateDynamicObject(19463, -290.445892, 1034.682373, 17.568111, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -290.445892, 1025.061279, 17.568111, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -290.445892, 1015.451232, 17.568111, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -290.465911, 1010.250610, 17.568111, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -295.365875, 1005.520141, 17.568111, 0.000000, 0.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -304.495788, 1005.530151, 17.568111, 0.000000, 0.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -309.255767, 1010.260131, 17.568111, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -309.225738, 1016.950500, 17.568111, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -313.965667, 1021.691345, 17.568111, 0.000000, 0.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -323.585540, 1021.691345, 17.568111, 0.000000, 0.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -327.005523, 1021.701354, 17.568111, 0.000000, 0.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -331.735595, 1026.601318, 17.568111, 0.000000, 0.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -331.735565, 1032.042602, 17.568111, 0.000000, 0.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -336.455413, 1036.821899, 17.568111, 0.000000, 0.000000, 450.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -341.195495, 1041.542602, 17.568111, 0.000000, 0.000000, 540.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -341.195495, 1051.142211, 17.568111, 0.000000, 0.000000, 540.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -341.195495, 1060.772338, 17.568111, 0.000000, 0.000000, 540.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -336.475616, 1065.592529, 17.568111, 0.000000, 0.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -326.945617, 1065.592529, 17.568111, 0.000000, 0.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -289.663055, 1037.727172, 19.215368, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -289.663055, 1034.227294, 19.215368, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -289.663055, 1030.737426, 19.215368, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -289.663055, 1027.237426, 19.215368, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -289.663055, 1023.736328, 19.215368, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -289.663055, 1020.256591, 19.215368, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -289.663055, 1016.756591, 19.215368, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -289.663055, 1013.256835, 19.215368, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -289.663055, 1009.776672, 19.215368, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -289.663055, 1006.276306, 19.215368, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -290.623138, 1004.646545, 19.205368, 0.000000, 90.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -294.102996, 1004.646545, 19.205368, 0.000000, 90.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -297.592773, 1004.646545, 19.205368, 0.000000, 90.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -301.092773, 1004.646545, 19.205368, 0.000000, 90.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -304.582641, 1004.646545, 19.205368, 0.000000, 90.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -308.052551, 1004.646545, 19.205368, 0.000000, 90.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -310.122436, 1005.576232, 19.215368, 0.000000, 90.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -310.122436, 1009.065979, 19.215368, 0.000000, 90.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -310.122436, 1012.566955, 19.215368, 0.000000, 90.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -310.122436, 1016.067138, 19.215368, 0.000000, 90.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -310.122436, 1019.547607, 19.215368, 0.000000, 90.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -311.032226, 1020.818420, 19.205368, 0.000000, 90.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -314.482238, 1020.818420, 19.205368, 0.000000, 90.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -317.942260, 1020.818420, 19.205368, 0.000000, 90.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -321.412353, 1020.818420, 19.205368, 0.000000, 90.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -324.912261, 1020.818420, 19.205368, 0.000000, 90.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -328.412414, 1020.818420, 19.205368, 0.000000, 90.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -331.642272, 1020.818420, 19.205368, 0.000000, 90.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -332.582427, 1023.348449, 19.205368, 0.000000, 90.000000, 450.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -332.582427, 1026.848144, 19.205368, 0.000000, 90.000000, 450.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -332.582427, 1030.337768, 19.205368, 0.000000, 90.000000, 450.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -332.582427, 1033.827514, 19.205368, 0.000000, 90.000000, 450.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -332.582427, 1035.057861, 19.215368, 0.000000, 90.000000, 450.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -335.072357, 1035.958618, 19.215368, 0.000000, 90.000000, 540.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -338.552246, 1035.958618, 19.215368, 0.000000, 90.000000, 540.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -341.112182, 1035.958618, 19.225368, 0.000000, 90.000000, 540.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -342.062194, 1038.499267, 19.225368, 0.000000, 90.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -342.062194, 1041.980102, 19.225368, 0.000000, 90.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -342.062194, 1045.470092, 19.225368, 0.000000, 90.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -342.062194, 1048.969848, 19.225368, 0.000000, 90.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -342.062194, 1052.469970, 19.225368, 0.000000, 90.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -342.062194, 1055.960083, 19.225368, 0.000000, 90.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -342.062194, 1059.460083, 19.225368, 0.000000, 90.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -342.062194, 1062.950317, 19.225368, 0.000000, 90.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -342.062194, 1065.491210, 19.225368, 0.000000, 90.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -339.602264, 1066.440795, 19.225368, 0.000000, 90.000000, 720.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -336.112457, 1066.440795, 19.225368, 0.000000, 90.000000, 720.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -332.622619, 1066.440795, 19.225368, 0.000000, 90.000000, 720.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -329.132781, 1066.440795, 19.225368, 0.000000, 90.000000, 720.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -325.652984, 1066.440795, 19.225368, 0.000000, 90.000000, 720.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -323.883148, 1066.440795, 19.215368, 0.000000, 90.000000, 720.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10765, "airportgnd_sfse", "desgreengrass", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -288.855834, 1034.682373, 17.568111, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -288.855834, 1025.082153, 17.568111, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -288.855834, 1015.452453, 17.568111, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -288.845825, 1008.552185, 17.568111, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -293.585662, 1003.821960, 17.568111, 0.000000, 0.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -303.175445, 1003.821960, 17.568111, 0.000000, 0.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -306.135498, 1003.811950, 17.568111, 0.000000, 0.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -310.895477, 1008.541931, 17.568111, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -310.905517, 1015.201904, 17.568111, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -315.635406, 1020.072448, 17.568111, 0.000000, 0.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -325.245330, 1020.072448, 17.568111, 0.000000, 0.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -328.595214, 1020.062438, 17.568111, 0.000000, 0.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -333.355224, 1024.782470, 17.568111, 0.000000, 0.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -333.375183, 1030.342651, 17.568111, 0.000000, 0.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -338.085174, 1035.142211, 17.568111, 0.000000, 0.000000, 450.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -342.825469, 1040.021606, 17.568111, 0.000000, 0.000000, 540.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -342.825469, 1049.661743, 17.568111, 0.000000, 0.000000, 540.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -342.825469, 1059.251831, 17.568111, 0.000000, 0.000000, 540.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -342.835479, 1062.432250, 17.568111, 0.000000, 0.000000, 540.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -338.105621, 1067.322875, 17.568111, 0.000000, 0.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -328.465728, 1067.322875, 17.568111, 0.000000, 0.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19463, -326.915679, 1067.332885, 17.568111, 0.000000, 0.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -322.213134, 1066.440795, 17.555355, 0.000000, 180.000000, 720.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19442, -289.663055, 1039.438232, 17.555345, 0.000000, 180.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 17545, "burnsground", "newall10_seamless", 0x00000000);
   tmpobjid = CreateDynamicObject(19377, -313.213470, 1016.940368, 18.523742, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
   tmpobjid = CreateDynamicObject(19377, -313.213470, 1010.320373, 18.533742, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 16640, "a51", "ws_stationfloor", 0x00000000);
   tmpobjid = CreateDynamicObject(19482, -303.729034, 1031.694702, 18.618118, 0.000000, 270.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterialText(   tmpobjid, 0, "PARKING", 130, "Ariel", 50, 0, 0xFFFFFFFF, 0x00000000, 1);
   tmpobjid = CreateDynamicObject(19482, -303.729034, 1020.894653, 18.618118, 0.000000, 270.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterialText(   tmpobjid, 0, "PARKING", 130, "Ariel", 50, 0, 0xFFFFFFFF, 0x00000000, 1);
   tmpobjid = CreateDynamicObject(19482, -303.729034, 1010.254699, 18.618118, 0.000000, 270.000000, 360.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterialText(   tmpobjid, 0, "PARKING", 130, "Ariel", 50, 0, 0xFFFFFFFF, 0x00000000, 1);
   tmpobjid = CreateDynamicObject(19940, -315.682403, 1055.276489, 19.393753, 89.999992, 270.000000, -90.000007, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -315.682403, 1055.276489, 21.313741, 89.999992, 270.000000, -90.000007, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -315.472320, 1055.496704, 19.663757, 89.999992, 0.000007, -90.000022, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -315.472320, 1055.496704, 21.203752, 89.999992, 0.000007, -90.000022, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -315.682281, 1055.696899, 21.203752, 89.999992, 90.000000, -89.999977, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -315.682281, 1055.696899, 19.203756, 89.999992, 90.000000, -89.999977, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -315.892456, 1055.486694, 19.203756, 89.999992, 180.000000, -89.999992, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -315.892456, 1055.486694, 21.213768, 89.999992, 180.000000, -89.999992, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -319.942413, 1055.276489, 19.393753, 89.999992, 270.000000, -89.999984, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -319.942413, 1055.276489, 21.313741, 89.999992, 270.000000, -89.999984, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -319.732330, 1055.496704, 19.663757, 89.999992, -0.000003, -89.999992, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -319.732330, 1055.496704, 21.203752, 89.999992, -0.000003, -89.999992, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -319.942291, 1055.696899, 21.203752, 89.999992, 90.000007, -89.999969, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -319.942291, 1055.696899, 19.203756, 89.999992, 90.000007, -89.999969, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -320.152465, 1055.486694, 19.203756, 89.999992, 180.000000, -89.999977, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19940, -320.152465, 1055.486694, 21.213768, 89.999992, 180.000000, -89.999977, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "sl_vicwall01", 0x00000000);
   tmpobjid = CreateDynamicObject(19367, -316.836517, 1054.136840, 22.232187, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19367, -316.836517, 1051.055175, 22.232187, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19367, -319.446563, 1049.664062, 22.232187, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19367, -319.446563, 1052.793090, 22.232187, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19367, -319.446563, 1054.134033, 22.242187, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 19004, "roundbuilding1", "stonewalltile4", 0x00000000);
   tmpobjid = CreateDynamicObject(19379, -316.446136, 1030.175781, 25.577737, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19379, -316.436126, 1040.206298, 25.587738, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -308.175628, 1045.956176, 25.591186, 0.000000, 90.000000, 90.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -304.385101, 1048.875244, 25.581363, 0.000000, 90.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -304.849334, 1051.127441, 25.576267, 0.000000, 90.000000, 24.900024, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -308.765563, 1051.587036, 25.581188, 0.000007, 90.000000, 89.999977, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -304.684173, 1046.245239, 25.581354, 0.000000, 90.000000, -14.199996, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -308.765563, 1048.206420, 25.581188, 0.000007, 90.000000, 89.999977, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -316.627258, 1049.522949, 25.571352, 0.000006, 89.999992, 126.399909, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -314.138519, 1051.081542, 25.581352, 0.000006, 90.000000, 118.499961, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -318.864807, 1047.873657, 25.581352, 0.000006, 89.999992, 126.399909, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19448, -316.425506, 1046.537475, 25.621189, 0.000007, 90.000000, 89.999977, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(19360, -313.666809, 1047.445800, 25.581352, 0.000006, 90.000000, 118.499961, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 10101, "2notherbuildsfe", "ws_rooftarmac1", 0x00000000);
   tmpobjid = CreateDynamicObject(1368, -310.460479, 1043.455444, 19.429693, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
   tmpobjid = CreateDynamicObject(1368, -305.290527, 1043.455444, 19.429693, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   SetDynamicObjectMaterial(   tmpobjid, 0, 14581, "ab_mafiasuitea", "cof_wood2", 0x00000000);
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   tmpobjid = CreateDynamicObject(1294, -308.242004, 1029.869995, 23.203100, 0.000000, 0.000000, -179.999984, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(966, -321.456787, 1058.677246, 18.602180, 0.000000, 0.000000, 630.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1294, -307.442047, 1010.419982, 23.043094, 0.000000, 0.000000, -179.999984, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1294, -307.442047, 1020.150024, 23.043094, 0.000000, 0.000000, -179.999984, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1294, -300.261901, 1041.150146, 23.203100, 0.000000, 0.000000, -179.999984, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1294, -300.261901, 1054.160400, 23.203100, 0.000000, 0.000000, -179.999984, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(886, -289.693542, 1036.992797, 19.008117, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(886, -289.693542, 1004.472473, 19.008117, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(886, -310.453399, 1004.472473, 19.008117, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(886, -310.373352, 1020.853088, 19.008117, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(886, -332.823364, 1020.853088, 19.008117, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(886, -332.823364, 1036.093627, 19.008117, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(886, -341.833435, 1036.093627, 19.008117, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(886, -341.833435, 1066.356323, 19.008117, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(886, -322.743377, 1066.356323, 19.008117, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(890, -332.378051, 1066.248168, 18.748123, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(890, -342.038116, 1050.738281, 19.228130, 0.000000, 0.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(890, -310.108184, 1012.597900, 19.228130, 0.000000, 0.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(890, -289.748291, 1018.297790, 19.228130, 0.000000, 0.000000, 450.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(886, -300.513488, 1004.472473, 19.008117, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(761, -289.321411, 1029.346435, 19.328125, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(761, -289.321411, 1011.585998, 19.328125, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(886, -320.873443, 1020.853088, 19.008117, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1214, -321.068023, 1056.054565, 18.592184, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1214, -321.068023, 1053.904663, 18.592184, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1214, -321.068023, 1051.794555, 18.592184, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1214, -321.068023, 1049.074462, 18.592184, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1214, -321.068023, 1057.884643, 18.592184, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   ArmijaGates = CreateObject(968, -321.468292, 1058.509521, 19.342193, 0.000000, 90.000000, 90.000000, 300.000);
   tmpobjid = CreateDynamicObject(1687, -308.752166, 1049.409301, 26.307125, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1687, -308.752166, 1047.699584, 26.307125, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1688, -316.326293, 1032.316894, 26.523681, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1688, -316.326293, 1034.477050, 26.523681, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1617, -311.678344, 1026.449951, 24.558116, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1257, -308.607391, 1055.629150, 19.929176, 0.000000, 0.000000, 270.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1372, -289.677032, 1039.910400, 18.651399, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1440, -288.936828, 1040.374023, 18.965961, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1300, -307.771850, 1043.531982, 19.099689, 0.000000, 0.000000, 0.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1294, -339.471679, 1057.372070, 23.258157, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1294, -339.121673, 1047.911621, 23.258157, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1294, -339.351837, 1037.999389, 23.258157, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);
   tmpobjid = CreateDynamicObject(1294, -329.981964, 1031.558471, 23.258157, 0.000000, 0.000000, 180.000000, -1, -1, -1, 650.00, 650.00);

	return 1;
}

hook OnPlayerConnect(playerid)
{
  RemoveBuildingForPlayer(playerid, 16564, -318.765, 1046.469, 18.734, 0.250);
  RemoveBuildingForPlayer(playerid, 16565, -318.765, 1046.469, 18.734, 0.250);
  RemoveBuildingForPlayer(playerid, 1294, -308.242, 1030.670, 23.203, 0.250);
  RemoveBuildingForPlayer(playerid, 1294, -308.242, 1013.460, 23.203, 0.250);
  return 1;
}

hook OnPlayerSpawn(playerid)
{
	hpFloat[playerid] = -1;
	return 1;
}

hook OnPlayerPickUpDynamicPickup(playerid, STREAMER_TAG_PICKUP pickupid)
{
    if(zInfo[playerid][specialybe] != JOB_MEDIC) return 0;

	if(pickupid == med_pa)
	{
	   if(!mAddItem[playerid])
       {
            if(drugsInHP == 0) return ErrorMsg(playerid, "Nëra pagamintø vaistø!");
            SetPlayerAttachedObject(playerid, 7, 2694, 1, 0.002953, 0.469660, -0.009797, 269.851104, 88.443557, 0.000000, 0.804894, 1.000000, 0.822361);
            SendClientMessage(playerid, YELLOW, "Pasiemei pakuote. Neðk jà padëti spaudinëdams Y raide á medikø transportà Rancher");
            mAddItem[playerid] = true;
       }	
	}

	if(pickupid == med_is)
	{
		if(mAddItem[playerid])
        {	 
            drugsInHP -= 1;	
            SendClientMessage(playerid, YELLOW, "Padëjai vaistø pakuote á sandelá");
            RemovePlayerAttachedObject(playerid, 7);
            SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
            AddVaistai(playerid, 6, 6, 6, 1);
            mAddItem[playerid] = false;
            SaveSandeliai();
        }
	}	
	return 1;
}

hook OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if(newkeys & KEY_YES)
    {	
        for(new i; i < sizeof rancherMed; i++)
        {
            if(zInfo[playerid][specialybe] != JOB_MEDIC) return 0;
        	new Float:mX, Float:mY, Float:mZ;
            GetVehiclePos(rancherMed[i], mX, mY, mZ);
            if(PlayerToPoint(2.0, playerid, mX, mY, mZ)) return hpFloat[playerid] = 1;
            
            if(mAddItem[playerid])	
            {
               if(hpFloat[playerid] == 1)
               {
        	      if(medicBoot[rancherMed[i]] < 10)
        	      {
        	         medicBoot[rancherMed[i]] ++;	
                     SendClientMessage(playerid, YELLOW, "Padëjai á bagaþine vaistø pakuote");
                     RemovePlayerAttachedObject(playerid, 7);
                     SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
                     mAddItem[playerid] = false;
                     hpFloat[playerid] = -1;
                  }    
                  else ErrorMsg(playerid, "Transporte telpa tik 10 pakuoèiø!");
               }   
            }
            else
            {
            	if(medicBoot[rancherMed[i]] < 1) return /*ErrorMsg(playerid, "Transporte nebëra pakuoèiø!")*/ 0;
                medicBoot[rancherMed[i]] --;	
                SendClientMessage(playerid, YELLOW, "Paëmei ið bagaþinës pakuote. Neðkite jà iðkrauti á vaistinës sandëlá");
                SetPlayerAttachedObject(playerid, 7, 2694, 1, 0.002953, 0.469660, -0.009797, 269.851104, 88.443557, 0.000000, 0.804894, 1.000000, 0.822361);
                mAddItem[playerid] = true;
            }	
        }    	

    }
    return 1;
}

hook OnPlayerDeath(playerid, killerid, reason)
{

  if (IsPlayerPlayingPaintball(playerid) != INVALID_PAINTBALL_TEAM)
  return 1;

  GameTextForPlayer(playerid,"Suzeistas",5000,2);
  SetSpawnInfo(playerid,GetPlayerTeam(playerid),GetPlayerSkin(playerid),342.9870,-1501.7476,524.7386, 180.9297,0,0,0,0,0,0); //Ligonine
  SetPlayerInterior(playerid, 2);
  KillTimer(GrobimasEx[playerid]);
  zInfo[playerid][Mires] = 1;
	return 1;
}

/*CMD:testhp(playerid, params[])
{
	new ze, on, tw, va;
	if(sscanf(params, "dddd", ze, on, tw, va)) return InfoMSG(playerid, "/testhp [Teraflu, Gripex, Antib, Tipas]");
	AddVaistai(playerid, ze, on, tw, va);
	
	return 1;
}

CMD:teststr(playerid, params[])
{
	new str[200];
	format(str, sizeof(str), "Teraflu %d vnt\nGripex %d\nAntibiotikai %d vnt\nHP  %d", drugsInStore[0], drugsInStore[1], drugsInStore[2], drugsInHP);
	ShowPlayerDialogEx(playerid, DIALOG_NONE, DIALOG_STYLE_MSGBOX, "Vaistai", str, "Supratau", "");
	return 1;
}*/

stock AddVaistai(playerid, zero, one, two, value) 
{
  if(value != -1)
  {	
     drugsInStore[0] += zero; //Teraflu
     drugsInStore[1] += one; //Gripex
     drugsInStore[2] += two; //Antibiotikai
     new vBuy = zero + one + two;
     if(zInfo[playerid][specialybe] == JOB_MEDIC)
     {	
        zInfo[playerid][alga] += vBuy;
        new str[100];
        format(str, 100, "Uþ tai gavai algos: {ffffff}%d Eur", vBuy);
        SendClientMessage(playerid, YELLOW, str);
     }
  }   
  return 1;
}

stock SpawnToHospital(playerid)
{
	   //if(zInfo[playerid][mires] == 1)
	   //if(IsPlayerInAreaEx(playerid, -1154.4, 703.5, 1409.9, 2900.5)) //FC Hospital
	   //{
		   new ligonine = random(3);
		   switch(ligonine)
		   {
            case 0: SetPlayerPos(playerid,342.9870,-1501.7476,524.7386), SetPlayerFacingAngle(playerid, 180.9297);
            case 1: SetPlayerPos(playerid,343.1917,-1503.4216,524.7386), SetPlayerFacingAngle(playerid, 185.3358);
            case 2: SetPlayerPos(playerid,343.1035,-1504.9077,524.7386), SetPlayerFacingAngle(playerid, 177.3499);
	     }
       SetPlayerInterior(playerid, 2);
       ResetPlayerWeaponsEx(playerid);
       AntiCheatSystem[playerid][pNoCheckAirbreak] = 5;
       zInfo[playerid][Mires] = 0;
       KillTimer(GrobimasEx[playerid]);
       KillTimer(TaisoMasinaEx[playerid]);
       KillTimer(KraunaMasinaEx[playerid]);
	     return 1;
}

check_hp()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnected(i))
		{
           if(zInfo[i][LaikasLigonineje] >= 1)
           {
          	  zInfo[i][LaikasLigonineje] --;
          	  new msg[50];
          	  format(msg, 50, "~s~Jusu gydymas baigsis uz: ~r~%d ~s~sec", zInfo[i][LaikasLigonineje]);
			  TDtext(i, msg);
          	  if(zInfo[i][LaikasLigonineje] == 0)
          	  {
       		     SendClientMessage(i, -1, "Jûsø gydymas ligoninëje baigësi. Dabar galite iðeiti.");
          	  }
           }
        }
   }
   return 1;
}

forward ToggleHP(playerid);
public ToggleHP(playerid)
{
	TogglePlayerControllable(playerid, true);
	return 1;
}
