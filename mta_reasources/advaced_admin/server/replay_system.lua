-- Penyimpanan replay per serial player
local replayData = {}

setTimer(function()
    for _, player in ipairs(getElementsByType("player")) do
        if not isElement(player) then return end

        local serial = getPlayerSerial(player)
        local x, y, z = getElementPosition(player)
        local rx, ry, rz = getElementRotation(player)
        local rotation = getPedRotation(player)

        local frame = {
            x = x,
            y = y,
            z = z,
            rx = rx,
            ry = ry,
            rz = rz,
            pedRotation = rotation,
            time = getRealTime().timestamp
        }

        if not replayData[serial] then
            replayData[serial] = {}
        end

        table.insert(replayData[serial], frame)

        -- Simpan hanya 15 detik terakhir (dengan interval 200ms ≈ 75 frame)
        if #replayData[serial] > 75 then
            table.remove(replayData[serial], 1)
        end
    end
end, 200, 0)

-- Command: /savereplay [player]
addCommandHandler("savereplay", function(admin, _, targetName)
    if not hasPermission(admin, "useGodMode") then
        return outputChatBox("❌ Kamu tidak punya izin!", admin, 255, 0, 0)
    end

    local target = getPlayerFromName(targetName)
    if not target then
        return outputChatBox("⚠️ Player tidak ditemukan.", admin, 255, 200, 0)
    end

    local serial = getPlayerSerial(target)
    local data = replayData[serial]

    if not data or #data == 0 then
        return outputChatBox("⚠️ Tidak ada data replay untuk player ini.", admin, 255, 150, 0)
    end

    local fileName = "replays/" .. serial .. "_" .. os.time() .. ".json"

    local file = fileCreate(fileName)
    if file then
        fileWrite(file, toJSON(data, true))
        fileClose(file)
        outputChatBox("✅ Replay disimpan: "..fileName, admin, 100, 255, 100)
    else
        outputChatBox("❌ Gagal menyimpan replay.", admin, 255, 0, 0)
    end
end)
