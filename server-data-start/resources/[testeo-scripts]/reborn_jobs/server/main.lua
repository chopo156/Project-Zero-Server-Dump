--[[
█▀▀█ █▀▀█ █▀▀█ ░░▀ █▀▀ █▀▀ ▀▀█▀▀   ▀▀█ █▀▀ █▀▀█ █▀▀█
█░░█ █▄▄▀ █░░█ ░░█ █▀▀ █░░ ░░█░░   ▄▀░ █▀▀ █▄▄▀ █░░█
█▀▀▀ ▀░▀▀ ▀▀▀▀ █▄█ ▀▀▀ ▀▀▀ ░░▀░░   ▀▀▀ ▀▀▀ ▀░▀▀ ▀▀▀▀

SCRIPT CREADO POR ByBlackDeath
DISCORD DEl CREADOR: ByBlackDeath#5528
]]--

-----------------------------------
-------------VARIABLES-------------
-----------------------------------
X = {}
ESX = nil
Trailers = {}
Warehouses = {
	--[[{
		storeName = "Centro de almacenes",
		storeID   = 1,
		materials = {
			wood      = 200,
	        food      = 200,
	        mine      = 200,
	        water     = 200,
		},
		maxMaterials = {
			wood      = 1000,
	        food      = 1000,
	        mine      = 1000,
	        water     = 1000,
		},
        mainDoor  = {
        	x = -219.51,
        	y = -1162.43,
        	z = 23.02
        },
        getCharge = {
        	x = -222.34,
        	y = -1181.58,
        	z = 23.03
        },
        spawnCharge = {
        	x = -235.51,
        	y = -1164.61,
        	z = 22.95,
        	h = 272.88
        },
        leaveCharge = {
        	x = -208.25,
        	y = -1182.4,
        	z = 23.03
        },
        getBox = {
        	x = -208.48,
        	y = -1177.44,
        	z = 22.98
        }
	}]]--
}
IDPlant = 1
local materials = {"wood","food","mine","water"}

-----------------------------------
-----------INICIALIZADOR-----------
-----------------------------------

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-----------------------------------
-------------TRANSLATES------------
-----------------------------------

Local = {
	addTrailer = "La carga se ha completado con éxito.",
	removeTrailer = "El desembalaje se ha completado con éxito.",
	someError  = "Ha ocurrido un error",
	get = "tienes",
	lingot_carbon = "Carbón procesado",
	lingot_iron = "Barra de hierro",
	lingot_silver = "Barra de plata",
	lingot_gold = "Barra de oro",
	youNeed10 = "Lo siento, pero te faltan productos, necesitas al menos 10 artículos.",
	pine_processed  = 'Madera procesada',
	youNeedASeed = "Necesitas grano",
	noMoney = "No tienes suficiente dinero",
	youBought = "Compraste el artículo",
	removeSalinity = "Eliminaste la salinidad del agua",
	removePollution = "Has eliminado la contaminación del agua",
	addChemists = "Agregaste químicos al agua",
	addSalinity = "Agregaste salinidad al agua",
	addPollution = "Contaminación del agua agregada",
	noBottles = "No tienes botellas de limpieza",
	goodWashing = "Has limpiado todas las botellas correctamente",
	noPieces = "No tienes suficientes piezas",
	goodPackage = "Has empacado todo correctamente",
	youDontHaveEnough = "No tienes suficiente material.",
	goodWarehouse = "Has vendido exitosamente tu material",
	youWin = "Ganaste dinero",
	fillwarehouse = "Llenar la tienda"
}

-----------------------------------
---------------CONFIG--------------
-----------------------------------

