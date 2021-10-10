#!/bin/false
# shellcheck shell=bash

markettheme() {
    clear
    echo "$(tput bold)removing app market and theme store ...$(tput sgr 0)"
    adb shell pm disable-user com.heytap.market
    adb shell pm disable-user com.heytap.themestore
    donedebloat
}

super() {
    if [ -e "full-debloat.log" ]; then
    rm full-debloat.log
    fi
    clear
    
    confirmation "$coloros_bloat" "null"
    
    for app in $coloros_bloat
    do
        if [ "$app" = "#END_LIGHT" ]; then
            continue
        fi
        echo "$(tput bold)removing $app ...$(tput sgr 0)"
        echo "removing $app" >> full-debloat.log
        echo "$(adb shell pm uninstall -k --user 0 $app)" >> full-debloat.log
        echo "" >> full-debloat.log
        clear
    done
    markettheme
}

light() {
    if [ -e "light-debloat.log" ]; then
    rm light-debloat.log
    fi
    clear
    
    confirmation "$coloros_bloat" "light"
    
    for app in $coloros_bloat
    do
        if [ "$app" = "#END_LIGHT" ]; then
            markettheme
            break
        fi
        echo "$(tput bold)removing $app ...$(tput sgr 0)"
        echo "removing $app" >> light-debloat.log
        echo "$(adb shell pm uninstall -k --user 0 $app)" >> light-debloat.log
        echo >> light-debloat.log
        clear
    done
}

gapps() {
    if [ -e "gapps-debloat.log" ]; then
    rm gapps-debloat.log
    fi
    clear
    
    confirmation "$gapps_list" "null"
    
    for app in $gapps_list
    do
        echo "$(tput bold)removing $app ...$(tput sgr 0)"
        echo "removing $app" >> gapps-debloat.log
        echo "$(adb shell pm uninstall -k --user 0 $app)" >> gapps-debloat.log
        echo "" >> gapps-debloat.log
        clear
    done
    markettheme
}

rebloat() {
    if [ -e "rebloat.log" ]; then
    rm rebloat.log
    fi
    clear
    for app in $coloros_bloat $gapps_list
    do
        echo "$(tput bold)installing $app ...$(tput sgr 0)"
        echo "installing $app" >> rebloat.log
        echo "$(adb shell cmd package install-existing --user 0 $app)" >> rebloat.log
        echo "" >> rebloat.log
        clear
    done
    echo "$(tput bold)enabling app market and theme store$(tput sgr 0)"
    echo "enabling app market and theme store" >> rebloat.log
    adb shell pm enable com.heytap.market
    adb shell pm enable com.heytap.themestore 
    
    clear
    donedebloat
}

custom() {
    clear
    read -p "Enter package name (type exit to go back to the menu): " customprompt
    if [ "$customprompt" == "exit" ]; then
        mainmenu
    else
        echo "removing $customprompt"
        echo "removing $customprompt" >> custom-debloat.log
        echo "$(adb shell pm uninstall -k --user 0 "$customprompt")" >> custom-debloat.log

        custom
    fi
}