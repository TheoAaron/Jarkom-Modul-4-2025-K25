# Jarkom Modul 4 - VLSM Network Configuration
## Kelompok K25

| Nama                        | NRP        |
| --------------------------- | ---------- |
| Syifa Nurul Alfiah          | 5027241019 |
| Theodorus Aaron Ugraha      | 5027241056 |

### Topologi Jaringan
Base IP: `10.76.0.0`
Method: VLSM (Variable Length Subnet Masking)

---

# Network Configuration Guide - VLSM (GNS3) & CIDR (Cisco)

## Overview
Proyek ini berisi konfigurasi jaringan untuk implementasi VLSM di GNS3 dan CIDR di Cisco Packet Tracer, menggunakan network base `10.76.0.0/20`.

---

## VLSM Configuration (GNS3 - Ubuntu)

### Struktur Subnet VLSM
Berdasarkan file `VLSM.csv`, subnet dialokasikan secara efisien berdasarkan kebutuhan host.

### Router Configuration Pattern

#### 1. **Amansul** (Router Pusat)
```bash
# Interfaces:
# eth0: to Eregion (A1: 10.76.15.193/30)
# eth1: to Minastir (A12: 10.76.15.213/30)
# eth2: to Fornost (A19: 10.76.15.229/30)
```

#### 2. **Eregion**
```bash
# Interfaces:
# eth0: to Amansul (A1: 10.76.15.194/30)
# eth1: to Numenor (A3: 10.76.15.197/30)
```

#### 3. **Numenor**
```bash
# Interfaces:
# eth0: to Eregion (A3: 10.76.15.198/30)
# eth1: to Gudur (A4: 10.76.15.201/30)
# eth2: to Mordor (A5: 10.76.15.205/30)
```

#### 4. **Minastir**
```bash
# Interfaces:
# eth0: to Amansul (A12: 10.76.15.214/30)
# eth1: to Anor (A14: 10.76.15.221/30)
# eth2: to Amroth (A13: 10.76.15.217/30)
```

#### 5. **Fornost**
```bash
# Interfaces:
# eth0: to Amansul (A19: 10.76.15.230/30)
# eth1: to Switch13/Valinor (A20: 10.76.15.185/29)
# eth2: to Switch5/Arthendain (A10: 10.76.8.1/23)
```

### Client Configuration Pattern
```bash
#!/bin/bash
# Client Configuration Example

# Set IP address
ip addr add <IP_ADDRESS>/<NETMASK> dev eth0
ip link set eth0 up

# Set default gateway
ip route add default via <GATEWAY_IP> dev eth0

# Set DNS (optional)
echo "nameserver 8.8.8.8" > /etc/resolv.conf
```

### VLSM Subnet Allocation Table

| Subnet | Network | Netmask | Range | Usage |
|--------|---------|---------|-------|-------|
| A11 | 10.76.0.0 | /22 | 10.76.0.1 - 10.76.3.254 | Mirdain+Arthedain (874 host) |
| A18 | 10.76.4.0 | /22 | 10.76.4.1 - 10.76.7.254 | Beacon+Silmarils (660 host) |
| A10 | 10.76.8.0 | /23 | 10.76.8.1 - 10.76.9.254 | Melkor+Khazad (502 host) |
| A9 | 10.76.10.0 | /23 | 10.76.10.1 - 10.76.11.254 | Balrog+Gothmog+Thranduil (469 host) |
| A21 | 10.76.12.0 | /23 | 10.76.12.1 - 10.76.13.254 | Shadow+Anarion+Lindon (298 host) |
| A2 | 10.76.14.0 | /25 | 10.76.14.1 - 10.76.14.126 | Mirkwood+Morgul (125 host) |
| A8 | 10.76.14.128 | /25 | 10.76.14.129 - 10.76.14.254 | Palantir+Edhil (119 host) |
| A16 | 10.76.15.0 | /26 | 10.76.15.1 - 10.76.15.62 | Erendis+Elrond (61 host) |
| A23 | 10.76.15.64 | /26 | 10.76.15.65 - 10.76.15.126 | Imrahil+Gwaith+Utumno (33 host) |
| A22 | 10.76.15.128 | /27 | 10.76.15.129 - 10.76.15.158 | Doriath+Arnor (27 host) |
| A7 | 10.76.15.160 | /28 | 10.76.15.161 - 10.76.15.174 | IronCrown+Grond+Hobbiton (13 host) |
| A15 | 10.76.15.176 | /29 | 10.76.15.177 - 10.76.15.182 | Morgoth+Throne (3 host) |
| A20 | 10.76.15.184 | /29 | 10.76.15.185 - 10.76.15.190 | Valinor+Valmar (3 host) |
| A1 | 10.76.15.192 | /30 | 10.76.15.193 - 10.76.15.194 | Amansul-Eregion (P2P) |
| A3 | 10.76.15.196 | /30 | 10.76.15.197 - 10.76.15.198 | Eregion-Numenor (P2P) |
| A4 | 10.76.15.200 | /30 | 10.76.15.201 - 10.76.15.202 | Numenor-Gudur (P2P) |
| A5 | 10.76.15.204 | /30 | 10.76.15.205 - 10.76.15.206 | Numenor-Mordor (P2P) |
| A6 | 10.76.15.208 | /30 | 10.76.15.209 - 10.76.15.210 | Mordor-Erain (P2P) |
| A12 | 10.76.15.212 | /30 | 10.76.15.213 - 10.76.15.214 | Amansul-Minastir (P2P) |
| A13 | 10.76.15.216 | /30 | 10.76.15.217 - 10.76.15.218 | Minastir-Amroth (P2P) |
| A14 | 10.76.15.220 | /30 | 10.76.15.221 - 10.76.15.222 | Minastir-Anor (P2P) |
| A17 | 10.76.15.224 | /30 | 10.76.15.225 - 10.76.15.226 | Throne-Erebor (P2P) |
| A19 | 10.76.15.228 | /30 | 10.76.15.229 - 10.76.15.230 | Amansul-Fornost (P2P) |

