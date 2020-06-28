ESX = nil

PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData() == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()

end)

RegisterCommand("jail", function(source, args)

	if PlayerData.job.name == "police" then
		OpenJailMenu()
	else
		ESX.ShowNotification("No eres un policia!")
	end
end)

function LoadAnim(animDict)
	RequestAnimDict(animDict)

	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(10)
	end
end

function LoadModel(model)
	RequestModel(model)

	while not HasModelLoaded(model) do
		Citizen.Wait(10)
	end
end

function HideHUDThisFrame()
	HideHelpTextThisFrame()
	HideHudAndRadarThisFrame()
	HideHudComponentThisFrame(1)
	HideHudComponentThisFrame(2)
	HideHudComponentThisFrame(3)
	HideHudComponentThisFrame(4)
	HideHudComponentThisFrame(6)
	HideHudComponentThisFrame(7)
	HideHudComponentThisFrame(8)
	HideHudComponentThisFrame(9)
	HideHudComponentThisFrame(13)
	HideHudComponentThisFrame(11)
	HideHudComponentThisFrame(12)
	HideHudComponentThisFrame(15)
	HideHudComponentThisFrame(18)
	HideHudComponentThisFrame(19)
end

function Cutscene(jailType)
	local carcel = jailType
	DoScreenFadeOut(100)

	Citizen.Wait(250)

	local Male = GetHashKey("mp_m_freemode_01")

	TriggerEvent('skinchanger:getSkin', function(skin)
		if GetHashKey(GetEntityModel(PlayerPedId())) == Male then
			local clothesSkin = {
				['tshirt_1'] = 20, ['tshirt_2'] = 0,
				['torso_1'] = 5, ['torso_2'] = 0,
				['arms'] = 5,
				['pants_1'] = 5, ['pants_2'] = 7,
				['shoes_1'] = 42, ['shoes_2'] = 2,
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

		else
			local clothesSkin = {
				['tshirt_1'] = 15, ['tshirt_2'] = 0,
				['torso_1'] = 5, ['torso_2'] = 0,
				['arms'] = 4,
				['pants_1'] = 66, ['pants_2'] = 6,
				['shoes_1'] = 36, ['shoes_2'] = 0,
			}
			TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		end
	end)

	LoadModel(-1320879687)

	local PolicePosition = Config.Cutscene["PolicePosition"]
	local Police = CreatePed(5, -1320879687, PolicePosition["x"], PolicePosition["y"], PolicePosition["z"], PolicePosition["h"], false)
	TaskStartScenarioInPlace(Police, "WORLD_HUMAN_PAPARAZZI", 0, false)

	local PlayerPosition = Config.Cutscene["PhotoPosition"]
	local PlayerPed = PlayerPedId()
	SetEntityCoords(PlayerPed, PlayerPosition["x"], PlayerPosition["y"], PlayerPosition["z"] - 1)
	SetEntityHeading(PlayerPed, PlayerPosition["h"])
	FreezeEntityPosition(PlayerPed, true)

	Cam()

	Citizen.Wait(1000)

	DoScreenFadeIn(100)

	Citizen.Wait(10000)

	DoScreenFadeOut(250)


	if carcel == "vespucci" then
		local vespuci = Config.JailPositions.vespucci
		local num = math.random(7,#vespuci)
		local celda = Config.JailPositions.vespucci[num]

		SetEntityCoords(PlayerPed,  celda.Location.x, celda.Location.y, celda.Location.z -1)
		SetEntityHeading(PlayerPed, celda.Heading)

	elseif carcel == "misionrow" then
		local misionro = Config.JailPositions.misionrow
		local num = math.random(3,#misionro)
		local celda = Config.JailPositions.misionrow[num]

		SetEntityCoords(PlayerPed,  celda.Location.x, celda.Location.y, celda.Location.z -1)
		SetEntityHeading(PlayerPed, celda.Heading)
	elseif carcel == "seguridad_misionrow" then
		local segurmisionrow = Config.JailPositions.segurmisionrow
		local num = math.random(3,#segurmisionrow)
		local celda = Config.JailPositions.segurmisionrow[num]

		SetEntityCoords(PlayerPed,  celda.Location.x, celda.Location.y, celda.Location.z -1)
		SetEntityHeading(PlayerPed, celda.Heading)
	elseif carcel == "sandy" then
		local sandy = Config.JailPositions.sandy
		local num = math.random(3,#sandy)
		local celda = Config.JailPositions.sandy[num]

		SetEntityCoords(PlayerPed,  celda.Location.x, celda.Location.y, celda.Location.z -1)
		SetEntityHeading(PlayerPed, celda.Heading)
	elseif carcel == "federal" then
		local federal = Config.JailPositions.federal
		local num = math.random(3,#federal)
		local celda = Config.JailPositions.federal[num]

		SetEntityCoords(PlayerPed,  celda.Location.x, celda.Location.y, celda.Location.z -1)
		SetEntityHeading(PlayerPed, celda.Heading)
	elseif carcel == "segurfederal" then
		local segurfederal = Config.JailPositions.segurfederal
		local num = math.random(3,#segurfederal)
		local celda = Config.JailPositions.segurfederal[num]

		SetEntityCoords(PlayerPed,  celda.Location.x, celda.Location.y, celda.Location.z -1)
		SetEntityHeading(PlayerPed, celda.Heading)
	end

	DeleteEntity(Police)
	SetModelAsNoLongerNeeded(-1320879687)

	Citizen.Wait(1000)

	DoScreenFadeIn(250)

	TriggerServerEvent("InteractSound_SV:PlayOnSource", "cell", 0.3)

	RenderScriptCams(false,  false,  0,  true,  true)
	FreezeEntityPosition(PlayerPed, false)
	DestroyCam(Config.Cutscene["CameraPos"]["cameraId"])

	InJail(jailType)
end

function Cam()
	local CamOptions = Config.Cutscene["CameraPos"]

	CamOptions["cameraId"] = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)

    SetCamCoord(CamOptions["cameraId"], CamOptions["x"], CamOptions["y"], CamOptions["z"])
	SetCamRot(CamOptions["cameraId"], CamOptions["rotationX"], CamOptions["rotationY"], CamOptions["rotationZ"])

	RenderScriptCams(true, false, 0, true, true)
end

function TeleportPlayer(pos)

	local Values = pos

	if #Values["goal"] > 1 then

		local elements = {}

		for i, v in pairs(Values["goal"]) do
			table.insert(elements, { label = v, value = v })
		end

		ESX.UI.Menu.Open(
			'default', GetCurrentResourceName(), 'teleport_jail',
			{
				title    = "Choose Position",
				align    = 'center',
				elements = elements
			},
		function(data, menu)

			local action = data.current.value
			local position = Config.Teleports[action]

			if action == "Boiling Broke" or action == "Security" then

				if PlayerData.job.name ~= "police" then
					ESX.ShowNotification("No !")
					return
				end
			end

			menu.close()

			DoScreenFadeOut(100)

			Citizen.Wait(250)

			SetEntityCoords(PlayerPedId(), position["x"], position["y"], position["z"])

			Citizen.Wait(250)

			DoScreenFadeIn(100)
			
		end,

		function(data, menu)
			menu.close()
		end)
	else
		local position = Config.Teleports[Values["goal"][1]]

		DoScreenFadeOut(100)

		Citizen.Wait(250)

		SetEntityCoords(PlayerPedId(), position["x"], position["y"], position["z"])

		Citizen.Wait(250)

		DoScreenFadeIn(100)
	end
end

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(Config.blip["Blipi"]["x"], Config.blip["Blipi"]["y"], Config.blip["Blipi"]["z"])

    SetBlipSprite (blip, 188)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.8)
    SetBlipColour (blip, 49)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Prision Federal')
    EndTextCommandSetBlipName(blip)
end)