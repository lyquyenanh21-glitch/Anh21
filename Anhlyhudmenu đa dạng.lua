--// FOREST VIP FINAL FULL

local player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)

-- ===== WATERMARK =====
local credit = Instance.new("TextLabel", gui)
credit.Size = UDim2.new(0,250,0,25)
credit.Position = UDim2.new(0.5,-125,0,10)
credit.BackgroundTransparency = 1
credit.Text = "anh ly hud | tiktok: @anh.vip.pro.fruits"
credit.TextColor3 = Color3.new(1,1,1)
credit.TextStrokeTransparency = 0
credit.TextScaled = true
credit.ZIndex = 999

-- ===== NÚT MỞ MENU (KÉO ĐƯỢC) =====
local open = Instance.new("TextButton", gui)
open.Size = UDim2.new(0,60,0,60)
open.Position = UDim2.new(0,20,0,200)
open.Text = "≡"
open.BackgroundColor3 = Color3.fromRGB(0,0,0)
open.TextColor3 = Color3.new(1,1,1)

-- drag mobile
local dragging, dragInput, startPos, startFramePos

open.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        startPos = input.Position
        startFramePos = open.Position
    end
end)

open.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - startPos
        open.Position = UDim2.new(
            startFramePos.X.Scale,
            startFramePos.X.Offset + delta.X,
            startFramePos.Y.Scale,
            startFramePos.Y.Offset + delta.Y
        )
    end
end)

open.InputEnded:Connect(function()
    dragging = false
end)

-- ===== MENU =====
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,320,0,320)
main.Position = UDim2.new(0.3,0,0.3,0)
main.BackgroundColor3 = Color3.fromRGB(25,25,25)
main.Visible = false
main.Active = true
main.Draggable = true

open.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- layout
local layout = Instance.new("UIListLayout", main)
layout.Padding = UDim.new(0,5)

-- button helper
local function btn(text, func)
    local b = Instance.new("TextButton", main)
    b.Size = UDim2.new(1,0,0,40)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(40,40,40)
    b.TextColor3 = Color3.new(1,1,1)

    b.MouseButton1Click:Connect(function()
        func(b)
    end)
end

-- =========================
-- 💀 FAKE GOD
-- =========================
local god = false
btn("Fake God: OFF", function(b)
    god = not god
    b.Text = "Fake God: "..(god and "ON" or "OFF")

    task.spawn(function()
        while god do
            local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.Health = hum.MaxHealth end
            task.wait(0.1)
        end
    end)
end)

-- =========================
-- ⚡ SPEED 90
-- =========================
local speed = false
local function applySpeed()
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = speed and 90 or 16 end
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
-- 🦘 JUMP x5
-- =========================
local jump = false
local function applyJump()
    local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.UseJumpPower = true
        hum.JumpPower = jump and 250 or 50
    end
end

btn("Jump x5: OFF", function(b)
    jump = not jump
    b.Text = "Jump x5: "..(jump and "ON" or "OFF")
    applyJump()
end)

player.CharacterAdded:Connect(function()
    task.wait(1)
    applyJump()
end)

-- =========================
-- ✈️ FLY NHẸ
-- =========================
local fly = false
btn("Fly: OFF", function(b)
    fly = not fly
    b.Text = "Fly: "..(fly and "ON" or "OFF")

    task.spawn(function()
        while fly do
            local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            if root then root.Velocity = Vector3.new(0,20,0) end
            task.wait(0.1)
        end
    end)
end)

-- =========================
-- 🧱 NOCLIP
-- =========================
local noclip = false
btn("NoClip: OFF", function(b)
    noclip = not noclip
    b.Text = "NoClip: "..(noclip and "ON" or "OFF")
end)

RunService.Stepped:Connect(function()
    if noclip then
        local char = player.Character
        if char then
            for _,v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end
end)

-- =========================
-- 👁️ ESP PLAYER
-- =========================
btn("ESP Player", function()
    for _,p in pairs(game.Players:GetPlayers()) do
        if p ~= player and p.Character then
            if not p.Character:FindFirstChild("ESP") then
                local hl = Instance.new("Highlight", p.Character)
                hl.Name = "ESP"
                hl.FillColor = Color3.fromRGB(255,0,0)
            end
        end
    end
end)

-- =========================
-- 👹 ESP NPC
-- =========================
btn("ESP NPC", function()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") and not game.Players:GetPlayerFromCharacter(v) then
            if not v:FindFirstChild("NPC_ESP") then
                local hl = Instance.new("Highlight", v)
                hl.Name = "NPC_ESP"
                hl.FillColor = Color3.fromRGB(255,100,0)
            end
        end
    end
end)
