#!/bin/bash
# Router Fornost Configuration - VLSM (Ubuntu)
# Connects Amansul to Switch13 (connects to Valinor)

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.230
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.15.189
	netmask 255.255.255.252

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
# Interface to Amansul (A19: 10.76.15.228/30)
ip addr add 10.76.15.230/30 dev eth0
ip link set eth0 up

# Interface to Switch13 - Valinor, Valmar (A20: 10.76.15.184/29)
ip addr add 10.76.15.185/29 dev eth1
ip link set eth1 up

# Static routes
# Default route to Amansul
ip route add default via 10.76.15.229 dev eth0

# Routes via Valinor/Valmar
ip route add 10.76.12.0/23 via 10.76.15.186 dev eth1        # A21 (Shadow, Anarion, Lindon) - via Valmar
ip route add 10.76.15.64/26 via 10.76.15.186 dev eth1       # A23 (Imrahil, Gwaith, Utumno) - via Valmar
ip route add 10.76.15.128/27 via 10.76.15.186 dev eth1      # A22 (Doriath, Arnor) - via Valmar

echo "Fornost router configured successfully"
