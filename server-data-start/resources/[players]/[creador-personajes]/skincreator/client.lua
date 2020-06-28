------------------------------------------------------------------
--                          Variables
------------------------------------------------------------------
ESX = nil
local isMale = false
local isSkinCreatorOpened = false		-- Change this value to show/hide UI
local cam = -1							-- Camera control
local heading = 87.42				-- Heading coord
local zoom = "visage"					-- Define which tab is shown first (Default: Head)
local isCameraActive

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


------------------------------------------------------------------
--                          NUI
------------------------------------------------------------------

RegisterNUICallback('updateSkin', function(data)
	v = data.value
	-- Face
	dad = tonumber(data.dad)
	mum = tonumber(data.mum)
	sex = tonumber(data.sex)
	dadmumpercent = tonumber(data.dadmumpercent)
	skin = tonumber(data.skin)
	eyecolor = tonumber(data.eyecolor)
	skinproblem = tonumber(data.skinproblem)
	skinproblemopacity = tonumber(data.skinproblemopacity)
	freckle = tonumber(data.freckle)
	freckleopacity = tonumber(data.freckleopacity)
	wrinkle = tonumber(data.wrinkle)
	wrinkleopacity = tonumber(data.wrinkleopacity)
	hair = tonumber(data.hair)
	haircolor = tonumber(data.haircolor)
	haircolor2 = tonumber(data.haircolor2)
	eyebrow = tonumber(data.eyebrow)
	eyebrowopacity = tonumber(data.eyebrowopacity)
	beard = tonumber(data.beard)
	beardopacity = tonumber(data.beardopacity)
	beardcolor = tonumber(data.beardcolor)
	makeuptype = tonumber(data.makeuptype)
	makeupintensidad = tonumber(data.makeupintensidad)
	makeupcolor1 = tonumber(data.makeupcolor1)
	makeupcolor2 = tonumber(data.makeupcolor2)
	lipsticktype = tonumber(data.lipsticktype)
	lipstickintensidad = tonumber(data.lipstickintensidad)
	lipstickcolor1 = tonumber(data.lipstickcolor1)
	blushtype = tonumber(data.blushtype)
	blushintensidad = tonumber(data.blushintensidad)
	blushcolor = tonumber(data.blushcolor)
	-- Clothes
	hats = tonumber(data.hats)
	glasses = tonumber(data.glasses)
	ears = tonumber(data.ears)
	tops = tonumber(data.tops)
	pants = tonumber(data.pants)
	shoes = tonumber(data.shoes)
	watches = tonumber(data.watches)
	-- Ropa de tia
	hats2 = tonumber(data.hats2)
	glasses2 = tonumber(data.glasses2)
	ears2 = tonumber(data.ears2)
	tops2 = tonumber(data.tops2)
	pants2 = tonumber(data.pants2)
	shoes2 = tonumber(data.shoes2)
	watches2 = tonumber(data.watches2)
	if(v == true) then
		local ped = GetPlayerPed(-1)
		local torso = GetPedDrawableVariation(ped, 3)
		local torsotext = GetPedTextureVariation(ped, 3)
		local leg = GetPedDrawableVariation(ped, 4)
		local legtext = GetPedTextureVariation(ped, 4)
		local shoes = GetPedDrawableVariation(ped, 6)
		local shoestext = GetPedTextureVariation(ped, 6)
		local accessory = GetPedDrawableVariation(ped, 7)
		local accessorytext = GetPedTextureVariation(ped, 7)
		local undershirt = GetPedDrawableVariation(ped, 8)
		local undershirttext = GetPedTextureVariation(ped, 8)
		local torso2 = GetPedDrawableVariation(ped, 11)
		local torso2text = GetPedTextureVariation(ped, 11)
		local prop_hat = GetPedPropIndex(ped, 0)
		local prop_hat_text = GetPedPropTextureIndex(ped, 0)
		local prop_glasses = GetPedPropIndex(ped, 1)
		local prop_glasses_text = GetPedPropTextureIndex(ped, 1)
		local prop_earrings = GetPedPropIndex(ped, 2)
		local prop_earrings_text = GetPedPropTextureIndex(ped, 2)
		local prop_watches = GetPedPropIndex(ped, 6)
		local prop_watches_text = GetPedPropTextureIndex(ped, 6)

		if isMale then
			TriggerServerEvent("updateSkin", dad, mum, sex, dadmumpercent, skin, eyecolor, skinproblem, freckle, wrinkle, wrinkleopacity, eyebrow, eyebrowopacity, beard, beardopacity, beardcolor, hair, haircolor, torso, torsotext, leg, legtext, shoes, shoestext, accessory, accessorytext, undershirt, undershirttext, torso2, torso2text, prop_hat, prop_hat_text, prop_glasses, prop_glasses_text, prop_earrings, prop_earrings_text, prop_watches, prop_watches_text)
			TriggerServerEvent("guardarskin", dad, mum, sex, dadmumpercent, skin, eyecolor, skinproblem, skinproblemopacity, freckle, freckleopacity, wrinkle, wrinkleopacity, eyebrow, eyebrowopacity, beard, beardopacity, beardcolor, hair, haircolor, haircolor2, torso, torsotext, leg, legtext, shoes, shoestext, accessory, accessorytext, undershirt, undershirttext, torso2, torso2text, prop_hat, prop_hat_text, prop_glasses, prop_glasses_text, prop_earrings, prop_earrings_text, prop_watches, prop_watches_text, makeuptype, makeupintensidad, makeupcolor1, makeupcolor2, lipsticktype, lipstickintensidad, lipstickcolor1, blushtype, blushintensidad, blushcolor)
		else
			TriggerServerEvent("updateSkin", dad, mum, sex, dadmumpercent, skin, eyecolor, skinproblem, freckle, wrinkle, wrinkleopacity, eyebrow, eyebrowopacity, beard, beardopacity, beardcolor, hair, haircolor, torso, torsotext, leg, legtext, shoes, shoestext, accessory, accessorytext, undershirt, undershirttext, torso2, torso2text, prop_hat, prop_hat_text, prop_glasses, prop_glasses_text, prop_earrings, prop_earrings_text, prop_watches, prop_watches_text)
			TriggerServerEvent("guardarskin2", dad, mum, sex, dadmumpercent, skin, eyecolor, skinproblem, skinproblemopacity, freckle, freckleopacity, wrinkle, wrinkleopacity, eyebrow, eyebrowopacity, beard, beardopacity, beardcolor, hair, haircolor, haircolor2, torso, torsotext, leg, legtext, shoes, shoestext, accessory, accessorytext, undershirt, undershirttext, torso2, torso2text, prop_hat, prop_hat_text, prop_glasses, prop_glasses_text, prop_earrings, prop_earrings_text, prop_watches, prop_watches_text, makeuptype, makeupintensidad, makeupcolor1, makeupcolor2, lipsticktype, lipstickintensidad, lipstickcolor1, blushtype, blushintensidad, blushcolor)
		end

		CloseSkinCreator()
		Citizen.Wait(500)
		ESX.TriggerServerCallback('skincreator:getSkin', function(skin, jobSkin)
			local laskin = skin
			TriggerEvent('skinchanger:loadSkin', laskin)
			TriggerEvent('esx_skin:save', laskin)
		end)
		
	else
		SetPedDefaultComponentVariation(GetPlayerPed(-1))

		-- Face
		SetPedHeadBlendData			(GetPlayerPed(-1), dad, mum, dad, skin, skin, skin, dadmumpercent * 0.1, dadmumpercent * 0.1, 1.0, true)
		
		if sex == 0 then
			TriggerEvent('skinchanger:loadSkin', {sex = 0})
			SetPedHeadBlendData			(GetPlayerPed(-1), dad, mum, dad, skin, skin, skin, dadmumpercent * 0.1, dadmumpercent * 0.1, 1.0, true)
			isMale = true
			IsFemale(false)
			IsMale(true)
		else
			TriggerEvent('skinchanger:loadSkin', {sex = 1})
			SetPedHeadBlendData			(GetPlayerPed(-1), dad, mum, mum, skin, skin, skin, dadmumpercent * 0.1, dadmumpercent * 0.1, 1.0, true)
			isMale = false
			IsMale(false)
			IsFemale(true)	
		end
		SetPedEyeColor				(GetPlayerPed(-1), eyecolor)
		SetPedHeadOverlay			(GetPlayerPed(-1), 6, skinproblem, skinproblemopacity * 0.1)
		SetPedHeadOverlay			(GetPlayerPed(-1), 9, freckle, freckleopacity * 0.1)
		SetPedHeadOverlay       	(GetPlayerPed(-1), 3, wrinkle, wrinkleopacity * 0.1)
		SetPedComponentVariation	(GetPlayerPed(-1), 2, hair, 0, 2)
		SetPedHairColor				(GetPlayerPed(-1), haircolor, haircolor2)
		SetPedHeadOverlay       	(GetPlayerPed(-1), 2, eyebrow, eyebrowopacity * 0.1) 
		SetPedHeadOverlay       	(GetPlayerPed(-1), 1, beard, beardopacity * 0.1)   
		SetPedHeadOverlayColor  	(GetPlayerPed(-1), 1, 1, beardcolor, beardcolor) 
		SetPedHeadOverlayColor  	(GetPlayerPed(-1), 2, 1, beardcolor, beardcolor)
		SetPedHeadOverlay       	(GetPlayerPed(-1), 8, lipsticktype, lipstickintensidad * 0.1) -- lipstick
		SetPedHeadOverlayColor  	(GetPlayerPed(-1), 8, 1, lipstickcolor1, 0)      -- Lipstick Color
		SetPedHeadOverlay       	(GetPlayerPed(-1), 4, makeuptype, makeupintensidad * 0.1) 	-- Makeup
		SetPedHeadOverlayColor  	(GetPlayerPed(-1), 4, 1, makeupcolor1, makeupcolor2)    -- Makeup Color
		SetPedHeadOverlay			(GetPlayerPed(-1), 5, blushtype, blushintensidad * 0.1)			-- Blush + opacity
		SetPedHeadOverlayColor		(GetPlayerPed(-1), 5, 2, blushcolor)	-- Blush Color

		if isMale then
		-- Clothes variations
			if hats == 0 then		ClearPedProp(GetPlayerPed(-1), 0)
			elseif hats == 1 then	SetPedPropIndex(GetPlayerPed(-1), 0, 3-1, 1-1, 2)
			elseif hats == 2 then	SetPedPropIndex(GetPlayerPed(-1), 0, 3-1, 7-1, 2)
			elseif hats == 3 then	SetPedPropIndex(GetPlayerPed(-1), 0, 4-1, 3-1, 2)
			elseif hats == 4 then	SetPedPropIndex(GetPlayerPed(-1), 0, 5-1, 1-1, 2)
			elseif hats == 5 then	SetPedPropIndex(GetPlayerPed(-1), 0, 5-1, 2-1, 2)
			elseif hats == 6 then	SetPedPropIndex(GetPlayerPed(-1), 0, 6-1, 1-1, 2)
			elseif hats == 7 then	SetPedPropIndex(GetPlayerPed(-1), 0, 8-1, 1-1, 2)
			elseif hats == 8 then	SetPedPropIndex(GetPlayerPed(-1), 0, 8-1, 2-1, 2)
			elseif hats == 9 then	SetPedPropIndex(GetPlayerPed(-1), 0, 8-1, 3-1, 2)
			elseif hats == 10 then	SetPedPropIndex(GetPlayerPed(-1), 0, 8-1, 6-1, 2)
			elseif hats == 11 then	SetPedPropIndex(GetPlayerPed(-1), 0, 11-1, 6-1, 2)
			elseif hats == 12 then	SetPedPropIndex(GetPlayerPed(-1), 0, 10-1, 6-1, 2)
			elseif hats == 13 then	SetPedPropIndex(GetPlayerPed(-1), 0, 11-1, 8-1, 2)
			elseif hats == 14 then	SetPedPropIndex(GetPlayerPed(-1), 0, 10-1, 8-1, 2)
			elseif hats == 15 then	SetPedPropIndex(GetPlayerPed(-1), 0, 13-1, 1-1, 2)
			elseif hats == 16 then	SetPedPropIndex(GetPlayerPed(-1), 0, 13-1, 2-1, 2)
			elseif hats == 17 then	SetPedPropIndex(GetPlayerPed(-1), 0, 14-1, 3-1, 2)
			elseif hats == 18 then	SetPedPropIndex(GetPlayerPed(-1), 0, 15-1, 1-1, 2)
			elseif hats == 19 then	SetPedPropIndex(GetPlayerPed(-1), 0, 15-1, 2-1, 2)
			elseif hats == 20 then	SetPedPropIndex(GetPlayerPed(-1), 0, 16-1, 2-1, 2)
			elseif hats == 21 then	SetPedPropIndex(GetPlayerPed(-1), 0, 16-1, 3-1, 2)
			elseif hats == 22 then	SetPedPropIndex(GetPlayerPed(-1), 0, 21-1, 6-1, 2)
			elseif hats == 23 then	SetPedPropIndex(GetPlayerPed(-1), 0, 22-1, 1-1, 2)
			elseif hats == 24 then	SetPedPropIndex(GetPlayerPed(-1), 0, 26-1, 2-1, 2)
			elseif hats == 25 then	SetPedPropIndex(GetPlayerPed(-1), 0, 27-1, 1-1, 2)
			elseif hats == 26 then	SetPedPropIndex(GetPlayerPed(-1), 0, 28-1, 1-1, 2)
			elseif hats == 27 then	SetPedPropIndex(GetPlayerPed(-1), 0, 35-1, 0, 2)
			elseif hats == 28 then	SetPedPropIndex(GetPlayerPed(-1), 0, 56-1, 1-1, 2)
			elseif hats == 29 then	SetPedPropIndex(GetPlayerPed(-1), 0, 56-1, 2-1, 2)
			elseif hats == 30 then	SetPedPropIndex(GetPlayerPed(-1), 0, 56-1, 3-1, 2)
			elseif hats == 31 then	SetPedPropIndex(GetPlayerPed(-1), 0, 77-1, 20-1, 2)
			elseif hats == 32 then	SetPedPropIndex(GetPlayerPed(-1), 0, 97-1, 3-1, 2)
			end
			
			if glasses == 0 then		ClearPedProp(GetPlayerPed(-1), 1)
			elseif glasses == 1 then	SetPedPropIndex(GetPlayerPed(-1), 1, 4-1, 1-1, 2)
			elseif glasses == 2 then	SetPedPropIndex(GetPlayerPed(-1), 1, 4-1, 10-1, 2)
			elseif glasses == 3 then	SetPedPropIndex(GetPlayerPed(-1), 1, 5-1, 5-1, 2)
			elseif glasses == 4 then	SetPedPropIndex(GetPlayerPed(-1), 1, 5-1, 10-1, 2)
			elseif glasses == 5 then	SetPedPropIndex(GetPlayerPed(-1), 1, 6-1, 1-1, 2)
			elseif glasses == 6 then	SetPedPropIndex(GetPlayerPed(-1), 1, 6-1, 9-1, 2)
			elseif glasses == 7 then	SetPedPropIndex(GetPlayerPed(-1), 1, 8-1, 1-1, 2)
			elseif glasses == 8 then	SetPedPropIndex(GetPlayerPed(-1), 1, 9-1, 2-1, 2)
			elseif glasses == 9 then	SetPedPropIndex(GetPlayerPed(-1), 1, 10-1, 1-1, 2)
			elseif glasses == 10 then	SetPedPropIndex(GetPlayerPed(-1), 1, 16-1, 7-1, 2)
			elseif glasses == 11 then	SetPedPropIndex(GetPlayerPed(-1), 1, 18-1, 10-1, 2)
			elseif glasses == 12 then	SetPedPropIndex(GetPlayerPed(-1), 1, 26-1, 1-1, 2)
			end
		
			if ears == 0 then		ClearPedProp(GetPlayerPed(-1), 2)
			elseif ears == 1 then	SetPedPropIndex(GetPlayerPed(-1), 2, 4-1, 1-1, 2)
			elseif ears == 2 then	SetPedPropIndex(GetPlayerPed(-1), 2, 5-1, 1-1, 2)
			elseif ears == 3 then	SetPedPropIndex(GetPlayerPed(-1), 2, 6-1, 1-1, 2)
			elseif ears == 4 then	SetPedPropIndex(GetPlayerPed(-1), 2, 10-1, 2-1, 2)
			elseif ears == 5 then	SetPedPropIndex(GetPlayerPed(-1), 2, 11-1, 2-1, 2)
			elseif ears == 6 then	SetPedPropIndex(GetPlayerPed(-1), 2, 12-1, 2-1, 2)
			elseif ears == 7 then	SetPedPropIndex(GetPlayerPed(-1), 2, 19-1, 4-1, 2)
			elseif ears == 8 then	SetPedPropIndex(GetPlayerPed(-1), 2, 20-1, 4-1, 2)
			elseif ears == 9 then	SetPedPropIndex(GetPlayerPed(-1), 2, 21-1, 4-1, 2)
			elseif ears == 10 then	SetPedPropIndex(GetPlayerPed(-1), 2, 28-1, 1-1, 2)
			elseif ears == 11 then	SetPedPropIndex(GetPlayerPed(-1), 2, 29-1, 1-1, 2)
			elseif ears == 12 then	SetPedPropIndex(GetPlayerPed(-1), 2, 30-1, 1-1, 2)
			elseif ears == 13 then	SetPedPropIndex(GetPlayerPed(-1), 2, 31-1, 1-1, 2)
			elseif ears == 14 then	SetPedPropIndex(GetPlayerPed(-1), 2, 32-1, 1-1, 2)
			elseif ears == 15 then	SetPedPropIndex(GetPlayerPed(-1), 2, 33-1, 1-1, 2)
			end
		
			-- Keep these 4 variations together.
			-- It avoids empty arms or noisy clothes superposition
		
			if tops == 0 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 	-- t-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 15, 0, 2) 	-- Torso
			elseif tops == 1 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 		-- t-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 7, 2) 	-- Torso
			elseif tops == 2 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 0, 0, 2) 		-- t-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 4, 0, 2) 	-- Torso
			elseif tops == 3 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 11, 0, 2) 		-- t-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 6, 1, 2) 	-- Torso
			elseif tops == 4 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 6, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 		-- t-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 14, 0, 2) 	-- Torso
			elseif tops == 5 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 6, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 		-- t-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 78, 1, 2) 	-- Torso
			elseif tops == 6 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 6, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 111, 4, 2) 		-- t-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 191, 16, 2) 	-- Torso
			elseif tops == 7 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 11, 0, 2)		-- Torso
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 	-- Undershirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 42, 0, 2) 	-- Torso 2
			elseif tops == 8 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 2)		-- Torso
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 	-- Undershirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 50, 0, 2) 	-- Torso 2
			elseif tops == 9 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 2)		-- Torso
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 	-- Undershirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 86, 0, 2) 	-- Torso 2
			end
		
			if pants == 0 then
				if isMale then
					SetPedComponentVariation(GetPlayerPed(-1), 4, 61, 6, 2)
				else
					SetPedComponentVariation(GetPlayerPed(-1), 4, 15, 0, 2)
				end
			elseif pants == 1 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 0, 0, 2)
			elseif pants == 2 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 2, 11, 2)
			elseif pants == 3 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 3, 0, 2)
			elseif pants == 4 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 4, 0, 2)
			elseif pants == 5 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 5, 2, 2)
			elseif pants == 6 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 7, 0, 2)
			elseif pants == 7 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 9, 0, 2)
			elseif pants == 8 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 10, 0, 2)
			elseif pants == 9 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 12, 0, 2)
			elseif pants == 10 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 26, 4, 2)
			elseif pants == 11 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 42, 0, 2)
			elseif pants == 12 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 78, 0, 2)
			end
		
			if shoes == 0 then
				if isMale then
					SetPedComponentVariation(GetPlayerPed(-1), 6, 34, 0, 2)
				else
					SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 2)
				end
			elseif shoes == 1 then	SetPedComponentVariation(GetPlayerPed(-1), 6, 0, 10, 2)
			elseif shoes == 2 then	SetPedComponentVariation(GetPlayerPed(-1), 6, 1, 0, 2)
			elseif shoes == 3 then	SetPedComponentVariation(GetPlayerPed(-1), 6, 3, 14, 2)
			elseif shoes == 4 then SetPedComponentVariation(GetPlayerPed(-1), 6, 5, 0, 2)
			elseif shoes == 5 then SetPedComponentVariation(GetPlayerPed(-1), 6, 10, 0, 2)
			elseif shoes == 6 then SetPedComponentVariation(GetPlayerPed(-1), 6, 12, 0, 2)
			elseif shoes == 7 then SetPedComponentVariation(GetPlayerPed(-1), 6, 77, 0, 2)
			end
		
			if watches == 0 then		ClearPedProp(GetPlayerPed(-1), 6)
			elseif watches == 1 then	SetPedPropIndex(GetPlayerPed(-1), 6, 1-1, 1-1, 2)
			elseif watches == 2 then	SetPedPropIndex(GetPlayerPed(-1), 6, 2-1, 1-1, 2)
			elseif watches == 3 then	SetPedPropIndex(GetPlayerPed(-1), 6, 4-1, 1-1, 2)
			elseif watches == 4 then	SetPedPropIndex(GetPlayerPed(-1), 6, 4-1, 3-1, 2)
			elseif watches == 5 then	SetPedPropIndex(GetPlayerPed(-1), 6, 5-1, 1-1, 2)
			elseif watches == 6 then	SetPedPropIndex(GetPlayerPed(-1), 6, 9-1, 1-1, 2)
			elseif watches == 7 then	SetPedPropIndex(GetPlayerPed(-1), 6, 11-1, 1-1, 2)
			end
		else
			if hats2 == 0 then		ClearPedProp(GetPlayerPed(-1), 0)
			elseif hats2 == 1 then	SetPedPropIndex(GetPlayerPed(-1), 0, 3-1, 2-1, 2)
			elseif hats2 == 2 then	SetPedPropIndex(GetPlayerPed(-1), 0, 6-1, 1-1, 2)
			elseif hats2 == 3 then	SetPedPropIndex(GetPlayerPed(-1), 0, 6-1, 2-1, 2)
			elseif hats2 == 4 then	SetPedPropIndex(GetPlayerPed(-1), 0, 7-1, 1-1, 2)
			elseif hats2 == 5 then	SetPedPropIndex(GetPlayerPed(-1), 0, 10-1, 3-1, 2)
			elseif hats2 == 6 then	SetPedPropIndex(GetPlayerPed(-1), 0, 12-1, 2-1, 2)
			elseif hats2 == 7 then	SetPedPropIndex(GetPlayerPed(-1), 0, 13-1, 1-1, 2)
			elseif hats2 == 8 then	SetPedPropIndex(GetPlayerPed(-1), 0, 13-1, 8-1, 2)
			elseif hats2 == 9 then	SetPedPropIndex(GetPlayerPed(-1), 0, 15-1, 1-1, 2)
			elseif hats2 == 10 then	SetPedPropIndex(GetPlayerPed(-1), 0, 15-1, 6-1, 2)
			elseif hats2 == 11 then	SetPedPropIndex(GetPlayerPed(-1), 0, 22-1, 1-1, 2)
			elseif hats2 == 12 then	SetPedPropIndex(GetPlayerPed(-1), 0, 22-1, 3-1, 2)
			elseif hats2 == 13 then	SetPedPropIndex(GetPlayerPed(-1), 0, 23-1, 1-1, 2)
			elseif hats2 == 14 then	SetPedPropIndex(GetPlayerPed(-1), 0, 27-1, 1-1, 2)
			elseif hats2 == 15 then	SetPedPropIndex(GetPlayerPed(-1), 0, 27-1, 3-1, 2)
			elseif hats2 == 16 then	SetPedPropIndex(GetPlayerPed(-1), 0, 27-1, 11-1, 2)
			elseif hats2 == 17 then	SetPedPropIndex(GetPlayerPed(-1), 0, 28-1, 1-1, 2)
			elseif hats2 == 18 then	SetPedPropIndex(GetPlayerPed(-1), 0, 28-1, 14-1, 2)
			elseif hats2 == 19 then	SetPedPropIndex(GetPlayerPed(-1), 0, 55-1, 1-1, 2)
			elseif hats2 == 20 then	SetPedPropIndex(GetPlayerPed(-1), 0, 55-1, 6-1, 2)
			elseif hats2 == 21 then	SetPedPropIndex(GetPlayerPed(-1), 0, 55-1, 8-1, 2)
			elseif hats2 == 22 then	SetPedPropIndex(GetPlayerPed(-1), 0, 56-1, 1-1, 2)
			elseif hats2 == 23 then	SetPedPropIndex(GetPlayerPed(-1), 0, 56-1, 3-1, 2)
			elseif hats2 == 24 then	SetPedPropIndex(GetPlayerPed(-1), 0, 56-1, 5-1, 2)
			elseif hats2 == 25 then	SetPedPropIndex(GetPlayerPed(-1), 0, 56-1, 8-1, 2)
			elseif hats2 == 26 then	SetPedPropIndex(GetPlayerPed(-1), 0, 56-1, 15-1, 2)
			elseif hats2 == 27 then	SetPedPropIndex(GetPlayerPed(-1), 0, 56-1, 24-1, 2)
			elseif hats2 == 28 then	SetPedPropIndex(GetPlayerPed(-1), 0, 56-1, 25-1, 2)
			elseif hats2 == 29 then	SetPedPropIndex(GetPlayerPed(-1), 0, 95-1, 5-1, 2)
			elseif hats2 == 30 then	SetPedPropIndex(GetPlayerPed(-1), 0, 64-1, 9-1, 2)
			elseif hats2 == 31 then	SetPedPropIndex(GetPlayerPed(-1), 0, 64-1, 10-1, 2)
			elseif hats2 == 32 then	SetPedPropIndex(GetPlayerPed(-1), 0, 83-1, 1-1, 2)
			elseif hats2 == 33 then	SetPedPropIndex(GetPlayerPed(-1), 0, 83-1, 3-1, 2)
			elseif hats2 == 34 then	SetPedPropIndex(GetPlayerPed(-1), 0, 83-1, 6-1, 2)
			elseif hats2 == 35 then	SetPedPropIndex(GetPlayerPed(-1), 0, 77-1, 1-1, 2)
			elseif hats2 == 36 then	SetPedPropIndex(GetPlayerPed(-1), 0, 77-1, 2-1, 2)
			elseif hats2 == 37 then	SetPedPropIndex(GetPlayerPed(-1), 0, 77-1, 5-1, 2)
			elseif hats2 == 38 then	SetPedPropIndex(GetPlayerPed(-1), 0, 77-1, 6-1, 2)
			elseif hats2 == 39 then	SetPedPropIndex(GetPlayerPed(-1), 0, 77-1, 20-1, 2)
			elseif hats2 == 40 then	SetPedPropIndex(GetPlayerPed(-1), 0, 77-1, 12-1, 2)
			elseif hats2 == 41 then	SetPedPropIndex(GetPlayerPed(-1), 0, 77-1, 11-1, 2)
			elseif hats2 == 42 then	SetPedPropIndex(GetPlayerPed(-1), 0, 77-1, 10-1, 2)
			end
			
			if glasses2 == 0 then		ClearPedProp(GetPlayerPed(-1), 1)
			elseif glasses2 == 1 then	SetPedPropIndex(GetPlayerPed(-1), 1, 2-1, 2-1, 2)
			elseif glasses2 == 2 then	SetPedPropIndex(GetPlayerPed(-1), 1, 2-1, 4-1, 2)
			elseif glasses2 == 3 then	SetPedPropIndex(GetPlayerPed(-1), 1, 2-1, 7-1, 2)
			elseif glasses2 == 4 then	SetPedPropIndex(GetPlayerPed(-1), 1, 10-1, 2-1, 2)
			elseif glasses2 == 5 then	SetPedPropIndex(GetPlayerPed(-1), 1, 21-1, 6-1, 2)
			elseif glasses2 == 6 then	SetPedPropIndex(GetPlayerPed(-1), 1, 25-1, 2-1, 2)
			elseif glasses2 == 7 then	SetPedPropIndex(GetPlayerPed(-1), 1, 25-1, 1-1, 2)
			elseif glasses2 == 8 then	SetPedPropIndex(GetPlayerPed(-1), 1, 22-1, 5-1, 2)
			elseif glasses2 == 9 then	SetPedPropIndex(GetPlayerPed(-1), 1, 22-1, 1-1, 2)
			elseif glasses2 == 10 then	SetPedPropIndex(GetPlayerPed(-1), 1, 12-1, 1-1, 2)
			elseif glasses2 == 11 then	SetPedPropIndex(GetPlayerPed(-1), 1, 12-1, 7-1, 2)
			elseif glasses2 == 12 then	SetPedPropIndex(GetPlayerPed(-1), 1, 12-1, 12-1, 2)
			end
		
			if ears2 == 0 then		ClearPedProp(GetPlayerPed(-1), 2)
			elseif ears2 == 1 then	SetPedPropIndex(GetPlayerPed(-1), 2, 4-1, 1-1, 2)
			elseif ears2 == 2 then	SetPedPropIndex(GetPlayerPed(-1), 2, 5-1, 1-1, 2)
			elseif ears2 == 3 then	SetPedPropIndex(GetPlayerPed(-1), 2, 6-1, 1-1, 2)
			elseif ears2 == 4 then	SetPedPropIndex(GetPlayerPed(-1), 2, 10-1, 2-1, 2)
			elseif ears2 == 5 then	SetPedPropIndex(GetPlayerPed(-1), 2, 11-1, 2-1, 2)
			elseif ears2 == 6 then	SetPedPropIndex(GetPlayerPed(-1), 2, 12-1, 2-1, 2)
			elseif ears2 == 7 then	SetPedPropIndex(GetPlayerPed(-1), 2, 19-1, 4-1, 2)
			elseif ears2 == 8 then	SetPedPropIndex(GetPlayerPed(-1), 2, 20-1, 4-1, 2)
			elseif ears2 == 9 then	SetPedPropIndex(GetPlayerPed(-1), 2, 21-1, 4-1, 2)
			elseif ears2 == 10 then	SetPedPropIndex(GetPlayerPed(-1), 2, 28-1, 1-1, 2)
			elseif ears2 == 11 then	SetPedPropIndex(GetPlayerPed(-1), 2, 29-1, 1-1, 2)
			elseif ears2 == 12 then	SetPedPropIndex(GetPlayerPed(-1), 2, 30-1, 1-1, 2)
			elseif ears2 == 13 then	SetPedPropIndex(GetPlayerPed(-1), 2, 31-1, 1-1, 2)
			elseif ears2 == 14 then	SetPedPropIndex(GetPlayerPed(-1), 2, 32-1, 1-1, 2)
			elseif ears2 == 15 then	SetPedPropIndex(GetPlayerPed(-1), 2, 33-1, 1-1, 2)
			end
		
			-- Keep these 4 variations together.
			-- It avoids empty arms or noisy clothes superposition
		
			if tops2 == 0 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 2)		-- Torso
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 	-- Undershirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 15, 0, 2) 	-- Torso 2

			elseif tops2 == 1 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 2)		-- Torso
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 		-- Undershirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 0, 4, 2) 	-- Torso 2
			elseif tops2 == 2 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 14, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 125, 9, 2) 	-- Torso
			elseif tops2 == 3 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 3, 4, 2) 	-- Torso
			elseif tops2 == 4 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 3, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 38, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 24, 0, 2) 	-- Torso
			elseif tops2 == 5 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 4, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 74, 0, 2) 	-- Torso
			elseif tops2 == 6 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 1, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 192, 19, 2) 	-- Torso
			elseif tops2 == 7 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 12, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 26, 0, 2) 	-- Torso
			elseif tops2 == 8 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 9, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 79, 0, 2) 	-- Torso
			elseif tops2 == 9 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 0, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 121, 16, 2) 	-- Torso
			elseif tops2 == 10 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 11, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 117, 2, 2) 	-- Torso
			elseif tops2 == 11 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 4, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 37, 4, 2) 	-- Torso
			elseif tops2 == 12 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 5, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 22, 2, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 8, 2, 2) 	-- Torso
			elseif tops2 == 13 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 171, 0, 2) 	-- Torso
			elseif tops2 == 14 then
				SetPedComponentVariation(GetPlayerPed(-1), 3, 15, 0, 2)		-- Arms
				SetPedComponentVariation(GetPlayerPed(-1), 7, 0, 0, 2) 		-- Neck
				SetPedComponentVariation(GetPlayerPed(-1), 8, 14, 0, 2) 	-- T-shirt
				SetPedComponentVariation(GetPlayerPed(-1), 11, 195, 6, 2) 	-- Torso
			end
		
			if pants2 == 0 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 15, 0, 2)
			elseif pants2 == 1 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 14, 4, 2)
			elseif pants2 == 2 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 8, 0, 2)
			elseif pants2 == 3 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 23, 12, 2)
			elseif pants2 == 4 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 43, 0, 2)
			elseif pants2 == 5 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 2, 2, 2)
			elseif pants2 == 6 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 80, 4, 2)
			elseif pants2 == 7 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 109, 0, 2)
			elseif pants2 == 8 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 78, 1, 2)
			elseif pants2 == 9 then	SetPedComponentVariation(GetPlayerPed(-1), 4, 24, 11, 2)
			end
		
			if shoes2 == 0 then	SetPedComponentVariation(GetPlayerPed(-1), 6, 35, 0, 2)
			elseif shoes2 == 1 then	SetPedComponentVariation(GetPlayerPed(-1), 6, 0, 0, 2)
			elseif shoes2 == 2 then	SetPedComponentVariation(GetPlayerPed(-1), 6, 7, 8, 2)
			elseif shoes2 == 3 then SetPedComponentVariation(GetPlayerPed(-1), 6, 1, 1, 2)
			elseif shoes2 == 4 then SetPedComponentVariation(GetPlayerPed(-1), 6, 32, 1, 2)
			elseif shoes2 == 5 then SetPedComponentVariation(GetPlayerPed(-1), 6, 11, 1, 2)
			elseif shoes2 == 6 then SetPedComponentVariation(GetPlayerPed(-1), 6, 15, 0, 2) 
			elseif shoes2 == 7 then SetPedComponentVariation(GetPlayerPed(-1), 6, 16, 0, 2)
			elseif shoes2 == 8 then SetPedComponentVariation(GetPlayerPed(-1), 6, 20, 8, 2)
			end
		
			if watches2 == 0 then		ClearPedProp(GetPlayerPed(-1), 6)
			elseif watches2 == 1 then	SetPedPropIndex(GetPlayerPed(-1), 6, 1-1, 1-1, 2)
			elseif watches2 == 2 then	SetPedPropIndex(GetPlayerPed(-1), 6, 2-1, 1-1, 2)
			elseif watches2 == 3 then	SetPedPropIndex(GetPlayerPed(-1), 6, 4-1, 1-1, 2)
			elseif watches2 == 4 then	SetPedPropIndex(GetPlayerPed(-1), 6, 4-1, 3-1, 2)
			elseif watches2 == 5 then	SetPedPropIndex(GetPlayerPed(-1), 6, 5-1, 1-1, 2)
			elseif watches2 == 6 then	SetPedPropIndex(GetPlayerPed(-1), 6, 9-1, 1-1, 2)
			elseif watches2 == 7 then	SetPedPropIndex(GetPlayerPed(-1), 6, 11-1, 1-1, 2)
			end
		end
		
		-- Unused yet
		-- These presets will be editable in V2 release
		   	-- Lipstick
		
		
		SetPedComponentVariation	(GetPlayerPed(-1), 1,  0,0, 2)    	-- Mask
	end
