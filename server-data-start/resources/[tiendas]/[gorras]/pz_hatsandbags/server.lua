ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('pz_hatsandbags:saveOutfit')
AddEventHandler('pz_hatsandbags:saveOutfit', function(label, skin)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		table.insert(dressing, {
			label = label,
			skin  = skin
		})

		store.set('dressing', dressing)
	end)
end)

ESX.RegisterServerCallback('pz_hatsandbags:buyClothes', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Config.Price then
		xPlayer.removeMoney(Config.Price)
		TriggerClientEvent('esx:showNotification', source, "Has pagado 250$ ", Config.Price)
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('pz_hatsandbags:checkPropertyDataStore', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundStore = false

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		foundStore = true
	end)

	cb(foundStore)
end)


RegisterServerEvent('pz_hatsandbags:darmochila')
AddEventHandler('pz_hatsandbags:darmochila', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local mochi = xPlayer.getInventoryItem("bag")
	if mochi.count == 0 then 
		xPlayer.addInventoryItem("bag", 1)
	end
end)