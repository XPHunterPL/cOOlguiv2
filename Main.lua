--=====================================================
--  cOOlguiv2 FINAL VERSION
--  Author: XPHunterPL
--  GUI inspired by c00lkidd clan style
--  Color Theme: RED + BLACK
--  Minimize System + Buttons + ESP + Fly + TP + Speed
--=====================================================

-------------------------------------------------------
-- SETTINGS
-------------------------------------------------------
local MAIN_COLOR = Color3.fromRGB(255, 0, 0)   -- Red
local BACK_COLOR = Color3.fromRGB(15, 15, 15)  -- Black
local TEXT_COLOR = Color3.fromRGB(255, 255, 255)

-------------------------------------------------------
-- GUI CREATION
-------------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "cOOlguiv2"
gui.Parent = game.CoreGui

-- MAIN WINDOW
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 380, 0, 330)
main.Position = UDim2.new(0.5, -190, 0.5, -165)
main.BackgroundColor3 = BACK_COLOR
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

-- TOP BAR
local bar = Instance.new("Frame")
bar.Size = UDim2.new(1, 0, 0, 32)
bar.BackgroundColor3 = MAIN_COLOR
bar.BorderSizePixel = 0
bar.Parent = main

-- TITLE
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)
title.BackgroundTransparency = 1
title.Text = "cOOlguiv2"
title.TextColor3 = TEXT_COLOR
title.TextSize = 22
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = bar

-- MINIMIZE BUTTON
local min = Instance.new("TextButton")
min.Size = UDim2.new(0, 50, 1, 0)
min.Position = UDim2.new(1, -50, 0, 0)
min.BackgroundColor3 = BACK_COLOR
min.Text = "-"
min.TextColor3 = TEXT_COLOR
min.TextSize = 26
min.Font = Enum.Font.SourceSansBold
min.Parent = bar

local minimized = false
min.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        main.Size = UDim2.new(0, 380, 0, 32)
    else
        main.Size = UDim2.new(0, 380, 0, 330)
    end
end)

-------------------------------------------------------
-- BUTTON CREATOR
-------------------------------------------------------
local function MakeButton(text, posY, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0, 350, 0, 32)
    b.Position = UDim2.new(0, 15, 0, posY)
    b.BackgroundColor3 = MAIN_COLOR
    b.TextColor3 = TEXT_COLOR
    b.TextSize = 20
    b.Font = Enum.Font.SourceSansBold
    b.Text = text
    b.Parent = main
    b.MouseButton1Click:Connect(callback)
end

-------------------------------------------------------
-- *** FEATURES ***
-------------------------------------------------------

-- ESP — highlight all players
MakeButton("ESP", 45, function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr.Character then
            local h = Instance.new("Highlight")
            h.FillColor = Color3.fromRGB(255, 0, 0)
            h.OutlineColor = Color3.fromRGB(0, 0, 0)
            h.Parent = plr.Character
        end
    end
end)

-- FLY — external fly script
MakeButton("Fly", 85, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IcesYtTroll/FlyGui/main/Fly.lua"))()
end)

-- TELEPORT TO RANDOM PLAYER
MakeButton("TP to Player", 125, function()
    local lp = game.Players.LocalPlayer
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= lp and plr.Character then
            lp.Character.HumanoidRootPart.CFrame =
                plr.Character.HumanoidRootPart.CFrame
            break
        end
    end
end)

-- CAR KIDNAP
MakeButton("Car Kidnap", 165, function()
    local p = game.Players.LocalPlayer
    local root = p.Character.HumanoidRootPart

    local car = Instance.new("Part")
    car.Size = Vector3.new(8, 3, 14)
    car.Position = root.Position + Vector3.new(0, 5, 0)
    car.BrickColor = BrickColor.new("Bright red")
    car.Anchored = false
    car.Parent = workspace
end)

-- SPEED BOOST
MakeButton("Speed 50", 205, function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
end)

-- RESET SPEED
MakeButton("Reset Speed", 245, function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

-- CLOSE GUI
MakeButton("Close GUI", 285, function()
    gui:Destroy()
end)

-------------------------------------------------------
-- END OF FILE
-------------------------------------------------------
