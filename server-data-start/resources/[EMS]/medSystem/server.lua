ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('medSystem:print')
AddEventHandler('medSystem:print', function(medico, pulse, area, blood, x, y, z, bleeding)

	local _source = source
	
	local paramedic = ESX.GetPlayerFromId(medico)
	local xPlayer =  ESX.GetPlayerFromId(_source)
	local name = getIdentity(_source)
	Wait(100)
	local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			if xPlayers[i] == medico then
				TriggerClientEvent('medSystem:near', xPlayers[i] ,x ,y ,z , pulse, blood, area, bleeding)
			end
		end
end)

RegisterServerEvent('medSystem:print2')
AddEventHandler('medSystem:print2', function(medico, pulse, tablahuesos, blood, x, y, z, bleeding)

	local _source = source
	
	local paramedic = ESX.GetPlayerFromId(medico)
	local xPlayer =  ESX.GetPlayerFromId(_source)
	local name = getIdentity(_source)
	Wait(100)
	local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			if xPlayers[i] == medico then
				TriggerClientEvent('medSystem:near2', xPlayers[i] ,x ,y ,z , pulse, blood, tablahuesos, bleeding)
			end
		end
end)

RegisterServerEvent('medSystem:showdamageinfo')
AddEventHandler('medSystem:showdamageinfo', function(target)
	if target ~= nil then
		TriggerClientEvent('medSystem:senddamage', target, source)
	else
		ESX.ShowNotification('No hay un jugador cerca')
	end

end)

RegisterServerEvent('medSystem:showplayerinfo')
AddEventHandler('medSystem:showplayerinfo', function(target)
	if target ~= nil then
		TriggerClientEvent('medSystem:send', target, source)
	else
		ESX.ShowNotification('No hay un jugador cerca')
	end

end)

RegisterServerEvent('medSystem:applybandage')
AddEventHandler('medSystem:applybandage', function(target)
	if target ~= nil then
		TriggerClientEvent('medSystem:usodebenda', target)
	else
		TriggerClientEvent('medSystem:usodebenda', source)
	end

end)

RegisterServerEvent('medSystem:tratar')
AddEventHandler('medSystem:tratar', function(target, parte)
	if target ~= nil then
		TriggerClientEvent('medSystem:curar', target, parte)
	else
		ESX.ShowNotification('No hay un jugador cerca')
	end

end)

RegisterServerEvent('medSystem:tratar2')
AddEventHandler('medSystem:tratar2', function(parte)
	print('aqui llego')
	TriggerClientEvent('medSystem:curar2', source, parte)
end)

RegisterServerEvent('medSystem:tratar3')
AddEventHandler('medSystem:tratar3', function(parte1, parte2)
	print('aqui llego2')
	TriggerClientEvent('medSystem:curar2', source, parte1)
	TriggerClientEvent('medSystem:curar2', source, parte2)
end)



function getIdentity(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = xPlayer.identifier})
	if result[1] ~= nil then
		local identity = result[1]
		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
		}
	else
		return nil
	end
end