#!/bin/bash
# Client Silmarils Configuration - CIDR (Ubuntu)
# Subnet A18: 10.76.4.0/22

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.4.3
	netmask 255.255.252.0
	gateway 10.76.4.1
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

ip addr add 10.76.4.3/22 dev eth0
ip link set eth0 up
ip route add default via 10.76.4.1 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Silmarils CIDR configured - IP: 10.76.4.3/22, Gateway: 10.76.4.1"
