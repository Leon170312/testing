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
   Name = "Aimbot",
   Callback = function()
      local Camera = workspace.CurrentCamera
      local Players = game:GetService("Players")
      local RunService = game:GetService("RunService")
      local UserInputService = game:GetService("UserInputService")
      local TweenService = game:GetService("TweenService")
      local StarterGui = game:GetService("StarterGui")
      local LocalPlayer = Players.LocalPlayer
      local Holding = false
      local CurrentTarget = nil
      
      _G.AimbotEnabled = true
      _G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
      _G.AimPart = "Head" -- Where the aimbot script would lock at.
      _G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
      
      local function GetClosestPlayer()
          local MaximumDistance = math.huge
          local Target = nil
        
          coroutine.wrap(function()
              wait(20); MaximumDistance = math.huge -- Reset the MaximumDistance so that the Aimbot doesn't remember it as a very small variable and stop capturing players...
          end)()
      
          for _, v in next, Players:GetPlayers() do
              if v.Name ~= LocalPlayer.Name then
                  if _G.TeamCheck == true then
                      if v.Team ~= LocalPlayer.Team then
                          if v.Character ~= nil then
                              if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                                  if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                      local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                      local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                                      
                                      if VectorDistance < MaximumDistance then
                                          Target = v
                                          MaximumDistance = VectorDistance
                                      end
                                  end
                              end
                          end
                      end
                  else
                      if v.Character ~= nil then
                          if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                              if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                                  local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                                  local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                                  
                                  if VectorDistance < MaximumDistance then
                                      Target = v
                                      MaximumDistance = VectorDistance
                                  end
                              end
                          end
                      end
                  end
              end
          end
      
          return Target
      end
      
      UserInputService.InputBegan:Connect(function(Input)
          if Input.UserInputType == Enum.UserInputType.MouseButton2 then
              Holding = true
              if _G.AimbotEnabled and not CurrentTarget then
                  CurrentTarget = GetClosestPlayer()
              end
          elseif Input.KeyCode == Enum.KeyCode.X then
              _G.AimbotEnabled = not _G.AimbotEnabled
              local message = _G.AimbotEnabled and "Aimbot On" or "Aimbot Off"
              StarterGui:SetCore("SendNotification", {
                  Title = "Notification";
                  Text = message;
                  Duration = 2;
                  Position = "BottomRight";
              })
          end
      end)
      
      UserInputService.InputEnded:Connect(function(Input)
          if Input.UserInputType == Enum.UserInputType.MouseButton2 then
              Holding = false
              CurrentTarget = nil
          end
      end)
      
      RunService.RenderStepped:Connect(function()
          if Holding == true and _G.AimbotEnabled == true then
              if CurrentTarget and CurrentTarget.Character and CurrentTarget.Character:FindFirstChild(_G.AimPart) then
                  TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, CurrentTarget.Character[_G.AimPart].Position)}):Play()
              else
                  CurrentTarget = nil
              end
          end
      end)
   end,
})

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
 
 local Button = MainTab:CreateButton({
    Name = "ESP",
    Callback = function()
        local Players = game:GetService("Players")

        local function highlightCharacter(character)
            -- Create a Highlight instance
            local highlight = Instance.new("Highlight")
            highlight.Adornee = character
            highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red color
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0.5
            highlight.Parent = character
        end
        
        local function onPlayerAdded(player)
            if player.Name ~= "Dele_LiamLeon" then
                -- Function to add highlight when the character is added
                local function onCharacterAdded(character)
                    highlightCharacter(character)
                end
        
                -- Connect the function to CharacterAdded event
                player.CharacterAdded:Connect(onCharacterAdded)
                
                -- If the character already exists, add the highlight immediately
                if player.Character then
                    highlightCharacter(player.Character)
                end
            end
        end
        
        -- Connect the function to the PlayerAdded event
        Players.PlayerAdded:Connect(onPlayerAdded)
        
        -- Add highlights to all existing players
        for _, player in ipairs(Players:GetPlayers()) do
            onPlayerAdded(player)
        end        
    end,
 })
