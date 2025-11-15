#!/bin/bash
# Router Minastir Configuration

# A5: Minastir-Anor
ip addr add 10.76.4.133/30 dev eth0
ip link set eth0 up

# A6: Minastir-Amroth
ip addr add 10.76.4.137/30 dev eth1
ip link set eth1 up

# A7: Amonsul-Minastir
ip addr add 10.76.4.142/30 dev eth2
ip link set eth2 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.4.141 dev eth2
