#!/bin/bash
# Grond Client Configuration (Ubuntu)
# Connected to Switch3 via Morgoth
# Subnet A8: 10.76.4.0/23

auto eth0
iface eth0 inet static
    address 10.76.4.3
    netmask 255.255.254.0
    gateway 10.76.4.1

ifconfig eth0 10.76.4.3 netmask 255.255.254.0
route add default gw 10.76.4.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Grond client configured successfully"
echo "IP: 10.76.4.3/23"
echo "Gateway: 10.76.4.1 (Morgoth)"
