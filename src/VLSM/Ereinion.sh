#!/bin/bash
# Router Ereinion Configuration

# Connection to Switch11 for A19 subnet
ip addr add 10.76.17.193/26 dev eth0
ip link set eth0 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.17.254 dev eth0
