#!/bin/bash

# Create a new namespace and execute a bash shell
echo "Creating a new network namespace..."
sudo ip netns add mynamespace

# List network namespaces
echo "Listing network namespaces..."
ip netns list

# Bring up a loopback interface in the namespace
echo "Setting up loopback interface in namespace..."
sudo ip netns exec mynamespace ip link set lo up

# Launch a process within the namespace
echo "Launching a bash shell within the namespace..."
sudo ip netns exec mynamespace bash
