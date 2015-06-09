//Configuration for Airdrop Assistance
//Author: Apoc

APOC_AA_coolDownTime = 600; //Expressed in sec

APOC_AA_VehOptions =
[ // ["Menu Text",		ItemClassname,				Price,	"Drop Type"]
["Quadbike (Civilian)", "C_Quadbike_01_F", 			3500, 	"vehicle"],
["Offroad", 		"B_G_Offroad_01_F", 			8000, 	"vehicle"],
["Offroad HMG", 		"B_G_Offroad_01_armed_F",	25000, 	"vehicle"],
["Tempest Medical", 		"O_Truck_03_medical_F", 			50000, 	"vehicle"],
["Strider HMG", 		"I_MRAP_03_hmg_F", 			70000, 	"vehicle"]
];

APOC_AA_SupOptions =
[// ["stringItemName", 	"Crate Type for fn_refillBox 	,Price," drop type"]
["Launchers", 			"mission_USLaunchers", 			35000, "supply"],
["Assault Rifle", 		"mission_USSpecial", 			35000, "supply"],
["Sniper Rifles", 		"airdrop_Snipers", 				50000, "supply"],
["DLC Rifles", 			"airdrop_DLC_Rifles", 			45000, "supply"],
["DLC LMGs", 			"airdrop_DLC_LMGs", 			45000, "supply"],

//"Menu Text",			"Crate Type", 			"Cost", "drop type"
["Food",				"Land_Sacks_goods_F",	5000, 	"picnic"],
["Water",				"Land_BarrelWater_F",	5000, 	"picnic"]
];