-- Konfigurasi ranking admin
adminRanks = {
    ["Helper"] = 1,
    ["Moderator"] = 2,
    ["Admin"] = 3,
    ["SuperAdmin"] = 4,
    ["Owner"] = 5
}

-- Konfigurasi hak akses per fitur
adminPermissions = {
    kick = 2,
    freeze = 2,
    slap = 1,
    setSkin = 2,
    setHealth = 2,
    teleport = 3,
    useGodMode = 4,
    viewReports = 2
}

-- Anti-Cheat Settings
anticheat = {
    maxHealth = 200,
    maxArmor = 150,
    teleportThreshold = 35, -- meters
    checkInterval = 2000 -- ms
}
