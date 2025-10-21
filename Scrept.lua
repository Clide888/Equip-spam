-- Rapid Equip/Unequip Script
-- Works with most executors

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Backpack = Player:WaitForChild("Backpack")

-- Configuration
local EQUIP_SPEED = 0.001 -- 1 millisecond
local RUNNING = true

-- Function to get the first tool in backpack
local function getFirstTool()
    local tools = Backpack:GetChildren()
    for _, item in pairs(tools) do
        if item:IsA("Tool") then
            return item
        end
    end
    -- Check if tool is already equipped
    for _, item in pairs(Character:GetChildren()) do
        if item:IsA("Tool") then
            return item
        end
    end
    return nil
end

-- Main equip/unequip loop
spawn(function()
    while RUNNING do
        local tool = getFirstTool()
        
        if tool then
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            
            if Humanoid then
                -- Equip the tool
                if tool.Parent == Backpack then
                    Humanoid:EquipTool(tool)
                -- Unequip the tool
                elseif tool.Parent == Character then
                    Humanoid:UnequipTools()
                end
            end
        end
        
        wait(EQUIP_SPEED)
    end
end)

-- Stop the script (optional - uncomment to add stop functionality)
--[[
wait(5) -- Run for 5 seconds
RUNNING = false
print("Script stopped")
--]]

print("Rapid Equip/Unequip Script Running!")
print("Press Stop in your executor to end the script")
