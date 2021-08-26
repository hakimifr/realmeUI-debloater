#!/bin/bash

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
com.coloros.filemanager 
com.coloros.compass2 
com.redteamobile.roaming 
com.realme.securitycheck 
com.coloros.phonemanager 
com.heytap.market 
com.heytap.themestore 
com.finshell.fin 
com.heytap.cloud 
com.realme.movieshot 
com.coloros.healthcheck 
com.coloros.backuprestore 
com.coloros.backuprestore.remoteservice


com.heytap.usercenter
com.coloros.gamespace
com.oppo.quicksearchbox
com.coloros.assistantscreen
com.coloros.weather2 
com.coloros.soundrecorder
com.coloros.screenrecorder
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
com.coloros.smartsidebar
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

sleeptimer=0s

while getopts i,h flag
do
case $flag in
    i)
        echo "this script is made to automate the process of debloating realme UI 1 / 2"
        echo "by @Hakimi0804"
        exit
        ;;
    h)
        echo "simply run the script and then choose the type of operation that you want to do"
        echo "launching main menu in 3 sec"
        sleep 3s
        mainmenu
        ;;
    *)  
        echo "invalid flag provided"
        exit
        ;;
esac
done

light () {
    counter=0
    clear
    echo "removing..."
    sleep 1s
    for app in $coloros_bloat
    do
        adb shell pm uninstall -k --user 0 $app
        ((counter++))
        if [[ $counter -ge 17 ]]
        then
            adb shell pm disable-user com.heytap.market     # App Market 
            adb shell pm disable-user com.heytap.themestore # Theme Store
            sleep $sleeptimer
            break
        fi
    done
    clear
    donedebloat
}

super () {
    clear
    echo "removing..."
    sleep 1s
    for app in $coloros_bloat
    do
        adb shell pm uninstall -k --user 0 $app
    done
    adb shell pm disable-user com.heytap.market
    adb shell pm disable-user com.heytap.themestore
    sleep $sleeptimer
    clear
    donedebloat
}

gapps () {
    clear
    echo "removing..."
    sleep 1s
    for app in $gapps_list
    do
        adb shell pm uninstall -k --user 0 $app
    done
    sleep $sleeptimer
    clear
    donedebloat
}

rebloat () {
    clear
    echo "rebloating..."
    sleep 1s
    for app in $coloros_bloat $gapps_list
    do
        adb shell cmd package install-existing --user 0 $app
    done
    adb shell pm enable com.heytap.market
    adb shell pm enable com.heytap.themestore 
    sleep $sleeptimer
    clear
    donedebloat
}

checkadb () {
    clear
    tput setaf 2; adb devices; tput sgr 0
    echo 1 - "return to menu"
    echo 2 - "exit"
    read -p "Type 1, or 2 then press ENTER: " donecheck
    if [[ $donecheck == 1 ]]
    then
        mainmenu
    elif [[ $donecheck == 2 ]]
    then
        clear
        exit
    elif [[ $donecheck == "test" ]]
    then
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
    if [[ $donedebloatprompt == 1 ]]
    then
        mainmenu
    elif [[ $donedebloatprompt == 2 ]]
    then
        clear
        exit
    elif [[ $donedebloatprompt == "test" ]]
    then
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
    donedebloat
}

custom () {
    clear
    read -p "Enter package name (type exit to go back to the menu): " customprompt
    if [[ $customprompt == "exit" ]]
    then
        mainmenu
    else
        adb shell pm uninstall -k --user 0 $customprompt
        sleep $sleeptimer
        custom
    fi
}

mainmenu () {
    clear
    mode=0
    echo "$(tput setaf 2)-----------------------------------------------------------------------------------------------------------$(tput sgr 0)"
    echo "$(tput setaf 6)lalalalala this is a cheaply made script feel free to modify it if something is wrong kek"
    echo "please make sure you've installed adb on your linux system."
    echo "search on google how to do that."
    echo "com.coloros.weather.service will not be debloated to prevent realme UI 2.0 user from softlocking their phone."
    echo "com.oppo.ota and com.oppo.otaui will also be excluded to make sure you can still receive ota."
    echo "happy debloating$(tput sgr 0)"
    echo "$(tput setaf 2)-----------------------------------------------------------------------------------------------------------$(tput sgr 0)"
    echo "$(tput setaf 7; tput bold)1 - light debloat"
    echo "2 - full debloat (not including gapps)"
    echo "3 - Google apps debloat"
    echo "4 - rebloat all debloated apps"
    echo "5 - check if adb is working"
    echo "6 - kill adb daemon"
    echo "7 - custom package"
    echo "8 - exit$(tput sgr 0)"
    
    read -p "Type 1, 2, 3, 4, 5, 6, 7 or 8 then press ENTER: " mode
    if [[ $mode == 1 ]]
    then
        light
    elif [[ $mode == 2 ]]
    then
        super
    elif [[ $mode == 3 ]]
    then
        gapps
    elif [[ $mode == 4 ]]
    then
        rebloat
    elif [[ $mode == 5 ]]
    then
        checkadb
    elif [[ $mode == 6 ]]
    then
        killadb
    elif [[ $mode == 7 ]]
    then
        clear
        custom
    elif [[ $mode == 8 ]]
    then
        clear
        exit
    elif [[ $mode == "test" ]]
    then
        sleeptimer=20
        echo "Sleep timer set to 20s"
        sleep 1.5s
        mainmenu
    else
        echo "$(tput setaf 1; tput bold)Enter a valid input."
        echo "Returning to menu in 3 seconds.$(tput sgr 0)"
        sleep 3s
        mainmenu
    fi
}

mainmenu
