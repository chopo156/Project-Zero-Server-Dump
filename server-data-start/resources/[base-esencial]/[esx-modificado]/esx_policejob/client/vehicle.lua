
local spawnedVehicles = {}
vehspawned = false
local matricula = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

	DisablePlayerVehicleRewards(GetPlayerPed(-1))
end)

function SetVehicleMaxMods(vehicle)

	local props = {
	  modEngine       = 3,
	  modBrakes       = 2,
	  modTransmission = 2,
	  modSuspension   = 3,
	  modTurbo        = true,
	}
  
	ESX.Game.SetVehicleProperties(vehicle, props)
  
end

function IsAVeh()
	local isAVeh = false
	local playerPed = GetPlayerPed(-1)
	for k,v in pairs(Config.Vehiculos) do
		if IsVehicleModel(GetVehiclePedIsUsing(playerPed), v.model) then
			isAVeh = true
			break
		end
	end
	return isAVeh
end

function IsAVeh2()
	local isAVeh2 = false
	local playerPed = GetPlayerPed(-1)
	for i=1, #Config.Helicopteros, 1 do
		if IsVehicleModel(GetVehiclePedIsUsing(playerPed), Config.Helicopteros[i]) then
			isAVeh2 = true
			break
		end
	end
	return isAVeh2
end

function StoreNearbyVehicle(playerCoords)

	ped = GetPlayerPed(-1)
	vehicle = GetVehiclePedIsIn(ped, false)
	ESX.Game.DeleteVehicle(vehicle)

end

function OpenVehicleSpawnerMenu(type, station, part, partNum)
	if type == 'car' then
		local playerCoords = GetEntityCoords(PlayerPedId())
		PlayerData = ESX.GetPlayerData()
		local elements = {
			{label = _U('garage_storeditem'), action = 'garage'},
			{label = _U('garage_storeitem'), action = 'store_garage'},
			-- {label = _U('garage_buyitem'), action = 'buy_vehicle'}
		}

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle', {
			title    = _U('garage_title'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			if data.current.action == 'garage' then
				local garaje = {}

				for k,v in pairs(Config.Vehiculos) do
					table.insert(garaje, {label = v.name, model = v.model})
				end

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_garage', {
					title    = _U('garage_title'),
					align    = 'top-left',
					elements = garaje
				},
				
				function(data2, menu2)

				local foundSpawn, spawnPoint = GetAvailableVehicleSpawnPoint(station, part, partNum)
				
				if vehspawned == false then
					ESX.Game.SpawnVehicle(data2.current.model, spawnPoint.coords, spawnPoint.heading, function(vehicle)
						SetVehicleMaxMods(vehicle)
						platenum = math.random(10000, 99999)
						SetVehicleNumberPlateText(vehicle, "LFP"..platenum)             
						vehspawned = true
						SetVehicleFuelLevel(vehicle, 100.0)
						matricula = "LFP"..platenum			
						TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
						menu2.close()   
					end)
				else
					ESX.ShowNotification(_U('yatienesunofuera'))
					menu2.close()
				end
				end,
				function(data2, menu2)
					menu2.close()
				end
				)			

			elseif data.current.action == 'store_garage' then
				local playerPed = GetPlayerPed(-1)
				if IsPedSittingInAnyVehicle(playerPed) and IsAVeh() then
				matriculaactual = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					if matricula == matriculaactual then
						StoreNearbyVehicle()
						vehspawned = false
					else
						ESX.ShowNotification(_U('noestucoche'))
					end
				end

			end
		end, function(data, menu)
			menu.close()
		end)

	elseif type == 'helicopter' then
		local playerCoords = GetEntityCoords(PlayerPedId())
		PlayerData = ESX.GetPlayerData()
		local elements = {
			{label = _U('garage_storeditem'), action = 'garage'},
			{label = _U('garage_storeitem'), action = 'store_garage'},
			-- {label = _U('garage_buyitem'), action = 'buy_vehicle'}
		}

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle', {
			title    = _U('garage_title'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			if data.current.action == 'garage' then
				local garajeheli = {}

				for i=1, #Config.Helicopteros, 1 do
					table.insert(garajeheli, {label = GetLabelText(GetDisplayNameFromVehicleModel(Config.Helicopteros[i])), value = Config.Helicopteros[i]})
				end

				ESX.UI.Menu.CloseAll()

				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_garage', {
					title    = _U('garage_title'),
					align    = 'top-left',
					elements = garajeheli
				},function(data2, menu2)
				local foundSpawn, spawnPoint = GetAvailableVehicleSpawnPoint(station, part, partNum)
				if vehspawned == false then
					ESX.Game.SpawnVehicle(data2.current.value, spawnPoint.coords, spawnPoint.heading, function(vehicle)
						platenum = math.random(10000, 99999)
						SetVehicleNumberPlateText(vehicle, "LFP"..platenum)             
						vehspawned = true
						matricula = "LFP"..platenum			
						TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)  
						menu2.close() 
					end)
				else
					ESX.ShowNotification(_U('yatienesunofuera'))
					menu2.close()
				end
				end,
				function(data2, menu2)
					menu2.close()
				end
				)			

			elseif data.current.action == 'store_garage' then
				local playerPed = GetPlayerPed(-1)
				if IsPedSittingInAnyVehicle(playerPed) and IsAVeh2() then
				matriculaactual = GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false))
					if matricula == matriculaactual then
						StoreNearbyVehicle()
						vehspawned = false
					else
						ESX.ShowNotification(_U('noestucoche'))
					end
				end

			end
		end, function(data, menu)
			menu.close()
		end)
	end
