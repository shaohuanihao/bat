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
set Version=20260423
set Comment=ÔËÐÐÍê±Ïºó½Å±¾»á×Ô¶¯¹Ø±Õ£¬ÇëÎðÊÖ¶¯¹Ø±Õ£¡
title %Name% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
:start
set userInput=
call :CapsLK
if exist "C:\Program Files\Shadow Defender\" (set "dxql=¡¡¡¾ C ¡¿¶¨ÏòÇåÀí") || set "dxql="
cls&for /f "tokens=2 delims=()" %%i in ('fsutil volume diskfree c:^|find /i "¿ÉÓÃ"') do set myvar=%%i&cls&echo.
echo.¡¡µ±Ç° C ÅÌ¿ÉÓÃÈÝÁ¿Îª¡¾  %myvar% ¡¿¡£&echo.
echo.¡¡¡¡¡¾ A ¡¿×Ô¶¯»¯²Ù×÷¡¡¡¾ M Ä¬ÈÏ¡¿ÊÖ¶¯Ñ¡Ôñ²Ù×÷%dxql%¡¡¡¾ U ¡¿¸üÐÂ½Å±¾¡¡¡¾ Q ¡¿ÍË³ö½Å±¾&echo.
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
choice /T 6 /C AMCUQ /d M /n /m "¡¡½Å±¾6ÃëºóÄ¬ÈÏÑ¡ M £¬ÇëÑ¡Ôñ£º"
if %errorlevel%==1 set key=auto&goto :auto
if %errorlevel%==2 set key=&goto :auto
if %errorlevel%==3 goto :clear
if %errorlevel%==4 if exist "C:\ShaoHua\up.bat" (call "C:\ShaoHua\up.bat") else (echo.È±ÉÙºËÐÄÎÄ¼þ£¬ÈçÄúÏëÊ¹ÓÃÈ«²¿¹¦ÄÜ£¬ÇëÁªÏµÉÛ»ª18900559020¡£&&timeout /t 3)
if %errorlevel%==5 exit
:auto
set start_time=%time%
cls&echo.&echo.¡¡×Ô¶¯ÇåÀíÖÐ£¬ÇëÉÔºó¡­&echo.
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
for %%i in (WechatBrowser WechatAppLauncher WeChatAppEx WeChatExt crashpad_handler WeChat Weixin) do @taskkill /f /t /im "%%i.exe" 2>nul
goto :eof
:l2
cls&echo.
for %%i in (iexplore MicrosoftEdge chrome firefox 360se 360ent 360chrome sesvc OneDrive wpsoffice FRMI Lcserver) do @taskkill /f /t /im "%%i.exe" 2>nul
goto :eof
:l3
rem É¾³ýÎ¢ÐÅÎÄµµ
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý ¡¾Î¢ÐÅ×Ô¶¯±£´æµÄÎÄµµ ^& Í¼Æ¬ ^& ÊÓÆµ ^& ÁÄÌì¼ÇÂ¼µÈÒ»ÇÐÎÄ¼þ¡¿£¿
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
rem »ñÈ¡ÕæÊµÎÄµµÂ·¾¶
set "MyDocs="
for /f "tokens=2*" %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v Personal 2^>nul') do set "MyDocs=%%b"
if not defined MyDocs (
    echo.¡¡´íÎó£ºÎÞ·¨»ñÈ¡ÎÄµµÂ·¾¶¡£
    goto :eof
)
echo.¡¡ÎÄµµ¸ùÄ¿Â¼: %MyDocs%
rem É¾³ýÄ¬ÈÏÎ¢ÐÅÊý¾ÝÄ¿Â¼
set "oldDir=%MyDocs%\WeChat Files"
set "newDir=%MyDocs%\xwechat_files"
if exist "%oldDir%" (
    echo.¡¡É¾³ý¾É°æÄ¿Â¼: %oldDir%
    rd /s /q "%oldDir%" 2>nul
)
if exist "%newDir%" (
    echo.¡¡É¾³ýÐÂ°æÄ¿Â¼: %newDir%
    rd /s /q "%newDir%" 2>nul
)
rem ÇåÀí AppData »º´æ
rd /s /q "%localappdata%\Tencent\WeChat"
rd /s /q "%localappdata%\Tencent\Weixin"
goto :eof
:l4
rem ÇåÀíÏµÍ³ Temp ÁÙÊ±ÎÄ¼þ
cls
echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý ¡¾ÏµÍ³ Temp ÁÙÊ±ÎÄ¼þ¡¿£¿
set "continue=1"
if not "%key%"=="auto" call :xuanze
if "!continue!"=="0" goto :eof
call :tishi
del /f /s /q "%temp%\*.tmp" 2>nul
del /f /s /q "%tmp%\*.tmp" 2>nul
rem ProgramData ÁÙÊ±Ä¿Â¼
del /f /s /q "C:\ProgramData\Temp\*"
goto :eof
:l5
rem ÇåÀí´òÓ¡×Ô¶¯±£´æ¼ÇÂ¼ÎÄ¼þ
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý¡¡¡¾´òÓ¡×Ô¶¯±£´æ¼ÇÂ¼ÎÄ¼þ¡¿¡¡£¿
set "continue=1"
if not "%key%"=="auto" call :xuanze
if "!continue!"=="0" goto :eof
call :tishi
net stop Spooler /y
timeout /t 2 /nobreak
del /f /s /q "C:\Windows\System32\spool\PRINTERS\*"
net start Spooler
goto :eof
:l6
rem ÇåÀíä¯ÀÀÆ÷»º´æÎÄ¼þ
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý¡¡¡¾Internet Explorer ^& 360XX ^& Google Chrome ^& »ðºü ^& Edge ä¯ÀÀÆ÷»º´æÎÄ¼þ¡¿¡¡£¿
set "continue=1"
if not "%key%"=="auto" call :xuanze
if "!continue!"=="0" goto :eof
call :tishi
del /f /s /q "%LocalAppData%\Google\Chrome\User Data\*\Cache\*"
del /f /s /q "%LocalAppData%\Google\Chrome\User Data\*\Code Cache\*"
del /f /s /q "%LocalAppData%\Google\Chrome\User Data\*\GPUCache\*"
del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\*\Cache\*"
del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\*\Code Cache\*"
del /f /s /q "%LocalAppData%\Microsoft\Edge\User Data\*\GPUCache\*"
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\INetCache\*"
del /f /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache\*"
del /f /s /q "%userprofile%\AppData\Local\Google\User Data\Default\Media Cache\*"
del /f /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Media Cache\*"
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
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Edge\User Data\Default\Media Cache\*"
del /f /s /q "%appdata%\Mozilla\Firefox\Profiles\*\cache2\entries\*"
del /f /s /q "%appdata%\Opera Software\Opera Stable\Cache\*"
del /f /s /q "%userprofile%\Library\Caches\com.apple.Safari\Cache.db"
goto :eof
:l7
rem ÇåÀíWindowsÉý¼¶ÁÙÊ±ÎÄ¼þ
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý¡¡¡¾WindowsÉý¼¶ÁÙÊ±ÎÄ¼þ¡¿¡¡£¿
set "continue=1"
if not "%key%"=="auto" call :xuanze
if "!continue!"=="0" goto :eof
call :tishi
rem ÏµÍ³Éý¼¶²ÐÁô
rd /s /q "%systemdrive%\Windows.old"
rd /s /q "%systemdrive%\Windows10Upgrade"
rd /s /q %windir%\SoftwareDistribution\Download
rd /s /q "%systemdrive%\$Windows.~BT"
rem rd /s /q %windir%\servicing\Packages
rd /s /q "%windir%\WinRE\WinREAgent"
rd /s /q "%systemdrive%\$WinREAgent"
rem ¸üÐÂÇ©Ãû»º´æ£¨»á×Ô¶¯ÖØ½¨£©
rd /s /q "%windir%\System32\catroot2"
rem ×îÐÂÀÛ»ý¸üÐÂ±¸·Ý
rd /s /q "%windir%\servicing\LCU"
rem ´«µÝÓÅ»¯»º´æ
del /f /s /q "C:\ProgramData\Microsoft\Windows\DeliveryOptimization\Cache\*"
rem ÇåÀíÉý¼¶ÖúÊÖÈÕÖ¾
rd /s /q "%windir%\Panther\UnattendGC"
del /f /s /q "%windir%\Panther\setup*.log"
goto :eof
:l8
rem ÇåÀíÏµÍ³À¬»ø¸ñÊ½¼°¼ÇÂ¼ÎÄ¼þ¼°Éî²ãÀ¬»ø
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÇå³ý¡¡¡¾ÏµÍ³À¬»ø¸ñÊ½¼°¼ÇÂ¼ÎÄ¼þ¼°Éî²ãÀ¬»ø¡¿¡¡£¿
set "continue=1"
if not "%key%"=="auto" call :xuanze
if "!continue!"=="0" goto :eof
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
rem del /f /s /q "%windir%\prefetch\*.*"
rem É¾³ýËõÂÔÍ¼»º´æÊý¾Ý¿â
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db"
del /f /s /q "%localappdata%\Microsoft\Windows\Explorer\thumbcache_*.db"
rem É¾³ýÏµÍ³¼¶ËõÂÔÍ¼»º´æ
del /f /s /q "%systemdrive%\Users\*\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db"
rem ÇåÀíÎÄ¼þÀúÊ·¼ÇÂ¼ÅäÖÃºÍ»º´æ
rd /s /q "%localappdata%\Microsoft\Windows\FileHistory"
rd /s /q "%userprofile%\AppData\Local\Microsoft\Windows\FileHistory"
rem ÇåÀíÎÄ¼þÀúÊ·¼ÇÂ¼Êý¾Ý¿â
del /f /s /q "%localappdata%\Microsoft\Windows\FileHistory\*.edb"
del /f /s /q "%localappdata%\Microsoft\Windows\FileHistory\*.log"
rem ÏµÍ³ÐÝÃßÎÄ¼þ hiberfil.sys
powercfg /hibernate off
del /f /a /q "%systemdrive%\hiberfil.sys"
rem ÇåÀí CBS ÈÕÖ¾£¨Component Based Servicing£©
del /f /s /q "%windir%\Logs\CBS\*.log"
del /f /s /q "%windir%\Logs\CBS\*.cab"
rem WMI ×·×ÙÈÕÖ¾
del /f /s /q "%windir%\System32\LogFiles\WMI\*.etl"
rem Windows Õï¶ÏÈÕÖ¾
del /f /s /q "%windir%\System32\WDI\*.etl"
rem WinSxS ÁÙÊ±»º´æ / ±¸·Ý
del /f /s /q "%windir%\WinSxS\Temp\*"
del /f /s /q "%windir%\WinSxS\Cleanup\*"
rem ËÑË÷Ë÷ÒýÊý¾Ý¿â»º´æ
del /f /s /q "%programdata%\Microsoft\Search\Data\Temp\*"
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
rd /s /q "%systemdrive%\$Windows.~WS"
rem Çý¶¯°²×°²ÐÁô
del /f /q "%windir%\inf\setupapi.dev.log"
rem Ó¦ÓÃ³ÌÐò»º´æ£¨ÐÂÔö£©
del /f /s /q "%localappdata%\Microsoft\Windows\History\*"
rem ÏµÍ³´íÎó±¨¸æ
del /f /s /q "%localappdata%\Microsoft\Windows\WER\*"
del /f /s /q "%programdata%\Microsoft\Windows\WER\ReportArchive\*"
del /f /s /q "%programdata%\Microsoft\Windows\WER\ReportQueue\*"
rem ÄÚ´æ×ª´¢ÎÄ¼þ
del /f /s /q "%windir%\memory.dmp"
del /f /s /q "%windir%\minidump\*"
del /f /q /s "C:\Windows\LiveKernelReports\*.dmp"
del /f /q /s "C:\Windows\Minidump\*.dmp"
rem ÏµÍ³»¹Ô­µã£¨½÷É÷Ê¹ÓÃ£¬»áÉ¾³ýËùÓÐ»¹Ô­µã£©
rem vssadmin delete shadows /all /quiet
rem ÁÙÊ±°²×°ÎÄ¼þ
del /f /s /q "%windir%\Installer\$PatchCache$\*"
rem ÇåÀí°²×°³ÌÐòÈÕÖ¾
del /f /s /q "%windir%\Setup.log"
del /f /s /q "%windir%\Setup*.log"
del /f /s /q "%windir%\Panther\*.log"
del /f /s /q "%windir%\Panther\*.etl"
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
del /f /s /q "%windir%\Logs\WindowsUpdate\*.etl"
del /f /s /q "%windir%\Logs\WindowsUpdate\*.log"
del /f /s /q "%windir%\WindowsUpdate.log"
rem ÇåÀí DISM ÈÕÖ¾
del /f /s /q "%windir%\Logs\DISM\*.log"
rem Éî²ãÇåÀíÏîÄ¿
rem ÏµÍ³±¸·Ý£ºÇåÀí×¢²á±í±¸·ÝÄ¿Â¼
del /f /s /q "%windir%\System32\config\RegBack\*"
rem Éè±¸Çý¶¯±¸·Ý£ºÇåÀí¾ÉÇý¶¯
rem del /f /s /q "%windir%\System32\DriverStore\FileRepository\*"
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
rem ÏµÍ³¸üÐÂ²¹¶¡Ð¶ÔØ»º´æ
rd /s /q "%windir%\SoftwareDistribution\DataStore\Logs"
rd /s /q "%windir%\SoftwareDistribution\DataStore\Download"
del /f /s /q "%windir%\SoftwareDistribution\DataStore\*.edb"
del /f /s /q "%windir%\SoftwareDistribution\*.log"
del /f /s /q "%windir%\SoftwareDistribution\*.jfm"
rem °²×°³ÌÐòÁÙÊ±»º´æ£¨ÏÔ¿¨ / Çý¶¯ / ÔËÐÐ¿âÀï£©
del /f /s /q "%systemdrive%\MSOCache\*"
rd /s /q "%systemdrive%\MSOCache"
del /f /s /q "%systemdrive%\Installer\*.tmp"
del /f /s /q "%systemdrive%\Installer\*.log"
rem Ó¦ÓÃ³ÌÐò±ÀÀ£×ª´¢
rd /s /q "%localappdata%\CrashDumps"
rem WER ÁÙÊ±ÎÄ¼þ
rd /s /q "%programdata%\Microsoft\Windows\WER\Temp"
rem NVIDIA ÏÔ¿¨»º´æ
rd /s /q "%localappdata%\NVIDIA\DXCache"
rd /s /q "%localappdata%\NVIDIA\GLCache"
rd /s /q "%localappdata%\NVIDIA Corporation\NV_Cache"
rem AMD ÏÔ¿¨»º´æ
rd /s /q "%localappdata%\AMD\DxCache"
rd /s /q "%localappdata%\AMD\GLCache"
rd /s /q "%localappdata%\AMD\CN"
rem Intel ÏÔ¿¨»º´æ
rd /s /q "%localappdata%\Intel\ShaderCache"
rd /s /q "%localappdata%\Intel\D3DSCache"
rem Í¨ÓÃ DirectX »º´æ
rd /s /q "%localappdata%\D3DSCache"
rd /s /q "%localappdata%\DirectX Shader Cache"
rem Çý¶¯°²×°²ÐÁô
rd /s /q "C:\NVIDIA"
rd /s /q "C:\AMD"
rd /s /q "C:\Intel"
rd /s /q "C:\ProgramData\NVIDIA Corporation\Downloader"
rem Éý¼¶/ÖØÖÃ²ÐÁô
rd /s /q "C:\$GetCurrent"
rd /s /q "C:\$SysReset"
rd /s /q "C:\ESD"
rem ÏÖ´ú´ý»úÕï¶ÏÈÕÖ¾
del /f /s /q "%windir%\System32\SleepStudy\*.etl"
rem ÏµÍ³ÖØÖÃÆ½Ì¨±¸·Ý
rd /s /q "%windir%\System32\SystemResetPlatform"
rem ÍøÂç·þÎñÁÙÊ±ÎÄ¼þ
del /f /s /q "%windir%\ServiceProfiles\NetworkService\AppData\Local\Temp\*"
del /f /s /q "%windir%\ServiceProfiles\LocalService\AppData\Local\Temp\*"
goto :eof
:l9
rem Run disk cleanup tool by Sageset id 60
cls&echo.&echo.¡¡ÊÇ·ñÈ·ÈÏÆô¶¯¡¡¡¾´ÅÅÌÇåÀí³ÌÐò¡¿¡¡Íê³É×îºóµÄÊÖ¶¯ÇåÀí£¿
set "continue=1"
if not "%key%"=="auto" call :xuanze
if "!continue!"=="0" goto :eof
call :tishi
rem Cleanmgr.exe /sageset:60
rem Cleanmgr.exe /sagerun:60
start "" cleanmgr.exe /VERYLOWDISK
goto :eof
:clear
if exist "D:\SH\Key\SafeClear.bat" call "D:\SH\Key\SafeClear.bat" 2>nul
echo.&echo.¡¡[¶¨ÏòÇåÀí]¡¡²Ù×÷Íê³É¡­¡¡½Å±¾¼´½«·µ»ØÖ÷²Ëµ¥¡­&timeout /t 3 >nul&goto :start
:xuanze
set "continue=1"
echo.&echo.¡¡°´¡¾Y¡¿¼ÌÐø£¬°´¡¾N¡¿Ìø¹ý¡£&echo.&echo.¡¡ÇëÈ·ÈÏ£¡&echo.&echo.¡¡3Ãëºó£¬½«ÊÓÎªY¼ÌÐø¡£
choice /T 3 /C YN /d Y /N >nul 2>nul
if %errorlevel%==2 set "continue=0"
goto :eof
:tishi
cls&echo.&if %errorlevel%==1 echo.¡¡Èç¹û¹â±êÔÚÉÁ¶¯£¬ËµÃ÷³ÌÐòÕýÔÚÔËÐÐ£¬ÀÏµçÄÔ¿ÉÄÜ»á¡°¼ÙËÀ¡±£¬ÇëÄÍÐÄµÈ´ý¡­&echo.
goto :eof
:up
cls&echo.&if %errorlevel%==1 echo.¡¡Èç¹û¹â±êÔÚÉÁ¶¯£¬ËµÃ÷³ÌÐòÕýÔÚÔËÐÐ£¬ÀÏµçÄÔ¿ÉÄÜ»á¡°¼ÙËÀ¡±£¬ÇëÄÍÐÄµÈ´ý¡­&echo.
goto :eof
:exit
set end_time=%time%
cls&for /f "tokens=2 delims=()" %%i in ('fsutil volume diskfree c:^|find /i "¿ÉÓÃ"') do set myvar=%%i&echo.
echo.&echo.¡¡²Ù×÷Íê³É£¬ÇåÀíÓÃÊ±£º%start_time% - %end_time%&echo.&echo.¡¡µ±Ç° C ÅÌ¿ÉÓÃÈÝÁ¿Îª¡¾ %myvar% ¡¿¡­&echo.&echo.&echo.&echo.
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¾ÛÉ¢ÖÕÓÐÊ±¡¡ÔÙ¼ûÒàÓÐÆÚ&echo.&echo.&echo.&echo.&echo.&echo.
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡ ÉÛ»ª
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡18900559020&echo.
echo.¡¡Èç¹û»¹ÓÐÎÊÌâ¾Í´òÎÒµç»°°É¡­&timeout /t 5 >nul&exit