#!/bin/bash
# Mirkwood - Subnet A13: 10.76.17.0/25
ip addr add 10.76.17.2/25 dev eth0
ip link set eth0 up
ip route add default via 10.76.17.1
