#!/bin/bash

gapps_list="
com.google.android.keep                          # Google Keep Notes
com.google.android.apps.wellbeing                # Digital Wellbeing
com.google.android.apps.nbu.paisa.user           # Google Pay
com.google.android.projection.gearhead           # Android Auto
com.google.android.gm                            # Gmail
com.google.android.googlequicksearchbox          # Google
com.google.android.marvin.talkback               # Android Accessibility Suite
com.android.hotwordenrollment.okgoogle           # OK Google Enrollment
com.google.android.tts                           # Google Text-To-Speech Engine
com.google.android.feedback                      # Market Feedback Agent
com.google.android.gms.location.history          # Google Location History
com.google.android.inputmethod.latin             # Gboard (Google Keyboard)
com.google.android.youtube                       # Youtube
com.google.android.apps.youtube.music            # Youtube-Music
com.google.android.dialer                        # Google Phone
com.google.android.contacts                      # Google Contacts
com.google.android.apps.messaging                # Google Messages
com.google.android.apps.googleassistant          # Google Assistant
com.google.android.apps.podcasts                 # Google Podcast
com.google.android.apps.subscription             # Google One
"

coloros_bloat="
# light
com.heytap.browser                               # Realme Browser 
com.oppo.music                                   # Music (RUI-1) 
com.heytap.music                                 # Music (RUI-2) 
com.coloros.video                                # Video 
com.coloros.filemanager                          # File Manager 
com.coloros.compass2                             # Compass 
com.redteamobile.roaming                         # ORoaming 
com.realme.securitycheck                         # Security Analysis 
com.coloros.phonemanager                         # Phone Manager 
com.heytap.market                                # App Market 
com.heytap.themestore                            # Theme Store 
com.finshell.fin                                 # Finshell payment 
com.heytap.cloud                                 # Heytap Cloud 
com.realme.movieshot                             # Movie Shot 
com.coloros.healthcheck                          # Quick check 
com.coloros.backuprestore                        # Clone Phone 
com.coloros.backuprestore.remoteservice          # Clone Phone Remote Service

# leftover
com.heytap.usercenter                            # My Realme
com.coloros.gamespace                            # App Enhancement Services
com.oppo.quicksearchbox                          # Oppo Search
com.coloros.assistantscreen                      # Smart Assistant
com.coloros.weather2                             # Weather 
com.coloros.soundrecorder                        # Recorder
com.coloros.screenrecorder                       # Screen Recording
com.coloros.phonemanager                         # Phone Manager
com.facebook.system                              # Facebook App Installer
com.facebook.services                            # Facebook Services
com.facebook.appmanager                          # Facebook App Manager
com.android.fmradio                              # FM Radio
com.coloros.focusmode                            # Focus Mode
com.heytap.pictorial                             # Lockscreen Magazine 
com.coloros.oshare                               # Realme Share
com.nearme.atlas                                 # Secure Payment 
com.coloros.floatassistant                       # Assistive Ball
com.coloros.securepay                            # Payment Protection
com.coloros.smartdrive                           # Smart Driving
com.coloros.sceneservice                         # Smart Services
com.coloros.ocrscanner                           # OCR Scanner
com.coloros.smartsidebar                         # Smart Sidebar
com.heytap.themestore                            # Theme Store
com.oppo.operationManual                         # User Guide
com.coloros.phonenoareainquire                   # Number Origin
com.ted.number                                   # Identification Of Unknown Numbers
com.oppo.logkit                                  # Feedback Toolkit (RUI-1)
com.coloros.logkit                               # Feedback (RUI-2)
com.coloros.childrenspace                        # Kids Space
com.heytap.habit.analysis                        # Intelligent Analytics System
com.heytap.openid                                # OpenID
com.coloros.lockassistant                        # Lock Assistant
com.coloros.securitypermission                   # Permission Management Of Phone Manager
com.coloros.healthservice                        # Health Service
com.coloros.oppomultiapp                         # App Cloner
"

counter=0
light () {
    clear
    echo "removing..."
    sleep 1s
    for app in $coloros_bloat
    do
        adb shell pm uninstall -k --user 0 $app
        ((counter++))
        if [ $counter -ge 17 ]
        then
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
    adb shell pm disable-user com.heytap.market     # App Market 
    adb shell pm disable-user com.heytap.themestore # Theme Store
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
    clear
    donedebloat
}

rebloat () {
    clear
    sleep 1s
    for app in $coloros_bloat $gapps_list
    do
        adb shell cmd package install-existing --user 0 $app
    done
    adb shell pm enable com.heytap.market     # App Market 
    adb shell pm enable com.heytap.themestore # Theme Store 
    clear
    donedebloat
}

checkadb () {
    clear
    tput setaf 2; adb devices; tput sgr 0
    echo 1 - "return to menu"
    echo 2 - "exit"
    read -p "Type 1, or 2 then press ENTER: " donecheck
    if [ $donecheck == 1 ]
    then
        mainmenu
    elif [ $donecheck == 2 ]
    then
        clear
        exit
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
    if [ $donedebloatprompt == 1 ]
    then
        mainmenu
    elif [ $donedebloatprompt == 2 ]
    then
        clear
        exit
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
    echo "7 - exit$(tput sgr 0)"
    
    read -p "Type 1, 2, 3, 4, 5, 6 or 7 then press ENTER: " mode
    if [ $mode == 1 ]
    then
        light
    elif [ $mode == 2 ]
    then
        super
    elif [ $mode == 3 ]
    then
        gapps
    elif [ $mode == 4 ]
    then
        rebloat
    elif [ $mode == 5 ]
    then
        checkadb
    elif [ $mode == 6 ]
    then
        killadb
    elif [ $mode == 7 ]
    then
        clear
        exit
    else
        echo "$(tput setaf 1)Enter a valid input."
        echo "Returning to menu in 3 seconds.$(tput sgr 0)"
        sleep 3s
        mainmenu
    fi
}

mainmenu
