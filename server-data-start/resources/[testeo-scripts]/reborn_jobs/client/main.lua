--[[
█▀▀█ █▀▀█ █▀▀█ ░░▀ █▀▀ █▀▀ ▀▀█▀▀   ▀▀█ █▀▀ █▀▀█ █▀▀█
█░░█ █▄▄▀ █░░█ ░░█ █▀▀ █░░ ░░█░░   ▄▀░ █▀▀ █▄▄▀ █░░█
█▀▀▀ ▀░▀▀ ▀▀▀▀ █▄█ ▀▀▀ ▀▀▀ ░░▀░░   ▀▀▀ ▀▀▀ ▀░▀▀ ▀▀▀▀

SCRIPT CREADO POR ByBlackDeath
DISCORD DEl CREADOR: ByBlackDeath#5528
]]--
ESX = nil
X = {}
X.isOpen = false
X.allDone = false
X.LastShop = nil
X.Material = nil
X.ActualWarehouse = nil
X.Option = nil
X.IsSelecting = false
X.IsCarrying = false
X.IsBacking = false
X.Tons = 0
X.Distance = 0
X.Charging = false
X.IsChargingBox = false

X.Clicks = 0

X.Level = 0
X.IsFunding = false

X.IsProcessing = false

X.IsPlanting = false

X.IsDoingSomething = false
X.GreenPeace = false
X.Capitalist = false

-----------------------------------
-----------INICIALIZADOR-----------
-----------------------------------

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	
	ESX.TriggerServerCallback('reborn_jobs:getWarehouses', function(warehouses)
		Config.Warehouses = warehouses
    end)

    while Config.Warehouses == nil do
		Citizen.Wait(10)
	end

	ESX.TriggerServerCallback('reborn_jobs:getRocks', function(rocks)
		Config.Rocks = rocks
    end)

    ESX.TriggerServerCallback('reborn_jobs:getWoods', function(woods)
		Config.Woods = woods
    end)

    --[[ESX.TriggerServerCallback('reborn_jobs:getPlants', function(plants)
		Config.Plants = plants
    end)

    ESX.TriggerServerCallback('reborn_jobs:getWaterPoints', function(waterpoints)
		Config.WaterPoints = waterpoints
    end)

    ESX.TriggerServerCallback('reborn_jobs:getValves', function(valves)
		Config.Valves = valves
    end)]]--

    while Config.Rocks == nil and Config.Woods == nil and Config.Plants == nil and Config.Valves == nil do
    --while Config.Rocks == nil and Config.Woods == nil and Config.Plants == nil and Config.WaterPoints == nil and Config.Valves == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

	for i,v in pairs(Config.NPCs) do
		print(v.coords.x)
		X.SpawnPed(v.model, v.coords)
	end

	X.CreateDefaultBlips()
	X.allDone = true
end)

-----------------------------------
-------------TRANSLATES------------
-----------------------------------

