# bulk-ping-tools

## Overview
Scripts for scanning subnets and pinging hosts.

## Requirements
- `nmap` must be installed.

## Setup
1. Make scripts executable:
   ```bash
   chmod +x subnet_scan.sh bulk_ping.sh
   ```

## Usage
1. **Add subnets:**
   - Manually add to `subnets.txt` or run:
     ```bash
     ./subnet_scan.sh
     ```
     Enter subnets, then type 'q' to start scanning.

2. **Run the scan:**
   ```bash
   ./subnet_scan.sh
   ```
   - Results saved to `hosts.txt`.
   - Note: Scanning many networks can take a few minutes.

3. **Monitor scan progress:**
   - In a separate terminal:
     ```bash
     watch -d cat hosts.txt
     ```
   - For detailed network activity:
     ```bash
     sudo tcpdump -i <interface>
     ```

4. **Ping hosts:**
   ```bash
   ./bulk_ping.sh
   ```
   - Pings hosts in `hosts.txt`.

## Example
```bash
./subnet_scan.sh
./bulk_ping.sh
```

If `nmap` is not installed, manually add IPs to `hosts.txt`.