end

function IsAVeh()
	local isAVeh = false
	local playerPed = GetPlayerPed(-1)
	for k,v in pairs(Config.Vehiculos) do
		if IsVehicleModel(GetVehiclePedIsUsing(playerPed), v.model) then
			isAVeh = true
			break
		end
	end
	return isAVeh
end

function IsAVeh2()
	local isAVeh2 = false
	local playerPed = GetPlayerPed(-1)
	for i=1, #Config.Helicopteros, 1 do
		if IsVehicleModel(GetVehiclePedIsUsing(playerPed), Config.Helicopteros[i]) then
			isAVeh2 = true
			break
		end
	end
	return isAVeh2
end

function StoreNearbyVehicle(playerCoords)

	ped = GetPlayerPed(-1)
	vehicle = GetVehiclePedIsIn(ped, false)
	ESX.Game.DeleteVehicle(vehicle)
	
end

function GetAvailableVehicleSpawnPoint(station, part, partNum)
	local spawnPoints = Config.PoliceStations[station][part][partNum].SpawnPoints
	local found, foundSpawnPoint = false, nil

	for i=1, #spawnPoints, 1 do
		if ESX.Game.IsSpawnPointClear(spawnPoints[i].coords, spawnPoints[i].radius) then
			found, foundSpawnPoint = true, spawnPoints[i]
			break
		end
	end

	if found then
		return true, foundSpawnPoint
	else
		ESX.ShowNotification(_U('vehicle_blocked'))
		return false
	end
end

function OpenShopMenu(elements, restoreCoords, shopCoords)
	local playerPed = PlayerPedId()
	isInShopMenu = true

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop', {
		title    = _U('vehicleshop_title'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_shop_confirm', {
			title    = _U('vehicleshop_confirm', data.current.name, data.current.price),
			align    = 'top-left',
			elements = {
				{label = _U('confirm_no'), value = 'no'},
				{label = _U('confirm_yes'), value = 'yes'}
		}}, function(data2, menu2)
			if data2.current.value == 'yes' then
				local newPlate = exports['esx_vehicleshop']:GeneratePlate()
				local vehicle  = GetVehiclePedIsIn(playerPed, false)
				local props    = ESX.Game.GetVehicleProperties(vehicle)
				props.plate    = newPlate

				ESX.TriggerServerCallback('esx_policejob:buyJobVehicle', function (bought)
					if bought then
						ESX.ShowNotification(_U('vehicleshop_bought', data.current.name, ESX.Math.GroupDigits(data.current.price)))

						isInShopMenu = false
						ESX.UI.Menu.CloseAll()
						DeleteSpawnedVehicles()
						FreezeEntityPosition(playerPed, false)
						SetEntityVisible(playerPed, true)

						ESX.Game.Teleport(playerPed, restoreCoords)
					else
						ESX.ShowNotification(_U('vehicleshop_money'))
						menu2.close()
					end
				end, props, data.current.type)
			else
				menu2.close()
			end
		end, function(data2, menu2)
			menu2.close()
		end)
	end, function(data, menu)
		isInShopMenu = false
		ESX.UI.Menu.CloseAll()

		DeleteSpawnedVehicles()
		FreezeEntityPosition(playerPed, false)
		SetEntityVisible(playerPed, true)

		ESX.Game.Teleport(playerPed, restoreCoords)
	end, function(data, menu)
		DeleteSpawnedVehicles()
		WaitForVehicleToLoad(data.current.model)

		ESX.Game.SpawnLocalVehicle(data.current.model, shopCoords, 0.0, function(vehicle)
			table.insert(spawnedVehicles, vehicle)
			TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
			FreezeEntityPosition(vehicle, true)
			SetModelAsNoLongerNeeded(data.current.model)

			if data.current.props then
				ESX.Game.SetVehicleProperties(vehicle, data.current.props)
			end
		end)
	end)

	WaitForVehicleToLoad(elements[1].model)
	ESX.Game.SpawnLocalVehicle(elements[1].model, shopCoords, 0.0, function(vehicle)
		table.insert(spawnedVehicles, vehicle)
		TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
		FreezeEntityPosition(vehicle, true)
		SetModelAsNoLongerNeeded(elements[1].model)

		if elements[1].props then
			ESX.Game.SetVehicleProperties(vehicle, elements[1].props)
		end
	end)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if isInShopMenu then
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
		else
			Citizen.Wait(500)
		end
	end
end)

function DeleteSpawnedVehicles()
	while #spawnedVehicles > 0 do
		local vehicle = spawnedVehicles[1]
		ESX.Game.DeleteVehicle(vehicle)
		table.remove(spawnedVehicles, 1)
	end
end

function WaitForVehicleToLoad(modelHash)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) then
		RequestModel(modelHash)

		BeginTextCommandBusyspinnerOn('STRING')
		AddTextComponentSubstringPlayerName(_U('vehicleshop_awaiting_model'))
		EndTextCommandBusyspinnerOn(4)

		while not HasModelLoaded(modelHash) do
			Citizen.Wait(0)
			DisableAllControlActions(0)
		end

		BusyspinnerOff()
	end
end