Config = {}
Config.Rocks = { --- 	{x = , y = , z = , health = , data = "", max = },
    {x = 2972.36, y = 2775.44, z = 39.24, health = 100, data = "carbon", max = 100},
    {x = 2968.64, y = 2775.64, z = 39.48, health = 25,  data = "gold", max = 25},
    {x = 2964.44, y = 2773.96, z = 40.04, health = 100, data = "carbon", max = 100},
    {x = 2951.16, y = 2768.52, z = 39.84, health = 40,  data = "silver", max = 40},
    {x = 2947.2, y = 2765.96, z = 40.36, health = 75, data = "iron", max = 75},
    {x = 2937.2, y = 2771.92, z = 39.88, health = 100, data = "carbon", max = 100},
    {x = 2927.28, y = 2792.41, z = 40.49, health = 25, data = "gold", max = 25},
    {x = 2925.56, y = 2796.48, z = 41.44, health = 40, data = "silver", max = 40},
    {x = 2921.44, y = 2799.32, z = 42.16, health = 75, data = "iron", max = 75},
    {x = 2938.52, y = 2812.64, z = 43.4, health = 25, data = "gold", max = 25  },
    {x = 2951.32, y = 2816.32, z = 42.92, health = 100, data = "carbon", max = 100},
    {x = 2971.96, y = 2798.68, z = 42.16, health = 75, data = "iron", max = 75},
    {x = 2979.08, y = 2790.48, z = 41.6, health = 40, data = "silver", max = 40},
	{x = -593.7, y = 2074.79, z = 131.31, health = 75, data = "piedra", max = 75},
	{x = -591.2, y = 2064.84, z = 131.2, health = 75, data = "piedra", max = 75},
	{x = -471.47, y = 2079.69, z = 120.44, health = 40, data = "nitrato", max = 40},
	{x = -467.55, y = 2072.13, z = 120.44, health = 40, data = "nitrato", max = 40},
	{x = -485.67, y = 1893.17, z = 120.03, health = 25, data = "azufre", max = 25},
	{x = -499.7, y = 1894.7, z = 120.70, health = 25, data = "azufre", max = 25},
	{x = 2990.32, y = 2776.57, z = 43.15, health = 60, data = "copper", max = 60},
	{x = 2998.8, y = 2758.88, z = 42.98, health = 60, data = "copper", max = 60},
	{x = 2982.98, y = 2764.91, z = 42.7, health = 50, data = "aluminium", max = 50},
	{x = 2954.92, y = 2757.5, z = 43.66, health = 50, data = "aluminium", max = 50},
}
Config.Woods = { 
	{x = -535.95, y = 5490.28, z = 65.21, health = 25, data = "pine", max = 25},
	{x = -557.61, y = 5419.43, z = 63.2, health = 25, data = "pine", max = 25},
	{x = -561.81, y = 5421.32, z = 62.17, health = 25, data = "pine", max = 25},
	{x = -577.57, y = 5427.06, z = 59.06, health = 25, data = "pine", max = 25},
	{x = -551.8, y = 5445.49, z = 64.1, health = 25, data = "pine", max = 25},
	{x = -586.12, y = 5447.83, z = 60.32, health = 25, data = "pine", max = 25},
	{x = -591.61, y = 5449.7, z = 59.6, health = 25, data = "pine", max = 25},
	{x = -594.04, y = 5451.61, z = 59.44, health = 25, data = "pine", max = 25},
	{x = -582.08, y = 5470.29, z = 59.48, health = 25, data = "pine", max = 25},
	{x = -577.1, y = 5468.9, z = 60.75, health = 25, data = "pine", max = 25},
	{x = -572.57, y = 5468.12, z = 61.43, health = 25, data = "pine", max = 25},
	{x = -560.16, y = 5460.29, z = 63.63, health = 25, data = "pine", max = 25},
	{x = -563.14, y = 5457.28, z = 63.15, health = 25, data = "pine", max = 25}
}
--[[Config.WaterPoints = {
	{id = 1, x = 1695.61, y = 45.24, z = 161.77, salinity = 40, chemists = 0, pollution = 40},
	{id = 2, x = 1696.32, y = 40.75, z = 161.77, salinity = 40, chemists = 0, pollution = 40},
	{id = 3, x = 1690.87, y = 39.44, z = 161.77, salinity = 40, chemists = 0, pollution = 40},
	{id = 4, x = 1684.76, y = 39.49, z = 161.77, salinity = 40, chemists = 0, pollution = 40},
	{id = 5, x = 1676.91, y = 38.42, z = 161.77, salinity = 40, chemists = 0, pollution = 40}
}
Config.Valves = {
	{id = 1, type = "salinity", quantity = 25, seconds = 60, x = 1665.29, y = -0.58, z = 166.12, name = "electricityDown", isAvaliable = true, animSeconds = 10, anim = 'WORLD_HUMAN_HAMMERING'},
	{id = 2, type = "pollution", quantity = 25, seconds = 60, x = 1666.72, y = -62.66, z = 174.17, name = "catCall", isAvaliable = true, animSeconds = 5, anim = {lib = 'timetable@jimmy@doorknock@', anim = 'knockdoor_idle'}},
	{id = 3, type = "pollution", quantity = 100, seconds = 300, x = 1664.64, y = -28.04, z = 196.94, name = "greenpeaceAcept", isAvaliable = true, animSeconds = 10, anim = {lib = "anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", anim = "high_center"}},
	{id = 4, type = "pollution", quantity = -100, seconds = 3600, x = 1660.83, y = -24.74, z = 173.77, name = "capitalistAccept", isAvaliable = true, animSeconds = 10, anim = 'WORLD_HUMAN_SMOKING'},
	{id = 5, type = "chemists", quantity = 50, seconds = 150, x = 1928.47, y = 592.85, z = 175.67, name = "toxic1", isAvaliable = true, animSeconds = 10, anim = {lib = "mini@repair", anim = "fixing_a_ped"}},
	{id = 6, type = "salinity", quantity = -25, seconds = 600, x = 1877.00, y = 288.48, z = 164.305, name = "salinity1", isAvaliable = true, animSeconds = 10, anim = 'WORLD_HUMAN_CONST_DRILL'},
	{id = 7, type = "salinity", quantity = 50, seconds = 150, x = 1718.81, y = -71.47, z = 171.78, name = "salinity2", isAvaliable = true, animSeconds = 10, anim = 'WORLD_HUMAN_GARDENER_LEAF_BLOWER'},
	{id = 8, type = "pollution", quantity = 30, seconds = 150, x = 1662.12, y = 23.09, z = 180.87, name = "pollution1", isAvaliable = true, animSeconds = 10, anim = 'WORLD_HUMAN_BINOCULARS'},
	{id = 9, type = "pollution", quantity = -40, seconds = 600, x = 1856.69, y = 236.66, z = 161.01 , name = "pollution2", isAvaliable = true, animSeconds = 10, anim = 'WORLD_HUMAN_BUM_WASH'},
	{id = 10, type = "chemists", quantity = 50, seconds = 150, x = 1664.74, y = 1.68, z = 173.77 , name = "chemist1", isAvaliable = true, animSeconds = 10, anim = 'WORLD_HUMAN_YOGA'},
	{id = 11, type = "pollution", quantity = 25, seconds = 150, x = 1672.83, y = -27.42, z = 173.77 , name = "pollution3", isAvaliable = true, animSeconds = 10, anim = 'WORLD_HUMAN_WELDING'},
	{id = 11, type = "salinity", quantity = 25, seconds = 150, x = 1917.33, y = 585.79, z = 176.37 , name = "salinity3", isAvaliable = true, animSeconds = 10, anim = 'WORLD_HUMAN_WELDING'},
}]]--
Config.Plants = {
	
}
Config.CycleGrowSeconds = 5
Config.CycleWaterSeconds = 14

 Config.BasePrices = {
 	bottleWater_package = 5400,
 	blueberry_package = 4600,
 	tomato_package = 4600,
 	lingot_carbon = 7800,
 	lingot_iron = 7400,
 	lingot_silver = 8200,
 	lingot_gold = 10300,
 	pine_processed = 4008
 } 
 Config.TonsPrice = 110
