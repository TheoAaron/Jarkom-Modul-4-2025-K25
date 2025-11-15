#!/bin/bash
# Router Eregion Configuration

# A17: Eregion-Numenor
ip addr add 10.76.17.141/30 dev eth0
ip link set eth0 up

# A18: Eregion-Amansul
ip addr add 10.76.17.145/30 dev eth1
ip link set eth1 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.17.146 dev eth1
