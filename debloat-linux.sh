#!/bin/bash

# well if this script look messy, that's because it is.
# maybe i should separate them and then use source / . .
# i think i'll do that *later*

gapps_list="
com.google.android.keep
com.google.android.apps.wellbeing
com.google.android.apps.nbu.paisa.user
com.google.android.projection.gearhead
com.google.android.gm
com.google.android.googlequicksearchbox
com.google.android.marvin.talkback
com.android.hotwordenrollment.okgoogle
com.google.android.tts
com.google.android.feedback
com.google.android.gms.location.history
com.google.android.inputmethod.latin
com.google.android.youtube
com.google.android.apps.youtube.music
com.google.android.dialer
com.google.android.contacts
com.google.android.apps.messaging
com.google.android.apps.googleassistant
com.google.android.apps.podcasts
com.google.android.apps.subscription
"

coloros_bloat="
com.heytap.browser 
com.oppo.music 
com.heytap.music 
com.coloros.video  
com.coloros.compass2 
com.redteamobile.roaming 
com.realme.securitycheck 
com.coloros.phonemanager
com.finshell.fin 
com.heytap.cloud 
com.realme.movieshot 
com.coloros.healthcheck 
com.coloros.backuprestore 
com.coloros.backuprestore.remoteservice


com.coloros.filemanager
com.heytap.usercenter
com.oppo.quicksearchbox
com.coloros.assistantscreen
com.coloros.weather2 
com.coloros.soundrecorder
com.coloros.phonemanager
com.facebook.system
com.facebook.services
com.facebook.appmanager
com.android.fmradio
com.coloros.focusmode
com.heytap.pictorial 
com.coloros.oshare
com.nearme.atlas 
com.coloros.floatassistant
com.coloros.securepay
com.coloros.smartdrive
com.coloros.sceneservice
com.coloros.ocrscanner
com.heytap.themestore
com.oppo.operationManual
com.coloros.phonenoareainquire
com.ted.number
com.oppo.logkit
com.coloros.logkit
com.coloros.childrenspace
com.heytap.habit.analysis
com.heytap.openid
com.coloros.lockassistant
com.coloros.securitypermission
com.coloros.healthservice
com.coloros.oppomultiapp
"

