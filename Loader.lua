-- Nc Hub Loader - Versión Estable para MM2
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
    LoadingSubtitle = "Cargando MM2...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NcHubConfig",
        FileName = "NcHub_Settings"
    },
    KeySystem = false
})

Rayfield:Notify({
    Title = "Nc Hub",
    Content = "Loader cargado correctamente",
    Duration = 4
})

-- Tabs base
local TabHome = Window:CreateTab("🏠 Home", 4483362458)
local TabUniversal = Window:CreateTab("🌐 Universal", 4483362458)
local TabGames = Window:CreateTab("🎮 Games", 4483362458)

TabHome:CreateParagraph({
    Title = "Nc Hub - MM2",
    Content = "Script para Murder Mystery 2\nCargando features..."
})

-- Detección y carga de MM2
local placeId = game.PlaceId

if placeId == 142823291 then
    Rayfield:Notify({
        Title = "MM2 Detectado",
        Content = "Cargando script específico de Murder Mystery 2...",
        Duration = 5
    })
    
    -- Cargar el script de MM2 de forma segura
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/May67-dev/NcHub/main/Games/MM2.lua"))()
    end)
    
    if not success then
        Rayfield:Notify({
            Title = "Error",
            Content = "No se pudo cargar MM2.lua\nError: " .. tostring(err),
            Duration = 6
        })
    end
else
    Rayfield:Notify({
        Title = "MM2",
        Content = "No estás en Murder Mystery 2",
        Duration = 4
    })
end

print("✅ Nc Hub Loader finalizado")
