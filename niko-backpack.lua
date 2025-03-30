local backpackKey = 47  -- 47 is the G key (change it if you want)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        -- Check if the player presses the 'G' key
        if IsControlJustPressed(1, backpackKey) then
            -- Open the backpack UI
            SetNuiFocus(true, true)  -- Focus the NUI (makes it interactive)
            SendNUIMessage({
                type = "openBackpack"  -- Trigger the event to open the backpack
            })
        end
    end
end)

-- Register the command to open the backpack
RegisterCommand("openbackpack", function()
    -- Open the backpack UI
    SetNuiFocus(true, true)  -- Focus the NUI
    SendNUIMessage({
        type = "openBackpack"  -- Trigger the event to open the backpack
    })
end, false)

-- Listen for the close event from the UI (button press)
RegisterNUICallback("closeBackpack", function(data, cb)
    SetNuiFocus(false, false)  -- Close the UI and remove focus
    cb('ok')  -- Acknowledge that the request is complete
end)
