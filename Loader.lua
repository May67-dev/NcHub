-- Nc Hub Loader - Versión Estable Final para MM2
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
    LoadingSubtitle = "Cargando Murder Mystery 2...",
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
    Content = "Loader cargado - Esperando MM2...",
    Duration = 4
})

-- Tabs base
local TabHome = Window:CreateTab("🏠 Home", 4483362458)

TabHome:CreateParagraph({
    Title = "Nc Hub",
    Content = "Script para Murder Mystery 2\nCargando features específicas..."
})

-- Cargar script de MM2 después de crear la ventana
task.wait(1) -- Pequeña espera para asegurar que todo esté listo

local placeId = game.PlaceId

if placeId == 142823291 then
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/May67-dev/NcHub/main/Games/MM2.lua"))()
    end)
    
    if success then
        Rayfield:Notify({Title = "MM2", Content = "Script de MM2 cargado correctamente", Duration = 5})
    else
        Rayfield:Notify({Title = "Error", Content = "Fallo al cargar MM2.lua\n" .. tostring(err), Duration = 8})
    end
else
    Rayfield:Notify({Title = "Error", Content = "No estás en Murder Mystery 2", Duration = 6})
end

print("✅ Nc Hub Loader finalizado")
