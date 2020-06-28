-- Simple 911 Command (With Location & Blip) -- 
		-- Made By Chezza --
ESX = nil
displayLocation = true  -- By Changing this to 'false' it will make it so your location is not displayed in chat --
blips = true -- By Changing this to 'false' it will disable 911 call blips meaning your location will not be shown on the map --
disableChatCalls = false -- By Chaning this to 'false' it will make it so 911 call are not displayed in chat (Recommended to have Discord Webhook setup if disabling this) --
webhookurl = 'https://discordapp.com/api/webhooks/614778341068898325/fET-PG5o8CvHtjuNBrdBddWyZ648InlsvjKTvXmPOdyNZh_5htwjAb9RezsW_bVWKFkR' -- Add your discord webhook url here, if you do not want this leave it blank (More info on FiveM post) --

-- Code --

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('911')
AddEventHandler('911', function(location, msg, x, y, z, name, ped)
	local playername = GetPlayerName(source)
	local ped = GetPlayerPed(source)
	local xPlayers = ESX.GetPlayers()

	if displayLocation == false then
		if disableChatCalls == false then
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('chat:addMessage', xPlayers[i], { 
					template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(14, 54, 140); border-radius: 3px;"><i style="margin-left: 5px;" class="fas fa-phone-square"></i>&nbsp;{0}</div>',
					args = {"^*^3911 ^*^1| ^*^2 Localizacion: ^r" .. location .. "^*^1| ^*^2 Denuncia: ^r" .. msg}})
				elseif xPlayer.job.name ~= 'police' then
					TriggerClientEvent('chat:addMessage', xPlayers[i], { 
					template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(14, 54, 140); border-radius: 3px;"><i style="margin-left: 5px;" class="fas fa-phone-square"></i>&nbsp;{0}</div>',
					args = {"^*^3911 ^*^1| ^*^2 Denuncia: ^r" .. msg}})
				end
			end
			sendDiscord('911 Communications', '**911 | Llamada de: **' .. playername .. '** | Report: **' .. msg)  
		else
			sendDiscord('911 Communications', '**911 | Llamada de: **' .. playername .. '** | Report: **' .. msg)  
		end
	else
		if disableChatCalls == false then
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'police' then
					TriggerClientEvent('chat:addMessage', xPlayers[i], { 
					template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(14, 54, 140); border-radius: 3px;"><i style="margin-left: 5px;" class="fas fa-phone-square"></i>&nbsp;{0}</div>',
					args = {"^*^3911 ^*^1| ^*^2 Localizacion: ^r" .. location .. "^*^1| ^*^2 Denuncia: ^r" .. msg}})
					elseif xPlayer.job.name ~= 'police' then
					TriggerClientEvent('chat:addMessage', xPlayers[i], { 
					template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(14, 54, 140); border-radius: 3px;"><i style="margin-left: 5px;" class="fas fa-phone-square"></i>&nbsp;{0}</div>',
					args = {"^*^3911 ^*^1| ^*^2 Denuncia: ^r" .. msg}})
				end
			end
			sendDiscord('911', '**911 | Llamada de: **' .. playername .. '** | Localizacion: **' .. location .. '** | Reporte: **' .. msg)
		else
			sendDiscord('911', '**911 | Llamada de: **' .. playername .. '** | Localizacion: **' .. location .. '** | Reporte: **' .. msg)
		end
		if blips == true then
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        		if xPlayer.job.name == 'police' then
					TriggerClientEvent('911:setBlip', xPlayers[i], name, x, y, z)
				end
			end
		end
	end
end)

