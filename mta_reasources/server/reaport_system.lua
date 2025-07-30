-- Command /report [target] [reason]
addCommandHandler("report", function(player, cmd, target, ...)
    local reason = table.concat({...}, " ")
    if not target or reason == "" then
        return outputChatBox("❌ Penggunaan: /report [nama_pemain] [alasan]", player, 255, 255, 0)
    end

    local reported = getPlayerFromName(target)
    if not reported then
        return outputChatBox("⚠️ Pemain tidak ditemukan.", player, 255, 200, 0)
    end

    savePlayerReport(player, reported, reason)
end)

function savePlayerReport(reporter, reported, reason)
    local reporterName = getPlayerName(reporter)
    local reportedName = getPlayerName(reported)

    -- Simpan ke database
    if db then
        dbExec(db, "INSERT INTO player_reports (reporter, reported, reason, time) VALUES (?, ?, ?, NOW())",
            reporterName, reportedName, reason)
    end

    outputChatBox("✅ Laporan kamu sudah dikirim ke admin.", reporter, 100, 255, 100)

    -- Kirim ke semua admin
    for _, admin in ipairs(getElementsByType("player")) do
        if hasPermission(admin, "viewReports") then
            outputChatBox("📩 [LAPORAN] "..reporterName.." → "..reportedName..": "..reason, admin, 255, 150, 0)
        end
    end

    -- Kirim ke Discord
    sendDiscordLog("📩 **[REPORT]** "..reporterName.." → "..reportedName..": "..reason)
end

-- Optional: trigger dari CEF jika mau laporan via tombol panel
addEvent("admin:submitReport", true)
addEventHandler("admin:submitReport", root, function(reported, reason)
    savePlayerReport(client, getPlayerFromName(reported), reason)
end)
