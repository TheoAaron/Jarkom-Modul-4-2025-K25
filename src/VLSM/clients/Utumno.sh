#!/bin/bash
# Utumno - Subnet A19: 10.76.17.192/26
ip addr add 10.76.17.196/26 dev eth0
ip link set eth0 up
ip route add default via 10.76.17.193
