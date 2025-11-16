#!/bin/bash
# Network Connectivity Test Script
# Test ping antar node untuk memastikan semua konfigurasi bekerja

echo "=========================================="
echo "NETWORK CONNECTIVITY TEST"
echo "=========================================="
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to test ping
test_ping() {
    local name=$1
    local ip=$2
    echo -n "Testing $name ($ip)... "
    if ping -c 1 -W 2 $ip > /dev/null 2>&1; then
        echo -e "${GREEN}OK${NC}"
        return 0
    else
        echo -e "${RED}FAILED${NC}"
        return 1
    fi
}

# Counter untuk success/failed
SUCCESS=0
FAILED=0

echo "=== Testing Gateway ==="
test_ping "Gateway" "GATEWAY_IP" && ((SUCCESS++)) || ((FAILED++))
echo ""

echo "=== Testing Central Router ==="
test_ping "Amansul (Central Router)" "10.76.15.193" && ((SUCCESS++)) || ((FAILED++))
echo ""

echo "=== Testing Other Routers ==="
test_ping "Eregion" "10.76.15.194" && ((SUCCESS++)) || ((FAILED++))
test_ping "Numenor" "10.76.15.198" && ((SUCCESS++)) || ((FAILED++))
test_ping "Minastir" "10.76.15.214" && ((SUCCESS++)) || ((FAILED++))
test_ping "Fornost" "10.76.15.230" && ((SUCCESS++)) || ((FAILED++))
echo ""

echo "=== Testing Clients in Different Subnets ==="
test_ping "Mirkwood (A2)" "10.76.14.2" && ((SUCCESS++)) || ((FAILED++))
test_ping "Mirdain (A11)" "10.76.0.2" && ((SUCCESS++)) || ((FAILED++))
test_ping "Balrog (A9)" "10.76.10.2" && ((SUCCESS++)) || ((FAILED++))
test_ping "Beacon (A18)" "10.76.4.2" && ((SUCCESS++)) || ((FAILED++))
test_ping "Shadow (A21)" "10.76.12.2" && ((SUCCESS++)) || ((FAILED++))
echo ""

echo "=== Testing Edge Nodes ==="
test_ping "Erebor (Far End)" "10.76.15.225" && ((SUCCESS++)) || ((FAILED++))
test_ping "Utumno (Far End)" "10.76.15.68" && ((SUCCESS++)) || ((FAILED++))
echo ""

echo "=========================================="
echo "TEST SUMMARY"
echo "=========================================="
echo -e "Successful: ${GREEN}$SUCCESS${NC}"
echo -e "Failed: ${RED}$FAILED${NC}"
echo "Total: $((SUCCESS + FAILED))"
echo ""

if [ $FAILED -eq 0 ]; then
    echo -e "${GREEN}✓ All tests passed! Network is fully functional.${NC}"
    exit 0
else
    echo -e "${RED}✗ Some tests failed. Check network configuration.${NC}"
    exit 1
fi
