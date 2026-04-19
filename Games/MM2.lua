-- Nc Hub - MM2 Script (Versión Estable)
print("🔪 MM2 Script iniciado")

local Rayfield = _G.NcHubRayfield
local Window = _G.NcHubWindow

if not Window then
    Rayfield:Notify({Title = "Error", Content = "No se pudo encontrar la ventana de Nc Hub", Duration = 6})
    return
end

local TabMM2 = Window:CreateTab("🔪 MM2", 4483362458)

TabMM2:CreateSection("Movement")

TabMM2:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 150},
    Increment = 2,
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
        Rayfield:Notify({Title = "MM2", Content = "WalkSpeed restaurado a 16", Duration = 3})
    end,
})

TabMM2:CreateSection("Visuals")

TabMM2:CreateToggle({
    Name = "ESP Roles",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({Title = "MM2", Content = "ESP Roles " .. (Value and "Activado" or "Desactivado") .. " (Próximamente)", Duration = 4})
    end,
})

TabMM2:CreateToggle({
    Name = "Gun ESP",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({Title = "MM2", Content = "Gun ESP " .. (Value and "Activado" or "Desactivado"), Duration = 4})
    end,
})

TabMM2:CreateSection("Combat")

TabMM2:CreateToggle({
    Name = "Aimbot Básico",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({Title = "MM2", Content = "Aimbot " .. (Value and "Activado" or "Desactivado"), Duration = 4})
    end,
})

TabMM2:CreateParagraph({
    Title = "Estado",
    Content = "WalkSpeed funcionando correctamente.\nOtras funciones en desarrollo."
})

print("✅ MM2 Script cargado correctamente")
