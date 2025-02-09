# Run: ./1_create_and_explore_namespace.sh

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

# Output:
# ./1_create_and_explore_namespace.sh 

# 🚀 Creating a new network namespace named 'mynamespace'...
# 👉 Command: sudo ip netns add mynamespace
# [sudo] password for hardik: 
# ℹ️  Explanation: This command creates an isolated network environment called 'mynamespace'.


# 🔍 Listing all network namespaces...
# 👉 Command: ip netns list
# mynamespace
# ℹ️  Explanation: This command shows you all the network namespaces currently available on your system.


# 🔌 Setting up the loopback interface (lo) in 'mynamespace'...
# 👉 Command: sudo ip netns exec mynamespace ip link set lo up
# ℹ️  Explanation: This activates the loopback interface within 'mynamespace', allowing internal network communication within the namespace.


# 🐚 Launching a bash shell inside 'mynamespace'...
# 👉 Command: sudo ip netns exec mynamespace bash
# ℹ️  Explanation: This command opens a new bash shell within the 'mynamespace' namespace so you can run further commands in an isolated environment. Type commands such as 'ls', 'ip a' or 'ping 127.0.0.1' to explore the network namespace. 'ip a' will show you the network interfaces available in the namespace.
# root@hardik-laptop:/home/hardik/LI-EL---Security-Features-in-Linux-Kernel/2_exploring_linux_namespaces# ls
# 1_create_and_explore_namespace.sh  2_demo_namespace_creation.c  demo_namespace_creation
# root@hardik-laptop:/home/hardik/LI-EL---Security-Features-in-Linux-Kernel/2_exploring_linux_namespaces# ip a
# 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
#     link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
#     inet 127.0.0.1/8 scope host lo
#        valid_lft forever preferred_lft forever
#     inet6 ::1/128 scope host 
#        valid_lft forever preferred_lft forever
# root@hardik-laptop:/home/hardik/LI-EL---Security-Features-in-Linux-Kernel/2_exploring_linux_namespaces# ping 127.0.0.1
# PING 127.0.0.1 (127.0.0.1) 56(84) bytes of data.
# 64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.043 ms
# 64 bytes from 127.0.0.1: icmp_seq=2 ttl=64 time=0.019 ms
# 64 bytes from 127.0.0.1: icmp_seq=3 ttl=64 time=0.034 ms
# 64 bytes from 127.0.0.1: icmp_seq=4 ttl=64 time=0.018 ms
# ^C
# --- 127.0.0.1 ping statistics ---
# 4 packets transmitted, 4 received, 0% packet loss, time 3109ms
# rtt min/avg/max/mdev = 0.018/0.028/0.043/0.010 ms
# root@hardik-laptop:/home/hardik/LI-EL---Security-Features-in-Linux-Kernel/2_exploring_linux_namespaces# exit
# exit
