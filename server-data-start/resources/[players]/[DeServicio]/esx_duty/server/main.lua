ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:police')
AddEventHandler('duty:police', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'police' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offpolice', 0)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offpolice', 1)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offpolice', 2)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offpolice', 3)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offpolice', 4)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 5 then
        xPlayer.setJob('offpolice', 5)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 6 then
        xPlayer.setJob('offpolice', 6)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 7 then
        xPlayer.setJob('offpolice', 7)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 8 then
        xPlayer.setJob('offpolice', 8)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 9 then
        xPlayer.setJob('offpolice', 9)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 10 then
        xPlayer.setJob('offpolice',10)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 11 then
        xPlayer.setJob('offpolice', 11)
    end

    if xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 0 then
        xPlayer.setJob('police', 0)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 1 then
        xPlayer.setJob('police', 1)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 2 then
        xPlayer.setJob('police', 2)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 3 then
        xPlayer.setJob('police', 3)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 4 then
        xPlayer.setJob('police', 4)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 5 then
        xPlayer.setJob('police', 5)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 6 then
        xPlayer.setJob('police', 6)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 7 then
        xPlayer.setJob('police', 7)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 8 then
        xPlayer.setJob('police', 8)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 9 then
        xPlayer.setJob('police', 9)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 10 then
        xPlayer.setJob('police', 10)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 11 then
        xPlayer.setJob('police', 11)
    end
end)

RegisterServerEvent('duty:ambulance')
AddEventHandler('duty:ambulance', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offambulance', 0)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offambulance', 1)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offambulance', 2)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offambulance', 3)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offambulance', 4)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 5 then
        xPlayer.setJob('offambulance', 5)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 6 then
        xPlayer.setJob('offambulance', 6)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 7 then
        xPlayer.setJob('offambulance', 7)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 8 then
        xPlayer.setJob('offambulance', 8)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 9 then
        xPlayer.setJob('offambulance', 9)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 10 then
        xPlayer.setJob('offambulance', 10)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 11 then
        xPlayer.setJob('offambulance', 11)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 12 then
        xPlayer.setJob('offambulance', 12)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 13 then
        xPlayer.setJob('offambulance', 13)
    end

    if xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 0 then
        xPlayer.setJob('ambulance', 0)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 1 then
        xPlayer.setJob('ambulance', 1)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 2 then
        xPlayer.setJob('ambulance', 2)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 3 then
        xPlayer.setJob('ambulance', 3)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 4 then
        xPlayer.setJob('ambulance', 4)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 5 then
        xPlayer.setJob('ambulance', 5)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 6 then
        xPlayer.setJob('ambulance', 6)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 7 then
        xPlayer.setJob('ambulance', 7)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 8 then
        xPlayer.setJob('ambulance', 8)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 9 then
        xPlayer.setJob('ambulance', 9)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 10 then
        xPlayer.setJob('ambulance', 10)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 11 then
        xPlayer.setJob('ambulance', 11)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 12 then
        xPlayer.setJob('ambulance', 12)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 13 then
        xPlayer.setJob('ambulance', 13)
    end
end)

RegisterServerEvent('duty:mechanic')
AddEventHandler('duty:mechanic', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offmechanic', 0)
    elseif xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offmechanic', 1)
    elseif xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offmechanic', 2)
    elseif xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offmechanic', 3)
    elseif xPlayer.job.name == 'mechanic' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offmechanic', 4)
    end

    if xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 0 then
        xPlayer.setJob('mechanic', 0)
    elseif xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 1 then
        xPlayer.setJob('mechanic', 1)
    elseif xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 2 then
        xPlayer.setJob('mechanic', 2)
    elseif xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 3 then
        xPlayer.setJob('mechanic', 3)
    elseif xPlayer.job.name == 'offmechanic' and xPlayer.job.grade == 4 then
        xPlayer.setJob('mechanic', 4)
    end
end)

RegisterServerEvent('duty:taxi')
AddEventHandler('duty:taxi', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'taxi' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offtaxi', 0)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offtaxi', 1)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offtaxi', 2)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offtaxi', 3)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offtaxi', 4)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 5 then
        xPlayer.setJob('offtaxi', 5)
    end

    if xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 0 then
        xPlayer.setJob('taxi', 0)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 1 then
        xPlayer.setJob('taxi', 1)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 2 then
        xPlayer.setJob('taxi', 2)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 3 then
        xPlayer.setJob('taxi', 3)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 4 then
        xPlayer.setJob('taxi', 4)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 5 then
        xPlayer.setJob('taxi', 5)
    end
end)

RegisterServerEvent('duty:deagle')
AddEventHandler('duty:deagle', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'deagle' and xPlayer.job.grade == 0 then
        xPlayer.setJob('tequilala', 0)
    elseif xPlayer.job.name == 'deagle' and xPlayer.job.grade == 1 then
        xPlayer.setJob('tequilala', 1)
    elseif xPlayer.job.name == 'deagle' and xPlayer.job.grade == 2 then
        xPlayer.setJob('tequilala', 2)
    elseif xPlayer.job.name == 'deagle' and xPlayer.job.grade == 3 then
        xPlayer.setJob('tequilala', 3)
    end

    if xPlayer.job.name == 'tequilala' and xPlayer.job.grade == 0 then
        xPlayer.setJob('deagle', 0)
    elseif xPlayer.job.name == 'tequilala' and xPlayer.job.grade == 1 then
        xPlayer.setJob('deagle', 1)
    elseif xPlayer.job.name == 'tequilala' and xPlayer.job.grade == 2 then
        xPlayer.setJob('deagle', 2)
    elseif xPlayer.job.name == 'tequilala' and xPlayer.job.grade == 3 then
        xPlayer.setJob('deagle', 3)
    end
end)




--notification
function sendNotification(xSource, message, messageType, messageTimeout)
    TriggerClientEvent("pNotify:SendNotification", xSource, {
        text = message,
        type = messageType,
        queue = "qalle",
        timeout = messageTimeout,
        layout = "bottomCenter"
    })
end