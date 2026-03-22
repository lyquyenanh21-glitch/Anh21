--// Forest Menu VIP

local player = game.Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "ForestVIP"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,350,0,250)
main.Position = UDim2.new(0.3,0,0.3,0)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.Active = true
main.Draggable = true

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,30)
title.Text = "🌲 Forest VIP Menu"
title.BackgroundColor3 = Color3.fromRGB(0,0,0)
title.TextColor3 = Color3.new(1,1,1)

-- Container
local container = Instance.new("Frame", main)
container.Size = UDim2.new(1,0,1,-30)
container.Position = UDim2.new(0,0,0,30)
container.BackgroundTransparency = 1

-- layout
local layout = Instance.new("UIListLayout", container)
layout.Padding = UDim.new(0,5)

-- function tạo nút
local function createButton(text, callback)
    local btn = Instance.new("TextButton", container)
    btn.Size = UDim2.new(1,-10,0,40)
    btn.Text = text
    btn.BackgroundColor3 = Color3.fromRGB(40,40,40)
    btn.TextColor3 = Color3.new(1,1,1)

    btn.MouseButton1Click:Connect(callback)
end

-- =========================
-- 🔥 GOD MODE
-- =========================
local god = false
local godConn

createButton("God Mode: OFF", function(btn)
    god = not god
    btn.Text = "God Mode: "..(god and "ON" or "OFF")

    local function apply(char)
        local hum = char:WaitForChild("Humanoid")

        hum.MaxHealth = math.huge
        hum.Health = math.huge

        if godConn then godConn:Disconnect() end
        godConn = hum:GetPropertyChangedSignal("Health"):Connect(function()
            if god then
                hum.Health = math.huge
            end
        end)
    end

    if god then
        if player.Character then apply(player.Character) end
        player.CharacterAdded:Connect(function(c)
            task.wait(1)
            if god then apply(c) end
        end)
    end
end)

-- =========================
-- ⚡ SPEED HACK
-- =========================
local speed = false
createButton("Speed: OFF", function(btn)
    speed = not speed
    btn.Text = "Speed: "..(speed and "ON" or "OFF")

    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = speed and 50 or 16
    end
end)

-- =========================
-- 🦘 JUMP HACK
-- =========================
local jump = false
createButton("Jump: OFF", function(btn)
    jump = not jump
    btn.Text = "Jump: "..(jump and "ON" or "OFF")

    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.JumpPower = jump and 100 or 50
    end
end)

-- =========================
-- 📦 AUTO LOOT
-- =========================
local loot = false
createButton("Auto Loot: OFF", function(btn)
    loot = not loot
    btn.Text = "Auto Loot: "..(loot and "ON" or "OFF")

    task.spawn(function()
        while loot do
            for _,v in pairs(workspace:GetDescendants()) do
                if v.Name:lower():find("loot") then
                    player.Character:MoveTo(v.Position)
                end
            end
            task.wait(1)
        end
    end)
end)

-- =========================
-- 🌳 AUTO FARM (chặt cây)
-- =========================
local farm = false
createButton("Auto Farm: OFF", function(btn)
    farm = not farm
    btn.Text = "Auto Farm: "..(farm and "ON" or "OFF")

    task.spawn(function()
        while farm do
            for _,v in pairs(workspace:GetDescendants()) do
                if v.Name:lower():find("tree") then
                    player.Character:MoveTo(v.Position)
                end
            end
            task.wait(1)
        end
    end)
end)

-- =========================
-- 🌀 TELEPORT CAMP
-- =========================
createButton("Teleport Camp", function()
    for _,v in pairs(workspace:GetDescendants()) do
        if v.Name:lower():find("camp") then
            player.Character:MoveTo(v.Position)
        end
    end
end)

-- =========================
-- 👁️ ESP đơn giản
-- =========================
createButton("ESP Players", function()
    for _,p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character then
            local hl = Instance.new("Highlight", p.Character)
            hl.FillColor = Color3.fromRGB(255,0,0)
        end
    end
end)
