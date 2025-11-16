#!/bin/bash
# Client Morgoth Configuration - CIDR (Ubuntu)
# Subnet A15: 10.76.15.176/29

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.178
	netmask 255.255.255.248
	gateway 10.76.15.177
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

ip addr add 10.76.15.178/29 dev eth0
ip link set eth0 up
ip route add default via 10.76.15.177 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Morgoth CIDR configured - IP: 10.76.15.178/29, Gateway: 10.76.15.177"
