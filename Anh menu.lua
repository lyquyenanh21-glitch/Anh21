-- ANHLY HUB PRO MAX FULL

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)

-- MAIN
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,420,0,260)
main.Position = UDim2.new(0.3,0,0.3,0)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Instance.new("UICorner", main)

-- TOGGLE
local toggle = Instance.new("TextButton", gui)
toggle.Size = UDim2.new(0,50,0,50)
toggle.Position = UDim2.new(0,20,0,200)
toggle.Text = "☰"
toggle.TextScaled = true
Instance.new("UICorner", toggle)

-- DRAG TOGGLE
local drag,start,pos
toggle.InputBegan:Connect(function(i)
if i.UserInputType == Enum.UserInputType.MouseButton1 then
drag=true
start=i.Position
pos=toggle.Position
end
end)

UIS.InputChanged:Connect(function(i)
if drag then
local d=i.Position-start
toggle.Position=UDim2.new(pos.X.Scale,pos.X.Offset+d.X,pos.Y.Scale,pos.Y.Offset+d.Y)
end
end)

UIS.InputEnded:Connect(function() drag=false end)

-- OPEN/CLOSE
local open=true
toggle.MouseButton1Click:Connect(function()
open=not open
if open then
main.Visible=true
TweenService:Create(main,TweenInfo.new(0.2),{Size=UDim2.new(0,420,0,260)}):Play()
else
local t=TweenService:Create(main,TweenInfo.new(0.2),{Size=UDim2.new(0,0,0,0)})
t:Play()
t.Completed:Connect(function() main.Visible=false end)
end
end)

-- SIDE
local side=Instance.new("Frame",main)
side.Size=UDim2.new(0,110,1,0)
side.BackgroundColor3=Color3.fromRGB(30,30,30)

local content=Instance.new("Frame",main)
content.Size=UDim2.new(1,-110,1,0)
content.Position=UDim2.new(0,110,0,0)
content.BackgroundColor3=Color3.fromRGB(25,25,25)

-- BUTTON
local function btn(txt,y,cb)
local b=Instance.new("TextButton",content)
b.Size=UDim2.new(0,200,0,40)
b.Position=UDim2.new(0.1,0,y,0)
b.Text=txt
b.BackgroundColor3=Color3.fromRGB(50,50,50)
Instance.new("UICorner",b)
b.MouseButton1Click:Connect(cb)
end

-- SCRIPT
btn("LOAD MENU",0.2,function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/hoannhatz/Script/refs/heads/main/EZScript.lua"))()
end)

btn("KAITUN",0.4,function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/lyquyenanh21-glitch/Anh/refs/heads/main/anh.vip.pro.fruits-Kaitun.flix-lag.lua"))()
end)

btn("FLIX V1",0.55,function()
loadstring(game:HttpGet("https://pastefy.app/br1UtGA7/raw"))()
end)

btn("FLIX V2",0.7,function()
loadstring(game:HttpGet("https://pastefy.app/UMBgn0kK/raw?part=Flix_lag_v2.lua"))()
end)

-- MUSIC
local sound=Instance.new("Sound",workspace)
sound.Volume=1

btn("PLAY MUSIC",0.85,function()
sound.SoundId="rbxassetid://1843529600"
sound:Play()
end)
