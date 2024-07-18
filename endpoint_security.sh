# endpoint_security.sh
#!/bin/bash

# Install ClamAV for endpoint protection
apt-get update
apt-get install -y clamav

# Update ClamAV database
freshclam

# Schedule daily scan
echo "0 2 * * * root /usr/bin/clamscan -r /home" >> /etc/crontab

# Start ClamAV
systemctl start clamav-freshclam
systemctl enable clamav-freshclam
