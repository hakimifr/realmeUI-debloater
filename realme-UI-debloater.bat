@echo off
color 0a


set gapps_package=com.google.android.marvin.talkback com.android.hotwordenrollment.okgoogle com.google.android.tts com.google.android.feedback com.google.android.gms.location.history com.google.android.inputmethod.latin com.google.android.youtube com.google.android.apps.youtube.music com.google.android.dialer com.google.android.contacts com.google.android.apps.messaging com.google.android.apps.googleassistant com.google.android.apps.podcasts com.google.android.apps.subscription

set light_package=com.heytap.browser com.oppo.music com.heytap.music com.coloros.video com.coloros.filemanager com.coloros.compass2 com.redteamobile.roaming com.realme.securitycheck com.coloros.phonemanager com.heytap.market com.heytap.themestore com.finshell.fin com.heytap.cloud com.realme.movieshot com.coloros.healthcheck com.coloros.backuprestore com.coloros.backuprestore.remoteservice

set super_package=com.heytap.usercenter com.coloros.gamespace com.oppo.quicksearchbox com.coloros.assistantscreen com.coloros.weather2  com.coloros.soundrecorder com.coloros.screenrecorder com.coloros.phonemanager com.facebook.system com.facebook.services com.facebook.appmanager com.android.fmradio com.coloros.focusmode com.heytap.pictorial com.coloros.oshare com.nearme.atlas  com.coloros.floatassistant com.coloros.securepay com.coloros.smartdrive com.coloros.sceneservice com.coloros.ocrscanner com.coloros.smartsidebar com.heytap.themestore com.oppo.operationManual com.coloros.phonenoareainquire com.ted.number com.oppo.logkit com.coloros.logkit com.coloros.childrenspace com.heytap.habit.analysis com.heytap.openid com.coloros.lockassistant com.coloros.securitypermission com.coloros.healthservice com.coloros.oppomultiapp


:menu
cls
echo -----------------------------------------------------------------------------------------------------------
echo lalalalala this is a cheaply made script feel free to modify it if something is wrong kek
echo please make sure you place this file in platform tools folder
echo else it will return 'adb' is not recognized as an internal or external command,
echo operable program or batch file. error.
echo com.coloros.weather.service will not be debloated to prevent realme UI 2.0 user from softlocking the phone.
echo com.oppo.ota and com.oppo.otaui will also be excluded to make sure you can still receive ota.
echo happy debloating
echo -----------------------------------------------------------------------------------------------------------
echo 1 - light debloat
echo 2 - full debloat (not including gapps)
echo 3 - Google apps debloat
echo 4 - rebloat all debloated apps
echo 5 - check if adb is working
echo 6 - kill adb
echo 7 - exit
SET /P menu=Type 1, 2, 3, 4, 5 or 6 then press ENTER: 
if %menu% == 1 goto light
if %menu% == 2 goto super
if %menu% == 3 goto gapps
if %menu% == 4 goto rebloat
if %menu% == 5 goto checkadb
if %menu% == 6 goto killadb
if %menu% == 7 color && exit 0


:checkadb
cls
adb devices
echo 1 - return to menu
echo 2 - exit
SET /P donecheck=Type 1, or 2 then press ENTER: 
if %donecheck% == 1 goto menu
if %donecheck% == 2 color && exit 0



:light
cls
echo removing...
ping localhost -n 1 >nul
FOR %%a IN (%light_package%) DO adb shell pm uninstall -k --user 0 %a%
adb shell pm disable-user com.heytap.market
adb shell pm disable-user com.heytap.themestore
cls
goto done


:rebloat
FOR %%b IN (%super_package%) DO adb shell cmd package install-existing %b%
FOR %%e IN (%gapps_package%) DO adb shell cmd package install-existing %e%
adb shell pm enable com.heytap.themestore
adb shell pm enable com.heytap.market
cls
goto done



:done
cls
echo done!
echo 1 - return to menu
echo 2 - exit
SET /P done=Type 1, or 2 then press ENTER: 
if %done% == 1 goto menu
if %done% == 2 color && exit 0


:super
cls
echo removing...
ping localhost -n 1 >nul
FOR %%c in (%super_package%) DO adb shell pm uninstall -k --user 0 %c%
adb shell pm disable-user com.heytap.themestore
adb shell pm disable-user com.heytap.market
cls
goto done


:gapps
cls
echo removing...
ping localhost -n 1 >nul
FOR %%d IN (%gapps_list%) DO adb shell pm uninstall -k --user 0 %d%
cls
goto done


:killadb
adb kill-server
goto done

