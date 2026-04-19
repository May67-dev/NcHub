-- Nc Hub Loader - Rayfield (Versión Mejorada)
print("🔵 Nc Hub cargando...")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

if _G.NcHubLoaded then
    Rayfield:Notify({Title = "Nc Hub", Content = "Ya está cargado.", Duration = 3})
    return
end

_G.NcHubLoaded = true

local Window = Rayfield:CreateWindow({
    Name = "Nc Hub",
    LoadingTitle = "Nc Hub",
    LoadingSubtitle = "Cargando interfaz premium...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NcHubConfig",
        FileName = "NcHub_Settings"
    },
    KeySystem = false
})

Rayfield:Notify({
    Title = "Nc Hub",
    Content = "Bienvenido a Nc Hub\nTema Dark Moderno",
    Duration = 5
})

-- ==================== TABS ====================
local TabHome = Window:CreateTab("🏠 Home", 4483362458)
local TabUniversal = Window:CreateTab("🌐 Universal", 4483362458)
local TabGames = Window:CreateTab("🎮 Games", 4483362458)
local TabMisc = Window:CreateTab("🔧 Misc", 4483362458)

-- Home
TabHome:CreateParagraph({
    Title = "Nc Hub",
    Content = "Script universal con Rayfield\nListo para personalizar a tu gusto."
})

TabHome:CreateButton({
    Name = "Test Button",
    Callback = function()
        Rayfield:Notify({Title = "Nc Hub", Content = "¡Funciona correctamente!", Duration = 3})
    end
})

-- Universal (para futuras features)
TabUniversal:CreateSection("Movement")
TabUniversal:CreateButton({
    Name = "Próximamente: Fly, Speed, Noclip...",
    Callback = function()
        Rayfield:Notify({Title = "Nc Hub", Content = "Sección en desarrollo", Duration = 4})
    end
})

print("✅ Nc Hub cargado con Rayfield")

-- Ocultar automáticamente el botón "Show Rayfield"
task.spawn(function()
    task.wait(1.5)
    for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if v:IsA("TextButton") and v.Text == "Show Rayfield" then
            v.Visible = false
            break
        end
    end
end)
