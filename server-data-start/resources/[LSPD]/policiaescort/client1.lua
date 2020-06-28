-- ##### ESX Policia Guardaespaldas #####

ESX = nil
Citizen.CreateThread(function()
while ESX == nil do
TriggerEvent('esx:getSharedObject', function (obj) ESX = obj end)          -- ##### FUNCIÓN JUGADOR ####
Citizen.Wait(0)
PlayerData = ESX.GetPlayerData()
end
end) 


local chaseVehicle = nil
local chasePed = nil
local chaseVehicle2 = nil                                                   -- #### Local para poner Coches y Peds ####
local chasePed2 = nil

function SpawnVehicle1()
    local playerPed = PlayerPedId()
    local PedPosition = GetEntityCoords(playerPed)
    hasKey = GetHashKey(config.ped1)
    pedType = GetPedType(haskKey)                                           -- ### Función Spawneo de vehiculos ####
    RequestModel(hasKey)
    while not HashModelLoaded(hashKey)
    ResquetModel(hashKey)
    Citizen.Wait(100)
  end

chasePed = CreatePed(pedType, hashKey, PedPosition.x + 2, PedPosition.y, PedPosition.z, 250.00, 1, 1)
ESX.Game.SpawnVehicle(config.vehicle2, {
    x = PedPosition.x + 10,                                                                      -- ### Creación del ped ###
    y = PedPosition.y,
    z = PedPosition.z,                                                              
  120, function (callback_vehicle)  
}
  chaseVehicle = callback_vehicle
  local vehicle = GetVehiclePedIsIn(PlayerPed, true)
  SetVehicleUndriveable(chaseVehicle, false)
  SetVehicleEngineOn(chaseVehicle, true, true)
  while not chasePed do Citizen.Wait(100) end;                                              -- ### Llamada al vehículo ####
  PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
  TaskWarpPedIntoVehicle(chasePed, chaseVehicle, -1)
  TaskVehicleFollow(chasePed, chaseVehicle, playerdPed, 50.0, 1, 5)
  SetDriveTaskDrivingStyle(chasePed, 786468)
  SetVehicleSiren(chaseVehicle, true)
  end)
end

function SpawnVehicle2()
  local playerdPed = PlayerId()
  local PedPosition = GetEntityCoords(playerdPed)
  hashKey2 = GetHashKey(config.ped2)
  pedType2 = GetPedType(hashKey)                                                        -- ### Función Spawn al vehículo ###
  RequestModel(hashKey2)
  while not HashModelLoaded(hashKey2) do
    RequestModel(hashKey2)
    Citizen.Wait(100)
  end
chasePed2 = CreatePed(pedType2, hashKey2, PedPosition.x + 4, PedPosition.y, PedPosition.z, 250.00, 1, 1)
ESX.Game.SpawnVehicle(config.vehicle2, {
  x = PedPosition.x + 15 ,
  y = PedPosition.y,                                                                    -- ### Creación del ped ###
  z = PedPosition.z,
  120, function (callback_vehicle)
}
  chaseVehicle2 = callback_vehicle
  local vehicle = GetVehiclePedIsIn(PlayerPed, true)
  SetVehicleUndriveable(chaseVehicle2, false)                                          -- ### Llamada al vehículo ###
  SetVehicleEngineOn(chaseVehicle2, true, true)
  while not chasePed2 do Citizen.Wait(100) end;
  while not chaseVehicle2 do Citizen.Wait(100) end;
  PlayerSoundFronted(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 1)
  TaskWarpPedIntoVehicle(chasePed2, chaseVehicle2, -1)
  SetDriveTaskDrivingStyle(chasePed2, 786468)
  SetVehicleSiren(chaseVehicle2, true)
  end)
end

RegisterCommand("guardaespaldas", function()
  local xPlayer = ESX.GetPlayerData()
  local job = xPlayer.job
  local jobname = xPlayer.job.name
  if config.usejob and jobname == config.jobname then
    OpenPoliceBackupMenu()                                                         -- ### Comando ###
  elseif not config.usejob then
    OpenPoliceBackupMenu()
  end
end, false)

