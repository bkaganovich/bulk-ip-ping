#!/bin/bash

# File to store discovered hosts
hosts_file="hosts.txt"
# File to store subnets
subnets_file="subnets.txt"

# Empty the hosts file if it exists
> "$hosts_file"

# Prompt user to enter subnets
echo "Enter subnets (e.g., 192.168.1.0/24). Type 'q' to finish and start scanning:"

# Collect subnets
while true; do
    read -p "Subnet: " subnet
    if [ "$subnet" == "q" ]; then
        break
    fi
    echo "$subnet" >> "$subnets_file"
done

# Check if subnets_file is not empty
if [ -s "$subnets_file" ]; then
    echo "Scanning subnets listed in $subnets_file..."
    
    # Scan each subnet and append active hosts to hosts.txt
    while IFS= read -r subnet; do
        echo "Scanning $subnet..."
        nmap -sn "$subnet" -oG - | awk '/Up$/{print $2}' >> "$hosts_file"
        echo "Results from $subnet appended to $hosts_file"
    done < "$subnets_file"

    # Optionally clear subnets_file if you want to remove it after scanning
    # > "$subnets_file"
else
    echo "No subnets to scan. Please add subnets to $subnets_file and run the script again."
fi

echo "Scanning complete. Hosts saved in $hosts_file."

