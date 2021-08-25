# realme UI Debloater
Dear realme users, please stop debloating `com.coloros.weather.service` to prevent lock screen flicker OK?

Currently only tested on **realme UI 2.0**.

## How to Use
### Linux User
[Click here to download the bash script file](https://github.com/Hakimi0804/realmeUI-debloater/releases/tag/v2.1).

How do I use it?
- Setting up platform-tools:
  1. Do a Google search on how to set up adb and fastboot for your linux distro.
     For example:
     
     Fedora: `sudo dnf install android-tools`
         
     Ubuntu: `sudo apt install adb fastboot`
     
     *(Side Note: For Ubuntu, this will install a slightly outdated version of adb and fastboot. use [this installer](https://github.com/Hakimi0804/realmeUI-debloater/releases/download/v1.0/ubuntu-adb-setup.sh) to install latest version.)*
  2. Enable USB debugging, this phone setting can be found in developer options.
  3. Connect the phone to your PC.
  4. Launch terminal and enter this command: `adb devices` (Check your phone, there should be a prompt asking you to grant USB debugging. Tick always allow and press allow.)
  5. Enter `adb devices` again to check if your device is authorized. If it outputs something like `SERIAL_NUMBER   DEVICE`, then congratulations, you've done the setup properly.
 
- Executing the script: 
  1. Launch terminal. Navigate to the folder where the script are.
  2. To run the script, first you need to give execute permission: `chmod +x debloat-linux.sh`
  3. Execute the script: `./debloat-linux.sh`.
*(Pro Tip: you can download the script with this command: `wget https://github.com/Hakimi0804/realmeUI-debloater/releases/download/v1.0/debloat-linux.sh`)*

## Windows User
[Click here to download the batch file](https://github.com/Hakimi0804/realmeUI-debloater/releases/tag/v1.0).

How do I use it?
- Setting up platform-tools:
  1. Download [platform-tools](https://dl.google.com/android/repository/platform-tools-latest-windows.zip) compressed file.
  2. Unzip it and put it on `C:\`. Don't put it on any other folder.
  3. Enable USB debugging, this phone setting can be found in developer options.
  4. Connect the phone to the PC.
  5. Launch cmd and enter these command one by one: `cd \platform-tools`, `adb devices` (Check your phone, there should be a prompt asking you to grant USB debugging. Tick always allow and press allow).
  6. Enter in `adb devices` again to check if your device is authorized. If it outputs something like `SERIAL_NUMBER   DEVICE`, then congratulations, you've done the setup properly.

- Executing the script:
  1. [Download](https://github.com/Hakimi0804/realmeUI-debloater/releases/download/v1.0/realme-UI-debloater.bat) the script and copy it to the platform-tools folder.
  2. From the platform-tools folder, double click the script. A cmd window should show up. Do as the prompt say, select mode that you want.
  3. That's it! Have fun debloating all these crap!


## Side Notes
- well ok i added script for linux user heh
- pardon me if i suck at scripting ok
- i did this just for fun lol
- readme.md fixed by [raymond](https://raymond-1227.github.io/) and ok bye
