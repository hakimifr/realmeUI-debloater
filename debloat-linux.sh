#!/bin/bash

# ehy didn't I use for loops? well I copy pasted this from winblows script. Whatever i might fix it later but idk

light () {
    clear
    echo "removing..."
    sleep 1s
    adb shell pm uninstall -k --user 0 com.heytap.browser                               #Realme Browser
    adb shell pm uninstall -k --user 0 com.oppo.music                                   #Music (RUI-1)
    adb shell pm uninstall -k --user 0 com.heytap.music                                 #Music (RUI-2)
    adb shell pm uninstall -k --user 0 com.coloros.video                                #Video
    adb shell pm uninstall -k --user 0 com.coloros.filemanager                          #File Manager
    adb shell pm uninstall -k --user 0 com.coloros.compass2                             #Compass
    adb shell pm uninstall -k --user 0 com.redteamobile.roaming                         #ORoaming
    adb shell pm uninstall -k --user 0 com.realme.securitycheck                         #Security Analysis
    adb shell pm uninstall -k --user 0 com.coloros.phonemanager                         #Phone Manager
    adb shell pm uninstall -k --user 0 com.heytap.market                                #App Market
    adb shell pm uninstall -k --user 0 com.heytap.themestore                            #Theme Store
    adb shell pm disable-user com.heytap.market                                         #App Market
    adb shell pm disable-user com.heytap.themestore                                     #Theme Store
    adb shell pm uninstall -k --user 0 com.finshell.fin                                 #Finshell payment
    adb shell pm uninstall -k --user 0 com.heytap.cloud                                 #Heytap Cloud
    adb shell pm uninstall -k --user 0 com.realme.movieshot                             #Movie Shot
    adb shell pm uninstall -k --user 0 com.coloros.healthcheck                          #Quick check
    adb shell pm uninstall -k --user 0 com.coloros.backuprestore                        #Clone Phone
    adb shell pm uninstall -k --user 0 com.coloros.backuprestore.remoteservice          #Clone Phone Remote Service
    clear
    donedebloat
}

