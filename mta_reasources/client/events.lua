-- Event handler dari CEF JavaScript ke Lua

-- Trigger dari CEF untuk jalankan action
addEvent("admin:performAction", true)
addEventHandler("admin:performAction", root, function(playerName, action)
    triggerServerEvent("admin:performAction", localPlayer, action, playerName)
end)

-- Trigger dari CEF untuk jalankan troll tools
addEvent("admin:troll", true)
addEventHandler("admin:troll", root, function(playerName, trollType)
    triggerServerEvent("admin:troll", localPlayer, playerName, trollType)
end)

-- Trigger dari CEF untuk jalankan god powers
addEvent("admin:godPower", true)
addEventHandler("admin:godPower", root, function(playerName, powerType)
    triggerServerEvent("admin:godPower", localPlayer, powerType, playerName)
end)

-- Set health dari input
addEvent("admin:setHealth", true)
addEventHandler("admin:setHealth", root, function(playerName, amount)
    triggerServerEvent("admin:setHealth", localPlayer, playerName, tonumber(amount))
end)

-- Kirim report manual dari CEF jika ada (opsional)
addEvent("admin:submitReport", true)
addEventHandler("admin:submitReport", root, function(reported, reason)
    triggerServerEvent("admin:submitReport", localPlayer, reported, reason)
end)
