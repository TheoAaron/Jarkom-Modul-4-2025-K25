#!/bin/bash
# Shadow Client Configuration (Ubuntu)
# Connected to Switch6 via Gudur
# Subnet A11: 10.76.15.0/26

auto eth0
iface eth0 inet static
    address 10.76.15.3
    netmask 255.255.255.192
    gateway 10.76.15.1

ifconfig eth0 10.76.15.3 netmask 255.255.255.192
route add default gw 10.76.15.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Shadow client configured successfully"
echo "IP: 10.76.15.3/26"
echo "Gateway: 10.76.15.1 (Gudur)"
