#!/bin/bash
# Router Amansul Configuration - VLSM

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Interface to Eregion (A1: 10.76.15.192/30)
ip addr add 10.76.15.193/30 dev eth0
ip link set eth0 up

# Interface to Minastir (A12: 10.76.15.212/30)
ip addr add 10.76.15.213/30 dev eth1
ip link set eth1 up

# Interface to Fornost (A19: 10.76.15.228/30)
ip addr add 10.76.15.229/30 dev eth2
ip link set eth2 up

# Static routes
# Route to Eregion's networks
ip route add 10.76.0.0/22 via 10.76.15.194 dev eth0  # A11
ip route add 10.76.14.0/25 via 10.76.15.194 dev eth0  # A2
ip route add 10.76.14.128/25 via 10.76.15.194 dev eth0  # A8
ip route add 10.76.15.0/26 via 10.76.15.194 dev eth0  # A16
ip route add 10.76.15.196/30 via 10.76.15.194 dev eth0  # A3
ip route add 10.76.15.200/30 via 10.76.15.194 dev eth0  # A4
ip route add 10.76.15.204/30 via 10.76.15.194 dev eth0  # A5
ip route add 10.76.15.208/30 via 10.76.15.194 dev eth0  # A6
ip route add 10.76.15.160/28 via 10.76.15.194 dev eth0  # A7
ip route add 10.76.15.176/29 via 10.76.15.194 dev eth0  # A15
ip route add 10.76.15.220/30 via 10.76.15.194 dev eth0  # A14
ip route add 10.76.15.224/30 via 10.76.15.194 dev eth0  # A17

# Route to Minastir's networks
ip route add 10.76.4.0/22 via 10.76.15.214 dev eth1  # A18
ip route add 10.76.10.0/23 via 10.76.15.214 dev eth1  # A9
ip route add 10.76.15.216/30 via 10.76.15.214 dev eth1  # A13

# Route to Fornost's networks
ip route add 10.76.8.0/23 via 10.76.15.230 dev eth2  # A10
ip route add 10.76.12.0/23 via 10.76.15.230 dev eth2  # A21
ip route add 10.76.15.64/26 via 10.76.15.230 dev eth2  # A23
ip route add 10.76.15.128/27 via 10.76.15.230 dev eth2  # A22
ip route add 10.76.15.184/29 via 10.76.15.230 dev eth2  # A20

