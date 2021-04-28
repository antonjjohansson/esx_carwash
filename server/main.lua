ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('hcrp:paycleaning')
AddEventHandler('hcrp:paycleaning', function()
  local xPlayer = ESX.GetPlayerFromId(source)
  local enoughmoney = xPlayer.getMoney()
  local price = Config.CleaningPrice
  if enoughmoney >= price then
    xPlayer.removeMoney(price)
    TriggerClientEvent('esx:showNotification', source, '~y~You paid $'.. price)
    TriggerClientEvent('hcrp:cleancar', source)
  else
    TriggerClientEvent('esx:showNotification', source, '~r~You can\'t afford to clean your car')
  end
end)


--[[   if enoughmoney >= price then
    xPlayer.removeMoney(price)
    TriggerClientEvent('esx:showNotification', source, '~y~You paid $'...price ...'for cleaning the car')
    TriggerClientEvent('hcrp:cleancar', source)
  else
    TriggerClientEvent('esx:showNotification', source, '~r~You can\'t afford to clean your car')
  end ]]


--[[   RegisterNetEvent('hcrp:paycleaning')
  AddEventHandler('hcrp:paycleaning', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local enoughmoney = xPlayer.getMoney()
    if IsPedInAnyVehicle(source, false) then
      if enoughmoney >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, '~y~You paid $'...price ...'for cleaning the car')
        TriggerClientEvent('hcrp:cleancar', source)
      else
        TriggerClientEvent('esx:showNotification', source, '~r~You can\'t afford to clean your car')
      end
    else
      TriggerClientEvent('esx:showNotification', source, '~r~You are not in a vehicle')
    end ]]