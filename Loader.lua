-- Nc Hub Loader - Versión Estable para MM2
print("🔵 Nc Hub Loader iniciado...")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

if _G.NcHubLoaded then
    Rayfield:Notify({Title = "Nc Hub", Content = "Ya está cargado.", Duration = 3})
    return
end

_G.NcHubLoaded = true
_G.NcHubRayfield = Rayfield   -- Guardamos Rayfield globalmente
_G.NcHubWindow = Rayfield:CreateWindow({
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

local Window = _G.NcHubWindow

Rayfield:Notify({
    Title = "Nc Hub",
    Content = "Loader cargado correctamente",
    Duration = 4
})

local TabHome = Window:CreateTab("🏠 Home", 4483362458)
local TabGames = Window:CreateTab("🎮 Games", 4483362458)

TabHome:CreateParagraph({
    Title = "Nc Hub - MM2",
    Content = "Script específico para Murder Mystery 2"
})

-- Detección de MM2
local placeId = game.PlaceId

if placeId == 142823291 then
    Rayfield:Notify({
        Title = "MM2 Detectado",
        Content = "Cargando features específicas...",
        Duration = 5
    })
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/May67-dev/NcHub/main/Games/MM2.lua"))()
    end)
    
    if not success then
        Rayfield:Notify({Title = "Error MM2", Content = tostring(err), Duration = 8})
    end
else
    Rayfield:Notify({Title = "MM2", Content = "No estás en Murder Mystery 2", Duration = 4})
end

print("✅ Loader finalizado")
