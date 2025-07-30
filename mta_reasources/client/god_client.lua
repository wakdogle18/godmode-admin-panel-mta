-- Screamer Sound
addEvent("admin:playScream", true)
addEventHandler("admin:playScream", root, function()
    playSound("sounds/screamer.wav")
end)

-- Invert Controls (troll)
addEvent("admin:invertControls", true)
addEventHandler("admin:invertControls", root, function()
    bindKey("w", "down", "backwards")
    bindKey("s", "down", "forwards")
    bindKey("a", "down", "right")
    bindKey("d", "down", "left")
    outputChatBox("🌀 Your controls have been scrambled!", 255, 100, 100)
end)

-- Spectate Mode
local spectateTarget = nil

addEvent("admin:startSpectate", true)
addEventHandler("admin:startSpectate", root, function(target)
    spectateTarget = target
    setCameraTarget(target)
    outputChatBox("👀 Spectating "..getPlayerName(target), 100, 255, 100)
end)

-- Mind Control Mode
addEvent("admin:startMindControl", true)
addEventHandler("admin:startMindControl", root, function(target)
    outputChatBox("🎮 Mind control mode activated", 255, 255, 100)
    bindKey("arrow_l", "down", function() triggerServerEvent("admin:moveTarget", localPlayer, target, -1, 0) end)
    bindKey("arrow_r", "down", function() triggerServerEvent("admin:moveTarget", localPlayer, target, 1, 0) end)
    bindKey("arrow_u", "down", function() triggerServerEvent("admin:moveTarget", localPlayer, target, 0, 1) end)
    bindKey("arrow_d", "down", function() triggerServerEvent("admin:moveTarget", localPlayer, target, 0, -1) end)
end)

-- Map Rotation Effect (visual only)
addEvent("admin:rotateMap", true)
addEventHandler("admin:rotateMap", root, function()
    fadeCamera(false, 1)
    setTimer(function()
        setCameraMatrix(0, 0, 500, 0, 0, 0)
        fadeCamera(true, 2)
    end, 1000, 1)
end)
