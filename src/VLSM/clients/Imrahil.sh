#!/bin/bash
# Imrahil - Subnet A19: 10.76.17.192/26
ip addr add 10.76.17.194/26 dev eth0
ip link set eth0 up
ip route add default via 10.76.17.193
