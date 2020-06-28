

ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(0)
    end
end)

local health
local multi
local pulse = 70
local area = "Ninguna"
local lastHit
local blood = 100
local bleeding = 0
local dead = false
local timer = 0
local timer2 = 0
local BoneList = Config.PedBones
local damaged = false
local brazo = false
local pierna = false
local headache = false

local tablahuesos = {}

local cPulse = -1
local cBlood = -1
local cNameF = ""
local cNameL = ""
local cArea = ""
local cBleeding = "NINGUNO"


function CheckBone()  
	ClearPedLastDamageBone(GetPlayerPed(-1))
	Wait(500)
	local _found,_boneId = GetPedLastDamageBone(GetPlayerPed(-1))
	if not _found then return false; end
	for bType,v in pairs(BoneList) do
	  for bone,boneId in pairs(v) do
		if boneId == _boneId then return bone,bType; end
	  end
	end; return false
end

AddEventHandler('esx:onPlayerDeath', function(data)
	health = GetEntityHealth(GetPlayerPed(-1))
	blood = 100
	dead = true
end)

Citizen.CreateThread( function()
	while true do
		Wait(100)
		local hp = GetEntityHealth(GetPlayerPed(-1))
		if hp >= 1 and not dead and bleeding >= 1 then
			Wait(19900)
			SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
			local actualhp = hp - bleeding
			SetEntityHealth(GetPlayerPed(-1), actualhp)
		end
		if hp >= 1 and dead then
			dead = false
			bleeding = 0
			blood = 100
		end
		if dead and blood > 0 then
			blood = blood - bleeding
		end
	end
end)

Citizen.CreateThread(function ()
	while true do
		Wait(1)
		if damaged then
			
			RequestAnimSet("move_m@injured")
			local plyPed = GetPlayerPed(-1)
			local plyId = PlayerId()
		
			if headache then
				SetTimecycleModifier('BarryFadeOut')
				SetTimecycleModifierStrength(math.min(5 / 10, 0.6))
			-- else
			-- 	ClearTimecycleModifier() 
			end
			
			if brazo then 
				if IsPedShooting(plyPed) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 2.5 / 10.0)
				end
			end
		
			if pierna then
				SetPedMoveRateOverride(plyPed, 0.8)
				SetPedMovementClipset(plyPed, "move_m@injured", true)
			-- else
			-- 	ResetPedMovementClipset(GetPlayerPed(-1))
			-- 	ResetPedWeaponMovementClipset(GetPlayerPed(-1))
			-- 	ResetPedStrafeClipset(GetPlayerPed(-1))
			-- 	SetPedMoveRateOverride(plyPed, 1.0)
			end
		end
	end
end)

function Aplicarheridanosangrante()
	
	local hueso, tipohueso = CheckBone()
	if hueso and tipohueso then
		if tipohueso == "Pierna D" then
			multi = 1.0
			if not has_value(tablahuesos, "Pierna D") then
				table.insert(tablahuesos,"Pierna D")
				bleeding = 0
				damaged = true
				pierna = true
				ESX.ShowNotification('Te has hecho daño en la Pierna Derecha')
			end
			area = "Pierna D"

		end
		if tipohueso == "Pierna I" then
			multi = 1.0
			if not has_value(tablahuesos, "Pierna I") then
				table.insert(tablahuesos,"Pierna I")
				bleeding = 0
				damaged = true
				pierna = true
				ESX.ShowNotification('Te has hecho daño en la Pierna Izquierda')
			end
			area = "Pierna I"
		end
		if tipohueso == "Brazo I" then
			multi = 1.0
			if not has_value(tablahuesos, "Brazo I") then
				table.insert(tablahuesos,"Brazo I")
				bleeding = 0
				damaged = true
				brazo = true
				ESX.ShowNotification('Te has hecho daño en el Brazo Izquierdo')
			end
			area = "Brazo I"
		end
		if tipohueso == "Brazo D" then
			multi = 1.0
			if not has_value(tablahuesos, "Brazo D") then
				table.insert(tablahuesos,"Brazo D")
				bleeding = 0
				damaged = true
				brazo = true
				ESX.ShowNotification('Te has hecho daño en el Brazo Derecho')
			end
			area = "Brazo D"
		end
		if tipohueso == "Cabeza" then
			multi = 3.0
			if not has_value(tablahuesos, "Cabeza") then
				table.insert(tablahuesos,"Cabeza")
				bleeding = 0
				damaged = true
				headache = true
				ESX.ShowNotification('Te has hecho daño en la cabeza')
			end
			area = "Cabeza"
		end
		if tipohueso == "Pecho" then
			multi = 2.0
			if not has_value(tablahuesos, "Torso") then
				table.insert(tablahuesos,"Torso")
				bleeding = 0
				damaged = true
				ESX.ShowNotification('Te has hecho daño en el torso')
			end
			area = "Torso"
		end
		ClearEntityLastDamageEntity(GetPlayerPed(-1))
		pulse = ((health / 4 + 20) * multi) + math.random(0, 4)
	end

