-- Nc Hub - Custom UI v1.0
-- Tema Dark Moderno

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NcHubGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- ==================== BOTÓN FLOTANTE "Show Nc Hub" ====================
local showButton = Instance.new("TextButton")
showButton.Name = "ShowNcHub"
showButton.Size = UDim2.new(0, 160, 0, 50)
showButton.Position = UDim2.new(0.5, -80, 0.9, -60)
showButton.BackgroundColor3 = Color3.fromRGB(0, 255, 255)  -- Azul neón
showButton.Text = "Show Nc Hub"
showButton.TextColor3 = Color3.fromRGB(0, 0, 0)
showButton.TextScaled = true
showButton.Font = Enum.Font.GothamBold
showButton.Parent = screenGui

local showCorner = Instance.new("UICorner")
showCorner.CornerRadius = UDim.new(0, 12)
showCorner.Parent = showButton

-- ==================== VENTANA PRINCIPAL ====================
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 460, 0, 340)
mainFrame.Position = UDim2.new(0.5, -230, 0.5, -170)
mainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 28)
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 16)
mainCorner.Parent = mainFrame

-- Barra superior
local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 55)
topBar.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local topCorner = Instance.new("UICorner")
topCorner.CornerRadius = UDim.new(0, 16)
topCorner.Parent = topBar

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.7, 0, 1, 0)
title.Position = UDim2.new(0.05, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Nc Hub"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.TextXAlignment = Enum.TextXAlignment.Left
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = topBar

-- Botones de la barra superior
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -50, 0.5, -20)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.TextScaled = true
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = topBar

-- ==================== CONTENIDO (Tabs placeholder) ====================
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -20, 1, -75)
contentFrame.Position = UDim2.new(0, 10, 0, 65)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = mainFrame

local welcomeLabel = Instance.new("TextLabel")
welcomeLabel.Size = UDim2.new(1, 0, 1, 0)
welcomeLabel.BackgroundTransparency = 1
welcomeLabel.Text = "Bienvenido a Nc Hub\n\nGUI 100% custom creada desde cero\n\nTema Dark Moderno\n\nAnimaciones con TweenService"
welcomeLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
welcomeLabel.TextScaled = true
welcomeLabel.Font = Enum.Font.Gotham
welcomeLabel.TextWrapped = true
welcomeLabel.Parent = contentFrame

-- ==================== FUNCIONES ====================

-- Mostrar/Ocultar ventana con animación
local isOpen = false

local function toggleGui()
    isOpen = not isOpen
    mainFrame.Visible = true
    
    if isOpen then
        mainFrame.Size = UDim2.new(0, 0, 0, 0)
        TweenService:Create(mainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {
            Size = UDim2.new(0, 460, 0, 340)
        }):Play()
    else
        TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {
            Size = UDim2.new(0, 0, 0, 0)
        }):Play()
        task.wait(0.3)
        mainFrame.Visible = false
    end
end

showButton.MouseButton1Click:Connect(toggleGui)
closeBtn.MouseButton1Click:Connect(function()
    toggleGui()
end)

-- Drag functionality
local dragging = false
local dragStart, startPos

topBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

topBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

print("✅ Nc Hub Custom UI cargada correctamente")
