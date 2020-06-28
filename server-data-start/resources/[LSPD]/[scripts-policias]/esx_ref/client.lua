ESX = nil
local blipsRef = {}
local PlayerData = {}
local displayed = false
refblip = nil


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

-- Command -- 

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if ( IsControlJustPressed(0,192) and IsPedInAnyPoliceVehicle(PlayerPedId())) then
            if displayed == false then
                local player = PlayerPedId()
                local x, y, z = table.unpack(GetEntityCoords(ped, true))
                local street = GetStreetNameAtCoord(x, y, z)
                local location = GetStreetNameFromHashKey(street)
                local vehicle = GetVehiclePedIsIn(player, true)
                netid = NetworkGetNetworkIdFromEntity(vehicle)
                SetEntityAsMissionEntity(vehicle)
                SetNetworkIdCanMigrate(netid, true)
                NetworkRegisterEntityAsNetworked(VehToNet(vehicle))
                --print(netid)
                vehiculoactual = vehicle
                --print(vehicle)
				ESX.ShowNotification('~r~Activado GPS~w~ de Apoyo~b~ Policial~w~')
                displayed = true
                --print(displayed)
                TriggerServerEvent('esx_ref:referencia', location, netid, player)
                Citizen.Wait(5000)
            else
				ESX.ShowNotification('~r~Desactivado GPS~w~ de Apoyo~b~ Policial~w~')
				displayed = false
                TriggerServerEvent('esx_ref:killreferencia', netid)
                Citizen.Wait(5000)
            end
        end
    end
end)

RegisterNetEvent('esx_ref:killblip')
AddEventHandler('esx_ref:killblip', function(coche)

local vehiculofinal = NetworkGetEntityFromNetworkId(coche)

    for k, v in pairs(blipsRef) do
        if v.veh == vehiculofinal then
            RemoveBlip(v.blip)         
            table.remove(blipsRef, k)
        end
	end
	
end)

RegisterNetEvent('esx_ref:setBlip')
AddEventHandler('esx_ref:setBlip', function(jugador, coche)
    local vehiculofinal = NetworkGetEntityFromNetworkId(coche)
    --print('Esta es la id del coche : '..vehiculofinal)
    --print('Este es el player source : '..jugador)
    local refblip = AddBlipForEntity(vehiculofinal)
    SetBlipSprite(refblip, 42)
	SetBlipRoute(refblip, true)
	SetBlipScale(refblip, 0.85)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Llamada de apoyo')
    EndTextCommandSetBlipName(refblip)
    table.insert(blipsRef, {blip = refblip, veh = vehiculofinal})
end)