end

function Aplicarherida()
	
	local hueso, tipohueso = CheckBone()
	if hueso and tipohueso then
		if tipohueso == "Pierna D" then
			multi = 1.0
			if not has_value(tablahuesos, "Pierna D") then
				table.insert(tablahuesos,"Pierna D")
				bleeding = bleeding + 1
				damaged = true
				pierna = true
				ESX.ShowNotification('Te has hecho daño en la Pierna Derecha')
			end
			area = "Pierna D"

		end
		if tipohueso == "Pierna I" then
			multi = 1.0
			if not has_value(tablahuesos, "Pierna I") then
				table.insert(tablahuesos,"Pierna I")
				bleeding = bleeding + 1
				damaged = true
				pierna = true
				ESX.ShowNotification('Te has hecho daño en la Pierna Izquierda')
			end
			area = "Pierna I"
		end
		if tipohueso == "Brazo I" then
			multi = 1.0
			if not has_value(tablahuesos, "Brazo I") then
				table.insert(tablahuesos,"Brazo I")
				bleeding = bleeding + 1
				damaged = true
				brazo = true
				ESX.ShowNotification('Te has hecho daño en el Brazo Izquierdo')
			end
			area = "Brazo I"
		end
		if tipohueso == "Brazo D" then
			multi = 1.0
			if not has_value(tablahuesos, "Brazo D") then
				table.insert(tablahuesos,"Brazo D")
				bleeding = bleeding + 1
				damaged = true
				brazo = true
				ESX.ShowNotification('Te has hecho daño en el Brazo Derecho')
			end
			area = "Brazo D"
		end
		if tipohueso == "Cabeza" then
			multi = 3.0
			if not has_value(tablahuesos, "Cabeza") then
				table.insert(tablahuesos,"Cabeza")
				bleeding = bleeding + 2
				damaged = true
				headache = true
				ESX.ShowNotification('Te has hecho daño en la cabeza')
			end
			area = "Cabeza"
		end
		if tipohueso == "Pecho" then
			multi = 2.0
			if not has_value(tablahuesos, "Torso") then
				table.insert(tablahuesos,"Torso")
				bleeding = bleeding + 2
				damaged = true
				ESX.ShowNotification('Te has hecho daño en el torso')
			end
			area = "Torso"
		end
		ClearEntityLastDamageEntity(GetPlayerPed(-1))
		ClearEntityLastWeaponDamage(GetPlayerPed(-1))
		pulse = ((health / 4 + 20) * multi) + math.random(0, 4)
	end

end


function HaUsadoArma(hash)
	local arma = HasEntityBeenDamagedByWeapon(GetPlayerPed(-1), hash, 0)

	if arma == 1 then
		return true
	else
		return false
	end
end


Citizen.CreateThread(function ()
	while true do
		Wait(1)
		
		if HasEntityBeenDamagedByAnyPed(GetPlayerPed(-1)) then

			if not HaUsadoArma(-1569615261) and not HaUsadoArma(1737195953) and not HaUsadoArma(-1786099057) and not HaUsadoArma(1141786504) and not HaUsadoArma(-656458692) and not HaUsadoArma(-1951375401) and not HaUsadoArma(911657153) and not HaUsadoArma(3452007600) then
				health = GetEntityHealth(GetPlayerPed(-1))
				blood = GetEntityHealth(GetPlayerPed(-1)) /2
				Aplicarherida()
			else
				ClearEntityLastDamageEntity(GetPlayerPed(-1))
				ClearEntityLastWeaponDamage(GetPlayerPed(-1))
			end

									
		-- elseif HasEntityBeenDamagedByAnyVehicle(GetPlayerPed(-1)) then
		-- 	Aplicarheridanosangrante()
		end
	end
end)

function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,100)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

RegisterNetEvent('medSystem:near')
AddEventHandler('medSystem:near', function(x,y,z, pulse, blood, area, bldn)
		
	
	local a,b,c = GetEntityCoords(GetPlayerPed(-1))
	
	if GetDistanceBetweenCoords(x,y,z,a,b,c,false) < 10 then
		timer = 20
		-- TriggerEvent('chatMessage', "MedSystem", {255,0 , 0}, "^1 [0-5] DEAD ^6[5-15] Needs hospital ^5[15-38] EMS Can help ^4[38-55] Police can help ^2[55+] Healthy")
		cBlood = blood
		cPulse = pulse
		cNameF = nameF
		cNameL = nameL
		cArea = area
		
		if bldn == 1 then
		cBleeding = "BAJO"
		elseif bldn == 2 then
		cBleeding = "MEDIO"
		elseif bldn == 5 then
		cBleeding = "SEVERO"
		elseif bldn == 0 then
		cBleeding = "NINGUNO"
		end
		
	else
		timer = 0
		cBlood = -1
		cPulse = -1
		cNameF = ""
		cNameL = ""
		cArea = ""
		cBleeding = "BAJO"
	end
	

end)

