-- Nc Hub Loader - Custom UI
print("🔵 Nc Hub cargando...")

if _G.NcHubLoaded then
    print("Nc Hub ya está cargado")
    return
end

_G.NcHubLoaded = true

loadstring(game:HttpGet("https://raw.githubusercontent.com/May67-dev/NcHub/main/NcHub.lua"))()

print("✅ Nc Hub Loader completado")
