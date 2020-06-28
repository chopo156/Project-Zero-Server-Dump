ESX              = nil
ESX_Factions     = nil
local PlayerData = {}
local curGang = nil
local curRank = nil
local menu_open = false 
local inside_menu = false
local vehicle_spawn_timer = 0
local IsDead = false
local lastvalid = nil
local zones = Config.Zones
local inside_zone = false
local last_zone = nil
local isPolice = false

Citizen.CreateThread(function()
	while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
  while ESX_Factions == nil do
    TriggerEvent('esx_factions:getSharedObject', function(obj) ESX_Factions = obj end)
    Citizen.Wait(0)
  end
  TriggerServerEvent("esx_gangs:InitializeClient")
  ESX.UI.Menu.CloseAll()
end)

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(1000)
    if (ESX_Factions ~= nil and ESX_Factions.GetPlayerData().faction.type == "police" and ESX_Factions.GetPlayerData().onduty) then 
      isPolice = true
    else
      isPolice = false
    end
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx_gangs:UpdateClient')
AddEventHandler('esx_gangs:UpdateClient', function(_gang, _rank)
  curGang = _gang.name
  curRank = _rank.ranking
  SendNUIMessage({
    type    = "update",
    data  = {gang = _gang, rank = _rank},
  })
end)

RegisterNetEvent('esx_gangs:UpdateZones')
AddEventHandler('esx_gangs:UpdateZones', function(_zones)
  zones = _zones
end)

local function playerDied()
  if (last_zone ~= nil and zones[last_zone].capturing) then
    TriggerServerEvent("esx_gangs:AddDeadPlayer", last_zone)
  end
end

AddEventHandler('baseevents:onPlayerDied', function(killerType, coords)
	playerDied()
end)

AddEventHandler('baseevents:onPlayerKilled', function(killerId, data)
	playerDied()
end)

local function DrawZoneTimer(_zone)
  local x = 1.0
  local y = 0.5
  local width = 1.0
  local height = 1.0
  local scale = 0.5
  local text = ""
  if (_zone ~= -1) then
    local zone = zones[_zone]
    if (zone.timer ~= nil) then
      text = "~y~".. zone.Label .." - ~r~Capture Timer~w~: " .. zone.timer .. " second(s)~w~"
    end
  end
  if AOPLocation == 1 or AOPLocation == 4 then
      SetTextCentre(true)
  end
  SetTextFont(4)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(255, 0, 0, 255)
  SetTextDropShadow(0, 0, 0, 0,255)
  SetTextEdge(2, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x - width/2, y - height/2 + 0.005)
end

local function DisplayHelpText(str)
  SetTextComponentFormat("STRING")
  AddTextComponentString(str)
  DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

