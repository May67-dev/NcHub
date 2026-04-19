-- Nc Hub - Murder Mystery 2 Script
-- Features básicas para MM2

print("🔪 Nc Hub | MM2 Script cargado")

local Rayfield = getgenv().Rayfield or loadstring(game:HttpGet('https://sirius.menu/rayfield'))() -- Por si acaso

local TabMM2 = Window:CreateTab("🔪 MM2", 4483362458)  -- Si no existe, lo creamos en el loader

TabMM2:CreateSection("🎯 MM2 Features")

-- ESP de Roles (Murderer, Sheriff, Innocent)
TabMM2:CreateToggle({
    Name = "ESP Roles (Murderer / Sheriff)",
    CurrentValue = false,
    Callback = function(Value)
        -- Aquí irá el código de ESP (lo añadiremos en la siguiente versión)
        Rayfield:Notify({Title = "MM2", Content = "ESP Roles " .. (Value and "Activado" or "Desactivado"), Duration = 3})
    end,
})

-- Auto Gun Pickup
TabMM2:CreateToggle({
    Name = "Auto Pickup Gun",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({Title = "MM2", Content = "Auto Pickup " .. (Value and "ON" or "OFF"), Duration = 3})
    end,
})

-- Kill Aura (para Murderer)
TabMM2:CreateToggle({
    Name = "Kill Aura (Murderer)",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({Title = "MM2", Content = "Kill Aura " .. (Value and "Activado ⚠️" or "Desactivado"), Duration = 4})
    end,
})

-- Speed Hack
TabMM2:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 100},
    Increment = 2,
    CurrentValue = 50,
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

TabMM2:CreateButton({
    Name = "Auto Farm Coins (Básico)",
    Callback = function()
        Rayfield:Notify({Title = "MM2", Content = "Auto Farm activado (en desarrollo)", Duration = 4})
    end,
})

TabMM2:CreateParagraph({
    Title = "Nota importante",
    Content = "Este es el inicio del script de MM2.\n\nFeatures como ESP, Silent Aim y Auto Win se añadirán pronto."
})

print("✅ MM2 Script cargado correctamente")