Local = {
	enterWarehouse  = "Presiona ~y~E ~w~abrir una tienda",
	cancelCharge    = "Presiona ~y~E ~w~para ~ r ~ cancelar la carga",
	warehouse       = "Revista",
	wood            = "Madera",
	food            = "Comida",
	mine            = "Metajamón",
	water           = "agua",
	loadTruck       = "Cargar el vehículo",
	loadVan         = "Toma las cajas",
	getTruck        = "Presiona ~y~E ~w~cargar",
	truck           = "camión",
	van             = "Van",
	youSelect       = "Has elegido ~g~",
	inLabel         = "En",
	youNeed         = "Necesidad",
	load            = "Carga",
	maxCharge       = "Máximo puede ser cargado ",
	tons            = "ton/y",
	notenough       = "No tienes suficientes suministros.",
	invalidAumont   = "Cantidad inválida",
	haveToDelivery  = "Primero  ~g~usted ~o~entregar ~w~los muchachos.",
	notTruckAllowed = "No puedes llevar la carga con este vehículo.",
	haveToSit       = "Debes sentarte en un vehículo de trabajo.",
	truckPlace      = "Lleve material para su informe. ",
	deliveryTruck   = "Presiona ~y~E ~w~para entregar un trailer.",
	putTheTruck     = "Bajar el remolque. Para hacer esto, sostenga H.",
	dontHaveAnyTrailer = "No tienes un trailer en este momento.",
	trailerNotAllowed = "Este trailer no pertenece a la empresa!",
	discharge       = "Espere un momento hasta que se descargue la carga ...",
	upToBack        = "Puedes volver al almacén para recogerlo",
	succesfulDelivery = "Has enviado con éxito",
	getBox            = "Presiona ~y~E ~w~orden zaladowac furgonetke ",
	isCharging        = "Espera, cargamos las mercancías ...",
	correctCharge     = "Las mercancías se han cargado correctamente.",
	goToCharge        = "Ve a cargar los bienes.",
	putTheVan         = "Deja la camioneta aquí y ve a la oficina.",
	infoTrucks        = "Obtenga información del camión.",
	infoVans          = "Obtenga información sobre furgonetas",
	haveToBuy         = "Debe comprar uno de los siguientes vehículos de mercancías.",


	carbon            = "carbon",
	iron              = "hierro",
	silver            = "plata",
	gold              = "oro",
	aluminium		  = "aluminio",
	copper			  = "cobre",
	nitrato			  = "nitrato de potasio",
	azufre			  = "azufre",
	piedra 			  = "piedra",
	rockOf            = "Mena de ",
	getPickAxe        = "Presiona ~INPUT_CONTEXT~ para obtener una herramienta de trabajo.",
	goFundition       = "Presiona [E] fundir materiales",
	youCantMine       = "No puedes cavar esta roca.",
	fundition         = "¿Que material quieres fundir?",
	melt              = "Fundir ",
	mine              = "Mina",
	othermine		  = "Mineshaft",
	funditionLingots  = "Fundicion",



	pine              = "Pino",
	rubber			  = "Caucho",
	palo			  = "Palo",
	treeOf            = "Árbol de ",
	woodProcesser     = "¿Que madera quieres cortar?",
	goProcesser       = "Presiona E para cortar troncos",
	process           = "Proceso ",
	sawmill           = "Asseradero",
	sawmill2		  = "Zona de Caucho",
	convertWood       = "Processamiento de Madera",

	nearPlant         = "Estás muy cerca de la planta",
	noPHNear          = "No hay PH cerca",
	water             = "Agua",
	fertilizer        = "Fertilizante",
	tomato_seed       = "~r~Semillas de tomate",
	blueberry_seed    = "~p~Semillas de bayas",
	state             = "Estado",
	rotten            = "Han muerto",
	youArePlating     = "Ya piensas!",
	seedNotAllowed    = "Esta semilla no se puede plantar en este PH",
	noPlantNear       = "No hay plantas cerca",
	ready             = "Listo",
	pressButton       = "Presiona ~r~E ~w~hablar",
	water_25          = "Agua 25L",
	water_50          = "Agua 50L",
	fertilizer_25     = "Fertilizante 25%",
	fertilizer_50     = "Fertilizante 50%",
	seedShop          = "¿Quieres comprar semillas?",
	tomatoSeedLabel   = "Semillas de tomate",
	blueberrySeedLabel= "Bayas Nasiona",
	ph                = "Campos fértiles (PH+)",
	playerNearby      = "Manténgase alejado de personas cercanas",
	packageTomato     = "Paquete de tomates",
	packageBlueberry  = "Pack bayas",

	salinity          = "~c~Salinidad",
	chemists          = "~g~Toxicidad",
	pollution         = "~y~Polución",
	pointWater        = "Punto de entrada de agua",
	dirtyWater        = "~o~Agua sucia",
	electricityDown   = "~b~Reduce la salinidad con el sistema de filtro",
	dam               = "Punto de vista",
	allow             = "~g~disponible",
	notAllow          = "~r~No disponible",
	noActionAllow     = "Esta acción no está permitida.",
	catCall           = "~c~Llama al gato por el botón de contaminación",
	greenpeaceAcept   = "~c~Lograr sabiduría contactando a la naturaleza a través de GreenPeace",
	youAreCapitalist  = "¿Ahora quieres que te ayude? ¡Sucia capitalista de mierda!",
	capitalistAccept  = "¿Quieres unirte al sistema? Solo tienes que apoyar mi caso.",
	youAreGreenPeacer = "¿Quieres comenzar un negocio ahora?",
	toxic1            = "Abra la válvula para colocar los productos químicos en el agua.",
	salinity1         = "Rompe un poco el filtro de sal",
	salinity2         = "Verter en esencias naturales",
	pollution1        = "Mira a las personas que contaminan domestica",
	pollution2        = "Gotear en el arroyo",
	chemist1          = "Honra al dios salvavidas",
	pollution3        = "Repare el filtro de suciedad",
	salinity3         = "Parece que hay un mouse al lado de la caja. Repare el filtro de salinidad.",
	youAreDoingSomething = "Parar la actividad actual",
	noWaterPointsNearby = "No hay puntos de recogida de agua cerca.",
	youAreRecolecting = "Recoges agua",
	waterBottle       = "Botella de agua",
	bottleShop        = "Almacenar con botellas de agua.",
	washBottles       = "¿Quieres limpiar las botellas?",
	washSaltBottles   = "¿Quieres desalar las botellas?",
	washBottle        = "Limpiador de botellas de agua",
	packageWater      = "Empaca las botellas con agua",
	washSaltBottles   = "¿Quieres empacar tus productos?",
	package           = "Embalaje",

	confirm_yes       = "Si",
	confirm_no        = "No",

	pine_processed    = "Pino procesado",
	lingot_carbon     = "Carbón procesado",
	lingot_iron       = "Barra de hierro",
	lingot_silver     = "Barra de plata",
	lingot_gold       = "Barra de oro",
	bottleWater_package = "Paquete de agua",
	blueberry_package = "Paquete de arándanos",
	tomato_package    = "Paquete de Tomates",

	sellToWarehouse   = "¿Quieres vender materiales para el almacén?",
	noSpace           = "No hay suficiente espacio en el almacén.",
	downTheCar        = "Tienes que salir del auto"
}

-----------------------------------
---------------CONFIG--------------
-----------------------------------

Config = {}
Config.Warehouses = nil
Config.MaxWeight = {
	truck = 31,
	van   = 11
}
Config.TrailersModels = {
--	wood = {go = "trailerlogs", back = "trflat"},
--	food = {go = "trailers", back = "trailers"},
--	mine = {go = "docktrailer", back = "docktrailer"},
--	water = {go = "tanker2", back = "tanker2"}
}
Config.AvaliableTrucks = {
	--"man",
	--"actros"
}
Config.AvaliableVans = {
	--"renmaster",
	--"kangoo"
}
Config.BlipsWarehouses = {
--	id = 478,
--	colour = 73
}
Config.Ports = {
	--{
		--name = Local.truckPlace, 
		--id = 479, 
		--colour = 58, 
		--x = 1183.54, y = -3245.46, z = 6.03, 
		--point = {x = 1196.51, y = -3253.77, z = 7.1}
	--}
}

-----------------------
-------CONFIG MINE-----
-----------------------
Config.Blips = {
	mine = {x = 2946.15, y = 2747.81, z = 42.38}, -- Mineria
	--othermine = {title=Local.othermine, colour=5, id=318, x = -598.28, y = 2097.53, z = 130.73}, -- Mineria Cerrada
    fundition = {x = 1109.98, y = -2008.23, z = 31.06}, -- Fundicion
    sawmill = {x = -552.3, y = 5348.45, z = 73.74}, -- zona de tala
	woodProcesser = {x = -532.4, y = 5292.75, z = 74.19}, -- Convertir madera
	--sawmill2 = {title=Local.sawmill2, colour=56, id=549, x = -559.83, y = 5435.85, z = 61.68}
    --ph1 = {title=Local.ph, colour=71, id=266, x = 2648.25, y = 4691.03, z = 36.05},
    --ph2 = {title=Local.ph, colour=71, id=266, x = 2523.79, y = 4360.59, z = 39.65}
    --water = {title=Local.pointWater, colour=29, id=486, x = 1685.44, y = 42.81, z = 161.76}
    --dam = {title=Local.dam, colour=29, id=486, x = 1660.05, y = -1.34, z = 173.77}
    --waterWashBottle = {title=Local.washBottle, colour=29, id=486, x = 583.96, y = 137.95, z = 98.47},
    --package = {title=Local.package, colour=50, id=486, x = 822.08, y = -2146.26, z = 27.71}
}

