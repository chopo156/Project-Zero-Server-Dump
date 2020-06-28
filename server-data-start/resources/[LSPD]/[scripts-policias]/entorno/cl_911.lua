-- Simple 911 Command (With Location & Blip) -- 
		-- Made By Chezza --

displayTime = 300 -- Refreshes Blips every 5 Minutes by Default --  

-- Code --

blip = nil
blips = {}

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/911', 'Envia una llamada de entorno a la Policia!', {
    { name="Denuncia", help="Escribe tu denuncia aqui!" }
})
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/entorno', 'Envia un entorno amistoso!', {
    { name="Entorno", help="Escribe tu entorno aqui!" }
})
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/mecanico', 'Envia un aviso al mecanico!', {
    { name="Mecanico", help="Escribe tu aviso aqui!" }
})
end)

RegisterNetEvent('911:setBlip')
AddEventHandler('911:setBlip', function(name, x, y, z)
    local blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 58)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Llamada al 911')
    EndTextCommandSetBlipName(blip)
    table.insert(blips, blip)
    Wait(displayTime * 1000)
    for i, blipq in pairs(blips) do
        if blip == blipq then
            RemoveBlip(blip)
        end
    end
end)

RegisterNetEvent('911:setBlipMecanico')
AddEventHandler('911:setBlipMecanico', function(name, x, y, z)
    local blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, 446)
    SetBlipScale(blip, 1.0)
    SetBlipColour(blip, 47)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Llamada al Mecanico')
    EndTextCommandSetBlipName(blip)
    table.insert(blips, blip)
    Wait(displayTime * 1000)
    for i, blipq in pairs(blips) do
        if blip == blipq then
            RemoveBlip(blip)
        end
    end
end)

-- Command -- 

RegisterCommand('911', function(source, args)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chat:addMessage', { 
			template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(0, 154, 249); border-radius: 3px;"><i style="margin-left: 5px;" class="fas fa-phone-square"></i>&nbsp;{0}</div>',
            args = {"^1911: ^7Porfavor, escribe aqui tu ^1Denuncia."}})
    else
        TriggerServerEvent('911', location, msg, x, y, z, name)
    end
end)

RegisterCommand('entorno', function(source, args)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chat:addMessage', { 
			template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(72, 175, 201); border-radius: 3px;"><i style="margin-left: 5px;" class="fas fa-phone-square"></i>&nbsp;{0}</div>',
            args = {"^1Entorno: ^7Porfavor, escribe aqui tu ^1Entorno."}})
    else
        TriggerServerEvent('entorno', location, msg, x, y, z, name)
    end
end)

RegisterCommand('mecanico', function(source, args)
    local name = GetPlayerName(PlayerId())
    local ped = GetPlayerPed(PlayerId())
    local x, y, z = table.unpack(GetEntityCoords(ped, true))
    local street = GetStreetNameAtCoord(x, y, z)
    local location = GetStreetNameFromHashKey(street)
    local msg = table.concat(args, ' ')
    if args[1] == nil then
        TriggerEvent('chat:addMessage', { 
			template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgb(223, 100, 0); border-radius: 3px;"><i style="margin-left: 5px;" class="fas fa-phone-square"></i>&nbsp;{0}</div>',
            args = {"^1Mecanico: ^7Porfavor, escribe aqui tu ^1Aviso."}})
    else
        TriggerServerEvent('mecanico', location, msg, x, y, z, name)
    end
end)