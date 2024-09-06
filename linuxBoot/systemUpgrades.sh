#!/bin/bash
#system updates/upgrades
apt update
apt upgrade
#installations
apt-get install gcc
apt-get install python3
apt-get install ruby-full
apt-get install perl
apt-get install build-essential
apt-get install git-all
apt install terminator

echo "updates, upgrades, and installations complete"
#exit root shell
echo "The following files will be created and stored (if they don't already exist) in the home directory of a user."
echo "Which user do you want these files located in? Enter username:"
read user
sudo su $user
echo "Exited root shell to complete the rest of the installation"