-----------------------------------
--------------EVENTOS--------------
-----------------------------------

ESX.RegisterServerCallback('reborn_jobs:getWarehouses', function(source, cb)
	cb(Warehouses)
end)

ESX.RegisterServerCallback('reborn_jobs:getWarehouse', function(source, cb, shop)
	cb(X.GetShop(shop))
end)

ESX.RegisterServerCallback('reborn_jobs:getMaterial', function(source, cb, shop, material)
	cb(X.GetMaterial(shop, material))
end)

ESX.RegisterServerCallback('reborn_jobs:getMaxMaterial', function(source, cb, shop, material)
	cb(X.GetMaxMaterial(shop, material))
end)

--[[ESX.RegisterServerCallback('reborn_jobs:getTrailers', function(source, cb)
	cb(Trailers)
end)

ESX.RegisterServerCallback('reborn_jobs:getTrailer', function(source, cb, plate)
	cb(X.GetTrailer(plate))
end)]]--

ESX.RegisterServerCallback('reborn_jobs:getRocks', function(source, cb)
	cb(Config.Rocks)
end)

ESX.RegisterServerCallback('reborn_jobs:getWoods', function(source, cb)
	cb(Config.Woods)
end)

--[[ESX.RegisterServerCallback('reborn_jobs:getPlants', function(source, cb)
	cb(Config.Plants)
end)

ESX.RegisterServerCallback('reborn_jobs:getWaterPoints', function(source, cb)
	cb(Config.WaterPoints)
end)

ESX.RegisterServerCallback('reborn_jobs:getValves', function(source, cb)
	cb(Config.Valves)
end)

ESX.RegisterServerCallback('reborn_jobs:haveMoney', function(source, cb, money)
	cb(nil)
end)

ESX.RegisterUsableItem('tomato_seed', function(source)
	TriggerClientEvent('reborn_jobs:plant', source, 'tomato_seed')
end)

ESX.RegisterUsableItem('blueberry_seed', function(source)
	TriggerClientEvent('reborn_jobs:plant', source, 'blueberry_seed')
end)

ESX.RegisterUsableItem('water_25', function(source)
	TriggerClientEvent('reborn_jobs:addWater', source, 25)
end)

ESX.RegisterUsableItem('water_50', function(source)
	TriggerClientEvent('reborn_jobs:addWater', source, 50)
end)

ESX.RegisterUsableItem('fertilizer_25', function(source)
	TriggerClientEvent('reborn_jobs:addFertilizer', source, 25)
end)

ESX.RegisterUsableItem('fertilizer_50', function(source)
	TriggerClientEvent('reborn_jobs:addFertilizer', source, 50)
end)

ESX.RegisterUsableItem('tomato_seed', function(source)
	TriggerClientEvent('reborn_jobs:plant', source, 'tomato_seed')
end)

ESX.RegisterUsableItem('tomato_seed', function(source)
	TriggerClientEvent('reborn_jobs:plant', source, 'tomato_seed')
end)

ESX.RegisterUsableItem('waterBottle', function(source)
	TriggerClientEvent('reborn_jobs:takeWater', source)
end)

RegisterServerEvent('reborn_jobs:addMaterial')
AddEventHandler('reborn_jobs:addMaterial', function(warehouse, material,quantity)
	X.AddMaterial(warehouse, material, quantity)
end)

RegisterServerEvent('reborn_jobs:removeMaterial')
AddEventHandler('reborn_jobs:removeMaterial', function(warehouse, material,quantity)
	X.RemoveMaterial(warehouse, material, quantity)
end)

RegisterServerEvent('reborn_jobs:setMaterial')
AddEventHandler('reborn_jobs:setMaterial', function(warehouse, material,quantity)
	X.SetMaterial(warehouse, material, quantity)
end)

RegisterServerEvent('reborn_jobs:addTrailer')
AddEventHandler('reborn_jobs:addTrailer', function(plate, tons)
	if X.AddTrailer(plate, tons) == true then
		TriggerClientEvent('esx:showNotification', source, Local.addTrailer)
	else
		TriggerClientEvent('esx:showNotification', source, Local.someError)
	end
end)

RegisterServerEvent('reborn_jobs:removeTrailer')
AddEventHandler('reborn_jobs:removeTrailer', function(plate)
	if X.RemoveTrailer(plate) == true then
		TriggerClientEvent('esx:showNotification', source, Local.removeTrailer)
	else
		TriggerClientEvent('esx:showNotification', source, Local.someError)
	end
end)]]--

