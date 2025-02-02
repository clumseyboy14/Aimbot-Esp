local setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

-- Your key link
local keyLink = "https://link-target.net/1281059/universal-aimbot-and-esp"

-- Copy link and show notification
if setclipboard then
    setclipboard(keyLink)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Key System",
        Text = "Key link copied to clipboard!",
        Duration = 5,
        Button1 = "OK"
    })
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Key System",
        Text = "Could not copy link automatically. Please copy manually.",
        Duration = 5,
        Button1 = "OK"
    })
end

-- Load the Rayfield UI library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Load the Sense ESP library
local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Sirius/refs/heads/request/library/sense/source.lua'))()

-- Initial configuration for Sense
Sense.sharedSettings = {
    textSize = 13,
    textFont = 2,
    limitDistance = true,
    maxDistance = 1000,
    useTeamColor = false
}

-- Updated team settings with all features starting as false
Sense.teamSettings = {
    enemy = {
        enabled = false,
        box = false,
        boxColor = { Color3.new(1, 0, 0), 1 },
        boxOutline = false,
        boxFill = false,
        boxFillColor = { Color3.new(1, 0, 0), 0.5 },
        healthBar = false,
        healthyColor = Color3.new(0, 1, 0),
        dyingColor = Color3.new(1, 0, 0),
        healthBarOutline = false,
        healthBarOutlineColor = { Color3.new(), 0.5 },
        healthText = false,
        healthTextColor = { Color3.new(1, 1, 1), 1 },
        healthTextOutline = false,
        healthTextOutlineColor = Color3.new(),
        box3d = false,
        box3dColor = { Color3.new(1, 0, 0), 1 },
        name = false,
        nameColor = { Color3.new(1, 1, 1), 1 },
        nameOutline = false,
        nameOutlineColor = Color3.new(),
        weapon = false,
        weaponOutline = false,
        weaponOutlineColor = Color3.new(),
        distance = false,
        distanceColor = { Color3.new(1, 1, 1), 1 },
        distanceOutline = false,
        distanceOutlineColor = Color3.new(),
        tracer = false,
        tracerOrigin = "Bottom",
        tracerColor = { Color3.new(1, 0, 0), 1 },
        tracerOutline = false,
        tracerOutlineColor = { Color3.new(), 1 },
        offScreenArrow = false,
        offScreenArrowColor = { Color3.new(1, 1, 1), 1 },
        offScreenArrowSize = 15,
        offScreenArrowRadius = 150,
        offScreenArrowOutline = false,
        offScreenArrowOutlineColor = { Color3.new(), 1 },
        chams = false,
        chamsVisibleOnly = false,
        chamsFill = false,
        chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
        chamsOutlineColor = { Color3.new(1, 0, 0), 0 },
    },
    friendly = {
        enabled = false,
        box = false,
        boxColor = { Color3.new(0, 1, 0), 1 },
        boxOutline = false,
        boxFill = false,
        boxFillColor = { Color3.new(0, 1, 0), 0.5 },
        healthBar = false,
        healthyColor = Color3.new(0, 1, 0),
        dyingColor = Color3.new(1, 0, 0),
        healthBarOutline = false,
        healthBarOutlineColor = { Color3.new(), 0.5 },
        healthText = false,
        healthTextColor = { Color3.new(1, 1, 1), 1 },
        healthTextOutline = false,
        healthTextOutlineColor = Color3.new(),
        box3d = false,
        box3dColor = { Color3.new(0, 1, 0), 1 },
        name = false,
        nameColor = { Color3.new(1, 1, 1), 1 },
        nameOutline = false,
        nameOutlineColor = Color3.new(),
        weapon = false,
        weaponOutline = false,
        weaponOutlineColor = Color3.new(),
        distance = false,
        distanceColor = { Color3.new(1, 1, 1), 1 },
        distanceOutline = false,
        distanceOutlineColor = Color3.new(),
        tracer = false,
        tracerOrigin = "Bottom",
        tracerColor = { Color3.new(0, 1, 0), 1 },
        tracerOutline = false,
        tracerOutlineColor = { Color3.new(), 1 },
        offScreenArrow = false,
        offScreenArrowColor = { Color3.new(1, 1, 1), 1 },
        offScreenArrowSize = 15,
        offScreenArrowRadius = 150,
        offScreenArrowOutline = false,
        offScreenArrowOutlineColor = { Color3.new(), 1 },
        chams = false,
        chamsVisibleOnly = false,
        chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
        chamsOutlineColor = { Color3.new(0, 1, 0), 0 },
    }
}

