#!/bin/bash
# Client Erebor Configuration
# Subnet A2: 10.76.4.0/30

ip addr add 10.76.4.1/30 dev eth0
ip link set eth0 up
ip route add default via 10.76.4.2

echo "Erebor configured with IP 10.76.4.1/30"
