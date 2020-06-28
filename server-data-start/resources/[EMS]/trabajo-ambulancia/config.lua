Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = {type = 25, x = 1.5, y = 1.5, z = 1.0, r = 230, g = 5, b = 10, a = 100, rotate = true}

Config.ReviveReward               = 100  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = false -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'es'

Config.EarlyRespawnTimer          = 60000 * 8 -- time til respawn is available
Config.BleedoutTimer              = 60000 * 6  -- time til the player bleeds out

Config.EnablePlayerManagement     = true

Config.RemoveWeaponsAfterRPDeath  = false
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 50000

Config.RespawnPoint = {coords = vector3(299.35, -582.34, 43.26), heading = 75.42}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(289.62, -591.18, 43.18),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},

		AmbulanceActions = {
			vector3(358.41, -593.94, 47.32)
		},

		Pharmacies = {
			vector3(301.6, -596.7, 48.22)
		},

		Vehicles = {
			{
				Spawner = vector3(329.66, -573.47, 28.90),
				InsideShop = vector3(341.07, -560.18, 28.74),
				Marker = {type = 36, x = 1.5, y = 1.5, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(317.56, -545.0, 28.74), heading = 270.15, radius = 5.0}, -- 1º Spawn 
					{coords = vector3(318.09, -553.6, 28.74), heading = 267.58, radius = 5.0}, -- 2º Spawn si sacas dos vehiculos a la vez
					{coords = vector3(329.65, -543.55, 28.74), heading = 193.07, radius = 6.0} -- 3º Spawn si sacas dos vehiculos a la vez
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(353.61, -588.81, 75.98),
				InsideShop = vector3(352.26, -588.8, 75.98),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(352.12, -588.6, 75.98), heading = 250.38, radius = 10.0}, -- 1º Spawn
					--{coords = vector3(299.5, -1453.2, 46.5), heading = 142.7, radius = 10.0}
				}
			}
		},

		FastTravels = { -- TP NORMALES
			{
				From = vector3(327.2, -603.85, 42.28),                                              -- Entrada a la puerta del Garaje hacia al Hospital donde se
				To = {coords = vector3(319.78, -556.18, 28.74), heading = 327.23},					--					situa las "escaleras"
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}     
			},																											

			{
				From = vector3(319.67, -560.19, 27.74), 											-- Salida al Garaje de los EMS, desde las "escaleras"
				To = {coords = vector3(328.21, -601.32, 43.28), heading = 350.23},                 
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false} 
			},

			{
				From = vector3(332.31, -595.7, 42.28),												-- Subida al elevador para ir al Helipuerto
				To = {coords = vector3(341.37, -584.81, 74.16), heading = 246.06},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(338.59, -583.89, 73.16),												-- Salida del elevador para ir al Hospital
				To = {coords = vector3(330.29, -594.88, 43.28), heading = 70.36},
				Marker = {type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
				--Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
				--Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = { -- TPS RÁPIDOS
		{
				From = vector3(237.4, -1373.8, 26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				--Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false}, 	-- Solo quitar el marker si no peta el script
				Prompt = _U('fast_travel')																				-- Si quitas La línea entera no funciona
			},
		
			{
				From = vector3(256.5, -1357.7, 36.0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				--Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.Vehiculos = {
	{
		model = 'ambulance',
		name = 'Ambulancia',
	},
	{
		model = 'fire1',
		name = 'Semi 4X4 Chevrolet',
	},
	{
		model = 'fire3',
		name = 'Semi 4X4 Ford',
	},
	{
		model = 'bike2',
		name = 'Moto EMS',
	},
}
Config.Helicopteros = {
	"maverick"
}


Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'ambulance', label = 'Ambulancia EMS', price = 1},
			{model = 'fire1', label = 'Semi 4X4 Chevrolet', price = 1},
		},

		doctor = {
			{model = 'ambulance', label = 'Ambulancia EMS', price = 1},
			{model = 'bike2', label = 'Moto EMS', price = 1},
			{model = 'fire3', label = 'Semi 4X4 Ford', price = 1},
			{model = 'fire1', label = 'Semi 4X4 Chevrolet', price = 1}
		},

		chief_doctor = {
			{model = 'ambulance', label = 'Ambulancia EMS', price = 1},
			{model = 'bike2', label = 'Moto EMS', price = 1},
			{model = 'fire3', label = 'Semi 4X4 Ford', price = 1},
			{model = 'fire1', label = 'Semi 4X4 Chevrolet', price = 1}
		},

		boss = {
			{model = 'ambulance', label = 'Ambulancia EMS', price = 1},
			{model = 'bike2', label = 'Moto EMS', price = 1},
			{model = 'fire3', label = 'Semi 4X4 Ford', price = 1},
			{model = 'fire1', label = 'Semi 4X4 Chevrolet', price = 1}
		},
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'maverick', label = 'Helicoptero EMS', price = 1},
		},

		chief_doctor = {
			{model = 'maverick', label = 'Helicoptero EMS', price = 1},
		},

		boss = {
			{model = 'maverick', label = 'Helicoptero EMS', price = 1},
		},
	}
}
