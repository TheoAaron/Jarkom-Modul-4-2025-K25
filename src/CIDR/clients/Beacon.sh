#!/bin/bash
# Beacon Client Configuration (Ubuntu)
# Connected to Switch1 via Amansul
# Subnet A1: 10.76.0.0/22

# Configure network interface
auto eth0
iface eth0 inet static
    address 10.76.0.2
    netmask 255.255.252.0
    gateway 10.76.0.1

# Apply configuration
ifconfig eth0 10.76.0.2 netmask 255.255.252.0
route add default gw 10.76.0.1

# DNS Configuration (optional)
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Beacon client configured successfully"
echo "IP: 10.76.0.2/22"
echo "Gateway: 10.76.0.1 (Switch1)"
