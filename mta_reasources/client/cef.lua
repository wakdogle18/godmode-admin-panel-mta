local adminUI = nil
local isVisible = false
local sx, sy = guiGetScreenSize()

function toggleAdminPanel()
    if not adminUI then
        adminUI = createBrowser(1280, 720, true, true)
        addEventHandler("onClientBrowserCreated", adminUI, function()
            loadBrowserURL(adminUI, "http://mta/local/html/index.html")
            focusBrowser(adminUI)
        end)

        addEventHandler("onClientBrowserDocumentReady", adminUI, function()
            triggerServerEvent("admin:requestPlayerList", localPlayer)
        end)

        addEventHandler("onClientRender", root, renderCEFPanel)
        showCursor(true)
        isVisible = true
    else
        destroyElement(adminUI)
        adminUI = nil
        removeEventHandler("onClientRender", root, renderCEFPanel)
        showCursor(false)
        isVisible = false
    end
end

bindKey("F7", "down", toggleAdminPanel)

function renderCEFPanel()
    if isVisible and adminUI then
        dxDrawImage(0, 0, sx, sy, adminUI, 0, 0, 0, tocolor(255,255,255,255), true)
    end
end

addEvent("admin:receivePlayerList", true)
addEventHandler("admin:receivePlayerList", root, function(playerList)
    local jsonData = toJSON(playerList)
    executeBrowserJavascript(adminUI, "updatePlayerList("..jsonData..");")
end)