RegisterServerEvent('reborn_jobs:giveMineral')
AddEventHandler('reborn_jobs:giveMineral', function(mineral)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer then
		xPlayer.addInventoryItem(mineral.."_piece", 1)
	end
end)

RegisterServerEvent('reborn_jobs:getData')
AddEventHandler('reborn_jobs:getData',function(data)
	Rocks = data
	TriggerClientEvent('reborn_jobs:getDataClients',-1,Rocks)
end)

RegisterServerEvent('reborn_jobs:getJob')
AddEventHandler('reborn_jobs:getJob',function()
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer then
		TriggerClientEvent('reborn_jobs:setJob',source,xPlayer.job.name)
	end
end)

RegisterServerEvent('reborn_jobs:craft')
AddEventHandler('reborn_jobs:craft',function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local quantityMineral = xPlayer.getInventoryItem(item.."_piece")
		if quantityMineral.count >= 10 then
			xPlayer.removeInventoryItem(item.."_piece",10)
			xPlayer.addInventoryItem("lingot_"..item,2)
			TriggerClientEvent('esx:showNotification', source, Local.get..Local["lingot_"..item])
		else
			TriggerClientEvent('esx:showNotification', source, Local.youNeed10)
		end
	end
end)

RegisterServerEvent('pop_university:setMineLevel')
AddEventHandler('pop_university:setMineLevel',function(skills)
	local level = X.CalculateLevel(skills)
	TriggerClientEvent('pop_university:setMineLevel',source,level)
end)

RegisterServerEvent('reborn_jobs:giveWood')
AddEventHandler('reborn_jobs:giveWood', function(wood)
	local xPlayer  = ESX.GetPlayerFromId(source)
	if xPlayer then
		xPlayer.addInventoryItem(wood.."_wood", 1)
	end
end)

