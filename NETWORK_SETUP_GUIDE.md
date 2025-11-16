# Cara Konfigurasi Network di GNS3 dan Cisco Packet Tracer

## Untuk GNS3 (VLSM) dan Cisco Packet Tracer dengan Ubuntu Images

Setiap file konfigurasi (`.sh`) sekarang memiliki **DUA METODE** konfigurasi:

### **Metode 1: Persistent Configuration (Menggunakan /etc/network/interfaces)**

Konfigurasi ini akan **permanen** dan **otomatis aktif** setiap kali node di-restart.

#### Format yang sudah ditambahkan di setiap file:
```bash
# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.14.2
	netmask 255.255.255.128
	gateway 10.76.14.1
	up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

#### Cara menggunakan:

1. **Copy konfigurasi** bagian `/etc/network/interfaces` dari file `.sh`
2. **Edit file** `/etc/network/interfaces` di node:
   ```bash
   nano /etc/network/interfaces
   ```
3. **Paste** konfigurasi yang sudah dicopy
4. **Simpan** file (Ctrl+X, Y, Enter)
5. **Restart networking service**:
   ```bash
   /etc/init.d/networking restart
   ```
   atau
   ```bash
   systemctl restart networking
   ```
6. **ATAU restart node** untuk otomatis apply konfigurasi

**Keuntungan:**
- ✅ Konfigurasi **permanen** (tidak hilang saat restart)
- ✅ **Otomatis** aktif setiap boot
- ✅ Standar konfigurasi Debian/Ubuntu
- ✅ Gateway dan DNS otomatis ter-configure

---

### **Metode 2: Manual Configuration (Menggunakan ip commands)**

Konfigurasi ini untuk testing **sementara** dan akan **hilang** saat node di-restart.

#### Format yang sudah ada di setiap file:
```bash
ip addr add 10.76.14.2/25 dev eth0
ip link set eth0 up
ip route add default via 10.76.14.1 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

#### Cara menggunakan:

1. **Jalankan script** `.sh` langsung:
   ```bash
   chmod +x Mirkwood.sh
   ./Mirkwood.sh
   ```
2. **ATAU copy-paste** command manual satu per satu

**Keuntungan:**
- ✅ **Cepat** untuk testing
- ✅ Tidak perlu edit file system
- ✅ Langsung aktif tanpa restart

**Kekurangan:**
- ❌ **Tidak permanen** (hilang saat restart)
- ❌ Harus dijalankan ulang setiap boot

---

## Untuk Router (VLSM)

Router **harus menggunakan kedua metode** karena butuh:
1. **IP forwarding** yang persistent
2. **Static routes** yang kompleks

### Contoh untuk Router Amansul:

#### 1. Setup /etc/network/interfaces (Permanen)
```bash
nano /etc/network/interfaces
```

Tambahkan:
```bash
auto eth0
iface eth0 inet static
	address 10.76.15.193
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.15.213
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 10.76.15.229
	netmask 255.255.255.252
```

#### 2. Enable IP Forwarding (Permanen)
```bash
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p
```

#### 3. Setup Static Routes
Jalankan script `.sh` untuk menambahkan semua static routes:
```bash
chmod +x Amansul.sh
./Amansul.sh
```

**ATAU** buat file `/etc/network/if-up.d/routes` untuk static routes yang permanen.

---

## Verifikasi Konfigurasi

### Cek IP Address:
```bash
ip addr show
```

### Cek Routing Table:
```bash
ip route show
```

### Cek IP Forwarding (untuk router):
```bash
cat /proc/sys/net/ipv4/ip_forward
# Harus return: 1
```

### Test Koneksi ke Gateway:
```bash
ping <gateway_ip>
```

### Test Koneksi antar subnet:
```bash
ping 10.76.15.193  # Ping ke Amansul (central router)
```

### Trace Route:
```bash
traceroute <destination_ip>
```

---

## Troubleshooting

### Interface tidak UP setelah konfigurasi /etc/network/interfaces:
```bash
ifdown eth0
ifup eth0
```

### Routing tidak bekerja antar subnet:
1. **Cek IP forwarding di semua router:**
   ```bash
   cat /proc/sys/net/ipv4/ip_forward
   ```
   Jika hasilnya 0, enable dengan:
   ```bash
   echo 1 > /proc/sys/net/ipv4/ip_forward
   ```

2. **Cek static routes:**
   ```bash
   ip route show
   ```

3. **Cek gateway di client:**
   ```bash
   ip route | grep default
   ```

### DNS tidak bekerja:
```bash
cat /etc/resolv.conf
# Seharusnya ada: nameserver 192.168.122.1
```

Jika kosong:
```bash
echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

### Konfigurasi hilang setelah restart:
- Gunakan **Metode 1** (`/etc/network/interfaces`) untuk konfigurasi permanen
- Untuk static routes, tambahkan ke startup script atau gunakan `/etc/network/if-up.d/`

---

## Cisco Packet Tracer - Router Configuration

Untuk **router di Cisco Packet Tracer**, gunakan file `.txt` di folder `src/CIDR/routers/`:

1. **Buka router CLI**
2. **Masuk privileged mode:**
   ```cisco
   enable
   configure terminal
   ```
3. **Copy-paste** seluruh konfigurasi dari file `.txt`
4. **Save:**
   ```cisco
   end
   write memory
   ```

---

## Ringkasan Rekomendasi

| Node Type | Platform | Metode Recommended |
|-----------|----------|-------------------|
| **Client** | GNS3 | Metode 1 (`/etc/network/interfaces`) |
| **Router** | GNS3 | Metode 1 + jalankan script untuk routes |
| **Client** | Cisco PT | Metode 1 (`/etc/network/interfaces`) |
| **Router** | Cisco PT | Copy config dari file `.txt` |

---

## Testing Connectivity Antar Node

Setelah semua konfigurasi selesai:

### 1. Test dari Client ke Gateway:
```bash
# Dari Mirkwood
ping 10.76.14.1  # Gateway Eregion
```

### 2. Test dari Client ke Router Pusat:
```bash
# Dari Mirkwood
ping 10.76.15.193  # Amansul (central router)
```

### 3. Test antar Client beda subnet:
```bash
# Dari Mirkwood (A2) ke Beacon (A18)
ping 10.76.4.2
traceroute 10.76.4.2
# Route: Mirkwood → Eregion → Amansul → Minastir → Anor → Beacon
```

### 4. Test dari ujung ke ujung:
```bash
# Dari Erebor ke Utumno (terjauh)
ping 10.76.15.68
traceroute 10.76.15.68
# Route: Erebor → Throne → Amroth → Minastir → Amansul → Fornost → Valinor → Valmar → Utumno
```

Jika semua test berhasil, **network sudah terkonfigurasi dengan benar** dan semua node bisa saling berkomunikasi! ✅
