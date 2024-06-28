#!/bin/bash

# termux-gdrive-backup
# an automated android backup system
# script created by christian garcia

# restart termux then execute this line

# stop service
sv down cron

# remove crontab
echo "removing crontab file.."
crontab -r

# remove start-up script
echo "removing start-up script..."
rm ~/.termux/boot/start-cron.sh

# remove symbolic links
echo "removing symbolic links..."
rm ~/.termux/service/cron 

# check if the cron job is removed
echo "checking remove file..."
crontab -l
echo "disable successfully!"
