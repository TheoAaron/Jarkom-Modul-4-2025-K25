#!/bin/bash
# Client Throne Configuration - VLSM (Ubuntu)
# Connected to Switch1 via Amroth, also connects to Erebor
# Subnet A15: 10.76.15.176/29

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.179
	netmask 255.255.255.248
	gateway 10.76.15.177
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

auto eth1
iface eth1 inet static
	address 10.76.15.226
	netmask 255.255.255.252

ip addr add 10.76.15.179/29 dev eth0
ip link set eth0 up

# Interface to Erebor (A17: 10.76.15.224/30)
ip addr add 10.76.15.226/30 dev eth1
ip link set eth1 up

# Default route
ip route add default via 10.76.15.177 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Throne configured successfully - IP: 10.76.15.179/29, Gateway: 10.76.15.177"
