#!/bin/bash

# termux-gdrive-backup
# an automated android backup system
# script created by christian garcia

# check if the package already exist
check_package() {
  if ! dpkg -s "$1" &> /dev/null; then
    return 1
  else
    return 0
  fi
}

# install required packages
# handling package existence

# start Installing
echo "----- start -----"
# install rclone 
install_rclone() {
  if ! check_package "rclone"; then
    echo "<<<<< Installing rclone... >>>>>"
    pkg install rclone -y
  else
    echo "===== rclone is already installed ====="
  fi
}

# install cronie
install_cronie() {
  if ! check_package "cronie"; then
    echo "<<<<< Installing cronie... >>>>>"
    pkg install cronie -y
  else
    echo "===== cronie is already installed ====="
  fi
}

# install packages
install_packages() {
  install_rclone
  install_cronie
}

# call function to install
install_packages

echo "----- package installation completed. -----"
