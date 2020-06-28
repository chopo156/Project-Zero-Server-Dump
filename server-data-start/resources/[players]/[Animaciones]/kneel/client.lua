---Coded by Jeremiah#0420
RegisterCommand("k", function(source,args,rawCommand)
    HandsupKneel()
end, false)

function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

function DisplayNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

---HandsupKneel Code
function HandsupKneel()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped)

    if IsPedInAnyVehicle(ped, true) then
        TaskLeaveVehicle(ped, vehicle, 256)
        Citizen.Wait(1500)
        DisplayNotification("Please leave the vehicle first next time.")
        
    end

    if IsPedArmed(ped, 7) then
    dropgun("weapons@first_person@aim_rng@generic@projectile@sticky_bomb@", "plant_floor")
    Citizen.Wait(1450)
    SetPedDropsInventoryWeapon(GetPlayerPed(-1), GetSelectedPedWeapon(GetPlayerPed(-1)), 0.0, 0.6, -0.9, 30)
    end

   if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) and not IsPedInAnyVehicle(ped) then 
        loadAnimDict( "random@arrests" )
		loadAnimDict( "random@arrests@busted" )
		if ( IsEntityPlayingAnim( ped, "random@arrests@busted", "idle_a", 3 ) ) then 
		    TaskPlayAnim( ped, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (3000)
            TaskPlayAnim( ped, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( ped, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (4000)
            TaskPlayAnim( ped, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (500)
			TaskPlayAnim( ped, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( ped, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )
        end     
    end
end

---Drop gun code
function dropgun(dict, name)
    local ped = GetPlayerPed(-1)
    loadAnimDict(dict)
    TaskPlayAnim(ped, dict, name, 8.0, 1.0, -1, 2, 0, 0, 0, 0)
end

function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
    return true
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(0,21,true)
		end
	end
end)
