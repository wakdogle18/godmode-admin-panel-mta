# 🛡️ GODMODE ADMIN PANEL – Multi Theft Auto: San Andreas

> 🔥 Panel Admin modern & overpower untuk server MTA:SA  
> Menggunakan teknologi **CEF UI + MySQL + Discord Webhook + Anti-Cheat AI + Replay System**

---

## 🎯 FITUR UTAMA

- ✅ CEF UI Modern (HTML5 / CSS / JS)
- ✅ Sistem Rank & Permission Admin
- ✅ Troll Tools: Screamer, Meteor, Mind Control, Invert Controls
- ✅ Spectate, Cloak, Freeze Time, Permadeath
- ✅ AI-Based Cheat Detection (Teleport, Speed, Jump)
- ✅ Replay System 15 detik terakhir (export `.json`)
- ✅ Sistem `/report` + Unban Request + Discord Notification
- ✅ Webhook Discord (full event log)
- ✅ Battle Mode (1v1 admin vs player)
- ✅ Web Dashboard (optional)

---

## 📁 STRUKTUR RESOURCE

godmode-admin-panel-mta/
├── mta_resources/
│ └── advanced_admin/
│ ├── client/
│ ├── server/
│ ├── shared/
│ ├── utils/
│ ├── html/
│ ├── sounds/
│ ├── replays/
│ └── meta.xml
├── sql/
│ └── mtasa_admin.sql
├── README.md

yaml
Salin
Edit

---

## ⚙️ INSTALASI

1. Tempatkan folder `advanced_admin` ke `resources/`
2. Import database:
   ```bash
   mysql -u root -p your_database_name < sql/mtasa_admin.sql
Pastikan koneksi MySQL terhubung di Lua:

lua
Salin
Edit
dbConnect("mysql", "dbname=...;host=...;port=...;charset=utf8", "username", "password", "share=1")
Tambahkan resource ke mtaserver.conf:

xml
Salin
Edit
<resource src="advanced_admin" startup="1" protected="0" />
Jalankan server, dan tekan F7 untuk membuka admin panel.

🧠 SISTEM RANK DAN IZIN
Edit file: shared/config.lua

lua
Salin
Edit
adminRanks = {
  ["Helper"] = 1,
  ["Moderator"] = 2,
  ["Admin"] = 3,
  ["SuperAdmin"] = 4,
  ["Owner"] = 5
}

adminPermissions = {
  kick = 2,
  freeze = 2,
  slap = 1,
  teleport = 3,
  useGodMode = 4,
  viewReports = 2
}
Untuk set rank player:

lua
Salin
Edit
setAccountData(getPlayerAccount(player), "admin:rank", "Admin")
⌨️ KONTROL DEFAULT
Tombol	Fungsi
F7	Toggle Admin Panel UI

📡 DISCORD INTEGRATION
Buka server/webhook.lua

Masukkan Webhook Discord:

lua
Salin
Edit
DISCORD_WEBHOOK_URL = "https://discord.com/api/webhooks/..."
Webhook bisa dibuat dari:
Server Settings > Integrations > Webhooks > New Webhook

🔐 SISTEM CHEAT DETECTION
🚨 Teleport / abnormal movement

🏃 Speedhack

🦘 Super Jump

Semua dilog otomatis ke DB + Discord

🎥 SISTEM REPLAY
Menyimpan 15 detik gerakan player terakhir

Disimpan sebagai file .json di /replays/

Gunakan command:

lua
Salin
Edit
/savereplay PlayerName
📦 DATABASE YANG DIGUNAKAN
📄 sql/mtasa_admin.sql berisi:

admin_logs → log aktivitas admin

player_reports → laporan /report

cheater_logs → hasil deteksi anti-cheat

unban_requests → request unban

admin_users → dashboard web login (opsional)

🌐 DASHBOARD WEB (OPSIONAL)
Fitur mendatang:

Login Admin ke dashboard

Statistik online, aktifitas log

Real-time stream + monitoring

Approve/reject ban appeals

✅ FITUR LAIN
Fitur	Status
CEF Panel	✅ Ready
Troll Tools	✅ Ready
Replay System	✅ Ready
Discord Webhook	✅ Ready
AI Detection	✅ Ready
Ban Appeal Web	🔜 Soon
OBS Overlay Mode	🔜 Soon
Web Dashboard	🔜 Soon

🧾 LISENSI
MIT License – Bebas digunakan, dimodifikasi, dan disebarkan dengan mencantumkan kredit.

🤝 KREDIT
Dikembangkan oleh: Multi Theft Auto Script Master
Direquest oleh: @wakdogle18

💥 Ini adalah panel admin yang bukan hanya OP — tapi GODMODE.
Selamat mengatur dunia server-mu, Bos!

yaml
Salin
Edit






