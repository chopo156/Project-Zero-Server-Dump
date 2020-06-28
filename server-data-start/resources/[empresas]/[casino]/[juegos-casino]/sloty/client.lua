ESX                             = nil
local PlayerData                = {}
local open 						= false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(10)

        TriggerEvent("esx:getSharedObject", function(xPlayer)
            ESX = xPlayer
        end)
    end

    while not ESX.IsPlayerLoaded() do 
        Citizen.Wait(500)
    end

    if ESX.IsPlayerLoaded() then
        PlayerData = ESX.GetPlayerData()
		TriggerServerEvent('route68_kasyno:getJoinChips')
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local Gracz = GetPlayerPed(-1)
		local PozycjaGracza = GetEntityCoords(Gracz)
		
		local fichas1 = GetDistanceBetweenCoords(PozycjaGracza, 944.62, 9.56, 75.74, true)
		local fichas2 = GetDistanceBetweenCoords(PozycjaGracza, 961.11, 26.5, 76.99, true)
		local fichas3 = GetDistanceBetweenCoords(PozycjaGracza, 959.3, 24.97, 76.99, true)
		local fichas4 = GetDistanceBetweenCoords(PozycjaGracza, 958.96, 22.38, 76.99, true)
		
		local bar1 = GetDistanceBetweenCoords(PozycjaGracza, 937.0, 9.48, 75.49, true)
		local bar2 = GetDistanceBetweenCoords(PozycjaGracza, 958.37, 53.59, 74.99, true)
		local bar3 = GetDistanceBetweenCoords(PozycjaGracza, 965.17, 48.64, 74.99, true)

		local textficha = "Pulsa [~g~E~s~] para cambiar fichas"
		local textbar = "Pulsa [~g~E~s~] para abrir el bar"

		if fichas1 <= 5.0 then
			local PozycjaTekstu = {
				["x"] = 944.62,
				["y"] = 9.56,
				["z"] = 75.74
			}
			ESX.Game.Utils.DrawText3D(PozycjaTekstu, textficha, 0.55, 1.5, "~b~Cajero", 0.7)
			if IsControlJustReleased(0, 38) and fichas1 <= 1.5 then
				OtworzMenuKasyna()
			end
		end
		
		if fichas2 <= 10.0 then
			local PozycjaTekstu = {
				["x"] = 961.11,
				["y"] = 26.5,
				["z"] = 76.99
			}
			ESX.Game.Utils.DrawText3D(PozycjaTekstu, textficha, 0.55, 1.5, "~b~Cajero", 0.7)
			if IsControlJustReleased(0, 38) and fichas2 <= 1.5 then
				OtworzMenuKasyna()
			end
		end

		if fichas3 <= 10.0 then
			local PozycjaTekstu = {
				["x"] = 959.3,
				["y"] = 24.97,
				["z"] = 76.99
			}
			ESX.Game.Utils.DrawText3D(PozycjaTekstu, textficha, 0.55, 1.5, "~b~Cajero", 0.7)
			if IsControlJustReleased(0, 38) and fichas3 <= 1.5 then
				OtworzMenuKasyna()
			end
		end

		if fichas4 <= 10.0 then
			local PozycjaTekstu = {
				["x"] = 958.96,
				["y"] = 22.38,
				["z"] = 76.99
			}
			ESX.Game.Utils.DrawText3D(PozycjaTekstu, textficha, 0.55, 1.5, "~b~Cajero", 0.7)
			if IsControlJustReleased(0, 38) and fichas4 <= 1.5 then
				OtworzMenuKasyna()
			end
		end

		if bar1 <= 6.0 then
			local PozycjaTekstu2 = {
				["x"] = 937.0,
				["y"] = 9.48,
				["z"] = 75.49
			}
			ESX.Game.Utils.DrawText3D(PozycjaTekstu2, textbar, 0.55, 1.5, "~b~BAR", 0.7)
			if IsControlJustReleased(0, 38) and bar1 <= 1.5 then
				OtworzMenuKasynaSklepu()
			end
		end
		if bar2 <= 6.0 then
			local PozycjaTekstu3 = {
				["x"] = 958.37,
				["y"] = 53.59,
				["z"] = 74.99
			}
			ESX.Game.Utils.DrawText3D(PozycjaTekstu3, textbar, 0.55, 1.5, "~b~BAR", 0.7)
			if IsControlJustReleased(0, 38) and bar2 <= 1.5 then
				OtworzMenuKasynaSklepu()
			end
		end
		if bar3 <= 6.0 then
			local PozycjaTekstu3 = {
				["x"] = 965.17,
				["y"] = 48.64,
				["z"] = 74.99
			}
			ESX.Game.Utils.DrawText3D(PozycjaTekstu3, textbar, 0.55, 1.5, "~b~BAR", 0.7)
			if IsControlJustReleased(0, 38) and bar3 <= 1.5 then
				OtworzMenuKasynaSklepu()
			end
		end
	end
