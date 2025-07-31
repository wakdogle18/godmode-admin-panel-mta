addEvent("admin:performAction", true)
addEventHandler("admin:performAction", root, function(action, targetName)
    if not hasPermission(client, action:lower()) then
        return outputChatBox("❌ You don't have permission for this action", client, 255, 0, 0)
    end

    local target = getPlayerFromName(targetName)
    if not target then
        return outputChatBox("⚠️ Player not found", client, 255, 200, 0)
    end

    if action == "Kick" then
        kickPlayer(target, client, "Kicked via admin panel")
        logAdminAction(getPlayerName(client).." kicked "..getPlayerName(target))
        sendDiscordLog("👢 **[KICK]** "..getPlayerName(client).." → "..getPlayerName(target))

    elseif action == "Freeze" then
        local frozen = isElementFrozen(target)
        setElementFrozen(target, not frozen)
        outputChatBox("❄️ Player "..getPlayerName(target).." has been "..(frozen and "unfrozen" or "frozen"), client)
        logAdminAction(getPlayerName(client).." toggled freeze on "..getPlayerName(target))

    elseif action == "Slap" then
        killPed(target)
        logAdminAction(getPlayerName(client).." slapped "..getPlayerName(target))

    elseif action == "Set Skin" then
        setElementModel(target, 285) -- Default CJ
        logAdminAction(getPlayerName(client).." set skin for "..getPlayerName(target))

    elseif action == "Set Health" then
        setElementHealth(target, 100)
        logAdminAction(getPlayerName(client).." set health for "..getPlayerName(target))

    elseif action == "Teleport" then
        local x, y, z = getElementPosition(client)
        setElementPosition(target, x + 2, y + 2, z)
        logAdminAction(getPlayerName(client).." teleported "..getPlayerName(target))
    end
end)

-- Set custom health via input
addEvent("admin:setHealth", true)
addEventHandler("admin:setHealth", root, function(targetName, amount)
    if not hasPermission(client, "setHealth") then return end
    local target = getPlayerFromName(targetName)
    if target and amount then
        setElementHealth(target, amount)
        logAdminAction(getPlayerName(client).." set health("..amount..") for "..getPlayerName(target))
    end
end)
