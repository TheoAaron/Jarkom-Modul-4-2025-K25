#!/bin/bash
# Arnor - Subnet A20: 10.76.18.0/27
ip addr add 10.76.18.3/27 dev eth0
ip link set eth0 up
ip route add default via 10.76.18.1
