RegisterServerEvent("omni:cablecar:host:sync")
AddEventHandler("omni:cablecar:host:sync", function(index, state)
    TriggerClientEvent("omni:cablecar:forceState", -1, index, state)
end)