---

## CIDR Configuration (Cisco Packet Tracer)

### Struktur Penggabungan CIDR

CIDR menggunakan pendekatan bottom-up dengan penggabungan subnet berlevel.

#### Level I (B):
- B1 = A4 + A11 → 10.76.0.0/22
- B2 = A7 + A8 → 10.76.5.0/24
- B3 = A2 + A3 → 10.76.14.0/24
- B4 = A10 + A9 → 10.76.8.0/22
- B5 = A18 + A14 → 10.76.4.0/22
- B6 = A16 + A17 → 10.76.15.0/25
- B7 = A21 + A20 → 10.76.12.0/23
- B8 = A22 + A23 → 10.76.15.128/26

#### Level II (C):
- C1 = B4 + A6 → 10.76.8.0/22
- C2 = B1 + B2 → 10.76.0.0/22
- C3 = B6 + A15 → 10.76.15.0/25

#### Level III (D):
- D1 = C1 + C2 → 10.76.0.0/21

#### Level IV (E):
- E1 = B3 + D1 → 10.76.0.0/20
- E2 = B5 + C3 → 10.76.4.0/22
- E3 = B7 + B8 → 10.76.12.0/23

#### Level V (F):
- F1 = E1 + E2 → 10.76.0.0/20

#### Level VI (G):
- G1 = E3 + F1 → 10.76.0.0/20 (Final aggregation)

### Router Configuration for CIDR

Konfigurasi CIDR menggunakan agregasi routing untuk meminimalkan ukuran routing table.

```bash
# Contoh konfigurasi Amansul - CIDR
ip route add 10.76.0.0/20 via <next_hop>  # Aggregate all networks
```

---

## Implementation Steps

### For VLSM (GNS3):

1. **Setup Topology** di GNS3 sesuai dengan gambar topologi
2. **Copy Configuration Files** ke setiap node:
   ```bash
   # Di setiap router
   sudo bash /path/to/<router_name>.sh
   ```
3. **Test Connectivity**:
   ```bash
   ping <destination_ip>
   traceroute <destination_ip>
   ```

### For CIDR (Cisco Packet Tracer):

1. **Setup Topology** di Cisco Packet Tracer
2. **Configure Interfaces** menggunakan GUI atau CLI
3. **Add Static Routes** dengan agregasi CIDR
4. **Test Connectivity** menggunakan ping dan tracert

---

## Routing Strategy

### VLSM (Specific Routes):
- Menggunakan routing spesifik untuk setiap subnet
- Routing table lebih besar tetapi lebih presisi
- Cocok untuk troubleshooting detail

### CIDR (Aggregated Routes):
- Menggunakan route summarization
- Routing table lebih kecil dan efisien
- Cocok untuk jaringan besar dengan hierarki jelas

---

## Testing Commands

```bash
# Check interface status
ip addr show

# Check routing table
ip route show

# Test connectivity
ping -c 4 <destination_ip>

# Trace route
traceroute <destination_ip>

# Check IP forwarding
cat /proc/sys/net/ipv4/ip_forward

# Enable IP forwarding (if not enabled)
echo 1 > /proc/sys/net/ipv4/ip_forward
```

---

## Troubleshooting

### Common Issues:

1. **No connectivity between subnets**
   - Check IP forwarding is enabled
   - Verify routing table
   - Check interface status

2. **Partial connectivity**
   - Verify static routes are correct
   - Check next-hop addresses
   - Ensure no IP conflicts

3. **Gateway unreachable**
   - Verify gateway IP in client configuration
   - Check router interface is up
   - Verify subnet mask is correct

---

## Files Structure

```
src/
├── VLSM/              # GNS3 configurations
│   ├── Amansul.sh
│   ├── Eregion.sh
│   ├── Fornost.sh
│   ├── Minastir.sh
│   ├── Numenor.sh
│   ├── Gudur.sh
│   ├── Mordor.sh
│   ├── Erain.sh
│   ├── Anor.sh
│   ├── Amroth.sh
│   ├── Morgoth.sh
│   ├── Ereinion.sh
│   ├── Valinor.sh
│   ├── Valmar.sh
│   └── clients/       # Client configurations
│       ├── Beacon.sh
│       ├── Silmarils.sh
│       ├── Mirdain.sh
│       └── ...
└── CIDR/              # Cisco Packet Tracer configurations
    ├── Amansul.sh
    ├── Eregion.sh
    └── ...
```

---

## Notes

- **VLSM** lebih kompleks tetapi lebih efisien dalam penggunaan IP
- **CIDR** lebih sederhana dalam routing tetapi memerlukan planning awal yang baik
- Kedua metode menggunakan network base yang sama (10.76.0.0/20) tetapi dengan alokasi berbeda
- Untuk production, disarankan menggunakan dynamic routing (OSPF/BGP) dibanding static routing

---