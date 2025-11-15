#!/bin/bash
# Anarion - Subnet A21: 10.76.20.0/23
ip addr add 10.76.20.2/23 dev eth0
ip link set eth0 up
ip route add default via 10.76.20.1
