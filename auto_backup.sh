#!/bin/bash

# termux-gdrive-backup
# an automated android backup system
# script created by christian garcia

# PS: read the description before performing
# for more info visit:
# https://docs.rockylinux.org/guides/automation/cronie/

# install termux services
pkg install -y termux-services

# setup cron services for auto backup session
# using termux services to enable services 
mkdir -p ~/.termux/service
ln -s ~/../usr/etc/service/cron ~/.termux/service
termux-services enable cron

# adding cron job to backup file daily in 6pm
# configure specific time to backup automatically

#(crontab -l ; echo "0 0 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
#(crontab -l ; echo "0 1 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 2 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 3 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 4 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 5 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 6 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 7 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 8 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 9 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 10 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 11 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 12 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 13 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 14 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 15 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 16 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 17 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
(crontab -l ; echo "0 18 * * * /data/data/com.termux/files/home/termux-gdrive-backup/backup.sh") | crontab -
# (crontab -l ; echo "0 19 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 20 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 21 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 22 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 23 * * * /data/data/com.termux/files/home/backup.sh") | crontab -
# (crontab -l ; echo "0 24 * * * /data/data/com.termux/files/home/backup.sh") | crontab -

# start up script to termux boot
mkdir -p ~/.termux/boot
cat > ~/.termux/boot/start-cron.sh <<EOF
#!/data/data/com.termux/files/usr/bin/sh
termux-services restart cron
EOF

# make the script executable
echo "file is executable..."
chmod +x ~/.termux/boot/start-cron.sh

# notification message
echo "setup completed."
echo "backup script will run daily in 6pm."
echo "restart termux and run (sv up cron)"

# check the status run: sv status cron
# check the list run: crontab -l
