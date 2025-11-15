#!/bin/bash
# Thranduil - Subnet A8: 10.76.6.0/23
ip addr add 10.76.6.4/23 dev eth0
ip link set eth0 up
ip route add default via 10.76.6.1