super () {
    clear
    echo "removing..."
    sleep 1s
    adb shell pm uninstall -k --user 0 com.heytap.browser                               #Realme Browser
    adb shell pm uninstall -k --user 0 com.oppo.music                                   #Music (RUI-1)
    adb shell pm uninstall -k --user 0 com.heytap.music                                 #Music (RUI-2)
    adb shell pm uninstall -k --user 0 com.coloros.video                                #Video
    adb shell pm uninstall -k --user 0 com.coloros.filemanager                          #File Manager
    adb shell pm uninstall -k --user 0 com.heytap.usercenter                            #My Realme
    adb shell pm uninstall -k --user 0 com.heytap.cloud                                 #Heytap Cloud
    adb shell pm uninstall -k --user 0 com.coloros.gamespace                            #App Enhancement Services
    adb shell pm uninstall -k --user 0 com.coloros.compass2                             #Compass
    adb shell pm uninstall -k --user 0 com.coloros.backuprestore                        #Clone Phone
    adb shell pm uninstall -k --user 0 com.oppo.quicksearchbox                          #Oppo Search
    adb shell pm uninstall -k --user 0 com.coloros.assistantscreen                      #Smart Assistant
    adb shell pm uninstall -k --user 0 com.redteamobile.roaming                         #ORoaming
    adb shell pm uninstall -k --user 0 com.coloros.weather2                             #Weather 
    adb shell pm uninstall -k --user 0 com.realme.securitycheck                         #Security Analysis
    adb shell pm uninstall -k --user 0 com.coloros.soundrecorder                        #Recorder
    adb shell pm uninstall -k --user 0 com.coloros.screenrecorder                       #Screen Recording
    adb shell pm uninstall -k --user 0 com.coloros.phonemanager                         #Phone Manager
    adb shell pm uninstall -k --user 0 com.facebook.system                              #Facebook App Installer
    adb shell pm uninstall -k --user 0 com.facebook.services                            #Facebook Services
    adb shell pm uninstall -k --user 0 com.facebook.appmanager                          #Facebook App Manager
    adb shell pm uninstall -k --user 0 com.android.fmradio                              #FM Radio
    adb shell pm uninstall -k --user 0 com.coloros.focusmode                            #Focus Mode
    adb shell pm uninstall -k --user 0 com.heytap.pictorial                             #Lockscreen Magazine 
    adb shell pm uninstall -k --user 0 com.coloros.oshare                               #Realme Share
    adb shell pm uninstall -k --user 0 com.nearme.atlas                                 #Secure Payment 
    adb shell pm uninstall -k --user 0 com.coloros.floatassistant                       #Assistive Ball
    adb shell pm uninstall -k --user 0 com.coloros.securepay                            #Payment Protection
    adb shell pm uninstall -k --user 0 com.coloros.smartdrive                           #Smart Driving
    adb shell pm uninstall -k --user 0 com.coloros.sceneservice                         #Smart Services
    adb shell pm uninstall -k --user 0 com.realme.movieshot                             #Movie Shot
    adb shell pm uninstall -k --user 0 com.coloros.ocrscanner                           #OCR Scanner
    adb shell pm uninstall -k --user 0 com.coloros.smartsidebar                         #Smart Sidebar
    adb shell pm uninstall -k --user 0 com.heytap.market                                #App Market
    adb shell pm uninstall -k --user 0 com.heytap.themestore                            #Theme Store
    adb shell pm disable-user com.heytap.market                                         #App Market
    adb shell pm disable-user com.heytap.themestore                                     #Theme Store
    adb shell pm uninstall -k --user 0 com.coloros.healthcheck                          #Quick check
    adb shell pm uninstall -k --user 0 com.oppo.operationManual                         #User Guide
    adb shell pm uninstall -k --user 0 com.coloros.phonenoareainquire                   #Number Origin
    adb shell pm uninstall -k --user 0 com.ted.number                                   #Identification Of Unknown Numbers
    adb shell pm uninstall -k --user 0 com.oppo.logkit                                  #Feedback Toolkit (RUI-1)
    adb shell pm uninstall -k --user 0 com.coloros.logkit                               #Feedback (RUI-2)
    adb shell pm uninstall -k --user 0 com.coloros.childrenspace                        #Kids Space
    adb shell pm uninstall -k --user 0 com.heytap.habit.analysis                        #Intelligent Analytics System
    adb shell pm uninstall -k --user 0 com.heytap.openid                                #OpenID
    adb shell pm uninstall -k --user 0 com.coloros.lockassistant                        #Lock Assistant
    adb shell pm uninstall -k --user 0 com.coloros.securitypermission                   #Permission Management Of Phone Manager
    adb shell pm uninstall -k --user 0 com.coloros.backuprestore.remoteservice          #Clone Phone Remote Service
    adb shell pm uninstall -k --user 0 com.coloros.healthservice                        #Health Service
    adb shell pm uninstall -k --user 0 com.coloros.oppomultiapp                         #App Cloner
    adb shell pm uninstall -k --user 0 com.coloros.providers.fileinfo                   #File Info
    adb shell pm uninstall -k --user 0 com.finshell.fin                                 #Finshell payment
    clear
    donedebloat
}

gapps () {
    clear
    echo "removing..."
    sleep 1s
    adb shell pm uninstall -k --user 0 com.google.android.keep                          #Google Keep Notes
    adb shell pm uninstall -k --user 0 com.google.android.apps.wellbeing                #Digital Wellbeing
    adb shell pm uninstall -k --user 0 com.google.android.apps.nbu.paisa.user           #Google Pay
    adb shell pm uninstall -k --user 0 com.google.android.projection.gearhead           #Android Auto
    adb shell pm uninstall -k --user 0 com.google.android.gm                            #Gmail
    adb shell pm uninstall -k --user 0 com.google.android.googlequicksearchbox          #Google
    adb shell pm uninstall -k --user 0 com.google.android.marvin.talkback               #Android Accessibility Suite
    adb shell pm uninstall -k --user 0 com.android.hotwordenrollment.okgoogle           #OK Google Enrollment
    adb shell pm uninstall -k --user 0 com.google.android.tts                           #Google Text-To-Speech Engine
    adb shell pm uninstall -k --user 0 com.google.android.feedback                      #Market Feedback Agent
    adb shell pm uninstall -k --user 0 com.google.android.gms.location.history          #Google Location History
    adb shell pm uninstall -k --user 0 com.google.android.inputmethod.latin             #Gboard (Google Keyboard)
    adb shell pm uninstall -k --user 0 com.google.android.youtube                       #Youtube
    adb shell pm uninstall -k --user 0 com.google.android.apps.youtube.music            #Youtube-Music
    adb shell pm uninstall -k --user 0 com.google.android.dialer                        #Google Phone
    adb shell pm uninstall -k --user 0 com.google.android.contacts                      #Google Contacts
    adb shell pm uninstall -k --user 0 com.google.android.apps.messaging                #Google Messages
    adb shell pm uninstall -k --user 0 com.google.android.apps.googleassistant          #Google Assistant
    adb shell pm uninstall -k --user 0 com.google.android.apps.podcasts                 #Google Podcast
    adb shell pm uninstall -k --user 0 com.google.android.apps.subscription             #Google One
    clear
    donedebloat
}

