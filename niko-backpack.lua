-- Custom Backpack System for FiveM

fx_version 'cerulean'
game 'gta5'

description 'Simple Backpack System for FiveM'
author 'Niko'
version '1.0.0'

local backpacks = {}

-- Function to give a player a backpack
RegisterCommand("givebackpack", function(source, args, rawCommand)
    local playerId = tonumber(args[1])
    if playerId then
        backpacks[playerId] = { storage = 10 } -- Default storage size
        TriggerClientEvent("backpack:notify", playerId, "You received a backpack with 10 slots!")
    else
        print("Invalid player ID")
    end
end, true)

-- Function to check backpack storage
RegisterCommand("checkbackpack", function(source, args, rawCommand)
    local playerId = source
    if backpacks[playerId] then
        TriggerClientEvent("backpack:notify", playerId, "Your backpack has " .. backpacks[playerId].storage .. " slots.")
    else
        TriggerClientEvent("backpack:notify", playerId, "You do not have a backpack.")
    end
end, false)

-- Notification event
RegisterNetEvent("backpack:notify")
AddEventHandler("backpack:notify", function(message)
    TriggerEvent("chatMessage", "[Backpack]", {255, 255, 0}, message)
end)

print("Niko Backpack System Loaded")
