#!/bin/bash

# List of IP addresses to ping, each on a new line.
IPS=(
    "192.168.1.1"
    "192.168.1.2"
    "8.8.8.8"
    "8.8.4.4"
    "203.0.113.254"
    "10.0.0.1"
    "10.0.0.2"
)

# Loop through each IP address
for ip in "${IPS[@]}"; do
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
done

