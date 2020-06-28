displayTime = 60 -- Changes how long the blip will show (In Seconds) [Default 2 Mins] --  
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Code --

RegisterServerEvent('esx_ref:referencia')
AddEventHandler('esx_ref:referencia', function(location, vehicle, player)
	local playername = GetPlayerName(source)
	-- print(location)
	-- print(vehicle)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('chat:addMessage', xPlayers[i], {template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(7, 2, 171); border-radius: 3px;"><i style="margin-left: 5px; font-weight:bold;" class="fas fa-phone-square"></i>&nbsp;{1}</div>', 
			args = {"^1LFPD",'^*^6LFPD: ^0Llamada de apoyo | ^9Ubicación: ^3' .. location }})
			TriggerClientEvent('esx_ref:setBlip', xPlayers[i], player, vehicle)
		end
	end
	
end)

RegisterServerEvent('esx_ref:killreferencia')
AddEventHandler('esx_ref:killreferencia', function(vehiculo)
	local playername = GetPlayerName(source)
	local ped = GetPlayerPed(source)
	local xPlayers = ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			TriggerClientEvent('esx_ref:killblip', xPlayers[i], vehiculo)
		end
	end
end)