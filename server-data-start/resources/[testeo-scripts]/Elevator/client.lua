--[[

    Elevators for FiveM
    By DoJoMan18 (DoJoMan18.com).

    You can change the keys here, if you change them you have to also change them in the notifications on line 78. For more information see: (https://docs.fivem.net/docs/game-references/controls/)

--]]

key_floor_up = 188 -- ARROW UP
key_floor_down = 187 -- ARROW DOWN

--[[

The numbers in the elevators array (line 29) should always count up. Do not leave a gap like this:

    [1] = {
        (coords here)
    },
    [4] = {
        (coords here)
    },
    [10] = {
        (coords here)
    },

]]--

elevators = {
    [1] = { 
        -- Vespucci 1
        {-1067.42, -831.75, 4.48}, 
        {-1067.42, -831.75, 10.04}, 
        {-1067.42, -831.75, 13.88}, 
        {-1067.42, -831.75, 18.04},
        {-1067.42, -831.75, 26.04}
    },
    [2] = { 
        -- Vespucci 2
        {-1097.62, -848.59, 3.88}, 
        {-1097.62, -848.59, 9.28}, 
        {-1097.62, -848.59, 12.69}, 
        {-1097.62, -848.59, 18.00},
        {-1097.62, -848.59, 22.04},
        {-1097.62, -848.59, 25.83},
        {-1097.62, -848.59, 29.75},
        {-1097.62, -848.59, 33.36},
        {-1097.62, -848.59, 37.27}
    },
    [3] = { -- 140 Morgue
        {246.43, -1372.55, 24.54},{248.68, -1369.94, 29.65},{246.43, -1372.55, 24.54}
    },
    [4] = { -- 963 Humane Labs and Research
        {3540.75, 3676.64, 21.00},{3540.75, 3676.64, 28.12},{3540.75, 3676.64, 21.00}
    },
}

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local PlayerLocation = GetEntityCoords(player)

        for i = 1, #elevators do
            for k,floor in ipairs(elevators[i]) do
                -- New floor
                Level = {
                    x=floor[1],
                    y=floor[2],
                    z=floor[3], 
                }

                if GetDistanceBetweenCoords(PlayerLocation.x, PlayerLocation.y, PlayerLocation.z, Level.x, Level.y, Level.z, true) < 2.0 then
                    -- Sent information how to use
                    MessageUpLeftCorner("Pulsa: ~INPUT_FRONTEND_UP~ o ~INPUT_FRONTEND_DOWN~")
                    LevelUp = k + 1
                    LevelDown = k - 1

                    for k,floor in ipairs(elevators[i]) do
                        if k == LevelUp then
                            floorUp = {
                                x=floor[1],
                                y=floor[2],
                                z=floor[3], 
                            }
                        end
                        if k == LevelDown then
                            floorDown = {
                                x=floor[1],
                                y=floor[2],
                                z=floor[3], 
                            }
                        end
                    end

                    if floorUp ~= nil then
                        if IsControlJustReleased(1, key_floor_up) then
                            Citizen.Wait(500)
                            -- Lets freeze the user so he can't get away..
                            FreezeEntityPosition(GetPlayerPed(-1), true)
                            Citizen.Wait(500)
                            -- Play some sounds the make the elevator extra cool! :D
                            -- PlaySoundFrontend(-1, "CLOSED", "MP_PROPERTIES_ELEVATOR_DOORS", 1);
                            -- Citizen.Wait(4500)
                            -- PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                            -- Citizen.Wait(500)
                            PlaySoundFrontend(-1, "OPENED", "MP_PROPERTIES_ELEVATOR_DOORS", 1);
                            
                            -- Is elevator a vehicle elevator?
                            if IsPedInAnyVehicle(player, true) then
                                -- Lets teleport the user / vehicle and unfreeze the user.
                                SetEntityCoords(GetVehiclePedIsUsing(player), floorUp.x, floorUp.y, floorUp.z)
                                FreezeEntityPosition(GetPlayerPed(-1), false)
                            else
                                -- Lets teleport the user / vehicle and unfreeze the user.
                                SetEntityCoords(player, floorUp.x, floorUp.y, floorUp.z)
                                FreezeEntityPosition(GetPlayerPed(-1), false)
                            end
                        end
                    end

                    if floorDown ~= nil then
                        if IsControlJustReleased(1, key_floor_down) then
                            Citizen.Wait(500)
                            -- Lets freeze the user so he can't get away..
                            FreezeEntityPosition(GetPlayerPed(-1), true)
                            Citizen.Wait(500)
                            -- Play some sounds the make the elevator extra cool! :D
                            -- PlaySoundFrontend(-1, "CLOSED", "MP_PROPERTIES_ELEVATOR_DOORS", 1);
                            -- Citizen.Wait(4500)
                            -- PlaySoundFrontend(-1, "Hack_Success", "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS", 0)
                            -- Citizen.Wait(500)
                            PlaySoundFrontend(-1, "OPENED", "MP_PROPERTIES_ELEVATOR_DOORS", 1);
                            
                            -- Is elevator a vehicle elevator?
                            if IsPedInAnyVehicle(player, true) then
                                -- Lets teleport the user / vehicle and unfreeze the user.
                                SetEntityCoords(GetVehiclePedIsUsing(player), floorDown.x, floorDown.y, floorDown.z)
                                FreezeEntityPosition(GetPlayerPed(-1), false)
                            else
                                -- Lets teleport the user / vehicle and unfreeze the user.
                                SetEntityCoords(player, floorDown.x, floorDown.y, floorDown.z)
                                FreezeEntityPosition(GetPlayerPed(-1), false)
                            end
                        end
                    end
                    -- Get to here but you haven't been teleported? You are not close to an elevator ingame.
                end
            end
            -- New building
        end
    end
end)

