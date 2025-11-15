#!/bin/bash
# Router Erain Configuration

# A14: Mordor-Erain
ip addr add 10.76.17.130/30 dev eth0
ip link set eth0 up

# Connect to Switch9 (A8: Balrog+Gothmog+Thranduil)
ip addr add 10.76.6.1/23 dev eth1
ip link set eth1 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.17.129 dev eth0
