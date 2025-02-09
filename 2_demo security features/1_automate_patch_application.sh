# Run: ./1_automate_patch_application.sh

# --------------------------------------------------
# Step 1: Check for available updates
# --------------------------------------------------
echo -e "\n🔍 [Step 1] Checking for available updates..."
echo -e "👉 Command: sudo apt update"
echo -e "ℹ️  Explanation: This command fetches the latest package lists from all configured repositories. It ensures that your system knows about the newest versions of available packages."
sudo apt update

# --------------------------------------------------
# Step 2: Apply kernel patches and update packages
# --------------------------------------------------
echo -e "\n🛠️ [Step 2] Applying kernel patches and updating packages..."
echo -e "👉 Command: sudo apt upgrade -y"
echo -e "ℹ️  Explanation: This command upgrades all installed packages (including kernel patches) to their latest available versions. The '-y' flag automatically confirms the upgrade process."
sudo apt upgrade -y

# --------------------------------------------------
# Completion Message
# --------------------------------------------------
echo -e "\n✅ [Complete] Updates applied successfully! Your system is now up-to-date.\n"

# Output:
# ./1_automate_patch_application.sh 

# 🔍 [Step 1] Checking for available updates...
# 👉 Command: sudo apt update
# ℹ️  Explanation: This command fetches the latest package lists from all configured repositories. It ensures that your system knows about the newest versions of available packages.
# [sudo] password for hardik: 
# Hit:1 https://packages.microsoft.com/repos/edge stable InRelease
# Hit:3 https://download.docker.com/linux/ubuntu focal InRelease                                    
# Hit:4 https://download.docker.com/linux/ubuntu jammy InRelease                                           
# Hit:2 https://apt.llvm.org/jammy llvm-toolchain-jammy-15 InRelease                                       
# Hit:5 http://security.ubuntu.com/ubuntu jammy-security InRelease                                         
# Hit:6 https://ppa.launchpadcontent.net/obsproject/obs-studio/ubuntu jammy InRelease                      
# Hit:7 http://in.archive.ubuntu.com/ubuntu jammy InRelease                           
# Hit:8 http://in.archive.ubuntu.com/ubuntu jammy-updates InRelease
# Hit:9 http://in.archive.ubuntu.com/ubuntu jammy-backports InRelease
# Reading package lists... Done
# Building dependency tree... Done
# Reading state information... Done
# 3 packages can be upgraded. Run 'apt list --upgradable' to see them.
# W: https://download.docker.com/linux/ubuntu/dists/focal/InRelease: Key is stored in legacy trusted.gpg keyring (/etc/apt/trusted.gpg), see the DEPRECATION section in apt-key(8) for details.

# 🛠️ [Step 2] Applying kernel patches and updating packages...
# 👉 Command: sudo apt upgrade -y
# ℹ️  Explanation: This command upgrades all installed packages (including kernel patches) to their latest available versions. The '-y' flag automatically confirms the upgrade process.
# Reading package lists... Done
# Building dependency tree... Done
# Reading state information... Done
# Calculating upgrade... Done
# The following packages were automatically installed and are no longer required:
#   bridge-utils libflashrom1 libftdi1-2 libllvm13 libwpe-1.0-1 libwpebackend-fdo-1.0-1 ubuntu-fan
# Use 'sudo apt autoremove' to remove them.
# Get more security updates through Ubuntu Pro with 'esm-apps' enabled:
#   libslurm37 libavdevice58 libpostproc55 libavcodec58 libavutil56 libswscale5
#   libswresample3 libavformat58 libavfilter7
# Learn more about Ubuntu Pro at https://ubuntu.com/pro
# The following packages will be upgraded:
#   docker-buildx-plugin docker-ce-rootless-extras docker-compose-plugin
# 3 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
# Need to get 55.6 MB of archives.
# After this operation, 12.3 kB disk space will be freed.
# Get:1 https://download.docker.com/linux/ubuntu jammy/stable amd64 docker-buildx-plugin amd64 0.20.0-1~ubuntu.22.04~jammy [33.2 MB]
# Get:2 https://download.docker.com/linux/ubuntu jammy/stable amd64 docker-ce-rootless-extras amd64 5:27.5.1-1~ubuntu.22.04~jammy [9,603 kB]
# Get:3 https://download.docker.com/linux/ubuntu jammy/stable amd64 docker-compose-plugin amd64 2.32.4-1~ubuntu.22.04~jammy [12.8 MB]
# Fetched 55.6 MB in 15s (3,615 kB/s)                                                                      
# (Reading database ... 243080 files and directories currently installed.)
# Preparing to unpack .../docker-buildx-plugin_0.20.0-1~ubuntu.22.04~jammy_amd64.deb ...
# Unpacking docker-buildx-plugin (0.20.0-1~ubuntu.22.04~jammy) over (0.20.0-1~ubuntu.20.04~focal) ...
# Preparing to unpack .../docker-ce-rootless-extras_5%3a27.5.1-1~ubuntu.22.04~jammy_amd64.deb ...
# Unpacking docker-ce-rootless-extras (5:27.5.1-1~ubuntu.22.04~jammy) over (5:27.5.1-1~ubuntu.20.04~focal) ...
# Preparing to unpack .../docker-compose-plugin_2.32.4-1~ubuntu.22.04~jammy_amd64.deb ...
# Unpacking docker-compose-plugin (2.32.4-1~ubuntu.22.04~jammy) over (2.32.4-1~ubuntu.20.04~focal) ...
# Setting up docker-buildx-plugin (0.20.0-1~ubuntu.22.04~jammy) ...
# Setting up docker-compose-plugin (2.32.4-1~ubuntu.22.04~jammy) ...
# Setting up docker-ce-rootless-extras (5:27.5.1-1~ubuntu.22.04~jammy) ...

# ✅ [Complete] Updates applied successfully! Your system is now up-to-date.
