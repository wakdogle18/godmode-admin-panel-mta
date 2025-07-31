# 🛡️ GODMODE ADMIN PANEL – Multi Theft Auto: San Andreas

> 🔥 Panel Admin modern & overpower untuk server MTA:SA  
> Menggunakan **CEF UI + MySQL + Discord Webhook + Anti-Cheat AI + Replay System**

---

## 🎯 Fitur Utama

- **CEF UI Modern** (HTML5 / CSS / JS)
- **Sistem Rank & Permission Admin**
- **Troll Tools:** Screamer, Meteor, Mind Control, Invert Controls
- **Spectate, Cloak, Freeze Time, Permadeath**
- **AI-Based Cheat Detection:** Teleport, Speed, Jump
- **Replay System:** 15 detik terakhir (export `.json`)
- **Sistem `/report` + Unban Request + Discord Notification**
- **Webhook Discord:** Full event log
- **Battle Mode:** 1v1 admin vs player
- **Web Dashboard (opsional)**

---

## 📁 Struktur Resource

```
godmode-admin-panel-mta/
├── mta_resources/
│   └── advanced_admin/
│       ├── client/
│       ├── server/
│       ├── shared/
│       ├── utils/
│       ├── html/
│       ├── sounds/
│       ├── replays/
│       └── meta.xml
├── sql/
│   └── mtasa_admin.sql
├── README.md
```

---

## ⚙️ Instalasi

1. **Copy** folder `advanced_admin` ke `resources/`
2. **Import database:**
   ```bash
   mysql -u root -p your_database_name < sql/mtasa_admin.sql
   ```
3. **Pastikan koneksi MySQL di Lua:**
   ```lua
   dbConnect("mysql", "dbname=...;host=...;port=...;charset=utf8", "username", "password", "share=1")
   ```
4. **Tambahkan resource ke `mtaserver.conf`:**
   ```xml
   <resource src="advanced_admin" startup="1" protected="0" />
   ```
5. **Jalankan server** dan tekan `F7` untuk membuka admin panel.

---

## 🧠 Sistem Rank & Izin

Edit file: `shared/config.lua`

```lua
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
```

**Set rank player:**
```lua
setAccountData(getPlayerAccount(player), "admin:rank", "Admin")
```

---

## ⌨️ Kontrol Default

| Tombol | Fungsi                |
|--------|-----------------------|
| F7     | Toggle Admin Panel UI |

---

## 📡 Integrasi Discord

Edit `server/webhook.lua` dan masukkan Webhook Discord:

```lua
DISCORD_WEBHOOK_URL = "https://discord.com/api/webhooks/..."
```

Buat webhook di:  
**Server Settings > Integrations > Webhooks > New Webhook**

---

## 🔐 Sistem Cheat Detection

- **Teleport / abnormal movement**
- **Speedhack**
- **Super Jump**

Semua log otomatis ke DB & Discord.

---

## 🎥 Sistem Replay

Menyimpan 15 detik gerakan player terakhir sebagai file `.json` di `/replays/`.

**Command:**
```lua
/savereplay PlayerName
```

---

## 📦 Database

File `sql/mtasa_admin.sql` berisi tabel:

- `admin_logs` → log aktivitas admin
- `player_reports` → laporan `/report`
- `cheater_logs` → hasil deteksi anti-cheat
- `unban_requests` → request unban
- `admin_users` → dashboard web login (opsional)

---

## 🌐 Dashboard Web (Opsional)

**Fitur mendatang:**
- Login Admin ke dashboard
- Statistik online & aktivitas log
- Real-time stream & monitoring
- Approve/reject ban appeals

---

## ✅ Status Fitur

| Fitur             | Status   |
|-------------------|----------|
| CEF Panel         | ✅ Ready |
| Troll Tools       | ✅ Ready |
| Replay System     | ✅ Ready |
| Discord Webhook   | ✅ Ready |
| AI Detection      | ✅ Ready |
| Ban Appeal Web    | 🔜 Soon  |
| OBS Overlay Mode  | 🔜 Soon  |
| Web Dashboard     | 🔜 Soon  |

---

## 🧾 Lisensi

MIT License – Bebas digunakan, dimodifikasi, dan disebarkan dengan mencantumkan kredit.

---

## 🤝 Kredit

- **Dikembangkan oleh:** Multi Theft Auto Script Master
- **Direquest oleh:** @wakdogle18

---

💥 Ini adalah panel admin yang bukan hanya OP — tapi GODMODE.  
Selamat mengatur dunia server-mu, Bos!