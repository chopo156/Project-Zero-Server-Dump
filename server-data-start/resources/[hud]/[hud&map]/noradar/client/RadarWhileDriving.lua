-- Toggle this to enable the use of the big map (That doesn't work together with the LAMBDA ASI)
local UseBigMap = false
-- Change this to change the big map toggle key while on foot (More Controls at https://wiki.fivem.net/wiki/Controls)
local BigMapKeyOnFoot = 44
-- Change this to change the big map toggle key while in a vehicle (More Controls at https://wiki.fivem.net/wiki/Controls)
local BigMapKeyInVehicle = 131
-- Change this to false to disable the big map in vehicles
local BigMapInVehicles = false
-- Change this to false to enable the radar for every passenger
local OnlyDriver = false




-- NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!!
-- NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!!
-- NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!!
-- NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!! NO TOUCHY BELOW!!!

local Hide = false

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		BigMapHandle(IsPedInAnyVehicle(PlayerPedId(), true), OnlyDriver and (GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId()))
		if IsPedInAnyVehicle(PlayerPedId(), true) then
			if (OnlyDriver and (GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId(), false), -1) == PlayerPedId())) or not OnlyDriver then
				DisplayRadar(true)
			end
		end
	end
end)

function BigMapHandle(InVehicle, IsDriver)
	if UseBigMap and (((IsDriver or not OnlyDriver) and BigMapInVehicles and InVehicle and IsControlPressed(1, BigMapKeyInVehicle)) or (not InVehicle and IsControlPressed(1, BigMapKeyOnFoot))) then
		DisplayRadar(true)
		SetRadarBigmapEnabled(true, false)	
		Hide = true
	else
		if not InVehicle or (InVehicle and OnlyDriver and not IsDriver) then
			DisplayRadar(false)
		end
		SetRadarBigmapEnabled(false, false)
		Hide = false
	end
end

function _DrawRect(X, Y, W, H, R, G, B, A, L)
	SetUiLayer(L)
	DrawRect(X, Y, W, H, R, G, B, A)
end

