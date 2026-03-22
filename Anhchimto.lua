--// KEY
local correctKey = "anhprofruits"

-- KEY UI
local keyGui = Instance.new("ScreenGui", game.CoreGui)
local keyFrame = Instance.new("Frame", keyGui)
keyFrame.Size = UDim2.new(0,260,0,150)
keyFrame.Position = UDim2.new(0.5,-130,0.5,-75)
keyFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
Instance.new("UICorner", keyFrame)

local box = Instance.new("TextBox", keyFrame)
box.Size = UDim2.new(0.8,0,0,30)
box.Position = UDim2.new(0.1,0,0.4,0)
box.PlaceholderText = "Enter key..."
box.BackgroundColor3 = Color3.fromRGB(30,30,30)
box.TextColor3 = Color3.fromRGB(255,255,0)

local btn = Instance.new("TextButton", keyFrame)
btn.Size = UDim2.new(0.8,0,0,30)
btn.Position = UDim2.new(0.1,0,0.7,0)
btn.Text = "Submit"
btn.BackgroundColor3 = Color3.fromRGB(0,255,255)

local unlocked = false
btn.MouseButton1Click:Connect(function()
    if box.Text == correctKey then
        unlocked = true
        keyGui:Destroy()
    else
        box.Text = "❌ Sai key"
    end
end)

repeat task.wait() until unlocked

--// SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

local plr = Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

--// CONFIG
local Config = {
    Speed = 50,
    Fly = false,
    Noclip = false,
    Jump = false,
    ESP = false,
    GodMode = false
}

-- BLUR
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 10

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)

-- LOGO
local logo = Instance.new("TextButton", gui)
logo.Size = UDim2.new(0,50,0,50)
logo.Position = UDim2.new(0,10,0.5,0)
logo.Text = "⚡"
logo.BackgroundColor3 = Color3.fromRGB(0,255,255)

Instance.new("UICorner", logo)

-- MAIN
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,260,0,350)
main.Position = UDim2.new(0.05,0,0.2,0)
main.BackgroundColor3 = Color3.fromRGB(10,10,10)
main.Active = true
main.Draggable = true

Instance.new("UICorner", main)

local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(0,255,255)

local layout = Instance.new("UIListLayout", main)
layout.Padding = UDim.new(0,6)

logo.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- TITLE
local title = Instance.new("TextLabel", main)
title.Text = "⚡ GOD MENU"
title.Size = UDim2.new(1,0,0,30)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(0,255,255)

-- SPEED
local speedLabel = Instance.new("TextLabel", main)
speedLabel.Text = "Speed: "..Config.Speed
speedLabel.Size = UDim2.new(1,0,0,25)
speedLabel.BackgroundTransparency = 1
speedLabel.TextColor3 = Color3.fromRGB(255,255,0)

local slider = Instance.new("TextButton", main)
slider.Size = UDim2.new(1,0,0,25)
slider.Text = "Drag chỉnh speed"
slider.BackgroundColor3 = Color3.fromRGB(25,25,25)
slider.TextColor3 = Color3.fromRGB(0,255,255)

local dragging = false
slider.MouseButton1Down:Connect(function() dragging = true end)
UIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)

UIS.InputChanged:Connect(function(i)
    if dragging then
        local x = math.clamp((i.Position.X - slider.AbsolutePosition.X)/slider.AbsoluteSize.X,0,1)
        Config.Speed = math.floor(1 + 499*x)
        speedLabel.Text = "Speed: "..Config.Speed
    end
end)

-- TOGGLE
local function Toggle(name, color)
    local btn = Instance.new("TextButton", main)
    btn.Size = UDim2.new(1,0,0,30)
    btn.BackgroundColor3 = Color3.fromRGB(25,25,25)
    btn.TextColor3 = color or Color3.fromRGB(0,255,255)
    btn.Text = name.." : OFF"

    btn.MouseButton1Click:Connect(function()
        Config[name] = not Config[name]
        btn.Text = name.." : "..(Config[name] and "ON" or "OFF")
    end)
end

Toggle("Fly")
Toggle("Noclip")
Toggle("Jump")
Toggle("ESP")

-- GOD MODE
local godLoaded = false

local godBtn = Instance.new("TextButton", main)
godBtn.Size = UDim2.new(1,0,0,30)
godBtn.BackgroundColor3 = Color3.fromRGB(25,25,25)
godBtn.TextColor3 = Color3.fromRGB(255,0,0)
godBtn.Text = "God Mode : OFF"

godBtn.MouseButton1Click:Connect(function()
    Config.GodMode = not Config.GodMode
    godBtn.Text = "God Mode : "..(Config.GodMode and "ON" or "OFF")

    if Config.GodMode then
        if not godLoaded then
            godLoaded = true
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/DATABASE/refs/heads/main/99%20Nights%20in%20the%20Forest/Infinite%20Health.lua"))()
        end
    else
        if plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.Health = 0
        end
        godLoaded = false
    end
end)

-- APPLY
RunService.RenderStepped:Connect(function()
    hum.WalkSpeed = Config.Speed
end)

RunService.Stepped:Connect(function()
    if Config.Noclip then
        for _,v in pairs(char:GetChildren()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end
end)

UIS.JumpRequest:Connect(function()
    if Config.Jump then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- FLY
local bv, bg
RunService.RenderStepped:Connect(function()
    if Config.Fly then
        if not bv then
            bv = Instance.new("BodyVelocity", root)
            bv.MaxForce = Vector3.new(9e9,9e9,9e9)
            bg = Instance.new("BodyGyro", root)
            bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
        end

        local cam = workspace.CurrentCamera
        local dir = Vector3.zero

        if UIS:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end
        if UIS:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0,1,0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then dir -= Vector3.new(0,1,0) end

        bv.Velocity = dir * Config.Speed
        bg.CFrame = cam.CFrame
    else
        if bv then bv:Destroy() bv=nil end
        if bg then bg:Destroy() bg=nil end
    end
end)

-- ESP
local esp = {}
RunService.RenderStepped:Connect(function()
    if Config.ESP then
        for _,p in pairs(Players:GetPlayers()) do
            if p ~= plr and p.Character and not esp[p] then
                local h = Instance.new("Highlight", p.Character)
                h.FillColor = Color3.fromRGB(255,0,0)
                h.OutlineColor = Color3.fromRGB(0,255,0)
                esp[p] = h
            end
        end
    else
        for _,v in pairs(esp) do v:Destroy() end
        esp = {}
    end
end)

-- SAVE CONFIG
spawn(function()
    while task.wait(5) do
        if writefile then
            writefile("GOD_Config.txt", HttpService:JSONEncode(Config))
        end
    end
end)
