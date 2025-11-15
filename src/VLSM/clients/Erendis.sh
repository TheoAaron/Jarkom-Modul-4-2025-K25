#!/bin/bash
# Client Erendis Configuration
# Subnet A3: 10.76.4.64/26

ip addr add 10.76.4.66/26 dev eth0
ip link set eth0 up
ip route add default via 10.76.4.65

echo "Erendis configured with IP 10.76.4.66/26"
