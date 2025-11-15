#!/bin/bash
# Doriath Client Configuration (Ubuntu)
# Connected to Switch10 via Ereinion
# Subnet A20: 10.76.15.128/27

auto eth0
iface eth0 inet static
    address 10.76.15.129
    netmask 255.255.255.224
    gateway 10.76.15.128

ifconfig eth0 10.76.15.129 netmask 255.255.255.224
route add default gw 10.76.15.128

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Doriath client configured successfully"
echo "IP: 10.76.15.129/27"
echo "Gateway: 10.76.15.128 (Ereinion)"
