local open = false
local ESX  = nil

-- ESX
-- Added this so you can include the rest of the Usage-stuff found on the GitHub page
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function( data, type )
	open = true
	SendNUIMessage({
		action = "open",
		array  = data,
		type   = type
	})
end)

RegisterNetEvent('jsfour-idcard:openradial')
AddEventHandler('jsfour-idcard:openradial', function()
	openMenu()
end)


-- Key events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		-- Controls found in the FiveM docs:
		-- https://docs.fivem.net/game-references/controls/

		-- 38 = E
		-- if IsControlJustReleased(0, 121) then
		-- 	openMenu()			
		-- end

		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			SendNUIMessage({
				action = "close"
			})
			open = false
		end
	end
end)

function openMenu()
	ESX.UI.Menu.Open(
	  'default', GetCurrentResourceName(), 'id_card_menu',
	  {
		  title    = 'Menu Licencias',
		  elements = {
			  {label = 'Mirar tu DNI', value = 'checkID'},
			  {label = 'Enseñar tu DNI', value = 'showID'},
			  {label = 'Mirar tu Carnet de Conducir', value = 'checkDriver'},
			  {label = 'Enseñar tu Carnet de Conducir', value = 'showDriver'},
			  {label = 'Mirar tu permiso de armas', value = 'checkFirearms'},
			  {label = 'Enseñar tu permiso de armas', value = 'showFirearms'},
		  }
	  },
	  function(data, menu)
		  local val = data.current.value
		  
		  if val == 'checkID' then
			  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
		  elseif val == 'checkDriver' then
			  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
		  elseif val == 'checkFirearms' then
			  TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'weapon')
		  else
			  local player, distance = ESX.Game.GetClosestPlayer()
			  
			  if distance ~= -1 and distance <= 3.0 then
				  if val == 'showID' then
				  	TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))
				  elseif val == 'showDriver' then
			  		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')
				  elseif val == 'showFirearms' then
			  		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'weapon')
				  end
			  else
				ESX.ShowNotification('No hay jugadores cerca')
			  end
		  end
	  end,
	  function(data, menu)
		  menu.close()
	  end
  )
  end