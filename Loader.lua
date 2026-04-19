-- Nc Hub Loader - FORZADO (Custom UI)
print("🔵 Nc Hub - Forzando carga de Custom UI...")

-- Limpiar versión anterior de Rayfield si existe
if _G.NcHubLoaded then
    _G.NcHubLoaded = false
end

-- Destruir cualquier GUI anterior
for _, gui in pairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
    if gui.Name == "NcHubGui" or gui.Name == "Rayfield" or string.find(gui.Name:lower(), "rayfield") then
        gui:Destroy()
    end
end

-- Esperar un poco para limpiar
task.wait(0.5)

-- Cargar nuestra UI custom
loadstring(game:HttpGet("https://raw.githubusercontent.com/May67-dev/NcHub/main/NcHub.lua"))()

print("✅ Nc Hub Custom UI forzada")
