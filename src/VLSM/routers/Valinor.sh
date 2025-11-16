#!/bin/bash
# Router Valinor Configuration - VLSM (Ubuntu)
# Node in Switch13, connects to Valmar

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.190
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.15.185
	netmask 255.255.255.252

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
# Interface to Switch13/Fornost (A20: 10.76.15.184/29)
ip addr add 10.76.15.186/29 dev eth0
ip link set eth0 up

# Static routes
# Default route to Fornost
ip route add default via 10.76.15.185 dev eth0

# Routes via Valmar (if Valmar is a separate router)
ip route add 10.76.12.0/23 via 10.76.15.187 dev eth0        # A21 (Shadow, Anarion, Lindon)
ip route add 10.76.15.64/26 via 10.76.15.187 dev eth0       # A23 (Imrahil, Gwaith, Utumno)
ip route add 10.76.15.128/27 via 10.76.15.187 dev eth0      # A22 (Doriath, Arnor)

echo "Valinor configured successfully"
