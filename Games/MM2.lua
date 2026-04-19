-- Nc Hub - MM2 Script (Versión Mejorada)
print("🔪 MM2 Script cargado")

local Rayfield = _G.NcHubRayfield
local Window = _G.NcHubWindow

if not Rayfield or not Window then
    warn("Nc Hub: No se encontró Rayfield o Window")
    return
end

local TabMM2 = Window:CreateTab("🔪 MM2", 4483362458)

TabMM2:CreateSection("🔫 MM2 Features")

-- WalkSpeed (ya funcionaba)
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
        Rayfield:Notify({Title = "MM2", Content = "WalkSpeed restaurado", Duration = 3})
    end,
})

TabMM2:CreateSection("👁️ Visuals")

-- ESP Roles (Placeholder por ahora)
TabMM2:CreateToggle({
    Name = "ESP Roles (Murderer / Sheriff / Innocent)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            Rayfield:Notify({
                Title = "MM2",
                Content = "ESP Roles activado\n(Función en desarrollo - pronto funcional)",
                Duration = 5
            })
        else
            Rayfield:Notify({Title = "MM2", Content = "ESP Roles desactivado", Duration = 3})
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
            Content = "Gun ESP " .. (Value and "Activado" or "Desactivado") .. "\n(Próximamente)",
            Duration = 4
        })
    end,
})

TabMM2:CreateSection("⚔️ Combat")

-- Auto Pickup Gun (mejorado)
TabMM2:CreateToggle({
    Name = "Auto Pickup Gun",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({
            Title = "MM2",
            Content = "Auto Pickup Gun " .. (Value and "Activado" or "Desactivado"),
            Duration = 4
        })
    end,
})

-- Kill Aura (solo para Murderer)
TabMM2:CreateToggle({
    Name = "Kill Aura (Murderer)",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({
            Title = "MM2",
            Content = "Kill Aura " .. (Value and "Activado ⚠️" or "Desactivado"),
            Duration = 4
        })
    end,
})

TabMM2:CreateSection("Información")
TabMM2:CreateParagraph({
    Title = "Estado del Script",
    Content = "• WalkSpeed funcionando correctamente\n• Otras funciones en desarrollo\n\nPróximamente:\n- ESP Roles real\n- Silent Aim\n- Auto Win (Sheriff)\n- Gun ESP"
})

print("✅ MM2 Script mejorado cargado correctamente")
