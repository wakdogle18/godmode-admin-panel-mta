function hasPermission(player, action)
    local acc = getPlayerAccount(player)
    if not isGuestAccount(acc) then
        local rank = getAccountData(acc, "admin:rank") or "Helper"
        return adminPermissions[action] and adminPermissions[action] <= adminRanks[rank]
    end
    return false
end

-- Basic admin commands example
addCommandHandler("kick",
    function(admin, _, targetName, ...)
        local reason = table.concat({...}, " ")
        if not hasPermission(admin, "kick") then
            return outputChatBox("❌ You don't have permission to use /kick", admin, 255, 0, 0)
        end

        local target = getPlayerFromName(targetName)
        if target then
            kickPlayer(target, admin, reason or "No reason")
            logAdminAction(getPlayerName(admin).." kicked "..getPlayerName(target).." ("..(reason or "No reason")..")")
            sendDiscordLog("👢 **[KICK]** "..getPlayerName(admin).." → "..getPlayerName(target).." - "..reason)
        else
            outputChatBox("⚠️ Player not found.", admin, 255, 200, 0)
        end
    end
)

function logAdminAction(msg)
    outputServerLog("[ADMIN] "..msg)
    exports["advanced_admin"]:writeLog(msg)

    -- Try to parse & log
    local admin, action, target = string.match(msg, "^(%S+) (%S+) (%S+)")
    if admin and action and target then
        if db then
            dbExec(db, "INSERT INTO admin_logs (admin, action, target) VALUES (?, ?, ?)", admin, action, target)
        end
    end
end
