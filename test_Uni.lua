local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Universal | Leon",
    LoadingTitle = "Universal hub",
    LoadingSubtitle = "by Leon",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = true,
       Invite = "https://discord.gg/GumK644J", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = true, -- Set this to true to use our key system
    KeySettings = {
       Title = "Key system",
       Subtitle = "Key System",
       Note = "Check Discord",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"https://pastebin.com/raw/f6rwKNfZ"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local MainTab = Window:CreateTab("Main|🏡", nil) -- Title, Image
 local MainSection = MainTab:CreateSection("Main")

 Rayfield:Notify({
    Title = "Test GUI",
    Content = "This is just a test GUI!",
    Duration = 5,
    Image = nil,
    Actions = { -- Notification Buttons
       Ignore = {
          Name = "Okay!",
          Callback = function()
          print("The user tapped Okay!")
       end
    },
 },
 })

 local Button = MainTab:CreateButton({
    Name = "Inf jump",
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

 local Slider = MainTab:CreateSlider({
    Name = "Slider Example",
    Range = {16, 500},
    Increment = 1,
    Suffix = "Walk speed",
    CurrentValue = 0,
    Flag = "SliderWS", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
    end,
 })

 local Slider = MainTab:CreateSlider({
   Name = "Jump power",
   Range = {50, 250},
   Increment = 1,
   Suffix = "Jump power",
   CurrentValue = 0,
   Flag = "SliderJP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
   end,
})
local Slider = MainTab:CreateSlider({
   Name = "Gravity",
   Range = {196.2, -5000},
   Increment = 1,
   Suffix = "Slider Gravity",
   CurrentValue = 196.2,
   Flag = "SG", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
       -- The function that takes place when the slider changes
       -- The variable (Value) is a number which correlates to the value the slider is currently at

       -- Set the gravity to the slider's current value
       workspace.Gravity = Value
       
       -- Print the new gravity to confirm the change (optional)
       print("New gravity set to:", workspace.Gravity)
   end,
})

-- Ensure the gravity is set to the initial value at the start
workspace.Gravity = Slider.CurrentValue
