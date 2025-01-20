#!/bin/bash

echo "Starting stress test for namespaces..."
for i in {1..10}; do
    sudo ip netns add testns$i
done

echo "Created 10 namespaces. Listing them..."
ip netns list

echo "Cleaning up..."
for i in {1..10}; do
    sudo ip netns delete testns$i
done
