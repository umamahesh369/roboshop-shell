#!/bin/bash

ID=$(id -u)

if [[ $ID -ne 0 ]]; then
    echo "ERROR: Please run with root access"
    exit 1  # Exit the script if not run as root
else
    echo "You are a root user"
fi

yum install mysql -y
