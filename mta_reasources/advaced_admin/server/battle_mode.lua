-- Command: /battle [playerName]
addCommandHandler("battle", function(admin, _, targetName)
    if not hasPermission(admin, "useGodMode") then
        return outputChatBox("❌ Kamu tidak punya izin menggunakan /battle!", admin, 255, 0, 0)
    end

    local target = getPlayerFromName(targetName)
    if not target then
        return outputChatBox("⚠️ Player tidak ditemukan.", admin, 255, 200, 0)
    end

    -- Tempat battle
    local ax, ay, az = 1550, -1400, 13
    local tx, ty, tz = 1555, -1400, 13

    -- Respawn admin
    spawnPlayer(admin, ax, ay, az, 0, 287) -- AK47
    giveWeapon(admin, 30, 500)
    setElementHealth(admin, 100)

    -- Respawn target
    spawnPlayer(target, tx, ty, tz, 0, 287)
    giveWeapon(target, 30, 500)
    setElementHealth(target, 100)

    -- Notify both
    outputChatBox("⚔️ Battle Mode Dimulai: "..getPlayerName(admin).." vs "..getPlayerName(target), root, 255, 50, 50)

    -- Discord log
    sendDiscordLog("⚔️ **[BATTLE MODE]** "..getPlayerName(admin).." vs "..getPlayerName(target))
end)
