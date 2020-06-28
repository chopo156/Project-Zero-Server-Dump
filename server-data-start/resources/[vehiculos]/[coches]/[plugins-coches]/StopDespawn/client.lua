ESX              = nil

Citizen.CreateThread(function()
	while ESX == nil do
		Citizen.Wait(10)
		TriggerEvent("esx:getSharedObject", function(obj)
			ESX = obj
		end)
	end
	Wait(1000)
	while not ESX.IsPlayerLoaded() do
		Citizen.Wait(10)
	end

	Citizen.Wait(2000)
	ESX.TriggerServerCallback('new_hud:getConnectedPlayers', function(connectedPlayers)
		UpdatePlayerTable(connectedPlayers)
	end)
end)

function UpdatePlayerTable(connectedPlayers)
	local players = 0 -- Añadir aqui los trabajos

	for k,v in pairs(connectedPlayers) do
		players = players + 1
	end
	print(players)
	if players == 1 then
		TriggerServerEvent("firstSpawn")
	end
end

-- Debug printer
function dprint(msg)
	if debugMode then
		print(msg)
	end
end

Citizen.CreateThread(function()
	while true do
		local vehicle = GetVehiclePedIsEntering(GetPlayerPed(-1))
		SetEntityAsMissionEntity(vehicle, true, false)
		Citizen.Wait(0)
	end
end)

-- AddEventHandler("playerSpawned", function()
-- 	local onlinePlayers = 0
-- 	print(onlinePlayers)
-- 	for i = 0, 127 do
-- 		if NetworkIsPlayerActive(i) then
-- 			onlinePlayers = onlinePlayers+1
-- 		end
-- 	end
-- 	if onlinePlayers == 1 then
-- 		TriggerServerEvent("firstSpawn")
-- 		dprint('First Spawn Cars')
--  	end

-- 	-- local test = ESX.Game.GetPlayers(false, false, false)
-- 	print(test)
	
-- end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 		dprint('Empezando loop de testeo..................!')
-- 		TriggerServerEvent("firstSpawn")
-- 		Citizen.Wait(intervals.check*1000)
-- 		break
-- 	end
-- end)

RegisterNetEvent('spawncar')
AddEventHandler('spawncar', function(veh)

	dprint('Aqui spawneando')
	dprint(veh.pos)
	dprint(veh.owner)
	dprint(veh.plate)
	dprint(veh.vehicle)
	dprint(veh.model)
	dprint(veh.fuel)
	
	local owner = veh.owner
	local plate = veh.plate
	local vehicle = veh.vehicle
	local vPos = json.decode(veh.pos)
	local fuel = veh.fuel
	-- local vHealth = json.decode(veh.health)

	dprint('Aqui el modelito')
	dprint(tonumber(veh.model))
	dprint(vPos)
	dprint(vPos.x)
	dprint(vPos.y)
	dprint(vPos.z)

	LoadModel(tonumber(veh.model))

	local coche = CreateVehicle(tonumber(veh.model), vPos.x, vPos.y, vPos.z, veh.heading+0.1, true, false)

	SetVehicleHasBeenOwnedByPlayer(coche, true)
	ESX.Game.SetVehicleProperties(coche, vehicle)
	SetEntityAsMissionEntity(coche, true, false)
	
	SetVehicleLivery(coche, veh.livery)
	SetVehicleOnGroundProperly(coche)

	SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(coche), true)
	SetVehicleHasBeenOwnedByPlayer(coche, true)
	
	SetVehicleOnGroundProperly(coche)

	SetVehRadioStation(coche, 'OFF')
	SetModelAsNoLongerNeeded(coche)

	local vehicleLockState = GetVehicleDoorLockStatus(coche)

	Citizen.Wait(100)

	if vehicleLockState == 1 then
		SetVehicleDoorsLocked(coche, 2)
		SetVehicleDoorsLockedForAllPlayers(coche, false)
	end
		
	Citizen.Wait(100)


	if veh["windows"] then
		for windowId = 1, 13, 1 do
			if veh["windows"][windowId] == false then
				SmashVehicleWindow(coche, windowId)
			end
		end
	end

	if veh["tyres"] then
		for tyreId = 1, 7, 1 do
			if veh["tyres"][tyreId] ~= false then
				SetVehicleTyreBurst(coche, tyreId, true, 1000)
			end
		end
	end

	if veh["doors"] then
		for doorId = 0, 5, 1 do
			if veh["doors"][doorId] ~= false then
				SetVehicleDoorBroken(coche, doorId - 1, true)
			end
		end
	end
	
	Wait(100)
end)


RegisterNetEvent("StopDespawn:update")
AddEventHandler("StopDespawn:update", function(vehicle, estado)
	saveVeh(vehicle, estado)
end)



function saveVeh(vehicle, estado)
	local pos = {
		x = GetEntityCoords(vehicle).x,
		y = GetEntityCoords(vehicle).y,
		z = GetEntityCoords(vehicle).z
		}
	local heading = GetEntityHeading(vehicle)
	local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
	local playerplate = GetVehicleNumberPlateText(vehicle)
	local model = GetEntityModel(vehicle)
	local livery = GetVehicleLivery(vehicle)
	local fuel = GetVehicleFuelLevel(vehicle)

	vehicleProps["tyres"] = {}
	vehicleProps["windows"] = {}
	vehicleProps["doors"] = {}

	for id = 1, 7 do
		local tyreId = IsVehicleTyreBurst(vehicle, id, false)
	
		if tyreId then
			vehicleProps["tyres"][#vehicleProps["tyres"] + 1] = tyreId
	
			if tyreId == false then
				tyreId = IsVehicleTyreBurst(vehicle, id, true)
				vehicleProps["tyres"][ #vehicleProps["tyres"]] = tyreId
			end
		else
			vehicleProps["tyres"][#vehicleProps["tyres"] + 1] = false
		end
	end

	for id = 1, 13 do
		local windowId = IsVehicleWindowIntact(vehicle, id)

		if windowId ~= nil then
			vehicleProps["windows"][#vehicleProps["windows"] + 1] = windowId
		else
			vehicleProps["windows"][#vehicleProps["windows"] + 1] = true
		end
	end
	
	for id = 0, 5 do
		local doorId = IsVehicleDoorDamaged(vehicle, id)
	
		if doorId then
			vehicleProps["doors"][#vehicleProps["doors"] + 1] = doorId
		else
			vehicleProps["doors"][#vehicleProps["doors"] + 1] = false
		end
	end

	dprint(vehicle)
	dprint('Player plate: ' .. playerplate)

	if string.match(playerplate, "%a%a%a %d%d%d%d") then
		local playertype = "player"
		dprint('Matricula correcta... Saving')
		-- TriggerServerEvent('sd:save', vehicle, model, x, y, z, heading, playerplate)
		print(estado)
		TriggerServerEvent('sd:savedb', playerplate, pos, heading, playertype, model, estado, livery, fuel)
	else
		local playertype = "npc"
		dprint('Matricula robada...')
	end
end

function LoadModel(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		dprint('loadmodel?')
		Citizen.Wait(1)
	end
end


