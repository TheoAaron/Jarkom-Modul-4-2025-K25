#!/bin/bash
# Elrond Client Configuration (Ubuntu)
# Connected to Switch8 via Eregion
# Subnet A13: 10.76.0.0/25

auto eth0
iface eth0 inet static
    address 10.76.0.6
    netmask 255.255.255.128
    gateway 10.76.0.1

ifconfig eth0 10.76.0.6 netmask 255.255.255.128
route add default gw 10.76.0.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Elrond client configured successfully"
echo "IP: 10.76.0.6/25"
echo "Gateway: 10.76.0.1 (Eregion)"
