--// KEY
local KEY = "anhprofruits"
local LINK = "https://taplayma.com/link/q4bBnT4gd0"

local keygui = Instance.new("ScreenGui", game.CoreGui)
local f = Instance.new("Frame", keygui)
f.Size = UDim2.new(0,220,0,140)
f.Position = UDim2.new(0.5,-110,0.5,-70)
f.BackgroundColor3 = Color3.fromRGB(20,20,20)
Instance.new("UICorner",f)

local box = Instance.new("TextBox",f)
box.Size = UDim2.new(0.8,0,0,25)
box.Position = UDim2.new(0.1,0,0.3,0)
box.PlaceholderText="Enter Key"

local btn = Instance.new("TextButton",f)
btn.Size = UDim2.new(0.8,0,0,25)
btn.Position = UDim2.new(0.1,0,0.65,0)
btn.Text="Unlock"

local get = Instance.new("TextButton",f)
get.Size = UDim2.new(0.8,0,0,20)
get.Position = UDim2.new(0.1,0,0.85,0)
get.Text="GET KEY"

get.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(LINK) end
end)

local ok=false
btn.MouseButton1Click:Connect(function()
    if box.Text==KEY then ok=true keygui:Destroy() end
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
Speed=50,Jump=50,
Fly=false,Noclip=false,InfJump=false,
ESP=false,FixLag=false,
BringPlayer=false,BringNPC=false,BringItem=false
}

-- RESPAWN FIX
plr.CharacterAdded:Connect(function(c)
    char=c
    hum=char:WaitForChild("Humanoid")
    root=char:WaitForChild("HumanoidRootPart")
end)

-- GUI
local gui=Instance.new("ScreenGui",game.CoreGui)

-- LOGO FIXED TOP RIGHT
local logo=Instance.new("TextButton",gui)
logo.Size=UDim2.new(0,40,0,40)
logo.Position=UDim2.new(1,-50,0,10)
logo.Text="⚡"
logo.BackgroundColor3=Color3.fromRGB(0,255,255)
logo.TextColor3=Color3.fromRGB(0,0,0)
Instance.new("UICorner",logo)

logo.MouseButton1Click:Connect(function()
    main.Visible = not main.Visible
end)

-- MENU
local main=Instance.new("Frame",gui)
main.Size=UDim2.new(0,260,0,300)
main.Position=UDim2.new(0.7,0,0.2,0)
main.BackgroundColor3=Color3.fromRGB(10,10,10)
main.Visible=true
main.Active=true
main.Draggable=true
Instance.new("UICorner",main)

-- TAB SYSTEM
local tabs={}
local pages={}

local tabHolder=Instance.new("Frame",main)
tabHolder.Size=UDim2.new(1,0,0,30)
tabHolder.BackgroundTransparency=1

local pageHolder=Instance.new("Frame",main)
pageHolder.Size=UDim2.new(1,0,1,-30)
pageHolder.Position=UDim2.new(0,0,0,30)
pageHolder.BackgroundTransparency=1

local function createTab(name)
    local b=Instance.new("TextButton",tabHolder)
    b.Size=UDim2.new(0.33,0,1,0)
    b.Text=name

    local p=Instance.new("Frame",pageHolder)
    p.Size=UDim2.new(1,0,1,0)
    p.Visible=false

    local layout=Instance.new("UIListLayout",p)
    layout.Padding=UDim.new(0,4)

    b.MouseButton1Click:Connect(function()
        for _,v in pairs(pages) do v.Visible=false end
        p.Visible=true
    end)

    table.insert(pages,p)
    return p
end

local mainTab=createTab("MAIN")
local bringTab=createTab("BRING")
local visualTab=createTab("VISUAL")

pages[1].Visible=true

-- TOGGLE
local function Toggle(parent,name)
    local b=Instance.new("TextButton",parent)
    b.Size=UDim2.new(1,0,0,25)
    b.Text=name.." : OFF"
    b.MouseButton1Click:Connect(function()
        C[name]=not C[name]
        b.Text=name.." : "..(C[name] and "ON" or "OFF")
    end)
end

-- MAIN TAB
local sp=Instance.new("TextBox",mainTab)
sp.PlaceholderText="Speed"
sp.FocusLost:Connect(function()
local n=tonumber(sp.Text)
if n then C.Speed=n end
end)

local jp=Instance.new("TextBox",mainTab)
jp.PlaceholderText="Jump"
jp.FocusLost:Connect(function()
local n=tonumber(jp.Text)
if n then C.Jump=n end
end)

Toggle(mainTab,"Fly")
Toggle(mainTab,"Noclip")
Toggle(mainTab,"InfJump")

-- BRING TAB
Toggle(bringTab,"BringPlayer")
Toggle(bringTab,"BringNPC")
Toggle(bringTab,"BringItem")

-- VISUAL TAB
Toggle(visualTab,"ESP")
Toggle(visualTab,"FixLag")

-- APPLY
RunService.RenderStepped:Connect(function()
if hum then
if not C.Fly then hum.WalkSpeed=C.Speed end
hum.JumpPower=C.Jump
end
end)

-- NOCLIP
RunService.Stepped:Connect(function()
if C.Noclip then
for _,v in pairs(char:GetChildren()) do
if v:IsA("BasePart") then v.CanCollide=false end
end end
end)

-- INF JUMP
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
bv.Velocity=workspace.CurrentCamera.CFrame.LookVector*C.Speed
bg.CFrame=workspace.CurrentCamera.CFrame
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
esp[v]=Instance.new("Highlight",v)
end end
else
for _,v in pairs(esp) do v:Destroy() end
esp={}
end
end)

-- FIX LAG
spawn(function()
while task.wait(1) do
if C.FixLag then
for _,v in pairs(workspace:GetDescendants()) do
if v:IsA("BasePart") then v.Material=Enum.Material.SmoothPlastic end
if v:IsA("Texture") then v:Destroy() end
end end end end)

-- BRING
spawn(function()
while task.wait(0.3) do
if C.BringPlayer then
for _,p in pairs(Players:GetPlayers()) do
if p~=plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
p.Character.HumanoidRootPart.CFrame=root.CFrame*CFrame.new(0,0,-5)
end end end

if C.BringNPC then
for _,v in pairs(workspace:GetDescendants()) do
if v:FindFirstChild("Humanoid") and not Players:GetPlayerFromCharacter(v) then
if v:FindFirstChild("HumanoidRootPart") then
v.HumanoidRootPart.CFrame=root.CFrame*CFrame.new(0,0,-6)
end end end end

if C.BringItem then
for _,v in pairs(workspace:GetDescendants()) do
if v:IsA("Tool") and v:FindFirstChild("Handle") then
v.Handle.CFrame=root.CFrame*CFrame.new(0,0,-3)
end end end
end
end)
