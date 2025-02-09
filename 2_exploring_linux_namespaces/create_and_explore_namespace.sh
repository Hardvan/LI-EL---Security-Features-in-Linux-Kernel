# --------------------------------------------
# Step 1: Create a new network namespace
# --------------------------------------------
echo -e "\n🚀 Creating a new network namespace named 'mynamespace'..."
echo -e "👉 Command: sudo ip netns add mynamespace"
sudo ip netns add mynamespace
echo -e "ℹ️  Explanation: This command creates an isolated network environment called 'mynamespace'.\n"

# --------------------------------------------
# Step 2: List existing network namespaces
# --------------------------------------------
echo -e "\n🔍 Listing all network namespaces..."
echo -e "👉 Command: ip netns list"
ip netns list
echo -e "ℹ️  Explanation: This command shows you all the network namespaces currently available on your system.\n"

# --------------------------------------------
# Step 3: Bring up the loopback interface in the namespace
# --------------------------------------------
echo -e "\n🔌 Setting up the loopback interface (lo) in 'mynamespace'..."
echo -e "👉 Command: sudo ip netns exec mynamespace ip link set lo up"
sudo ip netns exec mynamespace ip link set lo up
echo -e "ℹ️  Explanation: This activates the loopback interface within 'mynamespace', allowing internal network communication within the namespace.\n"

# --------------------------------------------
# Step 4: Launch a bash shell within the namespace
# --------------------------------------------
echo -e "\n🐚 Launching a bash shell inside 'mynamespace'..."
echo -e "👉 Command: sudo ip netns exec mynamespace bash"
echo -e "ℹ️  Explanation: This command opens a new bash shell within the 'mynamespace' namespace so you can run further commands in an isolated environment. Type commands such as 'ls', 'ip a' or 'ping 127.0.0.1' to explore the network namespace. 'ip a' will show you the network interfaces available in the namespace."
sudo ip netns exec mynamespace bash
