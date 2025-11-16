#!/bin/bash
# Client Edhil Configuration - CIDR (Ubuntu)
# Subnet A8: 10.76.14.128/25

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.14.131
	netmask 255.255.255.128
	gateway 10.76.14.129
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

ip addr add 10.76.14.131/25 dev eth0
ip link set eth0 up
ip route add default via 10.76.14.129 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Edhil CIDR configured - IP: 10.76.14.131/25, Gateway: 10.76.14.129"
