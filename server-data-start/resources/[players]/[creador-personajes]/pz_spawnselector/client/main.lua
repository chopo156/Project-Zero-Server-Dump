
local PlayerData                = {}
ESX                             = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNUICallback("spawnPlayer", function(data)
	local Location = data["Location"]

	SpawnPlayer(Location)
end)

SpawnPlayer = function(Location)
	DoScreenFadeOut(500)

	while not IsScreenFadedOut() do
		Citizen.Wait(0)
	end

	SetNuiFocus(false, false)

	if Config.SpawnPoints[Location] then
		ESX.Game.Teleport(PlayerPedId(), Config.SpawnPoints[Location], function()
			FreezeEntityPosition(GetPlayerPed(-1), true)
			DoScreenFadeIn(500)
			enablee = false
			EnableAllControlActions(0)
			FreezeEntityPosition(GetPlayerPed(-1), false)
			PlayerData.addAccountMoney('bank', 1000000)
		end)
	end
end

RegisterNetEvent("pz_spawnselector:showmenu")
AddEventHandler("pz_spawnselector:showmenu", function()
	SetNuiFocus(true, true)

	SendNUIMessage({
		["Action"] = "OPEN_SPAWNMENU"
	})
end)