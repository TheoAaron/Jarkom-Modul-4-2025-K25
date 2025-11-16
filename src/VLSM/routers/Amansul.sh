#!/bin/bash
# Router Amansul Configuration - VLSM (Ubuntu)
# Central router connecting to Eregion, Minastir, and Fornost

# Network configuration in /etc/network/interfaces
auto eth0
iface eth0 inet static
	address 10.76.15.193
	netmask 255.255.255.252

auto eth1
iface eth1 inet static
	address 10.76.15.213
	netmask 255.255.255.252

auto eth2
iface eth2 inet static
	address 10.76.15.229
	netmask 255.255.255.252

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure interfaces
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
# Routes via Eregion (A1)
ip route add 10.76.0.0/22 via 10.76.15.194 dev eth0         # A11 (Mirdain, Arthedain)
ip route add 10.76.14.0/25 via 10.76.15.194 dev eth0        # A2 (Mirkwood, Morgul)
ip route add 10.76.14.128/25 via 10.76.15.194 dev eth0      # A8 (Palantir, Edhil)
ip route add 10.76.10.0/23 via 10.76.15.194 dev eth0        # A9 (Balrog, Gothmog, Thranduil)
ip route add 10.76.15.160/28 via 10.76.15.194 dev eth0      # A7 (IronCrown, Grond, Hobbiton)
ip route add 10.76.15.196/30 via 10.76.15.194 dev eth0      # A3 (Eregion-Numenor)
ip route add 10.76.15.200/30 via 10.76.15.194 dev eth0      # A4 (Numenor-Gudur)
ip route add 10.76.15.204/30 via 10.76.15.194 dev eth0      # A5 (Numenor-Mordor)
ip route add 10.76.15.208/30 via 10.76.15.194 dev eth0      # A6 (Mordor-Erain)

# Routes via Minastir (A12)
ip route add 10.76.4.0/22 via 10.76.15.214 dev eth1         # A18 (Beacon, Silmarils)
ip route add 10.76.8.0/23 via 10.76.15.214 dev eth1         # A10 (Melkor, Khazad)
ip route add 10.76.15.0/26 via 10.76.15.214 dev eth1        # A16 (Erendis, Elrond)
ip route add 10.76.15.176/29 via 10.76.15.214 dev eth1      # A15 (Morgoth, Throne)
ip route add 10.76.15.216/30 via 10.76.15.214 dev eth1      # A13 (Minastir-Amroth)
ip route add 10.76.15.220/30 via 10.76.15.214 dev eth1      # A14 (Minastir-Anor)
ip route add 10.76.15.224/30 via 10.76.15.214 dev eth1      # A17 (Throne-Erebor)

# Routes via Fornost (A19)
ip route add 10.76.12.0/23 via 10.76.15.230 dev eth2        # A21 (Shadow, Anarion, Lindon)
ip route add 10.76.15.64/26 via 10.76.15.230 dev eth2       # A23 (Imrahil, Gwaith, Utumno)
ip route add 10.76.15.128/27 via 10.76.15.230 dev eth2      # A22 (Doriath, Arnor)
ip route add 10.76.15.184/29 via 10.76.15.230 dev eth2      # A20 (Valinor, Valmar)

echo "Amansul router configured successfully"
