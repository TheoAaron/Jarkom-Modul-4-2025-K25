#!/bin/bash
# Client IronCrown Configuration - VLSM (Ubuntu)
# Connected to Switch5 via Gudur
# Subnet A7: 10.76.15.160/28

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.162
	netmask 255.255.255.240
	gateway 10.76.15.161
	up echo nameserver 192.168.122.1 > /etc/resolv.conf

ip addr add 10.76.15.162/28 dev eth0
ip link set eth0 up
ip route add default via 10.76.15.161 dev eth0
echo "nameserver 192.168.122.1" > /etc/resolv.conf

echo "IronCrown configured successfully - IP: 10.76.15.162/28, Gateway: 10.76.15.161"