local function OpenMenu(menu, params)
  ESX.TriggerServerCallback('esx_gangs:allowedToManage', function(result)
    if (not result and menu ~= "vehicle" and menu ~= "vehicle_return") then
      TriggerEvent('esx:showNotification', "~r~You are not permitted to manage this gang.~w~")
    else
      menu_open = true
      local gang = curGang
      if (menu == "manage") and notAllowedToManage ~= 1 then
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_manage_main',
        {
            title    = "Administracion (".. gang ..")",
            align    = 'top-left',
            elements = {
              {label = "Invitar Jugador", value = "invite"},
              {label = "Administrar miembros", value = "members"},
              {label = "Inventario", value = "inventory"},
            }
        }, function(data, menu)
            menu.close()
            local option = data.current.value
            OpenMenu(option)
        end, function(data, menu)
          menu.close()
        end)
      elseif (menu == "inventory") then
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_inventory_method',
        {
            title    = "Caja Fuerte",
            align    = 'top-left',
            elements = {
              {label = "Depositar dinero o Items", value = "add_items"},
              {label = "Extraer dinero o Items", value = "remove_items"},
            }
        }, function(data, menu)
          menu.close()
          OpenMenu(data.current.value)
        end, function(data, menu)
          menu.close()
          OpenMenu("manage")
        end)
      elseif (menu == "add_items") then
        ESX.TriggerServerCallback('esx_gangs:getPlayerInventory', function(result) 
          local list = {}
          if (result ~= nil) then
              local cash = result.cash
              local dcash = result.dcash
              table.insert(list, {label = "Cash: $"..result.cash, value = "cash"})
              table.insert(list, {label = "Dirty Money: $"..result.dcash, value = "dcash"})
              for k,v in pairs(result.inventory) do
                  local item = v
                  table.insert(list, {label = item.label .. "(x".. item.count ..")", value = item})
              end
              
              --------------------------------------------------------------------------------
              
              ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_inventory_add',
              {
                  title    = "Depositar dinero o Items",
                  align    = 'top-left',
                  elements = list
              }, function(data, menu)
                  menu.close()
                  if (data.current.value ~= "cash" and data.current.value ~= "dcash") then 
                    local item = data.current.value
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'gangs_inventory_item_deposit', {title = "Deposit " .. item.label .. " into inventory"}, 
                    function(data, menu)
                        menu.close()
                        local count = tonumber(data.value)
                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_inventory_item_deposit_confirm',
                        {
                            title    = "Estas seguro de que quieres depositar " .. item.label .."(x"..count..") en la caja fuerte?",
                            align    = 'top-left',
                            elements = {
                                {label = "Si", value = "yes"},
                                {label = "No", value = "no"},
                            }
                        }, function(data, menu)
                            menu.close()
                            if (data.current.value == "yes") then 
                              TriggerServerEvent("esx_gangs:DepositItem", item.name, count)
                            end
                            OpenMenu("add_items")
                        end, function(data, menu)
                            menu.close()
                            OpenMenu("add_items")
                        end)
                    end, function(data, menu)
                        menu.close()
                        OpenMenu("add_items")
                    end)
                  else
                      local option = data.current.value
                      ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'gangs_inventory_cash_deposit', {title = "Depositas $" .. ( option == "cash" and "Cash" or "Dirty Money") .. " en la caja fuerte"}, 
                      function(data, menu)
                          menu.close()
                          local count = tonumber(data.value)
                          ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_inventory_cash_deposit_confirm',
                          {
                              title    = "Estas seguro de que quieres depositar $" .. count .. " en ".. ( option == "cash" and "Cash" or "Dirty Money") .."?",
                              align    = 'top-left',
                              elements = {
                                  {label = "Si", value = "yes"},
                                  {label = "No", value = "no"},
                              }
                          }, function(data, menu)
                              menu.close()
                              if (data.current.value == "yes") then 
                                TriggerServerEvent("esx_gangs:DepositItem", option, count)
                              end
                              OpenMenu("add_items")
                          end, function(data, menu)
                              menu.close()
                              OpenMenu("add_items")
                          end)
                      end, function(data, menu)
                          menu.close()
                          OpenMenu("add_items")
                      end)
                  end
              end, function(data, menu)
                  menu.close()
                  OpenMenu("inventory")
              end)
          end
        end, gang)
      elseif (menu == "remove_items") then
        ESX.TriggerServerCallback('esx_gangs:getInventory', function(result) 
          local list = {}
          if (result ~= nil) then
              local cash = result.cash
              local dcash = result.dcash
              table.insert(list, {label = "Dinero: $"..result.cash, value = "cash"})
              table.insert(list, {label = "Dinero Negro: $"..result.dcash, value = "dcash"})
              for k,v in pairs(result.items) do
                  local item = v
                  table.insert(list, {label = item.label .. "(x".. item.count ..")", value = item})
              end
              
              --------------------------------------------------------------------------------
              
              ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_inventory_remove',
              {
                  title    = "Extraer dinero o Items",
                  align    = 'top-left',
                  elements = list
              }, function(data, menu)
                  menu.close()
                  if (data.current.value ~= "cash" and data.current.value ~= "dcash") then 
                    local item = data.current.value
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'gangs_inventory_item_remove', {title = "Withdraw " .. item.label .. " from inventory"}, 
                    function(data, menu)
                        menu.close()
                        local count = tonumber(data.value)
                        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_inventory_item_remove_confirm',
                        {
                            title    = "Estas seguro de que quieres extraer " .. item.label .."(x"..count..") de la caja fuerte?",
                            align    = 'top-left',
                            elements = {
                                {label = "Si", value = "yes"},
                                {label = "No", value = "no"},
                            }
                        }, function(data, menu)
                            menu.close()
                            if (data.current.value == "yes") then 
                              TriggerServerEvent("esx_gangs:RemoveItem", item.name, count)
                            end
                            OpenMenu("remove_items")
                        end, function(data, menu)
                            menu.close()
                            OpenMenu("remove_items")
                        end)
                    end, function(data, menu)
                        menu.close()
                        OpenMenu("remove_items")
                    end)
                  else
                      local option = data.current.value
                      ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'gangs_inventory_cash_remove', {title = "Withdraw $" .. ( option == "cash" and "Cash" or "Dirty Money") .. " en la caja fuerte"}, 
                      function(data, menu)
                          menu.close()
                          local count = tonumber(data.value)
                          ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_inventory_cash_remove_confirm',
                          {
                              title    = "Estas seguro de que quieres extraer $" .. count .. " en ".. ( option == "cash" and "Cash" or "Dirty Money") .."?",
                              align    = 'top-left',
                              elements = {
                                  {label = "Si", value = "yes"},
                                  {label = "No", value = "no"},
                              }
                          }, function(data, menu)
                              menu.close()
                              if (data.current.value == "yes") then 
                                TriggerServerEvent("esx_gangs:RemoveItem", option, count)
                              end
                              OpenMenu("remove_items")
                          end, function(data, menu)
                              menu.close()
                              OpenMenu("remove_items")
                          end)
                      end, function(data, menu)
                          menu.close()
                          OpenMenu("remove_items")
                      end)
                  end
              end, function(data, menu)
                  menu.close()
                  OpenMenu("inventory")
              end)
          end
        end, gang)
      elseif (menu == "invite") then
        ESX.TriggerServerCallback('esx_gangs:getInvitablePlayers', function(result)
          local list = {}
          if (result ~= nil) then
            for i=1, #result do
              table.insert(list, {label = result[i].name .. " (id: ".. result[i].sid ..")", value = result[i].id})
            end
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_invite_players',
            {
                title    = "Miembros de (".. gang ..")",
                align    = 'top-left',
                elements = list
            }, function(data, menu)
              menu.close()
              local i_id = data.current.value
              ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_invite_players_confirm',
              {
                  title    = "Estas seguro de que quieres invitar a " .. data.current.label .. "?",
                  align    = 'top-left',
                  elements = {
                    {label = "Si", value = "yes"},
                    {label = "No", value = "no"},
                  }
              }, function(data, menu)
                menu.close()
                if (data.current.value == "yes") then 
                  TriggerServerEvent("esx_gangs:InvitePlayer", i_id)
                  Citizen.Wait(200)
                  OpenMenu("invite")
                elseif (data.current.value == "no") then 
                  OpenMenu("invite")
                end
              end, function(data, menu)
                menu.close()
                OpenMenu("invite")
              end)
            end, function(data, menu)
              menu.close()
              OpenMenu("manage")
            end)
          end
        end, gang)
      elseif (menu == "members") then
        ESX.TriggerServerCallback('esx_gangs:getMembers', function(result)
          local list = {}
          if (result ~= nil) then
            for i=1, #result do
              table.insert(list, {label = result[i].name .. " (Rango: ".. result[i].rank.label ..")", value = result[i].id})
            end
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_manage_players',
            {
                title    = "Miembros de (".. gang ..")",
                align    = 'top-left',
                elements = list
            }, function(data, menu)
              menu.close()
              OpenMenu("player_options", {id = data.current.value})
            end, function(data, menu)
              menu.close()
              OpenMenu("manage")
            end)
          end
        end, gang)
      elseif (menu == "player_options") then
        ESX.TriggerServerCallback('esx_gangs:getMember', function(result)
          if (result ~= nil) then
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_manage_player',
            {
                title    = "Manage Player: " .. result.name,
                align    = 'top-left',
                elements = {
                  {label = "Ascender", value = "promote"},
                  {label = "Degradar", value = "demote"},
                  {label = "Expulsar", value = "fire"},
                }
            }, function(data, menu)
              menu.close()
              OpenMenu(data.current.value, {data = result})
            end, function(data, menu)
              menu.close()
              OpenMenu("members")
            end)
          end
        end, gang, params.id)
      elseif (menu == "promote") then
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_manage_players_promote',
        {
            title    = "Estas seguro de que quieres ascender a " .. params.data.name .. "?",
            align    = 'top-left',
            elements = {
              {label = "Si", value = "yes"},
              {label = "No", value = "no"},
            }
        }, function(data, menu)
          menu.close()
          if (data.current.value == "yes") then 
            TriggerServerEvent("esx_gangs:PromotePlayer", params.data.identifier)
            Citizen.Wait(200)
            OpenMenu("members")
          elseif (data.current.value == "no") then 
            OpenMenu("player_options", params.data.identifier)
          end
        end, function(data, menu)
          menu.close()
          OpenMenu("player_options", params.data.identifier)
        end)
      elseif (menu == "demote") then
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_manage_players_demote',
        {
            title    = "Estas seguro de que quieres degradar a " .. params.data.name .. "?",
            align    = 'top-left',
            elements = {
              {label = "Si", value = "yes"},
              {label = "No", value = "no"},
            }
        }, function(data, menu)
          menu.close()
          if (data.current.value == "yes") then 
            TriggerServerEvent("esx_gangs:DemotePlayer", params.data.identifier)
            Citizen.Wait(200)
            OpenMenu("members")
          elseif (data.current.value == "no") then 
            OpenMenu("player_options")
          end
        end, function(data, menu)
          menu.close()
          OpenMenu("player_options")
        end)
      elseif (menu == "fire") then
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'gangs_manage_players_fire',
        {
            title    = "Estas seguro de que quieres expulsar a " .. params.data.name .. "?",
            align    = 'top-left',
            elements = {
              {label = "Si", value = "yes"},
              {label = "No", value = "no"},
            }
        }, function(data, menu)
          menu.close()
          if (data.current.value == "yes") then 
            TriggerServerEvent("esx_gangs:FirePlayer", params.data.identifier)
            Citizen.Wait(200)
            OpenMenu("members")
          elseif (data.current.value == "no") then 
            OpenMenu("player_options")
          end
        end, function(data, menu)
          menu.close()
          OpenMenu("player_options")
        end)
      end
    end
  end)