function sendDiscord(name, message)
  	PerformHttpRequest(webhookurl, function(err, text, headers) end, 'POST', json.encode({username = name, content = message}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('entorno')
AddEventHandler('entorno', function(location, msg, x, y, z, name, ped)
	local playername = GetPlayerName(source)
	local ped = GetPlayerPed(source)
	local xPlayers = ESX.GetPlayers()

	if displayLocation == false then
		if disableChatCalls == false then
			TriggerClientEvent('chat:addMessage', -1, { 
				template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(70, 193, 158); border-radius: 3px;"><i style="margin-left: 5px;" class="fa fa-star-o"></i>&nbsp;{0}</div>',
				args = {"^*^3Entorno Global: ^*^1^r" .. msg}})

			sendDiscord('911 Communications', '**Entorno | Llamada de: **' .. playername .. '** | Report: **' .. msg)  
		else
			sendDiscord('911 Communications', '**Entorno | Llamada de: **' .. playername .. '** | Report: **' .. msg)  
		end
	else
		if disableChatCalls == false then
				TriggerClientEvent('chat:addMessage', -1, { 
					template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(70, 193, 158); border-radius: 3px;"><i style="margin-left: 5px;" class="fa fa-star-o"></i>&nbsp;{0}</div>',
					args = {"^*^3Entorno Global: ^*^1 ^r" .. msg}})

			sendDiscord('911', '**Entorno | Llamada de: **' .. playername .. '** | Localizacion: **' .. location .. '** | Reporte: **' .. msg)
		else
			sendDiscord('911', '**Entorno | Llamada de: **' .. playername .. '** | Localizacion: **' .. location .. '** | Reporte: **' .. msg)
		end
	end
end)

RegisterServerEvent('mecanico')
AddEventHandler('mecanico', function(location, msg, x, y, z, name, ped)
	local playername = GetPlayerName(source)
	local ped = GetPlayerPed(source)
	local xPlayers = ESX.GetPlayers()

	if displayLocation == false then
		if disableChatCalls == false then
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'mechanic' then
					TriggerClientEvent('chat:addMessage', xPlayers[i], { 
					template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(223, 100, 0); border-radius: 3px;"><i style="margin-left: 5px;" class="fas fa-phone-square"></i>&nbsp;{0}</div>',
					args = {"^rMecanico ^r| ^*^2 Localizacion: ^r" .. location .. "^r |^*^2 Aviso: ^r" .. msg}})
				elseif xPlayer.job.name ~= 'mechanic' then
					TriggerClientEvent('chat:addMessage', xPlayers[i], { 
					template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(223, 100, 0); border-radius: 3px;"><i style="margin-left: 5px;" class="fas fa-phone-square"></i>&nbsp;{0}</div>',
					args = {"^rMecanico ^r| ^*^2Aviso: ^r" .. msg}})
				end
			end
			sendDiscord('911 Communications', '**MECANICO | Llamada de: **' .. playername .. '** | Localizacion: **' .. location .. '** | Reporte: **' .. msg)
		else
			sendDiscord('911 Communications', '**MECANICO | Llamada de: **' .. playername .. '** | Localizacion: **' .. location .. '** | Reporte: **' .. msg)
		end
	else
		if disableChatCalls == false then
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
				if xPlayer.job.name == 'mechanic' then
					TriggerClientEvent('chat:addMessage', xPlayers[i], { 
					template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(223, 100, 0); border-radius: 3px;"><i style="margin-left: 5px;" class="fas fa-phone-square"></i>&nbsp;{0}</div>',
					args = {"^rMecanico ^r| ^*^2 Localizacion: ^r" .. location .. "^r |^*^2 Aviso: ^r" .. msg}})
					elseif xPlayer.job.name ~= 'mechanic' then
					TriggerClientEvent('chat:addMessage', xPlayers[i], { 
					template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(223, 100, 0); border-radius: 3px;"><i style="margin-left: 5px;" class="fas fa-phone-square"></i>&nbsp;{0}</div>',
					args = {"^rMecanico ^r| ^*^2Aviso: ^r" .. msg}})
				end
			end
			sendDiscord('911', '**MECANICO | Llamada de: **' .. playername .. '** | Localizacion: **' .. location .. '** | Reporte: **' .. msg)
		else
			sendDiscord('911', '**MECANICO | Llamada de: **' .. playername .. '** | Localizacion: **' .. location .. '** | Reporte: **' .. msg)
		end
		if blips == true then
			for i=1, #xPlayers, 1 do
				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        		if xPlayer.job.name == 'mechanic' then
					TriggerClientEvent('911:setBlipMecanico', xPlayers[i], name, x, y, z)
				end
			end
		end
	end
end)