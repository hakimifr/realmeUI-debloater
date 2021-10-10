#!/bin/bash
# \shellcheck configuration
# shellcheck disable=SC2162
# shellcheck disable=SC1091

readonly ghlink="https://raw.githubusercontent.com/Hakimi0804/realmeUI-debloater/main"
fetch-plist() {
    echo "fetching package list"
    curl -s "$ghlink"/packagelist/gapps.txt -o gapps.txt
    curl -s "$ghlink"/packagelist/coloros.txt -o coloros.txt
}
fetch-utils() {
    echo "fetching utils"
    mkdir -p linux-utils
    curl -s "$ghlink"/linux-utils/bloat.sh -o bloat.sh
    curl -s "$ghlink"/linux-utils/misc.sh -o misc.sh
}

if [ ! -f gapps.txt ] || [ ! -f coloros.txt ]; then
    fetch-plist
fi
if [ ! -f linux-utils/bloat.sh ] || [ ! -f linux-utils/misc.sh ]; then
    fetch-utils
fi

case $1 in
-r|--refresh)
    fetch-plist
    fetch-utils
    ;;
esac

source linux-utils/bloat.sh
source linux-utils/misc.sh
gapps_list="$(cat gapps.txt)"
coloros_bloat="$(cat coloros.txt)"

mainmenu() {
    clear
    mode=0
    echo "$(tput setaf 2)*************************************************************$(tput sgr 0)"
    tput setaf 6
    echo "  realme UI debloater     |       only for realme UI 1 / 2"
    echo "  all package are tested, and should not cause issues when"
    echo "  debloated."
    echo "  that being said, I AM NOT RESPONSIBLE FOR ANY DAMAGE."
    tput sgr 0
    echo "$(tput setaf 2)*************************************************************$(tput sgr 0)"
    echo "$(tput setaf 7; tput bold)1 - light debloat"
    echo "2 - full debloat (not including gapps)"
    echo "3 - Google apps debloat"
    echo "4 - rebloat all debloated apps"
    echo "5 - check if adb is working"
    echo "6 - kill adb daemon"
    echo "7 - custom package"
    echo "8 - exit$(tput sgr 0)"
    
    read -p "Enter your choice: " mode
    
    case $mode in
    1)
        light
        ;;
    2)
        super
        ;;
    3)
        gapps
        ;;
    4)
        rebloat
        ;;
    5)
        checkadb
        ;;
    6)
        killadb
        ;;
    7)
        clear
        custom
        ;;
    8)
        clear
        echo "bye"
        exit
        ;;
    *)
        mainmenu
        ;;
esac
}

mainmenu
