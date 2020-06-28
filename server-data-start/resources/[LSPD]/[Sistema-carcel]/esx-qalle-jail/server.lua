ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("unjail", function(src, args)

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer["job"]["name"] == "police" then

		local jailPlayer = args[1]

		if GetPlayerName(jailPlayer) ~= nil then
			UnJail(jailPlayer)
		else
			TriggerClientEvent("esx:showNotification", src, "Esta ID no esta online!")
		end
	else
		TriggerClientEvent("esx:showNotification", src, "No eres un policia!")
	end
end)

RegisterServerEvent("esx-qalle-jail:jailPlayer")
AddEventHandler("esx-qalle-jail:jailPlayer", function(targetSrc, jailTime, jailReason, jailType)
	
	local src = source
	

	JailPlayer(targetSrc, jailTime, jailType)

	GetRPName(targetSrc, function(Firstname, Lastname)
		TriggerClientEvent('chat:addMessage', -1, { args = { "JUEZ ",  Firstname .. " " .. Lastname .. " Esta ahora en prision por: " .. jailReason }, color = { 249, 166, 0 } })
		TriggerClientEvent("esx:showNotification", src, Firstname .. " " .. Lastname .. " Encarcelado por: " .. jailTime .. " meses!")
	end)
end)

RegisterServerEvent("esx-qalle-jail:unJailPlayer")
AddEventHandler("esx-qalle-jail:unJailPlayer", function(targetIdentifier)
	local src = source
	local xPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)

	if xPlayer ~= nil then
		UnJail(xPlayer.source)
	else
		MySQL.Async.execute(
			"UPDATE users SET jail = @newJailTime, jailtype = @newJailtype WHERE identifier = @identifier",
			{
				['@identifier'] = targetIdentifier,
				['@newJailTime'] = 0,
				['@newJailtype'] = "nojail"
			}
		)
	end

	TriggerClientEvent("esx:showNotification", src, xPlayer.name .. " Unjailed!")
end)

RegisterServerEvent("esx-qalle-jail:updateJailTime")
AddEventHandler("esx-qalle-jail:updateJailTime", function(newJailTime)
	local src = source

	EditJailTime(src, newJailTime)
end)

function JailPlayer(jailPlayer, jailTime,  jailType)
	TriggerClientEvent("esx-qalle-jail:jailPlayer", jailPlayer, jailTime, jailType)

	EditJailTime(jailPlayer, jailTime, jailType)
end

function UnJail(jailPlayer)
	TriggerClientEvent("esx-qalle-jail:unJailPlayer", jailPlayer, jailType)

	EditJailTime(jailPlayer, 0, "nojail")
end

function EditJailTime(source, jailTime, jailType)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier

	MySQL.Async.execute(
       "UPDATE users SET jail = @newJailTime, jailtype = @newJailtype WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newJailTime'] = tonumber(jailTime),
			['@newJailtype'] = jailType
		}
	)
end

function GetRPName(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier

	MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		data(result[1].firstname, result[1].lastname)

	end)
end

ESX.RegisterServerCallback("esx-qalle-jail:retrieveJailedPlayers", function(source, cb)
	
	local jailedPersons = {}

	MySQL.Async.fetchAll("SELECT firstname, lastname, jail, identifier FROM users WHERE jail > @jail", { ["@jail"] = 0 }, function(result)

		for i = 1, #result, 1 do
			table.insert(jailedPersons, { name = result[i].firstname .. " " .. result[i].lastname, jailTime = result[i].jail, identifier = result[i].identifier })
		end

		cb(jailedPersons)
	end)
end)

ESX.RegisterServerCallback("esx-qalle-jail:retrieveJailTime", function(source, cb)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT jail FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		local JailTime = tonumber(result[1].jail)

		if JailTime > 0 then

			cb(true, JailTime)
		else
			cb(false, 0)
		end

	end)
end)

ESX.RegisterServerCallback("esx-qalle-jail:retrieveJailType", function(source, cb)

	local src = source

	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier


	MySQL.Async.fetchAll("SELECT jailtype FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)

		local JoilType = jailtype

		if JoilType == "nojail" then

			cb(false, nojail)
		else
			cb(true, JoilType)
		end

	end)
end)