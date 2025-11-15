#!/bin/bash
# Router Amroth Configuration

# A4: Amroth-Morgoth
ip addr add 10.76.4.129/30 dev eth0
ip link set eth0 up

# A6: Minastir-Amroth
ip addr add 10.76.4.138/30 dev eth1
ip link set eth1 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.4.137 dev eth1
