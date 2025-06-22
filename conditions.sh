TODAY=$(date +%A)  # This returns the full name of the day (e.g., "Sunday", "Monday")

if [[ "$TODAY" != "Sunday" ]]; then
    echo "Go to school"
else
    echo "Happy holiday"
fi
