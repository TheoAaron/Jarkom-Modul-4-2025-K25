#!/bin/bash
# IronCrown - Subnet A11: 10.76.16.0/25
ip addr add 10.76.16.2/25 dev eth0
ip link set eth0 up
ip route add default via 10.76.16.1
