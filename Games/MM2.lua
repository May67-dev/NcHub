-- Nc Hub - MM2 Script (Versión Corregida y Estable)
print("🔪 MM2 Script cargado")

local Rayfield = _G.NcHubRayfield
local Window = _G.NcHubWindow

if not Rayfield or not Window then
    warn("Nc Hub: No se encontró Rayfield o Window")
    return
end

local TabMM2 = Window:CreateTab("🔪 MM2", 4483362458)

TabMM2:CreateSection("MM2 Features")

-- ESP Roles
TabMM2:CreateToggle({
    Name = "ESP Roles (Murderer / Sheriff / Innocent)",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({
            Title = "MM2",
            Content = "ESP Roles " .. (Value and "Activado" or "Desactivado") .. "\n(Próximamente funcional)",
            Duration = 4
        })
    end,
})

-- Auto Pickup Gun
TabMM2:CreateToggle({
    Name = "Auto Pickup Gun",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({
            Title = "MM2",
            Content = "Auto Pickup Gun " .. (Value and "Activado" or "Desactivado") .. "\n(En desarrollo)",
            Duration = 4
        })
    end,
})

-- WalkSpeed (el que ya te funcionaba)
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

TabMM2:CreateButton({
    Name = "Reset WalkSpeed",
    Callback = function()
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16
        end
        Rayfield:Notify({Title = "MM2", Content = "WalkSpeed restaurado a 16", Duration = 3})
    end,
})

TabMM2:CreateParagraph({
    Title = "Estado",
    Content = "Script básico de MM2 cargado.\n\nESP y Auto Gun están en desarrollo.\nMás features pronto (Kill Aura, Silent Aim, etc.)"
})

print("✅ MM2 Script cargado correctamente")
