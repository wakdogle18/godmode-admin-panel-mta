-- Ambil config dari shared
local aiConfig = aiAnticheatConfig or {
    maxTeleportDistance = 50,
    maxSpeed = 50.0,
    maxJumpHeight = 5.0
}

local movementHistory = {}

setTimer(function()
    for _, player in ipairs(getElementsByType("player")) do
        if not isElement(player) or isPedDead(player) then return end

        local serial = getPlayerSerial(player)
        local x, y, z = getElementPosition(player)
        local tick = getTickCount()

        if not movementHistory[serial] then
            movementHistory[serial] = {}
        end

        local history = movementHistory[serial]
        table.insert(history, {x = x, y = y, z = z, tick = tick})

        if #history > 5 then
            table.remove(history, 1)
        end

        if #history >= 2 then
            local prev = history[#history - 1]
            local dt = (tick - prev.tick) / 1000 -- seconds
            local dist = getDistanceBetweenPoints3D(x, y, z, prev.x, prev.y, prev.z)
            local speed = dist / dt

            -- Teleport detection
            if dist > aiConfig.maxTeleportDistance then
                flagAI(player, "Suspected Teleport ("..math.floor(dist).."m in "..dt.."s)")
            end

            -- Speed detection
            if speed > aiConfig.maxSpeed then
                flagAI(player, "Speed Hack? ("..math.floor(speed).." m/s)")
            end

            -- Jump height
            local jumpHeight = z - prev.z
            if jumpHeight > aiConfig.maxJumpHeight then
                flagAI(player, "Super Jump Detected ("..string.format("%.2f", jumpHeight).."m)")
            end
        end
    end
end, 2000, 0)

function flagAI(player, reason)
    local name = getPlayerName(player)
    outputChatBox("🤖 AI Alert: "..name.." - "..reason, root, 255, 100, 0)
    sendDiscordLog("🤖 **[AI Detection]** "..name.." - "..reason)

    if db then
        dbExec(db, "INSERT INTO cheater_logs (player_name, reason) VALUES (?, ?)", name, reason)
    end
end
