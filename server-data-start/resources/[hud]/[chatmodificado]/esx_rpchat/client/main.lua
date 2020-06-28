RegisterNetEvent('esx_rpchat:sendProximityMessageDo')
AddEventHandler('esx_rpchat:sendProximityMessageDo', function(playerId, title, message)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if target == source then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgba(30, 138, 138, 1); border-radius: 3px;"><i class="fas fa-exclamation-circle"></i>&nbsp;Informacion Rol - {0}:&nbsp;{1}</div>',
			args = { title, message }})
	elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgba(30, 138, 138, 1); border-radius: 3px;"><i class="fas fa-exclamation-circle"></i>&nbsp;Informacion Rol - {0}:&nbsp;{1}</div>',
			args = { title, message }})
	end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessageOOC')
AddEventHandler('esx_rpchat:sendProximityMessageOOC', function(playerId, title, message)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if target == source then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i>&nbsp;OOC Local - {0}:&nbsp;{1}</div>',
			args = { title, message }})
	elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgba(41, 41, 41, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i>&nbsp;OOC Local - {0}:&nbsp;{1}</div>',
			args = { title, message }})
	end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessageMe')
AddEventHandler('esx_rpchat:sendProximityMessageMe', function(playerId, title, message)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)

	if target == source then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgba(150, 62, 43, 0.6); border-radius: 3px;"><i class="fas fa-user-circle"></i>&nbsp;Accion - {0}:&nbsp;{1}</div>', 
			args = { title, message }})
	elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 3px; margin: 0.5vw; background-color: rgba(150, 62, 43, 0.6); border-radius: 3px;"><i class="fas fa-user-circle"></i>&nbsp;Accion - {0}:&nbsp;{1}</div>', 
			args = { title, message }})
	end
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
	TriggerEvent('chat:addSuggestion', '/do',   _U('do_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/me')
		TriggerEvent('chat:removeSuggestion', '/do')
	end
end)
