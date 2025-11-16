#!/bin/bash
# Client Erebor Configuration - CIDR (Ubuntu)
# Subnet A17: 10.76.15.224/30

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.225
	netmask 255.255.255.252
	gateway 10.76.15.226
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

ip addr add 10.76.15.225/30 dev eth0
ip link set eth0 up
ip route add default via 10.76.15.226 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Erebor CIDR configured - IP: 10.76.15.225/30, Gateway: 10.76.15.226"
