local hasAlreadyEnteredMarker, hasPaid, currentActionData = false, false, {}
local lastZone, currentAction, currentActionMsg
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function OpenShopGorras()
	hasPaid = false

	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
		menu.close()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title = 'Valida la compra',
			align = 'top-right',
			elements = {
				{label = 'No', value = 'no'},
				{label = 'Si', value = 'yes'}
		}}, function(data, menu)
			menu.close()

			if data.current.value == 'yes' then
				ESX.TriggerServerCallback('pz_chalecos:buyClothes', function(bought)
					TriggerEvent('skinchanger:getSkin', function(skin)
						TriggerServerEvent('esx_skin:save', skin)
					end)

					hasPaid = true

					ESX.TriggerServerCallback('pz_chalecos:checkPropertyDataStore', function(foundStore)
						if foundStore then
							ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'save_dressing', {
								title = 'Guardar en Outfits',
								align = 'top-right',
								elements = {
									{label = 'No',  value = 'no'},
									{label = 'Si', value = 'yes'}
							}}, function(data2, menu2)
								menu2.close()

								if data2.current.value == 'yes' then
									ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
										title = 'Ponle nombre al Outfit'
									}, function(data3, menu3)
										menu3.close()

										TriggerEvent('skinchanger:getSkin', function(skin)
											TriggerServerEvent('pz_chalecos:saveOutfit', data3.value, skin)
											ESX.ShowNotification('Guardar el outfit')
										end)
									end, function(data3, menu3)
										menu3.close()
									end)
								end
							end)
						end
					end)
				end)
			elseif data.current.value == 'no' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			currentAction     = 'shop_menu'
			currentActionMsg  = 'Chalecos'
			currentActionData = {}
		end, function(data, menu)
			menu.close()

			currentAction     = 'shop_menu'
			currentActionMsg  = 'Chaleco'
			currentActionData = {}
		end)

	end, function(data, menu)
		menu.close()

		currentAction     = 'shop_menu'
		currentActionMsg  = 'Chalecos'
		currentActionData = {}
	end, {
		'bproof_1',		
		'bproof_2',
	})
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
	while true do
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil
		local isInMarker = false
		local hasAlreadyEnteredMarker = false
		Wait(500)
		for k, v in pairs(Config.Tiendas) do
			if Vdist2(GetEntityCoords(PlayerPedId()), v['chaleco']) <= 5 then
				local text = 'error'
				while Vdist2(GetEntityCoords(PlayerPedId()), v['chaleco']) <= 5 do
					text = (Strings['Press_E']):format(Strings['chalec'])
					HelpText(text, v['chaleco'])
					if IsControlJustReleased(0, 38) then
						OpenShopGorras()
					end
					Wait(0)
				end
			end
		
		if (isInMarker and not hasAlreadyEnteredMarker) then
			hasAlreadyEnteredMarker = true
			TriggerEvent('pz_chalecos:hasEnteredMarker')
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('pz_chalecos:hasExitedMarker')
		end
		end
  	end
end)



AddEventHandler('pz_chalecos:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	currentAction = nil

	if not hasPaid then
		TriggerEvent('esx_skin:getLastSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)
	end
end)

AddEventHandler('pz_chalecos:hasEnteredMarker', function(zone)
	currentAction     = 'shop_confirm'
	currentActionMsg  = 'Chaleco'
	currentActionData = {}
end)







-- sex				
-- face			
-- skin			
-- age_1			
-- age_2			
-- beard_1			
-- beard_2			
-- beard_3			
-- beard_4			
-- hair_1			
-- hair_2			
-- hair_color_1	
-- hair_color_2	
-- eye_color		
-- eyebrows_1		
-- eyebrows_2		
-- eyebrows_3		
-- eyebrows_4		
-- makeup_1		
-- makeup_2		
-- makeup_3		
-- makeup_4		
-- lipstick_1		
-- lipstick_2		
-- lipstick_3		
-- lipstick_4		
-- blemishes_1		
-- blemishes_2		
-- blush_1			
-- blush_2			
-- blush_3			
-- complexion_1	
-- complexion_2	
-- sun_1			
-- sun_2			
-- moles_1			
-- moles_2			
-- chest_1			
-- chest_2			
-- chest_3			
-- bodyb_1			
-- bodyb_2			
-- ears_1			
-- ears_2			
-- tshirt_1		
-- tshirt_2		
-- torso_1			
-- torso_2			
-- decals_1		
-- decals_2		
-- arms			
-- arms_2			
-- pants_1			
-- pants_2			
-- shoes_1			
-- shoes_2			
-- mask_1			
-- mask_2			
-- bproof_1		
-- bproof_2		
-- chain_1			
-- chain_2			
-- bags_1			
-- bags_2			
-- helmet_1		
-- helmet_2		
-- glasses_1		
-- glasses_2		
-- watches_1		
-- watches_2		
-- bracelets_1		
-- bracelets_2		