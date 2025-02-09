#!/bin/bash

# --------------------------------------------------
# Step 1: Add a custom SELinux rule
# --------------------------------------------------
echo -e "\n🛡️ [Step 1] Adding a custom SELinux rule for web content..."
echo -e "👉 Command: sudo semanage fcontext -a -t httpd_sys_content_t \"/var/www/html(/.*)?\""
echo -e "ℹ️  Explanation: This command informs SELinux that all files and directories under /var/www/html should be treated as web content (labeled as httpd_sys_content_t)."
sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/html(/.*)?"

# --------------------------------------------------
# Step 2: Apply the SELinux policy
# --------------------------------------------------
echo -e "\n🔧 [Step 2] Applying the SELinux policy to update file contexts..."
echo -e "👉 Command: sudo restorecon -Rv /var/www/html"
echo -e "ℹ️  Explanation: This command recursively resets the SELinux context on /var/www/html and its contents to match the new policy."
sudo restorecon -Rv /var/www/html

# --------------------------------------------------
# Completion Message
# --------------------------------------------------
echo -e "\n✅ [Complete] Custom SELinux policy applied successfully!\n"
