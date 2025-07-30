-- Anti-Cheat Sederhana: Teleport, Health, Armor, Super Jump
setTimer(function()
    for _, player in ipairs(getElementsByType("player")) do
        if isPedDead(player) then return end

        -- Health Hack
        local hp = getElementHealth(player)
        if hp > anticheat.maxHealth then
            flagCheater(player, "Health Hack ("..hp..")")
        end

        -- Armor Hack
        local armor = getPedArmor(player)
        if armor > anticheat.maxArmor then
            flagCheater(player, "Armor Hack ("..armor..")")
        end

        -- Teleport / abnormal movement
        local x, y, z = getElementPosition(player)
        local last = getElementData(player, "ac:lastPos") or {x = x, y = y, z = z}
        local dist = getDistanceBetweenPoints3D(x, y, z, last.x, last.y, last.z)
        if dist > anticheat.teleportThreshold then
            flagCheater(player, "Teleport Hack (moved "..math.floor(dist).."m)")
        end
        setElementData(player, "ac:lastPos", {x = x, y = y, z = z})
    end
end, anticheat.checkInterval, 0)

function flagCheater(player, reason)
    local name = getPlayerName(player)
    outputChatBox("⚠️ CHEAT DETECTED: "..name.." - "..reason, root, 255, 50, 50)

    -- Discord log
    sendDiscordLog("⚠️ **[CHEAT DETECTED]** "..name.." - "..reason)

    -- Simpan ke DB
    if db then
        dbExec(db, "INSERT INTO cheater_logs (player_name, reason) VALUES (?, ?)", name, reason)
    end
end