RegisterServerEvent('reborn_jobs:getDataWood')
AddEventHandler('reborn_jobs:getDataWood',function(data)
	Woods = data
	TriggerClientEvent('reborn_jobs:getDataClientsWoods',-1,Woods)
end)

RegisterServerEvent('reborn_jobs:craftWood')
AddEventHandler('reborn_jobs:craftWood',function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local quantityWood = xPlayer.getInventoryItem(item.."_wood")
		if quantityWood.count >= 10 then
			xPlayer.removeInventoryItem(item.."_wood",10)
			xPlayer.addInventoryItem(item.."_processed",5)
			TriggerClientEvent('esx:showNotification', source, Local.get..Local[item.."_processed"])
		else
			TriggerClientEvent('esx:showNotification', source, Local.youNeed10)
		end
	end
end)

--[[RegisterServerEvent('reborn_jobs:plant')
AddEventHandler('reborn_jobs:plant',function(seed, x, y, z, id)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local quantityWood = xPlayer.getInventoryItem(seed.seed)
		if quantityWood.count >= 1 then
			xPlayer.removeInventoryItem(seed.seed, 1)
			if seed.seed == "tomato_seed" then
				X.AddPant(seed, {x = x, y = y, z = z - 2.2}, source, id)
			elseif seed.seed == "blueberry_seed" then
				X.AddPant(seed, {x = x, y = y, z = z - 2.2}, source, id)
			else
				X.AddPant(seed, {x = x, y = y, z = z}, source, id)
			end
		else
			TriggerClientEvent('esx:showNotification', source, Local.youNeedASeed)
		end
	end
end)

RegisterServerEvent('reborn_jobs:removePlant')
AddEventHandler('reborn_jobs:removePlant',function(id, coords)
	for k,v in pairs(Config.Plants) do
		for k1, v1 in pairs(v) do
			if v1.id == id then
				table.remove(v, k1)
				TriggerClientEvent('reborn_jobs:removePlant', v1.source, coords)
			end
		end
	end
end)

RegisterServerEvent('reborn_jobs:addWater')
AddEventHandler('reborn_jobs:addWater',function(id, quantity)
	for k,v in pairs(Config.Plants) do
		for k1, v1 in pairs(v) do
			if v1.id == id then
				local plus = v1.water + quantity
				if plus > 100 then
					v1.water = 100
				else
					v1.water = v1.water + quantity
				end
			end
		end
	end
end)

RegisterServerEvent('reborn_jobs:addFertilizer')
AddEventHandler('reborn_jobs:addFertilizer',function(id, quantity)
	for k,v in pairs(Config.Plants) do
		for k1, v1 in pairs(v) do
			if v1.id == id then
				local plus = v1.fertilizer + quantity
				if plus > 100 then
					v1.fertilizer = 100
				else
					v1.fertilizer = plus
				end
			end
		end
	end
end)

RegisterServerEvent('reborn_jobs:harvestPlant')
AddEventHandler('reborn_jobs:harvestPlant',function(id, seed)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		for k,v in pairs(Config.Plants) do
			for k1, v1 in pairs(v) do
				if v1.id == id then
					table.remove(v, k1)
					local number = X.GetNumberOfPieces(seed.maxPlants, v1)
					xPlayer.addInventoryItem(seed.reward,number)
				end
			end
		end
	end
end)

RegisterServerEvent('reborn_jobs:buyItem')
AddEventHandler('reborn_jobs:buyItem',function(seed, price)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		if (price <= xPlayer.getMoney()) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(seed,1)
			TriggerClientEvent('esx:showNotification', source, Local.youBought)
		else
			TriggerClientEvent('esx:showNotification', source, Local.noMoney)
		end
	end
end)


RegisterServerEvent('reborn_jobs:doSomething')
AddEventHandler('reborn_jobs:doSomething',function(valve)
	local valveType = valve.type
	local quantity = valve.quantity
	if valveType == 'salinity' then
		if X.RemoveSalinity(quantity) then
			X.SetTimeValve(valve.id, valve.seconds)
			if quantity > 0 then
				TriggerClientEvent('esx:showNotification', source, Local.removeSalinity)
			else
				TriggerClientEvent('esx:showNotification', source, Local.addSalinity)
			end
		end
	elseif valveType == 'chemists' then
		if X.AddChemists(quantity) then
			X.SetTimeValve(valve.id, valve.seconds)
			if quantity > 0 then
				TriggerClientEvent('esx:showNotification', source, Local.addChemists)
			else
				TriggerClientEvent('esx:showNotification', source, Local.removeChemists)
			end
		end
	elseif valveType == 'pollution' then
		if X.RemovePollution(quantity) then
			X.SetTimeValve(valve.id, valve.seconds)
			if quantity > 0 then
				TriggerClientEvent('esx:showNotification', source, Local.removePollution)
			else
				TriggerClientEvent('esx:showNotification', source, Local.addPollution)
			end
		end
	end
end)

RegisterServerEvent('reborn_jobs:addWaterBottle')
AddEventHandler('reborn_jobs:addWaterBottle',function(point)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		if point.salinity > 40 then
			xPlayer.removeInventoryItem("waterBottle",1)
			xPlayer.addInventoryItem("salt_waterBottle",1)
			return true
		elseif point.pollution > 40 then
			xPlayer.removeInventoryItem("waterBottle",1)
			xPlayer.addInventoryItem("pollution_waterBottle",1)
			return true
		elseif point.chemists > 80 then
			xPlayer.removeInventoryItem("waterBottle",1)
			xPlayer.addInventoryItem("toxic_waterBottle",1)
			return true
		elseif point.chemists < 20 then
			xPlayer.removeInventoryItem("waterBottle",1)
			xPlayer.addInventoryItem("bactery_waterBottle",1)
			return true
		else
			xPlayer.removeInventoryItem("waterBottle",1)
			xPlayer.addInventoryItem("dirty_waterBottle",1)
			return true
		end
	end
end)

RegisterServerEvent('reborn_jobs:washBottles')
AddEventHandler('reborn_jobs:washBottles',function(point)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local bottles = xPlayer.getInventoryItem('dirty_waterBottle').count
		if bottles > 0 then
			xPlayer.removeInventoryItem("dirty_waterBottle",bottles)
			xPlayer.addInventoryItem("full_waterBottle",bottles)
			TriggerClientEvent('esx:showNotification', source, Local.goodWashing)
		else
			TriggerClientEvent('esx:showNotification', source, Local.noBottles)
		end
	end
end)

RegisterServerEvent('reborn_jobs:washSaltBottles')
AddEventHandler('reborn_jobs:washSaltBottles',function(point)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local bottles = xPlayer.getInventoryItem('salt_waterBottle').count
		if bottles > 0 then
			xPlayer.removeInventoryItem("salt_waterBottle",bottles)
			xPlayer.addInventoryItem("dirty_waterBottle",bottles)
			TriggerClientEvent('esx:showNotification', source, Local.goodWashing)
		else
			TriggerClientEvent('esx:showNotification', source, Local.noBottles)
		end
	end
end)

RegisterServerEvent('reborn_jobs:package')
AddEventHandler('reborn_jobs:package',function(from,to)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local pieces = xPlayer.getInventoryItem(from).count
		local rest = pieces % 10
		local totalPieces = pieces - rest
		print(totalPieces)
		if totalPieces >= 10 then
			xPlayer.removeInventoryItem(from,totalPieces)
			xPlayer.addInventoryItem(to,totalPieces / 10)
			TriggerClientEvent('esx:showNotification', source, Local.goodPackage)
		else
			TriggerClientEvent('esx:showNotification', source, Local.noPieces)
		end
	end
end)

RegisterServerEvent('reborn_jobs:fillWarehouses')
AddEventHandler('reborn_jobs:fillWarehouses',function(id, material, item, tons)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		local pieces = xPlayer.getInventoryItem(item).count
		
		if pieces >= tons then
			local shop = X.GetShop(id)
			local piecesWarehouse = shop.materials[material]
			local maxPieces = shop.maxMaterials[material]
			local percent = 1.2 - ((piecesWarehouse * 100) / maxPieces) / 100
			local money = tons * Config.BasePrices[item] * percent
			print(tons.."->"..percent.."->"..money.." | "..piecesWarehouse.."->"..maxPieces)
			xPlayer.addMoney(money)
			xPlayer.removeInventoryItem(item,tons)
			X.AddMaterial(id, material, tons)
			TriggerClientEvent('esx:showNotification', source, Local.goodWarehouse)
		else
			TriggerClientEvent('esx:showNotification', source, Local.youDontHaveEnough)
		end
	end
end)

RegisterServerEvent('reborn_jobs:payTons')
AddEventHandler('reborn_jobs:payTons', function ( tons )
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer then
		xPlayer.addMoney(tons * Config.TonsPrice)
		TriggerClientEvent('esx:showNotification', source, Local.youWin)
	end
end)]]--
-----------------------------------
-------------FUNCIONES-------------
-----------------------------------
--[[X.Round = function(value, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end

X.IsAValidMaterial = function(material)
	for k,v in pairs(materials) do
		if v == material then
			return true
		end
	end

	return false
end

X.IsAValidWarehouse = function(warehouse)
	for k,v in pairs(Warehouses) do
		if v.storeName == warehouse or v.storeID == warehouse then
			return true
		end
	end

	return false
end

X.GetShop = function(id)
	for k,v in pairs(Warehouses) do
		if v.storeID == id or v.storeName == id then
			return v
		end
	end

	return {}
end

X.AddMaterial = function(warehouse, material, quantity)
	if quantity > 0 and X.IsAValidMaterial(material) and X.IsAValidWarehouse(warehouse) then
		for i,v in pairs(Warehouses) do
			if v.storeName == warehouse or v.storeID == warehouse then
				total = v.materials[material] + quantity
				if total <= v.maxMaterials[material] then
					v.materials[material] = total
					return true
				end
			end
		end
	end
	return false
end

X.SetMaterial = function(warehouse, material, quantity)
	if quantity > 0 and X.IsAValidMaterial(material) and X.IsAValidWarehouse(warehouse) then
		for i,v in pairs(Warehouses) do
			if v.storeName == warehouse or v.storeID == warehouse then
				if quantity <= v.maxMaterials[material] and quantity > 0then
					v.materials[material] = quantity
					return true
				end
			end
		end
	end
	return false
end

X.RemoveMaterial = function(warehouse, material, quantity)
	if quantity > 0 and X.IsAValidMaterial(material) and X.IsAValidWarehouse(warehouse) then
		for i,v in pairs(Warehouses) do
			if v.storeName == warehouse or v.storeID == warehouse then
				total = v.materials[material] - quantity
				if total >= 0 then
					v.materials[material] = total
					return true
				end
			end
		end
	end
	return false
end

X.GetMaterial = function(warehouse, material)
	if X.IsAValidMaterial(material) and X.IsAValidWarehouse(warehouse) then
		for i,v in pairs(Warehouses) do
			if v.storeName == warehouse or v.storeID == warehouse then
				return v.materials[material]
			end
		end
	end
	return false
end

X.GetMaxMaterial = function(warehouse, material)
	if X.IsAValidMaterial(material) and X.IsAValidWarehouse(warehouse) then
		for i,v in pairs(Warehouses) do
			if v.storeName == warehouse or v.storeID == warehouse then
				return v.maxMaterials[material]
			end
		end
	end
	return false
end

X.GetTrailer = function(plate)
	for k,v in pairs(Trailers) do
		if v.plate == plate then
			return v
		end
	end

	return nil
end

X.GetIndexOfTrailer = function(plate)
	for k,v in pairs(Trailers) do
		if v.plate == plate then
			return k
		end
	end

	return nil
end

X.AddTrailer = function(plate, tons)
	if X.GetTrailer(plate) == nil then
		table.insert(Trailers, {plate = plate, tons = tons})
		return true
	end

	return false
end

X.RemoveTrailer = function(plate)
	local index = X.GetIndexOfTrailer(plate)
	if index ~= nil then
		table.remove(Trailers, index)
		return true
	end

	return false
end]]--

X.ReloadRocks = function()
	for i,v in pairs(Config.Rocks) do
		if v.health < v.max then
			v.health = v.health + 0.1
		end
	end
	TriggerClientEvent('reborn_jobs:getDataClientsRocks',-1,Config.Rocks)
end

X.ReloadWoods = function()
	for i,v in pairs(Config.Woods) do
		if v.health < v.max then
			v.health = v.health + 0.1
		end
	end
	TriggerClientEvent('reborn_jobs:getDataClientsWoods',-1,Config.Woods)
end

X.StartReloads = function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1800000000)
			X.ReloadRocks()
			X.ReloadWoods()
		end
	end)