rebloat () {
    clear
    sleep 1s
    adb shell cmd package install-existing --user 0 com.heytap.browser                               #Realme Browser
    adb shell cmd package install-existing --user 0 com.oppo.music                                   #Music (RUI-1)
    adb shell cmd package install-existing --user 0 com.heytap.music                                 #Music (RUI-2)
    adb shell cmd package install-existing --user 0 com.coloros.video                                #Video
    adb shell cmd package install-existing --user 0 com.coloros.filemanager                          #File Manager
    adb shell cmd package install-existing --user 0 com.heytap.usercenter                            #My Realme
    adb shell cmd package install-existing --user 0 com.heytap.cloud                                 #Heytap Cloud
    adb shell cmd package install-existing --user 0 com.coloros.gamespace                            #App Enhancement Services
    adb shell cmd package install-existing --user 0 com.coloros.compass2                             #Compass
    adb shell cmd package install-existing --user 0 com.coloros.backuprestore                        #Clone Phone
    adb shell cmd package install-existing --user 0 com.oppo.quicksearchbox                          #Oppo Search
    adb shell cmd package install-existing --user 0 com.coloros.assistantscreen                      #Smart Assistant
    adb shell cmd package install-existing --user 0 com.redteamobile.roaming                         #ORoaming
    adb shell cmd package install-existing --user 0 com.coloros.weather2                             #Weather 
    adb shell cmd package install-existing --user 0 com.realme.securitycheck                         #Security Analysis
    adb shell cmd package install-existing --user 0 com.coloros.soundrecorder                        #Recorder
    adb shell cmd package install-existing --user 0 com.coloros.screenrecorder                       #Screen Recording
    adb shell cmd package install-existing --user 0 com.coloros.phonemanager                         #Phone Manager
    adb shell cmd package install-existing --user 0 com.facebook.system                              #Facebook App Installer
    adb shell cmd package install-existing --user 0 com.facebook.services                            #Facebook Services
    adb shell cmd package install-existing --user 0 com.facebook.appmanager                          #Facebook App Manager
    adb shell cmd package install-existing --user 0 com.android.fmradio                              #FM Radio
    adb shell cmd package install-existing --user 0 com.coloros.focusmode                            #Focus Mode
    adb shell cmd package install-existing --user 0 com.heytap.pictorial                             #Lockscreen Magazine 
    adb shell cmd package install-existing --user 0 com.coloros.oshare                               #Realme Share
    adb shell cmd package install-existing --user 0 com.nearme.atlas                                 #Secure Payment 
    adb shell cmd package install-existing --user 0 com.coloros.floatassistant                       #Assistive Ball
    adb shell cmd package install-existing --user 0 com.coloros.securepay                            #Payment Protection
    adb shell cmd package install-existing --user 0 com.coloros.smartdrive                           #Smart Driving
    adb shell cmd package install-existing --user 0 com.coloros.sceneservice                         #Smart Services
    adb shell cmd package install-existing --user 0 com.realme.movieshot                             #Movie Shot
    adb shell cmd package install-existing --user 0 com.coloros.ocrscanner                           #OCR Scanner
    adb shell cmd package install-existing --user 0 com.coloros.smartsidebar                         #Smart Sidebar
    adb shell cmd package install-existing --user 0 com.heytap.market                                #App Market
    adb shell cmd package install-existing --user 0 com.heytap.themestore                            #Theme Store
    adb shell pm enable com.heytap.market                                                            #App Market
    adb shell pm enable com.heytap.themestore                                                        #Theme Store
    adb shell cmd package install-existing --user 0 com.coloros.healthcheck                          #Quick check
    adb shell cmd package install-existing --user 0 com.oppo.operationManual                         #User Guide
    adb shell cmd package install-existing --user 0 com.coloros.phonenoareainquire                   #Number Origin
    adb shell cmd package install-existing --user 0 com.ted.number                                   #Identification Of Unknown Numbers
    adb shell cmd package install-existing --user 0 com.oppo.logkit                                  #Feedback Toolkit (RUI-1)
    adb shell cmd package install-existing --user 0 com.coloros.logkit                               #Feedback (RUI-2)
    adb shell cmd package install-existing --user 0 com.coloros.childrenspace                        #Kids Space
    adb shell cmd package install-existing --user 0 com.heytap.habit.analysis                        #Intelligent Analytics System
    adb shell cmd package install-existing --user 0 com.heytap.openid                                #OpenID
    adb shell cmd package install-existing --user 0 com.coloros.lockassistant                        #Lock Assistant
    adb shell cmd package install-existing --user 0 com.coloros.securitypermission                   #Permission Management Of Phone Manager
    adb shell cmd package install-existing --user 0 com.coloros.backuprestore.remoteservice          #Clone Phone Remote Service
    adb shell cmd package install-existing --user 0 com.coloros.healthservice                        #Health Service
    adb shell cmd package install-existing --user 0 com.coloros.oppomultiapp                         #App Cloner
    adb shell cmd package install-existing --user 0 com.coloros.providers.fileinfo                   #File Info
    adb shell cmd package install-existing --user 0 com.finshell.fin                                 #Finshell payment
    adb shell cmd package install-existing --user 0 com.google.android.keep                          #Google Keep Notes
    adb shell cmd package install-existing --user 0 com.google.android.apps.wellbeing                #Digital Wellbeing
    adb shell cmd package install-existing --user 0 com.google.android.apps.nbu.paisa.user           #Google Pay
    adb shell cmd package install-existing --user 0 com.google.android.projection.gearhead           #Android Auto
    adb shell cmd package install-existing --user 0 com.google.android.gm                            #Gmail
    adb shell cmd package install-existing --user 0 com.google.android.googlequicksearchbox          #Google
    adb shell cmd package install-existing --user 0 com.google.android.marvin.talkback               #Android Accessibility Suite
    adb shell cmd package install-existing --user 0 com.android.hotwordenrollment.okgoogle           #OK Google Enrollment
    adb shell cmd package install-existing --user 0 com.google.android.tts                           #Google Text-To-Speech Engine
    adb shell cmd package install-existing --user 0 com.google.android.feedback                      #Market Feedback Agent
    adb shell cmd package install-existing --user 0 com.google.android.gms.location.history          #Google Location History
    adb shell cmd package install-existing --user 0 com.google.android.inputmethod.latin             #Gboard (Google Keyboard)
    adb shell cmd package install-existing --user 0 com.google.android.youtube                       #Youtube
    adb shell cmd package install-existing --user 0 com.google.android.apps.youtube.music            #Youtube-Music
    adb shell cmd package install-existing --user 0 com.google.android.dialer                        #Google Phone
    adb shell cmd package install-existing --user 0 com.google.android.contacts                      #Google Contacts
    adb shell cmd package install-existing --user 0 com.google.android.apps.messaging                #Google Messages
    adb shell cmd package install-existing --user 0 com.google.android.apps.googleassistant          #Google Assistant
    adb shell cmd package install-existing --user 0 com.google.android.apps.podcasts                 #Google Podcast
    adb shell cmd package install-existing --user 0 com.google.android.apps.subscription             #Google One
    clear
    donedebloat
}

