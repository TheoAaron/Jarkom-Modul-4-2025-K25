#!/bin/bash
# Router Valmar Configuration

# Connection to Switch12 for A20 subnet
ip addr add 10.76.18.1/27 dev eth0
ip link set eth0 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing - add route to backbone
ip route add 0.0.0.0/0 via 10.76.18.30 dev eth0
