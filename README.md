# realme UI Debloater
Dear realme users, please stop debloating `com.coloros.weather.service` to prevent lock screen flicker OK? Thank you for your notice.

## How to Use
**For linux user**, [click here to download the shell script file](https://github.com/Hakimi0804/realmeUI-debloater/releases/download/v1.0/debloat-linux.sh).
How to use?
- Setting up platform-tools:
  1. Do a Google search on how to set up adb and fastboot for your linux distro.
     For example:
     
     Fedora: `sudo dnf install android-tools`
         
     Ubuntu: `sudo apt install adb fastboot`
     
     (side note: for ubuntu this will install a slightly outdated version of adb and fastboot. use [this installer](https://github.com/Hakimi0804/realmeUI-debloater/releases/download/v1.0/ubuntu-adb-setup.sh) to install latest version).
  2. Enable USB debugging. Find it on developer option.
  3. Connect the phone to the pc.
  4. Launch terminal and enter this command:
     `adb devices` (check your phone, there should be a prompt asking you to grant USB debugging. Tick always allow and press allow).
  5. Enter in `adb devices` again to check if your device is authorised. If you see `SERIAL_NUMBER   DEVICE` on cmd, congratulations, you've done the setup properly.
 
- Executing the script: 
  1. Launch terminal. Navigate to the folder where the script are.
  2. To run the script, first you need to give execute permission.
     `chmod +x debloat-linux.sh`
  3. Execute the script.
     `./debloat-linux.sh`.
_brotip: you can download the script with this command: `wget https://github.com/Hakimi0804/realmeUI-debloater/releases/download/v1.0/debloat-linux.sh`_


**For Windows user**, [click here to download the batch file](https://github.com/Hakimi0804/realmeUI-debloater/raw/main/realme-UI-debloater.bat).
How to use?
- Setting up platform-tools:
  1. Download [platform-tools](https://dl.google.com/android/repository/platform-tools-latest-windows.zip) zip.
  2. Unzip it and put it on `C:\`. Do not put it on any other folder.
  3. Enable USB debugging. Find it on developer option.
  4. Connect the phone to the pc.
  5. Launch cmd and enter these command one by one:
     `cd \platform-tools`
     `adb devices` (check your phone, there should be a prompt asking you to grant USB debugging. Tick always allow and press allow).
  6. Enter in `adb devices` again to check if your device is authorised. If you see `SERIAL_NUMBER    DEVICE` on cmd, congratulations, you've done the setup properly.

- Executing the script:
  1. [Download](https://github.com/Hakimi0804/realmeUI-debloater/releases/download/v1.0/realme-UI-debloater.bat) the script and copy it to the platform-tools folder.
  2. From the platform-tools folder, double click the script. A cmd window should show up. Do as the prompt say, select mode that you want.
  3. That's it! Have fun debloating all those crap!


## Side Notes
- well ok i added script for linux user.
- pardon me if i sux at scripting ok.
- so why don't i add colour? well i'm too lazy to do that rn.
- I do this all for fun
- readme.md fixed by [raymond](https://raymond-1227.github.io/) and ok bye