end

local function ZoneInteracted(_zone)
  if (not zones[_zone].capturing and curGang ~= nil) then
    TriggerServerEvent("esx_gangs:zoneInteracted", _zone)
  elseif (curGang == nil and ESX_Factions.GetPlayerData().faction.name == nil) then
    TriggerEvent('esx:showNotification', "~r~No formas parte de ninguna banda/mafia.~w~")
  else
    TriggerEvent('esx:showNotification', "~r~This zone is already in a Turf War. Capture it for your gang / faction!~w~")
  end
end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local player = {}
    player.x, player.y, player.z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    if (curGang ~= nil) then 
      local gang_table = Config.Gangs[curGang].Markers
      local marker_list = {gang_table.Management, gang_table.VehicleSpawn, gang_table.VehicleReturn}
      local action_list = {"manage"}  
      local label_list = {"Administrar"}
      local set_zone = false
      for i=1, #marker_list do
        local marker = marker_list[i]
        if (Vdist(marker.Location.x, marker.Location.y, marker.Location.z, player.x, player.y, player.z) <= 5.0) then
          DrawMarker(1, marker.Location.x, marker.Location.y, marker.Location.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0,1.0, marker.Color.r, marker.Color.g, marker.Color.b, 255, false, false, false, false, false, false)
          if (Vdist(marker.Location.x, marker.Location.y, marker.Location.z, player.x, player.y, player.z) <= 1.75) then
            inside_menu = true
            set_zone = true
            if (not menu_open) then
              DisplayHelpText("Press ~INPUT_CONTEXT~ to ".. label_list[i])
              if (IsControlJustReleased(1,  51)) then
                  OpenMenu(action_list[i])
              end
            end
          elseif (not set_zone) then
            inside_menu = false
            if (menu_open) then
              ESX.UI.Menu.CloseAll()
              menu_open = false
            end
          end
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0)
    if (vehicle_spawn_timer ~= 0) then
      vehicle_spawn_timer = vehicle_spawn_timer - 1
      Citizen.Wait(1000)
    end
  end
