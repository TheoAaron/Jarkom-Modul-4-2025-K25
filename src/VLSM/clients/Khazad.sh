#!/bin/bash
# Khazad - Subnet A9: 10.76.8.0/23
ip addr add 10.76.8.3/23 dev eth0
ip link set eth0 up
ip route add default via 10.76.8.1
