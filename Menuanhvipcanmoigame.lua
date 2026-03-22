--// KEY
local correctKey = "anhprofruits"
local link = "https://taplayma.com/link/q4bBnT4gd0"

local keyGui = Instance.new("ScreenGui", game.CoreGui)
local f = Instance.new("Frame", keyGui)
f.Size = UDim2.new(0,220,0,150)
f.Position = UDim2.new(0.5,-110,0.5,-75)
f.BackgroundColor3 = Color3.fromRGB(20,20,20)
Instance.new("UICorner",f)

local box = Instance.new("TextBox",f)
box.Size = UDim2.new(0.8,0,0,25)
box.Position = UDim2.new(0.1,0,0.3,0)
box.PlaceholderText="Enter key"
box.TextScaled=true

local btn = Instance.new("TextButton",f)
btn.Size = UDim2.new(0.8,0,0,25)
btn.Position = UDim2.new(0.1,0,0.6,0)
btn.Text="Submit"
btn.TextScaled=true

local get = Instance.new("TextButton",f)
get.Size = UDim2.new(0.8,0,0,20)
get.Position = UDim2.new(0.1,0,0.8,0)
get.Text="GET KEY"
get.TextScaled=true

get.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(link) end
end)

local ok=false
btn.MouseButton1Click:Connect(function()
    if box.Text==correctKey then ok=true keyGui:Destroy() end
end)
repeat task.wait() until ok

-- SERVICES
local Players=game:GetService("Players")
local RunService=game:GetService("RunService")
local UIS=game:GetService("UserInputService")
local Lighting=game:GetService("Lighting")

local plr=Players.LocalPlayer
local char=plr.Character or plr.CharacterAdded:Wait()
local hum=char:WaitForChild("Humanoid")
local root=char:WaitForChild("HumanoidRootPart")

-- CONFIG
local C={
Speed=50,
Jump=50,
Fly=false,Noclip=false,InfJump=false,ESP=false,God=false,
BringPlayer=false,BringNPC=false,BringItem=false
}

-- FIX RESPAWN
plr.CharacterAdded:Connect(function(c)
    char=c
    hum=char:WaitForChild("Humanoid")
    root=char:WaitForChild("HumanoidRootPart")
    hum.WalkSpeed=C.Speed
    hum.JumpPower=C.Jump
end)

-- BLUR
Instance.new("BlurEffect",Lighting).Size=8

-- GUI
local gui=Instance.new("ScreenGui",game.CoreGui)

-- LOGO
local logo=Instance.new("TextButton",gui)
logo.Size=UDim2.new(0,40,0,40)
logo.Position=UDim2.new(0,10,0.5,0)
logo.Text="⚡"

-- DRAG
do
local d=false;local s;local p
logo.InputBegan:Connect(function(i)
if i.UserInputType.Name:find("Mouse") or i.UserInputType.Name=="Touch" then
d=true;s=i.Position;p=logo.Position
end end)
UIS.InputChanged:Connect(function(i)
if d then
local delta=i.Position-s
logo.Position=UDim2.new(p.X.Scale,p.X.Offset+delta.X,p.Y.Scale,p.Y.Offset+delta.Y)
end end)
end

-- MENU
local main=Instance.new("Frame",gui)
main.Size=UDim2.new(0,230,0,340)
main.Position=UDim2.new(0.05,0,0.2,0)
main.BackgroundColor3=Color3.fromRGB(10,10,10)
main.Active=true
main.Draggable=true
Instance.new("UICorner",main)

logo.MouseButton1Click:Connect(function()
main.Visible=not main.Visible
end)

local layout=Instance.new("UIListLayout",main)
layout.Padding=UDim.new(0,4)

-- TITLE
local title=Instance.new("TextLabel",main)
title.Text="⚡ ANHLYHUD"
title.Size=UDim2.new(1,0,0,25)
title.TextScaled=true
title.BackgroundTransparency=1

-- RGB
local stroke=Instance.new("UIStroke",main)
spawn(function()
while true do
for i=0,1,0.02 do
stroke.Color=Color3.fromHSV(i,1,1)
logo.BackgroundColor3=stroke.Color
task.wait()
end end end)

