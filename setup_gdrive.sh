#!/bin/bash 

# termux-gdrive-backup
# an automated android backup system
# script created by christian garcia

# run the script to configure gdrive account
# follow the instruction in README.md
echo "configuring rclone to gdrive..."
echo "--- follow the instructions to authorize access. ---"
rclone config create gdrive drive