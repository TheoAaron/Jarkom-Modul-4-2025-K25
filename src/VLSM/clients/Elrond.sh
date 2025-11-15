#!/bin/bash
# Client Elrond Configuration
# Subnet A3: 10.76.4.64/26

ip addr add 10.76.4.67/26 dev eth0
ip link set eth0 up
ip route add default via 10.76.4.65

echo "Elrond configured with IP 10.76.4.67/26"