Config.isExperienceSystemActive = false

Config.ClicksToPickNeeded = 4
Config.DistanceToRemoveThePickaxe = 700
Config.Rocks = nil

Config.ClicksToCutNeeded = 4
Config.DistanceToRemoveTheAxe = 1000
Config.Woods = nil

--[[Config.PH = {
	{
		id = 1,
		x = 1278.67,
		y = 1808.94,
		z = 64.3,
		radio = 50000.0,
		seedsAllowed = {'tomato_seed', 'blueberry_seed'}
	},
	{
		id = 2,
		x = 1319.46,
		y = 1868.47,
		z = 90.83,
		radio = 50000.0,
		seedsAllowed = {'tomato_seed', 'blueberry_seed'}
	}
}
Config.Seeds = {
	tomato_seed = {
		seed = 'tomato_seed',
		distanceNeeded = 5.0,
		object = 'prop_veg_crop_01',
		reward = 'tomato_fruit',
		price = 20,
		maxPlants = 30
	},
	blueberry_seed = {
		seed = 'blueberry_seed',
		distanceNeeded = 5.0,
		object = 'prop_plant_cane_02a',
		reward = 'blueberry_fruit',
		price = 20,
		maxPlants = 30
	}
}]]--
Config.NPCs = {
	--[[{
		name = 'OpenSeedMenu',
		coords = {
			x = 1219.14,
			y = 1848.25,
			z = 77.96,
			h = 210.0
		},
		msg = Local.pressButton,
		model = -1806291497
	},
	{
		name = '',
		coords = {
			x = 1664.64,
			y = -28.04,
			z = 195.94,
			h = 300.0
		},
		msg = nil,
		model = -264140789
	},
	{
		name = '',
		coords = {
			x = 1660.83,
			y = -24.74,
			z = 172.77,
			h = 210.0
		},
		msg = nil,
		model = 1809430156
	},
	{
		name = 'OpenBottleMenu',
		coords = {
			x = 1664.62,
			y = -18.56,
			z = 172.77,
			h = 210.0
		},
		msg = Local.pressButton,
		model = -1806291497
	},
	{
		name = 'OpenProcesserMenu',
		coords = {
			x = 583.96,
			y = 137.95,
			z = 98.47,
			h = 210.0
		},
		msg = Local.pressButton,
		model = -1806291497
	},
	{
		name = 'OpenSaltMenu',
		coords = {
			x = 1904.91,
			y = 595.82,
			z = 177.4,
			h = 120.0
		},
		msg = Local.pressButton,
		model = -1806291497
	},
	{
		name = 'OpenPackageMenu',
		coords = {
			x = 822.08,
			y = -2146.26,
			z = 27.71,
			h = 300.0
		},
		msg = Local.pressButton,
		model = -1806291497
	}]]--
}
--[[Config.SeedShop = {
	{label = Local.water_25, value = "water_25", price = 2},
	{label = Local.water_50, value = "water_50", price = 5},
	{label = Local.fertilizer_25, value = "fertilizer_25", price = 5},
	{label = Local.fertilizer_50, value = "fertilizer_50", price = 10},
	{label = Local.tomatoSeedLabel, value = "tomato_seed", price = 1},
	{label = Local.blueberrySeedLabel, value = "blueberry_seed", price = 1},
}
Config.SecondNeededToPlant = 8 --[More than 3 seconds pls]

Config.BottleShop = {
	{label = Local.waterBottle, value = "waterBottle", price = 1},
}
Config.PackageShop = {
	{label = Local.packageTomato, from = "tomato_fruit", to = "tomato_package"},
	{label = Local.packageBlueberry, from = "blueberry_fruit", to = "blueberry_package"},
	{label = Local.packageWater, from = "full_waterBottle", to = "bottleWater_package"}
}

Config.Packages = {
	wood = {
		'pine_processed'
	},
	mine = {
		'lingot_carbon',
		'lingot_iron',
		'lingot_silver',
		'lingot_gold'
	},
	water = {
		'bottleWater_package'
	},
	food = {
		'blueberry_package',
		'tomato_package'
	}
}]]--
-----------------------------------
-------------HILO PRINC------------
-----------------------------------

