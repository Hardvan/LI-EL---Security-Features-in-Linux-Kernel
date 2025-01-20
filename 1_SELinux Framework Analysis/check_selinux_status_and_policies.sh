#!/bin/bash

# Check SELinux status
echo "Checking SELinux status..."
sestatus

# List all SELinux policies
echo "Listing SELinux policies..."
semanage policylist

# Check enforcing mode
echo "Current SELinux mode:"
getenforce

# Switch to enforcing mode (requires root privileges)
echo "Switching to enforcing mode..."
sudo setenforce 1

echo "Done!"
