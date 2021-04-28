ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

local MarkerZones = Config.CarCleaningPos

local markerPos = vector3(-699.74, -934.21, 19.01)
local HasAlreadyGotMessage = false
local isInMarker = false

-- Draws blips

Citizen.CreateThread(function()

    for _, info in pairs(MarkerZones) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

-- Here we just draw the markers so they're visible to the player
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for i in pairs(MarkerZones) do
			DrawMarker(1, MarkerZones[i].x, MarkerZones[i].y, MarkerZones[i].z + 1, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.5, 2.5, 2.0, 0, 0, 255, 50, false, true, 2, nil, nil, false)
        end
    end
end)


-- here we just check if player is in a marker and if didn't get the message yet, then we trigger the cleaning
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isInMarker and not HasAlreadyGotMessage then
            local ped = GetPlayerPed(-1)
            TriggerServerEvent('hcrp:paycleaning')
            HasAlreadyGotMessage = true
        end
    end
end)

Citizen.CreateThread(function()
	local ped = GetPlayerPed(-1)
	while true do
		local playerCoords = GetEntityCoords(ped)
        --Loop through all the markers and check if player is in radius of any of them
		for i in pairs(MarkerZones) do
            local distance = #(playerCoords - vector3(MarkerZones[i].x, MarkerZones[i].y, MarkerZones[i].z))
        	if distance < 100.0 then
        		if distance < 2.0 then
        			isInMarker = true
        			break
        		else
        		    isInMarker = false
        			HasAlreadyGotMessage = false
        		end
        	end
        end
		Citizen.Wait(1000)
	end
end)

RegisterNetEvent('hcrp:cleancar')
AddEventHandler('hcrp:cleancar', function()
	local ped = GetPlayerPed(-1)
	local car = GetVehiclePedIsIn(ped, false)
	SetVehicleDirtLevel(car, 0.0)
	ESX.ShowNotification('Your vehicle has been ~y~cleaned~w~, thanks for using Jeffs Car Wash')
end)

RegisterCommand('dirtcar', function()
	local ped = GetPlayerPed(-1)
	local car = GetVehiclePedIsIn(ped, false)
	SetVehicleDirtLevel(car, 14.0)
end)

-- Display Coords in console
RegisterCommand('coords', function()
	print(GetEntityCoords(PlayerPedId()))
end)

local test = 1000

RegisterCommand('testing', function()
	ESX.ShowNotification('The number is '.. test)
end)