end)

-- Character rotation
RegisterNUICallback('rotateleftheading', function(data)
	local currentHeading = GetEntityHeading(GetPlayerPed(-1))
	heading = currentHeading+tonumber(data.value)
end)

RegisterNUICallback('rotaterightheading', function(data)
	local currentHeading = GetEntityHeading(GetPlayerPed(-1))
	heading = currentHeading-tonumber(data.value)
end)

-- Define which part of the body must be zoomed
RegisterNUICallback('zoom', function(data)
	zoom = data.zoom
end)


------------------------------------------------------------------
--                          Functions
------------------------------------------------------------------
function CloseSkinCreator()
	local ped = PlayerPedId()
	isSkinCreatorOpened = false
	ShowSkinCreator(false)
	isCameraActive = false
	SetCamActive(cam, false)
	RenderScriptCams(false, true, 500, true, true)
	cam = nil
	
	-- Player
	SetPlayerInvincible(ped, false)

	-- Llamando al spawner
	TriggerEvent("pz_spawnselector:showmenu")
end

function IsMale(enable3)
	--SetNuiFocus(enable3)
	SendNUIMessage({
		openMale = enable3
	})
end

function IsFemale(enable2)
	--SetNuiFocus(enable2)
	SendNUIMessage({
		openFemale = enable2
	})
