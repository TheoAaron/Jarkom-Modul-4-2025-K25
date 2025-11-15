#!/bin/bash
# Client Balrog Configuration - Subnet A8: 10.76.6.0/23
ip addr add 10.76.6.2/23 dev eth0
ip link set eth0 up
ip route add default via 10.76.6.1
echo "Balrog configured with IP 10.76.6.2/23"