checkadb () {
    clear
    adb devices
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
        echo "Enter a valid input."
        echo "Returning to menu in 3 seconds."
        sleep 3s
        checkadb
    fi
}

donedebloat () {
    clear
    echo done!
    echo "1 - return to menu"
    echo "2 - exit"
    read -p "Type 1, or 2 then press ENTER: " donedebloatprompt
    if [ $donedebloatprompt == 1 ]
    then
        mainmenu
    elif [ $donedebloatprompt == 2 ]
    then
        clear
        exit
    else
        echo "Enter a valid input."
        echo "Returning to menu in 3 seconds."
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
    echo "-----------------------------------------------------------------------------------------------------------"
    echo "lalalalala this is a cheaply made script feel free to modify it if something is wrong kek"
    echo "please make sure you've installed adb on your linux system."
    echo "search on google how to do that."
    echo "com.coloros.weather.service will not be debloated to prevent realme UI 2.0 user from softlocking their phone."
    echo "com.oppo.ota and com.oppo.otaui will also be excluded to make sure you can still receive ota."
    echo "happy debloating"
    echo "-----------------------------------------------------------------------------------------------------------"
    echo "1 - light debloat"
    echo "2 - full debloat (not including gapps)"
    echo "3 - Google apps debloat"
    echo "4 - rebloat all debloated apps"
    echo "5 - check if adb is working"
    echo "6 - kill adb daemon"
    echo "7 - exit"
    
    read -p "Type 1, 2, 3, 4, 5 or 6 then press ENTER: " mode
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
        echo "Enter a valid input."
        echo "Returning to menu in 3 seconds."
        sleep 3s
        mainmenu
    fi
}

mainmenu
