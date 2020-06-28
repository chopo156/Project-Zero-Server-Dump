
Citizen.CreateThread(function()
    Citizen.Wait(1)
    for k, v in pairs(Config.Peds) do

        local locatio = v.location
        local model = v.modelname
        local static = v.static
        local animated = v.animated

        if animated then
            local animation = v.anim
        else
            local animation = false
        end

        local npc = CreatePed(4, GetHashKey(model), locatio.x, locatio.y, locatio.z, locatio.heading, false, false)
        FreezeEntityPosition(npc, true)
        SetEntityInvincible(npc, true)
        SetEntityAsMissionEntity(npc, true, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
    end

end)


