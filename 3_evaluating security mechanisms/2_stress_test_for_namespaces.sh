# Run: ./2_stress_test_for_namespaces.sh

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

# Output:
# ./2_stress_test_for_namespaces.sh 

# 🚀 [Step 1] Starting stress test for namespaces...
# ℹ️  Explanation: We'll create 10 network namespaces (testns1 to testns10) to simulate a stress test scenario.

# 👉 Command: sudo ip netns add testns1
# ℹ️  [Loop 1] Creating namespace 'testns1'...
# 👉 Command: sudo ip netns add testns2
# ℹ️  [Loop 2] Creating namespace 'testns2'...
# 👉 Command: sudo ip netns add testns3
# ℹ️  [Loop 3] Creating namespace 'testns3'...
# 👉 Command: sudo ip netns add testns4
# ℹ️  [Loop 4] Creating namespace 'testns4'...
# 👉 Command: sudo ip netns add testns5
# ℹ️  [Loop 5] Creating namespace 'testns5'...
# 👉 Command: sudo ip netns add testns6
# ℹ️  [Loop 6] Creating namespace 'testns6'...
# 👉 Command: sudo ip netns add testns7
# ℹ️  [Loop 7] Creating namespace 'testns7'...
# 👉 Command: sudo ip netns add testns8
# ℹ️  [Loop 8] Creating namespace 'testns8'...
# 👉 Command: sudo ip netns add testns9
# ℹ️  [Loop 9] Creating namespace 'testns9'...
# 👉 Command: sudo ip netns add testns10
# ℹ️  [Loop 10] Creating namespace 'testns10'...

# 📃 [Step 2] Listing all created namespaces...
# 👉 Command: ip netns list
# ℹ️  Explanation: This command shows all active network namespaces on your system.
# mynamespace
# testns1
# testns2
# testns3
# testns4
# testns5
# testns6
# testns7
# testns8
# testns9
# testns10

# 🧹 [Step 3] Cleaning up: Deleting the created namespaces...
# ℹ️  Explanation: We'll delete the 10 namespaces we created to clean up after the test.

# 👉 Command: sudo ip netns delete testns1
# ℹ️  [Loop 1] Deleting namespace 'testns1'...
# 👉 Command: sudo ip netns delete testns2
# ℹ️  [Loop 2] Deleting namespace 'testns2'...
# 👉 Command: sudo ip netns delete testns3
# ℹ️  [Loop 3] Deleting namespace 'testns3'...
# 👉 Command: sudo ip netns delete testns4
# ℹ️  [Loop 4] Deleting namespace 'testns4'...
# 👉 Command: sudo ip netns delete testns5
# ℹ️  [Loop 5] Deleting namespace 'testns5'...
# 👉 Command: sudo ip netns delete testns6
# ℹ️  [Loop 6] Deleting namespace 'testns6'...
# 👉 Command: sudo ip netns delete testns7
# ℹ️  [Loop 7] Deleting namespace 'testns7'...
# 👉 Command: sudo ip netns delete testns8
# ℹ️  [Loop 8] Deleting namespace 'testns8'...
# 👉 Command: sudo ip netns delete testns9
# ℹ️  [Loop 9] Deleting namespace 'testns9'...
# 👉 Command: sudo ip netns delete testns10
# ℹ️  [Loop 10] Deleting namespace 'testns10'...

# ✅ [Complete] Stress test for namespaces complete. All test namespaces have been cleaned up.
