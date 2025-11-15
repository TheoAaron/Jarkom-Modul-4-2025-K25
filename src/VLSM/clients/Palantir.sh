#!/bin/bash
# Palantir - Subnet A12: 10.76.16.128/26
ip addr add 10.76.16.130/26 dev eth0
ip link set eth0 up
ip route add default via 10.76.16.129
