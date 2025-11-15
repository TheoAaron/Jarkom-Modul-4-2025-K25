#!/bin/bash
# Router Anor Configuration

# A5: Minastir-Anor
ip addr add 10.76.4.134/30 dev eth0
ip link set eth0 up

# A13: Connected to Switch4 (Mirkwood+Morgul subnet)
ip addr add 10.76.17.1/25 dev eth1
ip link set eth1 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.4.133 dev eth0
