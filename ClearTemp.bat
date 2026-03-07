ÿþa
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=ClearTemp½Å±¾
set Powered=Powered by ÉÛ»ª 18900559020
set Version=20260306
set Comment=ÔËÐÐÍê±Ïºó½Å±¾»á×Ô¶¯¹Ø±Õ£¬ÇëÎðÊÖ¶¯¹Ø±Õ£¡
title %Name% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
:start
set userInput=
call :CapsLK
cls&for /f "tokens=2 delims=()" %%i in ('fsutil volume diskfree c:^|find /i "¿ÉÓÃ"') do set myvar=%%i&cls&echo.
echo.¡¡µ±Ç°CÅÌ¿ÉÓÃÈÝÁ¿Îª%myvar%¡£&echo.
echo.¡¡¡¡¡¾ A Ä¬ÈÏ¡¿×Ô¶¯»¯ÏÂÁÐ²Ù×÷¡¡¡¡¡¡¡¡¡¡ ¡¾ C ¡¿¶¨ÏòÇåÀí¡¡¡¡¡¡¡¡¡¡ ¡¾ U ¡¿¸üÐÂ½Å±¾¡¡¡¡¡¡¡¡¡¡ ¡¾ Q ¡¿ÍË³ö½Å±¾&echo.
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡A1): Ç¿ÖÆ¹Ø±Õ Î¢ÐÅ ½ø³Ì
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡A2): Ç¿ÖÆ¹Ø±Õ ¸÷ÖÖÖ÷Á÷ä¯ÀÀÆ÷ ½ø³Ì
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡A3): ÇåÀí Î¢ÐÅ ×Ô¶¯±£´æµÄ ÎÄµµ ^& Í¼Æ¬ ^& ÊÓÆµ ^& ÁÄÌì¼ÇÂ¼ Ò»ÇÐ ÎÄ¼þ
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡A4): ÇåÀí ÏµÍ³ Temp ÁÙÊ± ÎÄ¼þ
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡A5): ÇåÀí ´òÓ¡×Ô¶¯±£´æ¼ÇÂ¼ ÎÄ¼þ
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡A6): ÇåÀí ¸÷ÖÖÖ÷Á÷ä¯ÀÀÆ÷ »º´æ ÎÄ¼þ
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡A7): ÇåÀí Windows Éý¼¶ÁÙÊ± ÎÄ¼þ
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡A8): ÇåÀí ÏµÍ³À¬»ø¸ñÊ½¼°¼ÇÂ¼ÎÄ¼þ¼°Éî²ãÀ¬»ø ÎÄ¼þ
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡A9): Æô¶¯ ´ÅÅÌÇåÀí³ÌÐò ×Ô¶¯ÇåÀí&echo.
echo.¡¡À¬»øÇåÀíËÙ¶ÈÈ¡¾öÓÚÖÚ¶àÒòËØ£ºÓ²ÅÌµÄ¶ÁÐ´ËÙ¶È¡¢CPU¼°ÄÚ´æµÄÕ¼ÓÃ¡¢µçÄÔÎÄ¼þµÄÊýÁ¿¡¢É±¶¾¼°¹Ü¿ØÈí¼þµÄºóÌ¨¼à¿ØµÈ¡­&echo.
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡%Version%¡¡ÉÛ»ª¡¡18900559020
choice /T 6 /C ACUQ /d A /n /m "¡¡½Å±¾6ÃëºóÄ¬ÈÏÑ¡A£¬ÇëÑ¡Ôñ£º"
if %errorlevel%==1 goto :auto
if %errorlevel%==2 goto :clear
if %errorlevel%==3 if exist "C:\ShaoHua\up.bat" (call "C:\ShaoHua\up.bat") else (echo.È±ÉÙºËÐÄÎÄ¼þ£¬ÈçÄúÏëÊ¹ÓÃÈ«²¿¹¦ÄÜ£¬ÇëÁªÏµÉÛ»ª18900559020¡£&&timeout /t 3)
if %errorlevel%==4 exit
:auto
cls&echo.&echo.¡¡×Ô¶¯ÇåÀíÖÐ£¬ÇëÉÔºó...&echo.
call :l1
call :l2
call :l3
call :l4
call :l5
call :l6
call :l7
call :l8
call :l9
call :exit
:CapsLK
for /f "delims=" %%i in ('powershell -command "[console]::CapsLock"') do if "%%i"=="False" mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
goto :eof
:l1
cls&echo.
wmic process where "name like '%WeChat%'" delete
taskkill /f /t /im WeChat.exe 2>nul
taskkill /f /t /im WechatBrowser.exe 2>nul
taskkill /f /t /im WechatAppLauncher.exe 2>nul
taskkill /f /t /im WeChatExt.exe 2>nul
goto :eof
:l2
cls&echo.
taskkill /f /t /im iexplore.exe 2>nul
taskkill /f /t /im chrome.exe 2>nul
taskkill /f /t /im firefox.exe 2>nul
taskkill /f /t /im 360se.exe 2>nul
taskkill /f /t /im sesvc.exe 2>nul
taskkill /f /t /im msedge.exe 2>nul
taskkill /f /t /im msedgewebview.exe 2>nul
taskkill /f /t /im 360EntBrowser.exe 2>nul
taskkill /f /t /im 360se6.exe 2>nul
taskkill /f /t /im 360chrome.exe 2>nul
taskkill /f /t /im opera.exe 2>nul
taskkill /f /t /im opera_stable.exe 2>nul
taskkill /f /t /im safari.exe 2>nul
taskkill /f /t /im qqbrowser.exe 2>nul
taskkill /f /t /im ucbrowser.exe 2>nul
taskkill /f /t /im firefox-updater.exe 2>nul
taskkill /f /t /im googleupdate.exe 2>nul
taskkill /f /t /im googledrivefs.exe 2>nul
taskkill /f /t /im edgeupdater.exe 2>nul
goto :eof
:l3
rem Delete WeChat Files directory
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý ¡¾Î¢ÐÅ×Ô¶¯±£´æµÄÎÄµµ ^& Í¼Æ¬ ^& ÊÓÆµ ^& ÁÄÌì¼ÇÂ¼µÈÒ»ÇÐÎÄ¼þ¡¿£¿
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi

