--// FOREST VIP FINAL - anhlyhud

local player = game.Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui
gui.Name = "ForestFinal"

-- Nút mở menu
local open = Instance.new("TextButton")
open.Parent = gui
open.Size = UDim2.new(0,60,0,60)
open.Position = UDim2.new(0,20,0,200)
open.Text = "≡"
open.BackgroundColor3 = Color3.fromRGB(0,0,0)
open.TextColor3 = Color3.new(1,1,1)

-- MENU
local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0,320,0,300)
main.Position = UDim2.new(0.3,0,0.3,0)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.Visible = false
main.Active = true
main.Draggable = true

-- toggle menu
open.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,30)
title.Text = "🌲 Forest VIP | anhlyhud"
title.BackgroundColor3 = Color3.fromRGB(0,0,0)
title.TextColor3 = Color3.new(1,1,1)

-- watermark
local credit = Instance.new("TextLabel", main)
credit.Size = UDim2.new(1,0,0,20)
credit.Position = UDim2.new(0,0,1,-20)
credit.Text = "tiktok: anh.vip.pro.fruits"
credit.BackgroundTransparency = 1
credit.TextColor3 = Color3.new(1,1,1)
credit.TextScaled = true

-- container
local container = Instance.new("Frame", main)
container.Size = UDim2.new(1,0,1,-50)
container.Position = UDim2.new(0,0,0,30)
container.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", container)
layout.Padding = UDim.new(0,5)

-- tạo nút chuẩn (fix lỗi callback)
local function btn(text, func)
    local b = Instance.new("TextButton")
    b.Parent = container
    b.Size = UDim2.new(1,-10,0,40)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.TextColor3 = Color3.new(1,1,1)

    b.MouseButton1Click:Connect(function()
        func(b)
    end)
end

-- =========================
-- 💀 FAKE GOD (ổn định)
-- =========================
local god = false

btn("Fake God: OFF", function(b)
    god = not god
    b.Text = "Fake God: "..(god and "ON" or "OFF")

    task.spawn(function()
        while god do
            local char = player.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")

            if hum and hum.Health > 0 then
                hum.Health = hum.MaxHealth
            end

            task.wait(0.1)
        end
    end)
end)

-- =========================
-- ⚡ SPEED 90 (fix respawn)
-- =========================
local speed = false

local function applySpeed()
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = speed and 90 or 16
    end
end

btn("Speed: OFF", function(b)
    speed = not speed
    b.Text = "Speed: "..(speed and "ON" or "OFF")
    applySpeed()
end)

player.CharacterAdded:Connect(function()
    task.wait(1)
    applySpeed()
end)

-- =========================
-- 🦘 JUMP
-- =========================
local jump = false

local function applyJump()
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.JumpPower = jump and 80 or 50
    end
end

btn("Jump: OFF", function(b)
    jump = not jump
    b.Text = "Jump: "..(jump and "ON" or "OFF")
    applyJump()
end)

player.CharacterAdded:Connect(function()
    task.wait(1)
    applyJump()
end)

-- =========================
-- 🌀 TP SAFE
-- =========================
btn("TP Forward", function()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char:PivotTo(char.HumanoidRootPart.CFrame * CFrame.new(0,0,-12))
    end
end)

-- =========================
-- 🛡️ ANTI FALL
-- =========================
btn("Anti Fall", function()
    local char = player.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        char.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
    end
end)

-- =========================
-- 👁️ ESP PLAYER (fix lag)
-- =========================
btn("ESP Players", function()
    for _,p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character then
            if not p.Character:FindFirstChild("ESP_HL") then
                local hl = Instance.new("Highlight")
                hl.Name = "ESP_HL"
                hl.FillColor = Color3.fromRGB(255,0,0)
                hl.Parent = p.Character
            end
        end
    end
end)