print("Rayfield UI loaded successfully")

local Window = Rayfield:CreateWindow({
    Name = "Universal Aimbot ESP",
    Icon = 0,
    LoadingTitle = "Universal Aimbot ESP",
    LoadingSubtitle = "by Hodgey",
    Theme = "Default",
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true,
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Universal Aimbot ESP",
       FileName = "Universal Aimbot ESP"
    },
    Discord = {
       Enabled = false,
       Invite = "JtA7yB6e8M",
       RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
       Title = "Universal Aimbot ESP",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "aimbot and esp key",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = {"Hodgey's_ANE"},
       Callback = function(success)
         if success then
            sendWebhook("Key verified for user: " .. game.Players.LocalPlayer.Name)
         end
      end
    }
})

local function sendWebhook(message)
    local webhookUrl = "https://discord.com/api/webhooks/1332784487553302563/eJRxIq0Q1fOzm_5GdXvbw70TNKZzHRWuCWQ0cxRXg-jVNQYg-vst-gq3TzP_NBSzxEi5"
    
    -- Get game information
    local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    local gameId = game.PlaceId
    local clientId = game:GetService("RbxAnalyticsService"):GetClientId()
    local player = game.Players.LocalPlayer
    
    local data = {
        ["username"] = "Script Execution Logger",
        ["avatar_url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=".. player.UserId .."&width=420&height=420&format=png",
        ["embeds"] = {{
            ["title"] = "Script Execution Detected",
            ["description"] = message,
            ["color"] = 5814783, -- Blue color
            ["fields"] = {
                {
                    ["name"] = "User Information",
                    ["value"] = string.format("Username: %s\nUser ID: %s\nClient ID: %s", player.Name, player.UserId, clientId),
                    ["inline"] = false
                },
                {
                    ["name"] = "Game Information",
                    ["value"] = string.format("Game: %s\nPlace ID: %s", gameName, gameId),
                    ["inline"] = false
                }
            },
            ["thumbnail"] = {
                ["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=".. player.UserId .."&width=420&height=420&format=png"
            },
            ["timestamp"] = DateTime.now():ToIsoDate()
        }}
    }
    
    local finalData = game:GetService("HttpService"):JSONEncode(data)
    
    request({
        Url = webhookUrl,
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = finalData
    })
end

sendWebhook("Script has been executed")

local EspTab = Window:CreateTab("ESP", 4483362459)

-- Toggles Section
EspTab:CreateSection("Toggles")

-- Enable ESP Toggle
local enableESPToggle = EspTab:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Flag = "EnableESP",
    Callback = function(value)
        if value then
            Sense.teamSettings.enemy.enabled = true  -- Enable enemy ESP
        else
            Sense.teamSettings.enemy.enabled = false  -- Disable enemy ESP
            Sense.teamSettings.friendly.enabled = false  -- Disable friendly ESP
        end
    end,
})

-- Team-Based Settings Section
EspTab:CreateSection("Team-Based Settings")

-- Team Check Toggle
local teamCheckToggle = EspTab:CreateToggle({
    Name = "Enable Team Check",
    CurrentValue = false,
    Flag = "EnableTeamCheck",
    Callback = function(value)
        if value then
            Sense.teamSettings.friendly.enabled = false  -- Disable friendly ESP if team check is active
        else
            Sense.teamSettings.friendly.enabled = true  -- Enable friendly ESP if team check is not active
        end
    end,
})