end

function ShowSkinCreator(enable)
	SetNuiFocus(enable, enable)
	SendNUIMessage({
		openSkinCreator = enable
	})
end

RegisterNetEvent('hud:loadMenu')
AddEventHandler('hud:loadMenu', function()
	isCameraActive = true
	ShowSkinCreator(true)
end)

-- Disable Controls
-- TODO: Reset controls when player confirm his character creation
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isCameraActive == true then
			DisableControlAction(2, 14, true)
			DisableControlAction(2, 15, true)
			DisableControlAction(2, 16, true)
			DisableControlAction(2, 17, true)
			DisableControlAction(2, 30, true)
			DisableControlAction(2, 31, true)
			DisableControlAction(2, 32, true)
			DisableControlAction(2, 33, true)
			DisableControlAction(2, 34, true)
			DisableControlAction(2, 35, true)
			DisableControlAction(0, 25, true)
			DisableControlAction(0, 24, true)

			local ped = PlayerPedId()

			-- Player
			SetPlayerInvincible(ped, true)

			-- Camera
			RenderScriptCams(false, false, 0, 1, 0)
			DestroyCam(cam, false)
			if(not DoesCamExist(cam)) then
				cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
				SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
				SetCamRot(cam, 0.0, 0.0, 0.0)
				SetCamActive(cam,  true)
				RenderScriptCams(true,  false,  0,  true,  true)
				SetCamCoord(cam, GetEntityCoords(GetPlayerPed(-1)))
			end
			local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
			if zoom == "visage" or zoom == "pilosite" then
				SetCamCoord(cam, x+0.2, y+0.5, z+0.7)
				SetCamRot(cam, 0.0, 0.0, 150.0)
			elseif zoom == "vetements" then
				SetCamCoord(cam, x+0.3, y+2.0, z+0.0)
				SetCamRot(cam, 0.0, 0.0, 170.0)
			elseif zoom == "vetements2" then
				SetCamCoord(cam, x-1.5, y, z+0.0)
				SetCamRot(cam, 0.0, 0.0, 270.0)
			end
			SetEntityHeading(GetPlayerPed(-1), heading)
		else
			Citizen.Wait(500)
		end
	end

end)
