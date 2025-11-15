#!/bin/bash
# Melkor Client Configuration (Ubuntu)
# Connected to Switch4 via Anor
# Subnet A9: 10.76.6.0/23

auto eth0
iface eth0 inet static
    address 10.76.6.2
    netmask 255.255.254.0
    gateway 10.76.6.1

ifconfig eth0 10.76.6.2 netmask 255.255.254.0
route add default gw 10.76.6.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Melkor client configured successfully"
echo "IP: 10.76.6.2/23"
echo "Gateway: 10.76.6.1 (Anor)"
