#!/bin/bash
# Imrahil Client Configuration (Ubuntu)
# Connected to Switch9 via Ereinion
# Subnet A19: 10.76.15.160/28

auto eth0
iface eth0 inet static
    address 10.76.15.162
    netmask 255.255.255.240
    gateway 10.76.15.161

ifconfig eth0 10.76.15.162 netmask 255.255.255.240
route add default gw 10.76.15.161

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Imrahil client configured successfully"
echo "IP: 10.76.15.162/28"
echo "Gateway: 10.76.15.161 (Ereinion)"
