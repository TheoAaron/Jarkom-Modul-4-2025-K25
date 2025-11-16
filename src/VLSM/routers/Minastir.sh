#!/bin/bash
# Router Minastir Configuration - VLSM (Ubuntu)
# Connects Amansul to Amroth and Anor

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.214
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.15.217
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 10.76.15.221
	netmask 255.255.255.252

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
# Interface to Amansul (A12: 10.76.15.212/30)
ip addr add 10.76.15.214/30 dev eth0
ip link set eth0 up

# Interface to Amroth (A13: 10.76.15.216/30)
ip addr add 10.76.15.217/30 dev eth1
ip link set eth1 up

# Interface to Anor (A14: 10.76.15.220/30)
ip addr add 10.76.15.221/30 dev eth2
ip link set eth2 up

# Static routes
# Default route to Amansul
ip route add default via 10.76.15.213 dev eth0

# Routes via Amroth
ip route add 10.76.8.0/23 via 10.76.15.218 dev eth1         # A10 (Melkor, Khazad)
ip route add 10.76.15.0/26 via 10.76.15.218 dev eth1        # A16 (Erendis, Elrond)
ip route add 10.76.15.176/29 via 10.76.15.218 dev eth1      # A15 (Morgoth, Throne)
ip route add 10.76.15.224/30 via 10.76.15.218 dev eth1      # A17 (Throne-Erebor)

# Routes via Anor
ip route add 10.76.4.0/22 via 10.76.15.222 dev eth2         # A18 (Beacon, Silmarils)

echo "Minastir router configured successfully"