end

--[[X.AddPant = function(seed, coords, source, id)
	if Config.Plants[id] == nil then
		Config.Plants[id] = {}
	end
	table.insert(Config.Plants[id], {id = IDPlant, source = source, rot = 100, seed = seed.seed, percent = -2, water = 27, fertilizer = 26, reward = seed.reward, x = coords.x, y = coords.y, z = coords.z})
	IDPlant = IDPlant + 1
	TriggerClientEvent('reborn_jobs:plantSeed', source, seed, coords)
	TriggerClientEvent('reborn_jobs:refreshPlants', -1, Config.Plants)
end

X.GrowPlants = function()
	for k,v in pairs(Config.Plants) do
		for k1, v1 in pairs(v) do
			if v1.water > 0 and v1.percent <= 100 then
				if v1.fertilizer ~= 0 then
					v1.percent = v1.percent + 1
					v1.water = v1.water - 1
					if v1.water % 2 == 0 then
						v1.fertilizer = v1.fertilizer - 1
					end
				else
					v1.water = v1.water - 1
				end
			else
				if v1.percent >= 100 then
					if v1.fertilizer > 0 then
						v1.fertilizer = v1.fertilizer - 1
					else
						v1.rot = v1.rot - 1
					end
				else
					if v1.fertilizer > 0 then
						v1.fertilizer = v1.fertilizer - 1
					end
					v1.rot = v1.rot - 5
				end

			end
		end
	end
	TriggerClientEvent('reborn_jobs:refreshPlants', -1, Config.Plants)
end

X.StartGrow = function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(Config.CycleGrowSeconds * 1000)
			X.GrowPlants()
		end
	end)
end]]--