end)

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(0)
    if (curGang ~= nil or isPolice) then
      local player = {}
      player.x, player.y, player.z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
      for k,v in pairs(zones) do 
        local marker = v
        if (Vdist(marker.Location.x, marker.Location.y, marker.Location.z, player.x, player.y, player.z) <= 5.0) then
          DrawMarker(1, marker.Location.x, marker.Location.y, marker.Location.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.0, marker.Color.r, marker.Color.g, marker.Color.b, 255, false, false, false, false, false, false)
          if (Vdist(marker.Location.x, marker.Location.y, marker.Location.z, player.x, player.y, player.z) <= 1.75) then
            DisplayHelpText("Presiona ~INPUT_CONTEXT~ para capturar ".. marker.Label .. ".")
            if (IsControlJustReleased(1,  51)) then
              ZoneInteracted(k)
            end
          end
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local player = {}
    player.x, player.y, player.z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    for k,v in pairs(zones) do 
      local marker = v
      if (Vdist(marker.Location.x, marker.Location.y, marker.Location.z, player.x, player.y, player.z) <= 100.0) then
        if (marker.capturing) then
          DrawMarker(1, marker.Location.x, marker.Location.y, marker.Location.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 25.0, 25.0, 50.0, 255, 0, 0, 255, false, false, false, false, false, false)
          if (Vdist(marker.Location.x, marker.Location.y, marker.Location.z, player.x, player.y, player.z) <= 25.0) then
            DrawZoneTimer(k)
            if (inside_zone == false) then 
              inside_zone = true
              last_zone = k
              TriggerServerEvent("esx_gangs:PlayerEnteredZone", k)
            end
          elseif (inside_zone == true and last_zone == k) then
            inside_zone = false
            DrawZoneTimer(-1)
            TriggerServerEvent("esx_gangs:PlayerExitedZone", last_zone)
          end
        elseif (last_zone == k) then
          inside_zone = false
          last_zone = nil
        end
      end
    end
  end
end)

AddEventHandler('esx:onPlayerDeath', function(data)
  IsDead = true
end)

AddEventHandler('playerSpawned', function()
	IsDead = false
end)

local blips = {
     {title="Stones Mansion", colour=39, id=378, x = 944.576, y = 1238.753, z = 366.12},
     {title="Country Folk Falls", colour=39, id=378, x = -1580.284, y = 2050.705, z = 95.722},
     {title="Midnight Club", colour=39, id=225, x = -197.7, y = -1319.72, z = 30.595},
     {title="The Federation", colour=39, id=378, x = -562.22, y = 281.941, z = 85.676},
  }
      
Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

Citizen.CreateThread(function()
  while true do 
      Citizen.Wait(1000)
      for k,v in pairs(zones) do
          if (v.timer ~= nil and v.timer > 0) then
            zones[k].timer = zones[k].timer - 1
              if (zones[k].timer <= 0) then
                zones[k].timer = nil
              end
          end
      end
  end
end)