-- Message in left up corner.
function MessageUpLeftCorner(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end


-- Message above radar.
function MessageAboveRadar(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end












-- RegisterNetEvent('pz_armario:armario')
-- AddEventHandler('pz_armario:armario', function()
--     OpenRoomMenu2(player)
-- end)


-- function OpenRoomMenu2(player)

--   local entering = nil
--   local elements = {}

--   table.insert(elements, {label = 'Tus outfits', value = 'player_dressing'})
--   table.insert(elements, {label = 'Borrar outfit', value = 'remove_cloth'})
 
--   ESX.UI.Menu.CloseAll()

--   ESX.UI.Menu.Open(
--     'default', GetCurrentResourceName(), 'room2',
--     {
--       title    = 'Armario personal',
--       align    = 'top-left',
--       elements = elements,
--     },
--     function(data, menu)

--       if data.current.value == 'player_dressing' then

--         ESX.TriggerServerCallback('pz_armario:getPlayerDressing', function(dressing)

--           local elements = {}

--           for i=1, #dressing, 1 do
--             table.insert(elements, {label = dressing[i], value = i})
--           end

--           ESX.UI.Menu.Open(
--             'default', GetCurrentResourceName(), 'player_dressing',
--             {
--               title    = 'Armario personal',
--               align    = 'top-left',
--               elements = elements,
--             },
--             function(data, menu)

--               TriggerEvent('skinchanger:getSkin', function(skin)

--                 ESX.TriggerServerCallback('pz_armario:getPlayerOutfit', function(clothes)

--                   TriggerEvent('skinchanger:loadClothes', skin, clothes)
--                   TriggerEvent('esx_skin:setLastSkin', skin)

--                   TriggerEvent('skinchanger:getSkin', function(skin)
--                     TriggerServerEvent('esx_skin:save', skin)
--                   end)

--                 end, data.current.value)

--               end)

--             end,
--             function(data, menu)
--               menu.close()
--             end
--           )

--         end)

--       end
        
--       if data.current.value == 'remove_cloth' then
--           ESX.TriggerServerCallback('pz_armario:getPlayerDressing', function(dressing)
--               local elements = {}
      
--               for i=1, #dressing, 1 do
--                   table.insert(elements, {label = dressing[i].label, value = i})
--               end
              
--               ESX.UI.Menu.Open(
--               'default', GetCurrentResourceName(), 'remove_cloth',
--               {
--                 title    = 'Borrar ropa',
--                 align    = 'top-left',
--                 elements = elements,
--               },
--               function(data, menu)
--                   menu.close()
--                   TriggerServerEvent('pz_armario:removeOutfit', data.current.value)
--                   ESX.ShowNotification("Has borrado el Outfit")
--               end,
--               function(data, menu)
--                 menu.close()
--               end
--             )
--           end)
--       end

--     end,
--     function(data, menu)

--       menu.close()

--     end
--   )

-- end

-- DrawText3D = function(coords, text, scale)
--     coords = coords + vector3(0.0, 0.0, 0.2)
-- 	local onScreen,_x,_y=World3dToScreen2d(coords.x, coords.y, coords.z)
--     local px,py,pz=table.unpack(GetGameplayCamCoords())

--     SetTextScale(scale, scale)
--     SetTextFont(4)
--     SetTextProportional(1)
--     SetTextColour(255, 255, 255, 215)
--     SetTextEntry("STRING")
--     SetTextCentre(1)
--     AddTextComponentString(text)
--     DrawText(_x,_y)
--     local factor = (string.len(text)) / 370
--     DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 41, 41, 125)
-- end

-- HelpText = function(msg, coords)
--     DrawText3D(coords, string.gsub(msg, "~INPUT_CONTEXT~", "~r~[~w~E~r~]~w~"), 0.35)
-- end

-- Citizen.CreateThread(function()
--     while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
    
--     while true do
--         Wait(500)
--         for k, v in pairs(Config.Houses) do
--             if Vdist2(GetEntityCoords(PlayerPedId()), v['inventario']) <= 5 then
--                 local text = 'error'
--                 while Vdist2(GetEntityCoords(PlayerPedId()), v['inventario']) <= 5 do
--                     text = (Strings['Press_E']):format(Strings['Armario'])
                   
--                     HelpText(text, v['inventario'])
--                     if IsControlJustReleased(0, 38) then
--                         OpenRoomMenu2(source)
--                     end
--                     Wait(0)
--                 end
--             end
--         end
--     end
-- end)