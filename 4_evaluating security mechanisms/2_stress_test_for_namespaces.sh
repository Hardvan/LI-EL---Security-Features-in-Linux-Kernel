#!/bin/bash

# --------------------------------------------------
# Step 1: Starting the stress test for namespaces
# --------------------------------------------------
echo -e "\n🚀 [Step 1] Starting stress test for namespaces..."
echo -e "ℹ️  Explanation: We'll create 10 network namespaces (testns1 to testns10) to simulate a stress test scenario.\n"

# Loop to create 10 namespaces
for i in {1..10}; do
    echo -e "👉 Command: sudo ip netns add testns${i}"
    echo -e "ℹ️  [Loop $i] Creating namespace 'testns${i}'..."
    sudo ip netns add testns${i}
done

# --------------------------------------------------
# Step 2: Listing the created namespaces
# --------------------------------------------------
echo -e "\n📃 [Step 2] Listing all created namespaces..."
echo -e "👉 Command: ip netns list"
echo -e "ℹ️  Explanation: This command shows all active network namespaces on your system."
ip netns list

# --------------------------------------------------
# Step 3: Cleaning up the namespaces
# --------------------------------------------------
echo -e "\n🧹 [Step 3] Cleaning up: Deleting the created namespaces..."
echo -e "ℹ️  Explanation: We'll delete the 10 namespaces we created to clean up after the test.\n"

# Loop to delete the 10 namespaces
for i in {1..10}; do
    echo -e "👉 Command: sudo ip netns delete testns${i}"
    echo -e "ℹ️  [Loop $i] Deleting namespace 'testns${i}'..."
    sudo ip netns delete testns${i}
done

# --------------------------------------------------
# Completion Message
# --------------------------------------------------
echo -e "\n✅ [Complete] Stress test for namespaces complete. All test namespaces have been cleaned up.\n"