Citizen.CreateThread(function()
	while X.allDone == false do
		Citizen.Wait(0)
	end
	X.CreateWarehousesBlips()
	X.CreatePortsBlips()
	while true do
		Citizen.Wait(10)
		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
		for i,v in pairs(Config.Warehouses) do
			local distance = X.Get3DDistance(v.mainDoor.x, v.mainDoor.y, v.mainDoor.z, coords.x, coords.y, coords.z)

			-------------
			--ALMACENES--
			-------------
			--[[if distance < 50.0 then
				X.DrawMarker(39,v.mainDoor.x, v.mainDoor.y, v.mainDoor.z,255,255,0,1.0,1.0,1.0)
				if distance < 1.5 then
					if X.IsSelecting == false and X.IsCarrying == false and X.IsBacking == false then
						ESX.ShowHelpNotification(Local.enterWarehouse)
						if IsControlJustReleased(0, 38) then
							ESX.TriggerServerCallback('reborn_jobs:getWarehouse', function(warehouse)
								X.OpenWarehouse(warehouse)
						    end, v.storeID)
						end
					elseif X.IsSelecting == false and X.IsCarrying == true then
						ESX.ShowHelpNotification(Local.haveToDelivery)
					elseif X.IsSelecting == false and X.IsCarrying == false and X.IsBacking == true then
						ESX.ShowHelpNotification(Local.deliveryTruck)
						if IsControlJustReleased(0, 38) then
							local vehicle, distance = ESX.Game.GetClosestVehicle({x = v.leaveCharge.x, y = v.leaveCharge.y, z = v.leaveCharge.z})
							if distance <= 4.0 and X.Option == 'truck' then
								local plate = X.Trim(GetVehicleNumberPlateText(vehicle))
								ESX.TriggerServerCallback('reborn_jobs:getTrailer', function(trailer)
									if trailer.plate == plate then
										ESX.ShowNotification(Local.succesfulDelivery)
										DeleteEntity(vehicle)
										ESX.Game.DeleteVehicle(vehicle)
										TriggerServerEvent('reborn_jobs:payTons', X.Tons)
										X.ClearVars()
									else
										ESX.ShowNotification(Local.trailerNotAllowed)
									end
								end, plate)
							elseif distance <= 4.0 and X.Option == 'van' then
								local plate = X.Trim(GetVehicleNumberPlateText(vehicle))
								ESX.TriggerServerCallback('reborn_jobs:getTrailer', function(trailer)
									if trailer.plate == plate then
										ESX.ShowNotification(Local.succesfulDelivery)
										TriggerServerEvent('reborn_jobs:payTons',X.Tons)
										X.ClearVars()
									else
									end
								end, plate)
							else
								ESX.ShowNotification(Local.dontHaveAnyVehicle)
							end
						end
					elseif X.IsSelecting == false then
						ESX.ShowHelpNotification(Local.cancelCharge)
						if IsControlJustReleased(0, 38) then
							X.CancelCharging()
						end
					end
				end
			end

			------------
			--CARGADOR--
			------------
			if X.IsSelecting == true and X.ActualWarehouse ~= nil and X.Material ~= nil and (X.Option == 'truck' or X.Option == 'van') then
				local distanceToGet = X.Get3DDistance(v.getCharge.x, v.getCharge.y, v.getCharge.z, coords.x, coords.y, coords.z)
				if distanceToGet < 50.0 then
					X.DrawMarker(21,v.getCharge.x, v.getCharge.y, v.getCharge.z,0,0,255,1.0,1.0,1.0)
					if distanceToGet < 3.5 then
						ESX.ShowHelpNotification(Local.getTruck.."~g~"..Local[X.Material].."~w~. ("..Local.maxCharge.."~y~"..Config.MaxWeight[X.Option].."~w~ "..Local.tons..")")
						if IsControlJustReleased(0, 38) then
							if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
								X.OpenGetCharge()
							else
								ESX.ShowNotification(Local.haveToSit)
							end
						end
					end
				end
			end

			---------------------
			---INDICADOR CARGA---
			---------------------
			if X.IsBacking == true and X.ActualWarehouse ~= nil and X.Material ~= nil and (X.Option == 'truck' or X.Option == 'van') then
				local distanceToLeave = X.Get3DDistance(v.leaveCharge.x, v.leaveCharge.y, v.leaveCharge.z, coords.x, coords.y, coords.z)
				if distanceToLeave < 50.0 then
					X.DrawMarker(29,v.leaveCharge.x, v.leaveCharge.y, v.leaveCharge.z,0,0,255,1.0,1.0,1.0)
					if distanceToLeave < 3.5 then				
						if distanceToLeave < 3.5 and X.Option == 'truck' then
							ESX.ShowHelpNotification(Local.putTheTruck)
						elseif distanceToLeave < 3.5 and X.Option == 'van' then
							ESX.ShowHelpNotification(Local.putTheVan)
						end
					end
				end
			end

			-----------------
			--COGER LA CAJA--
			-----------------
			if X.IsChargingBox == true and X.ActualWarehouse ~= nil and X.Material ~= nil then
				local distanceToBox = X.Get3DDistance(v.getBox.x, v.getBox.y, v.getBox.z, coords.x, coords.y, coords.z)
				if distanceToBox < 50.0 then
					X.DrawMarker(29,v.getBox.x, v.getBox.y, v.getBox.z,0,0,255,1.0,1.0,1.0)
					if distanceToBox < 3.5 then				
						ESX.ShowHelpNotification(Local.getBox)
						if IsControlJustReleased(0, 38) then
							if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
								if X.IsAValidVan() then
									X.IsChargingBox = false
									ESX.ShowNotification(Local.isCharging)
									local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
									local plate = X.Trim(GetVehicleNumberPlateText(vehicle))
									FreezeEntityPosition(vehicle,true)
									Citizen.Wait(8000)
									FreezeEntityPosition(vehicle,false)
									TriggerServerEvent('reborn_jobs:addTrailer', X.Trim(plate), X.Tons)
									X.IsChargingBox = false
									X.IsCarrying = true
								else
									ESX.ShowNotification(Local.notTruckAllowed)
								end
							else
								ESX.ShowNotification(Local.haveToSit)
							end
						end
					end
				end
			end]]--

			-------
			--IDA--
			-------
			if X.IsCarrying == true and X.ActualWarehouse ~= nil and X.Material ~= nil and (X.Option == 'truck' or X.Option == 'van') then
				for i,v in pairs(Config.Ports) do
					local distanceToGet = X.Get3DDistance(v.x, v.y, v.z, coords.x, coords.y, coords.z)
					local distanceToDelivery = X.Get3DDistance(v.point.x, v.point.y, v.point.z, coords.x, coords.y, coords.z)
					if distanceToGet < 50.0 then
						X.DrawMarker(29,v.x, v.y, v.z,0,0,255,1.0,1.0,1.0)
						X.DrawMarker(21,v.point.x, v.point.y, v.point.z,0,0,255,1.0,1.0,1.0)
						if distanceToGet < 3.5 and X.Option == 'truck' then
							ESX.ShowHelpNotification(Local.putTheTruck)
						elseif distanceToGet < 3.5 and X.Option == 'van' then
							ESX.ShowHelpNotification(Local.putTheVan)
						end
						if distanceToDelivery < 3.5 and X.Charging == false then
							ESX.ShowHelpNotification(Local.deliveryTruck)
							if IsControlJustReleased(0, 38) then
								local vehicle, distance = ESX.Game.GetClosestVehicle({x = v.x, y = v.y, z = v.z})
								if distance <= 4.0 then
									local plate = X.Trim(GetVehicleNumberPlateText(vehicle))
									ESX.TriggerServerCallback('reborn_jobs:getTrailer', function(trailer)
										if trailer ~= nil and trailer.plate == plate and X.Option == 'truck' then
											local coordsV = GetEntityCoords(vehicle)
											ESX.ShowNotification(Local.discharge)
											X.Charging = true
											Citizen.Wait(8000)
											ESX.ShowNotification(Local.upToBack)
											ESX.Game.DeleteVehicle(vehicle)
											DeleteEntity(vehicle)
											Citizen.Wait(1000)
											ESX.Game.SpawnVehicle(Config.TrailersModels[X.Material].back, coordsV, 0.0, function(vehicle)
												SetVehicleNumberPlateText(vehicle, plate)			
												X.Tons = trailer.tons
												X.IsCarrying = false
												X.IsBacking = true
												X.Distance = X.Get3DDistance(coords.x, coords.y, coords.z, X.LastShop.mainDoor.x, X.LastShop.mainDoor.y, X.LastShop.mainDoor.z)
												X.Charging = false

											end)
										elseif trailer ~= nil and trailer.plate == plate and X.Option == 'van' then
											ESX.ShowNotification(Local.discharge)
											X.Charging = true
											Citizen.Wait(8000)
											ESX.ShowNotification(Local.upToBack)
											X.Charging = false
											X.IsCarrying = false
											X.IsBacking = true
											X.Distance = X.Get3DDistance(coords.x, coords.y, coords.z, X.LastShop.mainDoor.x, X.LastShop.mainDoor.y, X.LastShop.mainDoor.z)
											X.Charging = false
										else
											ESX.ShowNotification(Local.trailerNotAllowed)
										end
									end, X.Trim(plate))
								else
									ESX.ShowNotification(Local.dontHaveAnyVehicle)
								end
							end
						end
					end
				end
			end
		end

		-------
		--MINA--
		-------
		local distanceMine = X.Get3DDistance(Config.Blips.mine.x,Config.Blips.mine.y,Config.Blips.mine.z,coords.x,coords.y,coords.z)
	    if distanceMine > Config.DistanceToRemoveThePickaxe then
	    	if GetCurrentPedWeapon(GetPlayerPed(-1),"WEAPON_POOLCUE",true) then
	        	RemoveWeaponFromPed(GetPlayerPed(-1),"WEAPON_POOLCUE")
	    	end
	    else
	    	X.CanPick(coords)
	    	if distanceMine < 50 then
	    		X.DrawMarker(1,Config.Blips.mine.x,Config.Blips.mine.y,Config.Blips.mine.z,132, 23,255,1.5001, 1.5001, 1.5001)
	        	if distanceMine < 1.5 then
	          		X.DisplayHelpText(Local.getPickAxe)
	          		if IsControlJustReleased(1,38) then
	              		GiveWeaponToPed(GetPlayerPed(-1),"WEAPON_POOLCUE",1,false,true)
	          		end
	        	end
	      	end
	    end
	    if X.Get3DDistance(coords.x,coords.y,coords.z,Config.Blips.fundition.x,Config.Blips.fundition.y,Config.Blips.fundition.z) < 1.5 then
	      	X.DrawText3D({x = Config.Blips.fundition.x, y = Config.Blips.fundition.y, z = Config.Blips.fundition.z}, Local.goFundition)
	      	if IsControlJustReleased(1,38) and X.IsFunding == false then
	       		X.OpenFundition()
	      	end
	    end

	    --------------
		--ASERRADERO--
		--------------
		local distanceWood = X.Get3DDistance(Config.Blips.sawmill.x,Config.Blips.sawmill.y,Config.Blips.sawmill.z,coords.x,coords.y,coords.z)
	    if distanceWood > Config.DistanceToRemoveTheAxe then
	    	if GetCurrentPedWeapon(GetPlayerPed(-1),"WEAPON_HATCHET",true) then
	        	RemoveWeaponFromPed(GetPlayerPed(-1),"WEAPON_HATCHET")
	    	end
	    else
	    	X.CanPickW(coords)
	    	if distanceWood < 50 then
	    		X.DrawMarker(1,Config.Blips.sawmill.x,Config.Blips.sawmill.y,Config.Blips.sawmill.z,132, 23,255,1.5001, 1.5001, 1.5001)
	        	if distanceWood < 1.5 then
	          		X.DisplayHelpText(Local.getPickAxe)
	          		if IsControlJustReleased(1,38) then
	              		GiveWeaponToPed(GetPlayerPed(-1),"WEAPON_HATCHET",1,false,true)
	          		end
	        	end
	      	end
	    end
	    if X.Get3DDistance(coords.x,coords.y,coords.z,Config.Blips.woodProcesser.x,Config.Blips.woodProcesser.y,Config.Blips.woodProcesser.z) < 1.5 then
	      	X.DrawText3D({x = Config.Blips.woodProcesser.x, y = Config.Blips.woodProcesser.y, z = Config.Blips.woodProcesser.z}, Local.goProcesser)
	      	if IsControlJustReleased(1,38) and X.IsProcessing == false then
	       		X.OpenProcesser()
	      	end
	    end

	 	-----------
		--PLANTAS--
		-----------
	    --[[for k1,v1 in pairs(Config.PH) do
	    	local distancePH = X.Get3DDistance(v1.x,v1.y,v1.z,coords.x,coords.y,coords.z)
	    	if distancePH <= v1.radio then
	    		if Config.Plants[v1.id] then
				    for k,v in pairs(Config.Plants[v1.id]) do
				    	if X.IsPlanting == false then
					    	if X.Get3DDistance(coords.x,coords.y,coords.z,v.x,v.y,v.z) < 3.0 then
					    		X.Draw3DTextPlants(v)
					    		if IsControlJustReleased(1,38) and X.IsPlanting == false then
					    			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
				    				if closestDistance > 5.0 or closestDistance == -1 then
				    					if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
							    			if v.rot <= 0 then
							    				X.IsPlanting = true
							    				X.RemoveLowPlant({x = v.x, y = v.y, z = v.z + 1.55}, v.id, v.seed)
							    			elseif v.percent >= 100 then
							    				X.IsPlanting = true
							    				X.HarvestPlant({x = v.x, y = v.y, z = v.z + 1.55}, v.id, v.seed)
							    			end
							    		else
							    			ESX.ShowNotification(Local.downTheCar)
							    		end
						    		else
							    		ESX.ShowNotification(Local.playerNearby)
							    	end
					    		end
					    	end
					    end
				    end
				end
			end
	    end
	    for k,v in pairs(Config.NPCs) do
	    	if X.Get3DDistance(v.coords.x,v.coords.y,v.coords.z,coords.x,coords.y,coords.z) < 3.0 then
	    		X.DrawText3D({x = v.coords.x, y = v.coords.y, z = v.coords.z + 2}, v.msg)
	    		if IsControlJustReleased(1,38) and v.msg ~= nil then
	    			X[v.name]()
	    		end
	    	end
	    end]]--

	    --------
		--AGUA--
		--------
		--[[local distanceWater = X.Get3DDistance(Config.Blips.water.x,Config.Blips.water.y,Config.Blips.water.z,coords.x,coords.y,coords.z)
		if distanceWater < 50.0 then
			for k,v in pairs(Config.WaterPoints) do
				if X.Get3DDistance(v.x,v.y,v.z,coords.x,coords.y,coords.z) < 2.5 then
					X.Draw3DTextWater(v)
				end
			end
		end
		if Config.Valves then
			for k,v in pairs(Config.Valves) do
				if X.Get3DDistance(v.x,v.y,v.z,coords.x,coords.y,coords.z) < 2.5 then
					if v.isAvaliable == true then
						X.DrawText3D({x = v.x, y = v.y, z = v.z + 0.15}, "~w~["..Local.allow.."~w~]")
					else
						X.DrawText3D({x = v.x, y = v.y, z = v.z + 0.15}, "~w~["..Local.notAllow.."~w~]")
					end
					X.DrawText3D({x = v.x, y = v.y, z = v.z}, "~w~["..Local[v.name].."~w~]")
					if IsControlJustReleased(1,38) then
						if v.isAvaliable == true then
							local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
							print(closestDistance)
					    	if closestDistance > 5.0 or closestDistance == -1 then
					    		if X.IsDoingSomething == false then
					    			if v.name == 'greenpeaceAcept' and X.Capitalist == false then
					    				X.GreenPeace = true
					    				X.IsDoingSomething = true
						    			X.DoAction(v)
					    			elseif v.name == 'greenpeaceAcept' and X.Capitalist == true then 
					    				ESX.ShowNotification(Local.youAreCapitalist)
					    			elseif v.name == 'capitalistAccept' and X.GreenPeace == true then
					    				ESX.ShowNotification(Local.youAreGreenPeacer)
					    			elseif v.name == 'capitalistAccept' and X.GreenPeace == false then
					    				X.Capitalist = true
					    				X.IsDoingSomething = true
						    			X.DoAction(v)
						    		else
						    			X.Capitalist = true
					    				X.IsDoingSomething = true
						    			X.DoAction(v)
					    			end
					    		end
				    		else
					    		ESX.ShowNotification(Local.playerNearby)
					    	end
						else
							ESX.ShowNotification(Local.noActionAllow)
						end
					end
				end
			end
		end]]--
	end
end)

