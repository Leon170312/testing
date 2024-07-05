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


local OtherTab = Window:CreateTab("Other|✔", nil) -- Title, Image
local OtherSection = OtherTab:CreateSection("Other")

local Button = OtherTab:CreateButton({
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

local Button = OtherTab:CreateButton({
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

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local spinning = false

local function onTouched(other)
    local character = other.Parent
    if character and character:FindFirstChild("Humanoid") then
        local hrp = player.Character:WaitForChild("HumanoidRootPart")

        -- Ensure there is a BodyGyro in the HumanoidRootPart
        local bodyGyro = hrp:FindFirstChild("BodyGyro")
        if not bodyGyro then
            bodyGyro = Instance.new("BodyGyro")
            bodyGyro.P = 10000
            bodyGyro.D = 0
            bodyGyro.MaxTorque = Vector3.new(0, math.huge, 0) -- Only allow rotation on Y axis
            bodyGyro.Parent = hrp
        end

        -- Set the angular velocity to maximum when touched
        if spinning then
            bodyGyro.CFrame = hrp.CFrame
            bodyGyro.AngularVelocity = Vector3.new(0, -5000, 0) -- Maximum spin speed (negative for left spin)
        end

        local hrpOther = character:FindFirstChild("HumanoidRootPart")
        if hrpOther then
            local bodyVelocity = Instance.new("BodyVelocity")
            bodyVelocity.Velocity = (hrpOther.Position - hrp.Position).unit * 100 -- Adjust the force as needed
            bodyVelocity.P = 10000
            bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            bodyVelocity.Parent = hrpOther

            -- Remove the BodyVelocity after a short time
            game:GetService("Debris"):AddItem(bodyVelocity, 0.1)
        end
    end
end

local function stopSpinning()
    local hrp = player.Character:WaitForChild("HumanoidRootPart")
    local bodyGyro = hrp:FindFirstChild("BodyGyro")
    if bodyGyro then
        bodyGyro.AngularVelocity = Vector3.new(0, 0, 0) -- Stop spinning
    end
end

local Toggle = OtherTab:CreateToggle({
    Name = "Spinning Fling",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        spinning = Value
        if not spinning then
            stopSpinning()
        end
    end,
})

local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
hrp.Touched:Connect(onTouched)
