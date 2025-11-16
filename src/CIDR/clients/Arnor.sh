#!/bin/bash
# Client Arnor Configuration - CIDR (Ubuntu)
# Subnet A22: 10.76.15.128/27

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.131
	netmask 255.255.255.224
	gateway 10.76.15.129
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

ip addr add 10.76.15.131/27 dev eth0
ip link set eth0 up
ip route add default via 10.76.15.129 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Arnor CIDR configured - IP: 10.76.15.131/27, Gateway: 10.76.15.129"
