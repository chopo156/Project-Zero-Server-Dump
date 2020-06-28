Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = {x = 1.5, y = 1.5, z = 0.5}
Config.MarkerColor                = {r = 50, g = 50, b = 204}

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = false
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = false -- enable blips for cops on duty, requires esx_society
Config.EnableCustomPeds           = false -- enable custom peds in cloak room? See Config.CustomPeds below to customize peds

Config.EnableESXService           = false -- enable esx service?
Config.MaxInService               = 5

Config.Locale                     = 'es'

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.0,
			Colour  = 29
		},

		Blip2 = {
			Coords  = vector3(-1092.45, -826.19, 26.83),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.0,
			Colour  = 29
		},
		
		Blip3 = {
			Coords  = vector3(-447.56, 6009.49, 36.51),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.0,
			Colour  = 29
		},

		-- Cloakrooms = {
		-- 	vector3(452.6, -992.8, 30.6),
		-- 	vector3(-1029.45, -826.19, 26.83),
		-- 	vector3(-1096.31, -832.30, 14.28),
		-- 	vector3(1849.32, 3695.69, 34.27)
		-- },

		-- Armories = {
		-- 	vector3(451.7, -980.1, 30.6),
		-- 	vector3(-1098.91, -827.39, 14.28),
		-- 	vector3(1845.88, 3692.89, 34.27)
		-- },

		Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, 28.4),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0},
					{coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0},
					{coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0},
					{coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0} 
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0},
					{coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0}
				}
			},

			{
				Spawner = vector3(-450.83, 5989.95, 31.34),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(-449.27, 5994.04, 30.99), heading = 85.15, radius = 6.0},
					{coords = vector3(-452.92, 5998.41, 30.99), heading = 85.83, radius = 6.0},
					{coords = vector3(-456.39, 6002.08, 30.99), heading = 86.78, radius = 6.0}, 
				}
			},
			{
				Spawner = vector3(-1121.32, -839.8, 13.37),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{coords = vector3(-1112.71, -854.99, 13.14), heading = 38.12, radius = 6.0},
					{coords = vector3(-1115.28, -857.88, 13.15), heading = 37.53, radius = 6.0},
					{coords = vector3(-1123.53, -86.19, 13.18), heading = 39.53, radius = 6.0}, 
					{coords = vector3(-1126.63, -864.42, 13.17), heading = 39.53, radius = 6.0}, 
				}
			},
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0}
				}
			},
			{
				Spawner = vector3(-1096.26, -831.97, 37.7),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(-1096.3, -832.0, 38.09), heading = 38.09, radius = 10.0}
				}
			},
			{
				Spawner = vector3(-475.12, 5988.36, 31.34),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{coords = vector3(-473.14, 5986.27, 31.72), heading = 224.22, radius = 10.0}
				}
			},
		},

		BossActions = {
			vector3(448.4, -973.2, 29.70),
			vector3(-447.04, 6014.22, 35.52),
			vector3(-1113.02, -832.92, 33.37)
		}
	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 1500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 80}
	},

	officer = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	sergeant = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	lieutenant = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	},

	boss = {
		{weapon = 'WEAPON_APPISTOL', components = {0, 0, 1000, 4000, nil}, price = 10000},
		{weapon = 'WEAPON_ADVANCEDRIFLE', components = {0, 6000, 1000, 4000, 8000, nil}, price = 50000},
		{weapon = 'WEAPON_PUMPSHOTGUN', components = {2000, 6000, nil}, price = 70000},
		{weapon = 'WEAPON_NIGHTSTICK', price = 0},
		{weapon = 'WEAPON_STUNGUN', price = 500},
		{weapon = 'WEAPON_FLASHLIGHT', price = 0}
	}
}

Config.Vehiculos = {
	{
		model = 'police',
		name = 'Patrulla',
	},
	{
		model = 'police2',
		name = 'Interceptor',
	},
	{
		model = 'policeb',
		name = 'Mary Offroad',
	},
	{
		model = 'sheriff2',
		name = '4x4',
	},
	{
		model = 'sheriff2',
		name = '4x4',
	},
}
Config.Helicopteros = {
	"polmav"
}

Config.AuthorizedVehicles = {
	car = {
		recruit = {},

		officer = {
			{model = 'police3', price = 20000}
		},

		sergeant = {
			{model = 'policet', price = 18500},
			{model = 'policeb', price = 30500}
		},

		lieutenant = {
			{model = 'riot', price = 70000},
			{model = 'fbi2', price = 60000}
		},

		boss = {}
	},

	helicopter = {
		recruit = {},

		officer = {},

		sergeant = {},

		lieutenant = {
			{model = 'polmav', props = {modLivery = 0}, price = 200000}
		},

		boss = {
			{model = 'polmav', props = {modLivery = 0}, price = 100000}
		}
	}
}

Config.CustomPeds = {
	shared = {
		{label = 'Sheriff Ped', maleModel = 's_m_y_sheriff_01', femaleModel = 's_f_y_sheriff_01'},
		{label = 'Police Ped', maleModel = 's_m_y_cop_01', femaleModel = 's_f_y_cop_01'}
	},

	recruit = {},

	officer = {},

	sergeant = {},

	lieutenant = {},

	boss = {
		{label = 'SWAT Ped', maleModel = 's_m_y_swat_01', femaleModel = 's_m_y_swat_01'}
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements
Config.Uniforms = {
	recruit = {
		male = {
			tshirt_1 = 59,  tshirt_2 = 1,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = 45,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 1,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 1,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 2,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 2,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	boss = {
		male = {
			tshirt_1 = 58,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 8,   decals_2 = 3,
			arms = 41,
			pants_1 = 25,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		},
		female = {
			tshirt_1 = 35,  tshirt_2 = 0,
			torso_1 = 48,   torso_2 = 0,
			decals_1 = 7,   decals_2 = 3,
			arms = 44,
			pants_1 = 34,   pants_2 = 0,
			shoes_1 = 27,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 0,    chain_2 = 0,
			ears_1 = 2,     ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 11,  bproof_2 = 1
		},
		female = {
			bproof_1 = 13,  bproof_2 = 1
		}
	},

	gilet_wear = {
		male = {
			tshirt_1 = 59,  tshirt_2 = 1
		},
		female = {
			tshirt_1 = 36,  tshirt_2 = 1
		}
	}
}
