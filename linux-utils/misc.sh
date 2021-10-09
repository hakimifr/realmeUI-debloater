#!/bin/false
# shellcheck shell=bash
checkadb() {
    clear
    tput setaf 2; adb devices; tput sgr 0
    echo 1 - "return to menu"
    echo 2 - "exit"
    read -p "Type 1, or 2 then press ENTER: " donecheck
    if [ "$donecheck" == "1" ]; then
        mainmenu
    elif [ "$donecheck" == "2" ]; then
        clear
        exit
    else
        mainmenu
    fi
}
donedebloat() {
    clear
    echo "$(tput setaf 2; tput bold)done!"
    echo "1 - return to menu"
    echo "2 - exit$(tput sgr 0)"
    read -p "Type 1, or 2 then press ENTER: " donedebloatprompt
    if [ "$donedebloatprompt" == "1" ]; then
        mainmenu
    elif [ "$donedebloatprompt" == "2" ]; then
        clear
        exit
    else
        mainmenu
    fi
}
killadb() {
    clear
    echo "Killing"
    adb kill-server
    donedebloat
}
confirmation() {
    # $1 - gapps_list/coloros_bloat
    # light/null (super)
    echo "the following package will be removed:"
    for package in $1; do
        if [ "$2" = "light" ]; then
            if [ "$package" = "#END_LIGHT" ]; then
                break
            fi
        fi
        printf "%s  " "$package"
    done
    echo
    read -p "continue?: " conf
    if [ "$conf" != "y" ]; then
        mainmenu
    fi
}
