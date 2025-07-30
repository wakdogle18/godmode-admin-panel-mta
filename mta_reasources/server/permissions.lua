addEvent("admin:requestPlayerList", true)
addEventHandler("admin:requestPlayerList", root,
    function ()
        local players = {}
        for _, player in ipairs(getElementsByType("player")) do
            table.insert(players, {
                name = getPlayerName(player),
                health = getElementHealth(player),
                armor = getPedArmor(player),
                skin = getElementModel(player),
                ping = getPlayerPing(player)
            })
        end
        triggerClientEvent(client, "admin:receivePlayerList", client, players)
    end
)