RegisterNetEvent('medSystem:near2')
AddEventHandler('medSystem:near2', function(x,y,z, pulse, blood, zonasheridas, bldn)
		
	
	local a,b,c = GetEntityCoords(GetPlayerPed(-1))
	
	if GetDistanceBetweenCoords(x,y,z,a,b,c,false) < 10 then
		timer2 = 15
		-- TriggerEvent('chatMessage', "MedSystem", {255,0 , 0}, "^1 [0-5] DEAD ^6[5-15] Needs hospital ^5[15-38] EMS Can help ^4[38-55] Police can help ^2[55+] Healthy")
		cBlood = blood
		cPulse = pulse
		cNameF = nameF
		cNameL = nameL
		-- cArea = area
		if next(zonasheridas) == nil then
			cArea = 'Ninguna'
		else
			cArea = table.concat(zonasheridas," ,")
		end
		
		if bldn == 1 then
		cBleeding = "BAJO"
		elseif bldn == 2 then
		cBleeding = "MEDIO"
		elseif bldn == 5 then
		cBleeding = "SEVERO"
		elseif bldn == 0 then
		cBleeding = "NINGUNO"
		end
		
	else
		timer2 = 0
		cBlood = -1
		cPulse = -1
		cNameF = ""
		cNameL = ""
		cArea = ""
		cBleeding = "BAJO"
	end
	

end)


Citizen.CreateThread( function()
	while true do
		Wait(1)
		while timer >= 1 do
			Wait(1)
			if cPulse ~= -1 and cBlood ~= -1 then
				DrawAdvancedText(0.7, 0.7, 0.005, 0.0028, 0.5,"~r~Pulso: ~w~" .. cPulse .. " PPM\n~r~Sangre: ~w~" .. cBlood .. "%~r~\n~r~Sangrado: ~w~" .. cBleeding, 255, 255, 255, 255, 4, 1)
			end
		end

		while timer2 >=1 do
			Wait(1)
			if cPulse ~= -1 and cBlood ~= -1 then
				DrawAdvancedText(0.7, 0.7, 0.005, 0.0028, 0.5,"~r~Zonas Afectadas: ~w~" .. cArea .. "\n~r~Sangrado: ~w~" .. cBleeding, 255, 255, 255, 255, 4, 1)
			end
		end
	end
end)

Citizen.CreateThread( function()
	while true do
		Wait(1000)
		if timer >= 1 then
			timer = timer - 1
		end
		if timer2 >= 1 then
			timer2 = timer2 -1
		end
	end
end)

RegisterNetEvent('medSystem:send')
AddEventHandler('medSystem:send', function(medico)
		
	local health = GetEntityHealth(source)
	if health > 0 then
		pulse = (health / 4 + math.random(19, 28)) 
	end
	local a, b, c = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
	TriggerServerEvent('medSystem:print', medico, math.floor(pulse * (blood / 90)), area, blood, a, b, c, bleeding)

end)

RegisterNetEvent('medSystem:usodebenda')
AddEventHandler('medSystem:usodebenda', function()
		
	if bleeding >= 1 then
		bleeding = bleeding - 1
		if bleeding >= 1 then
			ESX.ShowNotification('Te han ~b~vendado~w~ una ~r~herida~w~, pero aun sigues ~r~sangrando')
		else
			ESX.ShowNotification('~y~Has dejado de perder ~r~sangre')
		end
	end

end)

RegisterNetEvent('medSystem:senddamage')
AddEventHandler('medSystem:senddamage', function(medico)
		
	local health = GetEntityHealth(source)
	if health > 0 then
		pulse = (health / 4 + math.random(19, 28)) 
	end
	local a, b, c = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
	TriggerServerEvent('medSystem:print2', medico, math.floor(pulse * (blood / 90)), tablahuesos, blood, a, b, c, bleeding)

end)

