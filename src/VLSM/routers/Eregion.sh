#!/bin/bash
# Router Eregion Configuration - VLSM (Ubuntu)
# Connects Amansul to Numenor and Switch4 (Mirkwood/Morgul)

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.194
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.15.197
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 10.76.14.1
	netmask 255.255.255.128

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
# Interface to Amansul (A1: 10.76.15.192/30)
ip addr add 10.76.15.194/30 dev eth0
ip link set eth0 up

# Interface to Numenor (A3: 10.76.15.196/30)
ip addr add 10.76.15.197/30 dev eth1
ip link set eth1 up

# Interface to Switch4 - Mirkwood, Morgul (A2: 10.76.14.0/25)
ip addr add 10.76.14.1/25 dev eth2
ip link set eth2 up

# Static routes
# Default route to Amansul
ip route add default via 10.76.15.193 dev eth0

# Routes via Numenor
ip route add 10.76.0.0/22 via 10.76.15.198 dev eth1         # A11 (Mirdain, Arthedain)
ip route add 10.76.14.128/25 via 10.76.15.198 dev eth1      # A8 (Palantir, Edhil)
ip route add 10.76.10.0/23 via 10.76.15.198 dev eth1        # A9 (Balrog, Gothmog, Thranduil)
ip route add 10.76.15.160/28 via 10.76.15.198 dev eth1      # A7 (IronCrown, Grond, Hobbiton)
ip route add 10.76.15.200/30 via 10.76.15.198 dev eth1      # A4 (Numenor-Gudur)
ip route add 10.76.15.204/30 via 10.76.15.198 dev eth1      # A5 (Numenor-Mordor)
ip route add 10.76.15.208/30 via 10.76.15.198 dev eth1      # A6 (Mordor-Erain)

echo "Eregion router configured successfully"