rem ¹Ø±ÕÎ¢ÐÅ½ø³Ì
wmic process where "name like '%WeChat%'" delete
taskkill /f /t /im WeChat.exe 2>nul
taskkill /f /t /im Weixin.exe 2>nul
taskkill /f /t /im WechatBrowser.exe 2>nul
taskkill /f /t /im WechatAppLauncher.exe 2>nul
taskkill /f /t /im WeChatExt.exe 2>nul

rem ´Ó×¢²á±í¶ÁÈ¡Î¢ÐÅÎÄ¼þ±£´æÂ·¾¶
for /f "tokens=1,2,*" %%i in ('REG QUERY HKCU\Software\Tencent\WeChat /v FileSavePath 2^>nul') do set "regvalue=%%k"
if defined regvalue (
    rem ÇåÀí×¢²á±íÖÐÖ¸¶¨µÄÂ·¾¶
    del /f /s /q "%regvalue%\*" 2>nul
    rd /s /q "%regvalue%" 2>nul
)

rem ÇåÀíÓÃ»§ÎÄµµÄ¿Â¼ÏÂµÄÎ¢ÐÅÎÄ¼þ
del /f /s /q "%userprofile%\Documents\WeChat Files\*" 2>nul
rd /s /q "%userprofile%\Documents\WeChat Files" 2>nul
del /f /s /q "%userprofile%\Documents\Weixin Files\*" 2>nul
rd /s /q "%userprofile%\Documents\Weixin Files" 2>nul

rem ÇåÀí AppData Ä¿Â¼ÏÂµÄÎ¢ÐÅ»º´æ
del /f /s /q "%localappdata%\Tencent\WeChat\*" 2>nul
rd /s /q "%localappdata%\Tencent\WeChat" 2>nul
del /f /s /q "%localappdata%\Tencent\Weixin\*" 2>nul
rd /s /q "%localappdata%\Tencent\Weixin" 2>nul

rem ÇåÀíÎ¢ÐÅÄ¬ÈÏ°²×°Ä¿Â¼
del /f /s /q "%programfiles%\Tencent\WeChat\*" 2>nul
del /f /s /q "%programfiles(x86)%\Tencent\WeChat\*" 2>nul

