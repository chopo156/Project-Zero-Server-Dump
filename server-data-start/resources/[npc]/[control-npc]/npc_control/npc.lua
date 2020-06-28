Citizen.CreateThread(function()
	for i = 1, 13 do
		EnableDispatchService(i, EnableDispatch)
	end
	while true do
		Citizen.Wait(0) -- prevent crashing

		-- These natives have to be called every frame.
		SetPedDensityMultiplierThisFrame((PedestrianAmount/100)+.0) -- set npc/ai peds density
		SetScenarioPedDensityMultiplierThisFrame((PedestrianAmount/100)+.0, (PedestrianAmount/100)+.0) -- set random npc/ai peds or scenario peds

		SetVehicleDensityMultiplierThisFrame((TrafficAmount/100)+.0)-- set vehicles Density
		SetRandomVehicleDensityMultiplierThisFrame((TrafficAmount/100)+.0) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.)

		SetParkedVehicleDensityMultiplierThisFrame((ParkedAmount/100)+.0)
		SetNumberOfParkedVehicles(ParkedNumber)
		
		SetGarbageTrucks(GarbageTruck) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(Boats) -- Stop random boats from spawning in the water.
		SetRandomTrains(Train)

		SetCreateRandomCops(Cops) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(Cops) -- stop random cops (not in a scenario) from spawning.
		SetCreateRandomCopsOnScenarios(Cops) -- stop random cops (in a scenario) from spawning.
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
	end
end)



Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(500)
	  RemoveAllPickupsOfType(0xDF711959) -- carbine rifle
	  RemoveAllPickupsOfType(0xF9AFB48F) -- pistol
	  RemoveAllPickupsOfType(0xA9355DCD) -- pumpshotgun
	end
  end)
  
