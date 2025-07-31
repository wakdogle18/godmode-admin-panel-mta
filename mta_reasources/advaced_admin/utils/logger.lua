-- Logger untuk menyimpan aktivitas admin ke file text
local logFilePath = "logs/admin_actions.log"

function writeLog(text)
    local time = getRealTime()
    local timestamp = string.format("[%04d-%02d-%02d %02d:%02d:%02d]",
        time.year + 1900, time.month + 1, time.monthday,
        time.hour, time.minute, time.second)

    local line = timestamp .. " " .. text .. "\n"

    -- Pastikan folder logs/ ada
    if not fileExists(logFilePath) then
        local f = fileCreate(logFilePath)
        if f then fileClose(f) end
    end

    local file = fileOpen(logFilePath, true)
    if file then
        fileSetPos(file, fileGetSize(file))
        fileWrite(file, line)
        fileClose(file)
    end
end
