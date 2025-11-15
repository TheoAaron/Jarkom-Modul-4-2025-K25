#!/bin/bash
# Khazad Client Configuration (Ubuntu)
# Connected to Switch7 via Numenor
# Subnet A12: 10.76.15.64/26

auto eth0
iface eth0 inet static
    address 10.76.15.67
    netmask 255.255.255.192
    gateway 10.76.15.65

ifconfig eth0 10.76.15.67 netmask 255.255.255.192
route add default gw 10.76.15.65

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Khazad client configured successfully"
echo "IP: 10.76.15.67/26"
echo "Gateway: 10.76.15.65 (Numenor)"