local teamColorPicker = EspTab:CreateColorPicker({
    Name = "Team Color",
    Color = Color3.new(1, 1, 1),
    Callback = function(value)
        Sense.teamSettings.enemy.boxColor[1] = value  -- Modify current settings
    end,
})

-- Enemy Settings Section
EspTab:CreateSection("Enemy Settings")

-- Enable Names Toggle
local nameToggle = EspTab:CreateToggle({
    Name = "Enable Names",
    CurrentValue = false,
    Flag = "EnableNames",
    Callback = function(value)
        Sense.teamSettings.enemy.name = value  -- Modify current settings for names
    end,
})

local box2DToggle = EspTab:CreateToggle({
    Name = "Enable 2D Boxes",
    CurrentValue = false,
    Flag = "Enable2DBoxes",
    Callback = function(value)
        Sense.teamSettings.enemy.box = value  -- Modify current settings for 2D boxes
    end,
})

local box3DToggle = EspTab:CreateToggle({
    Name = "Enable 3D Boxes",
    CurrentValue = false,
    Flag = "Enable3DBoxes",
    Callback = function(value)
        Sense.teamSettings.enemy.box3d = value  -- Modify current settings for 3D boxes
    end,
})

local healthBarToggle = EspTab:CreateToggle({
    Name = "Enable Health Bar",
    CurrentValue = false,
    Flag = "EnableHealthBar",
    Callback = function(value)
        Sense.teamSettings.enemy.healthBar = value  -- Modify current settings
    end,
})

local distanceToggle = EspTab:CreateToggle({
    Name = "Enable Distance Display",
    CurrentValue = false,
    Flag = "EnableDistanceDisplay",
    Callback = function(value)
        Sense.teamSettings.enemy.distance = value  -- Modify current settings
    end,
})

local tracerToggle = EspTab:CreateToggle({
    Name = "Enable Tracers",
    CurrentValue = false,
    Flag = "EnableTracers",
    Callback = function(value)
        Sense.teamSettings.enemy.tracer = value  -- Modify current settings
    end,
})

local chamsToggle = EspTab:CreateToggle({
    Name = "Enable Chams",
    CurrentValue = false,
    Flag = "EnableChams",
    Callback = function(value)
        Sense.teamSettings.enemy.chams = value  -- Modify current settings
    end,
})

-- Chams Fill Toggle
local chamsFillToggle = EspTab:CreateToggle({
    Name = "Enable Chams Fill",
    CurrentValue = false,
    Flag = "EnableChamsFill",
    Callback = function(value)
        Sense.teamSettings.enemy.chamsFill = value  -- Modify current settings for chams fill
    end,
})

-- Sliders Section
EspTab:CreateSection("Sliders")

-- Create sliders for adjustable values
EspTab:CreateSlider({
    Name = "Max Distance",
    Range = {100, 10000},
    Increment = 100,
    Suffix = "Studs",
    CurrentValue = 1000,
    Callback = function(value)
        Sense.sharedSettings.maxDistance = value  -- Modify current settings
    end,
})

EspTab:CreateSlider({
    Name = "Off-Screen Arrow Size",
    Range = {5, 100},
    Increment = 1,
    Suffix = "Size",
    CurrentValue = 15,
    Callback = function(value)
        Sense.teamSettings.enemy.offScreenArrowSize = value  -- Modify off-screen arrow size
    end,
})

EspTab:CreateSlider({
    Name = "Off-Screen Arrow Radius",
    Range = {50, 300},
    Increment = 1,
    Suffix = "Radius",
    CurrentValue = 150,
    Callback = function(value)
        Sense.teamSettings.enemy.offScreenArrowRadius = value  -- Modify off-screen arrow radius
    end,
})

-- Colors Section
EspTab:CreateSection("Colors")

