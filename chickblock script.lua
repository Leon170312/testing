local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "🔫|ChicBlocko|🔫",
    LoadingTitle = "This script on top fr",
    LoadingSubtitle = "by Leon",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "pm9QCqsy", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "ChicBlocko script",
       Subtitle = "Key System",
       Note = "Join the discord",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"https://pastebin.com/raw/vs74M0W8"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 --Main
 local MainTab = Window:CreateTab("Main|🏡", nil) -- Title, Image
 local MainSection = MainTab:CreateSection("Main")

 local Button = MainTab:CreateButton({
    Name = "Infinite jump",
    Callback = function()
    -- Press [T] to turn off and to turn on
 
_G.infinjump = true
 
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
if _G.infinjump then
if k:byte() == 32 then
Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Humanoid:ChangeState("Jumping")
wait(0.1)
Humanoid:ChangeState("Seated")
end
end
end)
 
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
k = k:lower()
if k == "t" then
if _G.infinjump == true then
_G.infinjump = false
else
_G.infinjump = true
end
end
end)
    end,
 })

 local Button = MainTab:CreateButton({
    Name = "5 more speed",
    Callback = function()
    -- Script to increase player's speed by 5
 
 local Players = game:GetService("Players")
 local player = Players.LocalPlayer
 local character = player.Character or player.CharacterAdded:Wait()
 local humanoid = character:WaitForChild("Humanoid")
 
 local function increaseSpeed()
     local currentSpeed = humanoid.WalkSpeed
     humanoid.WalkSpeed = currentSpeed + 5
     print("Increased speed by 5. New speed:", humanoid.WalkSpeed)
 end
 
 increaseSpeed()
    end,
 })

 local Button = MainTab:CreateButton({
    Name = "10 less speed",
    Callback = function()
    -- Script to decrease player's speed by 10
 
 local Players = game:GetService("Players")
 local player = Players.LocalPlayer
 
 -- Function to decrease speed
 local function decreaseSpeed()
     local character = player.Character or player.CharacterAdded:Wait()
     local humanoid = character:WaitForChild("Humanoid")
     local currentSpeed = humanoid.WalkSpeed
 
     -- Ensure the speed does not go below a reasonable limit
     local newSpeed = math.max(16, currentSpeed - 10)
     humanoid.WalkSpeed = newSpeed
     print("Decreased speed by 10. New speed:", humanoid.WalkSpeed)
 end
 
 -- Connect the function to the character's humanoid if already loaded
 if player.Character and player.Character:FindFirstChild("Humanoid") then
     decreaseSpeed()
 end
 
 -- Listen for when the character spawns
 player.CharacterAdded:Connect(function(character)
     character:WaitForChild("Humanoid") -- Ensure humanoid is loaded
     decreaseSpeed()
 end)
 
    end,
 })