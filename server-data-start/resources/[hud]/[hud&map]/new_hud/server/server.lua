ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addCommand', 'toggleui', function()
end, { help = _U('toggleui') })

RegisterServerEvent('new_hud:getServerInfo')
AddEventHandler('new_hud:getServerInfo', function()

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local job
	local jobgrade

	if xPlayer ~= nil then
		if xPlayer.job.label == xPlayer.job.grade_label then
			job = xPlayer.job.grade_label
			jobgrade = ''
		else
			job = xPlayer.job.label
			jobgrade = xPlayer.job.grade_label
		end
		
		local info = {
			job = job,
			jobgrade = jobgrade,
			money = xPlayer.getMoney(),
			-- vip = xPlayer.getAccount('vip').money,
			bankMoney = xPlayer.getAccount('bank').money,
			blackMoney = xPlayer.getAccount('black_money').money
		}

		TriggerClientEvent('new_hud:setInfo', source, info)
	end
end)

RegisterServerEvent('new_hud:syncCarLights')
AddEventHandler('new_hud:syncCarLights', function(status)
	TriggerClientEvent('new_hud:syncCarLights', -1, source, status)
end)

-- ONLINE

local connectedPlayers = {}

ESX.RegisterServerCallback('new_hud:getConnectedPlayers', function(source, cb)
	cb(connectedPlayers)
end)

-- Cuando alguien hace setJob
AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	connectedPlayers[playerId].job = job.name

	TriggerClientEvent('new_hud:updateConnectedPlayers', -1, connectedPlayers)
end)

-- Cuando un jugador entra al juego
AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	AddPlayerToScoreboard(xPlayer, true)
end)

-- Cuando un jugador sale del juego
AddEventHandler('esx:playerDropped', function(playerId)
	connectedPlayers[playerId] = nil

	TriggerClientEvent('new_hud:updateConnectedPlayers', -1, connectedPlayers)
end)

-- Cuando se lanza el resource
AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Citizen.CreateThread(function()
			Citizen.Wait(1000)
			AddPlayersToScoreboard()
		end)
	end
end)

-- Añadir un jugador al scoreboard
function AddPlayerToScoreboard(xPlayer, update)
	local playerId = xPlayer.source

	connectedPlayers[playerId] = {}
	connectedPlayers[playerId].id = playerId
	connectedPlayers[playerId].job = xPlayer.job.name

	if update then
		TriggerClientEvent('new_hud:updateConnectedPlayers', -1, connectedPlayers)
	end
end

-- Añadir a todos los jugadores
function AddPlayersToScoreboard()
	local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		AddPlayerToScoreboard(xPlayer, false)
	end

	TriggerClientEvent('new_hud:updateConnectedPlayers', -1, connectedPlayers)
end