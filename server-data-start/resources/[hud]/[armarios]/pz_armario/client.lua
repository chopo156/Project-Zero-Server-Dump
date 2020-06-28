
RegisterNetEvent('pz_armario:armario')
AddEventHandler('pz_armario:armario', function()
    TriggerEvent('motels:wardrobe')
end)

function OpenRoomMenu2(player)

  local entering = nil
  local elements = {}

  table.insert(elements, {label = 'Tus outfits', value = 'player_dressing'})
  table.insert(elements, {label = 'Borrar outfit', value = 'remove_cloth'})
 
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'room2',
    {
      title    = 'Armario personal',
      align    = 'top-left',
      elements = elements,
    },
    function(data, menu)

      if data.current.value == 'player_dressing' then

        ESX.TriggerServerCallback('pz_armario:getPlayerDressing', function(dressing)

          local elements = {}

          for i=1, #dressing, 1 do
            table.insert(elements, {label = dressing[i], value = i})
          end

          ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'player_dressing',
            {
              title    = 'Armario personal',
              align    = 'top-left',
              elements = elements,
            },
            function(data, menu)

              TriggerEvent('skinchanger:getSkin', function(skin)

                ESX.TriggerServerCallback('pz_armario:getPlayerOutfit', function(clothes)

                  TriggerEvent('skinchanger:loadClothes', skin, clothes)
                  TriggerEvent('esx_skin:setLastSkin', skin)

                  TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                  end)

                end, data.current.value)

              end)

            end,
            function(data, menu)
              menu.close()
            end
          )

        end)

      end
        
      if data.current.value == 'remove_cloth' then
          ESX.TriggerServerCallback('pz_armario:getPlayerDressing', function(dressing)
              local elements = {}
      
              for i=1, #dressing, 1 do
                  table.insert(elements, {label = dressing[i].label, value = i})
              end
              
              ESX.UI.Menu.Open(
              'default', GetCurrentResourceName(), 'remove_cloth',
              {
                title    = 'Borrar ropa',
                align    = 'top-left',
                elements = elements,
              },
              function(data, menu)
                  menu.close()
                  TriggerServerEvent('pz_armario:removeOutfit', data.current.value)
                  ESX.ShowNotification("Has borrado el Outfit")
              end,
              function(data, menu)
                menu.close()
              end
            )
          end)
      end

    end,
    function(data, menu)

      menu.close()

    end
  )

end

DrawText3D = function(coords, text, scale)
    coords = coords + vector3(0.0, 0.0, 0.2)
	local onScreen,_x,_y=World3dToScreen2d(coords.x, coords.y, coords.z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 41, 41, 125)
end

HelpText = function(msg, coords)
    DrawText3D(coords, string.gsub(msg, "~INPUT_CONTEXT~", "~r~[~w~E~r~]~w~"), 0.35)
end

Citizen.CreateThread(function()
    while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Wait(0) end
    
    while true do
        Wait(500)
        for k, v in pairs(Config.Houses) do
            if Vdist2(GetEntityCoords(PlayerPedId()), v['inventario']) <= 5 then
                local text = 'error'
                while Vdist2(GetEntityCoords(PlayerPedId()), v['inventario']) <= 5 do
                    text = (Strings['Press_E']):format(Strings['Armario'])
                   
                    HelpText(text, v['inventario'])
                    if IsControlJustReleased(0, 38) then
                      TriggerEvent('motels:wardrobe')
                    end
                    Wait(0)
                end
            end
        end
    end
end)