--------------------------------
------- Created by Hamza -------
-------------------------------- 

local ESX = nil

local ExchangeTimer = {}
local GoldJobTimer = {}
local SmelteryTimer = {}

local NPC = 0

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	Citizen.Wait(1000)
	while true do
		NPC = math.random(1,#Config.MissionNPC)
		TriggerClientEvent("esx_PoliceMission:spawnNPC",-1,Config.MissionNPC[NPC])
		Citizen.Wait(7200000*2)
	end
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	TriggerClientEvent("esx_PoliceMission:spawnNPC",playerId,Config.MissionNPC[NPC])
end)

-- thread for syncing the cooldown timer
Citizen.CreateThread(function() -- do not touch this thread function!
	while true do
	Citizen.Wait(1000)
		for k,v in pairs(SmelteryTimer) do
			if v.time <= 0 then
				RemoveSmelteryTimer(v.MeltingTimer)
			else
				v.time = v.time - 1000
			end
		end
		for k,v in pairs(ExchangeTimer) do
			if v.timeExchange <= 0 then
				RemoveExchangeTimer(v.ExchangeTimer)
			else
				v.timeExchange = v.timeExchange - 1000
			end
		end
		for k,v in pairs(GoldJobTimer) do
			if v.timeGoldJob <= 0 then
				RemoveGoldJobTimer(v.GoldJobTimer)
			else
				v.timeGoldJob = v.timeGoldJob - 1000
			end
		end
	end
end)

-- server side function to get cooldown timer
ESX.RegisterServerCallback("esx_PoliceMission:getGoldJobCoolDown",function(source,cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if not CheckGoldJobTimer(GetPlayerIdentifier(source)) then
		cb(false)
	else
		TriggerClientEvent("esx:showNotification",source,string.format("Otro ~ y ~ trabajo ~ s ~ está ~ g ~ disponible ~ s ~ para usted en: ~ b ~% s ~ s ~ minutos",GetGoldJobTimer(GetPlayerIdentifier(source))))
		cb(true)
	end
end)

-- server side function to get payment
RegisterServerEvent('esx_PoliceMission:missionAccepted')
AddEventHandler('esx_PoliceMission:missionAccepted', function()
	TriggerClientEvent("esx_PoliceMission:startMission",source,0)
	TriggerEvent("esx_PoliceMission:GoldJobCooldown",source)
end)

-- server side function to accept the mission
ESX.RegisterServerCallback("esx_PoliceMission:getMissionavailability",function(source,cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local Players = ESX.GetPlayers()
	local policeOnline = 0
	for i = 1, #Players do
		local xPlayer = ESX.GetPlayerFromId(Players[i])
		if xPlayer["job"]["name"] == Config.PoliceDatabaseName then
			policeOnline = policeOnline + 1
		end
	end
	if policeOnline >= Config.RequiredPoliceOnline then
		cb(true)
	else
		cb(false)
		TriggerClientEvent('esx:showNotification', source, "Hay ~ r ~ no ~ s ~ suficientes ~ b ~ policías ~ s ~ en la ~ y ~ ciudad ~ s ~")
	end
end)

-- mission reward
RegisterServerEvent('esx_PoliceMission:reward')
AddEventHandler('esx_PoliceMission:reward', function(num)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		
	local itemAmount1 = ((math.random(Config.ItemMinAmount1,Config.ItemMaxAmount1)) * 100)
	local item1 = ESX.GetItemLabel(Config.ItemName1)
	
	local chance = math.random(1,Config.RandomChance)
	if chance == 1 then
		SecondItem = true	
	end
	
	xPlayer.addInventoryItem(Config.ItemName1,itemAmount1)
	if Config.EnableCustomNotification == true then
		TriggerClientEvent("esx_PoliceMission:missionComplete", source,itemAmount1,item1)
	else
		TriggerClientEvent('esx:showNotification', source, "~ g ~ Misión completada: ~ s ~ Has recibido ~b~"..itemAmount1.."x~s~ ~y~"..item1.."~s~")
	end
end)

RegisterServerEvent('esx_PoliceMission:GoldJobInProgress')
AddEventHandler('esx_PoliceMission:GoldJobInProgress', function(targetCoords, streetName)
	TriggerClientEvent('esx_PoliceMission:outlawNotify', -1,string.format("^3 Shots fired ^0 at ^5%s^0 and ongoing grand theft auto",streetName))
	TriggerClientEvent('esx_PoliceMission:GoldJobInProgress', -1, targetCoords)
end)

-- sync mission data
RegisterServerEvent("esx_PoliceMission:syncMissionData")
AddEventHandler("esx_PoliceMission:syncMissionData",function(data)
	TriggerClientEvent("esx_PoliceMission:syncMissionData",-1,data)
end)


-- ## DO NOT TOUCH BELOW THIS!! ## --


-- Functions for Mission Timer:
function RemoveGoldJobTimer(source)
	for k,v in pairs(GoldJobTimer) do
		if v.GoldJobTimer == source then
			table.remove(GoldJobTimer,k)
		end
	end
end
function GetGoldJobTimer(source)
	for k,v in pairs(GoldJobTimer) do
		if v.GoldJobTimer == source then
			return math.ceil(v.timeGoldJob/60000)
		end
	end
end
function CheckGoldJobTimer(source)
	for k,v in pairs(GoldJobTimer) do
		if v.GoldJobTimer == source then
			return true
		end
	end
	return false
end


