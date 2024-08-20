#!/bin/bash

# Check if hosts.txt file exists
if [ ! -f hosts.txt ]; then
    echo "Error: hosts.txt file not found!"
    exit 1
fi

# Read IP addresses from hosts.txt file
while IFS= read -r ip; do
    # Skip empty lines and lines starting with a #
    [[ -z "$ip" || "$ip" =~ ^# ]] && continue

    # Capture the output and exit status of the ping command
    ping_output=$(ping -c 1 -W 2 "$ip" 2>&1)
    ping_exit_status=$?

    if [ $ping_exit_status -eq 0 ]; then
        echo "$ip - OK"
    else
        # Check specific error messages in the ping output
        if echo "$ping_output" | grep -q "Network is unreachable"; then
            echo "$ip - ERROR: Network is unreachable"
        elif echo "$ping_output" | grep -q "Host is down"; then
            echo "$ip - ERROR: Host is down"
        elif echo "$ping_output" | grep -q "Destination Host Unreachable"; then
            echo "$ip - ERROR: Destination Host Unreachable"
        elif echo "$ping_output" | grep -q "Request timed out"; then
            echo "$ip - ERROR: Request timed out"
        elif echo "$ping_output" | grep -q "unknown host"; then
            echo "$ip - ERROR: Unknown host"
        elif echo "$ping_output" | grep -q "100% packet loss"; then
            echo "$ip - ERROR: 100% packet loss (No response)"
        else
            echo "$ip - ERROR: An unknown error occurred"
        fi
    fi
done < hosts.txt

