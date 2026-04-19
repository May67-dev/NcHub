-- Nc Hub Loader - Keyless Version
-- Usuario: May67-dev

print("🔵 Nc Hub cargando...")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

if _G.NcHubLoaded then
    Rayfield:Notify({
        Title = "Nc Hub",
        Content = "El hub ya está cargado.",
        Duration = 4,
        Image = 4483362458
    })
    return
end

_G.NcHubLoaded = true

-- Crear ventana con tema Dark moderno
local Window = Rayfield:CreateWindow({
    Name = "Nc Hub",
    LoadingTitle = "Nc Hub",
    LoadingSubtitle = "Cargando interfaz moderna...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NcHubConfig",
        FileName = "NcHub_Settings"
    },
    Discord = {
        Enabled = false,   -- Cambia a true y pon tu invite cuando quieras
    },
    KeySystem = false      -- ← Aquí está desactivado el key system
})

Rayfield:Notify({
    Title = "Nc Hub",
    Content = "Bienvenido a Nc Hub\nVersión Keyless - Tema Dark Moderno",
    Duration = 6,
    Image = 4483362458
})

-- ==================== TABS ====================

local TabHome = Window:CreateTab("🏠 Home", 4483362458)
local TabUniversal = Window:CreateTab("🌐 Universal", 4483362458)
local TabGames = Window:CreateTab("🎮 Games", 4483362458)
local TabMisc = Window:CreateTab("🔧 Misc", 4483362458)

-- Home Tab
TabHome:CreateParagraph({
    Title = "👋 Bienvenido a Nc Hub",
    Content = "Script universal hecho con Rayfield.\n\nTema Dark moderno.\n\nListo para añadir Fly, Speed, Auto Farm y mucho más.\n\n¡Disfruta, bro!"
})

TabHome:CreateButton({
    Name = "Test Button (Funciona)",
    Callback = function()
        Rayfield:Notify({
            Title = "Nc Hub",
            Content = "¡Botón funcionando correctamente! ✅",
            Duration = 3
        })
    end,
})

-- Universal Tab (aquí pondremos las features universales)
TabUniversal:CreateSection("Movement Features")

TabUniversal:CreateButton({
    Name = "Próximamente: Fly, Speed, Noclip, Infinite Jump...",
    Callback = function()
        Rayfield:Notify({
            Title = "Nc Hub",
            Content = "Estas funciones se añadirán pronto.",
            Duration = 4
        })
    end,
})

-- Games Tab
TabGames:CreateParagraph({
    Title = "🎮 Juegos Específicos",
    Content = "Aquí aparecerán features para Blox Fruits, Pet Simulator, Brookhaven, Tycoons, etc."
})

print("✅ Nc Hub cargado correctamente (Keyless)")

-- Mensaje final en consola
Rayfield:Notify({
    Title = "Nc Hub",
    Content = "Listo para desarrollar. ¿Qué feature quieres primero?",
    Duration = 5
})