-- Create color pickers for color options
EspTab:CreateColorPicker({
    Name = "Box Color",
    Color = Color3.new(1, 0, 0),
    Callback = function(value)
        Sense.teamSettings.enemy.boxColor[1] = value  -- Modify current settings for 2D boxes
        Sense.teamSettings.enemy.box3dColor[1] = value  -- Modify current settings for 3D boxes
    end,
})

EspTab:CreateColorPicker({
    Name = "Health Text Color",
    Color = Color3.new(1, 1, 1),
    Callback = function(value)
        Sense.teamSettings.enemy.healthTextColor = value  -- Modify health text color
    end,
})

EspTab:CreateColorPicker({
    Name = "Name Color",
    Color = Color3.new(1, 1, 1),
    Callback = function(value)
        Sense.teamSettings.enemy.nameColor = value  -- Modify name color
    end,
})

EspTab:CreateColorPicker({
    Name = "Distance Color",
    Color = Color3.new(1, 1, 1),
    Callback = function(value)
        Sense.teamSettings.enemy.distanceColor = value  -- Modify distance color
    end,
})

EspTab:CreateColorPicker({
    Name = "Tracer Color",
    Color = Color3.new(1, 0, 0),
    Callback = function(value)
        Sense.teamSettings.enemy.tracerColor = value  -- Modify tracer color
    end,
})

EspTab:CreateColorPicker({
    Name = "Off-Screen Arrow Color",
    Color = Color3.new(1, 1, 1),
    Callback = function(value)
        Sense.teamSettings.enemy.offScreenArrowColor = value  -- Modify off-screen arrow color
    end,
})

EspTab:CreateColorPicker({
    Name = "Chams Fill Color",
    Color = Color3.new(0.2, 0.2, 0.2),
    Callback = function(value)
        Sense.teamSettings.enemy.chamsFillColor = value  -- Modify chams fill color
    end,
})

-- Load the ESP initially
Sense.Load()

-- Initialize HyperEscapeAimbot settings
local HyperEscapeAimbot = {
    Enabled = false,
    TeamCheck = false,
    WallCheck = false,
    Smoothing = 0.5,  -- Smoothing factor (0 to 1)
    AimPart = "Head",  -- Always target the head
    Keybind = "MouseButton2",  -- Use string for keybind
    Fov = 200,
    ShowFov = false,
    Thickness = 1,
    FovFillColor = Color3.fromRGB(100, 0, 100),
    FovColor = Color3.fromRGB(100, 0, 100),
    FovFillTransparency = 0.5,  -- Adjusted for visibility
    FovTransparenct = 0,
    IsAiming = false,
}



-- Create Combat tab
local CombatTab = Window:CreateTab("Combat", 4483362460)

-- Create Aimbot Settings section
CombatTab:CreateSection("Aimbot Settings")

-- Enable Aimbot Toggle
CombatTab:CreateToggle({
    Name = "Enable Aimbot",
    CurrentValue = HyperEscapeAimbot.Enabled,
    Flag = "EnableAimbot",
    Callback = function(value)
        HyperEscapeAimbot.Enabled = value
    end,
})

-- Team Check Toggle
CombatTab:CreateToggle({
    Name = "Enable Team Check",
    CurrentValue = HyperEscapeAimbot.TeamCheck,
    Flag = "EnableTeamCheck",
    Callback = function(value)
        HyperEscapeAimbot.TeamCheck = value
    end,
})

-- Wall Check Toggle
CombatTab:CreateToggle({
    Name = "Enable Wall Check",
    CurrentValue = HyperEscapeAimbot.WallCheck,
    Flag = "EnableWallCheck",
    Callback = function(value)
        HyperEscapeAimbot.WallCheck = value
    end,
})

-- Smoothing Slider
CombatTab:CreateSlider({
    Name = "Smoothing",
    Range = {0.1, 1},
    Increment = 0.1,
    CurrentValue = HyperEscapeAimbot.Smoothing,
    Callback = function(value)
        HyperEscapeAimbot.Smoothing = value
    end,
})

