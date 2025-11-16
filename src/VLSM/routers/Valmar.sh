#!/bin/bash
# Router Valmar Configuration - VLSM (Ubuntu)
# Node in Switch13, connects to Switch12 and Switch11

#!/bin/bash
# Router Valmar Configuration - VLSM (Ubuntu)
# Endpoint router serving Switch11 and Switch12

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.186
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.12.1
	netmask 255.255.254.0

auto eth2
iface eth2 inet static
	address 10.76.15.129
	netmask 255.255.255.224

auto eth3
iface eth3 inet static
	address 10.76.15.65
	netmask 255.255.255.192

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
# Interface to Switch13/Valinor (A20: 10.76.15.184/29)
ip addr add 10.76.15.187/29 dev eth0
ip link set eth0 up

# Interface to Switch12 - Shadow, Anarion, Lindon (A21: 10.76.12.0/23)
ip addr add 10.76.12.1/23 dev eth1
ip link set eth1 up

# Interface to Switch12 - Doriath, Arnor (A22: 10.76.15.128/27)
ip addr add 10.76.15.129/27 dev eth2
ip link set eth2 up

# Interface to Switch11 - Imrahil, Gwaith, Utumno (A23: 10.76.15.64/26)
ip addr add 10.76.15.65/26 dev eth3
ip link set eth3 up

# Static routes
# Default route to Valinor
ip route add default via 10.76.15.186 dev eth0

echo "Valmar configured successfully"
