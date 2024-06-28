#!/bin/bash

# termux-gdrive-backup
# an automated android backup system
# script created by christian garcia

# PS: read description before performing backup
# for more info visit:
# https://rclone.org/
#
#

# initialize the directory and remote path
# change the directory folder name that existed in termux 
# folder name contains file you want to backup
LOCAL_DIRECTORY="/data/data/com.termux/files/home/<foldername_existed>"
REMOTE_DIRECTORY="gdrive:/termux_files/backup"

# check if the remote directory is already exist 
# create path if it is not 
echo "checking remote directory..."
rclone mkdir "$REMOTE_DIRECTORY"

# perform backup 
# create log file to see log info
echo "performing backup..."
rclone sync "$LOCAL_DIRECTORY" "$REMOTE_DIRECTORY" --log-file=/data/data/com.termux/files/home/rclone.log --log-level INFO

# notify user if backup is finished
echo "==================== >>>>"
echo "backup of $LOCAL_DIRECTORY to gdrive is complete."
echo "check your gdrive in $REMOTE_DIRECTORY"
