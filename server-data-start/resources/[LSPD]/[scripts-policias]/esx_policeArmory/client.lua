--------------------------------
------- Created by Hamza -------
-------------------------------- 

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local weaponStorage = {}

-- // Function for 3D text // --
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 500
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 80)
end

-- // CORE THREAD // --
Citizen.CreateThread(function()
	Citizen.Wait(1000)
	while true do
		if ESX.PlayerData.job and (ESX.PlayerData.job.name == 'police') then
			for k,v in pairs(Config.PoliceArmory) do
				local ped = GetPlayerPed(-1)
				local pos = GetEntityCoords(ped)
				local distance = GetDistanceBetweenCoords(pos.x,pos.y,pos.z,v.x,v.y,v.z,false)
				if distance <= 8.0 then
					DrawMarker(Config.ArmoryMarker, v.x,v.y,v.z, 0.0, 0.0, 0.0, 0.0, 0, 0.0, 1.0, 1.0, 1.0, Config.ArmoryMarkerColor.r,Config.ArmoryMarkerColor.g,Config.ArmoryMarkerColor.b,Config.ArmoryMarkerColor.a, false, true, 2, true, false, false, false)						
					if distance <= 0.6 then
						DrawText3Ds(v.x,v.y,pos.z, "Pulsa ~g~[E]~s~ para abrir la ~y~Armeria~s~")
						if IsControlJustPressed(0, 38) then
							ESX.TriggerServerCallback("esx_policeArmory:checkStorage", function(stock) end)
							PoliceArmory()
						end
					end
				end
			end
		end
		Citizen.Wait(5)
	end
end)

PoliceArmory = function()
	local elements = {
		{ label = "Armas", action = "weapon_menu" },
		{ label = "Chaleco Anti-Balas", action = "kevlar_menu" },
		{ label = "Complementos", action = "attachments_menu" },
	}
	
	if ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'captain' or ESX.PlayerData.job.grade_name == 'lieutenant' or ESX.PlayerData.job.grade_name == 'sfsergeant' then
		table.insert(elements, {label = "Recargar stock", action = "restock_menu"})
	end
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_main_menu",
		{
			title    = "Armeria LSPD",
			align    = "right",
			elements = elements
		},
	function(data, menu)
		local action = data.current.action

		if action == "weapon_menu" then
			WeaponMenu()
		elseif action == "restock_menu" then
			RestockMenu()
		elseif action == "kevlar_menu" then
			KevlarMenu()
		elseif action == "attachments_menu" then
			AttachmentMenu()
		end	
	end, function(data, menu)
		menu.close()
	end, function(data, menu)
	end)
end

WeaponMenu = function()
	local storage = nil
	local elements = {}
	local ped = GetPlayerPed(-1)
	ESX.TriggerServerCallback("esx_policeArmory:checkStorage", function(stock)	
	local weapons = WeapSplit(stock[1].weapons, ", ")
	
	for k,v in pairs(Config.WeaponsInArmory) do
		local yes = false
		for z,x in pairs(weapons) do
			if x == v.weaponHash then
				yes = true
				table.insert(elements,{label = v.name .. " | Devolver", weaponhash = v.weaponHash, lendable = false})
			end
		end
		if yes == false then
			table.insert(elements,{label = v.name .. " | En stock", weaponhash = v.weaponHash, lendable = true})
		end
	end
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_weapon_storage",
		{
			title    = "Almacen de Armas",
			align    = "center",
			elements = elements
		},
	function(data, menu)
		menu.close()
		
		if data.current.lendable == true then
			print(data.current.weaponhash)
			local giveAmmo = (GetWeaponClipSize(GetHashKey(data.current.weaponhash)) > 0)
			if data.current.weaponhash == "WEAPON_STUNGUN" then
				giveAmmo = false
			end
			TriggerServerEvent("esx_policeArmory:takeWeapon", data.current.weaponhash, giveAmmo)
			TriggerServerEvent("esx_policeArmory:addToDB", data.current.weaponhash)
		elseif PedHasWeapon(data.current.weaponhash) then
			local giveAmmo = (GetWeaponClipSize(GetHashKey(data.current.weaponhash)) > 0)
			if data.current.weaponhash == "WEAPON_STUNGUN" then
				giveAmmo = false
			end
			TriggerServerEvent("esx_policeArmory:getWeapon", data.current.weaponhash, GetAmmoInPedWeapon(ped,GetHashKey(data.current.weaponhash)), giveAmmo)
			TriggerServerEvent("esx_policeArmory:remFromDB", data.current.weaponhash)
		else
			ESX.ShowNotification("Ya has sacado esta arma, contacta con el supervisor!")
		end
		
	end, function(data, menu)
		menu.close()
	end, function(data, menu)
	end)
	end)
