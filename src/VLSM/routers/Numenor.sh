#!/bin/bash
# Router Numenor Configuration - VLSM (Ubuntu)
# Connects Eregion to Gudur, Mordor, and Switch7 (Mirdain, Arthedain)

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.198
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.0.1
	netmask 255.255.252.0

auto eth2
iface eth2 inet static
	address 10.76.15.201
	netmask 255.255.255.252

auto eth3
iface eth3 inet static
	address 10.76.15.205
	netmask 255.255.255.252

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
# Interface to Eregion (A3: 10.76.15.196/30)
ip addr add 10.76.15.198/30 dev eth0
ip link set eth0 up

# Interface to Gudur (A4: 10.76.15.200/30)
ip addr add 10.76.15.201/30 dev eth1
ip link set eth1 up

# Interface to Mordor (A5: 10.76.15.204/30)
ip addr add 10.76.15.205/30 dev eth2
ip link set eth2 up

# Interface to Switch7 - Mirdain, Arthedain (A11: 10.76.0.0/22)
ip addr add 10.76.0.1/22 dev eth3
ip link set eth3 up

# Static routes
# Default route to Eregion
ip route add default via 10.76.15.197 dev eth0

# Routes via Gudur
ip route add 10.76.14.128/25 via 10.76.15.202 dev eth1      # A8 (Palantir, Edhil)
ip route add 10.76.15.160/28 via 10.76.15.202 dev eth1      # A7 (IronCrown, Grond, Hobbiton)

# Routes via Mordor
ip route add 10.76.10.0/23 via 10.76.15.206 dev eth2        # A9 (Balrog, Gothmog, Thranduil)
ip route add 10.76.15.208/30 via 10.76.15.206 dev eth2      # A6 (Mordor-Erain)

echo "Numenor router configured successfully"