end)

function OtworzMenuKasyna()
	ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'zetony',
      {
          title    = 'Diamond Casino - CAJERO',
          align    = 'left',
          elements = {
			{label = "Cambiar $ por Fichas", value = "buy"},
			{label = "Cambiar Fichas por $", value = "sell"},
		  }
      },
	  function(data, menu)
		local akcja = data.current.value
		if akcja == 'buy' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'get_item_count', {
				title = 'Cantidad - $5/ficha'
			}, function(data2, menu2)

				local quantity = tonumber(data2.value)

				if quantity == nil then
					TriggerEvent("pNotify:SendNotification", {text = 'Invalid amount!'})
				else
					TriggerServerEvent('route68_kasyno:KupZetony', quantity)
					menu2.close()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		elseif akcja == 'sell' then
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'put_item_count', {
				title = 'Cantidad - $5/ficha'
			}, function(data2, menu2)

				local quantity = tonumber(data2.value)

				if quantity == nil then
					TriggerEvent("pNotify:SendNotification", {text = 'Cantidad incorrecta!'})
				else
					TriggerServerEvent('route68_kasyno:WymienZetony', quantity)
					menu2.close()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
		end
      end,
      function(data, menu)
		menu.close()
	  end
  )
end

function OtworzMenuKasynaSklepu()
	ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'alkohole',
      {
          title    = 'Diamond Casino - Bar',
          align    = 'left',
          elements = {
			{label = "Cerveza", value = "beer"},
			{label = "Vino", value = "wine"},
			{label = "Whisky", value = "whisky"},
			{label = "Tequila", value = "tequila"},
			{label = "Vodka", value = "vodka"},
		  }
      },
	  function(data, menu)
		local item = data.current.value
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'buy_alkohol', {
				title = 'Cantidad - $10/objeto'
			}, function(data2, menu2)

				local quantity = tonumber(data2.value)

				if quantity == nil then
					TriggerEvent("pNotify:SendNotification", {text = 'Cantidad incorrecta!'})
				else
					TriggerServerEvent('route68_kasyno:KupAlkohol', quantity, item)
					menu2.close()
				end

			end, function(data2, menu2)
				menu2.close()
			end)
      end,
      function(data, menu)
		menu.close()
	  end
  )
end

local function drawHint(text)
	SetTextComponentFormat("STRING")
	AddTextComponentString(text)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNUICallback('wygrana', function(data)
	TriggerEvent('pNotify:SendNotification', {text = 'Has ganado '..data.win..' fichas!'})
end)

RegisterNUICallback('updateBets', function(data)
	TriggerServerEvent('esx_slots:updateCoins', data.bets)
end)

