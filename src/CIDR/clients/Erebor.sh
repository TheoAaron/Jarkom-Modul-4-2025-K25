#!/bin/bash
# Erebor Client Configuration (Ubuntu)
# Connected to Minastir
# Subnet A2: 10.76.5.0/24

auto eth0
iface eth0 inet static
    address 10.76.5.2
    netmask 255.255.255.0
    gateway 10.76.5.1

ifconfig eth0 10.76.5.2 netmask 255.255.255.0
route add default gw 10.76.5.1

echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Erebor client configured successfully"
echo "IP: 10.76.5.2/24"
echo "Gateway: 10.76.5.1 (Minastir)"