bloatutil() {
            markettheme () {
                clear
                echo "$(tput bold)removing app market and theme store ...$(tput sgr 0)"
                adb shell pm disable-user com.heytap.market
                adb shell pm disable-user com.heytap.themestore
                miscutil "donedebloat"
            }
            super () {
                if [ -e "full-debloat.log" ]; then
                rm full-debloat.log
                fi
                clear
                for app in $coloros_bloat
                do
                    echo "$(tput bold)removing $app ...$(tput sgr 0)"
                    echo "removing $app" >> full-debloat.log
                    echo "$(adb shell pm uninstall -k --user 0 $app)" >> full-debloat.log
                    echo "" >> full-debloat.log
                    clear
                done
                markettheme
            }
            light () {
                if [ -e "light-debloat.log" ]; then
                rm light-debloat.log
                fi
                counter=0
                clear
                for app in $coloros_bloat
                do
                    echo "$(tput bold)removing $app ...$(tput sgr 0)"
                    echo "removing $app" >> light-debloat.log
                    echo "$(adb shell pm uninstall -k --user 0 $app)" >> light-debloat.log
                    echo "" >> light-debloat.log
                    ((counter++))
                    clear
                    if [ "$counter" -ge "14" ]; then
                        markettheme
                        break
                    fi
                done
            }
            gapps () {
                if [ -e "gapps-debloat.log" ]; then
                rm gapps-debloat.log
                fi
                clear
                sleep 1s
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
            rebloat () {
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
                sleep $sleeptimer
                clear
                miscutil "donedebloat"
            }
            custom () {
                clear
                read -p "Enter package name (type exit to go back to the menu): " customprompt
                if [ "$customprompt" == "exit" ]; then
                    mainmenu
                else
                    echo "removing $customprompt"
                    echo "removing $customprompt" >> custom-debloat.log
                    echo "$(adb shell pm uninstall -k --user 0 "$customprompt")" >> custom-debloat.log
                    sleep $sleeptimer
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

showutil() {
            showlight () {
                counter=0
                clear
                for app in $coloros_bloat
                do
                    echo "$app"
                    ((counter++))
                    if [ "$counter" -ge "14" ]; then
                        echo "com.heytap.market"
                        echo "com.heytap.themestore"
                        break
                    fi
                done
                showmenu
            }
            showsuper () {
                clear
                for app in $coloros_bloat
                do
                    echo "$app"
                done
                echo "com.heytap.market"
                echo "com.heytap.themestore"
                showmenu
            }
            showgapps () {
                clear
                for app in $gapps_list
                do
                    echo "$app"
                done
                showmenu
            }
            showmenu () {
                tput setaf 2; tput bold
                echo "1 - view light debloat package"
                echo "2 - view full debloat package"
                echo "3 - view gapps debloat package"
                echo "4 - main menu"
                tput sgr 0
                read -p "Enter your choice: " SHOWMENUP
                if [ "$SHOWMENUP" == "1" ]; then
                    showlight
                elif [ "$SHOWMENUP" == "2" ]; then
                    showsuper
                elif [ "$SHOWMENUP" == "3" ]; then
                    showgapps
                elif [ "$SHOWMENUP" == "4" ]; then
                    mainmenu
                else
                    tput setaf 1; tput bold
                    echo "invalid choice."
                    echo "returning to menu in 3 sec"
                    sleep 3s
                    tput sgr 0
                    clear
                    showmenu
                fi
            }
    
    case $1 in
    menu)
        showmenu
        ;;
    gapps)
        showgapps
        ;;
    super)
        showsuper
        ;;
    light)
        showlight
        ;;
    esac
}


miscutil() {
            checkadb () {
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
                elif [ "$donecheck" == "test" ]; then
                    sleeptimer=20
                    echo "Sleep timer set to 20s"
                    sleep 1.5s
                    mainmenu
                else
                    echo "$(tput setaf 1; tput bold)Enter a valid input."
                    echo "Returning to menu in 3 seconds.$(tput sgr 0)"
                    sleep 3s
                    checkadb
                fi
            }
            donedebloat () {
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
                elif [ "$donedebloatprompt" == "test" ]; then
                    sleeptimer=20
                    echo "Sleep timer set to 20s"
                    sleep 1.5s
                    mainmenu
                else
                    echo "$(tput setaf 1; tput bold)Enter a valid input."
                    echo "Returning to menu in 3 seconds.$(tput sgr 0)"
                    sleep 3s
                    donedebloat
                fi
            }
            killadb () {
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


mainmenu () {
    clear
    mode=0
    echo "$(tput setaf 2)*************************************************************$(tput sgr 0)"
    tput setaf 6
    echo "  realme UI debloater     |       only for realme UI 1 / 2"
    echo "  all package are tested, and should not cause issues when"
    echo "  debloated."
    echo "  with that in mind, I AM NOT RESPONSIBLE FOR ANY DAMAGE."
    tput sgr 0
    echo "$(tput setaf 2)*************************************************************$(tput sgr 0)"
    echo "$(tput setaf 7; tput bold)1 - light debloat"
    echo "2 - full debloat (not including gapps)"
    echo "3 - Google apps debloat"
    echo "4 - rebloat all debloated apps"
    echo "5 - check if adb is working"
    echo "6 - kill adb daemon"
    echo "7 - custom package"
    echo "8 - view debloat package"
    echo "9 - exit$(tput sgr 0)"
    
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
        showutil "menu"
        ;;
    9)
        clear
        echo "bye"
        exit
        ;;
    *)
        echo "$(tput setaf 1; tput bold)Enter a valid input."
        echo "Returning to menu in 3 seconds.$(tput sgr 0)"
        sleep 3s
        mainmenu
        ;;
esac
}

mainmenu
