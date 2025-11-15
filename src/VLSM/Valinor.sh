#!/bin/bash
# Router Valinor Configuration

# A22: Fornost+Amansul+Valinor (connection to backbone)
ip addr add 10.76.22.3/30 dev eth0
ip link set eth0 up

# Connection to Switch10 for A21 subnet
ip addr add 10.76.20.1/23 dev eth1
ip link set eth1 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.22.1 dev eth0
