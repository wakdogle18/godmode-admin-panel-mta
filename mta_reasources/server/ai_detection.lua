-- AI-Lite: Deteksi pola cheat dengan histori posisi
local playerMovementHistory = {}

setTimer(function()
    for _, player in ipairs(getElementsByType("player")) do
        if not isElement(player) or isPedDead(player) then return end

        local serial = getPlayerSerial(player)
        local x, y, z = getElementPosition(player)

        if not playerMovementHistory[serial] then
            playerMovementHistory[serial] = {}
        end

        local history = playerMovementHistory[serial]
        table.insert(history, {x = x, y = y, z = z, tick = getTickCount()})

        -- Max 10 records
        if #history > 10 then
            table.remove(history, 1)
        end

        -- Analisa pergerakan
        if #history >= 2 then
            local last = history[#history - 1]
            local dist = getDistanceBetweenPoints3D(x, y, z, last.x, last.y, last.z)

            if dist > 50 then
                outputChatBox("🤖 AI: "..getPlayerName(player).." moved "..math.floor(dist).."m in <2s", root, 255, 0, 0)
                sendDiscordLog("🤖 **[AI Detection]** "..getPlayerName(player).." suspected teleport (moved "..math.floor(dist).."m)")
                
                if db then
                    dbExec(db, "INSERT INTO cheater_logs (player_name, reason) VALUES (?, ?)", getPlayerName(player), "AI Teleport Detection ("..math.floor(dist).."m)")
                end
            end
        end
    end
end, 2000, 0)
