--[[ ===================================================== ]]--
--[[         FiveM Real Parking Script by Akkariin         ]]--
--[[ ===================================================== ]]--

Config = {}

Config.UsingOldESX = false      -- If you are using ESX 1.2.0 or higher please leave this to false

Config.Locale = 'en' -- locale

Config.ParkingLocations = {
	parking1 = {
		x      = -327.73,                               -- Central location X, Y, Z of the parking
		y      = -934.12,                               -- Y
		z      = 31.08,                                 -- Z
		size   = 50.0,                                  -- The parking range radius (Horizontal)
		height = 10.0,                                  -- The parking range radius (Vertical)
		name   = "Parking 24H",                      -- The name of the parking (blips)
		fee    = 300,                                  -- How much parking fee per day (Real life time), set 0 to disable
		enter  = {x = -279.25, y = -890.39, z = 30.08}, -- The entrance of the parking
		maxcar = 30,
	},
	parking2 = {
		x      = -340.03,      -- Central location X, Y, Z of the parking
		y      = 285.19,
		z      = 84.77,
		size   = 15.0,         -- The parking range radius (Horizontal)
		height = 10.0,         -- The parking range radius (Vertical)
		name   = "Parking 24H", -- The name of the parking (blips)
		fee    = 300,          -- How much parking fee per day (Real life time), set false to disable
		enter  = {x = -338.57, y = 267.16, z = 85.73},
		maxcar = 10,
	},
	parking3 = {
		x      = 237.90,      -- Central location X, Y, Z of the parking
		y      = -774.16,
		z      = 30.72,
		size   = 30.0,         -- The parking range radius (Horizontal)
		height = 10.0,         -- The parking range radius (Vertical)
		name   = "Parking 24H", -- The name of the parking (blips)
		fee    = 200,          -- How much parking fee per day (Real life time), set false to disable
		enter  = {x = 212.29, y = -808.84, z = 30.81},
		maxcar = 20,
	},
	parking4 = {
		x      = 23.42,      -- Central location X, Y, Z of the parking
		y      = -1738.47,
		z      = 28.88,
		size   = 35.0,         -- The parking range radius (Horizontal)
		height = 10.0,         -- The parking range radius (Vertical)
		name   = "Parking 24H", -- The name of the parking (blips)
		fee    = 200,          -- How much parking fee per day (Real life time), set false to disable
		enter  = {x = -19.0, y = -1722.88, z = 28.85},
		maxcar = 15,
	},
	parking5 = {
		x      = 902.43,      -- Central location X, Y, Z of the parking
		y      = -53.36,
		z      = 78.86,
		size   = 40.0,         -- The parking range radius (Horizontal)
		height = 10.0,         -- The parking range radius (Vertical)
		name   = "Parking 24H", -- The name of the parking (blips)
		fee    = 200,          -- How much parking fee per day (Real life time), set false to disable
		enter  = {x = 1731.64, y = 3760.81, z = 33.4},
		maxcar = 17,
	},
	parking6 = {
		x      = 1707.72,      -- Central location X, Y, Z of the parking
		y      = 3762.31,
		z      = 33.84,
		size   = 15.0,         -- The parking range radius (Horizontal)
		height = 10.0,         -- The parking range radius (Vertical)
		name   = "Parking 24H", -- The name of the parking (blips)
		fee    = 200,          -- How much parking fee per day (Real life time), set false to disable
		enter  = {x = 	886.1, y = -89.6, z = 78.79},
		maxcar = 8,
	},
	parking7 = {
		x      = 1956.02,      -- Central location X, Y, Z of the parking
		y      = 3762.1,
		z      = 31.78,
		size   = 15.0,         -- The parking range radius (Horizontal)
		height = 10.0,         -- The parking range radius (Vertical)
		name   = "Parking 24H", -- The name of the parking (blips)
		fee    = 200,          -- How much parking fee per day (Real life time), set false to disable
		enter  = {x = 	1940.63, y = 3764.56, z = 31.77},
		maxcar = 8,
	},
	parking8 = {
		x      = -69.57,      -- Central location X, Y, Z of the parking
		y      = 6552.32,
		z      = 31.55,
		size   = 30.0,         -- The parking range radius (Horizontal)
		height = 10.0,         -- The parking range radius (Vertical)
		name   = "Parking 24H", -- The name of the parking (blips)
		fee    = 200,          -- How much parking fee per day (Real life time), set false to disable
		enter  = {x = -26.11, y = 6524.65, z = 31.49},
		maxcar = 23,
	},
	parking9 = {
		x      = -1655.96,      -- Central location X, Y, Z of the parking
		y      = -896.54,
		z      = 8.65,
		size   = 60.0,         -- The parking range radius (Horizontal)
		height = 10.0,         -- The parking range radius (Vertical)
		name   = "Parking 24H", -- The name of the parking (blips)
		fee    = 200,          -- How much parking fee per day (Real life time), set false to disable
		enter  = {x = -1584.97, y = -869.12, z = 10.18},
		maxcar = 30,
	},
	parking10 = {
		x      = -1135.94,      -- Central location X, Y, Z of the parking
		y      = -753.07,
		z      = 19.35,
		size   = 15.0,         -- The parking range radius (Horizontal)
		height = 10.0,         -- The parking range radius (Vertical)
		name   = "Parking 24H", -- The name of the parking (blips)
		fee    = 200,          -- How much parking fee per day (Real life time), set false to disable
		enter  = {x = -1160.27, y = -740.94, z = 19.69},
		maxcar = 14,
	},
}
