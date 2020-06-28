ESX = nil

local onlinePlayers = GetNumPlayerIndices()

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Debug printer
function dprint(msg)
	if debugMode then
		print(msg)
	end
end

RegisterServerEvent('sd:savedb')
AddEventHandler('sd:savedb', function(playerplate, pos, heading, playertype, model, estado, livery, fuel)
	
	dprint('Updating pos......')
	dprint('plate: ' .. playerplate)
	dprint(pos) 
	dprint('heading: ' .. heading)
	dprint('playertype: ' .. playertype) 
	dprint('model: ' .. model)
	dprint(estado)
	updatePos(playerplate, pos, heading, playertype, model, estado, livery, fuel)
end)



RegisterNetEvent("firstSpawn")
AddEventHandler("firstSpawn", function()
 	local _source = source
 	local vehicleInfo = {}
 	local props = {}
 	local garage = "A"

	-- MySQL.Async.fetchAll("SELECT * FROM owned_vehicles WHERE aparcado = 1 AND stored = 0 AND state = 1 AND garage = "A" ",{['@garage'] = garage},
	local sqlQuery = [[SELECT * FROM owned_vehicles WHERE aparcado = 1]]

	MySQL.Async.fetchAll(sqlQuery, {},
	function(result)
		for _, columns in ipairs(result) do
			
			local vehicle = json.decode(columns.vehicle)
			print(columns.aparcado)
			if columns.aparcado == true then
				local vehicleInfo = {
					vehicle = vehicle,
					owner = columns.owner,
					plate = columns.plate,
					pos = columns.coords,
					heading = columns.heading,
					job = columns.job,
					model = columns.model,
					livery = columns.livery				
					}
					dprint('bucle?')
					TriggerClientEvent("spawncar", _source, vehicleInfo)
			else
				dprint('No sacar este vehiculo')
			end
			
			-- break
		end
	end)
end)

function updatePos(plate, pos, heading, playertype, model, estado, livery, fuel)
	dprint('Updating pos...   ...')
	dprint(plate)
	dprint(json.encode(pos))
	dprint(heading)
	dprint(playertype) 
	dprint(model)
	dprint(estado)
	dprint(livery)
	dprint(fuel)

	if estado == true then
		local aparcado = 1
		MySQL.Async.execute('UPDATE owned_vehicles SET coords = @coords, heading = @heading, ownertype = @ownertype, model = @model, livery=@livery, aparcado=@aparcado, fuel=@fuel, state = 1, stored = 0, garage = "A" WHERE plate = @plate',
		{["@plate"] = plate, ["@coords"] = json.encode(pos), ["@heading"]=heading, ['@ownertype']=playertype, ['@model']=model, ['@livery']=livery, ['@aparcado']=aparcado, ['@fuel']=fuel})
		dprint("La posicion a sido MARCADA")
	else
		MySQL.Async.fetchAll('UPDATE owned_vehicles SET aparcado = 0 AND state = 1 AND stored = 0 AND garage = "A" WHERE plate = @plate',
		{["@plate"] = plate})
		dprint("La posicion a sido BORRADA")
	end
end
