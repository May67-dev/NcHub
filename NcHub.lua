-- Nc Hub - Custom UI v1.1 (Bolita Flotante)
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NcHubGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- ==================== BOTÓN FLOTANTE (BOLITA) ====================
local floatButton = Instance.new("TextButton")
floatButton.Size = UDim2.new(0, 60, 0, 60)
floatButton.Position = UDim2.new(1, -80, 1, -100)
floatButton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)  -- Azul neón
floatButton.Text = "NC"
floatButton.TextColor3 = Color3.fromRGB(0, 0, 0)
floatButton.TextScaled = true
floatButton.Font = Enum.Font.GothamBold
floatButton.Parent = screenGui

local floatCorner = Instance.new("UICorner")
floatCorner.CornerRadius = UDim.new(1, 0)  -- Hace que sea completamente circular
floatCorner.Parent = floatButton

-- Sombra suave (opcional pero se ve premium)
local shadow = Instance.new("UIStroke")
shadow.Thickness = 3
shadow.Color = Color3.fromRGB(0, 255, 255)
shadow.Transparency = 0.6
shadow.Parent = floatButton

-- ==================== VENTANA PRINCIPAL ====================
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 440, 0, 320)
mainFrame.Position = UDim2.new(0.5, -220, 0.5, -160)
mainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

-- Barra superior
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 50)
topBar.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
topBar.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.75, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Nc Hub"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = topBar

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -45, 0.5, -20)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = topBar

-- Contenido
local content = Instance.new("Frame")
content.Size = UDim2.new(1, -20, 1, -70)
content.Position = UDim2.new(0, 10, 0, 60)
content.BackgroundTransparency = 1
content.Parent = mainFrame

local welcome = Instance.new("TextLabel")
welcome.Size = UDim2.new(1, 0, 1, 0)
welcome.BackgroundTransparency = 1
welcome.Text = "Nc Hub\n\nGUI 100% Custom\nTema Dark Moderno\n\nListo para añadir features"
welcome.TextColor3 = Color3.fromRGB(200, 200, 200)
welcome.TextScaled = true
welcome.Font = Enum.Font.Gotham
welcome.TextWrapped = true
welcome.Parent = content

-- ==================== ANIMACIONES Y FUNCIONES ====================
local isOpen = false

local function toggleMenu()
    isOpen = not isOpen
    mainFrame.Visible = true

    if isOpen then
        mainFrame.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(mainFrame, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 440, 0, 320)
        }):Play()
    else
        TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
            Size = UDim2.new(0, 0, 0, 0)
        }):Play()
        task.wait(0.25)
        mainFrame.Visible = false
    end
end

floatButton.MouseButton1Click:Connect(toggleMenu)
closeBtn.MouseButton1Click:Connect(toggleMenu)

-- Drag
local dragging = false
local dragStart, startPos

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

topBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

print("✅ Nc Hub v1.1 - Bolita flotante cargada")