-----------------------------------
-----------NUI CALLBACKS-----------
-----------------------------------

RegisterNUICallback('NUIFocusOff', function()
    X.isOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({type = 'closeUI'})
end)

RegisterNUICallback('sell', function(data, cb)
	local myData = data
	local warehouse = data.companyName
    X.OpenSetMenu(warehouse)
end)

RegisterNUICallback('get', function(data, cb)
	local myData = data
	local warehouse = data.companyName
    X.OpenGetMenu(warehouse)
end)

-----------------------------------
-------------FUNCIONES-------------
-----------------------------------
X.GetPercent = function(actual, max)
	return X.Round(((actual * 100) / max), 1)
end

--[[X.IsAValidTruck = function()
	for i,v in pairs(Config.AvaliableTrucks) do
		if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey(v)) then 
			return true
		end
	end

	return false
end

X.IsAValidVan = function()
	for i,v in pairs(Config.AvaliableVans) do
		if IsVehicleModel(GetVehiclePedIsIn(GetPlayerPed(-1), true), GetHashKey(v)) then 
			return true
		end
	end

	return false
end

X.OpenWarehouse = function(warehouse)
    X.isOpen = true
    SetNuiFocus(true, true)
    SendNUIMessage({type = 'openNUI',
    storeName = warehouse.storeName,
    storeID = warehouse.storeID,
    wood  = X.GetPercent(warehouse.materials.wood, warehouse.maxMaterials.wood),
    food  = X.GetPercent(warehouse.materials.food, warehouse.maxMaterials.food),
    mine  = X.GetPercent(warehouse.materials.mine, warehouse.maxMaterials.mine),
    water = X.GetPercent(warehouse.materials.water, warehouse.maxMaterials.water)})
end

X.CloseWarehouse = function()
	X.isOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({type = 'closeUI'})
end]]--