function OpenPoliceBackupMenu()
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menudeseguridad',
    {
      title    = 'GuardaEspalda'
      elements = {
        {label = 'Spawnear Seguridad 1', value = 'spawn'},
        {label = 'Spawnear Seguridad 2', value = 'spawn2'},
        {label = 'Dar Armas a los Seguridad', value = 'giveweapons'},
        {label = 'Atacar al jugador más cercano', value = 'playerattack'},
        {label = 'Arreglar Vehículos', value = 'fix'},
        {label = 'Vamonos', value = 'wander'},                                                -- ### Menu ###
        {label = 'Seguirme', value = 'follow'},
        {label = 'Borrar Props', value = 'delete'},
        {label = 'Cerrar Menu', value = 'exit'},    
      }
    },

    function(data, menu)
      if data.current.value == 'spawn' then
        SpawnVehicle1()
      elseif data.current.value == 'spawn2' then
        SpawnVehicle1()
        SpawnVehicle2()                                                                          -- ### Funciones del menu ###
      elseif data.current.value == 'getout' then
        TaskLeaveVehicle(chasePed, chaseVehicle, 0);
        TaskLeaveVehicle(chasePed2, chaseVehicle2, 0);
        PlayAmbientSpeech1(chasePed, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
        PlayAmbientSpeech1(chasePed2, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
      elseif data.current.value  == 'giveweapons' then
        GiveWeaponToPed(chasePed, config.weapon1, 250, false, true)
        GiveWeaponToPed(chasePed2, config.weapon2, 250, false, true)
      elseif data.current.value == 'playerattack' then
        closestPlayer = ESX.Game.GetClosestPlayer()
        target = GetPlayerPed(closestPlayer)
        TaskShootAtEntity(chasePed, target, 60, 0xD6FF6D61);
        TaskCombatPed(chasePed, target, 0, 16)
        SetEntityAsMissionEntity(chasePed, true, true)
        SetPedHearingRange(chasePed, 15.0)
        SetPedSeeingRange(chasePed, 15.0)
        SetPedAlertness(chasePed, 15.0)
        SetPedFleeAttributes(chasePed, 0, 0)
        SetPedCombatAttributes(chasePed, 46, true)
        SetPedFleeAttributes(chasePed, 0, 0)
        TaskShootAtEntity(chasePed2, target, 60, 0xD6FF6D61);
        TaskCombatPed(chasePed2, target, 0, 16)
        SetEntityAsMissionEntity(chasePed2, true, true)
        SetPedHearingRange(chasePed2, 15.0)
        SetPedSeeingRange(chasePed2, 15.0)
        SetPedAlertness(chasePed2, 15.0)
        SetPedFleeAttributes(chasePed2, 0, 0)
        SetPedCombatAttributes(chasePed2, 46, true)
        SetPedFleeAttributes(chasePed2, 0, 0)
      elseif data.current.value  == 'fix' then
        SetVehicleFixed(chaseVehicle)
        SetVehicleFixed(chaseVehicle2)
        SetVehicleUndriveable(chaseVehicle, false)
        SetVehicleUndriveable(chaseVehicle2, false)
      elseif data.current.value == 'come' then
        local playerPed = PlayerPedId()
        local PedPosition = GetEntityCoords(playerPed)
        PlayAmbientSpeech1(chasePed, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
        PlayAmbientSpeech1(chasePed2, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
        TaskGoStraightToCoord(chasePed, PedPosition.x, PedPosition.y, PedPosition.z, 2.0, 20, 180.0, 0);
        TaskGoStraightToCoord(chasePed2, PedPosition.x, PedPosition.y, PedPosition.z, 2.0, 20, 180.0, 0);
      elseif data.current.value ==  'wander' then
        TaskVehicleDriveWander(chasePed, chaseVehicle, 50.0, 1)
        TaskVehicleFollow(chasePed2, chaseVehicle2, chasePed, 50.0, 1, 5)
        PlayAmbientSpeech1(chasePed, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
        PlayAmbientSpeech1(chasePed2, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
      elseif data.current.value ==  'wp' then
        if GetFirstBlipInfoId( 8 ) ~= 0 then
          local waypointBlip = GetFirstBlipInfoId( 8 )
          local coord = Citizen.InvokeNative( 0xFA7C7F0AADF25D09, waypointBlip, Citizen.ResultAsVector( ) )
          local x  = coord.x
          local y = coord.y
          local z = coord.z
          TaskVehicleDriveToCoordLongrange(chasePed, chaseVehicle, x, y, z, 35.00, 1, 10.0)
          TaskVehicleDriveToCoordLongrange(chasePed2, chaseVehicle2, x, y, z, 35.00, 1, 10.0)
          PlayAmbientSpeech1(chasePed, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
          PlayAmbientSpeech1(chasePed2, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
        end
      elseif data.current.value ==  'delete' then
        DeleteVehicle(chaseVehicle)
        DeletePed(chasePed)
        DeleteVehicle(chaseVehicle2)
        DeletePed(chasePed2)
      elseif data.current.value ==  'follow' then
        local playerPed = PlayerPedId()
        TaskVehicleFollow(chasePed, chaseVehicle, playerPed, 50.0, 1, 5)
        TaskVehicleFollow(chasePed2, chaseVehicle2, playerPed, 50.0, 1, 5)
        PlayAmbientSpeech1(chasePed, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
        PlayAmbientSpeech1(chasePed2, "Chat_Resp", "SPEECH_PARAMS_FORCE", 1)
      elseif data.current.value ==  'exit' then
        menu.close()
      end
    end,

    function(data, menu)
      menu.close()
    end
  )
end

   Citizen.CreateThread(function()
    while true do
      Citizen.Wait(10)

      if IsControlJustReleased(0, 166) and not IsDead and PlayerData.job ~= nil and PlayerData.job.name == 'police' then
        OpenPoliceBackupMenu()
      end


    end
  end)