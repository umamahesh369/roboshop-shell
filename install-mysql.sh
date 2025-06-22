#!/bin/bash

# Check if the script is run as root
if [[ $(id -u) -ne 0 ]]; then
    echo "ERROR: Please run this script as root."
   # Exit the script if not root
fi

echo "You are running as root."
echo "Proceeding with MySQL installation..."

# Install MySQL
yum install mysql -y
