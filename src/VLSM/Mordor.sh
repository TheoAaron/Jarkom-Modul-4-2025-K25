#!/bin/bash
# Router Mordor Configuration

# A14: Mordor-Erain
ip addr add 10.76.17.129/30 dev eth0
ip link set eth0 up

# A15: Numenor-Mordor
ip addr add 10.76.17.134/30 dev eth1
ip link set eth1 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.17.133 dev eth1
