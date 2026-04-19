-- Nc Hub - MM2 Script (Versión Diagnóstico)
print("🔪 MM2 Script cargado")

local Rayfield = _G.NcHubRayfield
local Window = _G.NcHubWindow

if not Window then
    Rayfield:Notify({Title = "Error", Content = "No se encontró la ventana principal", Duration = 6})
    return
end

-- Crear la pestaña MM2 directamente aquí
local TabMM2 = Window:CreateTab("🔪 MM2", 4483362458)

TabMM2:CreateSection("MM2 - Funciones Básicas")

TabMM2:CreateParagraph({
    Title = "¡Pestaña MM2 cargada!",
    Content = "Si ves este mensaje, la pestaña se creó correctamente.\n\nWalkSpeed funciona.\nOtras funciones se añadirán."
})

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

print("✅ MM2 Script cargado - Pestaña creada")
