#!/bin/bash
# Router Morgoth Configuration

# A4: Amroth-Morgoth
ip addr add 10.76.4.130/30 dev eth0
ip link set eth0 up

# A3: Connected to Switch2 (Erendis+Elrond subnet)
ip addr add 10.76.4.65/26 dev eth1
ip link set eth1 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.4.129 dev eth0
