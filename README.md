# `ping_ips.sh`

## Description
A Bash script to ping a list of IP addresses and display the status or specific error for each IP address.

## Usage
1. **Edit IP List:** Update the `IPS` array in the script with your IP addresses.
2. **Run Script:** Execute the script using:
   ```bash
   ./ping_ips.sh
   ```

## Example
### Command
```bash
./ping_ips.sh
```

### Output
```bash
192.168.1.1 - OK
192.168.1.2 - ERROR: 100% packet loss (No response)
8.8.8.8 - OK
8.8.4.4 - OK
203.0.113.254 - OK
10.0.0.1 - ERROR: 100% packet loss (No response)
10.0.0.2 - ERROR: 100% packet loss (No response)
10.0.0.3 - ERROR: 100% packet loss (No response)
10.0.0.4 - ERROR: 100% packet loss (No response)
10.0.0.5 - ERROR: 100% packet loss (No response)
```

## Error Messages
- `Network is unreachable`: Network issue.
- `Host is down`: Target host not responding.
- `Destination Host Unreachable`: Router issue.
- `Request timed out`: No response within timeout.
- `Unknown host`: DNS resolution failure.
- `100% packet loss (No response)`: Target unreachable.
- `An unknown error occurred`: Unhandled error.

## Notes
- Ensure the script has executable permissions with `chmod +x ping_ips.sh`.
- Modify the IP list as needed for your network.
