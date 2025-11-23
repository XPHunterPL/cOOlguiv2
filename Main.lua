-- cOOlguiv2 FINAL by XPHunterPL

-- UI SETTINGS
local MAIN_COLOR = Color3.fromRGB(255, 0, 0) -- RED
local BACK_COLOR = Color3.fromRGB(20, 20, 20) -- BLACK
local TEXT_COLOR = Color3.fromRGB(255, 255, 255)

-- CREATE GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "cOOlguiv2"
ScreenGui.Parent = game.CoreGui

-- MAIN WINDOW
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 350, 0, 300)
Main.Position = UDim2.new(0.5, -175, 0.5, -150)
Main.BackgroundColor3 = BACK_COLOR
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

-- TOPBAR
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 30)
TopBar.BackgroundColor3 = MAIN_COLOR
TopBar.BorderSizePixel = 0
TopBar.Parent = Main

-- TITLE
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "cOOlguiv2"
Title.TextColor3 = TEXT_COLOR
Title.TextSize = 20
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- MINIMIZE BUTTON
local MinBtn = Instance.new("TextButton")
MinBtn.Size = UDim2.new(0, 40, 1, 0)
MinBtn.Position = UDim2.new(1, -40, 0, 0)
MinBtn.BackgroundColor3 = BACK_COLOR
MinBtn.Text = "-"
MinBtn.TextColor3 = TEXT_COLOR
MinBtn.TextSize = 24
MinBtn.Font = Enum.Font.SourceSansBold
MinBtn.Parent = TopBar

local minimized = false
MinBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        Main.Size = UDim2.new(0, 350, 0, 30)
    else
        Main.Size = UDim2.new(0, 350, 0, 300)
    end
end)

-- BUTTON CREATOR
local function MakeButton(text, y, callback)
    local B = Instance.new("TextButton")
    B.Size = UDim2.new(0, 320, 0, 30)
    B.Position = UDim2.new(0, 15, 0, y)
    B.BackgroundColor3 = MAIN_COLOR
    B.TextColor3 = TEXT_COLOR
    B.TextSize = 18
    B.Font = Enum.Font.SourceSansBold
    B.Text = text
    B.Parent = Main
    B.MouseButton1Click:Connect(callback)
end

-----------------------------------------------------------------------
--  FEATURES
-----------------------------------------------------------------------

-- ESP
MakeButton("ESP", 40, function()
    for _, p in pairs(game:GetService("Players"):GetPlayers()) do
        if p.Character then
            local hl = Instance.new("Highlight")
            hl.FillColor = Color3.fromRGB(255,0,0)
            hl.OutlineColor = Color3.fromRGB(0,0,0)
            hl.Parent = p.Character
        end
    end
end)

-- FLY
MakeButton("FLY", 80, function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IcesYtTroll/FlyGui/main/Fly.lua"))()
end)

-- TELEPORT TO PLAYER
MakeButton("TP to player", 120, function()
    local target = game.Players:GetPlayers()[2]
    if target and target.Character then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        target.Character.HumanoidRootPart.CFrame
    end
end)

-- CAR KIDNAP
MakeButton("CAR (kidnap)", 160, function()
    local car = Instance.new("Part")
    car.Size = Vector3.new(6,2,10)
    car.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,5,0)
    car.Anchored = false
    car.BrickColor = BrickColor.Red()
    car.Parent = workspace
end)

-- SPEED
MakeButton("Speed +", 200, function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
end)

-----------------------------------------------------------------------
-- END
-----------------------------------------------------------------------
