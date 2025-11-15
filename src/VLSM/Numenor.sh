#!/bin/bash
# Router Numenor Configuration

# A15: Numenor-Mordor
ip addr add 10.76.17.133/30 dev eth0
ip link set eth0 up

# A16: Gudur-Numenor
ip addr add 10.76.17.138/30 dev eth1
ip link set eth1 up

# A17: Eregion-Numenor
ip addr add 10.76.17.142/30 dev eth2
ip link set eth2 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.17.145 dev eth2
