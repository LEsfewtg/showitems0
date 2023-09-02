local RAMAccount = loadstring(game:HttpGet'https://raw.githubusercontent.com/ic3w0lf22/Roblox-Account-Manager/master/RAMAccount.lua')()
local MyAccount = RAMAccount.new(game:GetService'Players'.LocalPlayer.Name)
local u = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("getInventory")
local Remote = game.ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")
local Race = " V1"
local meleedata = "\n- Melee:\n"
local sworddata = "\n- Sword:\n"
local fruitdata = "\n- Fruit:\n"
local Gundata = "\n- Gun:\n"
local weardata = "\n- Accesory:\n"
local materialdata = "\n- Material:\n"

if game:GetService("Players").LocalPlayer.Character:FindFirstChild("RaceTransformed") then
    Race = " V4"
elseif Remote:InvokeServer("Wenlocktoad", "1") == -2 then
    Race = " V3"
elseif Remote:InvokeServer("Alchemist", "1") == -2 then
    Race = " V2"
end

local data =
    "Player Name: " .. game.Players.LocalPlayer.Name ..
    "\nLevel: " .. tostring(game.Players.LocalPlayer.Data.Level.Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "") ..
    "\nBeli: " .. tostring(game.Players.LocalPlayer.Data.Beli.Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "") ..
    "\nFrag: " .. tostring(game.Players.LocalPlayer.Data.Fragments.Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "") ..
    "\nDevil Fruit: " .. tostring(game:GetService("Players").LocalPlayer.Data.DevilFruit.Value) ..
    "\nBounty/Honor: " .. tostring(game:GetService("Players").LocalPlayer.leaderstats["Bounty/Honor"].Value):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "") ..
    '\nRace: ' .. game.Players.LocalPlayer.Data.Race.Value .. Race

local args = {
    "Death Step",
    "Sharkman Karate",
    "Superhuman",
    "Dragon Talon",
    "Electric Claw",
    "Godhuman"
}

local function Sort(Rarity)
    if Rarity == 1 then
        return "+ [Common] "
    elseif Rarity == 2 then
        return "+ [Uncommon] "
    elseif Rarity == 3 then
        return "+ [Rare] "
    elseif Rarity == 4 then
        return "+ [Legendary] "
    elseif Rarity == 5 then
        return "+ [Mythical] "
    else
        return "+ [Unknown] "
    end
end

for i, v in pairs(u) do
    if v["Type"] == "Sword" then
        sworddata = sworddata .. " " .. Sort(v["Rarity"]) .. v["Name"] .. "\n"
    elseif v["Type"] == "Blox Fruit" then
        fruitdata = fruitdata .. " " .. Sort(v["Rarity"]) .. v["Name"] .. "\n"
    elseif v["Type"] == "Material" then
        materialdata = materialdata .. " " .. Sort(v["Rarity"]) .. v["Name"] .. ": " .. tostring(v["Count"]) .. " " .. "\n"
    elseif v["Type"] == "Gun" then
        Gundata = Gundata .. " " .. Sort(v["Rarity"]) .. v["Name"] .. "\n"
    elseif v["Type"] == "Wear" then
        weardata = weardata .. " " .. Sort(v["Rarity"]) .. v["Name"] .. "\n"
    end
end

for i, v in pairs(args) do
    if game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("Buy" .. string.gsub(v, " ", ""), true) == 1 then
        meleedata = meleedata .. " + " .. v .. '\n'
    end
end

data = data .. '\n' .. meleedata .. sworddata .. Gundata .. weardata .. fruitdata .. materialdata
if MyAccount then
    MyAccount:SetDescription(data)
else
	print("Acc hong truy cập được, hoặc là chưa bật ram")
end