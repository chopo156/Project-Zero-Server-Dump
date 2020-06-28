----------------------------------------
--- Discord Whitelist, Made by FAXES ---
----------------------------------------

--- Config ---
notWhitelisted = "No estas whitelisted en Project Zero. Visita --> https://discord.gg/vSKhsyM<-- para mas info." -- Message displayed when they are not whitelist with the role
noDiscord = "Tienes que tener el discord abierto para acceder al servidor." -- Message displayed when discord is not found

roles = { -- Role nickname(s) needed to pass the whitelist
    "Whitelisted",
    "Role 3",
    "Role3",
}


--- Code ---

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local src = source
    deferrals.defer()
    deferrals.update("Checking Permissions")

    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(v, 1, string.len("discord:")) == "discord:" then
            identifierDiscord = v
        end
    end

    if identifierDiscord then
        for i = 1, #roles do
            if exports.discord_perms:IsRolePresent(src, roles[i]) then
                deferrals.done()
            else
                deferrals.done(notWhitelisted)
            end
        end
    else
        deferrals.done(noDiscord)
    end
end)