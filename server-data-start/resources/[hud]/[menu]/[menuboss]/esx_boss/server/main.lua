ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('esx_boss:getSocietyMoney')
AddEventHandler('esx_boss:getSocietyMoney', function(value)

    local _source = source


    MySQL.Async.fetchAll('SELECT * FROM addon_account_data WHERE account_name = @account', {
        ['@account'] = value
    },
    function(result)
        if result ~= nil and #result > 0 then
            for _, v in pairs(result) do
                dinero = v.money
            end
            local xPlayer = ESX.GetPlayerFromId(_source)
            TriggerClientEvent('esx_boss:showmethemoney', xPlayer.source, dinero)
        end
    end)
end)