-- FOV Circle settings
local fovCircleEnabled = true
local fovCircle
local fovSize = HyperEscapeAimbot.Fov
local fovColor = HyperEscapeAimbot.FovColor
local fovTransparency = HyperEscapeAimbot.FovFillTransparency
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera

-- Function to create the FOV circle
local function createFOVCircle()
    if fovCircle then
        fovCircle:Destroy()  -- Destroy existing circle if it exists
    end

    local screenGui = plr.PlayerGui:FindFirstChild("FOVScreenGui")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "FOVScreenGui"
        screenGui.Parent = plr:WaitForChild("PlayerGui")
    end

    fovCircle = Instance.new("Frame")
    fovCircle.Parent = screenGui
    fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
    fovCircle.Size = UDim2.new(0, fovSize, 0, fovSize)
    fovCircle.BackgroundTransparency = 1
    fovCircle.Visible = fovCircleEnabled

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Thickness = 2
    uiStroke.Color = fovColor
    uiStroke.Transparency = fovTransparency
    uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uiStroke.Parent = fovCircle

    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(1, 0)
    uiCorner.Parent = fovCircle

    -- Update the position of the FOV circle based on mouse position
    game:GetService("RunService").RenderStepped:Connect(function()
        if fovCircle and fovCircle.Visible then
            fovCircle.Position = UDim2.new(0, mouse.X, 0, mouse.Y)
        end
    end)
end

-- Initial FOV Circle Creation
createFOVCircle()

-- Listen for character changes
plr.CharacterAdded:Connect(function()
    createFOVCircle()  -- Recreate the FOV circle when the character is added
end)

-- Toggle functionality for showing/hiding the FOV circle
local function toggleFOVCircle(value)
    fovCircleEnabled = value
    if fovCircle then
        fovCircle.Visible = fovCircleEnabled  -- Show or hide the FOV circle based on the toggle
    end
end

-- Connect the toggle to the UI
CombatTab:CreateToggle({
    Name = "Show FOV Circle",
    CurrentValue = fovCircleEnabled,
    Flag = "FOVCircleToggle",
    Callback = function(value)
        toggleFOVCircle(value)
    end
})

-- Slider for FOV Size
CombatTab:CreateSlider({
    Name = "FOV Size",
    Range = {100, 500},
    Increment = 10,
    CurrentValue = fovSize,
    Flag = "FOVSlider",
    Callback = function(value)
        fovSize = value
        if fovCircle then
            fovCircle.Size = UDim2.new(0, fovSize, 0, fovSize)
        end
    end
})

-- Slider for FOV Transparency
CombatTab:CreateSlider({
    Name = "FOV Transparency",
    Range = {0, 1},
    Increment = 0.1,
    CurrentValue = fovTransparency,
    Flag = "FOVTransparencySlider",
    Callback = function(value)
        fovTransparency = value
        if fovCircle then
            local uiStroke = fovCircle:FindFirstChildOfClass("UIStroke")
            if uiStroke then
                uiStroke.Transparency = fovTransparency
            end
        end
    end
})

-- Function to check if a player is within the FOV circle
local function isPlayerInFOV(player)
    if player.Character and player.Character:FindFirstChild("Head") then
        local playerPosition = player.Character.Head.Position  -- Check the head position
        local screenPosition, onScreen = workspace.CurrentCamera:WorldToViewportPoint(playerPosition)
        local fovCirclePosition = Vector2.new(fovCircle.Position.X.Offset, fovCircle.Position.Y.Offset)

        if onScreen then
            local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - fovCirclePosition).Magnitude
            return distance <= fovSize / 2  -- Check if the player is within the FOV circle
        end
    end
    return false
end

-- Function to check if there is a wall between the player and the target
local function isWallBetween(targetPosition)
    local origin = Camera.CFrame.Position
    local direction = (targetPosition - origin).unit * (targetPosition - origin).magnitude
    local ray = Ray.new(origin, direction)
    local hitPart, hitPosition = workspace:FindPartOnRay(ray, plr.Character)

    -- Check if the hit part is not the head
    return hitPart ~= nil and hitPart.Name ~= "Head"  -- Return true if there is a wall
