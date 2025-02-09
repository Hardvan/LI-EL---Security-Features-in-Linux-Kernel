# Run: ./1_simulate_privilege_escalation_attempt.sh

# --------------------------------------------------
# Step 1: Attempt to access a restricted file
# --------------------------------------------------
echo -e "\n🚨 [Step 1] Attempting to access a restricted file: /etc/shadow"
echo -e "👉 Command: cat /etc/shadow"
echo -e "ℹ️  Explanation: This command tries to read the /etc/shadow file, which contains sensitive password hashes and is protected by file permissions and SELinux policies."
cat /etc/shadow || echo -e "❌ [Step 1] Access denied. SELinux and file permissions are working correctly."

# --------------------------------------------------
# Step 2: Simulate completion of a real-world attack test
# --------------------------------------------------
echo -e "\n✅ [Complete] Simulated real-world attack scenario complete.\n"

# Output:
# ./1_simulate_privilege_escalation_attempt.sh 

# 🚨 [Step 1] Attempting to access a restricted file: /etc/shadow
# 👉 Command: cat /etc/shadow
# ℹ️  Explanation: This command tries to read the /etc/shadow file, which contains sensitive password hashes and is protected by file permissions and SELinux policies.
# cat: /etc/shadow: Permission denied
# ❌ [Step 1] Access denied. SELinux and file permissions are working correctly.

# ✅ [Complete] Simulated real-world attack scenario complete.
