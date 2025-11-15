#!/bin/bash
# Client Beacon Configuration
# Subnet A18: 10.76.4.0/22 (Beacon+Silmarils via Switch3)

# Configure IP address
ip addr add 10.76.4.2/22 dev eth0
ip link set eth0 up

# Set default gateway (Anor router)
ip route add default via 10.76.4.1 dev eth0

# DNS (optional)
echo "nameserver 8.8.8.8" > /etc/resolv.conf

echo "Beacon configured with IP 10.76.4.2/22"
echo "Gateway: 10.76.4.1 (Anor)"