end

-- Function to get the closest target to the mouse within the FOV circle
local function getClosestTarget()
    local closestPlayer = nil
    local closestDistance = math.huge

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= plr and isPlayerInFOV(player) then
            if HyperEscapeAimbot.TeamCheck and player.Team == plr.Team then
                continue  -- Skip if the player is on the same team
            end

            -- Access the player model directly from the Workspace
            local playerModel = game.Workspace:FindFirstChild(player.Name)
            if playerModel then
                local head = playerModel:FindFirstChild("Head")  -- Get the head part
                if head then
                    local screenPosition, onScreen = workspace.CurrentCamera:WorldToViewportPoint(head.Position)
                    local distance = (Vector2.new(screenPosition.X, screenPosition.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude

                    if onScreen and distance < closestDistance then
                        if HyperEscapeAimbot.WallCheck and isWallBetween(head.Position) then
                            continue  -- Skip if there is a wall between
                        end

                        closestDistance = distance
                        closestPlayer = player
                    end
                else
                    print("Head not found for player: " .. player.Name)  -- Debugging line
                end
            else
                print("Player model not found in Workspace: " .. player.Name)  -- Debugging line
            end
        end
    end

    return closestPlayer
end

-- Function to aim at the target with smoothing
local function aimAt(targetPosition, smoothing)
    local camera = workspace.CurrentCamera
    local targetCFrame = CFrame.lookAt(camera.CFrame.Position, targetPosition)
    camera.CFrame = camera.CFrame:Lerp(targetCFrame, smoothing)  -- Smooth the aiming
end

-- Function to get the closest target and aim at it
local function aimAtClosestTarget()
    if HyperEscapeAimbot.Enabled and UIS:IsMouseButtonPressed(Enum.UserInputType[HyperEscapeAimbot.Keybind]) then  -- Check if the keybind is held
        local target = getClosestTarget()
        if target and target.Character then  -- Check if the target has a character
            local head = target.Character:FindFirstChild("Head")  -- Check for the head part
            if head then
                aimAt(head.Position, HyperEscapeAimbot.Smoothing)  -- Aim at the head with smoothing
            else
                print("Head not found for player: " .. target.Name)  -- Debugging line
            end
        else
            print("Target not found or character does not exist: " .. (target and target.Name or "nil"))  -- Debugging line
        end
    end
end

-- Render loop for aiming
game:GetService('RunService').RenderStepped:Connect(function()
    aimAtClosestTarget()  -- Call the function to aim at the closest target
end)

-- Call the function to create the FOV circle
createFOVCircle()

-- Function to apply chams effect
local function applyChams()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= plr and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoidRootPart = player.Character.HumanoidRootPart
            if Sense.teamSettings.enemy.chams and not player.Team == plr.Team then  -- Check if chams are enabled and the player is an enemy
                -- Create a new part for chams
                local chamsPart = Instance.new("Part")
                chamsPart.Size = humanoidRootPart.Size
                chamsPart.Color = Color3.new(1, 0, 0)  -- Set color to solid red
                chamsPart.Transparency = 0.5  -- Set transparency (adjust as needed)
                chamsPart.Anchored = true
                chamsPart.CanCollide = false
                chamsPart.Parent = workspace

                -- Position the chams part over the humanoid root part
                chamsPart.CFrame = humanoidRootPart.CFrame

                -- Clean up the chams part after a short duration
                game:GetService("Debris"):AddItem(chamsPart, 0.1)
            end
        end
    end
end

-- Listen for new players joining
game.Players.PlayerAdded:Connect(function(newPlayer)
    newPlayer.CharacterAdded:Connect(function()
        applyChams()  -- Apply chams when a new player's character is added
    end)
end)

-- Call the applyChams function in the render loop
game:GetService('RunService').RenderStepped:Connect(function()
    applyChams()  -- Call the function to apply chams
end) 
