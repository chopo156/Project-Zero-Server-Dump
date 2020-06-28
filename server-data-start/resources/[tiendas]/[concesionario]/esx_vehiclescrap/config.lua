Config                            = {}
Config.DrawDistance               = 100
Config.MarkerColor                = {r = 120, g = 120, b = 240}
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.ResellPercentage           = 50

Config.Locale                     = 'es'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 4
Config.PlateUseSpace = true

Config.Zones = {

	ShopEntering = {
		Pos   = vector3(1228.62, 2732.8, 37.04),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = 27
	},

	ShopInside = {
		Pos     = vector3(1223.15, 2732.96, 37.6),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 234.06,
		Type    = -1
	},

	ShopOutside = {
		Pos     = vector3(1212.77, 2737.49, 37.54),
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Heading = 180.30,
		Type    = -1
	},

	BossActions = {
		Pos   = vector3(-32.0, -1114.2, 25.4),
		Size  = {x = 1.5, y = 1.5, z = 1.0},
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = vector3(-18.2, -1078.5, 25.6),
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

}
