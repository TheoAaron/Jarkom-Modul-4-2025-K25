#!/bin/bash
# Router Amroth Configuration - VLSM (Ubuntu)
# Connects Minastir to Switch2 (Erendis, Elrond) and Switch1 (Morgoth, Throne, Erebor)

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.218
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.15.1
	netmask 255.255.255.192

auto eth2
iface eth2 inet static
	address 10.76.15.177
	netmask 255.255.255.248

auto eth3
iface eth3 inet static
	address 10.76.15.225
	netmask 255.255.255.252

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
# Interface to Minastir (A13: 10.76.15.216/30)
ip addr add 10.76.15.218/30 dev eth0
ip link set eth0 up

# Interface to Switch2 - Erendis, Elrond (A16: 10.76.15.0/26)
ip addr add 10.76.15.1/26 dev eth1
ip link set eth1 up

# Interface to Switch1 - Morgoth, Throne (A15: 10.76.15.176/29)
ip addr add 10.76.15.177/29 dev eth2
ip link set eth2 up

# Interface to Throne-Erebor link (A17: 10.76.15.224/30)
ip addr add 10.76.15.225/30 dev eth3
ip link set eth3 up

# Static routes
# Default route to Minastir
ip route add default via 10.76.15.217 dev eth0

# Route to Melkor, Khazad - need to check actual topology
ip route add 10.76.8.0/23 via 10.76.15.217 dev eth0

echo "Amroth router configured successfully"
