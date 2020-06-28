local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil

PlayerData = {}

local jailTime = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(newData)
	PlayerData = newData

	Citizen.Wait(25000)

	ESX.TriggerServerCallback("esx-qalle-jail:retrieveJailTime", function(inJail, newJailTime)
		if inJail then

			jailTime = newJailTime

			ESX.TriggerServerCallback("esx-qalle-jail:retrieveJailType", function(inJail, JoilType)

				jailType = JoilType
			end)

			JailLogin(jailTime, jailType)
		end
	end)
	-- ESX.TriggerServerCallback("esx-qalle-jail:retrieveJailType", function(inJail, JoilType)
	-- 	if inJail then

	-- 		jailType = JoilType

	-- 		JailLogin()
	-- 	end
	-- end)
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(response)
	PlayerData["job"] = response
end)

RegisterNetEvent("esx-qalle-jail:openJailMenu")
AddEventHandler("esx-qalle-jail:openJailMenu", function()
	OpenJailMenu()
end)

RegisterNetEvent("esx-qalle-jail:jailPlayer")
AddEventHandler("esx-qalle-jail:jailPlayer", function(newJailTime, newjailType)
	jailTime = newJailTime
	jailType = newjailType

	Cutscene(jailType)
end)

RegisterNetEvent("esx-qalle-jail:unJailPlayer")
AddEventHandler("esx-qalle-jail:unJailPlayer", function()
	jailTime = 0

	UnJail()
end)

function JailLogin(jailTime, jailType)
	local juilTime = jailTime
	local juilType = jailType
	local reason = "La ultima vez te dormiste en la carcel, y aqui sigues"
	
	TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(closestPlayer), juilTime, reason, juilType)

	ESX.ShowNotification("La ultima vez te dormiste en la carcel, y aqui sigues!")

	InJail()
end

function UnJail(jailType)

	local PlayerPed = PlayerPedId()
	local curcel = jailType
	if curcel == "vespucci" then
		local vespci = Config.JailPositions.librevespucci
		
		SetEntityCoords(PlayerPed,  vespci.Location.x, vespci.Location.y, vespci.Location.z -1)
		SetEntityHeading(PlayerPed, vespci.Heading)

	elseif curcel == "misionrow" or curcel == "segurmisionrow" then
		local misrow = Config.JailPositions.librevespucci
		
		SetEntityCoords(PlayerPed,  misrow.Location.x, misrow.Location.y, misrow.Location.z -1)
		SetEntityHeading(PlayerPed, misrow.Heading)

	elseif curcel == "sandy" then
		local sand = Config.JailPositions.libresandy
		
		SetEntityCoords(PlayerPed,  sand.Location.x, sand.Location.y, sand.Location.z -1)
		SetEntityHeading(PlayerPed, sand.Heading)

	elseif curcel == "federal" or curcel == "segurfederal" then
		local fede = Config.JailPositions.librefederal
		
		SetEntityCoords(PlayerPed,  fede.Location.x, fede.Location.y, fede.Location.z -1)
		SetEntityHeading(PlayerPed, fede.Heading)
	end

	ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
	end)

	ESX.ShowNotification("Eres libre, portate bien!")
end

function InJail(jailType)

	--Jail Timer--

	Citizen.CreateThread(function()

		while jailTime > 0 do

			jailTime = jailTime - 1

			ESX.ShowNotification("Tienes " .. jailTime .. " minutos de carcel!")

			TriggerServerEvent("esx-qalle-jail:updateJailTime", jailTime, jailType)

			if jailTime == 0 then
				UnJail(jailType)

				TriggerServerEvent("esx-qalle-jail:updateJailTime", 0, nojail)
			end

			Citizen.Wait(60000)
		end

	end)

	--Jail Timer--
end

