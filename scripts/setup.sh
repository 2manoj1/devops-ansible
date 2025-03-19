#!/bin/bash

# This is the setup script that will run locally or on remote servers

echo "Running setup.sh on the local or remote server"
echo "Omkar"
# Get the system's hostname
HOSTNAME=$(hostname)

# Get the current date and time
CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S")

# Echo "Hello" followed by the system's hostname
echo "[$CURRENT_TIME] Hello, $HOSTNAME"

# Display system details
echo "System Information:"
echo "--------------------"
echo "Operating System: $(uname -o)"
echo "Kernel Version: $(uname -r)"
echo "Machine Architecture: $(uname -m)"
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"

# Disk usage details
echo "Disk Usage:"
echo "-----------"
df -h

# Memory usage details
echo "Memory Usage:"
echo "-------------"
free -h

# CPU details
echo "CPU Information:"
echo "----------------"
lscpu | grep "Model name"