X.Get3DDistance = function(x1, y1, z1, x2, y2, z2)
	local a = (x1 - x2) * (x1 - x2)
	local b = (y1 - y2) * (y1 - y2)
	local c = (z1 - z2) * (z1 - z2)
    return math.sqrt(a + b + c)
end

X.DrawMarker = function(typeOfMarker,x,y,z,r,g,b,sizeX,sizeY,SizeZ)
	DrawMarker(typeOfMarker, x, y, z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, sizeX,sizeY,SizeZ, r,g,b, 100, false, true, 2, true, false, false, false)
end

X.Round = function(value, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end

Citizen.CreateThread(function ()
	X.isOpen = false
    SetNuiFocus(false, false)
    SendNUIMessage({type = 'closeUI'})
end)

X.CreateWarehousesBlips = function()
	Citizen.CreateThread(function()
	    for _, info in pairs(Config.Warehouses) do
	      info.blip = AddBlipForCoord(info.mainDoor.x, info.mainDoor.y, info.mainDoor.z)
	      SetBlipSprite(info.blip, Config.BlipsWarehouses.id)
	      SetBlipDisplay(info.blip, 4)
	      SetBlipScale(info.blip, 1.3)
	      SetBlipColour(info.blip, Config.BlipsWarehouses.colour)
	      SetBlipAsShortRange(info.blip, true)
		  BeginTextCommandSetBlipName("STRING")
	      AddTextComponentString(info.storeName)
	      EndTextCommandSetBlipName(info.blip)
	    end
	end)
end

X.CreatePortsBlips = function()
	Citizen.CreateThread(function()
	    for _, info in pairs(Config.Ports) do
	      info.blip = AddBlipForCoord(info.x, info.y, info.z)
	      SetBlipSprite(info.blip, info.id)
	      SetBlipDisplay(info.blip, 4)
	      SetBlipScale(info.blip, 1.3)
	      SetBlipColour(info.blip, info.colour)
	      SetBlipAsShortRange(info.blip, true)
		  BeginTextCommandSetBlipName("STRING")
	      AddTextComponentString(info.name)
	      EndTextCommandSetBlipName(info.blip)
	    end
	end)
end

X.DisplayHelpText = function(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

X.startAnim = function(lib, anim)
  ESX.Streaming.RequestAnimDict(lib, function()
    TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
  end)
end

X.startScenario = function(anim)
	TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
end

X.DrawText3D = function(coords, text, size)
	local onScreen, x, y = World3dToScreen2d(coords.x, coords.y, coords.z)
	local camCoords      = GetGameplayCamCoords()
	local dist           = GetDistanceBetweenCoords(camCoords, coords.x, coords.y, coords.z, true)
	local size           = size

	if size == nil then
		size = 1
	end

	local scale = (size / dist) * 2
	local fov   = (1 / GetGameplayCamFov()) * 100
	local scale = scale * fov

	if onScreen then
		SetTextScale(0.0 * scale, 0.55 * scale)
		SetTextFont(0)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry('STRING')
		SetTextCentre(1)

		AddTextComponentString(text)
		DrawText(x, y)
	end
end

X.Trim = function(str)
	if str then 
		if type(str) ~= "string" then str = tostring(str) end
		return (str:gsub("^%s*(.-)%s*$", "%1"))
	end

	return ""
end

X.FinishWork = function()
	
end

X.ClearVars = function()
	X.LastShop = nil
	X.Material = nil
	X.ActualWarehouse = nil
	X.Option = nil
	X.IsSelecting = false
	X.IsCarrying = false
	X.IsBacking = false
	X.Tons = 0
	X.Distance = 0
	X.Charging = false
	X.IsChargingBox = false
end

X.SpawnPed = function(model, coords)
	model           = (tonumber(model) ~= nil and tonumber(model) or GetHashKey(model))
	local x = coords.x
	local y = coords.y
	local z = coords.z
	local h = coords.h

	Citizen.CreateThread(function()
		RequestModel(model)

		while not HasModelLoaded(model) do
			Citizen.Wait(1)
		end

		ped = CreatePed(5, model, x, y, z, h, false, false)
		FreezeEntityPosition(ped,true)
	end)
end

X.OpenSetMenu = function(id)
	local elements = {}

	ESX.TriggerServerCallback('reborn_jobs:getWarehouse', function(warehouse)
		X.LastShop = warehouse
	    table.insert(elements, {value = "wood" , valueLabel = Local.wood ,  material = X.LastShop.materials.wood, maxMaterial =  X.LastShop.maxMaterials.wood, label = "<span style='color: orange;'>Drewno</span><b> : "..X.LastShop.materials.wood.."/"..X.LastShop.maxMaterials.wood.."</b>"})
	    table.insert(elements, {value = "food" , valueLabel = Local.food ,  material = X.LastShop.materials.food, maxMaterial =  X.LastShop.maxMaterials.food, label = "<span style='color: green;'>Jedzenie</span><b> : "..X.LastShop.materials.food.."/"..X.LastShop.maxMaterials.food.."</b>"})
	    table.insert(elements, {value = "mine" , valueLabel = Local.mine ,  material = X.LastShop.materials.mine, maxMaterial =  X.LastShop.maxMaterials.mine, label = "<span style='color: yellow;'>Mineraly</span><b> : "..X.LastShop.materials.mine.."/"..X.LastShop.maxMaterials.mine.."</b>"})
	    table.insert(elements, {value = "water", valueLabel = Local.water,  material = X.LastShop.materials.water, maxMaterial = X.LastShop.maxMaterials.water, label = "<span style='color: cyan;'>Woda</span><b> : "..X.LastShop.materials.water.."/"..X.LastShop.maxMaterials.water.."</b>"})

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse', {
			title    = Local.warehouse,
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			if data.current.value then
				X.OpenMaterials(id, data.current.value)
			end
		end,
		function(data, menu)
			isMenuOpened = false
			menu.close()
		end
		)
    end, id)
end

X.OpenMaterials = function(id, material)
	local elements = {}

	for k,v in pairs(Config.Packages[material]) do
		table.insert(elements, {value = v, label = Local[v]} )
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'warehouse_packages', {
		title    = Local.warehouse,
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		if data.current.value then
			X.OpenGetterMenu(id, material, data.current.value)
		end
	end,
	function(data, menu)
		isMenuOpened = false
		menu.close()
	end
	)
end

X.OpenGetterMenu = function(id, material, item)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'warehouse_charge',
	{
		title = Local.sellToWarehouse,
	}, function(data, menu)
		local parameter = data.value
		local tons = tonumber(parameter)
		if tons then
			ESX.TriggerServerCallback('reborn_jobs:getWarehouse', function(warehouse)
				local quantityInWarehouse = warehouse.materials[material]
				local maxCapacity = warehouse.maxMaterials[material]
				if quantityInWarehouse + tons <= maxCapacity then
					TriggerServerEvent('reborn_jobs:fillWarehouses', id, material, item, tons)
				else
					ESX.ShowNotification(Local.noSpace)
				end
				menu.close()
			end, id)
		end
		ESX.UI.Menu.CloseAll()
	end, function(data, menu)
		menu.close()
	end)
