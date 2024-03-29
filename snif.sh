#!/bin/bash

# Define the output file
output_file="bt_devices.txt"
sd_card="/media/pi"

# Continuously run btmgmt find and append the output to the text file
while true; do
    # Run btmgmt find and append the output to the text file
    if btmgmt find >> "$output_file"; then
        echo "$(date +"%Y-%m-%dT%H:%M:%S%:z")" >> "$output_file"
    else
        echo "Scan failed. Restarting service..."
        # Optionally, you can add a timestamp to the log file to indicate when the service restarted.
        echo "$(date): Service restarted due to failure." >> "errors.txt"
    fi
    
    free_space=$(df -BM $sd_card | awk 'NR==2 {print $4}' | tr -d 'MB')
    if [ "$free_space" -lt "$threshold" ]; then
        echo "Error: Low disk space! Available space: $free_space MB"
        exit 1  # Exit the script with an error code
    fi
    # Add a delay to prevent the loop from running too frequently
    sleep 5  # Adjust the sleep duration as needed
done