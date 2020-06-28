ESX                             = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
  
  while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

  ESX.PlayerData = ESX.GetPlayerData()
  
end)


function OpenMenuBoss()
  if ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'jefeadjun' or ESX.PlayerData.job.grade_name == 'jefesuper' then
    local elements = {
      {label = 'Ver Fondos', value = 'ver_fondos'},
      {label = 'Menu de Jefe', value = 'menu_jefe'}
    }
  
  
    ESX.UI.Menu.CloseAll()
  
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'menuboss',
      {
        title    = 'Menu de Jefe',
        align    = 'top-left',
        elements = elements,
      },
      function(data, menu)

        if data.current.value == 'ver_fondos' then
          ESX.UI.Menu.CloseAll()
          ESX.PlayerData = ESX.GetPlayerData()
          TriggerServerEvent('esx_boss:getSocietyMoney', 'society_'..ESX.PlayerData.job.name)
        elseif data.current.value == 'menu_jefe' then
          
          ESX.UI.Menu.CloseAll()
          ESX.PlayerData = ESX.GetPlayerData()
          TriggerEvent('esx_society:openBossMenu', ESX.PlayerData.job.name, function(data, menu)

            menu.close()

            CurrentAction     = 'menu_boss_actions'
            CurrentActionMsg  = _U('open_bossmenu')
            CurrentActionData = {}

          end, {wash = false, withdraw  = false, deposit = false})
        end
  
      end,
      function(data, menu)
        menu.close()
      end
    )
  end
end

RegisterNetEvent('esx_boss:openbossmenulite')
AddEventHandler('esx_boss:openbossmenulite', function()
  OpenMenuBoss()
end)

RegisterNetEvent('esx_boss:showmethemoney')
AddEventHandler('esx_boss:showmethemoney', function(money)
  local dinero = money
  local elements = {
    {label = 'Dinero Sociedad: <span style="color:green; font-weight:bold;">' .. dinero.. '$</span>', value = 'fondos'}
  }

  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'menufondos',
    {
      title    = 'Dinero Sociedad',
      align    = 'top-left',
      elements = elements,
    },
    function(data, menu)

      if data.current.value == 'fondos' then
        menu.close()
      end

    end,
    function(data, menu)
      menu.close()
    end
  )
end)

