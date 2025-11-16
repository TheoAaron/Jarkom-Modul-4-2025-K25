#!/bin/bash
# Client Mirkwood Configuration - VLSM (Ubuntu)
# Connected to Switch4 via Eregion
# Subnet A2: 10.76.14.0/25

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.14.2
	netmask 255.255.255.128
	gateway 10.76.14.1
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Configure network interface
ip addr add 10.76.14.2/25 dev eth0
ip link set eth0 up

# Set default gateway
ip route add default via 10.76.14.1 dev eth0

# DNS configuration
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Mirkwood configured successfully - IP: 10.76.14.2/25, Gateway: 10.76.14.1"