goto :eof
:l4
rem Clear temp and temp cache directories
cls
echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý ¡¾ÏµÍ³ Temp ÁÙÊ±ÎÄ¼þ¡¿£¿
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
del /f /s /q "%temp%\*.tmp" 2>nul
del /f /s /q "%tmp%\*.tmp" 2>nul
goto :eof
:l5
rem Delete print task history files
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý¡¡¡¾´òÓ¡×Ô¶¯±£´æ¼ÇÂ¼ÎÄ¼þ¡¿¡¡£¿
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
del /f /s /q "C:\Windows\System32\spool\PRINTERS\*"
goto :eof
:l6
rem Delete browser cache files
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý¡¡¡¾Internet Explorer ^& 360XX ^& Google Chrome ^& »ðºü ^& Edge ä¯ÀÀÆ÷»º´æÎÄ¼þ¡¿¡¡£¿
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\INetCache\*"
del /f /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\Local\Google\User Data\Default\Media Cache\*"
del /f /s /q "%userprofile%\AppData\Local\360Chrome\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\Local\360Chrome\User Data\Default\Media Cache\*"
del /f /s /q "%userprofile%\AppData\roaming\360se\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\roaming\360se\User Data\Default\Media Cache\*"
del /f /s /q "%userprofile%\AppData\roaming\360se6\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\roaming\360se6\User Data\Default\Media Cache\*"
del /f /s /q "%userprofile%\AppData\Local\360EntBrowser\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\Local\360EntBrowser\User Data\Default\Media Cache\*"
del /f /s /q "%userprofile%\AppData\Local\360ChromeExt\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\Local\360ChromeExt\User Data\Default\Media Cache\*"
del /f /s /q "%userprofile%\AppData\Local\360SafeBrowser\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\Local\360SafeBrowser\User Data\Default\Media Cache\*"
del /f /s /q "%userprofile%\AppData\Local\360SpeedBrowser\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\Local\360SpeedBrowser\User Data\Default\Media Cache\*"  
del /f /s /q "%userprofile%\AppData\Local\360SecureBrowser\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\Local\360SecureBrowser\User Data\Default\Media Cache\*"
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Media Cache\*"
del /f /s /q "%appdata%\Mozilla\Firefox\Profiles\*\cache2\entries\*"
del /f /s /q "%appdata%\Opera Software\Opera Stable\Cache\*"
del /f /s /q "%userprofile%\Library\Caches\com.apple.Safari\Cache.db"
goto :eof
:l7
rem Remove Windows upgrade files
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý¡¡¡¾WindowsÉý¼¶ÁÙÊ±ÎÄ¼þ¡¿¡¡£¿
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
rd /s /q %windir%\SoftwareDistribution\Download
rd /s /q %windir%$Windows.~BT
rd /s /q %windir%\servicing\Packages
goto :eof
:l8
rem Delete symptom files and system encapsulation garbage
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý¡¡¡¾ÏµÍ³À¬»ø¸ñÊ½¼°¼ÇÂ¼ÎÄ¼þ¼°Éî²ãÀ¬»ø¡¿¡¡£¿
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
rem ÁÙÊ±ÎÄ¼þ
rem del /f /s /q %systemdrive%\*.tmp
rem ÁÙÊ±ÎÄ¼þ
rem del /f /s /q %systemdrive%\*._mp
rem ÈÕÖ¾ÎÄ¼þ
rem del /f /s /q %systemdrive%\*.log
rem ÁÙÊ±°ïÖúÎÄ¼þ
rem del /f /s /q %systemdrive%\*.gid
rem ´ÅÅÌ¼ì²éÎÄ¼þ
rem del /f /s /q %systemdrive%\*.chk
rem ÁÙÊ±±¸·ÝÎÄ¼þ
rem del /f /s /q %systemdrive%\*.old
rem »ØÊÕÕ¾ÎÄ¼þ
rem del /f /s /q "%systemdrive%\$Recycle.Bin\*"
rem ±¸·ÝÎÄ¼þ
rem del /f /s /q %windir%\*.bak
rem Ô¤¶ÁÎÄ¼þ
rem del /f /s /q %windir%\prefetch\*.*
rem ÁÙÊ±Ä¿Â¼
del /f /s /q "%windir%\temp\*"
rem ×î½ü·ÃÎÊÎÄ¼þµÄ¼ÍÂ¼
del /f /s /q "%userprofile%\recent\*"
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*"
del /f /s /q "%userprofile%\Local Settings\Temp\*"
rem ÏµÍ³ÈÕÖ¾ÎÄ¼þ
del /f /s /q "%windir%\System32\Winevt\Logs\*"
rem ÊÂ¼þ²é¿´Æ÷ÈÕÖ¾
del /f /s /q "%windir%\System32\config\*.evt"
del /f /s /q "%windir%\System32\config\*.evtx"
rem ÏµÍ³¸üÐÂ²ÐÁô£¨ÐÂÔö£©
rd /s /q "%windir%$Windows.~WS"
rem Çý¶¯°²×°²ÐÁô
rd /s /q "%windir%\inf\setupapi.dev.log"
rem Ó¦ÓÃ³ÌÐò»º´æ£¨ÐÂÔö£©
del /f /s /q "%localappdata%\Microsoft\Windows\History\*"
rem ÏµÍ³´íÎó±¨¸æ
del /f /s /q "%localappdata%\Microsoft\Windows\WER\*"
rem ÄÚ´æ×ª´¢ÎÄ¼þ
del /f /s /q "%windir%\memory.dmp"
del /f /s /q "%windir%\minidump\*"
del /f /q /s "C:\Windows\LiveKernelReports\*.dmp"
del /f /q /s "C:\Windows\Minidump\*.dmp"
rem ÏµÍ³»¹Ô­µã£¨½÷É÷Ê¹ÓÃ£¬»áÉ¾³ýËùÓÐ»¹Ô­µã£©
rem vssadmin delete shadows /all /quiet
rem ÁÙÊ±°²×°ÎÄ¼þ
del /f /s /q "%windir%\Installer\$PatchCache$\*"
rem ÏµÍ³ÐÝÃßÎÄ¼þ£¨½÷É÷Ê¹ÓÃ£¬»áÉ¾³ýÐÝÃßÎÄ¼þ£©
rem powercfg -h off
rem del /f /s /q "%systemdrive%\hiberfil.sys"
rem ÏµÍ³Õï¶ÏÈÕÖ¾
del /f /s /q "%localappdata%\Diagnostics\*"
del /f /s /q "%localappdata%\Microsoft\Windows\Diagnostics\*"
rem Ó¦ÓÃ³ÌÐòÈÕÖ¾
del /f /s /q "%localappdata%\Microsoft\Windows\AppCache\*"
rem Cortana »º´æ
del /f /s /q "%localappdata%\Microsoft\Windows\Cortana\*"
rem ËÑË÷ÀúÊ·
del /f /s /q "%localappdata%\Microsoft\Windows\Explorer\RecentApps\*"
rem OneDrive »º´æ
del /f /s /q "%localappdata%\Microsoft\OneDrive\*"
rem ÇåÀíÓÃ»§ÁÙÊ±ÎÄ¼þ£¨ÐÂÔö£©
del /f /s /q "%userprofile%\AppData\Local\Temp\*"
rem ÇåÀíÏµÍ³·þÎñÈÕÖ¾
del /f /s /q "%windir%\System32\LogFiles\*"
rem ÇåÀí Windows Defender ÈÕÖ¾
del /f /s /q "%programdata%\Microsoft\Windows Defender\*"
rem ÇåÀí Windows Update ÈÕÖ¾
del /f /s /q "%windir%\WindowsUpdate.log"
del /f /s /q "%windir%\Logs\WindowsUpdate\*"
rem Éî²ãÇåÀíÏîÄ¿
rem ÏµÍ³±¸·Ý£ºÇåÀí×¢²á±í±¸·ÝÄ¿Â¼
del /f /s /q "%windir%\System32\config\RegBack\*"
rem Éè±¸Çý¶¯±¸·Ý£ºÇåÀí¾ÉÇý¶¯
del /f /s /q "%windir%\System32\DriverStore\FileRepository\*"
rem Microsoft Store »º´æ£ºÇåÀíÁÙÊ±ÎÄ¼þ
del /f /s /q "%localappdata%\Packages\*"
rem Office »º´æ£ºÇåÀí»º´æÎÄ¼þ
del /f /s /q "%localappdata%\Microsoft\Office\*"
rem ÍøÂç»º´æ£ºÇåÀíÍøÂç¿ì½Ý·½Ê½
del /f /s /q "%localappdata%\Microsoft\Windows\NetworkShortcuts\*"
rem ÈÕÖ¾ÎÄ¼þ£ºÇåÀíÏµÍ³ÈÕÖ¾Ä¿Â¼
del /f /s /q "%windir%\Logs\*"
rem µ÷ÊÔ·ûºÅ£ºÇåÀíµ÷ÊÔ·ûºÅÄ¿Â¼
del /f /s /q "%windir%\symbols\*"
rem ×ÖÌå»º´æ£ºÇåÀí×ÖÌå»º´æ
del /f /s /q "%localappdata%\Microsoft\Windows\Fonts\*"
rem ÓÃ»§ÀúÊ·¼ÇÂ¼£ºÇåÀí×Ô¶¯Ä¿±ê
del /f /s /q "%userprofile%\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\*"
rem ÓÃ»§ËÑË÷ÀúÊ·£ºÇåÀí×î½üÓ¦ÓÃ
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\RecentApps\*"

