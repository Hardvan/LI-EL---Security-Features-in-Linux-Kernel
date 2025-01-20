#!/bin/bash

# Add a custom SELinux rule
echo "Adding custom SELinux rule..."
sudo semanage fcontext -a -t httpd_sys_content_t "/var/www/html(/.*)?"

# Apply the policy
echo "Applying SELinux policy..."
sudo restorecon -Rv /var/www/html

echo "Custom SELinux policy applied."