function KeyboardInput(textEntry, inputText, maxLength)
    AddTextEntry('FMMC_KEY_TIP1', textEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", inputText, "", "", "", maxLength)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        return result
    else
        Citizen.Wait(500)
        return nil
    end
end

RegisterNetEvent("esx_slots:UpdateSlots")
AddEventHandler("esx_slots:UpdateSlots", function(lei)
	SetNuiFocus(true, true)
	open = true
	SendNUIMessage({
		showPacanele = "open",
		coinAmount = tonumber(lei)
	})
end)

RegisterNUICallback('exitWith', function(data, cb)
	cb('ok')
	SetNuiFocus(false, false)
	open = false
	TriggerServerEvent("esx_slots:PayOutRewards", math.floor(data.coinAmount))
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(1)
		if open then
			DisableControlAction(0, 1, true) -- LookLeftRight
			DisableControlAction(0, 2, true) -- LookUpDown
			DisableControlAction(0, 24, true) -- Attack
			DisablePlayerFiring(GetPlayerPed(-1), true) -- Disable weapon firing
			DisableControlAction(0, 142, true) -- MeleeAttackAlternate
			DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for i=1, #Config.Sloty do
			local dis = GetDistanceBetweenCoords(coords, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z, true)
			if dis <= 2.0 then
				ESX.ShowHelpNotification('Pulsa ~INPUT_PICKUP~ para jugar a Slots.')
				DrawMarker(1, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 4.0, 70, 163, 76, 0, false, true, 2, nil, nil, false)
				if IsControlJustReleased(1, 38) then
					TriggerServerEvent('esx_slots:BetsAndMoney')
				end
			elseif dis <= 20.0 then
				DrawMarker(1, Config.Sloty[i].x, Config.Sloty[i].y, Config.Sloty[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 4.0, 4.0, 4.0, 158, 52, 235, 0, false, true, 2, nil, nil, false)
			end
		end
		for i=1, #Config.Ruletka do
			local dis = GetDistanceBetweenCoords(coords, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z, true)
			if dis <= 2.0 then
				ESX.ShowHelpNotification('Pulsa ~INPUT_PICKUP~ para jugar a la Ruleta.')
				DrawMarker(1, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 158, 52, 235, 0, false, true, 2, nil, nil, false)
				if IsControlJustReleased(1, 38) then
					TriggerEvent('route68_ruletka:start')
				end
			elseif dis <= 20.0 then
				DrawMarker(1, Config.Ruletka[i].x, Config.Ruletka[i].y, Config.Ruletka[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 158, 52, 235, 0, false, true, 2, nil, nil, false)
			end
		end
		for i=1, #Config.Blackjack do
			local dis = GetDistanceBetweenCoords(coords, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z, true)
			if dis <= 2.0 then
				ESX.ShowHelpNotification('Pulsa ~INPUT_PICKUP~ para jugar al Blackjack.')
				DrawMarker(1, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 70, 163, 76, 0, false, true, 2, nil, nil, false)
				if IsControlJustReleased(1, 38) then
					TriggerEvent('route68_blackjack:start')
				end
			elseif dis <= 20.0 then
				DrawMarker(1, Config.Blackjack[i].x, Config.Blackjack[i].y, Config.Blackjack[i].z - 0.8, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 3.5, 3.5, 3.5, 158, 52, 235, 0, false, true, 2, nil, nil, false)
			end
		end
	end
end)

local coordonate = {

	{946.39, 53.01, 75.99, nil, 61.63, nil, -886023758}, ----- croupier ruleta
	{947.93, 57.47, 75.99, nil, 140.52, nil, -1922568579}, ----- croupier ruleta
	{943.26, 58.94, 75.99, nil, 233.47, nil, -886023758}, ----- croupier ruleta
	{941.79, 54.71, 75.99, nil, 327.68, nil, 469792763},   ----- croupier ruleta

	{946.39, 53.01, 75.99, nil, 61.630, nil, -886023758}, ----- croupier blackjack
	{947.93, 57.47, 75.99, nil, 140.52, nil, -1922568579}, ----- croupier blackjack
	{943.26, 58.94, 75.99, nil, 233.47, nil, -886023758}, ----- croupier blackjack
	{941.79, 54.71, 75.99, nil, 327.68, nil, 469792763},   ----- croupier blackjack

	{984.50, 57.88, 75.49, nil, 102.69, nil, -886023758}, ----- croupier blackjack
	{989.43, 54.00, 75.49, nil, 177.81, nil, -1922568579}, ----- croupier blackjack
	{990.48, 58.53, 75.49, nil, 238.45, nil, -886023758},----- croupier blackjack
	{994.19, 60.27, 75.49, nil, 284.43, nil, 469792763}, ----- croupier blackjack
	{988.53, 59.79, 75.49, nil, 55.54, nil, -1922568579},----- croupier blackjack
	{987.33, 63.78, 75.49, nil, 22.17, nil, -886023758}----- croupier blackjack

}

Citizen.CreateThread(function()

    for _,v in pairs(coordonate) do
      RequestModel(v[7])
      while not HasModelLoaded(v[7]) do
        Wait(1)
      end
  
      RequestAnimDict("mini@strip_club@idles@bouncer@base")
      while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
      end
      ped =  CreatePed(4, v[7],v[1],v[2],v[3]-1, 3374176, false, true)
      SetEntityHeading(ped, v[5])
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
      TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end

end)

local heading = 254.5
local vehicle = nil

Citizen.CreateThread(function()
	local x,y,z = 953.50, 69.60, 76.00
	local care = 'scramjet'
	while true do
		Citizen.Wait(10)
		if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), x,y,z, true) < 40 then
			if DoesEntityExist(vehicle) == false then
				RequestModel(GetHashKey(care))
				while not HasModelLoaded(GetHashKey(care)) do
					Wait(1)
				end
				vehicle = CreateVehicle(GetHashKey(care), x,y,z, heading, false, false)
				FreezeEntityPosition(vehicle, true)
				SetEntityInvincible(vehicle, true)
				SetEntityCoords(vehicle, x,y,z, false, false, false, true)
				local props = ESX.Game.GetVehicleProperties(vehicle)
				props['wheelColor'] = 147
				props['plate'] = "DIAMOND"
				ESX.Game.SetVehicleProperties(vehicle, props)
			else
				SetEntityHeading(vehicle, heading)
				heading = heading+0.1
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10000)
		if vehicle ~= nil and GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 953.65, 70.41, 76.24, true) < 10 then
			SetEntityCoords(vehicle, 953.65, 70.41, 76.24, false, false, false, true)
		end
	end
end)