#!/bin/bash
# Arnor Client Configuration (Ubuntu)
# Connected to Switch11 via Valmar
# Subnet A21: 10.76.13.0/24

auto eth0
iface eth0 inet static
    address 10.76.13.3
    netmask 255.255.255.0
    gateway 10.76.13.1

ifconfig eth0 10.76.13.3 netmask 255.255.255.0
route add default gw 10.76.13.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Arnor client configured successfully"
echo "IP: 10.76.13.3/24"
echo "Gateway: 10.76.13.1 (Valmar)"
