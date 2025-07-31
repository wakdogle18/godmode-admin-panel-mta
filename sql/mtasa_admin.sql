-- Tabel log admin
CREATE TABLE IF NOT EXISTS admin_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    admin VARCHAR(64),
    action VARCHAR(64),
    target VARCHAR(64),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel laporan pemain
CREATE TABLE IF NOT EXISTS player_reports (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reporter VARCHAR(64),
    reported VARCHAR(64),
    reason TEXT,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel log cheater
CREATE TABLE IF NOT EXISTS cheater_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(64),
    reason TEXT,
    time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel unban request (future feature)
CREATE TABLE IF NOT EXISTS unban_requests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serial VARCHAR(128),
    reason TEXT,
    status ENUM('pending','approved','rejected') DEFAULT 'pending',
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel user session / dashboard login (optional)
CREATE TABLE IF NOT EXISTS admin_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(64),
    password_hash TEXT,
    rank VARCHAR(32),
    last_login TIMESTAMP
);
