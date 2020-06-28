ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("utk_fh:startcheck")
AddEventHandler("utk_fh:startcheck", function(bank)
    local _source = source
    local copcount = 0
    local Players = ESX.GetPlayers()

    for i = 1, #Players, 1 do
        local xPlayer = ESX.GetPlayerFromId(Players[i])

        if xPlayer.job.name == "police" then
            copcount = copcount + 1
        end
    end
    local xPlayer = ESX.GetPlayerFromId(_source)
    local item = xPlayer.getInventoryItem("keycard")["count"]

    if copcount >= UTK.mincops then
        if item >= 1 then
            if not UTK.Banks[bank].onaction == true then
                if (os.time() - UTK.cooldown) > UTK.Banks[bank].lastrobbed then
                    UTK.Banks[bank].onaction = true
                    xPlayer.removeInventoryItem("keycard", 1)
                    TriggerClientEvent("utk_fh:outcome", _source, true, bank)
                    TriggerClientEvent("utk_fh:policenotify", -1, bank)
                else
                    TriggerClientEvent("utk_fh:outcome", _source, false, "This bank recently robbed. You need to wait "..math.floor((UTK.cooldown - (os.time() - UTK.Banks[bank].lastrobbed)) / 60)..":"..math.fmod((UTK.cooldown - (os.time() - UTK.Banks[bank].lastrobbed)), 60))
                end
            else
                TriggerClientEvent("utk_fh:outcome", _source, false, "This bank is currently being robbed.")
            end
        else
            TriggerClientEvent("utk_fh:outcome", _source, false, "You don't have a malicious access card.")
        end
    else
        TriggerClientEvent("utk_fh:outcome", _source, false, "There is not enough police in the city.")
    end
end)

RegisterServerEvent("utk_fh:lootup")
AddEventHandler("utk_fh:lootup", function(var, var2)
    TriggerClientEvent("utk_fh:lootup_c", -1, var, var2)
end)

RegisterServerEvent("utk_fh:openDoor")
AddEventHandler("utk_fh:openDoor", function(coords, method)
    TriggerClientEvent("utk_fh:openDoor_c", -1, coords, method)
end)

RegisterServerEvent("utk_fh:startLoot")
AddEventHandler("utk_fh:startLoot", function(data, name, players)
    local _source = source

    for i = 1, #players, 1 do
        TriggerClientEvent("utk_fh:startLoot_c", players[i], data, name)
    end
    TriggerClientEvent("utk_fh:startLoot_c", _source, data, name)
end)

RegisterServerEvent("utk_fh:stopHeist")
AddEventHandler("utk_fh:stopHeist", function(name)
    TriggerClientEvent("utk_fh:stopHeist_c", -1, name)
end)

RegisterServerEvent("utk_fh:rewardCash")
AddEventHandler("utk_fh:rewardCash", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local reward = math.random(UTK.mincash, UTK.maxcash)

    if UTK.black then
        xPlayer.addAccountMoney("black_money", reward)
    else
        xPlayer.addMoney(reward)
    end
end)

RegisterServerEvent("utk_fh:setCooldown")
AddEventHandler("utk_fh:setCooldown", function(name)
    UTK.Banks[name].lastrobbed = os.time()
    UTK.Banks[name].onaction = false
    TriggerClientEvent("utk_fh:resetDoorState", -1, name)
end)

ESX.RegisterServerCallback("utk_fh:getBanks", function(source, cb)
    cb(UTK.Banks)
end)

ESX.RegisterServerCallback("utk_fh:checkSecond", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem("net_cracker")["count"]

    if item >= 1 then
        xPlayer.removeInventoryItem("net_cracker", 1)
        cb(true)
    else
        cb(false)
    end
end)