-- SPEED INPUT
local sp=Instance.new("TextBox",main)
sp.PlaceholderText="Speed (1-500)"
sp.Size=UDim2.new(1,0,0,22)
sp.TextScaled=true
sp.FocusLost:Connect(function()
local n=tonumber(sp.Text)
if n then C.Speed=math.clamp(n,1,500) end
end)

-- JUMP INPUT (FIX)
local jp=Instance.new("TextBox",main)
jp.PlaceholderText="Jump (50-300)"
jp.Size=UDim2.new(1,0,0,22)
jp.TextScaled=true
jp.FocusLost:Connect(function()
local n=tonumber(jp.Text)
if n then
C.Jump=math.clamp(n,50,300)
hum.JumpPower=C.Jump
end
end)

-- TOGGLE FUNCTION
local function T(name)
local b=Instance.new("TextButton",main)
b.Size=UDim2.new(1,0,0,25)
b.Text=name.." : OFF"
b.TextScaled=true
b.MouseButton1Click:Connect(function()
C[name]=not C[name]
b.Text=name.." : "..(C[name] and "ON" or "OFF")
end)
end

T("Fly")
T("Noclip")
T("InfJump")
T("ESP")

-- GOD
local g=Instance.new("TextButton",main)
g.Size=UDim2.new(1,0,0,25)
g.Text="God : OFF"
g.TextScaled=true

g.MouseButton1Click:Connect(function()
C.God=not C.God
g.Text="God : "..(C.God and "ON" or "OFF")
if C.God then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBaconHub/DATABASE/refs/heads/main/99%20Nights%20in%20the%20Forest/Infinite%20Health.lua"))()
end
end)

-- FIX SPEED + JUMP REAL
RunService.RenderStepped:Connect(function()
if hum and hum.Parent then
if not C.Fly then
hum.WalkSpeed=C.Speed
end
hum.JumpPower=C.Jump
end
end)

-- CHỐNG RESET
hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
if not C.Fly then hum.WalkSpeed=C.Speed end
end)

hum:GetPropertyChangedSignal("JumpPower"):Connect(function()
hum.JumpPower=C.Jump
end)

-- NOCLIP
RunService.Stepped:Connect(function()
if C.Noclip then
for _,v in pairs(char:GetChildren()) do
if v:IsA("BasePart") then v.CanCollide=false end
end end
end)

-- INFINITE JUMP
UIS.JumpRequest:Connect(function()
if C.InfJump then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
end)

-- FLY
local bv,bg
RunService.RenderStepped:Connect(function()
if C.Fly then
if not bv then
bv=Instance.new("BodyVelocity",root)
bv.MaxForce=Vector3.new(9e9,9e9,9e9)
bg=Instance.new("BodyGyro",root)
bg.MaxTorque=Vector3.new(9e9,9e9,9e9)
end
local cam=workspace.CurrentCamera
bv.Velocity=cam.CFrame.LookVector*C.Speed
bg.CFrame=cam.CFrame
else
if bv then bv:Destroy() bg:Destroy() bv=nil bg=nil end
end
end)

-- ESP
local esp={}
RunService.RenderStepped:Connect(function()
if C.ESP then
for _,v in pairs(workspace:GetDescendants()) do
if v:FindFirstChild("Humanoid") and not esp[v] then
local h=Instance.new("Highlight",v)
esp[v]=h
end end
else
for _,v in pairs(esp) do v:Destroy() end
esp={}
end
end)

-- BRING (TEST)
spawn(function()
while task.wait(0.3) do
if C.BringPlayer then
for _,p in pairs(Players:GetPlayers()) do
if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
p.Character.HumanoidRootPart.CFrame=root.CFrame*CFrame.new(0,0,-5)
end end end

if C.BringNPC then
for _,v in pairs(workspace:GetDescendants()) do
if v:FindFirstChild("Humanoid") and not Players:GetPlayerFromCharacter(v) and v:FindFirstChild("HumanoidRootPart") then
v.HumanoidRootPart.CFrame=root.CFrame*CFrame.new(0,0,-6)
end end end

if C.BringItem then
for _,v in pairs(workspace:GetDescendants()) do
if v:IsA("Tool") and v:FindFirstChild("Handle") then
v.Handle.CFrame=root.CFrame*CFrame.new(0,0,-3)
end end end
end
end)
