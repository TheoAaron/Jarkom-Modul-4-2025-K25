#!/bin/bash
# Router Erain Configuration - VLSM (Ubuntu)
# Connects to Switch9 (Balrog/Gothmog/Thranduil) and Switch2 (Melkor/Khazad)

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.210
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.10.1
	netmask 255.255.254.0

auto eth2
iface eth2 inet static
	address 10.76.8.1
	netmask 255.255.254.0

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
# Interface to Mordor (A6: 10.76.15.208/30)
ip addr add 10.76.15.210/30 dev eth0
ip link set eth0 up

# Interface to Switch9 - Balrog, Gothmog, Thranduil (A9: 10.76.10.0/23)
ip addr add 10.76.10.1/23 dev eth1
ip link set eth1 up

# Interface to Switch2 - Melkor, Khazad (A10: 10.76.8.0/23)
ip addr add 10.76.8.1/23 dev eth2
ip link set eth2 up

# Static routes
# Default route to Mordor
ip route add default via 10.76.15.209 dev eth0

echo "Erain router configured successfully"
