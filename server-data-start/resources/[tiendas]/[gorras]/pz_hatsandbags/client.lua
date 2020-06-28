local hasAlreadyEnteredMarker, hasPaid, currentActionData = false, false, {}
local lastZone, currentAction, currentActionMsg
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

-- function OpenShopGorras()
-- 	hasPaid = false

-- 	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
-- 		menu.close()

-- 		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
-- 			title = _U('valid_this_purchase'),
-- 			align = 'top-right',
-- 			elements = {
-- 				{label = 'No', value = 'no'},
-- 				{label = 'Si', value = 'yes'}
-- 		}}, function(data, menu)
-- 			menu.close()

-- 			if data.current.value == 'yes' then
-- 				ESX.TriggerServerCallback('pz_hatsandbags:buyClothes', function(bought)
-- 					if bought then
-- 						TriggerEvent('skinchanger:getSkin', function(skin)
-- 							TriggerServerEvent('esx_skin:save', skin)
-- 						end)

-- 						hasPaid = true

-- 						ESX.TriggerServerCallback('pz_hatsandbags:checkPropertyDataStore', function(foundStore)
-- 							if foundStore then
-- 								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'save_dressing', {
-- 									title = _U('save_in_dressing'),
-- 									align = 'top-right',
-- 									elements = {
-- 										{label = 'No',  value = 'no'},
-- 										{label = 'Si', value = 'yes'}
-- 								}}, function(data2, menu2)
-- 									menu2.close()

-- 									if data2.current.value == 'yes' then
-- 										ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
-- 											title = _U('name_outfit'),
-- 										}, function(data3, menu3)
-- 											menu3.close()

-- 											TriggerEvent('skinchanger:getSkin', function(skin)
-- 												TriggerServerEvent('pz_hatsandbags:saveOutfit', data3.value, skin)
-- 												ESX.ShowNotification('Has guardado tu outfit')
-- 											end)
-- 										end, function(data3, menu3)
-- 											menu3.close()
-- 										end)
-- 									end
-- 								end)
-- 							end
-- 						end)

-- 					else
-- 						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
-- 							TriggerEvent('skinchanger:loadSkin', skin)
-- 						end)

-- 						ESX.ShowNotification('No tienes suficiente dinero')
-- 					end
-- 				end)
-- 			elseif data.current.value == 'no' then
-- 				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
-- 					TriggerEvent('skinchanger:loadSkin', skin)
-- 				end)
-- 			end

-- 			currentAction     = 'shop_menu'
-- 			currentActionMsg  = 'Abrir menu'
-- 			currentActionData = {}
-- 		end, function(data, menu)
-- 			menu.close()

-- 			currentAction     = 'shop_menu'
-- 			currentActionMsg  = 'Abrir menu'
-- 			currentActionData = {}
-- 		end)

-- 	end, function(data, menu)
-- 		menu.close()

-- 		currentAction     = 'shop_menu'
-- 		currentActionMsg  = 'Abrir menu'
-- 		currentActionData = {}
-- 	end, {
-- 		'helmet_1', 'helmet_2',
-- 	})
-- end

function OpenShopMochilas()
	hasPaid = false

	TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
		menu.close()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			title = _U('valid_this_purchase'),
			align = 'top-right',
			elements = {
				{label = "No", value = 'no'},
				{label = "Si", value = 'yes'}
		}}, function(data, menu)
			menu.close()

			if data.current.value == 'yes' then
				ESX.TriggerServerCallback('pz_hatsandbags:buyClothes', function(bought)
					if bought then
						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_skin:save', skin)
						end)
						TriggerServerEvent('pz_hatsandbags:darmochila')

						hasPaid = true

						ESX.TriggerServerCallback('pz_hatsandbags:checkPropertyDataStore', function(foundStore)
							if foundStore then
								ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'save_dressing', {
									title =  _U('save_in_dressing'),
									align = 'top-right',
									elements = {
										{label = "No",  value = 'no'},
										{label = "Si", value = 'yes'}
								}}, function(data2, menu2)
									menu2.close()

									if data2.current.value == 'yes' then
										ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'outfit_name', {
											title = _U('name_outfit'),
										}, function(data3, menu3)
											menu3.close()

												TriggerEvent('skinchanger:getSkin', function(skin)
												TriggerServerEvent('pz_hatsandbags:saveOutfit', data3.value, skin)
												ESX.ShowNotification('Has guardado tu outfit')
											end)
										end, function(data3, menu3)
											menu3.close()
										end)
									end
								end)
							end
						end)

					else
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin)
						end)

						ESX.ShowNotification('No tienes suficiente dinero')
					end
				end)
			elseif data.current.value == 'no' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin)
				end)
			end

			
			currentActionData = {}
		end, function(data, menu)
			menu.close()

			currentAction     = 'shop_menu'
			currentActionData = {}
		end)

	end, function(data, menu)
		menu.close()

		currentAction     = 'shop_menu'
		currentActionData = {}
	end, {
    	'bags_1',
		'bags_2',
	})
end

-- Create Blips
Citizen.CreateThread(function()
	for k,v in ipairs(Config.Blip) do
		local blip = AddBlipForCoord(v)

		SetBlipSprite (blip, 586)
		SetBlipColour (blip, 24)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Bagz & Hatz')
		EndTextCommandSetBlipName(blip)
	end
end)

DrawText3D = function(coords, text, scale)
	local onScreen,_x,_y=World3dToScreen2d(coords.x, coords.y, coords.z+0.2)
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
			if Vdist2(GetEntityCoords(PlayerPedId()), v.gorras) <= 2.5 then
				local text = 'error'
				while Vdist2(GetEntityCoords(PlayerPedId()), v.gorras) <= 2.5 do
					text = (Strings['Press_E']):format(Strings['gorros'])
					HelpText(text, v.gorras)
					if IsControlJustReleased(0, 38) then
						TriggerEvent('esx_accessories:abremenu', 'helmet')
					end
					Wait(0)
				end
			end
			if Vdist2(GetEntityCoords(PlayerPedId()), v['mochilas']) <= 5 then
			local text = 'error'
			while Vdist2(GetEntityCoords(PlayerPedId()), v['mochilas']) <= 5 do
					text = (Strings['Press_E']):format(Strings['mochilas'])
					HelpText(text, v['mochilas']) 
					if IsControlJustReleased(0, 38) then
						OpenShopMochilas()
					end
					Wait(0)
				end
			end
		
		if (isInMarker and not hasAlreadyEnteredMarker) then
			hasAlreadyEnteredMarker = true
			TriggerEvent('pz_hatsandbags:hasEnteredMarker')
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('pz_hatsandbags:hasExitedMarker')
		end
		end
  	end
end)



AddEventHandler('pz_hatsandbags:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	currentAction = nil

	if not hasPaid then
			TriggerEvent('esx_skin:getLastSkin', function(skin)
			TriggerEvent('skinchanger:loadSkin', skin)
		end)
	end
end)

AddEventHandler('pz_hatsandbags:hasEnteredMarker', function(zone)
	currentAction     = 'shop_confirm'
	currentActionMsg  = 'Abrir menu'
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