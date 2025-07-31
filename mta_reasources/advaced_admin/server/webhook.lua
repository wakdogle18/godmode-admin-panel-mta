-- Ganti dengan URL Webhook Discord kamu
DISCORD_WEBHOOK_URL = "https://discord.com/api/webhooks/ISI_WEBHOOK_KAMU"

function sendDiscordLog(message)
    if not DISCORD_WEBHOOK_URL or DISCORD_WEBHOOK_URL == "" then return end

    fetchRemote(DISCORD_WEBHOOK_URL,
        {
            method = "POST",
            headers = {
                ["Content-Type"] = "application/json"
            },
            postData = toJSON({
                username = "🛡️ Admin Bot",
                content = message
            })
        },
        function(response, errno)
            if errno ~= 0 then
                outputDebugString("Discord webhook failed: "..tostring(errno))
            end
        end
    )
end
