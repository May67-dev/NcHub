-- Nc Hub Loader - Scripts Separados
print("🔵 Nc Hub Loader iniciado...")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

if _G.NcHubLoaded then
    Rayfield:Notify({Title = "Nc Hub", Content = "Ya está cargado.", Duration = 3})
    return
end

_G.NcHubLoaded = true

-- Crear ventana principal
local Window = Rayfield:CreateWindow({
    Name = "Nc Hub",
    LoadingTitle = "Nc Hub",
    LoadingSubtitle = "Cargando scripts por juego...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NcHubConfig",
        FileName = "NcHub_Settings"
    },
    KeySystem = false
})

Rayfield:Notify({
    Title = "Nc Hub",
    Content = "Loader iniciado correctamente",
    Duration = 4
})

-- ==================== TABS BASE ====================
local TabHome = Window:CreateTab("🏠 Home", 4483362458)
local TabUniversal = Window:CreateTab("🌐 Universal", 4483362458)
local TabGames = Window:CreateTab("🎮 Games", 4483362458)

TabHome:CreateParagraph({
    Title = "Nc Hub",
    Content = "Sistema de scripts separados por juego\nElige el juego en la pestaña Games"
})

-- ==================== DETECCIÓN DE JUEGO ====================
local placeId = game.PlaceId
local gameName = "Desconocido"

-- Aquí puedes añadir más juegos fácilmente
if placeId == 2753915549 or placeId == 4442272183 or placeId == 7449423635 then
    gameName = "Blox Fruits"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/May67-dev/NcHub/main/Games/BloxFruits.lua"))()
elseif placeId == 6284583030 then
    gameName = "Pet Simulator 99"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/May67-dev/NcHub/main/Games/PetSimulator.lua"))()
else
    gameName = "Juego no soportado todavía"
end

TabGames:CreateSection("Juego Detectado: " .. gameName)

print("✅ Nc Hub cargado | Juego detectado: " .. gameName)
