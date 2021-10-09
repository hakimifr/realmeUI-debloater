#!/bin/bash
# \shellcheck configuration
# shellcheck disable=SC2162

# well if this script look messy, that's because it is.
# maybe i should separate them and then use source / . .
# i think i'll do that *later*

readonly ghlink="https://raw.githubusercontent.com/Hakimi0804/realmeUI-debloater/main/packagelist"
fetch() {
    echo "fetching package list"
    curl -s "$ghlink"/gapps.txt -o gapps.txt
    curl -s "$ghlink"/coloros.txt -o coloros.txt
}

if [ ! -f gapps.txt ] || [ ! -f coloros.txt ]; then
    fetch
fi
case $1 in
-r|--refresh)
    fetch
    ;;
esac

gapps_list="$(cat gapps.txt)"
coloros_bloat="$(cat coloros.txt)"

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

bloatutil() {
            markettheme() {
                clear
                echo "$(tput bold)removing app market and theme store ...$(tput sgr 0)"
                adb shell pm disable-user com.heytap.market
                adb shell pm disable-user com.heytap.themestore
                miscutil "donedebloat"
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
                miscutil "donedebloat"
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

    case $1 in
    light)
        light
        ;;
    super)
        super
        ;;
    gapps)
        gapps
        ;;
    rebloat)
    rebloat
        ;;
    custom)
        custom
        ;;
    esac
}

miscutil() {
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
                miscutil "donedebloat"
            }

    case $1 in
    checkadb)
        checkadb
        ;;
    donedebloat)
        donedebloat
        ;;
    killadb)
        killadb
        ;;
    esac
}


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
        bloatutil "light"
        ;;
    2)
        bloatutil "super"
        ;;
    3)
        bloatutil "gapps"
        ;;
    4)
        bloatutil "rebloat"
        ;;
    5)
        miscutil "checkadb"
        ;;
    6)
        miscutil "killadb"
        ;;
    7)
        clear
        bloatutil "custom"
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
