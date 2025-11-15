#!/bin/bash
# Erendis Client Configuration (Ubuntu)
# Connected to Switch2 via Amroth
# Subnet A3: 10.76.7.0/26

auto eth0
iface eth0 inet static
    address 10.76.7.2
    netmask 255.255.255.192
    gateway 10.76.7.1

ifconfig eth0 10.76.7.2 netmask 255.255.255.192
route add default gw 10.76.7.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Erendis client configured successfully"
echo "IP: 10.76.7.2/26"
echo "Gateway: 10.76.7.1 (Amroth)"