end

function RestockMenu()
	local people = {}
	local elements = {}
	ESX.TriggerServerCallback("esx_policeArmory:SupervisorCheck", function(list) people = list end)
	Citizen.Wait(250)
	for k,v in pairs(people) do
		if v.job.name == "police" then
			table.insert(elements, {label = v.name, id = v.id})
		end
	end
	if next(elements) ~= nil then
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_restock_menu",
			{
				title    = "Recargar Armamento",
				align    = "center",
				elements = elements
			},
		function(data, menu)
			menu.close()
		TriggerServerEvent("esx_policeArmory:SupervisorRestock",data.current.id)
		end, function(data, menu)
			
			menu.close()
		end, function(data, menu)
		end)
	else
		ESX.ShowNotification("No police online")
	end
end

function KevlarMenu()
	local ped = GetPlayerPed(-1)
	local elements = {}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_kevlar_menu",
			{
				title    = "Chalecos Antibalas",
				align    = "center",
				elements = {
					{label = "Chaleco ultra ligero", armor = 25},
					{label = "Chaleco ligero", armor = 50},
					{label = "Chaleco medio", armor = 75},
					{label = "Chaleco completo", armor = 100},
					{label = "Remove Vest", armor = 0},
			}
			},
		function(data, menu)
			SetPedArmour(ped,data.current.armor)
			menu.close()
		end, function(data, menu)
			menu.close()
		end, function(data, menu)
		end)
end

function WeapSplit(inputstr, del)
    if del == nil then
            del = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..del.."]+)") do
            table.insert(t, str)
    end
    return t
end

function PedHasWeapon(hash)
	for k,v in pairs(ESX.GetPlayerData().loadout) do
		if v.name == hash then
			return true
		end
	end
	return false
end

function AttachmentMenu()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_attachment_menu",
		{
			title    = "Complementos",
			align    = "center",
			elements = {
				{label = "Get Attachments", attachment}
			}
		},
	function(data, menu)
		local ped = GetPlayerPed(-1)
		local WepHash = GetSelectedPedWeapon(ped)
		local attachment = data.current.attachment
		
		if GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PISTOL_MK2") then
			GiveWeaponComponentToPed(ped,GetSelectedPedWeapon(ped),0x43FD595B) -- flash light pistol mk2
			ESX.ShowNotification("~r~Pistola~s~: Ha ~b~equipado~s~ una ~y~linterna~s~")
		elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_CARBINERIFLE_MK2") then
			GiveWeaponComponentToPed(ped,GetSelectedPedWeapon(ped),0x7BC4CDDC) -- flash light rifle mk2
			ESX.ShowNotification("~r~Rifle~s~: Ha ~b~equipado~s~ una ~y~linterna~s~")
			GiveWeaponComponentToPed(ped,GetSelectedPedWeapon(ped),0x49B2945) -- scope rifle mk2
			ESX.ShowNotification("~r~Rifle~s~: You ~b~equipped~s~ a ~y~scope~s~")
		elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_SMG") then
			GiveWeaponComponentToPed(ped,GetSelectedPedWeapon(ped),0x7BC4CDDC) -- flashlight SMG
			ESX.ShowNotification("~r~SMG~s~: Ha ~b~equipado~s~ una ~y~linterna~s~")
			GiveWeaponComponentToPed(ped,GetSelectedPedWeapon(ped),0x3CC6BA57) -- scope SMG
			ESX.ShowNotification("~r~SMG~s~: You ~b~equipped~s~ a ~y~scope~s~")
		elseif GetSelectedPedWeapon(ped) == GetHashKey("WEAPON_PUMPSHOTGUN_MK2") then
			GiveWeaponComponentToPed(ped,GetSelectedPedWeapon(ped),0x7BC4CDDC) -- flash light SHOTGUN
			ESX.ShowNotification("~r~Shotgun~s~: Ha ~b~equipado~s~ una ~y~linterna~s~")
		else
			ESX.ShowNotification("Tienes que tener el arma en la mano")
		end
		
	end, function(data, menu)

		menu.close()
	end, function(data, menu)
	end)
end