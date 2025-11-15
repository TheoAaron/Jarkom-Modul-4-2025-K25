#!/bin/bash
# Morgul Client Configuration (Ubuntu)
# Connected to Switch9 via Ereinion
# Subnet A19: 10.76.15.160/28

auto eth0
iface eth0 inet static
    address 10.76.15.164
    netmask 255.255.255.240
    gateway 10.76.15.161

ifconfig eth0 10.76.15.164 netmask 255.255.255.240
route add default gw 10.76.15.161

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Morgul client configured successfully"
echo "IP: 10.76.15.164/28"
echo "Gateway: 10.76.15.161 (Ereinion)"
