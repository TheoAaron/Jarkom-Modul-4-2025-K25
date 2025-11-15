#!/bin/bash
# Arthendain - Subnet A10: 10.76.12.0/22
ip addr add 10.76.12.2/22 dev eth0
ip link set eth0 up
ip route add default via 10.76.12.1
