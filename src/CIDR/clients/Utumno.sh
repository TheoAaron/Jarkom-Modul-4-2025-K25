#!/bin/bash
# Client Utumno Configuration - CIDR (Ubuntu)
# Subnet A23: 10.76.15.64/26

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.68
	netmask 255.255.255.192
	gateway 10.76.15.65
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

ip addr add 10.76.15.68/26 dev eth0
ip link set eth0 up
ip route add default via 10.76.15.65 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Utumno CIDR configured - IP: 10.76.15.68/26, Gateway: 10.76.15.65"
