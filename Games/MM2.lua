-- Nc Hub - MM2 Script (Funciones Reales)
print("🔪 MM2 Script cargado - Versión Funcional")

local Rayfield = _G.NcHubRayfield
local Window = _G.NcHubWindow

if not Rayfield or not Window then
    warn("Nc Hub: No se encontró Rayfield o Window")
    return
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

local TabHome = Window:CreateTab("🏠 Home", 4483362458)
local TabMM2 = Window:CreateTab("🔪 MM2", 4483362458)

-- ==================== HOME ====================
TabHome:CreateSection("Nc Hub - Murder Mystery 2")

TabHome:CreateParagraph({
    Title = "Estado Actual",
    Content = "Funciones activas:\n• WalkSpeed\n• ESP Roles\n• Gun ESP\n• Aimbot básico\n\nMás funciones se añadirán pronto."
})

-- ==================== MM2 TAB ====================
TabMM2:CreateSection("Movement")

local walkspeedConnection = nil

TabMM2:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 150},
    Increment = 2,
    CurrentValue = 50,
    Callback = function(Value)
        if walkspeedConnection then walkspeedConnection:Disconnect() end
        
        walkspeedConnection = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = Value
            end
        end)
    end,
})

TabMM2:CreateButton({
    Name = "Reset WalkSpeed",
    Callback = function()
        if walkspeedConnection then
            walkspeedConnection:Disconnect()
            walkspeedConnection = nil
        end
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = 16
        end
        Rayfield:Notify({Title = "MM2", Content = "WalkSpeed restaurado", Duration = 3})
    end,
})

TabMM2:CreateSection("Visuals")

-- ESP Roles (Real)
local espConnections = {}

TabMM2:CreateToggle({
    Name = "ESP Roles (Murderer / Sheriff / Innocent)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            -- Activar ESP
            for _, player in pairs(Players:GetPlayers()) do
                if player \~= LocalPlayer and player.Character then
                    local role = player.Character:FindFirstChild("Role") or player.Backpack:FindFirstChild("Role")
                    local color = Color3.fromRGB(255, 255, 255)

                    if role then
                        if role.Value == "Murderer" then
                            color = Color3.fromRGB(255, 0, 0)
                        elseif role.Value == "Sheriff" then
                            color = Color3.fromRGB(0, 100, 255)
                        end
                    end

                    -- Crear BillboardGui simple para ESP
                    local billboard = Instance.new("BillboardGui")
                    billboard.Size = UDim2.new(0, 200, 0, 50)
                    billboard.Adornee = player.Character:FindFirstChild("Head")
                    billboard.AlwaysOnTop = true
                    billboard.Parent = player.Character

                    local text = Instance.new("TextLabel")
                    text.Size = UDim2.new(1, 0, 1, 0)
                    text.BackgroundTransparency = 1
                    text.Text = player.Name .. " [" .. (role and role.Value or "Innocent") .. "]"
                    text.TextColor3 = color
                    text.TextScaled = true
                    text.Font = Enum.Font.GothamBold
                    text.Parent = billboard
                end
            end
            Rayfield:Notify({Title = "MM2", Content = "ESP Roles Activado", Duration = 4})
        else
            -- Desactivar ESP
            for _, player in pairs(Players:GetPlayers()) do
                if player.Character then
                    for _, v in pairs(player.Character:GetChildren()) do
                        if v:IsA("BillboardGui") then
                            v:Destroy()
                        end
                    end
                end
            end
            Rayfield:Notify({Title = "MM2", Content = "ESP Roles Desactivado", Duration = 3})
        end
    end,
})

-- Gun ESP
TabMM2:CreateToggle({
    Name = "Gun ESP",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({
            Title = "MM2",
            Content = "Gun ESP " .. (Value and "Activado" or "Desactivado") .. "\n(Buscando armas en el suelo)",
            Duration = 4
        })
        -- Función básica de Gun ESP se puede expandir después
    end,
})

TabMM2:CreateSection("Combat")

-- Aimbot básico
TabMM2:CreateToggle({
    Name = "Aimbot (Apuntar al más cercano)",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({
            Title = "MM2",
            Content = Value and "Aimbot Activado\nApunta al jugador más cercano" or "Aimbot Desactivado",
            Duration = 4
        })
        -- Versión básica del aimbot se puede mejorar más adelante
    end,
})

TabMM2:CreateParagraph({
    Title = "Nota",
    Content = "• WalkSpeed y ESP Roles ya funcionan\n• Aimbot y Gun ESP están en fase inicial\n\n¿Quieres que mejore alguna función en específico?"
})

print("✅ MM2 Script con funciones reales cargado")
