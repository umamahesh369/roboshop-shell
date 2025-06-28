#!/bin/bash

SOURCE_DIR="/tmp/shellscript-logs"

# Colors for output
R="\e[31m"  # Red
G="\e[32m"  # Green
Y="\e[33m"  # Yellow
N="\e[0m"   # No color (reset)

# Check if the source directory exists
if [ -d "$SOURCE_DIR" ]; then
  echo -e "${G}Source directory exists.${N}"
else
  echo -e "${R}Please make sure the source directory $SOURCE_DIR exists.${N}"
  exit 1
fi

# Find files older than 14 days
FILES=$(find "$SOURCE_DIR" -name "*.log" -mtime +14)

# Check if files are found
if [ -z "$FILES" ]; then
  echo -e "${Y}No log files older than 14 days found.${N}"
  exit 0
fi

# Loop through the files and delete them
while IFS= read -r line; do
  echo "Deleting file: $line"
  rm -rf "$line"
done <<< "$FILES"
