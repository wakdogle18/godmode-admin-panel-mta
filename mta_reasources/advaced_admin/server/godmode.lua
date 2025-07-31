addEvent("admin:godPower", true)
addEventHandler("admin:godPower", root, function(action, targetName)
    local admin = client
    if not hasPermission(admin, "useGodMode") then
        return outputChatBox("❌ Kamu tidak punya izin untuk fitur GodMode!", admin, 255, 0, 0)
    end

    local target = getPlayerFromName(targetName)
    if not target then
        return outputChatBox("⚠️ Target tidak ditemukan", admin, 255, 200, 0)
    end

    if action == "cloak" then
        setElementAlpha(admin, 0)
        setPlayerNametagShowing(admin, false)
        setElementData(admin, "invincible", true)
        outputChatBox("🧙 Kamu kini tak terlihat.", admin, 150, 255, 150)

    elseif action == "spectate" then
        triggerClientEvent(admin, "admin:startSpectate", admin, target)

    elseif action == "freeze_time" then
        setElementFrozen(target, true)
        toggleAllControls(target, false)
        outputChatBox("⏳ Kamu dibekukan oleh admin!", target, 255, 50, 50)

    elseif action == "meteor" then
        local x, y, z = getElementPosition(target)
        createExplosion(x, y, z + 20, 6)
        createExplosion(x + 1, y, z + 20, 6)
        createExplosion(x - 1, y, z + 20, 6)
        outputChatBox("☄️ Meteor Strike!", root, 255, 100, 0)

    elseif action == "invert_controls" then
        triggerClientEvent(target, "admin:invertControls", target)

    elseif action == "play_scream" then
        triggerClientEvent(target, "admin:playScream", target)

    elseif action == "mind_control" then
        triggerClientEvent(admin, "admin:startMindControl", admin, target)

    elseif action == "permadeath" then
        setElementData(target, "permadeath", true)
        outputChatBox("💀 Permadeath diaktifkan! Jangan mati!", target, 255, 0, 0)

    elseif action == "map_rotate" then
        setWaveHeight(5)
        setGameSpeed(0.5)
        triggerClientEvent(root, "admin:rotateMap", root)
    end
end)

-- Deteksi permadeath ketika mati
addEventHandler("onPlayerWasted", root, function()
    if getElementData(source, "permadeath") then
        kickPlayer(source, source, "❌ Kamu mati dalam mode PERMADEATH.")
    end
end)
