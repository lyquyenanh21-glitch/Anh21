-- FULL ANHLY HUB PRO (SAFE + UI + FRUIT ESP)

--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

--// UI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "AnhLyHub"

-- MAIN FRAME
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,420,0,260)
main.Position = UDim2.new(0.3,0,0.25,0)
main.BackgroundColor3 = Color3.fromRGB(18,18,18)

-- DRAG
local dragging, dragStart, startPos
main.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = i.Position
        startPos = main.Position
    end
end)

UIS.InputChanged:Connect(function(i)
    if dragging then
        local delta = i.Position - dragStart
        main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

UIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- SIDEBAR
local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,110,1,0)
side.BackgroundColor3 = Color3.fromRGB(28,28,28)

-- CONTENT
local content = Instance.new("Frame", main)
content.Size = UDim2.new(1,-110,1,0)
content.Position = UDim2.new(0,110,0,0)
content.BackgroundColor3 = Color3.fromRGB(22,22,22)

-- LOGO + TIKTOK
local logo = Instance.new("TextLabel", side)
logo.Size = UDim2.new(1,0,0,30)
logo.Text = "ANHLY HUB"
logo.BackgroundTransparency = 1
logo.TextScaled = true

local tiktok = Instance.new("TextLabel", side)
tiktok.Size = UDim2.new(1,0,0,20)
tiktok.Position = UDim2.new(0,0,0,30)
tiktok.Text = "@anh.vip.pro.fruits"
tiktok.BackgroundTransparency = 1
tiktok.TextScaled = true

-- TABS
local tabs = {"Main","Teleport","Info","Settings"}
local pages = {}

for i,name in ipairs(tabs) do
    local btn = Instance.new("TextButton", side)
    btn.Size = UDim2.new(1,0,0,30)
    btn.Position = UDim2.new(0,0,0,60 + (i-1)*35)
    btn.Text = name

    local page = Instance.new("Frame", content)
    page.Size = UDim2.new(1,0,1,0)
    page.Visible = (i==1)
    pages[name] = page

    btn.MouseButton1Click:Connect(function()
        for _,p in pairs(pages) do p.Visible = false end
        page.Visible = true
    end)
end

-- INFO PAGE
local info = Instance.new("TextLabel", pages["Info"])
info.Size = UDim2.new(1,0,1,0)
info.BackgroundTransparency = 1
info.TextScaled = true

RunService.RenderStepped:Connect(function()
    local data = player:FindFirstChild("Data")
    if data then
        local level = data:FindFirstChild("Level")
        local beli = data:FindFirstChild("Beli")

        info.Text = "Level: "..(level and level.Value or "?")..
        "\nBeli: "..(beli and beli.Value or "?")
    end
end)

-- TELEPORT SEARCH
local tpPage = pages["Teleport"]

local search = Instance.new("TextBox", tpPage)
search.Size = UDim2.new(1,-10,0,30)
search.Position = UDim2.new(0,5,0,5)
search.PlaceholderText = "Search island..."

local list = Instance.new("ScrollingFrame", tpPage)
list.Size = UDim2.new(1,0,1,-40)
list.Position = UDim2.new(0,0,0,40)

local layout = Instance.new("UIListLayout", list)
local islandButtons = {}

for _,v in pairs(workspace:GetChildren()) do
    if v:IsA("Model") then
        local part = v:FindFirstChildWhichIsA("BasePart")
        if part then
            local btn = Instance.new("TextButton", list)
            btn.Size = UDim2.new(1,0,0,30)
            btn.Text = v.Name

            islandButtons[#islandButtons+1] = btn

            btn.MouseButton1Click:Connect(function()
                player.Character:MoveTo(part.Position)
            end)
        end
    end
end

search:GetPropertyChangedSignal("Text"):Connect(function()
    local txt = search.Text:lower()
    for _,btn in pairs(islandButtons) do
        btn.Visible = btn.Text:lower():find(txt) ~= nil
    end
end)

-- FRUIT ESP
local espFolder = Instance.new("Folder", game.CoreGui)

local function createESP(fruit)
    local bill = Instance.new("BillboardGui")
    bill.Size = UDim2.new(0,100,0,40)
    bill.AlwaysOnTop = true

    local text = Instance.new("TextLabel", bill)
    text.Size = UDim2.new(1,0,1,0)
    text.BackgroundTransparency = 1
    text.TextColor3 = Color3.fromRGB(0,255,0)
    text.TextScaled = true

    bill.Parent = espFolder

    RunService.RenderStepped:Connect(function()
        if fruit and fruit.Parent then
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            local part = fruit:FindFirstChild("Handle") or fruit:FindFirstChildWhichIsA("BasePart")

            if hrp and part then
                bill.Adornee = part
                local dist = (hrp.Position - part.Position).Magnitude
                text.Text = fruit.Name.." ["..math.floor(dist).."]"
            end
        else
            bill:Destroy()
        end
    end)
end

for _,v in pairs(workspace:GetDescendants()) do
    if v:IsA("Tool") and v.Name:lower():find("fruit") then
        createESP(v)
    end
end

workspace.DescendantAdded:Connect(function(v)
    if v:IsA("Tool") and v.Name:lower():find("fruit") then
        createESP(v)
    end
end)
