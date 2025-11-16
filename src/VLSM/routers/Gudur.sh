#!/bin/bash
#!/bin/bash
# Router Gudur Configuration - VLSM (Ubuntu)
# Connects to two Switch5 segments (IronCrown/Grond/Hobbiton and Palantir/Edhil)

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.202
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.15.161
	netmask 255.255.255.240

auto eth2
iface eth2 inet static
	address 10.76.14.129
	netmask 255.255.255.128

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
# Interface to Numenor (A4: 10.76.15.200/30)
ip addr add 10.76.15.202/30 dev eth0
ip link set eth0 up

# Interface to Switch5 - IronCrown, Grond, Hobbiton (A7: 10.76.15.160/28)
ip addr add 10.76.15.161/28 dev eth1
ip link set eth1 up

# Interface to Switch5 - Palantir, Edhil (A8: 10.76.14.128/25)
ip addr add 10.76.14.129/25 dev eth2
ip link set eth2 up

# Static routes
# Default route to Numenor
ip route add default via 10.76.15.201 dev eth0

echo "Gudur router configured successfully"