RegisterNetEvent('medSystem:curar')
AddEventHandler('medSystem:curar', function(parte)
		
	if parte == 'cabeza' then
		
		if has_value(tablahuesos, "Cabeza") then
			for k,v in pairs(tablahuesos) do
				if v == "Cabeza" then
					table.remove(tablahuesos, k)
					ESX.ShowNotification('~b~Te han tratado las heridas de la ~y~cabeza. ~w~Dejas de sentirte aturdido')
				end
			end
			ClearTimecycleModifier()
			headache = false
		end

	elseif parte == 'brazo' then
		
		if has_value(tablahuesos, "Brazo D") or has_value(tablahuesos, "Brazo I") then
			if has_value(tablahuesos, "Brazo D") then
				for k,v in pairs(tablahuesos) do
					if v == "Brazo D" then
						table.remove(tablahuesos, k)
					end
				end
			end

			if has_value(tablahuesos, "Brazo I") then
				for k,v in pairs(tablahuesos) do
					if v == "Brazo I" then
						table.remove(tablahuesos, k)
					end
				end
			end
			ESX.ShowNotification('~b~Te han tratado las heridas de los ~y~brazos. ~w~Tus extremidades dejan de temblar')
			StopGameplayCamShaking()
			brazo = false
		end
	
	elseif parte == 'pierna' then

		if has_value(tablahuesos, "Pierna D") or has_value(tablahuesos, "Pierna I") then
			if has_value(tablahuesos, "Pierna D") then
				for k,v in pairs(tablahuesos) do
					if v == "Pierna D" then
						table.remove(tablahuesos, k)
					end
				end
			end

			if has_value(tablahuesos, "Pierna I") then
				for k,v in pairs(tablahuesos) do
					if v == "Pierna I" then
						table.remove(tablahuesos, k)
					end
				end
			end
			ResetPedMovementClipset(GetPlayerPed(-1))
			ResetPedWeaponMovementClipset(GetPlayerPed(-1))
			ResetPedStrafeClipset(GetPlayerPed(-1))
			SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
			ESX.ShowNotification('~b~Te han tratado las heridas de las ~y~piernas. ~w~Ahora podras caminar con normalidad')
			pierna = false
		end
	
	elseif parte == 'torso' then

		if has_value(tablahuesos, "Torso") then
			for k,v in pairs(tablahuesos) do
				if v == "Torso" then
					table.remove(tablahuesos, k)
					ESX.ShowNotification('~b~Te han tratado las heridas del ~y~abdomen.')
				end
			end
		end
		
	end

end)

RegisterNetEvent('medSystem:curar2')
AddEventHandler('medSystem:curar2', function(parte)
		
	if parte == 'cabeza' then
		
		if has_value(tablahuesos, "Cabeza") then
			for k,v in pairs(tablahuesos) do
				if v == "Cabeza" then
					table.remove(tablahuesos, k)
					ESX.ShowNotification('~b~Te has tratado las heridas de la ~y~cabeza. ~w~Dejas de sentirte aturdido')
				end
			end
			ClearTimecycleModifier()
			headache = false
		end

	elseif parte == 'brazo' then
		
		if has_value(tablahuesos, "Brazo D") or has_value(tablahuesos, "Brazo I") then
			if has_value(tablahuesos, "Brazo D") then
				for k,v in pairs(tablahuesos) do
					if v == "Brazo D" then
						table.remove(tablahuesos, k)
					end
				end
			end

			if has_value(tablahuesos, "Brazo I") then
				for k,v in pairs(tablahuesos) do
					if v == "Brazo I" then
						table.remove(tablahuesos, k)
					end
				end
			end
			ESX.ShowNotification('~b~Te has tratado las heridas de los ~y~brazos. ~w~Tus extremidades dejan de temblar')
			StopGameplayCamShaking()
			brazo = false
		end
	
	elseif parte == 'pierna' then

		if has_value(tablahuesos, "Pierna D") or has_value(tablahuesos, "Pierna I") then
			if has_value(tablahuesos, "Pierna D") then
				for k,v in pairs(tablahuesos) do
					if v == "Pierna D" then
						table.remove(tablahuesos, k)
					end
				end
			end

			if has_value(tablahuesos, "Pierna I") then
				for k,v in pairs(tablahuesos) do
					if v == "Pierna I" then
						table.remove(tablahuesos, k)
					end
				end
			end
			ResetPedMovementClipset(GetPlayerPed(-1))
			ResetPedWeaponMovementClipset(GetPlayerPed(-1))
			ResetPedStrafeClipset(GetPlayerPed(-1))
			SetPedMoveRateOverride(GetPlayerPed(-1), 1.0)
			ESX.ShowNotification('~b~Te has tratado las heridas de las ~y~piernas. ~w~Ahora podras caminar con normalidad')
			pierna = false
		end
	
	elseif parte == 'torso' then

		if has_value(tablahuesos, "Torso") then
			for k,v in pairs(tablahuesos) do
				if v == "Torso" then
					table.remove(tablahuesos, k)
					ESX.ShowNotification('~b~Te has tratado las heridas del ~y~abdomen.')
				end
			end
		end
		
	end

end)