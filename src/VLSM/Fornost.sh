#!/bin/bash
# Router Fornost Configuration

# A22: Fornost+Amansul+Valinor
ip addr add 10.76.22.2/30 dev eth0
ip link set eth0 up

# A23: Amansul-Fornost
ip addr add 10.76.22.6/30 dev eth1
ip link set eth1 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.22.1 dev eth0
