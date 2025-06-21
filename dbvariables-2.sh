#!/bin/bash

echo "Please enter your username:"
read USERNAME
echo "Username is: $USERNAME"

echo "Please enter your password:"
read -s PASSWORD  # -s ensures the password is not echoed to the screen
echo "Password is captured but not displayed for security."
