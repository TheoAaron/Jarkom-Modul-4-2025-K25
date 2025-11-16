#!/bin/bash
# Client Mirdain Configuration - CIDR (Ubuntu)
# Subnet A11: 10.76.0.0/22

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.0.2
	netmask 255.255.252.0
	gateway 10.76.0.1
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

ip addr add 10.76.0.2/22 dev eth0
ip link set eth0 up
ip route add default via 10.76.0.1 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Mirdain CIDR configured - IP: 10.76.0.2/22, Gateway: 10.76.0.1"
