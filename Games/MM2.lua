-- Nc Hub - MM2 Script (Versión Corregida)
print("🔪 MM2 Script cargado")

local Window = _G.NcHubWindow   -- Usamos la ventana guardada desde el loader

if not Window then
    warn("No se encontró la ventana de Nc Hub")
    return
end

local TabMM2 = Window:CreateTab("🔪 MM2", 4483362458)

TabMM2:CreateSection("MM2 Features")

TabMM2:CreateToggle({
    Name = "ESP Roles (Murderer / Sheriff / Innocent)",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({Title = "MM2", Content = "ESP Roles " .. (Value and "Activado" or "Desactivado"), Duration = 3})
    end,
})

TabMM2:CreateToggle({
    Name = "Auto Pickup Gun",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({Title = "MM2", Content = "Auto Pickup Gun " .. (Value and "Activado" or "Desactivado"), Duration = 3})
    end,
})

TabMM2:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 120},
    Increment = 4,
    CurrentValue = 50,
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end,
})

TabMM2:CreateButton({
    Name = "Reset WalkSpeed",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = 16
        end
        Rayfield:Notify({Title = "MM2", Content = "WalkSpeed restaurado", Duration = 3})
    end,
})

TabMM2:CreateParagraph({
    Title = "Estado actual",
    Content = "Script básico de MM2 cargado.\n\nPróximamente: Kill Aura, Silent Aim, Gun ESP, etc."
})

print("✅ MM2 Script cargado correctamente")
