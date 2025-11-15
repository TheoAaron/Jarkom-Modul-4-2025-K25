#!/bin/bash
# Client Silmarils Configuration
# Subnet A1: 10.76.0.0/22

ip addr add 10.76.0.3/22 dev eth0
ip link set eth0 up
ip route add default via 10.76.0.1

echo "Silmarils configured with IP 10.76.0.3/22"
