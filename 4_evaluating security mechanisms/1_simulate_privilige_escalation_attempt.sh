#!/bin/bash

echo "Attempting to access restricted file..."
cat /etc/shadow || echo "Access denied. SELinux and permissions are working."

echo "Simulating real-world attacks complete."