X.GetNumberOfPieces = function(pieces, v)
	local number = pieces * X.Round((v.rot / 100), 0)
	return number
end

--[[X.StartWater = function()
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(Config.CycleWaterSeconds * 1000)
			X.ChangeWater()
		end
	end)
end

X.ChangeWater = function()
	for i,v in pairs(Config.WaterPoints) do
		if v.salinity >= 0 and v.salinity < 100 then
			v.salinity = v.salinity + 1
		end

		if v.chemists > 0 and v.chemists <= 100 then
			local random = math.random(0,100)
			if random > 50 and random <= 100 then
				v.chemists = v.chemists - 1
			end
		end

		if v.pollution >= 0 and v.pollution < 100 then
			local random = math.random(0,100)
			if random > 50 and random <= 100 then
				v.pollution = v.pollution + 1
			end
		end
	end
	TriggerClientEvent('reborn_jobs:refreshWater', -1, Config.WaterPoints)
end

X.RemoveSalinity = function(quantity)
	for k,v in pairs(Config.WaterPoints) do
		v.salinity = v.salinity - quantity
		if v.salinity < 0 then
			v.salinity = 0
		elseif v.salinity > 100 then
			v.salinity = 100
		end
	end
	return true
end

X.RemovePollution = function(quantity)
	for k,v in pairs(Config.WaterPoints) do
		v.pollution = v.pollution - quantity
		if v.pollution < 0 then
			v.pollution = 0
		elseif v.pollution > 100 then
			v.pollution = 100
		end
	end
	return true
end

X.AddChemists = function(quantity)
	for k,v in pairs(Config.WaterPoints) do
		v.chemists = v.chemists + quantity
		if v.chemists > 100 then
			v.chemists = 100
		elseif v.chemists < 0 then
			v.chemists = 0
		end
	end
	return true
end

X.SetIsAvaliable = function(id, bool)
	for k,v in pairs(Config.Valves) do
		if v.id == id then
			v.isAvaliable = bool
		end
	end
end

X.SetTimeValve = function(id, seconds)
	Citizen.CreateThread(function()
		X.SetIsAvaliable(id, false)
		TriggerClientEvent('reborn_jobs:refreshValves', -1, Config.Valves)
		Citizen.Wait(seconds * 1000)
		X.SetIsAvaliable(id, true)
		TriggerClientEvent('reborn_jobs:refreshValves', -1, Config.Valves)
	end)
end]]--
-------------------
--UNIVERSIDAD------
-------------------

X.CalculateLevel = function(skills)
	local level = 0
	for i,v in pairs(skills) do
		if v == "carbon" or v == "hierro" or v == "plata" or v == "oro" then
			level = level + 1
		end
	end
	return level
end

X.StartReloads()
--X.StartGrow()
--X.StartWater()


------------------------------------
--------------COMANDOS--------------
------------------------------------
--[[TriggerEvent('es:addGroupCommand', 'fillwarehouse', 'admin', function(source, args, user)
	local id = tonumber(args[1])
	local material = tonumber(args[2])
	local quantity = tonumber(args[3])
	
	if #args < 1 then
		if #args < 2 then
			if #args < 3 then
				X.AddMaterial(id, material, quantity)
			else
				TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Tienes que poner una cantidad.")
			end
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Tienes que poner un material.")
		end
	else
		TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Tienes que poner una ID.")
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1BIOHAZARD', 'Permisos insuficientes.' } })
end, {help = Local.fillwarehouse, params = {{name = "id", help = "ID"}, {name = "material", help = "material"}, {name = "quantity", help = "Quantity"}}})]]--
