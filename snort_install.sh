# snort_install.sh
#!/bin/bash

# Update and install Snort
apt-get update
apt-get install -y snort

# Configure Snort
echo 'include /etc/snort/rules/local.rules' >> /etc/snort/snort.conf
echo 'alert icmp any any -> any any (msg:"ICMP Packet"; sid:1000001; rev:1;)' > /etc/snort/rules/local.rules

# Start Snort
systemctl start snort
systemctl enable snort
