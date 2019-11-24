#define MAX_HOUSES 1000
enum HouseInt
{
    Price,
	Int,
	Float:IntX,
	Float:IntY,
	Float:IntZ,
	Float:IntAngle
};
new bInterior[4][HouseInt] =
{
	{20000, 11, 2282.968, -1140.093, 1050.900, 360.0}, //Butas
	{40000, 5, 2233.64, -1115.26, 1050.88, 360.0}, //Butas
	{60000, 4, 261.061, 1284.494, 1080.258, 90.0}, //Butas
	{80000, 9, 260.800, 1237.599, 1084.258, 360.0} //Butas
};
new hInterior[4][HouseInt] =
{
	{120000, 5, 22.88, 1403.33, 1084.44, 360.0}, //Namas
	{150000, 2, 2237.59, -1081.64, 1049.02, 360.0}, //Namas
	{180000, 15, 295.04, 1472.26, 1080.26, 360.0}, //Namas
	{210000, 3, 235.34, 1186.68, 1080.26, 360.0} //Namas
};
new vInterior[4][HouseInt] =
{
	{500000, 5, 226.30, 1114.24, 1080.99, 360.0}, //Vila
	{700000, 7, 225.68, 1021.45, 1084.02, 360.0}, //Vila
	{900000, 12, 2324.53, -1149.54, 1050.71, 360.0}, //Vila
	{1300000, 5, 140.17, 1366.07, 1083.65, 360.0} //Vila
};
enum HouseInfo
{
	bool:hCreated,
	bool:Locked,
	bool:Buyed,
	Owner[21],
	Text3D:House3D,
	HousePickup,
	KredKaina,
	Float:IntX,
	Float:IntY,
	Float:IntZ,
	Float:IntAngle,
	Float:ExitX,
	Float:ExitY,
	Float:ExitZ,
	Float:ExitAngle,
	Money,
	hInt,
	htVW,
	Cost,
	Bill
}
new hInfo[MAX_HOUSES][HouseInfo];

