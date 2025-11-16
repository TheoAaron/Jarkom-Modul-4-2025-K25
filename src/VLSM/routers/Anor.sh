#!/bin/bash
# Router Anor Configuration - VLSM (Ubuntu)
# Connects Minastir to Switch3 (Beacon/Silmarils)

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.222
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.4.1
	netmask 255.255.252.0

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
# Interface to Minastir (A14: 10.76.15.220/30)
ip addr add 10.76.15.222/30 dev eth0
ip link set eth0 up

# Interface to Switch3 - Beacon, Silmarils (A18: 10.76.4.0/22)
ip addr add 10.76.4.1/22 dev eth1
ip link set eth1 up

# Static routes
# Default route to Minastir
ip route add default via 10.76.15.221 dev eth0

echo "Anor router configured successfully"
