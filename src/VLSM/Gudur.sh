#!/bin/bash
# Router Gudur Configuration

# A16: Gudur-Numenor
ip addr add 10.76.17.137/30 dev eth0
ip link set eth0 up

# Connect to Switch6 (A11: IronCrown+Grond+Hobbiton)
ip addr add 10.76.16.1/25 dev eth1
ip link set eth1 up

# Connect to Switch5 (A12: Palantir+Edhil)
ip addr add 10.76.16.129/26 dev eth2
ip link set eth2 up

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Routing
ip route add 0.0.0.0/0 via 10.76.17.138 dev eth0
