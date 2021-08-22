#!/bin/bash

# 7z installation
sudo apt-get -y install p7zip
clear

# adb setup and update
echo "

#########################################
#                                       #
#   ADB FASTBOOT INSTALLER AND UPDATER  #
#           by: Hakimi0804              #
#                                       #
#########################################

"

echo -e "Usually when you install adb and fastboot by "sudo apt install adb fastboot" you'll get old version. You'll notice this if you try to use fastboot reboot recovery. This script automate the process of installing and updating the adb and fastboot to latest version by Google.\n"
sleep 2
cd ~

# install by apt
echo "$(tput setaf 2)Installing adb and fastboot through aptitude ...$(tput setaf 7)"
sudo apt-get -y install adb fastboot

# remove files from prev installation
echo "$(tput setaf 2)Removing previous platform-tools folder and zip if available ...$(tput setaf 7)"
rm platform-tools-latest-linux.zip
rm -rf platform-tools

# download latest adb fastboot directly from google
echo "$(tput setaf 2)Downloading latest platform-tools ...$(tput setaf 7)"
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip

# extract with 7z
echo "$(tput setaf 2)Extracting ...$(tput setaf 7)"
7z x platform-tools-latest-linux.zip
cd platform-tools

# copy to path
echo "$(tput setaf 2)Copying files ...$(tput setaf 7)"
sudo cp -r * /usr/lib/android-sdk/platform-tools/

# apt autoremove
echo "$(tput setaf 2)Removing unnecessary packages ...$(tput setaf 7)"
sudo apt-get -y autoremove

# cleanup
echo "$(tput setaf 2)cleaning ...$(tput setaf 7)"
cd ~
echo "$(tput setaf 2)Removing platform-tools folder ...$(tput setaf 7)"
rm -rf platform-tools/
echo "$(tput setaf 2)Removing platform-tools zip ...$(tput setaf 7)"
rm platform-tools-latest-linux.zip
echo "$(tput setaf 2)done!"
