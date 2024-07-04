-- Script in ServerScriptService

local excludedPlayerName = "SUS_voidblade" -- Replace with your actual Roblox username

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
    highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red color
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

-- Function to create a name tag for a character
local function createNameTag(character)
    -- Wait for the Head to be available
    local head = character:WaitForChild("Head", 10)
    if not head then
        warn("No head found for character " .. character.Name)
        return
    end

    -- Create a BillboardGui for the name tag
    local nameTagGui = Instance.new("BillboardGui")
    nameTagGui.Adornee = head
    nameTagGui.Size = UDim2.new(4, 0, 0.5, 0)
    nameTagGui.StudsOffset = Vector3.new(0, 4, 0)
    nameTagGui.AlwaysOnTop = true
    nameTagGui.Parent = character

    -- Create a TextLabel for the name tag
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = character.Name
    nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    nameLabel.TextStrokeTransparency = 0
    nameLabel.Font = Enum.Font.SourceSansBold
    nameLabel.TextScaled = true
    nameLabel.Parent = nameTagGui
end

-- Function to handle player addition
local function onPlayerAdded(player)
    -- If the player is the excluded player, do nothing
    if player.Name == excludedPlayerName then
        return
    end

    -- Function to add highlight, health bar, and name tag when the character is added
    local function onCharacterAdded(character)
        addHighlightToCharacter(character)
        createHealthBar(character)
        createNameTag(character)
    end

    -- Connect the function to CharacterAdded event
    player.CharacterAdded:Connect(onCharacterAdded)

    -- If the character already exists, add the highlight, health bar, and name tag immediately
    if player.Character then
        onCharacterAdded(player.Character)
    end
end

-- Connect the function to the PlayerAdded event
game:GetService("Players").PlayerAdded:Connect(onPlayerAdded)

-- Add highlights, health bars, and name tags to all existing players
for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
    onPlayerAdded(player)
end
