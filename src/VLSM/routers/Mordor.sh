#!/bin/bash
# Router Mordor Configuration - VLSM (Ubuntu)
# Connects Numenor to Erain

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.206
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.15.209
	netmask 255.255.255.252

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
# Interface to Numenor (A5: 10.76.15.204/30)
ip addr add 10.76.15.206/30 dev eth0
ip link set eth0 up

# Interface to Erain (A6: 10.76.15.208/30)
ip addr add 10.76.15.209/30 dev eth1
ip link set eth1 up

# Static routes
# Default route to Numenor
ip route add default via 10.76.15.205 dev eth0

# Route to Switch9 via Erain
ip route add 10.76.10.0/23 via 10.76.15.210 dev eth1        # A9 (Balrog, Gothmog, Thranduil)

echo "Mordor router configured successfully"
