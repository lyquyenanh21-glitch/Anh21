--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0 = string.char;
local v1 = string.byte;
local v2 = string.sub;
local v3 = bit32 or bit;
local v4 = v3.bxor;
local v5 = table.concat;
local v6 = table.insert;
local function v7(v26, v27)
	local v28 = {};
	for v41 = 1, #v26 do
		v6(v28, v0(v4(v1(v2(v26, v41, v41 + 1)), v1(v2(v27, 1 + (v41 % #v27), 1 + (v41 % #v27) + 1))) % 256));
	end
	return v5(v28);
end
local v8 = game:GetService(v7("\253\202\220\45\242\178\201\25", "\126\177\163\187\69\134\219\167"));
local v9 = game:GetService(v7("\20\194\56\206\239\51\204\41\192", "\156\67\173\74\165"));
local v10 = game:GetService(v7("\6\162\71\37\185\52\80\61\180\76", "\38\84\215\41\118\220\70"));
local v11 = 9 + 11;
local v12 = 12 + 88;
local v13 = 916 - (660 + 176);
local v14 = 300;
local v15 = 1481 - (282 + 1174);
local v16 = 7 + 43;
v8.GlobalShadows = false;
v8.Brightness = 202.8 - (14 + 188);
v8.ClockTime = 2 + 16;
v8.FogColor = Color3.fromRGB(795 - (534 + 141), 120, 49 + 71);
v8.OutdoorAmbient = Color3.fromRGB(124 + 16, 140, 1411 - (945 + 326));
for v29, v30 in pairs(v8:GetChildren()) do
	if (v30:IsA(v7("\114\26\45\29\243\117\16\36\23\253\68", "\158\48\118\66\114")) or v30:IsA(v7("\152\49\30\4\114\188\232\142\34\22\51\112\177", "\155\203\68\112\86\19\197")) or v30:IsA(v7("\100\209\35\238\101\126\227\253\69\201", "\152\38\189\86\156\32\24\133")) or v30:IsA(v7("\223\88\171\73\238\116\168\84\238\82\164\82\245\88\169\99\250\81\162\69\232", "\38\156\55\199"))) then
		v30:Destroy();
	end
end
local v22 = {v7("\187\118\117\36\31", "\35\200\29\28\72\115\20\154"),v7("\31\167", "\84\121\223\177\191\237\76"),v7("\173\80\209", "\161\219\54\169\192\90\48\80"),v7("\72\86\20\36\74\73", "\69\41\34\96"),v7("\190\204\216\7", "\75\220\163\183\106\98"),v7("\14\179\140\63\205", "\185\98\218\235\87"),v7("\198\61\32\235\223", "\202\171\92\71\134\190"),v7("\47\200\62\141", "\232\73\161\76"),v7("\178\218\71", "\126\219\185\34\61"),v7("\8\220\95\117\113\121", "\135\108\174\62\18\30\23\147"),v7("\167\252\43\192\29", "\167\214\137\74\171\120\206\83")};
local function v23(v31)
	local v32 = 0 + 0;
	while true do
		local v42 = 0 - 0;
		while true do
			if (v42 == 0) then
				if ((3 - 2) == v32) then
					return false;
				end
				if (v32 == (0 + 0)) then
					v31 = string.lower(v31);
					for v59, v60 in pairs(v22) do
						if string.find(v31, v60) then
							return true;
						end
					end
					v32 = 1;
				end
				break;
			end
		end
	end
end
local function v24(v33)
	local v34 = 867 - (550 + 317);
	while true do
		if (v34 == (3 - 0)) then
			if (v33:IsA(v7("\53\53\177\57\66", "\73\113\80\210\88\46\87")) or v33:IsA(v7("\181\41\213\6\242\147\41", "\135\225\76\173\114"))) then
				v33.Transparency = 0.5 - 0;
			end
			break;
		end
		if ((2 - 1) == v34) then
			if v33:IsA(v7("\237\54\48\140\187\10\245\199\32", "\156\168\78\64\224\212\121")) then
				v33.Visible = false;
			end
			if (v33:IsA(v7("\55\225\172\192\19\194\172\201\15\250", "\174\103\142\197")) or v33:IsA(v7("\101\56\80\44\9\87\255\94\60", "\152\54\72\63\88\69\62")) or v33:IsA(v7("\231\209\252\90\213\199\235\112\221\195\230\72", "\60\180\164\142"))) then
				local v46 = 285 - (134 + 151);
				while true do
					if (v46 == (1665 - (970 + 695))) then
						v33.Brightness = 0.1 - 0;
						v33.Range = v33.Range * (1145.2 - (466 + 679));
						break;
					end
				end
			end
			v34 = 2;
		end
		if (v34 == (1992 - (582 + 1408))) then
			if (v33:IsA(v7("\117\81\1\44\43", "\114\56\62\101\73\71\141")) and v23(v33.Name)) then
				for v55, v56 in pairs(v33:GetDescendants()) do
					local v57 = 0 - 0;
					local v58;
					while true do
						if (v57 == (0 - 0)) then
							v58 = 0 - 0;
							while true do
								if ((1824 - (1195 + 629)) == v58) then
									if v56:IsA(v7("\136\232\201\208\177\234\215\193\157\228\210\208\172\236\201", "\164\216\137\187")) then
										v56.Rate = 1 + 0;
									end
									if (v56:IsA(v7("\230\244\48\187\170", "\107\178\134\81\210\198\158")) or v56:IsA(v7("\26\11\131\203", "\202\88\110\226\166"))) then
										v56.Transparency = NumberSequence.new(0.9 - 0);
									end
									break;
								end
							end
							break;
						end
					end
				end
			end
			if v33:IsA(v7("\225\14\145\242\250\194\29\150", "\170\163\111\226\151")) then
				local v47 = 241 - (187 + 54);
				local v48;
				while true do
					if (v47 == (0 - 0)) then
						v48 = 780 - (162 + 618);
						while true do
							if (v48 == (0 + 0)) then
								v33.Material = Enum.Material.SmoothPlastic;
								v33.Reflectance = 0 + 0;
								v48 = 1428 - (41 + 1386);
							end
							if (v48 == (104 - (17 + 86))) then
								v33.CastShadow = false;
								break;
							end
						end
						break;
					end
				end
			end
			v34 = 3 + 0;
		end
		if (0 == v34) then
			if v33:IsA(v7("\187\241\32\73\241\164\135\245\23\80\241\179\159\245\32", "\199\235\144\82\61\152")) then
				local v49 = 0 - 0;
				local v50;
				while true do
					if (v49 == (0 - 0)) then
						v50 = 0 + 0;
						while true do
							if (v50 == (1637 - (1373 + 263))) then
								v33.Speed = NumberRange.new(0);
								v33.Enabled = true;
								break;
							end
							if (v50 == (0 - 0)) then
								v33.Rate = 1001 - (451 + 549);
								v33.Lifetime = NumberRange.new(0.05 - 0);
								v50 = 1;
							end
						end
						break;
					end
				end
			end
			if (v33:IsA(v7("\51\4\184\34\11", "\75\103\118\217")) or v33:IsA(v7("\229\81\113\25", "\126\167\52\16\116\217"))) then
				local v51 = 0 + 0;
				local v52;
				while true do
					if (v51 == (0 - 0)) then
						v52 = 0;
						while true do
							if (v52 == (0 - 0)) then
								v33.Enabled = true;
								v33.Transparency = NumberSequence.new(1384.9 - (746 + 638));
								break;
							end
						end
						break;
					end
				end
			end
			v34 = 1 + 0;
		end
	end
end
for v35, v36 in pairs(v9:GetDescendants()) do
	v24(v36);
end
v9.DescendantAdded:Connect(function(v37)
	v24(v37);
end);
local v25 = tick();
v10.RenderStepped:Connect(function()
	local v38 = 0 - 0;
	local v39;
	local v40;
	while true do
		if (v38 == (342 - (218 + 123))) then
			v25 = v39;
			if (v40 <= v15) then
				local v53 = 1257 - (1043 + 214);
				local v54;
				while true do
					if (v53 == 0) then
						v54 = 1581 - (1535 + 46);
						while true do
							if (v54 == (0 + 0)) then
								v8.FogStart = v11;
								v8.FogEnd = v12;
								break;
							end
						end
						break;
					end
				end
			elseif (v40 >= v16) then
				local v61 = 0;
				while true do
					if ((0 + 0) == v61) then
						v8.FogStart = v13;
						v8.FogEnd = v14;
						break;
					end
				end
			else
				local v62 = 560 - (306 + 254);
				local v63;
				while true do
					if (v62 == (2 - 1)) then
						v8.FogEnd = v12 + ((v14 - v12) * v63);
						break;
					end
					if (v62 == (0 + 0)) then
						v63 = (v40 - v15) / (v16 - v15);
						v8.FogStart = v11 + ((v13 - v11) * v63);
						v62 = 1 - 0;
					end
				end
			end
			break;
		end
		if ((1467 - (899 + 568)) == v38) then
			local v43 = 413 - (15 + 398);
			while true do
				if (v43 == (1 + 0)) then
					v38 = 1;
					break;
				end
				if (v43 == (0 - 0)) then
					v39 = tick();
					v40 = math.floor((604 - (268 + 335)) / (v39 - v25));
					v43 = 291 - (60 + 230);
				end
			end
		end
	end
end);
print("💀🔥 FINAL ULTIMATE ENABLED");