-- Nc Hub - MM2 Script (Versión Simple)
print("🔪 MM2 Script cargado")

local TabMM2 = Window:CreateTab("🔪 MM2", 4483362458)

TabMM2:CreateSection("MM2 Features")

TabMM2:CreateToggle({
    Name = "ESP Roles (Murderer/Sheriff)",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({Title = "MM2", Content = "ESP " .. (Value and "Activado" or "Desactivado"), Duration = 3})
    end,
})

TabMM2:CreateToggle({
    Name = "Auto Pickup Gun",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({Title = "MM2", Content = "Auto Gun " .. (Value and "ON" or "OFF"), Duration = 3})
    end,
})

TabMM2:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 120},
    Increment = 4,
    CurrentValue = 50,
    Callback = function(Value)
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end,
})

TabMM2:CreateParagraph({
    Title = "Estado",
    Content = "Script básico de MM2 cargado.\nMás features (Kill Aura, Silent Aim, etc.) se añadirán pronto."
})

print("✅ MM2 Script cargado correctamente")
