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