end
------------------------------
-------------BLIPS------------
------------------------------
X.CreateDefaultBlips = function()
Citizen.CreateThread(function()
  Citizen.Wait(0)
  for _, info in pairs(Config.Blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 1.0)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end
end)
end

--------------------------------
-------------EVENTOS------------
--------------------------------

RegisterNetEvent('reborn_jobs:getDataClientsWoods')
AddEventHandler('reborn_jobs:getDataClientsWoods',function(data)
    Config.Woods = data
end)

RegisterNetEvent('pop_university:setMineLevel')
AddEventHandler('pop_university:setMineLevel',function(totalLevel)
    X.Level = totalLevel
end)

RegisterNetEvent('reborn_jobs:getDataClientsRocks')
AddEventHandler('reborn_jobs:getDataClientsRocks',function(data)
    Config.Rocks = data
end)

--[[RegisterNetEvent('reborn_jobs:plant')
AddEventHandler('reborn_jobs:plant', function(seed)
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	if not IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
		if X.IsPlanting == false then
			for k,v in pairs(Config.PH) do
				if X.Get3DDistance(v.x, v.y, v.z, coords.x, coords.y, coords.z) < v.radio then
					local minDistance = 999999.0
					if Config.Plants[v.id] ~= nil then
						for k1,v1 in pairs(Config.Plants[v.id]) do
							local distance = X.Get3DDistance(v1.x, v1.y, v1.z, coords.x, coords.y, coords.z)
							if distance < minDistance then
								minDistance = distance
							end
						end
					end
					if Config.Seeds[seed].distanceNeeded < minDistance or minDistance == 999999.0 then
						if X.IsThisSeedAllowed(seed, v) then
							TriggerServerEvent('reborn_jobs:plant', Config.Seeds[seed], coords.x, coords.y, coords.z, v.id)
							return nil
						else
							ESX.ShowNotification(Local.seedNotAllowed)
							return nil
						end
					else
						ESX.ShowNotification(Local.nearPlant)
						return nil
					end
				end
			end
		else
			ESX.ShowNotification(Local.youArePlating)
			return nil
		end
	else
		ESX.ShowNotification(Local.downTheCar)
		return nil
	end
	ESX.ShowNotification(Local.noPHNear)
end)

RegisterNetEvent('reborn_jobs:plantSeed')
AddEventHandler('reborn_jobs:plantSeed', function(seed, coords)
	X.IsPlanting = true
	X.Plant(seed, coords)
end)

RegisterNetEvent('reborn_jobs:refreshPlants')
AddEventHandler('reborn_jobs:refreshPlants', function(plants)
	Config.Plants = plants
end)

RegisterNetEvent('reborn_jobs:addWater')
AddEventHandler('reborn_jobs:addWater', function(quantity)
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	for k,v in pairs(Config.Plants) do
		for k1,v1 in pairs(v) do
			if X.Get3DDistance(v1.x, v1.y, v1.z, coords.x, coords.y, coords.z) < 3.0 then
				X.IsPlanting = true
				X.AddWater(v1.id, quantity)
				return nil
			end
		end
	end
	ESX.ShowNotification(Local.noPlantNear)
end)

RegisterNetEvent('reborn_jobs:addFertilizer')
AddEventHandler('reborn_jobs:addFertilizer', function(quantity)
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	for k,v in pairs(Config.Plants) do
		for k1,v1 in pairs(v) do
			if X.Get3DDistance(v1.x, v1.y, v1.z, coords.x, coords.y, coords.z) < 3.0 then
				X.IsPlanting = true
				X.AddFertilizer(v1.id, quantity)
				return nil
			end
		end
	end
	ESX.ShowNotification(Local.noPlantNear)
end)

--[[RegisterNetEvent('reborn_jobs:refreshWater')
AddEventHandler('reborn_jobs:refreshWater', function(water)
	Config.WaterPoints = water
end)

RegisterNetEvent('reborn_jobs:refreshValves')
AddEventHandler('reborn_jobs:refreshValves', function(valves)
	Config.Valves = valves
end)

RegisterNetEvent('reborn_jobs:takeWater')
AddEventHandler('reborn_jobs:takeWater', function(seed)
	local playerPed = PlayerPedId()
	local coords    = GetEntityCoords(playerPed)
	if X.IsDoingSomething == false then
		for k,v in pairs(Config.WaterPoints) do
			if X.Get3DDistance(v.x, v.y, v.z, coords.x, coords.y, coords.z) < 3.0 then
				X.GetWater(v)
				ESX.ShowNotification(Local.youAreRecolecting)
				return nil
			end
		end
	else
		ESX.ShowNotification(Local.youAreDoingSomething)
		return nil
	end
	ESX.ShowNotification(Local.noWaterPointsNearby)
end)

RegisterNetEvent('reborn_jobs:removePlant')
AddEventHandler('reborn_jobs:removePlant', function(coords)
	local object, distance = ESX.Game.GetClosestObject('', coords)
	ESX.Game.DeleteObject(object)
end)]]--