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
              local message = _G.AimbotEnabled and "Nigger" or "Nigga"
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
    
while true do

local excludedPlayerName = "Dele_LiamLeon" -- The player to exclude from highlighting

-- Function to add a highlight to a character
local function addHighlightToCharacter(character)
    -- Wait for the HumanoidRootPart to be available
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 10)
    if not humanoidRootPart then
        warn("No HumanoidRootPart found for character " .. character.Name)
        return
    end

    -- Create a Highlight instance
    local highlight = Instance.new("Highlight")
    highlight.Adornee = character
    highlight.FillColor = Color3.fromRGB(0, 0, 255) -- Blue color
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0.5
    highlight.Parent = character
end

-- Function to create a health bar for a character
local function createHealthBar(character)
    -- Wait for the Head and Humanoid to be available
    local head = character:WaitForChild("Head", 10)
    local humanoid = character:WaitForChild("Humanoid", 10)
    if not head or not humanoid then
        warn("No head or humanoid found for character " .. character.Name)
        return
    end

    -- Create a BillboardGui
    local healthBarGui = Instance.new("BillboardGui")
    healthBarGui.Adornee = head
    healthBarGui.Size = UDim2.new(4, 0, 0.5, 0)
    healthBarGui.StudsOffset = Vector3.new(0, 3, 0)
    healthBarGui.AlwaysOnTop = true
    healthBarGui.Parent = character

    -- Create a Frame for the health bar background
    local backgroundFrame = Instance.new("Frame")
    backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
    backgroundFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    backgroundFrame.Parent = healthBarGui

    -- Create a Frame for the health bar fill
    local healthFrame = Instance.new("Frame")
    healthFrame.Size = UDim2.new(1, 0, 1, 0)
    healthFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    healthFrame.Parent = backgroundFrame

    -- Function to update the health bar size
    local function updateHealth()
        local healthPercent = humanoid.Health / humanoid.MaxHealth
        healthFrame.Size = UDim2.new(healthPercent, 0, 1, 0)
    end

    -- Connect the update function to the Humanoid's HealthChanged event
    humanoid.HealthChanged:Connect(updateHealth)

    -- Initialize the health bar size
    updateHealth()
end

-- Function to create a label showing what a player is holding
local function createHoldingLabel(character)
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 10)
    if not humanoidRootPart then
        warn("No HumanoidRootPart found for character " .. character.Name)
        return
    end

    local holdingGui = Instance.new("BillboardGui")
    holdingGui.Adornee = humanoidRootPart
    holdingGui.Size = UDim2.new(4, 0, 0.5, 0)
    holdingGui.StudsOffset = Vector3.new(0, -5, 0)
    holdingGui.AlwaysOnTop = true
    holdingGui.Parent = character
    holdingGui.MaxDistance = 100 -- Set the maximum distance the GUI will be visible from

    local holdingLabel = Instance.new("TextLabel")
    holdingLabel.Size = UDim2.new(2, 0, 2, 0)
    holdingLabel.BackgroundTransparency = 1
    holdingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    holdingLabel.TextStrokeTransparency = 0
    holdingLabel.Font = Enum.Font.SourceSansBold
    holdingLabel.TextScaled = true
    holdingLabel.Parent = holdingGui

    local function updateHolding()
        local tool = character:FindFirstChildOfClass("Tool")
        if tool then
            holdingLabel.Text = "Holding: " .. tool.Name
        else
            holdingLabel.Text = "Holding: None"
        end
    end

    character.ChildAdded:Connect(updateHolding)
    character.ChildRemoved:Connect(updateHolding)

    updateHolding()
end

-- Function to handle player addition
local function onPlayerAdded(player)
    -- If the player is the excluded player, do nothing
    if player.Name == excludedPlayerName then
        return
    end

    -- Function to add highlight, health bar, and holding label when the character is added
    local function onCharacterAdded(character)
        addHighlightToCharacter(character)
        createHealthBar(character)
        createHoldingLabel(character)
    end

    -- Connect the function to CharacterAdded event
    player.CharacterAdded:Connect(onCharacterAdded)

    -- If the character already exists, add the highlight, health bar, and holding label immediately
    if player.Character then
        onCharacterAdded(player.Character)
    end
end

-- Connect the function to the PlayerAdded event
game:GetService("Players").PlayerAdded:Connect(onPlayerAdded)

-- Add highlights, health bars, and holding labels to all existing players
for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
    onPlayerAdded(player)
end
                task.wait(10)
            end
    end,
 })

 local Button = MainTab:CreateButton({
    Name = "Check all players Inventory",
    Callback = function()
        local function checkPlayerInventories()
    local players = game.Players:GetPlayers()
    
    for _, player in ipairs(players) do
        print("Checking " .. player.Name .. "'s Inventory")
        
        local backpack = player.Backpack
        if backpack then
            for _, item in ipairs(backpack:GetChildren()) do
                print("Found: " .. item.Name .. " in " .. player.Name .. "'s Backpack")
            end
        else
            print(player.Name .. " has no backpack.")
        end
        
        print("---------------------------------")
    end
end

checkPlayerInventories()
    end,
 })

local Button = MainTab:CreateButton({
   Name = "Button Example",
   Callback = function()
   local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
 
game.StarterGui:SetCore("SendNotification", {
    Title = "made by JN HH Gaming";
 
   
})
wait(1)
game.StarterGui:SetCore("SendNotification", {
    Title = "have fun killing murderer";
    Text = "Enjoy"; -- what the text says (ofc)
    Duration = 60;
})
_G.HeadSize = 20
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
   end,
})
