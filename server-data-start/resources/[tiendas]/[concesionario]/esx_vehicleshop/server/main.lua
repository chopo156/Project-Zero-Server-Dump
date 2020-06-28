
ESX = nil
local categories, vehicles = {}, {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



Citizen.CreateThread(function()
	local char = Config.PlateLetters
	char = char + Config.PlateNumbers
	if Config.PlateUseSpace then char = char + 1 end

	if char > 8 then
		print(('[esx_vehicleshop] [^3WARNING^7] Plate character count reached, %s/8 characters!'):format(char))
	end
end)

function RemoveOwnedVehicle(plate)
	MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	})
end

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM vehicle_categories', {}, function(_categories)
		categories = _categories

		MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(_vehicles)
			vehicles = _vehicles

			for k,v in ipairs(vehicles) do
				for k2,v2 in ipairs(categories) do
					if v2.name == v.category then
						vehicles[k].categoryLabel = v2.label
						break
					end
				end
			end

			-- send information after db has loaded, making sure everyone gets vehicle information
			TriggerClientEvent('esx_vehicleshop:sendCategories', -1, categories)
			TriggerClientEvent('esx_vehicleshop:sendVehicles', -1, vehicles)
		end)
	end)
end)

function getVehicleLabelFromModel(model)
	for k,v in ipairs(vehicles) do
		if v.model == model then
			return v.name
		end
	end

	return
end

ESX.RegisterServerCallback('esx_vehicleshop:getCategories', function(source, cb)
	cb(categories)
end)

ESX.RegisterServerCallback('esx_vehicleshop:getVehicles', function(source, cb)
	cb(vehicles)
end)

ESX.RegisterServerCallback('esx_vehicleshop:buyVehicle', function(source, cb, model, plate)
	local xPlayer = ESX.GetPlayerFromId(source)
	local modelPrice

	for k,v in ipairs(vehicles) do
		if model == v.model then
			modelPrice = v.price
			break
		end
	end

	if modelPrice and xPlayer.getMoney() >= modelPrice then
		xPlayer.removeMoney(modelPrice)

		MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, state, stored, aparcado, garage) VALUES (@owner, @plate, @vehicle, 1, 0, 0, "A")', {
			['@owner']   = xPlayer.identifier,
			['@plate']   = plate,
			['@vehicle'] = json.encode({model = GetHashKey(model), plate = plate})
		}, function(rowsChanged)
			xPlayer.showNotification(_U('vehicle_belongs', plate))
			cb(true)
		end)
	else
		cb(false)
	end
end)


ESX.RegisterServerCallback('esx_vehicleshop:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items = xPlayer.inventory

	cb({items = items})
end)

ESX.RegisterServerCallback('esx_vehicleshop:isPlateTaken', function(source, cb, plate)
	MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
		['@plate'] = plate
	}, function(result)
		cb(result[1] ~= nil)
	end)
end)

-- function PayRent(d, h, m)
-- 	local tasks, timeStart = {}, os.clock()
-- 	print('[esx_vehicleshop] [^2INFO^7] Paying rent cron job started')

-- 	MySQL.Async.fetchAll('SELECT owner, rent_price, plate FROM rented_vehicles', {}, function(result)
-- 		for k,v in ipairs(result) do
-- 			table.insert(tasks, function(cb)
-- 				local xPlayer = ESX.GetPlayerFromIdentifier(v.owner)

-- 				if xPlayer then
-- 					if xPlayer.getAccount('bank').money >= v.rent_price then
-- 						xPlayer.removeAccountMoney('bank', v.rent_price)
-- 						xPlayer.showNotification(_U('paid_rental', ESX.Math.GroupDigits(v.rent_price), v.plate))
-- 					else
-- 						xPlayer.showNotification(_U('paid_rental_evicted', ESX.Math.GroupDigits(v.rent_price), v.plate))
-- 						UnrentVehicleAsync(v.owner, v.plate)
-- 					end
-- 				else
-- 					MySQL.Async.fetchScalar('SELECT accounts FROM users WHERE identifier = @identifier', {
-- 						['@identifier'] = v.owner
-- 					}, function(accounts)
-- 						if accounts then
-- 							local playerAccounts = json.decode(accounts)

-- 							if playerAccounts and playerAccounts.bank then
-- 								if playerAccounts.bank >= v.price then
-- 									playerAccounts.bank = playerAccounts.bank - v.price

-- 									MySQL.Async.execute('UPDATE users SET accounts = @accounts WHERE identifier = @identifier', {
-- 										['@identifier'] = v.owner,
-- 										['@accounts'] = json.encode(playerAccounts)
-- 									})
-- 								else
-- 									UnrentVehicleAsync(v.owner, v.plate)
-- 								end
-- 							end
-- 						end
-- 					end)
-- 				end

-- 				TriggerEvent('esx_addonaccount:getSharedAccount', 'society_cardealer', function(account)
-- 					account.addMoney(result[i].rent_price)
-- 				end)

-- 				cb()
-- 			end)
-- 		end

-- 		Async.parallelLimit(tasks, 5, function(results) end)

-- 		local elapsedTime = os.clock() - timeStart
-- 		print(('[esx_vehicleshop] [^2INFO^7] Paying rent cron job took %s seconds'):format(elapsedTime))
-- 	end)
-- end

-- TriggerEvent('cron:runAt', 22, 00, PayRent)