goto :eof
:l9
rem Run disk cleanup tool by Sageset id 60
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÆô¶¯¡¡¡¾´ÅÅÌÇåÀí³ÌÐò¡¿¡¡Íê³É×îºóµÄÊÖ¶¯ÇåÀí£¿
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
rem Cleanmgr.exe /sageset:60
rem Cleanmgr.exe /sagerun:60
start "" cleanmgr.exe /VERYLOWDISK
goto :eof
:clear
if exist "D:\SH\Key\SafeClear.bat" call "D:\SH\Key\SafeClear.bat" 2>nul
echo.&echo.¡¡[¶¨ÏòÇåÀí]¡¡²Ù×÷Íê³É...¡¡½Å±¾¼´½«·µ»ØÖ÷²Ëµ¥...&timeout /t 3 >nul&goto :start
:xuanze
echo.&echo.¡¡°´¡¾Y¡¿¼ÌÐø£¬°´¡¾N¡¿Ìø¹ý¡£&echo.&echo.¡¡ÇëÈ·ÈÏ£¡&echo.&echo.¡¡3Ãëºó£¬½«ÊÓÎªY¼ÌÐø¡£
choice /T 3 /C YN /d Y /N >nul 2>nul
goto :eof
:tishi
cls&echo.&if %errorlevel%==1 echo.¡¡Èç¹û¹â±êÔÚÉÁ¶¯£¬ËµÃ÷³ÌÐòÕýÔÚÔËÐÐ£¬ÀÏµçÄÔ¿ÉÄÜ»á¡°¼ÙËÀ¡±£¬ÇëÄÍÐÄµÈ´ý¡­¡­&echo.
goto :eof
:up
cls&echo.&if %errorlevel%==1 echo.¡¡Èç¹û¹â±êÔÚÉÁ¶¯£¬ËµÃ÷³ÌÐòÕýÔÚÔËÐÐ£¬ÀÏµçÄÔ¿ÉÄÜ»á¡°¼ÙËÀ¡±£¬ÇëÄÍÐÄµÈ´ý¡­¡­&echo.
goto :eof
:exit
cls&for /f "tokens=2 delims=()" %%i in ('fsutil volume diskfree c:^|find /i "¿ÉÓÃ"') do set myvar=%%i&echo.
echo.&echo.¡¡²Ù×÷Íê³É,µ±Ç°CÅÌ¿ÉÓÃÈÝÁ¿Îª%myvar%...&echo.&echo.&echo.&echo.&echo.&echo.
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¾ÛÉ¢ÖÕÓÐÊ±¡¡ÔÙ¼ûÒàÓÐÆÚ&echo.&echo.&echo.&echo.&echo.&echo.
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡ ÉÛ»ª
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡18900559020&echo.
echo.¡¡Èç¹û»¹ÓÐÎÊÌâ¾Í´òÎÒµç»°°É...&timeout /t 3 >nul&exit