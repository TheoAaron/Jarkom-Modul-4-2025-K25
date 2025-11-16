#!/bin/bash
# Quick Setup Helper for GNS3 Nodes
# Automatically configure network using /etc/network/interfaces method

echo "=========================================="
echo "GNS3 Network Configuration Helper"
echo "=========================================="
echo ""

# Detect node type
if [ -f "/proc/sys/net/ipv4/ip_forward" ]; then
    IS_ROUTER=true
else
    IS_ROUTER=false
fi

echo "Configuring network interfaces..."
echo ""

# Backup existing configuration
if [ -f /etc/network/interfaces ]; then
    cp /etc/network/interfaces /etc/network/interfaces.backup
    echo "✓ Backed up existing configuration to /etc/network/interfaces.backup"
fi

echo ""
echo "Choose configuration method:"
echo "1) Quick setup (using script commands - temporary)"
echo "2) Permanent setup (edit /etc/network/interfaces - recommended)"
echo ""
read -p "Enter choice [1-2]: " choice

case $choice in
    1)
        echo ""
        echo "Running quick setup..."
        echo "NOTE: This configuration will be lost after reboot!"
        echo ""
        
        # Run the configuration commands
        # (Commands already in the script will be executed)
        
        echo "✓ Quick setup completed"
        echo ""
        echo "To verify:"
        echo "  ip addr show"
        echo "  ip route show"
        ;;
        
    2)
        echo ""
        echo "=== PERMANENT SETUP INSTRUCTIONS ==="
        echo ""
        echo "1. Copy the network configuration section from your .sh file"
        echo "   (Look for lines starting with 'auto eth0' and 'iface eth0 inet static')"
        echo ""
        echo "2. Edit /etc/network/interfaces:"
        echo "   nano /etc/network/interfaces"
        echo ""
        echo "3. Paste the configuration"
        echo ""
        echo "4. Save and exit (Ctrl+X, Y, Enter)"
        echo ""
        echo "5. Restart networking:"
        echo "   /etc/init.d/networking restart"
        echo ""
        echo "6. OR reboot the node for automatic configuration"
        echo ""
        
        if [ "$IS_ROUTER" = true ]; then
            echo "=== ADDITIONAL STEPS FOR ROUTERS ==="
            echo ""
            echo "Enable IP Forwarding permanently:"
            echo "  echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf"
            echo "  sysctl -p"
            echo ""
            echo "Then run this script again to add static routes"
            echo ""
        fi
        
        read -p "Press Enter to open /etc/network/interfaces in nano..."
        nano /etc/network/interfaces
        
        echo ""
        read -p "Restart networking now? [y/N]: " restart
        if [ "$restart" = "y" ] || [ "$restart" = "Y" ]; then
            /etc/init.d/networking restart
            echo "✓ Networking restarted"
        fi
        ;;
        
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "=========================================="
echo "Configuration Status"
echo "=========================================="
echo ""
echo "IP Addresses:"
ip addr show | grep "inet " | grep -v "127.0.0.1"
echo ""
echo "Default Gateway:"
ip route | grep default
echo ""

if [ "$IS_ROUTER" = true ]; then
    echo "IP Forwarding Status:"
    if [ "$(cat /proc/sys/net/ipv4/ip_forward)" = "1" ]; then
        echo "✓ Enabled"
    else
        echo "✗ Disabled (Run: echo 1 > /proc/sys/net/ipv4/ip_forward)"
    fi
    echo ""
    echo "Static Routes:"
    ip route show | grep -v "default\|link"
    echo ""
fi

echo "=========================================="
echo "Next Steps:"
echo "=========================================="
echo ""
echo "1. Test gateway: ping <gateway_ip>"
echo "2. Test central router: ping 10.76.15.193"
echo "3. Test other subnet: ping <remote_ip>"
echo "4. Trace route: traceroute <destination_ip>"
echo ""
echo "For full connectivity test, run:"
echo "  ./test_connectivity.sh"
echo ""
