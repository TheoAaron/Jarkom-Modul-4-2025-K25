#!/bin/bash
# Client Elrond Configuration - VLSM (Ubuntu)
# Connected to Switch2 via Amroth
# Subnet A16: 10.76.15.0/26

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.3
	netmask 255.255.255.192
	gateway 10.76.15.1
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

ip addr add 10.76.15.3/26 dev eth0
ip link set eth0 up
ip route add default via 10.76.15.1 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "Elrond configured successfully - IP: 10.76.15.3/26, Gateway: 10.76.15.1"
