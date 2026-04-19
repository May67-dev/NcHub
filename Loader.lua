-- Nc Hub Loader - Versión Simple y Estable
print("🔵 Nc Hub Loader iniciado...")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

if _G.NcHubLoaded then
    Rayfield:Notify({Title = "Nc Hub", Content = "Ya está cargado.", Duration = 3})
    return
end

_G.NcHubLoaded = true
_G.NcHubRayfield = Rayfield

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

_G.NcHubWindow = Window

Rayfield:Notify({
    Title = "Nc Hub",
    Content = "Loader listo - MM2",
    Duration = 4
})

-- Tabs base
local TabHome = Window:CreateTab("🏠 Home", 4483362458)

TabHome:CreateParagraph({
    Title = "Nc Hub - Murder Mystery 2",
    Content = "Cargando script específico..."
})

-- Cargar MM2
local placeId = game.PlaceId

if placeId == 142823291 then
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/May67-dev/NcHub/main/Games/MM2.lua"))()
    end)
    
    if not success then
        Rayfield:Notify({Title = "Error", Content = "No se pudo cargar MM2.lua\n" .. tostring(err), Duration = 8})
    end
else
    Rayfield:Notify({Title = "MM2", Content = "No estás en Murder Mystery 2", Duration = 5})
end

print("✅ Loader finalizado")
