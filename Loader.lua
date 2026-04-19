-- Nc Hub Loader - Scripts por Juego
print("🔵 Nc Hub Loader iniciado...")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

if _G.NcHubLoaded then
    Rayfield:Notify({Title = "Nc Hub", Content = "Ya está cargado.", Duration = 3})
    return
end

_G.NcHubLoaded = true

local Window = Rayfield:CreateWindow({
    Name = "Nc Hub",
    LoadingTitle = "Nc Hub",
    LoadingSubtitle = "Cargando script de MM2...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NcHubConfig",
        FileName = "NcHub_Settings"
    },
    KeySystem = false
})

Rayfield:Notify({
    Title = "Nc Hub",
    Content = "Loader listo",
    Duration = 4
})

local TabHome = Window:CreateTab("🏠 Home", 4483362458)
local TabUniversal = Window:CreateTab("🌐 Universal", 4483362458)
local TabGames = Window:CreateTab("🎮 Games", 4483362458)

TabHome:CreateParagraph({
    Title = "Nc Hub",
    Content = "Scripts separados por juego\nActualmente en Murder Mystery 2"
})

-- Detección de MM2
local placeId = game.PlaceId

if placeId == 142823291 then
    Rayfield:Notify({Title = "MM2 Detectado", Content = "Cargando features específicas de Murder Mystery 2...", Duration = 5})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/May67-dev/NcHub/main/Games/MM2.lua"))()
else
    TabGames:CreateSection("Juego actual: No es MM2")
    TabGames:CreateParagraph({
        Title = "MM2 no detectado",
        Content = "Este script es específico para Murder Mystery 2"
    })
end

print("✅ Nc Hub Loader completado")