function OpenJailMenu()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'jail_prison_menu',
		{
			title    = "Menu de prision",
			align    = 'center',
			elements = {
				{ label = "Calabozo - Vespucci", value = "jail_vespucci"},
				{ label = "Calabozo - Mision Row", value = "jail_mision_row"},
				{ label = "Calabozo de seguridad - Mision Row", value = "jail_seguridad_row"},
				{ label = "Calabozo - Sandy Shore", value = "jail_sandy"},
				{ label = "Prision Federal", value = "jail_federal" },
				{ label = "Liberar de la carcel", value = "unjail_player" }
			}
		}, 
	function(data, menu)

		local action = data.current.value

		if action == "jail_vespucci" then
			jailType = "vespucci"
			menu.close()
			ESX.UI.Menu.Open(
          		'dialog', GetCurrentResourceName(), 'jail_choose_time_menu',
          		{
            		title = "Tiempo de encarcelamiento (minutos)"
          		},
          	function(data2, menu2)
            	local jailTime = tonumber(data2.value)
            	if jailTime == nil then
              		ESX.ShowNotification("El tiempo tiene que ser en minutos!")
            	else
              		menu2.close()
              		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
             		if closestPlayer == -1 or closestDistance > 3.0 then
                		ESX.ShowNotification("No hay jugadores cerca!")
					else
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'jail_choose_reason_menu',
							{
							  title = "Razon de carcel"
							},
						function(data3, menu3)
		  
						  	local reason = data3.value
		  
						  	if reason == nil then
								ESX.ShowNotification("Debes escribir algo!")
						  	else
								menu3.close()
		  
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		  
								if closestPlayer == -1 or closestDistance > 3.0 then
								  	ESX.ShowNotification("No hay jugadores cerca!")
								else
								  	TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(closestPlayer), jailTime, reason, jailType)
								end
		  
						  	end
		  
						end, function(data3, menu3)
							menu3.close()
						end)
              		end

				end

          	end, function(data2, menu2)
				menu2.close()
			end)
		elseif action == "jail_mision_row" then
			jailType = "misionrow"
			menu.close()
			ESX.UI.Menu.Open(
          		'dialog', GetCurrentResourceName(), 'jail_choose_time_menu',
          		{
            		title = "Tiempo de encarcelamiento (minutos)"
          		},
          	function(data2, menu2)
            	local jailTime = tonumber(data2.value)
            	if jailTime == nil then
              		ESX.ShowNotification("El tiempo tiene que ser en minutos!")
            	else
              		menu2.close()
              		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
             		if closestPlayer == -1 or closestDistance > 3.0 then
                		ESX.ShowNotification("No hay jugadores cerca!")
					else
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'jail_choose_reason_menu',
							{
							  title = "Razon de carcel"
							},
						function(data3, menu3)
		  
						  	local reason = data3.value
		  
						  	if reason == nil then
								ESX.ShowNotification("Debes escribir algo!")
						  	else
								menu3.close()
		  
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		  
								if closestPlayer == -1 or closestDistance > 3.0 then
								  	ESX.ShowNotification("No hay jugadores cerca!")
								else
								  	TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(closestPlayer), jailTime, reason, jailType)
								end
		  
						  	end
		  
						end, function(data3, menu3)
							menu3.close()
						end)
              		end

				end

          	end, function(data2, menu2)
				menu2.close()
			end)
		elseif action == "jail_seguridad_row" then
			jailType = "seguridad_misionrow"
			menu.close()
			ESX.UI.Menu.Open(
          		'dialog', GetCurrentResourceName(), 'jail_choose_time_menu',
          		{
            		title = "Tiempo de encarcelamiento (minutos)"
          		},
          	function(data2, menu2)
            	local jailTime = tonumber(data2.value)
            	if jailTime == nil then
              		ESX.ShowNotification("El tiempo tiene que ser en minutos!")
            	else
              		menu2.close()
              		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
             		if closestPlayer == -1 or closestDistance > 3.0 then
                		ESX.ShowNotification("No hay jugadores cerca!")
					else
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'jail_choose_reason_menu',
							{
							  title = "Razon de carcel"
							},
						function(data3, menu3)
		  
						  	local reason = data3.value
		  
						  	if reason == nil then
								ESX.ShowNotification("Debes escribir algo!")
						  	else
								menu3.close()
		  
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		  
								if closestPlayer == -1 or closestDistance > 3.0 then
								  	ESX.ShowNotification("No hay jugadores cerca!")
								else
								  	TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(closestPlayer), jailTime, reason, jailType)
								end
		  
						  	end
		  
						end, function(data3, menu3)
							menu3.close()
						end)
              		end

				end

          	end, function(data2, menu2)
				menu2.close()
			end)	
		elseif action == "jail_sandy" then
			jailType = "sandy"
			menu.close()
			ESX.UI.Menu.Open(
          		'dialog', GetCurrentResourceName(), 'jail_choose_time_menu',
          		{
            		title = "Tiempo de encarcelamiento (minutos)"
          		},
          	function(data2, menu2)
            	local jailTime = tonumber(data2.value)
            	if jailTime == nil then
              		ESX.ShowNotification("El tiempo tiene que ser en minutos!")
            	else
              		menu2.close()
              		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
             		if closestPlayer == -1 or closestDistance > 3.0 then
                		ESX.ShowNotification("No hay jugadores cerca!")
					else
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'jail_choose_reason_menu',
							{
							  title = "Razon de carcel"
							},
						function(data3, menu3)
		  
						  	local reason = data3.value
		  
						  	if reason == nil then
								ESX.ShowNotification("Debes escribir algo!")
						  	else
								menu3.close()
		  
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		  
								if closestPlayer == -1 or closestDistance > 3.0 then
								  	ESX.ShowNotification("No hay jugadores cerca!")
								else
								  	TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(closestPlayer), jailTime, reason, jailType)
								end
		  
						  	end
		  
						end, function(data3, menu3)
							menu3.close()
						end)
              		end

				end

          	end, function(data2, menu2)
				menu2.close()
			end)
		elseif action == "jail_federal" then
			jailType = "federal"
			menu.close()
			ESX.UI.Menu.Open(
          		'dialog', GetCurrentResourceName(), 'jail_choose_time_menu',
          		{
            		title = "Tiempo de encarcelamiento (minutos)"
          		},
          	function(data2, menu2)
            	local jailTime = tonumber(data2.value)
            	if jailTime == nil then
              		ESX.ShowNotification("El tiempo tiene que ser en minutos!")
            	else
              		menu2.close()
              		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
             		if closestPlayer == -1 or closestDistance > 3.0 then
                		ESX.ShowNotification("No hay jugadores cerca!")
					else
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'jail_choose_reason_menu',
							{
							  title = "Razon de carcel"
							},
						function(data3, menu3)
		  
						  	local reason = data3.value
		  
						  	if reason == nil then
								ESX.ShowNotification("Debes escribir algo!")
						  	else
								menu3.close()
		  
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		  
								if closestPlayer == -1 or closestDistance > 3.0 then
								  	ESX.ShowNotification("No hay jugadores cerca!")
								else
								  	TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(closestPlayer), jailTime, reason, jailType)
								end
		  
						  	end
		  
						end, function(data3, menu3)
							menu3.close()
						end)
              		end

				end

          	end, function(data2, menu2)
				menu2.close()
			end)
		elseif action == "jail_seguridad_federal" then
			jailType = "segurfederal"
			menu.close()
			ESX.UI.Menu.Open(
          		'dialog', GetCurrentResourceName(), 'jail_choose_time_menu',
          		{
            		title = "Tiempo de encarcelamiento (minutos)"
          		},
          	function(data2, menu2)
            	local jailTime = tonumber(data2.value)
            	if jailTime == nil then
              		ESX.ShowNotification("El tiempo tiene que ser en minutos!")
            	else
              		menu2.close()
              		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
             		if closestPlayer == -1 or closestDistance > 3.0 then
                		ESX.ShowNotification("No hay jugadores cerca!")
					else
						ESX.UI.Menu.Open(
							'dialog', GetCurrentResourceName(), 'jail_choose_reason_menu',
							{
							  title = "Razon de carcel"
							},
						function(data3, menu3)
		  
						  	local reason = data3.value
		  
						  	if reason == nil then
								ESX.ShowNotification("Debes escribir algo!")
						  	else
								menu3.close()
		  
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		  
								if closestPlayer == -1 or closestDistance > 3.0 then
								  	ESX.ShowNotification("No hay jugadores cerca!")
								else
								  	TriggerServerEvent("esx-qalle-jail:jailPlayer", GetPlayerServerId(closestPlayer), jailTime, reason, jailType)
								end
		  
						  	end
		  
						end, function(data3, menu3)
							menu3.close()
						end)
              		end

				end

          	end, function(data2, menu2)
				menu2.close()
			end)
		elseif action == "unjail_player" then

			local elements = {}

			ESX.TriggerServerCallback("esx-qalle-jail:retrieveJailedPlayers", function(playerArray)

				if #playerArray == 0 then
					ESX.ShowNotification("Tu jaula esta vacia!")
					return
				end

				for i = 1, #playerArray, 1 do
					table.insert(elements, {label = "Prisionero: " .. playerArray[i].name .. " | Tiempo: " .. playerArray[i].jailTime .. " minutos", value = playerArray[i].identifier })
				end

				ESX.UI.Menu.Open(
					'default', GetCurrentResourceName(), 'jail_unjail_menu',
					{
						title = "Soltar de la carcel",
						align = "center",
						elements = elements
					},
				function(data2, menu2)

					local action = data2.current.value

					TriggerServerEvent("esx-qalle-jail:unJailPlayer", action)

					menu2.close()

				end, function(data2, menu2)
					menu2.close()
				end)
			end)

		end

	end, function(data, menu)
		menu.close()
	end)	
end

