#!/bin/bash
# Client Shadow Configuration - VLSM (Ubuntu)
# Connected to Switch12 via Valmar
# Subnet A21: 10.76.12.0/23

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.12.2
	netmask 255.255.254.0
	gateway 10.76.12.1
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

ip addr add 10.76.12.2/23 dev eth0
ip link set eth0 up
ip route add default via 10.76.12.1 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Shadow configured successfully - IP: 10.76.12.2/23, Gateway: 10.76.12.1"
