ÿþa
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net session>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=×ÛºÏ½Å±¾
set Powered=Powered by ÉÛ»ª 18900559020
set Version=20260705
set Comment=ÔËÐÐÍê±Ïºó½Å±¾»á×Ô¶¯¹Ø±Õ£¬ÇëÎðÊÖ¶¯¹Ø±Õ£¡
title %Name% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
:start
call :CapsLK
call :passwd
call :patch
if not defined Pc set Pc=Unknown
title %Pc% ¡ï %Name% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
cls
call :cmd_admin
call :pctime
call :closesoft
call :better_yj
call :better_xt
call :better_jm
call :better_llq
call :soft_setup
call :better_rj
call :better_wl
call :finish
exit

:passwd
rem for /F "tokens=1" %%a in ('wmic os get localdatetime ^| find "."') do (set date=%%a&set day=!date:~0,8!)&for /F "tokens=3" %%b in ('reg query "HKCR\.ShaoHua" /v "InitialSetup" 2^>nul ^| find "InitialSetup"') do (if "!day!" EQU "%%b" (goto :eof))
reg query "HKCR\.ShaoHua" /v "FirstInstall" 2>nul | find "0" >nul && goto :eof
cls&echo.&echo.
echo.¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡Ver%Version%&echo.&echo.&echo.&echo.&echo.&echo.
set /p pwd=×û¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡¡Password:
if /i "%pwd%" neq "shaohua" call :passwd
goto :eof

:CapsLK
for /f "delims=" %%i in ('powershell -command "[console]::CapsLock"') do if "%%i"=="False" mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
goto :eof

:patch
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" call :patch64
if "%PROCESSOR_ARCHITECTURE%"=="x86" call :patch32
if not exist "%ProgramFiles(x86)%\Internet Explorer\iexplore.exe" if not exist "%ProgramFiles%\Internet Explorer\iexplore.exe" set IEIE=NO
set IE_type="%IE_Path32%" "%%1"
set IE_Domains=HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains
set IE_Ranges=HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges
choice /T 1 /C WLOFA /d A /N >nul 2>nul
if %errorlevel%==5 REM.
if %errorlevel%==4 set Pc=PC-Sysprep&set hs=_hsf&&goto :eof
if %errorlevel%==3 set Pc=PC-Other&set hs=_hso&&goto :eof
if %errorlevel%==2 set Pc=HS-Lan&set hs=_hsl&&goto :eof
if %errorlevel%==1 set Pc=HS-Wan&set hs=_hsw&&goto :eof
REM ¸ù¾ÝARPÉèÖÃµçÄÔµçÄÔËùÊô
arp -a|findstr /i "38.40." >nul && (set Pc=HS-Lan&set hs=_hsl)||(arp -a|findstr /i "38.41." >nul && (set Pc=HS-Lan&set hs=_hsl)||(arp -a|findstr /i "10.198." >nul && (set Pc=HS-Wan&set hs=_hsw)||(set Pc=PC-Other&cls&echo. &echo.¡¡ÔÝÎÞ·¨ÅÐ¶ÏÄúµÄ»·¾³&echo.&echo.¡¡±¾½Å±¾×¨¹©ÓÚ»ÕÉÌÒøÐÐÂí°°É½µØÇøÍøÂç»·¾³Ê¹ÓÃ&echo.¡¡ÈçÄúÓÐ¶¨ÖÆÐèÇóÇëÓÚÎÒË¾ÁªÏµ&echo. &echo.¡¡Âí°°É½´´Èñµç×Ó¿Æ¼¼ÓÐÏÞ¹«Ë¾ - ÉÛ»ª - 7x24H - 18900559020&timeout /t 3 >nul&exit)))
goto :eof

:patch64
set bit=64&set arch=X64&set IE_Path64=C:\Program Files\Internet Explorer\iexplore.exe&set IE_Path32=C:\Program Files (x86)\Internet Explorer\iexplore.exe
goto :eof
:patch32
set bit=32&set arch=X86&set IE_Path64=&set IE_Path32=C:\Program Files\Internet Explorer\iexplore.exe
goto :eof

:cmd_admin
REM UAC_½ûÓÃLUAºËÐÄÈ¨ÏÞ¼Ü¹¹
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f
REM UAC_¹Ø±ÕÄÚÖÃ¹ÜÀíÔ±¸ôÀë£¬ÍêÈ«»íÃâUAC¹Ü¿Ø
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "BuiltInAdminIsolation" /t REG_DWORD /d 0 /f
REM UAC_¹ÜÀíÔ±ÕË»§ÌáÈ¨ÐÐÎª£ºÎÞµ¯´°¡¢×Ô¶¯Ö±½ÓÅú×¼ÌáÉý
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f
REM UAC_±ê×¼ÓÃ»§ÌáÈ¨ÐÐÎª£º±ØÐëÊäÈë¹ÜÀíÔ±Æ¾¾Ý²Å¿ÉÌáÈ¨
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d 3 /f
REM UAC_È¡ÏûUIAccess³ÌÐòÇ¿ÖÆ°²È«Â·¾¶ÏÞÖÆ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d 0 /f
REM UAC_ÔÊÐíUIAccess³ÌÐòÇÐ»»ÖÁ·Ç°²È«×ÀÃæÔËÐÐ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t REG_DWORD /d 1 /f
REM UAC_°²×°³ÌÐò¼ì²â¹Ø±Õ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d 0 /f
REM UAC_¿ªÆôÎÄ¼þ/×¢²á±íÐéÄâ»¯¼æÈÝ²ã
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t REG_DWORD /d 1 /f
REM UAC_È¡ÏûÄÚÖÃ¹ÜÀíÔ±ÕË»§µÄUACÅú×¼Ä£Ê½ÏÞÖÆ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d 0 /f
REM UAC_½ûÓÃ°²È«×ÀÃæ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f
REM UAC_¹Ø±Õ¹ÜÀíÔ±Ç¿ÖÆÇ©ÃûÑéÖ¤
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures" /t REG_DWORD /d 0 /f
REM UAC_¾É°æÐéÄâ»¯»úÖÆ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "VirtualizationEnabled" /t REG_DWORD /d 1 /f
REM °²È«_×èÖ¹²»ÐÅÈÎ×ÖÌåÀ¹½Ø
reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Config" /v "UntrustedFontBlocking" /t REG_DWORD /d 0 /f
REM ²ßÂÔ_·Å¿íAppLockerÈíÏÞÖÆ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppLocker" /v "AllowSoftRestrictions" /t REG_DWORD /d 1 /f
REM Éè±¸_½â³ýÈ«¾ÖÉè±¸°²×°½ûÖ¹²ßÂÔ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v "DenyDeviceInstallation" /t REG_DWORD /d 0 /f
REM ÏµÍ³_×èÖ¹¸üÐÂºó×Ô¶¯ÖØÆô
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableAutomaticRestartSignOn" /t REG_DWORD /d 1 /f
REM ÏµÍ³_¹ÜÀíÔ±ÓëÓÃ»§ÍøÂçÇý¶¯Æ÷»¥Í¨
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLinkedConnections" /t REG_DWORD /d 1 /f
REM ÏµÍ³_½â³ýÔ¶³Ì±¾µØÕË»§UACÏÞÖÆ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "LocalAccountTokenFilterPolicy" /t REG_DWORD /d 1 /f
REM ÏµÍ³_È¡Ïû±ê×¼ÓÃ»§´òÓ¡»úÇý¶¯°²×°ÏÞÖÆ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "LimitPrintDriverInstall" /t REG_DWORD /d 0 /f
REM ´òÓ¡_ÔÊÐíÆÕÍ¨ÓÃ»§°²×°´òÓ¡»úÇý¶¯
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Printers\PointAndPrint" /v "RestrictDriverInstallationToAdministrators" /t REG_DWORD /d 0 /f
REM Åú´¦ÀíÓÒ¼ü¡¸ÒÔ¹ÜÀíÔ±Éí·ÝÔËÐÐ¡¹ÃüÁîÐÞ¸´
reg add "HKCR\cmdfile\shell\runas\command" /ve /t reg_sz /d "cmd.exe /C \"%1\" %*" /f
REM Ç¿ÖÆ 64Î» CMD Ä¬ÈÏ¹ÜÀíÔ±
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\system32\cmd.exe" /t reg_sz /d RUNASADMIN /f
REM Ç¿ÖÆ 32Î» CMD Ä¬ÈÏ¹ÜÀíÔ±
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\SysWOW64\cmd.exe" /t reg_sz /d RUNASADMIN /f
REM Ç¿ÖÆ conhost ¹ÜÀíÔ±ÔËÐÐ
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\system32\conhost.exe" /t reg_sz /d RUNASADMIN /f
REM PS½Å±¾ÓÒ¼ü¹ÜÀíÔ±ÔËÐÐÈÆ¹ý²ßÂÔ
reg add "HKCR\Microsoft.PowerShellScript.1\Shell\runas\command" /ve /t reg_sz /d "PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File \"%1\"" /f
REM 64Î» PowerShell Ä¬ÈÏ¹ÜÀíÔ±
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" /t reg_sz /d RUNASADMIN /f
REM 32Î» PowerShell Ä¬ÈÏ¹ÜÀíÔ±
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\SysWOW64\WindowsPowerShell\v1.0\powershell.exe" /t reg_sz /d RUNASADMIN /f
REM Ç¿ÖÆ¸üÐÂ×é²ßÂÔ
gpupdate /force
REM ÖØÆô×ÊÔ´¹ÜÀíÆ÷ÉúÐ§È«²¿UI&È¨ÏÞ
taskkill /f /im explorer.exe
start explorer.exe
goto :eof

:pctime
REM Ö¸¶¨NTP·þÎñÆ÷
call :pctime%hs%
REM ¿ªÆô¡°×Ô¶¯ÉèÖÃÊ±¼ä¡±
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v Type /d NTP /f
REM ¿ªÆô¡°×Ô¶¯ÉèÖÃÊ±Çø¡±
reg add "HKLM\SYSTEM\CurrentControlSet\Services\tzautoupdate" /v Start /t reg_dword /d 3 /f
w32tm /config /update
sc config w32time start= auto
net stop w32time
net start w32time
w32tm /resync /rediscover /nowait
goto :eof
:pctime_hsl
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v 3 /t reg_sz /d 38.40.254.250 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v NtpServer /t reg_sz /d 38.40.254.250 /f
w32tm /config /manualpeerlist:"38.40.254.250" /syncfromflags:manual /reliable:yes /update
goto :eof
:pctime_hsw
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v NtpServer /t reg_sz /d "time.windows.com,0x9" /f
w32tm /config /manualpeerlist:"time.windows.com" /syncfromflags:manual /reliable:yes /update
goto :eof
:pctime_hso
call :pctime_hsw
goto :eof
:pctime_hsf
call :pctime_hsw
goto :eof

:closesoft
REM ¹Ø±ÕËùÓÐä¯ÀÀÆ÷¼°À¬»øÈí¼þ
for %%i in (iexplore MicrosoftEdge chrome firefox WeChat WechatBrowser 360se 360ent 360chrome sesvc StartMenuExperienceHost OneDrive wpsoffice FRMI Lcserver) do @taskkill /f /t /im "%%i.exe" 2>nul
goto :eof

:better_yj
REM Ó²¼þ-µçÔ´½â³ýµçÔ´ÏÞÖÆ
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t reg_dword /d 1 /f
REM Ó²¼þ-µçÔ´ÐÔÄÜÓÅ»¯
echo ½âËø´¦ÀíÆ÷Ïà¹ØµÄµçÔ´Ñ¡Ïî
powercfg -attributes SUB_PROCESSOR -ATTRIB_HIDE
echo ½âËøµçÔ´Ïà¹ØµÄÑ¡Ïî
powercfg -attributes SUB_POWERD -ATTRIB_HIDE
echo ½âËøÊÓÆµÏà¹ØµÄµçÔ´Ñ¡Ïî
powercfg -attributes SUB_VIDEO -ATTRIB_HIDE
echo ½âËøË¯ÃßÏà¹ØµÄµçÔ´Ñ¡Ïî
powercfg -attributes SUB_SLEEP -ATTRIB_HIDE
echo ½âËøCIÏà¹ØµÄÑ¡Ïî
powercfg -attributes SUB_CI -ATTRIB_HIDE
echo ½âËøÀäÈ´Ïà¹ØµÄµçÔ´Ñ¡Ïî
powercfg -attributes SUB_COOLING -ATTRIB_HIDE
echo ½âËøµç³ØÏà¹ØµÄµçÔ´Ñ¡Ïî
powercfg -attributes SUB_BATTERY -ATTRIB_HIDE
echo ½âËøPCI ExpressÏà¹ØµÄµçÔ´Ñ¡Ïî
powercfg -attributes SUB_PCIEXPRESS -ATTRIB_HIDE
echo ½âËø´ÅÅÌÏà¹ØµÄµçÔ´Ñ¡Ïî
powercfg -attributes SUB_DISK -ATTRIB_HIDE
echo ½âËøSCIÏà¹ØµÄÑ¡Ïî
powercfg -attributes SUB_SCI -ATTRIB_HIDE
echo ÔÙ´Î½âËø´¦ÀíÆ÷Ïà¹ØµÄµçÔ´Ñ¡Ïî£¨°üº¬¶à´ÎÒÔÈ·±£½âËø³É¹¦£©
powercfg -attributes SUB_PROCESSOR -ATTRIB_HIDE
echo ½âËø¿ÉÒÆ¶¯Éè±¸Ïà¹ØµÄµçÔ´Ñ¡Ïî
powercfg -attributes SUB_REMOVABLE -ATTRIB_HIDE
echo ´Ó²»¹Ø±ÕÏÔÊ¾Æ÷
Powercfg -x -monitor-timeout-dc 0
Powercfg -x -monitor-timeout-ac 0
echo ´Ó²»¹Ø±ÕÓ²ÅÌ
powercfg -x -disk-timeout-dc 0
powercfg -x -disk-timeout-ac 0
echo ´Ó²»×Ô¶¯½øÈëË¯Ãß×´Ì¬
powercfg -x -standby-timeout-dc 0
powercfg -x -standby-timeout-ac 0
powercfg -hibernate off
del /q /f C:\hiberfil.sys
echo ´Ó²»×Ô¶¯½øÈëÐÝÃß×´Ì¬
powercfg -x -hibernate-timeout-dc 0
powercfg -x -hibernate-timeout-ac 0
echo ¹Ø±ÕÏÔÊ¾Æ÷Ç°µÈ´ýÊ±¼ä: ´Ó²»
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
echo »½ÐÑÊ±²»ÐèÒªÃÜÂë
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c fea3413e-7e05-4911-9a71-700331f1c294 0e796bdb-100d-47d6-a2d5-f7d2daa51f51 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c fea3413e-7e05-4911-9a71-700331f1c294 0e796bdb-100d-47d6-a2d5-f7d2daa51f51 0
echo ´Ó²»¹Ø±ÕÓ²ÅÌ
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
echo JavaScript ¼ÆÊ±Æ÷ÆµÂÊ×î¸ßÐÔÄÜ
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 1
echo ×ÀÃæÔÊÐí·ÅÓ³»ÃµÆÆ¬
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
echo ÎÞÏßÊÊÅäÆ÷×î¸ßÐÔÄÜ
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
echo ´Ó²»×Ô¶¯½øÈëË¯Ãß
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
echo ÔÊÐí»ìºÏË¯Ãß
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 1
echo ´Ó²»×Ô¶¯½øÈëÐÝÃß
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
echo ÔÊÐíÊ¹ÓÃ»½ÐÑ¶¨Ê±Æ÷
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 1
echo USB Ñ¡ÔñÐÔÔÝÍ£ÉèÖÃ
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
echo ºÏÉÏ¸Ç×Ó£¬²»²ÉÈ¡ÈÎºÎ²Ù×÷
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
echo °´ÏÂµçÔ´°´Å¥Îª¹Ø»ú
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
echo °´ÏÂË¯Ãß°´Å¥ÎªË¯Ãß
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
echo ÏµÍ³É¢ÈÈ·½Ê½ÎªÖ÷¶¯
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
echo Ã½Ìå¹²ÏíÊ±£¬×èÖ¹¼ÆËã»ú½øÈëË¯Ãß×´Ì¬
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 1
echo Video playback quality bias
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 1
echo ²¥·ÅÊÓÆµÊ±£¬ÓÅ»¯ÊÓÆµÖÊÁ¿
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0
echo ½ûÓÃË¯Ãß°´Å¥
powercfg /setacvalueindex scheme_current sub_buttons "sbuttonaction" 0
powercfg /setdcvalueindex scheme_current sub_buttons "sbuttonaction" 0
powercfg /setactive scheme_current
echo ¿ªÆô¡¾×¿Ô½ÐÔÄÜ¡¿
REM ¶¨Òå×¿Ô½ÐÔÄÜµçÔ´¼Æ»®µÄGUID
set "EXCELLENT_GUID=e9a42b02-d5df-448d-aa00-03f14749eb61"
set "HIGH_PERF_GUID=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
REM ³¢ÊÔ¼¤»î×¿Ô½ÐÔÄÜ
for /f "tokens=2 delims=:(" %%a in ('powercfg /list 2^>nul ^| findstr /i "×¿Ô½ÐÔÄÜ"') do (
    set "GUID=%%a"
    set "GUID=!GUID: =!"
    powercfg -setactive !GUID! >nul 2>&1
    goto :skip_high_perf
)
REM Èç¹û²»´æÔÚ£¬´´½¨²¢¼¤»î
powercfg -duplicatescheme !EXCELLENT_GUID! >nul 2>&1
for /f "tokens=2 delims=:(" %%a in ('powercfg /list 2^>nul ^| findstr /i "×¿Ô½ÐÔÄÜ"') do (
    set "GUID=%%a"
    set "GUID=!GUID: =!"
    powercfg -setactive !GUID! >nul 2>&1
    goto :skip_high_perf
)
REM Èç¹û¶¼Ê§°Ü£¬Ê¹ÓÃ¸ßÐÔÄÜ¼Æ»®
powercfg -setactive !HIGH_PERF_GUID! >nul 2>&1
:skip_high_perf

REM Ó²¼þ-µçÔ´ÐÔÄÜÓÅ»¯-½ûÓÃÏµÍ³ÐÝÃß
powercfg -h off
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 0
del /q /f c:\hiberfil.sys
REM Ó²¼þ-Çý¶¯-win10½ûÖ¹ÍêÕûÐÔ¼ì²é
reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Policy" /v "VerifiedAndReputablePolicyState" /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Config" /v "VulnerableDriverBlocklistEnable" /t reg_dword /d 0 /f
REM Ó²¼þ-Çý¶¯-win10½ûÖ¹¸üÐÂÇý¶¯
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t reg_dword /d 1 /f
REM Ó²¼þ-Çý¶¯-½ûÓÃÆô¶¯Ê±µÄÍêÕûÐÔ¼ì²é
bcdedit /set nointegritychecks on
REM Ó²¼þ-Çý¶¯-½ûÓÃÊý¾ÝÖ´ÐÐ±£»¤£¨DEP£©
bcdedit /set nx AlwaysOff
REM Ó²¼þ-Çý¶¯-½ûÓÃÆô¶¯Ê±µÄÍêÕûÐÔ¼ì²é
bcdedit /set loadoptions DISABLE_INTEGRITY_CHECKS
REM Ó²¼þ-Çý¶¯-¹Ø±ÕMPO
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Dwm" /v "MPO" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /t reg_dword /d 5 /f
REM Ó²¼þ-Çý¶¯-ÆôÓÃ APPX ¿ª·¢ÈËÔ±Ä£Ê½
powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"
REM ½ûÓÃ¶¯Ì¬Ê±ÖÓµ÷Õû¹¦ÄÜ
bcdedit /set disabledynamictick yes
REM ÆôÓÃÆ½Ì¨¶¨Ê±Æ÷¹¦ÄÜ
bcdedit /set useplatformtick yes
REM ¹Ø±ÕÇý¶¯Ç©ÃûÑéÖ¤£¨Îð¿ª£¬·ñÔòÓÒÏÂ½Ç»áÌáÊ¾²âÊÔÄ£Ê½£¬³ý·Çbcdedit /set nointegritychecks on¹Ø±ÕÌáÊ¾£©
::bcdedit /set testsigning on
REM ¿ªÆôµ÷ÊÔ¹¦ÄÜ
REM bcdedit /debug ON
REM bcdedit /bootdebug ON
REM Ó²¼þ-Çý¶¯-ÔÊÐí¹ÜÀíÔ±¸²¸ÇÉè±¸°²×°ÏÞÖÆ²ßÂÔ
reg add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v "AllowAdminInstall" /t reg_dword /d 1 /f
REM Ó²¼þ-Çý¶¯-½«Éè±¸Çý¶¯³ÌÐòµÄ´úÂëÇ©ÃûÉèÖÃÎªºöÂÔ
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Driver Signing" /v "BehaviorOnFailedVerify" /t reg_dword /d 0 /f
goto :eof

:better_xt
REM ÏµÍ³-Í¨Öª-ÍêÈ«½ûÓÃ´íÎó±¨¸æ£¬²»ÊÕ¼¯Ò²²»·¢ËÍ±ÀÀ£ÐÅÏ¢
reg add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v DoReport /t REG_DWORD /d 0 /f
REM ÏµÍ³-Í¨Öª-²»ÏÔÊ¾´íÎó±¨¸æÌáÊ¾½çÃæ
reg add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v ShowUI /t REG_DWORD /d 0 /f
REM ÏµÍ³-Í¨Öª-½ö¹Ø±ÕÏµÍ³±¾ÉíµÄÍ¨ÖªÆøÅÝÌáÊ¾
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v EnableBalloonTips /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-¹Ø±ÕWindowsµÄÍ¨Öª-°²È«ºÍÎ¬»¤
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-¹Ø±ÕWindowsµÄÍ¨Öª-´òÓ¡Í¨Öª
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "Enabled" /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-¹Ø±ÕWindowsµÄÍ¨Öª-×Ô¶¯²¥·Å
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "Enabled" /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-¹Ø±ÕWindowsµÄÍ¨Öª-Defender
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "Enabled" /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-¹Ø±ÕWindowsµÄÍ¨Öª
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "LockScreenToastEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v "TrayIconStatus" /t reg_dword /d 9 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_BADGE_ENABLED" /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-ÉèÖÃÈ«¾ÖÌáÊ¾Í¨ÖªÆôÓÃ×´Ì¬Îª
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_TOASTS_ENABLED /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-ÉèÖÃÓ¦ÓÃ³ÌÐòÍ¨Öª½ûÓÃ
reg add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoToastApplicationNotification /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoToastApplicationNotification /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-½ûÓÃ Windows To Go ±£³Ö²åÈë USB Çý¶¯Æ÷µÄÌáÊ¾
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PortableOperatingSystem" /v ShutdownBehavior /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v PortableOperatingSystem /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\ControlSet001\Control" /v PortableOperatingSystem /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-Òþ²Ø°²È«ºÍÎ¬»¤ÖÐµÄ½¡¿µ±¨¸æ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-½ûÓÃÍ¨ÖªÖÐµÄÉÁ¹âÐ§¹û
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_GLEAM_ENABLED /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-½ûÓÃÍ¨ÖªÖÐµÄ»ÕÕÂ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_BADGE_ENABLED /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-½ûÓÃÆô¶¯Æ÷µÄÇáÉ¨¹¦ÄÜ
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\Launcher" /v "DisableLightDismiss" /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-½ûÓÃÍ¨ÖªÖÐÐÄ
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-¹Ø±Õ¡°Í¬Òâ¸öÈËÊý¾Ý¿ç¾³´«Êä¡±
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CloudContent" /v DisableCrossDeviceDataTransfer /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-¹Øµôµ÷ÊÔÆ÷Dr.Watson
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t reg_sz /d 0 /f
REM ÏµÍ³-Í¨Öª-½ûÓÃWindows Defender Security CenterµÄÍ¨Öª
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-¹Ø±ÕÓò·À»ðÇ½×èÖ¹ÐÂÓ¦ÓÃÊ±Í¨Öª£º
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v DisableNotifications /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-¹Ø±Õ¹«¹²·À»ðÇ½×èÖ¹ÐÂÓ¦ÓÃÊ±Í¨Öª£º
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v DisableNotifications /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-¹Ø±ÕWindows Defender·À»ðÇ½×èÖ¹ÐÂÓ¦ÓÃÊ±Í¨Öª£º
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v Notifications_Disabled /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-ÉèÖÃ½ûÓÃÍ¨Öªµ¯´°
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NocToastEnabled /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-½ûÓÃËùÓÐµÄ¡°°²È«ºÍÎ¬»¤¡±Í¨Öª
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v Enabled /t reg_dword /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v Enabled /t reg_dword /d 0 /f
REM ÏµÍ³-Í¨Öª-½ûÓÃ¶¯Ì¬Ëø³öÏÖÎÊÌâÊ±µÄÍ¨Öª
reg add "HKLM\SOFTWARE\Microsoft\Windows Security Health\Health Advisor" /v DynamicLockNotificationDisabled /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-½ûÓÃ²»Âú×ãÏµÍ³ÒªÇóµÄË®Ó¡
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v NoGenTicket /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-½ûÓÃwindows´íÎó±¨¸æ£¨WER£©
reg add "HKLM\Software\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" /v Disabled /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v DefaultConsent /t reg_dword /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v DefaultOverrideBehavior /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v DontSendAdditionalData /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v LoggingDisabled /t reg_dword /d 1 /f
schtasks /change /tn "Microsoft\Windows\ErrorDetails\EnableErrorDetailsUpdate" /disable
schtasks /change /tn "Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
REM ÏµÍ³-Í¨Öª-¹Ø±Õwindows·´À¡ºÍÕï¶Ï
schtasks /change /tn "Microsoft\Windows\Feedback\Siuf\DmClient" /disable
schtasks /change /tn "Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /disable
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t reg_dword /d 0 /f
reg delete "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "DoNotShowFeedbackNotifications" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t reg_dword /d 1 /f
REM ÏµÍ³-Í¨Öª-¹Ø±Õ"Íê³ÉÉè±¸ÉèÖÃÒÔ³ä·ÖÀûÓÃWindowsµÄ½¨Òé"Í¨Öª
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d 0 /f

REM ÏµÍ³-¹ã¸æ-¹Ø±Õ¹ã¸æ±êÊ¶·û
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃÓ²¼þÇåµ¥ÊÕ¼¯
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃÊÇ0£¬»ù±¾ÊÇ1£¬Ò£²â¡£Êµ²â1¸üºÃ£¬atelas£¬20260410¸Ä³É0
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowDeviceNameInTelemetry" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-Çå¿ÕÉÌÒµ ID
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "CommercialId" /t REG_SZ /d "" /f
REM ÏµÍ³-¹ã¸æ-¹Ø±ÕÓ¦ÓÃ³ÌÐòÓ°ÏìÒ£²â
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃOneSettingsÅäÖÃÉèÖÃµÄÏÂÔØ
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v "DisableOneSettingsDownloads" /t REG_DWORD /d 1 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ¶Ô´ËÉè±¸ÉÏÓÃ»§ÕË»§ÐÅÏ¢µÄÓ¦ÓÃ·ÃÎÊ
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ¶ÔÉè±¸Õï¶ÏÐÅÏ¢µÄÓ¦ÓÃ·ÃÎÊ
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
REM ÏµÍ³-¹ã¸æ-½ûÖ¹½«ÎÄ±¾ÏûÏ¢±¸·Ýµ½ÔÆ¶Ë
reg add "HKLM\Software\Policies\Microsoft\Windows\Messaging" /v "AllowMessageSync" /t REG_DWORD /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ²¢ÖØÖÃÕû¸ö¼ÆËã»úµÄ¹ã¸æID
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ·¢ËÍÊÖÐ´´íÎó±¨¸æ
reg add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ·¢ËÍ±Ê¼£Êý¾Ý
reg add "HKLM\Software\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
REM ÏµÍ³-¹ã¸æ-¹Ø±ÕÊý¾ÝÊÕ¼¯ÖÐµÄÒ£²â
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "LimitEnhancedDiagnosticDataWindowsAnalytics" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ´«µÝÓÅ»¯ÄÚÈÝ£¬ÉèÖÃÏÂÔØÄ£Ê½Îª99£¨ÍêÈ«½ûÓÃ´«µÝÓÅ»¯P2P¹¦ÄÜ£©
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d 99 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadModeBackground /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadModeForeground /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-¹Ø±Õ¿Í»§ÌåÑé¸ÄÉÆ¼Æ»®
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /d 0 /t reg_dword /f
REM ÏµÍ³-¹ã¸æ-¹Ø±ÕÌåÑé·´À¡
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feedback" /v "Disabled" /t reg_dword /d 1 /f
REM ÏµÍ³-¹ã¸æ-½ûÖ¹Ïò Microsoft ·¢ËÍÄ«¼£ºÍ´ò×ÖÊý¾Ý
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t "reg_dword" /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t "reg_dword" /d "1" /f
REM ÏµÍ³-¹ã¸æ-½ûÖ¹Ïò Microsoft ·¢ËÍ¹ØÓÚÎÒÈçºÎÊéÐ´µÄÐÅÏ¢£¬ÒÔ°ïÖúÎÒÃÇ¸Ä½ø½«À´µÄ´ò×ÖºÍÐ´×÷
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t "reg_dword" /d "1" /f
REM ÏµÍ³-¹ã¸æ-½ûÖ¹ Windows ÊÕ¼¯ÁªÏµÈËÊý¾Ý
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t "reg_dword" /d "0" /f
REM ÏµÍ³-¹ã¸æ-½«¡¸´«µÝ×î¼Ñ»¯¡¹Éè¶¨Îª¹Ø±Õ¡¸ÔÊÐí´ÓÆäËûµçÄÔÏÂÔØ¡¹
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t "reg_dword" /d "0" /f
REM ÏµÍ³-¹ã¸æ-¹Ø±Õ×ÊÑ¶ºÍÐËÈ¤
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t reg_dword /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃWindowsÖÐµÄ¸öÐÔ»¯ÌåÑéºÍÕï¶ÏÊý¾ÝÊÕ¼¯¹¦ÄÜ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /d 0 /t reg_dword /f
REM ÏµÍ³-¹ã¸æ-¹Ø±Õwindows´«µÝÓÅ»¯
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceAppSuggestionsEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃµÇÂ¼Ê±Æô¶¯ÒþË½ÉèÖÃÌåÑé
reg add "HKLM\Software\Policies\Microsoft\Windows\OOBE" /v "DisablePrivacyExperience" /t reg_dword /d 1 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃÄÚÈÝ½»¸¶¹ÜÀíÆ÷µÄÔ­Ê¼Éè±¸ÖÆÔìÉÌÔ¤×°Ó¦ÓÃ³ÌÐò
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-¹Ø±ÕÉÌµêÓ¦ÓÃÍÆ¹ã
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃÄÚÈÝ½»¸¶¹ÜÀíÆ÷µÄ¾²Ä¬°²×°Ó¦ÓÃ³ÌÐò
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃÄÚÈÝ½»¸¶¹ÜÀíÆ÷µÄÈí×ÅÂ½¹¦ÄÜ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-²»ÔÊÐíÔÚ¿ªÊ¼²Ëµ¥ÏÔÊ¾½¨Òé
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-¹Ø±Õ¡°ÆôÓÃÀ´×Ô Microsoft ºÍºÏ×÷»ï°éÔÚÕû¸ö Windows ÖÐµÄ´ÙÏúÄÚÈÝ¶©ÔÄ¡±
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContentEnabled /t REG_DWORD /d 0 /f
REM ½çÃæ-¹ã¸æ-½ûÓÃ¿ªÊ¼²Ëµ¥µÄÓ¦ÓÃÍÆ¼ö´ÅÌù
for %%a in (202914 280810 280811 280815 310093 310094 314559 314563 338387 338388 338389 338393 353694 353696 353698 88000326) do reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-%%aEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-¹Ø±ÕÏòµ¼ºÍÍÆ¼öÏà¹ØµÄÄÚÈÝ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t reg_dword /d 1 /f
REM ÏµÍ³-¹ã¸æ-ÆôÓÃWindows¾Û¹âµÆ¹¦ÄÜ£¬1ÊÇ½ûÓÃ£¬0ÊÇÆôÓÃ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightFeatures" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t reg_dword /d 1 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃÄÚÈÝ½»¸¶¹ÜÀíÆ÷µÄ¹¦ÄÜ¹ÜÀí
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-ÆôÓÃ Content Delivery Manager£¨ÄÚÈÝ½»¸¶¹ÜÀíÆ÷£©ÒÔÔÊÐí Windows ¾Û½¹¹¦ÄÜ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t reg_dword /d 1 /f
REM ÏµÍ³-¹ã¸æ-ÆôÓÃÐý×ªËøÆÁ¹¦ÄÜ£¬ÔÊÐíWindows¾Û½¹Í¼Æ¬ÔÚËøÆÁ½çÃæÉÏÐý×ªÏÔÊ¾
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t reg_dword /d 1 /f
REM ÏµÍ³-¹ã¸æ-ÆôÓÃÄÚÈÝ½»¸¶¹ÜÀíÆ÷µÄÐý×ªËøÆÁµþ¼Ó²ã¹¦ÄÜ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-¹Ø±ÕÔÊÐíÍøÕ¾Í¨¹ý·ÃÎÊÓïÑÔÁÐ±íÀ´Ìá¹©Ïà¹Ø·þÎñ
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t reg_dword /d 1 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ×é²ßÂÔµÄ¡°ÔÊÐíÊ¹ÓÃ½²ÊöÈË¡±ÉèÖÃ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Accessibility" /v "Config" /t REG_SZ /d "" /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ×é²ßÂÔ¼¶±ðµÄ½²ÊöÈË
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Accessibility" /v "DisableNarrator" /t REG_DWORD /d 1 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ½²ÊöÈËÖ÷¿ª¹Ø
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Accessibility" /v "Configuration" /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ½²ÊöÈË¿ì½Ý¼ü£¨Win+Ctrl+Enter£©
reg add "HKCU\Control Panel\Accessibility\Narrator" /v "AllowShortcut" /t REG_DWORD /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃµÇÂ¼Ê±×Ô¶¯Æô¶¯½²ÊöÈË
reg add "HKCU\Software\Microsoft\Narrator" /v "AutoStart" /t REG_DWORD /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ½²ÊöÈË×Ô¶¯Æô¶¯
reg add "HKCU\SOFTWARE\Microsoft\Narrator\NarratorHome" /v "AutoStart" /t REG_DWORD /d 0 /f
REM ÏµÍ³-¹ã¸æ-ÉèÖÃ½²ÊöÈË×îÐ¡»¯ÀàÐÍ
reg add "HKCU\SOFTWARE\Microsoft\Narrator\NarratorHome" /v "MinimizeType" /t REG_DWORD /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ½²ÊöÈËÔÚÏß·þÎñ
reg add "HKCU\SOFTWARE\Microsoft\Narrator\NoRoam" /v "OnlineServicesEnabled" /t REG_DWORD /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃÍ¨¹ýWin+EnterÆô¶¯½²ÊöÈË
reg add "HKCU\SOFTWARE\Microsoft\Narrator\NoRoam" /v "WinEnterLaunchEnabled" /t REG_DWORD /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃ½²ÊöÈËÏêÏ¸·´À¡
reg add "HKCU\SOFTWARE\Microsoft\Narrator\NoRoam" /v "DetailedFeedback" /t REG_DWORD /d 0 /f
REM ÏµÍ³-¹ã¸æ-¹Ø±ÕÎÄ¼þ×ÊÔ´¹ÜÀíÆ÷ÖÐµÄ OneDrive/Í¬²½Í¨Öª
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d 0 /f
REM ÏµÍ³-¹ã¸æ-½ûÓÃÈÎÎñÀ¸ËÑË÷ÖÐµÄ±ØÓ¦ËÑË÷½¨ÒéºÍÍøÒ³½á¹û
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "DisableSearchBoxSuggestions" /t reg_dword /d 1 /f
REM ÏµÍ³-¹ã¸æ-¹Ø±ÕÍ¨ÖªÖÐÐÄµÄÌáÊ¾Óë½¨Òé
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t reg_dword /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-¹ã¸æ-Òþ²ØÎ¢Èí Edge ×ÀÃæËÑË÷À¸
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HideDesktopSearchBar" /t REG_DWORD /d 1 /f

REM ÏµÍ³-Windows Defender-¹Ø±ÕAMSI½Ó¿ÚµÄAV
reg add "HKLM\SOFTWARE\Microsoft\Wbem" /v "AmsiEnable" /t reg_dword /d 0 /f
REM ÏµÍ³-Windows Defender-¹Ø±ÕWindows¸½¼þ²ßÂÔÖÐµÄ·À²¡¶¾É¨Ãè¹¦ÄÜ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "ScanWithAntiVirus" /t reg_dword /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "ScanWithAntiVirus" /t reg_dword /d 0 /f
REM ÏµÍ³-Windows Defender-½ûÖ¹SmartScreen µÄÓ¦ÓÃºÍÎÄ¼þ¼ì²é¹¦ÄÜ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v ConfigureAppInstallControl /t reg_dword /d 0 /f
REM ÏµÍ³-Windows Defender-½ûÓÃW½ûÖ¹indowsÓ¦ÓÃ³ÌÐòËÞÖ÷µÄWebÄÚÈÝÆÀ¹À¹¦ÄÜ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t reg_dword /d 0 /f
REM ÏµÍ³-Windows Defender-¹Ø±ÕWindows Defender
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v "ForceUpdateFromMU" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableBlockAtFirstSeen" /t reg_dword /d 1 /f
REM ÏµÍ³-Windows Defender-Windows 10 »ò¸ü¸ß°æ±¾¹Ø±ÕWindows Defender
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v CheckForSignaturesBeforeRunningScan /t reg_dword /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableSpecialRunningModes" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /t reg_dword /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /v "DisableBehaviorMonitoring" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /v "DisableOnAccessProtection" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /v "DisableScanOnRealtimeEnable" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /v "DisableScriptScanning" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableArchiveScanning /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableEmailScanning /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRemovableDriveScanning /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v AvgCPULoadFactor /t reg_dword /d 1 /f
REM ÏµÍ³-Windows Defender-Windows 7/8/8.1¹Ø±ÕWindows Defender
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiVirus" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableSpecialRunningModes" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t reg_dword /d 1 /f
REM ÏµÍ³-Spectre ºÍ Meltdown-¹Ø±Õ
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t reg_dword /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t reg_dword /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t reg_dword /d 1 /f

REM ÏµÍ³-ÉèÖÃ-¹Ø±ÕWindowsink
reg add "HKLM\Software\Microsoft\Windows\WindowsInkWorkspace" /v "AllowWindowsInkWorkspace" /t reg_dword /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\WindowsInkWorkspace" /v "AllowWindowsInkWorkspace" /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-¹Ø±ÕMS Teams×Ô¶¯°²×°
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Communications" /v ConfigureChatAutoInstall /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-¹Ø±ÕÐ¡ÄÈ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortanaAboveLock /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-¹Ø±Õcortona
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "SettingsVersion" /d 3 /t reg_dword /f
REM ÏµÍ³-ÉèÖÃ-¹Ø±ÕÊÂ¼þ¸ú×Ù³ÌÐò
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability" /v "ShutdownReasonOn" /d 0 /t reg_dword /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability" /v "ShutdownReasonUI" /d 0 /t reg_dword /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃ×Ô¶¯¸üÐÂÉÌµêÓ¦ÓÃ
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsStore" /v AutoDownload /t reg_dword /d 2 /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃ Microsoft Store ºóÌ¨·ÃÎÊÓ¦ÓÃ³ÌÐò
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.WindowsStore_8wekyb3d8bbwe" /v "Disabled" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.WindowsStore_8wekyb3d8bbwe" /v "DisabledByUser" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "BackgroundAccessApplicationsEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃ Windows ËÑË÷ÖÐµÄ±³¾°Ó¦ÓÃÈ«¾ÖÇÐ»»¹¦ÄÜ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BackgroundAppGlobalToggle /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃ´æ´¢¸ÐÖª¹¦ÄÜ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense" /v StorageSense /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\StorageSense" /v "AllowStorageSenseGlobal" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "01" /t REG_DWORD /d 0 /f
powershell -Command "Set-StorageSenseState -Disable" 2>nul
REM ÏµÍ³-ÉèÖÃ-½ûÓÃ´æ´¢¸ÐÖª°ïÖú
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "fAllowToGetHelp" /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃÔÚÕû¸öÏµÍ³ÖÐµÄ SmartScreen ¹¦ÄÜ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃWfpDiag.ETLÈÕÖ¾£¨by powerxing04£©
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BFE\Parameters\Policy\Options" /v "CollectNetEvents" /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-È¡Ïû½ûÓÃÕËºÅµÇÂ¼ÈÕÖ¾±¨¸æ
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ReportBootOk" /t reg_dword /d 1 /f
REM ÏµÍ³-ÉèÖÃ-±ÀÀ£Ê±Ð´Èëµ÷ÊÔÐÅÏ¢
reg add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" /t reg_dword /d 3 /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃ×é¼þ±¸·Ý¹¦ÄÜ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide" /v "DisableComponentBackups" /t reg_dword /d 1 /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃ×é¼þ·þÎñÈÕÖ¾
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableLog" /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃ¸üÐÂ½âÑ¹Ä£¿éDPXÈÕÖ¾
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableDpxLog" /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-VHDÆô¶¯Ê±²»Òª½«VHD¶¯Ì¬ÎÄ¼þÀ©Õ¹µ½×î´ó£¨ÒÔ½ÚÊ¡¿Õ¼ä£©
reg add "HKLM\SYSTEM\CurrentControlSet\services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /t reg_dword /d 4 /f
REM ÏµÍ³-ÉèÖÃ-¹Ø±Õ¡¸¸Ä½øÊÖÐ´±Ê¼ÇÓë¼üÈë¡¹Éè¶¨
reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t "reg_dword" /d "0" /f
REM ÏµÍ³-ÉèÖÃ-¹Ø±Õ½ÓÊÜÒþË½Õþ²ß¼´Ê×´ÎÉèÖÃwindowsÉè±¸µÄ¸÷ÖÖÒþË½¹¦ÄÜµÄÍ¬ÒâÉèÖÃ
reg add "HKLM\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t "reg_dword" /d "0" /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃÓÎÏ·Â¼ÖÆ¹¤¾ß
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-¹Ø±Õ¡°µ±ÎÒÍæÓÎÏ·Ê±ÔÚºóÌ¨Â¼ÖÆ¡±
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-ÐÞ¸Ä×Ô¶¯ÓÎÏ·Ä£Ê½ÆôÓÃÉèÖÃÎª½ûÓÃ
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v AutoGameModeEnabled /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-ÐÞ¸ÄÓÎÏ·Ãæ°åÆô¶¯ÌáÊ¾Ë÷ÒýÎª 3
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v GamePanelStartupTipIndex /t reg_dword /d 3 /f
REM ÏµÍ³-ÉèÖÃ-ÐÞ¸ÄÏÔÊ¾Æô¶¯Ãæ°åÉèÖÃÎª½ûÓÃ
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v ShowStartupPanel /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-ÐÞ¸ÄÊ¹ÓÃ Nexus ×÷ÎªÓÎÏ·À¸ÆôÓÃÉèÖÃÎª½ûÓÃ
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v UseNexusForGameBarEnabled /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-ÐÞ¸ÄÔÊÐí×Ô¶¯ÓÎÏ·Ä£Ê½ÉèÖÃÎª½ûÓÃ
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v AllowAutoGameMode /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-ÐÞ¸ÄÓ¦ÓÃ³ÌÐò²¶×½ÆôÓÃÉèÖÃÎª½ûÓÃ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-ÐÞ¸ÄÔÊÐíÓÎÏ· DVR ÉèÖÃÎªÆôÓÃ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v AllowGameDVR /t reg_dword /d 1 /f
REM ÏµÍ³-ÉèÖÃ-ÐÞ¸ÄÄ¬ÈÏÓ¦ÓÃ³ÌÐò¹ÜÀíµÄÔÊÐíÓÎÏ· DVR ÉèÖÃÎª½ûÓÃ
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v value /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-¹Ø±Õ³ÌÐò¼æÈÝÐÔÒýÇæ
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "DisableEngine" /t REG_DWORD /d 1 /f
REM ÏµÍ³-ÉèÖÃ-¹Ø±ÕÐÞ¸´Êý¾Ý¿â
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v "SbEnable" /t REG_DWORD /d 1 /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃ¼ÒÍ¥×é
reg add "HKLM\Software\Policies\Microsoft\Windows\HomeGroup" /v "DisableHomeGroup" /t REG_DWORD /d 1 /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃMicrosoft¼æÈÝÐÔÆÀ¹ÀÈÎÎñ
schtasks /change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CompatTelRunner.exe" /v "Debugger" /t reg_sz /d "%windir%\System32\taskkill.exe" /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃ Windows ¸üÐÂ±£ÁôµÄ´æ´¢¿Õ¼ä
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "ReservedStorage" /t reg_dword /d 0 /f
REM ÏµÍ³-ÉèÖÃ-¹Ø±ÕÉè±¸ËÑË÷ÀúÊ·¼ÇÂ¼
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d 0 /f
REM ÏµÍ³-ÉèÖÃ-½ûÓÃÏµÍ³»¹Ô­¹¦ÄÜ
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v DisableSR /t REG_DWORD /d 1 /f
REM ÏµÍ³-ÉèÖÃ-Windows µÇÂ¼½çÃæÉúÐ§Ð¡¼üÅÌ£º´ò¿ª£¨NumLock ¿ª»úÆô¶¯Ê±¿ªÆô£©
reg add "HKU\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f

REM ÏµÍ³-ÐÔÄÜ-GPUÓ²¼þ¼ÓËÙ¿ªÆô
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t reg_dword /d 1 /f
REM ÏµÍ³-ÐÔÄÜ-Ç¿ÖÆÐ¶ÔØ²»ÔÙÊ¹ÓÃµÄDLL
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v AlwaysUnloadDLL /t REG_DWORD /d 1 /f
REM ÏµÍ³-ÐÔÄÜ-½ûÓÃÕ³ÖÍ¼ü¿ì½Ý¼ü£¨°´5´ÎShift£©
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t reg_sz /d 506 /f
REM ÏµÍ³-ÐÔÄÜ-½ûÓÃÕ³ÖÍ¼üÍ¨¹ý¿ì½Ý¼üÆô¶¯
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "OnOff" /t REG_SZ /d "0" /f
REM ÏµÍ³-ÐÔÄÜ-½ûÓÃÕ³ÖÍ¼üÉùÒôÌáÊ¾
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "UseSound" /t REG_SZ /d "0" /f
REM ÏµÍ³-ÐÔÄÜ-½ûÓÃÉ¸Ñ¡¼ü¿ì½Ý¼ü£¨°´×¡ÓÒShift 8Ãë£©
reg add "HKCU\Control Panel\Accessibility\FilterKeys" /v "Flags" /t REG_SZ /d "122" /f
REM ÏµÍ³-ÐÔÄÜ-½ûÓÃ¸ß¶Ô±È¶È¿ì½Ý¼ü£¨×óAlt+×óShift+PrintScreen£©
reg add "HKCU\Control Panel\Accessibility\HighContrast" /v "Flags" /t REG_SZ /d "122" /f
REM ÏµÍ³-ÐÔÄÜ-µ÷Õû¼üÅÌÏìÓ¦ËÙ¶ÈºÍÆµÂÊ£¬ÒÔÌáÉýÓÃ»§µÄ¼üÅÌÊäÈëÌåÑé
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t reg_sz /d 122 /f
REM ÏµÍ³-ÐÔÄÜ-½ûÓÃ¾¯¸æÒôÐ§
reg add "HKCU\Control Panel\Accessibility" /v "Warning Sounds" /t REG_DWORD /d 0 /f
REM ÏµÍ³-ÐÔÄÜ-½ûÓÃ¼¤»îÊ±²¥·ÅÒôÐ§
reg add "HKCU\Control Panel\Accessibility" /v "Sound on Activation" /t REG_DWORD /d 0 /f
REM ÏµÍ³-ÐÔÄÜ-ÉèÖÃ¼üÅÌÖØ¸´ÑÓ³Ù£¨0±íÊ¾ÎÞÑÓ³Ù£©
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatDelay" /t REG_SZ /d "0" /f
REM ÏµÍ³-ÐÔÄÜ-ÉèÖÃ¼üÅÌÖØ¸´ËÙÂÊ£¨0±íÊ¾×îÂý/¹Ø±Õ£©
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "AutoRepeatRate" /t REG_SZ /d "0" /f
REM ÏµÍ³-ÐÔÄÜ-ÉèÖÃ°´¼ü½ÓÊÜÇ°µÄÑÓ³Ù
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "DelayBeforeAcceptance" /t REG_SZ /d "0" /f
REM ÏµÍ³-ÐÔÄÜ-ÉèÖÃÇÐ»»¼ü¹¦ÄÜ±êÖ¾£¨Caps Lock¡¢Num LockµÈÌáÊ¾Òô£©
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "34" /f
REM ÏµÍ³-ÐÔÄÜ-¹Ø±Õwin10¿ìËÙÓÃ»§ÇÐ»»¹¦ÄÜ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "HideFastUserSwitching" /t reg_dword /d 1 /f
REM ÏµÍ³-ÐÔÄÜ-µÇÂ¼windows¿ªÆôÊý×Ö¼ü
reg add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t "reg_sz" /d "2" /f
reg add "HKU\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t reg_sz /d "2" /f
REM ÏµÍ³-ÐÔÄÜ-ÆôÓÃNTFS×îºó·ÃÎÊ¸üÐÂÊ±¼ä
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 0 /f
REM ÏµÍ³-ÐÔÄÜ-½ûÓÃNTFS8.3 ¸ñÊ½µÄÎÄ¼þÃû
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /t reg_dword /d 1 /f
REM ÏµÍ³-ÐÔÄÜ-ÏµÍ³×ÔÎÒÐÞ¸´Ê±¼ä
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager" /v "AutoChkTimeout" /d 5 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "AutoChkTimeout" /d 5 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /d 1 /t reg_dword /f
REM ÏµÍ³-ÐÔÄÜ-ÆôÓÃÏµÍ³Ô¤¶ÁÈ¡ÓÅ»¯£¬Ö÷ÒªÕë¶ÔHDD
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout" /v EnableAutoLayout /t REG_DWORD /d 1 /f
REM ÏµÍ³-ÐÔÄÜ-¹Ø±Õwin10ÏµÍ³Ô¤Áô¿Õ¼ä
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t reg_dword /d 0 /f
REM ÏµÍ³-ÐÔÄÜ-³ÌÐò±ÀÀ£Ê±²»×Ô¶¯Æô¶¯µ÷ÊÔÆ÷
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v Auto /t REG_SZ /d 0 /f
REM ÏµÍ³-ÐÔÄÜ-ÆôÓÃWin10³¤Â·¾¶
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t reg_dword /d 1 /f
REM ÏµÍ³-ÐÔÄÜ-µçÄÔÆô¶¯ÓÅ»¯ÉèÖÃ
reg add "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" /v "OptimizeComplete" /t reg_dword /d 0 /f
REM ÏµÍ³-ÐÔÄÜ-½ö¹âÅÌ×Ô¶¯ÔËÐÐ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /d 221 /t reg_dword /f
REM ÏµÍ³-ÐÔÄÜ-¹Ø±Õwin10ÈÃwindows¹ÜÀíÄ¬ÈÏ´òÓ¡»ú
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows" /v "LegacyDefaultPrinterMode" /t reg_dword /d 1 /f
REM ÏµÍ³-ÐÔÄÜ-ÐÞ¸Ä¡°Èç¹û»ØÊÕÕ¾ÖÐµÄÎÄ¼þ´æÔÚ³¬¹ýÒÔÏÂÊ±³¤£¬Çë½«ÆäÉ¾³ý¡±Ñ¡Ïî£¬ÐÞ¸ÄÎª¡°´Ó²»¡±
REM ÏµÍ³-ÐÔÄÜ-ÉèÖÃÈ«¾ÖÈ«ÆÁÓÅ»¯ÐÐÎªÄ£Ê½£º2=È«¾Ö½ûÓÃÈ«ÆÁÓÅ»¯£¬Ç¿ÖÆÊ¹ÓÃ´«Í³¶ÀÕ¼È«ÆÁÄ£Ê½
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f
REM ÏµÍ³-ÐÔÄÜ-ÆôÓÃ×ñ´ÓÓÃ»§×Ô¶¨ÒåµÄFSE²ßÂÔ£º1=ÆôÓÃÉÏ·½FSEBehaviorModeÈ«¾ÖÅäÖÃ£¬0=ºöÂÔ×Ô¶¨Òå²ßÂÔÊ¹ÓÃÏµÍ³Ä¬ÈÏ
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f
REM ÏµÍ³-ÐÔÄÜ-GameDVRÈ«ÆÁÔËÐÐ¹Ü¿Ø²ßÂÔ£º2=ÏÞÖÆÓÎÏ·À¸ºóÌ¨Õ¼ÓÃ£¬±ÜÃâÂ¼ÆÁ×¥Ö¡Ôì³ÉÓÎÏ·Ö¡ÂÊ²¨¶¯¡¢ÊäÈëÑÓ³Ù
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f
REM ÏµÍ³-ÐÔÄÜ-ÔÊÐíDXGIÊ¶±ð²¢×ðÖØ¶ÀÕ¼È«ÆÁ±êÊ¶£º1=³ÌÐò½øÈë¶ÀÕ¼È«ÆÁºó£¬ÓÎÏ·À¸Í£Ö¹Ç¿ÖÆ»­Ãæ²¶»ñ£¬¼õÉÙÇÐÆÁ¡¢Â¼ÆÁ¡¢ËºÁÑÒì³£
reg add "HKCU\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 1 /f
REM ÏµÍ³-ÐÔÄÜ-½ûÓÃ´ÅÅÌËéÆ¬ÕûÀí
schtasks /change /tn "Microsoft\Windows\Defrag\ScheduledDefrag" /disable
REM ÏµÍ³-ÐÔÄÜ-ÅÐ¶ÏÊÇ·ñÎªSSD²¢Ö´ÐÐ×¨ÊôÓÅ»¯
echo ÕýÔÚ¼ì²âÏµÍ³ÅÌ½éÖÊÀàÐÍ£¬ÇëÉÔºò...
set "MediaType="
for /F "usebackq tokens=*" %%i in (`powershell -NoProfile -Command "(Get-PhysicalDisk | Where-Object { $_.DeviceID -eq (Get-Partition -DriveLetter C).DiskNumber }).MediaType"`) do (set "MediaType=%%i" )
set "MediaType=!MediaType: =!"
echo ÏµÍ³ÅÌ½éÖÊÀàÐÍÎª: !MediaType!
if /i "!MediaType!"=="SSD" (
    echo Ö´ÐÐ SSD ×¨ÊôÓÅ»¯...
    fsutil behavior set DisableDeleteNotify 0
    for /f "tokens=2 delims==" %%i in ('wmic ComputerSystem get TotalPhysicalMemory /value ^| find "="') do set mem=%%i
    set "mem=!mem: =!"
    if not "!mem!"=="0" if !mem! GEQ 8589934592 (
        reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t reg_dword /d 1 /f
    )
    reg add "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" /v Enable /t REG_SZ /d N /f
) else if /i "!MediaType!"=="HDD" (
    echo ¼ì²âµ½ HDD£¬±£Áô SuperFetch ²¢»Ö¸´Ô¤¶Á...
    sc config SysMain start= auto
    net start SysMain
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t reg_dword /d 3 /f
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t reg_dword /d 3 /f
	fsutil behavior set disable8dot3 0
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /t reg_dword /d 0 /f

) else (
    echo ÎÞ·¨È·¶¨´ÅÅÌÀàÐÍ£¬Î´½øÐÐÈÎºÎÐÞ¸Ä¡£
)

REM È«¾Ö·þÎñ³¬Ê±µÈ´ýÊ±¼ä´Ó60ÃëËõ¶ÌÖÁ30Ãë£¨¼Ó¿ì¿ª»ú/¹Ø»úËÙ¶È£©
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v ServicesPipeTimeout /t REG_DWORD /d 30000 /f
REM ÁãÊÛÑÝÊ¾¡¢Ô¤ÀÀÌåÑé¡¢µç»°·þÎñ¡¢ÌåÑéÊý¾Ý¡¢»ìºÏÏÖÊµ¡¢¼´Ê±Í¨Ñ¶
REM µØÀíÎ»ÖÃ¡¢Ë÷ÒýÎ¬»¤¡¢¶ÌÐÅÂ·ÓÉ¡¢Ç®°ü·þÎñ¡¢NFCÖ§¸¶¹ÜÀí
REM Ö§¸¶¹ÜÀíÆ÷¡¢XboxÍøÂç¡¢XboxÉí·Ý¡¢Xbox´æµµ¡¢Õï¶Ï¸ú×Ù
REM Õï¶Ï·þÎñ¡¢Õï¶ÏÊÕ¼¯¡¢´íÎó±¨¸æ¡¢ÎÊÌâ±¨¸æ
REM ÒÉÄÑÖ÷»ú¡¢ÒÉÄÑÏµÍ³¡¢´«µÝÓÅ»¯¡¢Ô¶³Ì×¢²á±í¡¢Ã½Ìå¹²Ïí
REM ´«Õæ¡¢µØÍ¼¹ÜÀí¡¢¼Ò³¤¿ØÖÆ¡¢ÎÄ¼þÀúÊ·¡¢¶Ë¿ÚÖØ¶¨Ïò¡¢¼ÒÍ¥×éÌá¹©
REM ¼ÒÍ¥×éÕìÌý¡¢±¸·Ý·þÎñ¡¢Ó¦ÓÃ×¼±¸¡¢WTG·þÎñ¡¢DMWÓÃ»§·þÎñ
REM DMWÍÆËÍ¡¢Ç¶ÈëÄ£Ê½¡¢×Ô¶¯¸üÐÂ¡¢¸üÐÂÒ½ÁÆ¡¢ËÑË÷·þÎñ¡¢¼æÈÝÖúÊÖ
for %%s in (
    RetailDemo wisvc PhoneSvc Spectrum SharedRealitySvc MessagingService 
    lfsvc PimIndexMaintenanceSvc SmsRouter WalletService NfcAppletHostService 
    PaymentManager XboxNetApiSvc XblAuthManager XblGameSave DiagTrack 
    DPS diagnosticshub.standardcollector.service WerSvc wercplsupport 
    WdiServiceHost WdiSystemHost DoSvc RemoteRegistry WMPNetworkSvc 
    Fax MapsBroker WpcMonSvc fhsvc UmRdpService HomeGroupProvider 
    HomeGroupListener SDRSVC AppReadiness WTGService dmwappuserv 
    dmwappushservice embeddedmode wuauserv WaaSMedicSvc WSearch PcaSvc
) do (
    sc stop %%s
    sc config %%s start= disabled
)

REM ²¹³ä£ºÕï¶ÏÊý¾ÝÊÕ¼¯Óë´íÎó±¨¸æµÄ×¢²á±í°²È«ÆÁ±Î
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\PushNotifications" /v "NoToastApplicationNotificationOnLockScreen" /t REG_DWORD /d 1 /f
REM ÕýÔÚÅäÖÃ²¢¿ªÆô IPv6 ×ª»»Óë LPD ´òÓ¡·þÎñ...
for %%s in (iphlpsvc lpdsvc) do (
    sc config %%s start= auto
    sc start %%s
)
REM Á´½Ó¸ú×Ù·þÎñ£ºÉèÎªÊÖ¶¯Æô¶¯£¨½öÔÚÐèÒª¿ì½Ý·½Ê½½âÎöÊ±´¥·¢£©
sc stop TrkWks
sc config TrkWks start= demand
REM ÕýÔÚÅäÖÃÏµÍ³°²È«·À»¤Ñ¡Ïî...
PowerShell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f
sc stop WinDefend
sc config WinDefend start= disabled
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f
REM Windows ·À»ðÇ½£¨Õý³£¹Ø±Õ£¬Í¬Ê±±£Áô·þÎñÏîÒÔ·ÀÒÀÀµËüµÄUWPÓ¦ÓÃÉÁÍË£©
netsh advfirewall set allprofiles state off
REM ÕýÔÚÅäÖÃ×é²ßÂÔ½ûÓÃ Defender ·À»¤...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f
REM ½ûÓÃ°²È«ÖÐÐÄÍ¨Öª£¬·ÀÖ¹ÏµÍ³²»¶ÏÓÒÏÂ½Çµ¯´°É§ÈÅ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v "DisableNotifications" /t REG_DWORD /d 1 /f
REM Í£Ö¹ Defender ÔËÐÐ·þÎñ...
sc stop SecurityHealthService
sc stop WinDefend
sc stop WdNisSvc
sc stop Sense
REM ½ûÓÃ Defender ºËÐÄ·þÎñ×ÔÆô
for %%s in (WinDefend WdNisSvc Sense SecurityHealthService) do (
    sc config %%s start= disabled
)
REM Ëø¶¨µ×²ãÇý¶¯ÓëºËÐÄ·þÎñ×ÔÆô×´Ì¬£¬ÈÃÏµÍ³ÏÂ´Î¿ª»úÊ±²»¼ÓÔØ Defender Ïà¹Ø×é¼þ
for %%d in (WinDefend Sense WdBoot WdFilter WdNisDrv WdNisSvc MDCoreSvc SecurityHealthService) do (
    reg add "HKLM\SYSTEM\CurrentControlSet\Services\%%d" /v "Start" /t REG_DWORD /d 4 /f
)
REM ÒÆ³ý°²È«ÖÐÐÄÔÚÈÎÎñÀ¸µÄ×ÔÆôÍ¼±ê
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SecurityHealth" /f
REM ½ûÓÃ Defender ×Ô¶¯É¨ÃèºÍÎ¬»¤¼Æ»®ÈÎÎñ
for %%t in (
    "Windows Defender Cache Maintenance"
    "Windows Defender Cleanup"
    "Windows Defender Scheduled Scan"
    "Windows Defender Verification"
) do (
    schtasks /change /tn "Microsoft\Windows\Windows Defender\%%~t" /disable
)


REM ½ûÓÃ¸üÐÂÐ­µ÷·þÎñ
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "start" /t reg_dword /d 4 /f
REM ½ûÓÃWindows¸üÐÂ·ÃÎÊ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t reg_dword /d 1 /f

REM ÏµÍ³-¸ñÊ½¹ØÁª-É¾³ýFTPµÄ×¢²á±íÏî
Reg Delete "HKCR\ftp\shell\open\command" /f
REM ÏµÍ³-¸ñÊ½¹ØÁª-ÖØÐÂÉèÖÃFTPµÄÄ¬ÈÏ´ò¿ª·½Ê½ÎªWindows×ÊÔ´¹ÜÀíÆ÷
reg add "HKCR\ftp\shell\open\command" /ve /d "explorer.exe %1" /f
REM ÏµÍ³-¸ñÊ½¹ØÁª-ÎÄ¼þÃ»ÓÐ¹ØÁªµÄ´ò¿ª³ÌÐòÊ±£¬½ûÖ¹´ÓÍøÂçÉÏÈ¥ËÑË÷´ò¿ªÀàÐÍ
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoInternetOpenWith" /t reg_dword /d 1 /f
REM ÏµÍ³-¸ñÊ½¹ØÁª-¹Ø±Õ´ò¿ª·½Ê½´ÓÓ¦ÓÃÉÌµêÑ¡ÔñÆäËüÓ¦ÓÃ
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t reg_dword /d 1 /f

REM ÏµÍ³-Ô¶³Ì-ÔÊÐíÔ¶³ÌÐ­Öú
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t reg_dword /d 1 /f
REM ÏµÍ³-Ô¶³Ì-ÔÊÐíÔ¶³Ì×ÀÃæÁ¬½Ó
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t reg_dword /d 0 /f
REM ÏµÍ³-Ô¶³Ì-½ûÖ¹Ô¶³ÌÐÞ¸Ä×¢²á±í
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteAccess" /t reg_dword /d 0 /f
REM ÏµÍ³-Ô¶³Ì-²»½«Ô¶³Ì×ÀÃæ»á»°ÖÐµÄ¿Í»§¶Ë´òÓ¡»úÉèÖÃÎªÄ¬ÈÏ´òÓ¡»ú
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fForceClientLptDef" /t reg_dword /d 1 /f
REM ÏµÍ³-Ô¶³Ì-½ûÓÃRPCµÄÒþË½¼¶±ðÈÏÖ¤
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Print" /v "RpcAuthnLevelPrivacyEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-Ô¶³Ì-½ûÓÃ¿Í»§¶Ë´òÓ¡»úÖØ¶¨Ïò
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCpm" /t reg_dword /d 1 /f
REM ÏµÍ³-Ô¶³Ì-ÉèÖÃÔ¶³Ì×ÀÃæÁ¬½ÓÓÅÏÈÊ¹ÓÃTCPÁ¬½Ó
reg add "HKCU\Software\Microsoft\Terminal Server Client" /v "TlsReauthe" /t reg_dword /d 0 /f
REM ÏµÍ³-Ô¶³Ì-ÉèÖÃÁ¬½ÓËÙ¶ÈÎªLAN£¨10 Mbps»ò¸ü¸ß£©
reg add "HKCU\Software\Microsoft\Terminal Server Client" /v "ConnectionBandwidth" /t reg_dword /d 1 /f
REM ÏµÍ³-Ô¶³Ì-ÆôÓÃÖÕ¶Ë·þÎñ¿Í»§¶ËµÄÁ¬½ÓÀ¸ÏÔÊ¾¡£ÕâÊ¹µÃÁ¬½ÓÀ¸ÔÚÔ¶³Ì×ÀÃæ»á»°ÖÐÊ¼ÖÕ¿É¼û¡£
reg add "HKCU\Software\Microsoft\Terminal Server Client" /v "ConnectionBarShow" /t reg_dword /d 1 /f
REM ÏµÍ³-Ô¶³Ì-ÉèÖÃÖÕ¶Ë·þÎñ¿Í»§¶ËµÄÁ¬½ÓÀ¸×´Ì¬ÎªÊ¼ÖÕÏÔÊ¾¡£ÕâÓÐÖúÓÚÓÃ»§ÔÚÊ¹ÓÃÔ¶³Ì×ÀÃæÊ±¸üºÃµØ¹ÜÀíÆäÁ¬½Ó¡£
reg add "HKCU\Software\Microsoft\Terminal Server Client" /v "ConnectionBarStatus" /t reg_dword /d 1 /f
REM ÏµÍ³-Ô¶³Ì-ÆôÓÃÖÕ¶Ë·þÎñ¿Í»§¶ËµÄÁ¬½ÓÀ¸¹Ì¶¨¹¦ÄÜ¡£
reg add "HKCU\Software\Microsoft\Terminal Server Client" /v "PinConnectionBar" /t reg_dword /d 1 /f
REM ÏµÍ³-Ô¶³Ì-½ûÓÃÔ¶³Ì×¢²á±í·ÃÎÊ
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /t reg_dword /d 1 /f

REM ÏµÍ³-ÏµÍ³¸üÐÂ-Í¨¹ý×é²ßÂÔ½ûÓÃ¹Ø±Õ"ÔÚ¿ÉÓÃÊ±Á¢¼´»ñÈ¡×îÐÂ¸üÐÂ"¹¦ÄÜ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableWUfBSafeguards" /t REG_DWORD /d 1 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-Í¨¹ý×¢²á±í½ûÓÃ"¿ÉÑ¡¸üÐÂ"×Ô¶¯ÏÂÔØ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "IncludeRecommendedUpdates" /t REG_DWORD /d 0 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-¸üÐÂ²»°üÀ¨¶ñÒâÈí¼þÉ¾³ý¹¤¾ß
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotIncludeMalwareRemovalTool" /t reg_dword /d 1 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-½ûÓÃ×Ô¶¯Ö´ÐÐ Windows Éý¼¶
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "AutoUpdate" /t reg_dword /d 2 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-×Ô¶¯°²×°ÎÞÐèÖØÆôµÄ¸üÐÂ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutoInstallMinorUpdates" /t reg_dword /d 1 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-¸üÐÂ¹ÒÆðÊ±Èç¹ûÓÐÓÃ»§µÇÂ¼²»×Ô¶¯ÖØÆô¼ÆËã»ú
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t reg_dword /d 1 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-win10½ûÖ¹¸üÐÂ´óÓÚ1809°æ±¾
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetReleaseVersion" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetReleaseVersionInfo" /t reg_sz /d 1809 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-½ûÖ¹ Windows ¸üÐÂÌáÊ¾
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableOSUpgrade /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableWindowsUpdateAccess /t reg_dword /d 1 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-Windows 7 ²»ÔÙÌáÊ¾Éý¼¶µ½ Windows 10
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\OSUpgrade" /v ReservationsAllowed /t reg_dword /d 0 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-É¾³ý Windows 10 ¸üÐÂÏà¹ØµÄ¼Æ»®ÈÎÎñ
schtasks /Change /TN "\Microsoft\Windows\WindowsUpdate\*" /DISABLE
schtasks /delete /tn "\Microsoft\Windows\WindowsUpdate\*" /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-½ûÖ¹Á¬½Óµ½ Windows Update µÄ»¥ÁªÍøÎ»ÖÃ
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t reg_dword /d 1 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-½ûÓÃ×Ô¶¯¸üÐÂ
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t reg_dword /d 1 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-Òþ²ØWindows 10Éý¼¶ÖúÊÖGWX
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Gwx" /v "DisableGwx" /t reg_dword /d 1 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-Windows¸üÐÂ²»°üÀ¨¶ñÒâÈí¼þÉ¾³ý¹¤¾ß
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t reg_dword /d 1 /f
REM ÏµÍ³-ÏµÍ³¸üÐÂ-½«Windows Update×Ô¶¯¸üÐÂµ÷ÕûÎª´Ó²»¼ì²é
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "AUOptions" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t reg_dword /d 0 /f

REM ÏµÍ³-°²È«ÉèÖÃ-¹Ø±ÕÄ¬ÈÏ¹²Ïí(½ûÖ¹ $C $D,½ûÖ¹ $Admin)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v "AutoShareServer" /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v "AutoShareWks" /t reg_dword /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-¿ªÆô¾­µä¹²Ïí
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "forceguest" /t reg_dword /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-¹Ø±Õ×Ô¶¯¸üÐÂµØÍ¼
reg add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoUpdateEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-½ûÖ¹ÒªÇó°´ÏÂ Ctrl+Alt+Del ¼üµÇÂ¼
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableCAD /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DisableCAD /t reg_dword /d 1 /f
REM ÏµÍ³-°²È«ÉèÖÃ-Î´µÇÂ¼¿É¹Ø»ú
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ShutdownWithoutLogon" /t reg_dword /d 1 /f
REM ÏµÍ³-°²È«ÉèÖÃ-½ûÓÃ¹Ø±ÕÔ­Òò
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "EnableReasonUI" /t reg_dword /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-¹Ø±ÕExploit Protection
powershell -Command "Set-ProcessMitigation -System -Disable DEP, ASLR, SEHOP, ForceRelocateImages, BlockNonMicrosoftBinaries" 2>nul
REM ÏµÍ³-°²È«ÉèÖÃ-¹Ø±ÕVBS
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Hyper-V\Guest" /v "EnableVirtualizationBasedSecurity" /t reg_dword /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-½ûÓÃ RPC ÒþË½±£»¤
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Rpcss\Parameters" /v "EnablePrivacy" /t reg_dword /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-ÔÊÐí¿ÕÃÜÂëµÇÂ¼
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "LimitBlankPasswordUse" /t REG_DWORD /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-¹Ø±ÕÃÜÂë¸´ÔÓÐÔÒªÇó
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "EnablePasswordComplexity" /t REG_DWORD /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-¹Ø±ÕÕË»§Ëø¶¨
net accounts /lockoutthreshold:0
net accounts /lockoutduration:0
net accounts /lockoutwindow:0
REM ÏµÍ³-°²È«ÉèÖÃ-ÉèÖÃÃÜÂë×îÐ¡³¤¶È
net accounts /minpwlen:0
REM ÏµÍ³-°²È«ÉèÖÃ-ÉèÖÃÃÜÂë×î¶ÌÊ¹ÓÃÆÚÏÞ
net accounts /minpwage:0
REM ÏµÍ³-°²È«ÉèÖÃ-ÉèÖÃÃÜÂë×î³¤Ê¹ÓÃÆÚÏÞ
net accounts /maxpwage:999
REM ÏµÍ³-°²È«ÉèÖÃ-»òÕßÉèÖÃÎªÓÀ²»¹ýÆÚ
net accounts /maxpwage:unlimited
REM ÏµÍ³-°²È«ÉèÖÃ-ÉèÖÃÃÜÂëÀúÊ·¼ÇÂ¼
net accounts /uniquepw:0
REM ÏµÍ³-°²È«ÉèÖÃ-½ûÓÃÃÜÂë±ØÐë·ûºÏ¸´ÔÓÐÔÒªÇóµÄGPOÉèÖÃ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PasswordComplexity" /t REG_DWORD /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-½«ÓÃ»§ÃÜÂëµÄ×î´óÓÐÐ§ÆÚÉèÖÃÎªÓÀ²»¹ýÆÚ
net user %USERNAME% /expires:never
REM ÏµÍ³-°²È«ÉèÖÃ-ÔÚ±¾µØ¼ÆËã»úÉÏÉèÖÃÔÊÐí²»°²È«µÄ·Ã¿ÍÉí·ÝÑéÖ¤£¨64Î»ÏµÍ³£©
reg add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "AllowInsecureGuestAuth" /d 1 /t reg_dword /f
REM ÏµÍ³-°²È«ÉèÖÃ-ÔÚ±¾µØ¼ÆËã»úÉÏÉèÖÃÔÊÐí²»°²È«µÄ·Ã¿ÍÉí·ÝÑéÖ¤£¨32Î»ÏµÍ³£©
reg add "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows\LanmanWorkstation" /v "AllowInsecureGuestAuth" /d 1 /t reg_dword /f
REM ÏµÍ³-°²È«ÉèÖÃ-½ûÖ¹ÎÄ¼þÊôÐÔ·ÃÎÊÏÞÖÆ»ò°²È«¾¯¸æ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t reg_dword /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t reg_dword /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-ÍêÈ«·ÅÐÐËùÓÐÎÄ¼þ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "BlockLevel" /t reg_dword /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "BlockLevel" /t reg_dword /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-½ûÖ¹ÔËÐÐ¼ÆËã»ú×Ô¶¯Î¬»¤¼Æ»®
reg add "HKLM\Software\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t reg_dword /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-ÍêÈ«Í£Ö¹windowsµÄ×Ô¶¯Î¬»¤
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t reg_dword /d 1 /f
REM ÏµÍ³-°²È«ÉèÖÃ-ÔÊÐíÖ±½ÓÔËÐÐÀ´×ÔÍøÂçµÄexebat,Õâ¸öÃ»ÓÐ20260410
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "LowRiskFileTypes" /t reg_sz /d ".exe;.reg.;.bat.;.vbs;.cmd;.ps1;.zip;.rar;.msi;.msu;.lnk;.7z;.tar.gz;.doc;.docx;.pdf;" /f
REM ÏµÍ³-°²È«ÉèÖÃ-ÔÊÐíÖ±½ÓÔËÐÐÀ´×ÔÍøÂçµÄexebat
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /t reg_sz /d ".bat;.exe;.reg;.vbs;.chm;.msi;.js;.cmd;.zip;.rar;.7z" /f
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /t reg_sz /d ".bat;.exe;.reg;.vbs;.chm;.msi;.js;.cmd;.zip;.rar;.7z" /f
REM ÏµÍ³-°²È«ÉèÖÃ-¹Ø±Õ CEIP Êý¾Ý¸üÐÂÆ÷
reg add "HKLM\Software\Policies\Microsoft\Quality Improvement Program" /v "CEIPEnabled" /t reg_dword /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-¹Ø±Õ·À»ðÇ½
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "EnableFirewall" /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "EnableFirewall" /t reg_dword /d 0 /f
REM ÏµÍ³-°²È«ÉèÖÃ-½ûÓÃ BitLocker ×Ô¶¯Éè±¸¼ÓÃÜ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\BitLocker" /v "AutoUnlockDisabled" /t reg_dword /d 1 /f
REM ÏµÍ³-°²È«ÉèÖÃ-½ûÓÃwindows°²×°Ê±ºò BitLocker ×Ô¶¯´ÅÅÌ¼ÓÃÜ
reg add "HKLM\SYSTEM\CurrentControlSet\Control\BitLocker" /v "PreventDeviceEncryption" /t reg_dword /d 1 /f
goto :eof

:better_jm
REM ½çÃæ-ËøÆÁ½çÃæ-ÆÁÄ»±£»¤³ÌÐò»Ö¸´Ê±ÐèÒªÃÜÂë
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaverIsSecure" /t reg_sz /d "1" /f
REM ½çÃæ-ËøÆÁ½çÃæ-½ûÓÃËø¶¨ÆÁÄ»Ê±×Ô¶¯µ¯³öµÄ´¥Ãþ¼üÅÌ
reg add "HKLM\SOFTWARE\Microsoft\TabletTip\1.7" /v "DisableNewKeyboardExperience" /t reg_dword /d 1 /f
REM ½çÃæ-ËøÆÁ½çÃæ-¹Ø±ÕÊ×´ÎµÇÂ¼¶¯»­
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "EnableFirstLogonAnimation" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableFirstLogonAnimation" /t reg_dword /d 0 /f
REM ½çÃæ-ËøÆÁ½çÃæ-ËøÆÁÄ£ºýÐ§¹û
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "DisableLockScreenBlur" /t reg_dword /d 1 /f
REM ½çÃæ-ËøÆÁ½çÃæ-½ûÓÃµÇÂ¼½çÃæµÄAcrylic±³¾°Ð§¹û
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "DisableAcrylicBackgroundOnLogon" /t reg_dword /d 1 /f
REM ½çÃæ-ËøÆÁ½çÃæ-½ûÓÃËø¶¨ÆÁÄ»ÉÏµÄÓïÒô¼¤»î
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\VoiceActivation\UserPreferenceForAllApps" /v AgentActivationOnLockScreenEnabled /t reg_dword /d 0 /f
REM ½çÃæ-ËøÆÁ½çÃæ-½ûÓÃÔÚËø¶¨×´Ì¬ÏÂµÄÓ¦ÓÃÓïÒô¼¤»î
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsActivateWithVoiceAboveLock /t reg_dword /d 2 /f

REM ½çÃæ-ÈÎÎñÀ¸-¹Ø±ÕÈÎÎñÀ¸¶¯»­
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v DefaultApplied /t REG_DWORD /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-µ±ÈÎÎñÀ¸±»Õ¼ÂúÊ±±»Õ¼ÂúÊ±ºÏ²¢
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t reg_dword /d 1 /f
REM ½çÃæ-ÈÎÎñÀ¸-Ëø¶¨ÈÎÎñÀ¸
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-ÈÎÎñÀ¸Ê¹ÓÃ´óÍ¼±ê
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-Ê¼ÖÕÏÔÊ¾²Ëµ¥À¸
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t reg_dword /d 1 /f
REM ½çÃæ-ÈÎÎñÀ¸-½ûÓÃÆô¶¯¡¢¹Ø±Õ¡¢×îÐ¡»¯ºÍ×î´ó»¯´°¿ÚµÄ¶¯»­
reg add "HKCU\Control Panel\Desktop" /v "Animation" /t reg_sz /d "0" /f
REM ½çÃæ-ÈÎÎñÀ¸-½ûÓÃCortana°´Å¥ÏÔÊ¾
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /d 0 /t reg_dword /f
REM ½çÃæ-ÈÎÎñÀ¸-È·±£½ûÓÃÈÎÎñÀ¸¶¯»­Ð§¹ûµÄÄ¬ÈÏÓ¦ÓÃ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v TaskbarAnimations /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-½ûÓÃÈÎÎñÀ¸¶¯»­Ð§¹û
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-ÈÎÎñÀ¸ÖÐµÄCortanaµ÷ÕûÎªÒþ²Ø
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SearchboxTaskbarMode /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-¹Ø±Õ¡°ËÑË÷ÁÁµã¡±¹¦ÄÜ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "EnableDynamicContent" /t REG_DWORD /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-ËÑË÷ÉèÖÃÎªÈ¡Ïû
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-¹Ø±ÕËÑË÷À¸ÖÐbing½á¹ûºÍ½¨Òé
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-¹Ø±ÕÏÔÊ¾¡°ÈÎÎñÊÓÍ¼¡±°´Å¥
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MultitaskingView" /v "ShowTaskViewButton" /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-¹Ø±ÕÔÚÈÎÎñÀ¸ÏÔÊ¾ÈËÂö
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v PeopleBand /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-¹Ø±ÕÔÚÈÎÎñÀ¸ÏÔÊ¾ Windows lnk ¹¤×÷Çø
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-É¾³ýÔÚÈÎÎñÀ¸ÐÂÎÅºÍÐËÈ¤Ð¡²¿¼þ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t reg_dword /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "EnShellFeedsTaskbarViewMode" /t reg_dword /d 883378425 /f
REM ½çÃæ-ÈÎÎñÀ¸-°´Å¥ÏÔÊ¾Í¼±êºÍÎÄ±¾
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /d 0 /t reg_dword /f
REM ½çÃæ-ÈÎÎñÀ¸-ÆÁÄ»¼üÅÌ²»µ²ÈÎÎñÀ¸
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableDesktopModeAutoInvoke" /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-ÔÚÍ¨ÖªÇøÓòÏÔÊ¾ËùÓÐÏµÍ³Í¼±êºÍÍ¨Öª£¨×¢ÒâÊÇ·ñ»áÓÐµ¯´°³öÏÖ£©
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t "reg_dword" /d "1" /f
REM ½çÃæ-ÈÎÎñÀ¸-½ûÓÃÓÒÏÂ½ÇWindows ²Ù×÷ÖÐÐÄÌåÑéÍ¨ÖªÍ¼±ê
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-×ÊÔ´¹ÜÀíÆ÷´°¿Ú×îÐ¡»¯Ê±ÏÔÊ¾ÍêÕûÂ·¾¶
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t reg_dword /d 1 /f
REM ½çÃæ-ÈÎÎñÀ¸-Ê¹ÈÎÎñÀ¸¸üÍ¸Ã÷
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t reg_dword /d 1 /f
REM ½çÃæ-ÈÎÎñÀ¸-È¡ÏûÈÎÎñÀ¸Ê±ÖÓ¾«È·µ½Ãë
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-Òþ²ØÄ³Ð©SATAÓ²ÅÌÈÎÎñÀ¸Í¼±ê
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvata" /v "DisableRemovable" /t reg_dword /d 1 /f
REM ½çÃæ-ÈÎÎñÀ¸-ÓïÑÔÀ¸-½«ÓïÑÔÀ¸Òþ²Øµ½ÈÎÎñÀ¸
reg add "HKCU\Software\Microsoft\CTF\MSUTB" /v "ShowDeskBand" /t reg_dword /d 1 /f
REM ½çÃæ-ÈÎÎñÀ¸-ÓïÑÔÀ¸-È¡ÏûÓïÑÔÀ¸ÉÏµÄ°ïÖú°´Å¥£¬½«ÓïÑÔÀ¸Òþ²Øµ½ÈÎÎñÀ¸
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t reg_dword /d 4 /f
REM ½çÃæ-ÈÎÎñÀ¸-ÓïÑÔÀ¸-Òþ²ØÓïÑÔÀ¸ÉÏµÄ°ïÖú°´Å¥
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ShowHelp" /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-ÓïÑÔÀ¸-ÔÚ×îÐ¡»¯Ê±²»ÏÔÊ¾ÓïÑÔÀ¸ÉÏµÄ¶îÍâÍ¼±ê
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t reg_dword /d 0 /f
REM ½çÃæ-ÈÎÎñÀ¸-ÓïÑÔÀ¸-ÉèÖÃÓïÑÔÀ¸µÄ½µ¼¶¼¶±ðÎª3
reg add "HKCU\Software\Microsoft\CTF\LangBar\ItemState{ED9D5450-EBE6-4255-8289-F8A31E687228}" /v "DemoteLevel" /t reg_dword /d 3 /f
REM ½çÃæ-ÈÎÎñÀ¸-ÓïÑÔÀ¸-ÔÚ×îÐ¡»¯Ê±²»ÏÔÊ¾ÓïÑÔÀ¸ÉÏµÄ¶îÍâÍ¼±ê
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t reg_dword /d 0 /f

REM ½çÃæ-¿ªÊ¼²Ëµ¥-É¾³ýÏÖÓÐËùÓÐ´ÅÌù
del /q /f /s "%localappdata%\Microsoft\Windows\RoamingTiles\*"
REM ½çÃæ-¿ªÊ¼²Ëµ¥-¹Ø±Õ´ÅÌù¹¦ÄÜ¼°ÏÔÊ¾
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v DisableLiveTile /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_LargeTiles /t reg_dword /d 0 /f
REM ½çÃæ-¿ªÊ¼²Ëµ¥-¹Ø±ÕÍ»³öÏÔÊ¾ÐÂ°²×°µÄ³ÌÐò
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t reg_dword /d 0 /f
REM ½çÃæ-¿ªÊ¼²Ëµ¥-¹Ø±Õ¿ªÊ¼ÆÁÄ»×Ô¶¯ÏÔÊ¾"Ó¦ÓÃ"ÊÓÍ¼
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v ShowAppsViewOnStart /d 0 /t reg_dword /f
REM ½çÃæ-¿ªÊ¼²Ëµ¥-¿ªÆô´ÅÌùÈ¡Ïû¹Ì¶¨µÄÑ¡Ïî
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "LockedStartLayout" /d 0 /t reg_dword /f
reg add "HKLM\Software\Wow6432Node\Policies\Microsoft\Windows\Explorer" /v "LockedStartLayout" /d 0 /t reg_dword /f
REM ½çÃæ-¿ªÊ¼²Ëµ¥-É¾³ýËùÓÐ´ÅÌù£¬ÓÃ»§ÍË³öÊ±Çå³ýËùÓÐ´ÅÌù
reg add "HKLM\Software\Policies\Microsoft\Windows" /v "ClearTilesOnExit" /t reg_dword /d 1 /f
REM ½çÃæ-¿ªÊ¼²Ëµ¥-¹Ø±Õ¡°Í»³öÏÔÊ¾ÐÂ°²×°µÄ³ÌÐò¡±
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_NotifyNewApps" /t reg_dword /d 0 /f
REM ½çÃæ-¿ªÊ¼²Ëµ¥-ÇåÀíÍÆ¼öÏîÄ¿ÀïµÄÈëÃÅÍ¼±ê
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\10" /v ShellExecute /t reg_sz /d "control.exe" /f
REM ½çÃæ-¿ªÊ¼²Ëµ¥-½ûÓÃ¿ªÊ¼²Ëµ¥µÄÁÚ½ü×·×Ù¹¦ÄÜ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProximity /t reg_dword /d 0 /f
REM ½çÃæ-¿ªÊ¼²Ëµ¥-½ûÓÃ¿ªÊ¼²Ëµ¥¶¯»­
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartMenuAnimation" /t reg_dword /d 0 /f

REM ½çÃæ-Ö÷ÌâÓë±³¾°-É¾³ý×î½ü·ÃÎÊ¹ýµÄÎÄ¼þ¼ÐµÄÏêÏ¸ÐÅÏ¢£¬°üÀ¨Ã¿¸öÎÄ¼þ¼ÐµÄÊÓÍ¼ÉèÖÃ
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-É¾³ýËùÓÐÎÄ¼þ¼ÐµÄÊÓÍ¼ºÍÅÅÐòÉèÖÃµÄÄ¬ÈÏÖµ
reg delete "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-×ÀÃæÍ¼±ê²¼¾Ö»º´æ£¨´æ´¢Í¼±êÎ»ÖÃ¡¢ÅÅÁÐ·½Ê½¡¢ÊÓÍ¼Ä£Ê½µÈ£©
REM reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Desktop" /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-×ÊÔ´¹ÜÀíÆ÷×î½üÊ¹ÓÃµÄÊÓÍ¼ÉèÖÃ»º´æ£¨´æ´¢ÎÄ¼þ¼ÐÊÓÍ¼ÀúÊ·¼ÇÂ¼£©
REM reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\StreamMRU" /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-ÆôÓÃAero Peek¹¦ÄÜ
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /d 1 /t reg_dword /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½ûÓÃ´°¿Ú¶¯Ì¬Ð§¹û
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisablePreviewDesktop /t reg_dword /d 1 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-¹Ø±Õ¸ß¼¶Ëõ·ÅÉèÖÃ
reg add "HKCU\Control Panel\Desktop" /v "Win8DpiScaling" /t reg_dword /d 0 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-¿ªÆôÔÊÐí Windows ³¢ÊÔÐÞ¸´Ó¦ÓÃ
reg add "HKCU\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t reg_dword /d 1 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-µ÷Õû²Ëµ¥ÏÔÊ¾ËÙ¶ÈÎª0ºÁÃë£¬ÊµÏÖ¼´µã¼´¿ªµÄÐ§¹û
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t "reg_sz" /d "0" /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-ÉèÖÃ´°¿Ú³¬Õ­±ß¿ò
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "PaddedBorderWidth" /d "-15" /t reg_sz /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-¿ªÆô¿ªÊ¼²Ëµ¥¡¢ÈÎÎñÀ¸¡¢²Ù×÷ÖÐÐÄºÍ±êÌâÀ¸µÄÑÕÉ«
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t reg_dword /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorPrevalence" /t reg_dword /d 1 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-¿ªÆô¿ªÊ¼²Ëµ¥¡¢ÈÎÎñÀ¸¡¢²Ù×÷ÖÐÐÄÍ¸Ã÷
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowGlass /t reg_dword /d 1 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-ÆôÓÃÏµÍ³Í¸Ã÷Ð§¹û
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t reg_dword /d 1 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-Êó±êÐüÍ£ÔÚUIÔªËØÉÏµÄÑÓ³ÙÊ±¼äÉèÖÃÎª0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /d 0 /t reg_dword /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½«×ÀÃæÔ¤ÀÀ´°¿ÚµÄÐüÍ£Ê±¼äÉèÖÃÎª0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DesktopLivePreviewHoverTime" /d 0 /t reg_dword /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½ûÓÃ´°¿ÚÏÂÀ­ÒõÓ°Ð§¹û
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /d 0 /t reg_dword /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½ûÓÃÊó±êÖ¸ÕëÒõÓ°Ð§¹û
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /d 0 /t reg_dword /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½ûÓÃÁÐ±íÊÓÍ¼ÖÐµÄ°ëÍ¸Ã÷Ñ¡ÔñÐ§¹û
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /d 0 /t reg_dword /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½ûÓÃÍÏ¶¯´°¿ÚÊ±È«ÆÁÏÔÊ¾
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /d 0 /t reg_sz /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½çÃæ-Ö÷ÌâÓë±³¾°-ÉèÖÃ×ÖÌåÆ½»¬¶È
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /d 2 /t reg_sz /f
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothingType" /t reg_dword /d 2 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½ûÓÃ´°¿Ú×îÐ¡»¯ºÍ×î´ó»¯Ê±µÄ¶¯»­Ð§¹û
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 0 /t reg_sz /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-ÆôÓÃÁÐ±íÊÓÍ¼ÖÐµÄÒõÓ°Ð§¹û
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /d 1 /t reg_dword /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-ÉèÖÃ×ÀÃæ´°¿Ú¹ÜÀíÆ÷µÄ×éºÏ²ßÂÔ
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /d 1 /t reg_dword /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½ûÓÃÊ¼ÖÕÐÝÃßËõÂÔÍ¼
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /d 0 /t reg_dword /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½ûÓÃÏµÍ³¸Ä½øÓÃ»§·´À¡
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /d 0 /t reg_dword /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-µ÷ÕûÊó±êÐüÍ£Ê±¼äÎª0ºÁÃë£¬ÒÔÌá¸ßÊó±ê½»»¥µÄÏìÓ¦ËÙ¶È
reg add "HKCU\Control Panel\Desktop" /v "ForegroundLockTimeout"  /t reg_dword /d 0 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-µ÷ÕûÊó±êÐüÍ£Ê±¼äÎª100ºÁÃë£¬ÒÔÊ¹½çÃæÔªËØ¿ìËÙÏìÓ¦Êó±ê²Ù×÷
reg add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /d 100 /t reg_sz /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-ÏÔÊ¾ÉèÖÃËõ·ÅÎª100%(124%ÖµÎª119,100%ÖµÎª96)
reg add "HKCU\Control Panel\Desktop" /v "LogPixels" /t reg_dword /d 96 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-ÉèÖÃÎªÆ½ÆÌÊÓÍ¼
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DefaultView" /t reg_sz /d "Tiles" /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-ÉèÖÃÄ¬ÈÏÅÅÐò·½Ê½ÎªÃû³Æ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SortOrderIndex" /t reg_dword /d 0 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-ÉèÖÃ·Ö×éÒÀ¾ÝÎªÀàÐÍ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Grouping" /t reg_sz /d "Type" /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½ûÓÃ×ÀÃæÍ¼±ê×Ô¶¯ÅÅÁÐ¹¦ÄÜ¡¢×Ô¶¯¶ÔÆëÍøÂç¡¢°´Ãû³ÆÅÅÐò
reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "FFlags" /t reg_dword /d 1075839524 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-ÐÞ¸Ä×ÊÔ´¹ÜÀíÆ÷È«ÏÔÄ£Ê½£¬Òþ²ØÎÄ¼þ / ÏµÍ³ÎÄ¼þ / À©Õ¹ÃûÈ«¶¼ÏÔÊ¾
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v ShellState /t reg_binary /d 240000003EA8000000000000000000000000000001000000130000000000000073000000 /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½ûÓÃÊÓ¾õÐ§¹û
REM reg add "HKCU\Control Panel\Desktop" /v "VisualFX" /d "0" /t reg_sz /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-ÉèÖÃÊÓ¾õÐ§¹ûÉèÖÃÎª¼«ËÙÄ£Ê½0ÆôÓÃÒ»Ð©ÌØÐ§1×î¼ÑÍâ¹Û2×î¼ÑÐÔÄÜ3
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /d 3 /t reg_dword /f
REM ½çÃæ-Ö÷ÌâÓë±³¾°-½ûÓÃÏµÍ³ÊÓ¾õ¶¯»­
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "TurnOffSPIAnimations" /d 1 /t reg_dword /f

REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-ÅäÖÃµ±Ç°ÓÃ»§×ÀÃæÓÃ»§Ê×Ñ¡ÏîÑÚÂëÎª ÉÏ´ÎÊÇ 9030078010000000£¨²»ÄÜ¶ÀÁ¢ÊäÈë·¨£© ÔÙÉÏ´ÎÊÇ 9032078010000000£¨ÏµÍ³Ä¬ÈÏÊÇ9012038010000000£©
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /d "9030078090000000" /t reg_binary /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-ÉèÖÃµ±Ç°ÓÃ»§µÄ×ÊÔ´¹ÜÀíÆ÷ÓÃ»§Ê×Ñ¡ÏîÑÚÂëÎª ÉÏ´ÎÊÇ 9032078010000000£¨ÏµÍ³Ä¬ÈÏÊÇ 9012038010000000£©
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "UserPreferencesMask" /d "9030078090000000" /t reg_binary /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-¡°´ËµçÄÔ¡±Ä¬ÈÏÕ¹¿ª
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v NavPaneExpandToThisPC /t reg_dword /d 1 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-½«Æô¶¯ÑÓ³ÙÊ±¼äÉèÖÃÎª 0 ºÁÃë£¬ÒÔ¼Ó¿ì Windows Explorer µÄÆô¶¯ËÙ¶È
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t reg_dword /d 0 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-½«µÈ´ý¿ÕÏÐ×´Ì¬ÉèÖÃÎª 0£¬ÒÔÔÚÆô¶¯ Windows Explorer Ê±²»µÈ´ý¿ÕÏÐ×´Ì¬
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v WaitforIdleState /t reg_dword /d 0 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-Êó±ê»Ö¸´¼ÓËÙ
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t reg_sz /d 1 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t reg_dword /d 6 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t reg_dword /d 10 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-¹Ø±Õ´°¿Ú×î´ó»¯ºÍ×îÐ¡»¯µÄ¶¯»­
reg add "HKCU\Control Panel\Desktop" /v "AnimateWindows" /t reg_sz /d "0" /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-Òþ²Ø¡°ÒÔÇ°µÄ°æ±¾¡±±êÇ©
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v ShowPreviousVersions /t reg_dword /d 0 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-É¾³ý¡°´ËµçÄÔ¡±ÓÒ²àÏµÍ³ÅÌ·ûÉÏ·½µÄÎÄ¼þ¼ÐÊÓÆµ
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-É¾³ý¡°´ËµçÄÔ¡±ÓÒ²àÏµÍ³ÅÌ·ûÉÏ·½µÄÎÄ¼þ¼ÐÒôÀÖ
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-É¾³ý¡°´ËµçÄÔ¡±ÓÒ²àÏµÍ³ÅÌ·ûÉÏ·½µÄÎÄ¼þ¼ÐÍ¼Æ¬
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-É¾³ý¡°´ËµçÄÔ¡±ÓÒ²àÏµÍ³ÅÌ·ûÉÏ·½µÄÎÄ¼þ¼Ð3D¶ÔÏó
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-É¾³ý¡°´ËµçÄÔ¡±½çÃæ×ó²àµÄÎÄ¼þ¼ÐÊÓÆµ
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{35286a68-3c57-41a1-bbb1-0eae73d76c95}" /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-É¾³ý¡°´ËµçÄÔ¡±½çÃæ×ó²àµÄÎÄ¼þ¼ÐÒôÀÖ
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{1cf1260c-4dd0-4ebb-811f-33c572699fde}" /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-É¾³ý¡°´ËµçÄÔ¡±½çÃæ×ó²àµÄÎÄ¼þ¼ÐÍ¼Æ¬
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-É¾³ý¡°´ËµçÄÔ¡±½çÃæ×ó²àµÄÎÄ¼þ¼Ð3D¶ÔÏó
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-¹Ø±Õ»ò¼õÉÙ¶¯»­
reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t reg_dword /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundLockTimeout /t reg_dword /d 0 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-´ò¿ªÎÄ¼þ×ÊÔ´¹ÜÀíÆ÷Ê±´ò¿ª´ËµçÄÔ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /d 1 /t reg_dword /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-É¾³ý×ÊÔ´¹ÜÀíÆ÷ÒôÀÖÎÄ¼þ¼Ð
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-É¾³ý×ÊÔ´¹ÜÀíÆ÷ÊÓÆµÎÄ¼þ¼Ð
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-½ûÓÃÔÚWindows×ÊÔ´¹ÜÀíÆ÷ÖÐÏÔÊ¾³£ÓÃÏîÄ¿
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t reg_dword /d 0 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-½ûÓÃÔÚWindows×ÊÔ´¹ÜÀíÆ÷ÖÐÏÔÊ¾×î½üÊ¹ÓÃµÄÏîÄ¿
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t reg_dword /d 0 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-ÍøÂçÎ»ÖÃÊÇ·ñÔÚ"¿ìËÙ·ÃÎÊ"ÖÐÏÔÊ¾
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoSimpleNetIDList /t REG_DWORD /d 1 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-ÊÕÆð×ÊÔ´¹ÜÀíÆ÷¹¦ÄÜÇø
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon" /v "MinimizedStateTabletModeOff" /t reg_dword /d 1 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-¹Ø±ÕÏÔÊ¾ËùÓÐÎÄ¼þÀ©Õ¹Ãû
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t reg_dword /d 1 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-¹Ø±ÕÏÔÊ¾ËùÓÐÒþ²ØÎÄ¼þ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t reg_dword /d 2 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-¹Ø±ÕÔ¤ÀÀ´°¸ñ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t reg_dword /d 0 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-È¡ÏûÏÔÊ¾ËùÓÐÎÄ¼þ¼Ð
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneShowAllFolders" /t reg_dword /d 0 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-¹Ø±Õ×Ô¶¯Õ¹¿ªµ½µ±Ç°ÎÄ¼þ¼Ð£¬²»¸úËæÄ¿Â¼Ìø×ª
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "NavPaneExpandToCurrentFolder" /t REG_DWORD /d 0 /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-ÒÆ³ýÓÃ»§ÎÄ¼þ¼Ð£¨º¬±¾µØ¹Ì¶¨ÅÌ¡¢U ÅÌ¡¢ÒÆ¶¯Ó²ÅÌ£©
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-ÒÆ³ýÓÃ»§ÎÄ¼þ¼Ð64Î»£¨º¬±¾µØ¹Ì¶¨ÅÌ¡¢U ÅÌ¡¢ÒÆ¶¯Ó²ÅÌ£©
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}" /f
REM ½çÃæ-×ÊÔ´¹ÜÀíÆ÷-ÖØÐÂ¶ÁÈ¡ÓÃ»§ÉèÖÃ
rundll32.exe user32.dll,UpdatePerUserSystemParameters

REM ½çÃæ-Ó¦ÓÃ³ÌÐò-×Ô¶¯½áÊøÈÎÎñ
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f
REM ½çÃæ-Ó¦ÓÃ³ÌÐò-¼õÉÙµÈ´ýÓ¦ÓÃ³ÌÐòÎ´ÏìÓ¦µÄµÈ´ýÊ±¼äÎª2Ãë
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t reg_sz /d 2000 /f
REM ½çÃæ-Ó¦ÓÃ³ÌÐò-¼õÉÙÓ¦ÓÃ³ÌÐò¹Ø±ÕµÄµÈ´ýÊ±¼äÎª3Ãë
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t reg_sz /d "3000" /f
REM ½çÃæ-Ó¦ÓÃ³ÌÐò-¼õÉÙ·þÎñ¹Ø±ÕÊ±µÄµÈ´ýÊ±¼äÎª3Ãë
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /t reg_dword /d 3000 /f
REM ½çÃæ-Ó¦ÓÃ³ÌÐò-ÓÅ»¯´¦ÀíµÍ¼¶±ð¹³×ÓÊ±µÄ³¬Ê±Ê±¼ä£¬¸ü¿ìµÄÏàÓ¦ÎÞÏàÓ¦µÄ³ÌÐò
reg add "HKCU\Control Panel\Desktop" /v "LowLevelHooksTimeout" /t reg_dword /d 400 /f

REM ½çÃæ-×ÀÃæ-ÏÔÊ¾"ÎÒµÄµçÄÔ"Í¼±ê
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t reg_dword /d 0 /f
REM ½çÃæ-×ÀÃæ-ÏÔÊ¾"ÎÒµÄÎÄµµ"Í¼±ê
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t reg_dword /d 0 /f
REM ½çÃæ-×ÀÃæ-ÏÔÊ¾"ÍøÂçÁÚ¾Ó"Í¼±ê
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t reg_dword /d 0 /f
REM ½çÃæ-×ÀÃæ-ÏÔÊ¾"»ØÊÕÕ¾"Í¼±ê
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t reg_dword /d 0 /f
REM ½çÃæ-×ÀÃæ-ÏÔÊ¾"¿ØÖÆÃæ°å"Í¼±ê
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t reg_dword /d 0 /f
REM ½çÃæ-×ÀÃæ-¹Ø±ÕÔÚ×ÀÃæÏÔÊ¾¿â
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /t reg_dword /d 1 /f
REM ½çÃæ-×ÀÃæ-É¾³ý×ÀÃæ¿âÎÄ¼þ¼Ð
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5} /f
REM ½çÃæ-×ÀÃæ-¼Ó´ó×ÀÃæÍ¼±ê»º´æ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t REG_SZ /d 2000 /f
REM ½çÃæ-×ÀÃæ-¿ì½Ý·½Ê½²»Ìí¼Ó¿ì½Ý·½Ê½µÄÎÄ×Ö
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /t reg_binary /d 00000000 /f
REM ½çÃæ-×ÀÃæ-×ÀÃæ±ÚÖ½ÖÊÁ¿µ÷ÕûÎª,atlasÊÇ100£¬20260410
reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t reg_dword /d 256 /f
REM ½çÃæ-×ÀÃæ-½ûÓÃËùÓÐ´°¿Ú¶¯»­
reg add "HKCU\Control Panel\Desktop" /v "WindowAnimation" /t reg_dword /d 0 /f
REM ½çÃæ-×ÀÃæ-¼Ó´óÍ¼±ê»º´æ£¬Ä¬ÈÏÖµÎª 512
reg add "HKCU\Control Panel\Desktop" /v "IconCacheSize" /t REG_DWORD /d 8192 /f

REM ½çÃæ-ÓÒ¼ü²Ëµ¥-½«¡°ÓÒ¼ü²Ëµ¥¡±µ÷ÕûÎª Windows 7 Ä£Ê½
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\FlightedFeatures" /v "ImmersiveContextMenu" /t reg_dword /d 0 /f
REM ½çÃæ-ÓÒ¼ü²Ëµ¥-È¥³ýÓÒ¼üÊôÐÔ½â³ýËø¶¨
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSecurityTab" /t reg_dword /d 1 /f
REM ½çÃæ-ÓÒ¼ü²Ëµ¥-½ûÓÃÓÒ¼ü²Ëµ¥µÄ¶¯»­Ð§¹û
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /d 0 /t reg_dword /f
REM ½çÃæ-ÓÒ¼ü²Ëµ¥-½ûÓÃWin11¼ÓÈëµÄÐÂÓÒ¼ü²Ëµ¥£¬Ä¬ÈÏÏÔÊ¾¸ü¶àÑ¡Ïî
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /v "ThreadingModel" /t reg_sz /d "" /f
REM ½çÃæ-ÓÒ¼ü²Ëµ¥-ÔÚ¡°´ËµçÄÔ¡±ÉÏÓÒ¼üµã»÷Ìí¼Ó¡°Éè±¸¹ÜÀíÆ÷¡±Ñ¡Ïî
reg add "HKCU\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\DeviceManager" /ve /t REG_SZ /d "Éè±¸¹ÜÀíÆ÷" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\DeviceManager" /v "HasLUAShield" /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\DeviceManager\command" /ve /t REG_SZ /d "mmc devmgmt.msc" /f
REM ½çÃæ-ÓÒ¼ü²Ëµ¥-ÔÚ¡°´ËµçÄÔ¡±ÉÏÓÒ¼üµã»÷Ìí¼Ó¡°·þÎñ¡±Ñ¡Ïî
reg add "HKCU\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Services" /ve /t REG_SZ /d "·þÎñ" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Services" /v "HasLUAShield" /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Services\command" /ve /t REG_SZ /d "mmc services.msc" /f
REM ½çÃæ-ÓÒ¼ü²Ëµ¥-ÔÚ¡°´ËµçÄÔ¡±ÉÏÓÒ¼üµã»÷Ìí¼Ó¡°¹ÜÀí¡±Ñ¡Ïî
reg add "HKCU\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Manage" /v "HasLUAShield" /t REG_SZ /d "" /f
REM ½çÃæ-ÓÒ¼ü²Ëµ¥-ÔÚÎÄ¼þÉÏÓÒ¼üµã»÷Ìí¼Ó"¹ÜÀíÔ±È¡µÃËùÓÐÈ¨ÏÞ"Ñ¡Ïî
reg add "HKCU\SOFTWARE\Classes\*\shell\TakeOwnerShip" /ve /t REG_SZ /d "¹ÜÀíÔ±È¡µÃËùÓÐÈ¨ÏÞ" /f
reg add "HKCU\SOFTWARE\Classes\*\shell\TakeOwnerShip" /v "HasLUAShield" /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\*\shell\TakeOwnerShip" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\*\shell\TakeOwnerShip\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" /r /d y ^& icacls \"%%1\" /grant administrators:F /t" /f
REM ½çÃæ-ÓÒ¼ü²Ëµ¥-ÔÚÎÄ¼þ¼ÐÉÏÓÒ¼üµã»÷Ìí¼Ó"¹ÜÀíÔ±È¡µÃËùÓÐÈ¨ÏÞ"Ñ¡Ïî
reg add "HKCU\SOFTWARE\Classes\Directory\shell\TakeOwnerShip" /ve /t REG_SZ /d "¹ÜÀíÔ±È¡µÃËùÓÐÈ¨ÏÞ" /f
reg add "HKCU\SOFTWARE\Classes\Directory\shell\TakeOwnerShip" /v "HasLUAShield" /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\Directory\shell\TakeOwnerShip" /v "NoWorkingDirectory" /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\Directory\shell\TakeOwnerShip\command" /ve /t REG_SZ /d "cmd.exe /c takeown /f \"%%1\" /r /d y ^& icacls \"%%1\" /grant administrators:F /t" /f
goto :eof

:better_llq
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃEdgeºóÌ¨ÔËÐÐ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BackgroundModeEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AllowBackgroundAppsToRun" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÖ¹EdgeÊ×´ÎÔËÐÐÏòµ¼
reg add "HKCU\Software\Microsoft\Edge\FirstRun" /v "FirstRunExperience" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Edge\FirstRun" /v "LastFirstRunVersion" /t REG_DWORD /d 999999999 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃ»¶Ó­Ò³ÃæºÍµ¼ÀÀ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Edge" /v "HideFirstRunExperience" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-Ìø¹ýÄ¬ÈÏä¯ÀÀÆ÷ÌáÊ¾
reg add "HKCU\Software\Policies\Microsoft\Edge" /v "DefaultBrowserSettingEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Edge\FirstRun" /v "DefaultBrowserSettingShown" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÉèÖÃEdgeÊ×´ÎÔËÐÐ±êÖ¾
reg add "HKCU\Software\Microsoft\Edge\FirstRun" /v "Finished" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Edge" /v "HasShownFirstRun" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃEdge¸üÐÂ
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "UpdateDefault" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "AutoUpdateCheckPeriodMinutes" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃIE×Ô¶¯Ìø×ªµ½Edgeä¯ÀÀÆ÷
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "IE11DisableEdgeRedirect" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃInternet ExplorerµÄµÚÈý·½ä¯ÀÀÆ÷À©Õ¹
::reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "DisableThirdPartyExtensions" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃInternet ExplorerÔÚMicrosoft EdgeÖÐ´ò¿ªÍøÕ¾µÄÉèÖÃ
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "InternetExplorerIntegration" /t REG_SZ /d "0" /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÖ¹´ò¿ªIEµ¯³öEDGE
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Enable Browser Extensions" /t REG_SZ /d "no" /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÔÊÐíÔÚIEÄ£Ê½ÏÂÖØÐÂ¼ÓÔØÍøÕ¾
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "InternetExplorerIntegrationReloadInIEModeAllowed" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃ´ÓInternet ExplorerÌø×ªµ½Microsoft Edge
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "RedirectSitesFromInternetExplorerPreventBHO" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-×èÖ¹Microsoft EdgeÊ×´ÎÔËÐÐ»¶Ó­Ò³Ãæ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PreventFirstRunPage" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃEdgeä¯ÀÀÆ÷Ô¤Æô¶¯
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AllowPrelaunch" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÖ¹¸üÐÂµ½Chromium°æEdge
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃÆô¶¯¼ÓËÙ¹¦ÄÜ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "StartupBoostEnabled" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-¿ªÆôEdgeµÄ¿ªÊ¼°´Å¥
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ShowStartButton" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-¿ªÆôEdgeµÄÊ×Ò³°´Å¥
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ShowHomeButton" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÉèÖÃÊ¼ÖÕ×î´óÐÔÄÜÄ£Ê½
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceMode" /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceModePluggedIn" /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "PerformanceModeBattery" /t REG_DWORD /d 2 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-¹Ø±Õ¿ªÆôÓëÆäËûWindows¹¦ÄÜ¹²Ïíä¯ÀÀÊý¾Ý
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "WindowsFeaturesEnabled" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÆôÓÃÓ²¼þ¼ÓËÙ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HardwareAccelerationModeEnabled" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Edge" /v HardwareAccelerationModeEnabled /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÆôÓÃÆ½»¬¹ö¶¯
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SmoothScrollEnabled" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-Éè¶¨Ö÷Ò³¼°Æô¶¯Ò³
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "RestoreOnStartup" /t REG_DWORD /d 4 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÉèÖÃÏÂÔØÏÞÖÆ²ßÂÔ£¨0=ÔÊÐíËùÓÐÏÂÔØ£¬1=×èÖ¹ËùÓÐÏÂÔØ£©
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "DownloadRestrictions" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÖ¹×Ô¶¯´ò¿ªÏÂÔØµÄÎÄ¼þ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AlwaysOpenDownloaded" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃSmartScreen¹ýÂËÆ÷
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenEnabled" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃÇ±ÔÚ²»ÊÜ»¶Ó­³ÌÐò¼ì²â
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SmartScreenPuaEnabled" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃÍøÂçµöÓã¹ýÂËÆ÷
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\PhishingFilter" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\PhishingFilter" /v "SendSmartScreenFilter" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃWindows SmartScreen
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\SmartScreen" /v "Enabled" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃ°²È«ÔöÇ¿¹¦ÄÜ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SecurityLevel" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÔÊÐíµÚÈý·½Cookie
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "BlockThirdPartyCookies" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÔÊÐí¹ýÊ±µÄ²å¼þÔËÐÐ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AllowOutdatedPlugins" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÉèÖÃÄ¬ÈÏJavaScriptÈ¨ÏÞ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "DefaultJavaScriptSetting" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-¹Ø±Õ¿ÖÏÅÈí¼þ×èÖ¹³ÌÐò
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "IntensiveWakeUpThrottlingEnabled" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃCopilotºÍAI¹¦ÄÜ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AIFeaturesEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeDiscoverEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "CopilotEnabled" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃÖÇÄÜ¹¦ÄÜ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "SmartFeaturesEnabled" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÆôÓÃä¯ÀÀÆ÷À©Õ¹
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ExtensionsEnabled" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÔÊÐí°²×°Íâ²¿À©Õ¹
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "AllowExternalExtensions" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-×èÖ¹´ÓMicrosoft Edge¼ÓÔØÉÌµêÀ©Õ¹
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "ExtensionsBlocklist" /t REG_SZ /d "microsoft-edge-extension://*" /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃ¸öÐÔ»¯¹ã¸æ¡¢ËÑË÷¡¢ÐÂÎÅºÍÆäËü·þÎñ
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃÀ´×Ô±¾µØ¹©Ó¦ÉÌµÄ½¨Òé
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "LocalProvidersEnabled" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃÔöÇ¿µÄÆ´Ð´¼ì²é
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "MicrosoftEditorProofingEnabled" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-½ûÓÃ´ÓIEµ½EDGEµÄ×Ô¶¯ÖØ¶¨Ïò
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext\CLSID" /v "{1FD49718-1D00-4B19-AF5F-070AF6D5D54C}" /t REG_SZ /d "0" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects\{1FD49718-1D00-4B19-AF5F-070AF6D5D54C}" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\Browser Helper Objects\{1FD49718-1D00-4B19-AF5F-070AF6D5D54C}" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext\CLSID" /v "{1FD49718-1D00-4B19-AF5F-070AF6D5D54C}" /t REG_SZ /d "0" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies\Ext\CLSID" /v "{1FD49718-1D00-4B19-AF5F-070AF6D5D54C}" /t REG_SZ /d "0" /f

REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-ÏÂÔØÇ°Ñ¯ÎÊÃ¿¸öÎÄ¼þµÄ±£´æÎ»ÖÃ
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PromptForDownloadLocation" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-½ûÓÃ WebRTC£¨¼õÉÙÍøÂçÑÓ³Ù£©
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "WebRtcIpHandlingPolicy" /t reg_dword /d 2 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-ÔÊÐíÔËÐÐ¹ýÊ±µÄ²å¼þ
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AllowOutdatedPlugins" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "RunAllFlashInAllowMode" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-Ä¬ÈÏÍ¨ÖªÉèÖÃ
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultNotificationsSetting" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-Ä¬ÈÏµ¯³ö´°¿ÚÉèÖÃ_ÔÊÐí
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultPopupsSetting" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-½ûÖ¹¼ÓÈë¸ß¼¶±£»¤¼Æ»®µÄÓÃ»§½«ÏÂÔØÄÚÈÝ·¢ËÍ¸ø Google ½øÐÐÉî¶ÈÉ¨Ãè
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AdvancedProtectionDeepScanningEnabled" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-ÔÚGoogle Chrome¹Ø±Õºó¼ÌÐøÔËÐÐºóÌ¨Ó¦ÓÃ_¹Ø±Õ
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "BackgroundModeEnabled" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-ÔÚ¹¤¾ßÀ¸ÉÏÏÔÊ¾"Ö÷Ò³"°´Å¥
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ShowHomeButton" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-¿ªÆô½« Google Chrome ÉèÎªÄ¬ÈÏä¯ÀÀÆ÷
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultBrowserSettingEnabled" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-Ä¬ÈÏJavaScriptÉèÖÃ_ÔÊÐí
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultJavaScriptSetting" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-Ä¬ÈÏFlashÉèÖÃ_ÔÊÐí
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultPluginsSetting" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "HardwareAccelerationModeEnabled" /t reg_dword /d 1 /f
reg add "HKCU\Software\Google\Chrome" /v HardwareAccelerationModeEnabled /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-ÔÚÕâÐ©ÍøÕ¾ÉÏÔÊÐíµ¯³ö´°¿Ú
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PopupsAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PopupsAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-ÔÚÕâÐ©ÍøÕ¾ÉÏÔÊÐíFlash²å¼þ
reg add "HKCU\SOFTWARE\Policies\Google\Chrome\PluginsAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKCU\SOFTWARE\Policies\Google\Chrome\PluginsAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PluginsAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PluginsAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
reg add "HKCU\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "1" /d "[*.]com" /t reg_sz /f
reg add "HKCU\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "2" /d "[*.]net" /t reg_sz /f
reg add "HKCU\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "3" /d "[*.]org" /t reg_sz /f
reg add "HKCU\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "4" /d "[*.]cn" /t reg_sz /f
reg add "HKCU\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "5" /d "[*.]cc" /t reg_sz /f
reg add "HKLM\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "1" /d "[*.]com" /t reg_sz /f
reg add "HKLM\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "2" /d "[*.]net" /t reg_sz /f
reg add "HKLM\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "3" /d "[*.]org" /t reg_sz /f
reg add "HKLM\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "4" /d "[*.]cn" /t reg_sz /f
reg add "HKLM\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "5" /d "[*.]cc" /t reg_sz /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-ÔÊÐíÕâÐ©ÍøÕ¾ÉÏµÄ²»°²È«ÄÚÈÝ
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\InsecureContentAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\InsecureContentAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-ÔÚÕâÐ©ÍøÕ¾ÉÏÔÊÐíJavaScript
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\JavaScriptAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\JavaScriptAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-ÔÊÐíÔÚÕâÐ©Õ¾µãÉÏÉú³ÉÃÜÔ¿
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\KeygenAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\KeygenAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-ÔÚÕâÐ©Õ¾µãÉÏÔÊÐíWebUSB
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\WebUsbAskForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\WebUsbAskForUrls" /v "2" /t reg_sz /d "http://*" /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-½ûÖ¹Chrome´òÓ¡Ò³Ã¼ºÍÒ³½Å
reg add "HKLM\Software\Policies\Google\Chrome" /v "PrintHeaderFooter" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Chrome-¿ªÆôChromeÄ¬ÈÏ±³¾°Í¼Æ¬´òÓ¡Ä£Ê½
reg add "HKLM\Software\Policies\Google\Chrome" /v "PrintingBackgroundGraphicsDefault" /t reg_dword /d 1 /f
if "%IEIE%"=="NO" goto :eof

REM Èí¼þ-ä¯ÀÀÆ÷-IE-Çå³ý¿ÉÄÜµÄ¶ñÒâËø¶¨
reg delete "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v "HomePage" /f 2>nul
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Control Panel" /v "HomePage" /f 2>nul
REM Èí¼þ-ä¯ÀÀÆ÷-IE-ÔöÇ¿-É¾³ýÏÖÓÐIEä¯ÀÀÆ÷
REM reg delete "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /f
REM reg delete "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-ÔöÇ¿-Ìí¼ÓIEä¯ÀÀÆ÷
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /ve /d "Internet Explorer" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\DefaultIcon" /ve /d "%IE_Path32%,-32528" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\NoAddOns" /ve /d "ÔÚÃ»ÓÐ¼ÓÔØÏîµÄÇé¿öÏÂÆô¶¯(&N)" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\NoAddOns\Command" /ve /d "%IE_Path32% about:NoAdd-ons" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open" /ve /d "´ò¿ªÖ÷Ò³(&H)" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open\Command" /ve /d "%IE_Path32%" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open\Command" /ve /t reg_sz /d "%IE_Path32%" /f
if "%bit%"=="64" reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open64" /ve /t reg_sz /d "Æô¶¯64Î»IE(&E)" /f
if "%bit%"=="64" reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open64\Command" /ve /t reg_sz /d "%IE_Path64%" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Alank" /ve /t reg_sz /d "´ò¿ª¿Õ°×Ò³(&B)" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Alank\Command" /ve /t reg_sz /d "\"%IE_Path32%\" about:blank" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Set" /ve /d "ÊôÐÔ(&R)" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Set\Command" /ve /d "Rundll32.exe Shell32.dll,Control_RunDLL Inetcpl.cpl" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\ShellFolder" /v "Attributes" /t reg_dword /d 0x00000030 /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /ve /d "Internet Explorer" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\DefaultIcon" /ve /d "%IE_Path32%,-32528" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\NoAddOns" /ve /d "ÔÚÃ»ÓÐ¼ÓÔØÏîµÄÇé¿öÏÂÆô¶¯(&N)" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\NoAddOns\Command" /ve /d "%IE_Path32% about:NoAdd-ons" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open" /ve /d "´ò¿ªÖ÷Ò³(&H)" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open\Command" /ve /d "%IE_Path32%" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Set" /ve /d "ÊôÐÔ(&R)" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Set\Command" /ve /d "Rundll32.exe Shell32.dll,Control_RunDLL Inetcpl.cpl" /f
reg add "HKCU\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\ShellFolder" /v "Attributes" /t reg_dword /d 0x00000030 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-ÔöÇ¿-×¢²áÈí¼þÏî
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /ve /d "Internet Explorer" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-ÔöÇ¿-Ìí¼Ó×ÀÃæIEÏî
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /ve /d "Internet Explorer" /f
call :better_llq_kj
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¿Ø¼þ-ÔÚ IE ÖÐ´ò¿ª ActiveX ¿Ø¼þÈÕÖ¾¼ÇÂ¼
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v AuditModeEnabled /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¿Ø¼þ-É¾³ýIE ÖÐ¹ýÊ±µÄ ActiveX ¿Ø¼þµÄÕâ´ÎÔËÐÐ°´Å¥
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v RunThisTimeEnabled /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¿Ø¼þ-É¾³ýIE ÖÐ½ûÓÃµÄ ActiveX ¿Ø¼þ
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Ext\Settings" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Ext\Settings" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¿Ø¼þ-ÆôÓÃËùÓÐ±»×èÖ¹µÄ¹ýÊ± ActiveX ¿Ø¼þ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "VersionCheckEnabled" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¿Ø¼þ-ÆôÓÃËùÓÐ½ûÓÃµÄ ActiveX ¿Ø¼þ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "NoExtOff" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¿Ø¼þ-É¾³ýIEµÄ¹ýÆÚActiveX¿Ø¼þ×èÖ¹Í¨ÖªÖÐµÄ¡°¸üÐÂ¡±°´Å¥
reg add "HKCU\Software\Microsoft\Internet Explorer\VersionManager" /v UpdateEnabled /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¿Ø¼þ-×Ô¶¯¼¤»îIEÐÂ°²×°µÄ¼ÓÔØÏî
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "IgnoreFrameApprovalCheck" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "IgnoreFrameApprovalCheck" /t reg_dword /d 1 /f

REM Èí¼þ-ä¯ÀÀÆ÷-IE-½çÃæ-ÏÔÊ¾²Ëµ¥À¸
reg add "HKCU\Software\Microsoft\Internet Explorer\Toolbar" /v ITBarLayout /t reg_sz /d "1" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-½çÃæ-ÏÔÊ¾ÊÕ²Ø¼ÐÀ¸
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v Show_Favoritesbar /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-½çÃæ-ÏÔÊ¾×´Ì¬À¸
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v StatusBarWeb /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-½çÃæ-µ¥¶ÀÒ»ÐÐÏÔÊ¾±êÇ©
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v TabProcGrowth /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-½çÃæ-È¥³ýIEÓÒ±ßµÄÐ¦Á³
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /v "NoHelpItemSendFeedback" /t reg_dword /d "1" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-½çÃæ-È¥³ýIE±êÌâÀ¸ÉÏµÄ¶îÍâÎÄ×Ö
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Window Title" /t reg_sz /d "" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-½çÃæ-ÏÔÊ¾Í¼Æ¬
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Display Inline Images" /t reg_sz /d "yes" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-½çÃæ-¿ªÆôÔÚ¶ÀÒ»ÐÐÏÔÊ¾±êÇ©Ò³
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v TabProcGrowth /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-½çÃæ-Óöµ½µ¯³ö´°¿ÚÊ±Ê¼ÖÕÔÚÐÂÑ¡Ïî¿¨ÖÐ´ò¿ªµ¯³ö´°¿Ú
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "PopupsUseNewWindow" /t reg_dword /d 2 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-½çÃæ-Ëø¶¨Internet Explorer¹¤¾ßÀ¸
reg add "HKCU\Software\Microsoft\Internet Explorer\Toolbar" /v "Locked" /t reg_dword /d 1 /f

REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ºöÂÔÄãµÄ°²È«ÉèÖÃ¼¶±ðµ¼ÖÂ¼ÆËã»ú´æÔÚ°²È«·çÏÕ¡£
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "IgnoreServerCertErrors" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v WarnOnZoneCrossing /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃIEÔÚÓÃ»§ÊäÈëÊ±×Ô¶¯ÍÆ¼ö»òÍê³ÉÍøÖ·ºÍ±íµ¥ÐÅÏ¢
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\AutoComplete" /v "Append Completion" /t "reg_sz" /d "no" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃIEµÄÄÚ²¿ÍøÕ¾¼æÈÝÄ£Ê½£¬È·±£ÔÚ·ÃÎÊÄÚ²¿ÍøÕ¾Ê±²»»á×Ô¶¯ÇÐ»»µ½¼æÈÝÄ£Ê½¡£
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\BrowserEmulation" /v "IntranetCompatibilityMode" /t "reg_dword" /d "0" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÔÚ¼æÈÝÐÔÊÓÍ¼ÖÐÏÔÊ¾ËùÓÐÍøÕ¾
reg add "HKCU\Software\Microsoft\Internet Explorer\BrowserEmulation" /v "AllSitesCompatibilityMode" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÆôÓÃIEÏÂÔØÍê³ÉÍ¨Öª£¬µ¯³öÍ¨Öª´°¿ÚÌáÊ¾ÏÂÔØÍê³É¡£
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "NotifyDownloadComplete" /t reg_sz /d "yes" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÉèÖÃIEÄ¬ÈÏÏÂÔØÄ¿Â¼ÎªÓÃ»§×ÀÃæ
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Default Download Directory" /t "Reg_Expand_SZ" /d "%USERPROFILE%\Desktop" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-¹Ø±ÕIE°²È«¾¯±¨
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnOnHTTPSToHTTPRedirect" /d 0 /t reg_dword /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-È¡Ïû¹Ø±Õä¯ÀÀÆ÷×Ô¶¯ÇåÀí¼ÇÂ¼
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Privacy" /v "ClearBrowsingHistoryOnExit" /d "0" /t reg_dword /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-²»ÌáÊ¾ÎÒ±£´æÃÜÂë
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "FormSuggest PW Ask" /t reg_sz /d "no" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-²»ÌáÊ¾ÃÜÂë
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "FormSuggest Passwords" /t reg_sz /d "no" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-²»Ê¹ÓÃ×Ô¶¯Íê³É¹¦ÄÜ
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "Use FormSuggest" /t reg_sz /d "no" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÉèÖÃÔÚ Internet Explorer ÖÐ´ò¿ªÁ´½ÓµÄ·½Ê½
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v AssociationActivationMode /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½âËø²¢¹Ø±ÕIE×Ô¶¯±ÀÀ£»Ö¸´
reg delete "HKLM\Software\Policies\Microsoft\Internet Explorer\Recovery" /v "AutoRecover" /f
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Recovery" /v AutoRecover /t reg_dword /d 2 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃIE½ÓÊÕ²»Á¼Ö¤ÊéÊ±µÄ¾¯¸æ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnonBadCertRecving" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-È¡Ïû-¼ì²é·¢ÐÐÉÌµÄÖ¤ÊéÊÇ·ñÒÑµõÏú
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing" /v "State" /t reg_dword /d 146944 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃÖ¤ÊéµõÏú¼ì²é
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CertificateRevocation" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃÔöÇ¿±£»¤Ä£Ê½
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Isolation" /t reg_sz /d "PMIL" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Isolation64Bit" /t reg_sz /d "PMIL" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-¿ØÖÆ±êÇ©Ò³×÷Îª¶ÀÁ¢½ø³ÌµÄÐÐÎª¡£
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "TabProcGrowth" /t reg_dword /d "1" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÔÊÐíInternet ExplorerÔÚ±¾µØ»úÆ÷£¨ÎÒµÄµçÄÔ£©ÉÏÔËÐÐ»î¶¯ÄÚÈÝ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN" /v "iexplore.exe" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-Ñ¡Ôñ-ÔÊÐíÀ´×ÔCDµÄ»î¶¯ÄÚÈÝÔÚÎÒµÄµçÄÔÖÐÔËÐÐ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN\Settings" /v "LOCALMACHINE_CD_UNLOCK" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÖ¹¼ì²é¿ÉÖ´ÐÐÎÄ¼þµÄÇ©Ãû
reg add "HKCU\Software\Microsoft\Internet Explorer\Download" /v "CheckExeSignatures" /t reg_sz /d "no" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÔÊÐíÔËÐÐÇ©ÃûÎÞÐ§µÄ³ÌÐò
reg add "HKCU\Software\Microsoft\Internet Explorer\Download" /v "RunInvalidSignatures" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÔÊÐíÏÂÔØÍê³É×Ô¶¯À­Æð³ÌÐò
reg add "HKCU\Software\Microsoft\Internet Explorer\Download" /v "RunButtonCheckForExecutables" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃ¶àÓàÖØÆôµ¯´°ÌáÊ¾
reg add "HKCU\Software\Microsoft\Internet Explorer\Download" /v "DisableRebootWarning" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÔÊÐíµÍÍêÕûÐÔÄ¿Â¼µÄEXE×Ô¶¯Ö´ÐÐ
reg add "HKCU\Software\Microsoft\Internet Explorer\Download" /v "DisableLowILForExecutables" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃIEµÄµ¯³ö´°¿Ú¹ÜÀíÆ÷
reg add "HKCU\Software\Microsoft\Internet Explorer\New Windows" /v "PopupMgr" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÆôÓÃIEµÄTLS 1.2ºÍTLS 1.0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "SecureProtocols" /t reg_dword /d 0x880 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-È¥µôIE°²È«ÉèÖÃ·çÏÕÌáÊ¾
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "NoProtectedModeBanner" /d 1 /t reg_dword /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-¹Ø±ÕIE¹ÜÀíSmartScreenÉ¸Ñ¡Æ÷V8
reg add "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v "EnabledV8" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-¹Ø±ÕIE¹ÜÀíSmartScreenÉ¸Ñ¡Æ÷V9
reg add "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v "EnabledV9" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÔÊÐíIEÍ¬Ê±ÏÂÔØ¶à¸öÎÄ¼þ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPer1_0Server /t reg_dword /d 10 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v MaxConnectionsPerServer /t reg_dword /d 10 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-¿ØÖÆ IEä¯ÀÀÆ÷½ø³Ì×ÔÉíµÄÁ¬½ÓÊýÏÞÖÆ
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v iexplore.exe /t REG_DWORD /d 10 /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v iexplore.exe /t REG_DWORD /d 10 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-¿ªÆôIEÆôÓÃÈí¼þäÖÈ¾
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "UseSWRender" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃIEµÄÔ¤È¡ºÍÔ¤äÖÈ¾¹¦ÄÜ
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\PrefetchPrerender" /v "Enabled" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-¹Ø±Õ×Ô¶¯¸üÐÂ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "NoUpdateCheck" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÖ¹IEä¯ÀÀÆ÷×Ô¶¯¸üÐÂ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v NoUpdateCheck /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃ±¾µØ¼ÆËã»úµÄIE°²È«ÉèÖÃ¼ì²é
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÔÚ±¾µØ¼ÆËã»úÉÏ½ûÓÃIEµÄÊ×´ÎÌáÊ¾
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Security" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃÖ¸¶¨×é²ßÂÔ¶ÔÏóµÄIE°²È«ÉèÖÃ¼ì²é
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Group Policy Objects\{C2D0B7D4-7CC5-40A6-AC4C-A25BA2637B18}Machine\Software\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃµ±Ç°ÓÃ»§µÄIEÀ©Õ¹°²È«ÉèÖÃ¼ì²é
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-½ûÓÃ±¾µØ¼ÆËã»úµÄIEÀ©Õ¹°²È«ÉèÖÃ¼ì²é
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÔÚ±¾µØ¼ÆËã»úÉÏ½ûÓÃIEÀ©Õ¹µÄÊ×´ÎÌáÊ¾
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÔÚÖ¸¶¨×é²ßÂÔ¶ÔÏóÏÂ½ûÓÃIEÀ©Õ¹µÄÊ×´ÎÌáÊ¾
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Group Policy Objects\{C2D0B7D4-7CC5-40A6-AC4C-A25BA2637B18}Machine\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-¹Ø±ÕÐÅÈÎÕ¾µãÒªÇó·þÎñÆ÷ÑéÖ¤(https:)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "Flags" /t reg_dword /d "67" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-IE½ûÖ¹¼ÓÔØÏîÐÔÄÜÍ¨Öª
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableAddonLoadTimePerformanceNotifications" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableAddonLoadTimePerformanceNotifications" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-Ìø¹ýIEÊ×´ÎÔËÐÐ×Ô¶¨ÒåÉèÖÃ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceHasShown" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceComplete" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-¹Ø±Õ½¨ÒéµÄÍøÕ¾
reg add "HKCU\Software\Microsoft\Internet Explorer\Suggested Sites" /v "Enabled" /t reg_dword /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-Ìø¹ýÊ×´ÎÏòµ¼
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÉèÖÃIE¼ì²éÎÄ¼þ¹ØÁª
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Check_Associations" /t reg_sz /d "yes" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÉèÖÃÔÚÐÂ´°¿Ú»ò±êÇ©Ò³ÖÐÊ¼ÖÕÔÚInternet ExplorerÖÐ´ò¿ªÁ´½Ó
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v AlwaysOpenIEInNewWindow /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-µ±´´½¨ÐÂÑ¡Ïî¿¨Ê±£¬Ê¼ÖÕÇÐ»»µ½ÐÂÑ¡Ïî¿¨
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "OpenInForeground" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-ÉèÖÃIEä¯ÀÀÆ÷µ±ÆäËû³ÌÐò´Óµ±Ç°´°¿ÚµÄÐÂÑ¡Ïî¿¨´ò¿ªÁ¬½Ó
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "ShortcutBehavior" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-¹Ø±Õ×Ô¶¯¸üÐÂ
reg add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" /v "DisableAutoUpdate" /t reg_dword /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹¦ÄÜ-Òþ²ØÓÒÉÏ½ÇµÄÐ¦Á³·´À¡°´Å¥
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "EnableBrowserExtensions" /t reg_dword /d 0 /f

REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹ØÁª-¶¨Òå±äÁ¿
set "IE_Path32=%ProgramFiles(x86)%\Internet Explorer\iexplore.exe"
set "IE_Path64=%ProgramFiles%\Internet Explorer\iexplore.exe"
set "IE_type=\"%IE_Path32%\" \"%%1\""
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹ØÁª-½â³ýIEÖØ¶¨Ïò¼ÏËø
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\IEXPLORE.EXE" /v "UseIEXPLORE" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\IEXPLORE.EXE" /v "NoOpenWith" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\IEXPLORE.EXE" /v "UseEdge" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\App Paths\IEXPLORE.EXE" /v "UseIEXPLORE" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\App Paths\IEXPLORE.EXE" /v "NoOpenWith" /f
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\App Paths\IEXPLORE.EXE" /v "UseEdge" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹ØÁª-ÎÄ¼þÀàÐÍ¹ØÁª
reg add "HKCR\.htm" /ve /d "htmlfile" /f
reg add "HKCR\.html" /ve /d "htmlfile" /f
reg add "HKCR\.mht" /ve /d "mhtmlfile" /f
reg add "HKCR\.mhtml" /ve /d "mhtmlfile" /f
reg add "HKCR\.url" /ve /d "InternetShortcut" /f
reg add "HKCR\.website" /ve /d "InternetShortcut" /f
reg add "HKCR\htmlfile\shell\open\command" /ve /d "%IE_type%" /f
reg add "HKCR\mhtmlfile\shell\open\command" /ve /d "%IE_type%" /f
reg add "HKCR\InternetShortcut\shell\open\command" /ve /d "%IE_type%" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹ØÁª-Ð­Òé¹ØÁª
reg add "HKCR\http\shell" /ve /d "open" /f
reg add "HKCR\http\shell\open\command" /ve /d "%IE_type%" /f
reg add "HKCR\https\shell" /ve /d "open" /f
reg add "HKCR\https\shell\open\command" /ve /d "%IE_type%" /f
reg add "HKCR\ftp\shell" /ve /d "open" /f
reg add "HKCR\ftp\shell\open\command" /ve /d "%IE_type%" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹ØÁª-ÖØÖÃÓÃ»§Ñ¡Ôñ
reg delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\UserChoice" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" /v ProgId /d "IE.HTTP" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" /v ProgId /d "IE.HTTPS" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹ØÁª-ÏµÍ³¼¶Ä¬ÈÏÉèÖÃ
start /B "" "%ProgramFiles(x86)%\Internet Explorer\ieinstal.exe" /setdefault
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\iexplore.exe" /ve /t reg_sz /d "%IE_Path32%" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\App Paths\iexplore.exe" /ve /t reg_sz /d "%IE_Path32%" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹ØÁª-ÆôÓÃIE¹¦ÄÜ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v EnableIEActivities /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\DefaultIcon" /ve /d "%IE_Path32%,1" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\DefaultIcon" /ve /d "%IE_Path32%,1" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\DefaultIcon" /ve /d "%IE_Path32%,1" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹ØÁª-½ûÓÃEdge¸ÉÈÅ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-¹ØÁª-ÐÞ¸´¿ªÊ¼²Ëµ¥¿ì½Ý·½Ê½
set "LinkPath=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Internet Explorer.lnk"
if not exist "%LinkPath%" (
    powershell -command "$s = (New-Object -ComObject WScript.Shell).CreateShortcut('%LinkPath%'); $s.TargetPath = '%IE_Path32%'; $s.WorkingDirectory = '%ProgramFiles(x86)%\Internet Explorer'; $s.Save()"
)
REM Èí¼þ-ä¯ÀÀÆ÷-IE-Ìí¼ÓÍøÖ·ÖÁÐÅÈÎÕ¾µã
reg add "%IE_Domains%\*" /v "http" /t reg_dword /d "2" /f
reg add "%IE_Domains%\*" /v "https" /t reg_dword /d "2" /f
goto :eof

:better_llq_kj
set "IE_BASE=HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones"
set "COMMON=CurrentLevel:0 1001:0 1004:0 1200:0 1201:0 1206:0 1207:0 1208:0 1209:0 120A:0 120B:3 120C:0"
set "COMMON=!COMMON! 1400:0 1402:0 1405:0 1406:0 1407:0 1408:0 1409:3 1601:0 1604:0 1605:0"
set "COMMON=!COMMON! 1606:0 1607:0 1608:0 1609:0 160A:0 1800:0 1802:0 1803:0 1804:0"
set "COMMON=!COMMON! 1805:0 1806:0 1807:0 1808:0 1809:3 1812:0 180A:0 180B:0"
set "COMMON=!COMMON! 180C:0 180D:0 1A00:65536 1A02:0 1A03:0 1A04:0 1A05:0"
set "COMMON=!COMMON! 1A06:0 1A10:0 1C00:196608 1E05:30000 2000:0 2001:0"
set "COMMON=!COMMON! 2004:0 2005:0 2007:65536 2100:0 2101:0 2102:0"
set "COMMON=!COMMON! 2103:0 2104:0 2105:0 2106:0 2107:0 2200:0"
set "COMMON=!COMMON! 2201:0 2300:0 2301:3 2400:0 2401:0 2402:0"
set "COMMON=!COMMON! 2500:3 2600:0 2700:3 2702:0 2707:0 2708:0"
set "COMMON=!COMMON! 2709:0 270B:0 270C:3 MinLevel:10000 RecommendedLevel:10000"
for /L %%z in (0,1,4) do (
    echo ÕýÔÚÅäÖÃ ZONE%%z ...
    set "FULL_KEY=!IE_BASE!\%%z"
    for %%P in (!COMMON!) do (
        for /f "tokens=1,2 delims=:" %%A in ("%%P") do (
            reg add "!FULL_KEY!" /v "%%A" /d "%%B" /t reg_dword /f
        )
    )
)
goto :eof

:soft_setup
if "%hs%"=="_hsf" goto :eof
REM Ê×Ò³
::INETCPL.CPL
REM ´òÓ¡»ú
rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL PrintersFolder
REM Èí¼þ°²×°Æ÷
for /F "tokens=1" %%a in ('wmic os get localdatetime ^| find "."') do (set date=%%a & set day=!date:~0,8!) && for /F "tokens=3" %%b in ('reg query "HKCR\.ShaoHua" /v "InitialSetup" ^| find "InitialSetup"') do (set sys=%%b) && if "!day!" EQU "!sys!" (if exist "C:\ShaoHua\Softprep.exe" (start "" /wait "C:\ShaoHua\Softprep.exe"))
goto :eof

:better_rj
REM Èí¼þ-½ûÓÃÔÚÎ´·ÖÅäµÄÎÄ¼þÀ©Õ¹ÃûÉÏÆôÓÃÎÄ¼þ¹ØÁªWEB·þÎñ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t reg_dword /d 1 /f

REM Èí¼þ-ÊäÈë·¨-Ç¿ÖÆÆôÓÃ¾É°æWin32Î¢ÈíÆ´Òô
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableLegacyIME" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v UseLegacyIME /t REG_DWORD /d 1 /f
REM Èí¼þ-ÊäÈë·¨-ÇÐ»»¾É°æÊäÈë·¨
reg add "HKCU\SOFTWARE\Microsoft\Input\TSF\Tsf3Override\{81d4e9c9-1d3b-41bc-9e6c-4b40bf79e35e}" /v "NoTsf3Override2" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\CTF\TIP\{81D4E9C9-1D3B-41BC-9E6C-4B40BF79E35E}" /v "DummyValue" /t REG_DWORD /d 1 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±ÕÎ¢ÈíÆ´ÒôºòÑ¡À¸µÄ¡¾·ûºÅÊÓÍ¼°´Å¥¡¿
reg add "HKCU\SOFTWARE\Microsoft\InputMethod\CandidateWindow\CHS\1" /v "ShowSymbolViewActionButton" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±ÕÎ¢ÈíÆ´Òô¡¾¼ò·±Êä³öÇÐ»»¡¿¹¦ÄÜ
reg add "HKCU\SOFTWARE\Microsoft\InputMethod\Settings\CHS" /v "EnableSimplifiedTraditionalOutputSwitch" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±ÕÎ¢ÈíÆ´Òô¡¾´ò¿ª±íÇé·ûºÅÊÓÍ¼¡¿¹¦ÄÜ
reg add "HKCU\SOFTWARE\Microsoft\InputMethod\Settings\CHS" /v "EnableOpenEmoticonSymbolView" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±ÕÎ¢ÈíÆ´Òô¡¾¶¯Ì¬ÌùÖ½¡¿¹¦ÄÜ
reg add "HKCU\SOFTWARE\Microsoft\InputMethod\Settings\CHS" /v "EnableLiveSticker" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-Ä¬ÈÏÓïÑÔ 0 ÖÐÎÄ£¬1 Ó¢ÎÄ£¬¿Ï¶¨ÕýÈ·£¡
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\IME\15.0\IMETC" /v "DefaultInputMode" /t REG_DWORD /d 1 /f
REM Èí¼þ-ÊäÈë·¨-ÖÇÄÜÄ£ºýÆ´Òô 0 ½ûÓÃ£¬1 ÆôÓÃ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableSmartFuzzyPinyin" /t reg_dword /d 1 /f
REM Èí¼þ-ÊäÈë·¨-Ä£ºýÆ´Òô 0 ½ûÓÃ£¬1 ÆôÓÃ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Fuzzy Input" /t reg_dword /d 1 /f
REM Èí¼þ-ÊäÈë·¨-ÖÇÄÜ×ÔÑ§Ï° 0 Îª½ûÓÃ£¬1 ÎªÆôÓÃ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableSmartSelfLearning" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-ÔÆ¼ÆËã 0 Îª½ûÓÃ£¬1 ÎªÆôÓÃ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Cloud Candidate" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-ÖÐÓ¢ÎÄÇÐ»»¿ì½Ý¼ü£¨Ä¬ÈÏ ctrl + ¿Õ¸ñ£¬»¹¿ÉÊ¹ÓÃ£©0 Ä¬ÈÏÎª shift£¬1 Îª ctrl£¬2 Îª ÎÞ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "English Switch Key" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-ÏÔÊ¾ÐÂ´ÊÈÈ´Ê 0 Îª½ûÓÃ£¬1 ÎªÆôÓÃ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableHap" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-ÏÔÊ¾ÐÂ´ÊÈÈ´ÊËÑË÷µÄÌáÊ¾ 0 Îª½ûÓÃ£¬1 ÎªÆôÓÃ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Hot And Popular Word Search" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-×ÔÑ§Ï° 0 Îª½ûÓÃ£¬1 ÎªÆôÓÃ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable self-learning" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-ÓÃ»§×Ô¶¨Òå¶ÌÓï 0 Îª½ûÓÃ£¬1 ÎªÆôÓÃ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable EUDP" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-ÉÏÏÂÎÄ²Ëµ¥ 0 Îª½ûÓÃ£¬1 ÎªÆôÓÃ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "ContextMenuFlags" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-UÄ£Ê½ÊäÈë 0 Îª½ûÓÃ£¬1 ÎªÆôÓÃ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableUMode" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-ÈËÃûÊäÈë 0 Îª½ûÓÃ£¬1 ÎªÆôÓÃ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnablePeopleName" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-Î¢ÈíÆ´ÒôºòÑ¡´ÊÉèÖÃÎª9¸ö
reg add "HKCU\Software\Microsoft\InputMethod\Settings" /v "CandidateCount" /t reg_dword /d 9 /f
REM Èí¼þ-ÊäÈë·¨-½ûÓÃÔÆºòÑ¡´Ê
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "EnableCloudCandidate" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-½ûÓÃÊäÈë·¨ÇÐ»»ÌáÊ¾
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "EnableSwitchInputMethodHint" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-Ñ¡Ïî×ÖÌå´óÐ¡Îª¡°Ð¡¡±
reg add "HKCU\Software\Microsoft\InputMethod\Settings" /v "CandidateFontSize" /t reg_dword /d 0 /f
REM Èí¼þ-ÊäÈë·¨-ËÑ¹·ÊäÈë·¨·þÎñ½ûÓÃ
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SogouSvc" /v "Start" /t reg_dword /d 3 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\SogouSvc" /v "Start" /t reg_dword /d 3 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±Õ ×Ô¶¯Æ´Òô¾À´í
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnablePinyinCorrection" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±Õ ³¬¼¶¼òÆ´
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableSuperShortPinyin" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±Õ ÖÇÄÜÄ£ºýÆ´Òô
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableFuzzyPinyin" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±Õ ¼òÌå/·±ÌåÇÐ»»¹¦ÄÜ
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableSimplifiedTraditionalSwitch" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±Õ ×ÔÑ§Ï°£¨ÓÃ»§´Êµä¡¢ÊäÈëÏ°¹ßÑ§Ï°£©
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableUserLearning" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableCloudPrediction" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±Õ ÈËÃûÊäÈëÄ£Ê½
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableNameMode" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±Õ VÄ£Ê½ÊäÈë£¨v+ÃüÁî/·ûºÅ£©
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableVMode" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-¹Ø±Õ ºòÑ¡¿òºóÃæµÄ Emoji ±íÇéÃæ°å
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableEmojiSuggestion" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "ShowEmojiButton" /t REG_DWORD /d 0 /f
REM Èí¼þ-ÊäÈë·¨-³¹µ×¹Ø±ÕÊäÈë·¨±íÇé¡¢GIF¡¢·ûºÅÃæ°å
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableEmojiPanel" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableEmojiPanel" /t REG_DWORD /d 1 /f


REM Èí¼þ-¼ÇÊÂ±¾-×Ô¶¯»»ÐÐ
reg add "HKCU\Software\Microsoft\Notepad" /v "fWrap" /t reg_dword /d 1 /f
REM Èí¼þ-¼ÇÊÂ±¾-Ê¼ÖÕÏÔÊ¾×´Ì¬À¸
reg add "HKCU\Software\Microsoft\Notepad" /v "StatusBar" /t reg_dword /d 1 /f

REM Èí¼þ-Windows ÕÕÆ¬²é¿´Æ÷-ÉèÖÃ Ä¬ÈÏ´ò¿ª·½Ê½
if exist "C:\Program Files\JPEGView\JPEGView.exe" (
    echo. [INFO] ¼ì²âµ½ JPEGView£¬ÉèÖÃÎªÄ¬ÈÏÍ¼Æ¬²é¿´Æ÷¡­
    set "ViewerPath=C:\Program Files\JPEGView\JPEGView.exe"
    set "ProgID=JPEGView.Document"
    set "AppName=JPEGView"
    set "Desc=¿ìËÙ¡¢Ð¡ÇÉµÄÍ¼Æ¬²é¿´Æ÷"
) else (
    echo. [INFO] Î´¼ì²âµ½ JPEGView£¬Ê¹ÓÃ Windows Í¼Æ¬²é¿´Æ÷¡­
    set "ViewerPath=C:\Program Files\Windows Photo Viewer\PhotoViewer.dll"
    set "ProgID=PhotoViewer.FileAssoc.Tiff"
    set "AppName=Windows Photo Viewer"
    set "Desc=Windows Í¼Æ¬²é¿´Æ÷"
)
REM Èí¼þ-Windows ÕÕÆ¬²é¿´Æ÷-JPEGViewÏµÍ³ÉèÖÃ×¢²á
if "%ProgID%"=="JPEGView.Document" (
    reg add "HKLM\SOFTWARE\%AppName%\Capabilities" /v "ApplicationDescription" /t REG_SZ /d "%Desc%" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\%AppName%\Capabilities\FileAssociations" /f >nul 2>&1
    for %%e in (jpg jpeg png bmp gif tif tiff ico webp) do (
        reg add "HKLM\SOFTWARE\%AppName%\Capabilities\FileAssociations" /v ".%%e" /t REG_SZ /d "%ProgID%" /f >nul 2>&1
    )
    reg add "HKLM\SOFTWARE\RegisteredApplications" /v "%AppName%" /t REG_SZ /d "SOFTWARE\%AppName%\Capabilities" /f >nul 2>&1
)
REM Èí¼þ-Windows ÕÕÆ¬²é¿´Æ÷-JPEGView×¢²áÓÒ¼ü´ò¿ª·½Ê½ 
if "%ProgID%"=="JPEGView.Document" (
    reg add "HKLM\SOFTWARE\Classes\Applications\JPEGView.exe" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Classes\Applications\JPEGView.exe\shell\open\command" /ve /t REG_SZ /d "\"%ViewerPath%\" \"%%1\"" /f >nul 2>&1
    reg add "HKLM\SOFTWARE\Classes\Applications\JPEGView.exe\SupportedTypes" /f >nul 2>&1
    for %%e in (jpg jpeg png bmp gif tif tiff ico webp) do (
        reg add "HKLM\SOFTWARE\Classes\Applications\JPEGView.exe\SupportedTypes" /v ".%%e" /t REG_SZ /d "" /f >nul 2>&1
    )
)
REM Èí¼þ-Windows ÕÕÆ¬²é¿´Æ÷-ÉèÖÃÎÄµµÀàÐÍ»ù´¡
if "%ProgID%"=="JPEGView.Document" (
    reg add "HKLM\SOFTWARE\Classes\%ProgID%\shell\open\command" /ve /t REG_SZ /d "\"%ViewerPath%\" \"%%1\"" /f >nul 2>&1
)
REM Èí¼þ-Windows ÕÕÆ¬²é¿´Æ÷-SetUserFTA¹ØÁª
set "SetUserFTA=C:\ShaoHua\Tools\SetUserFTA.exe"
if exist "%SetUserFTA%" (
    for %%e in (jpg jpeg png bmp gif tif tiff ico webp) do (
        reg add "HKCU\SOFTWARE\Kolbicz IT\SetUserFTA" /v "RunCount" /t reg_dword /d 1 /f >nul 2>&1
        "%SetUserFTA%" .%%e %ProgID% >nul 2>&1
    )
) else (
    echo. [WARNING] Î´ÕÒµ½ SetUserFTA.exe£¬Ê¹ÓÃ´«Í³·½·¨¡­
    for %%e in (jpg jpeg png bmp gif tif tiff) do (
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.%%e\UserChoice" /v "Progid" /t REG_SZ /d "%ProgID%" /f >nul 2>&1
    )
)

REM Èí¼þ-Windows Media Player-²»ÏÔÊ¾Ê×´ÎÊ¹ÓÃ¶Ô»°¿ò
reg add "HKCU\Software\Microsoft\MediaPlayer\Preferences" /v "AcceptedPrivacyStatement" /t REG_DWORD /d 1 /f
REM Èí¼þ-Windows Media Player-½ûÓÃ×Ô¶¯¸üÐÂ¹¦ÄÜ
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /v "DisableAutoUpdate" /t reg_dword /d 1 /f
REM Èí¼þ-Windows Media Player-ÍêÈ«½ûÓÃ
reg add "HKCU\SOFTWARE\Policies\Microsoft\WindowsMediaCenter" /v "MediaCenter" /t REG_DWORD /d 1 /f

REM Èí¼þ-Çý¶¯×Ü²Ã-É¾³ý°²×°ÐÅÏ¢
reg delete "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\DrvCeo2.0" /f
del /q /f "%ProgramData%\Microsoft\Windows\Start Menu\Çý¶¯ÏÂÔØ.lnk" 2>nul
del /q /f "%windir%\Help\dcold.exe" 2>nul

REM Èí¼þ-WPS-È¥³ýWPSÔÆÎÄµµ
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{D426C8B3-0B26-4F0D-BA74-2EE212EDAC6D}" /f
::É¾³ý WPSÍøÅÌ
reg delete "HKCR\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{7AE6DE87-C956-4B40-9C89-3D166C9841D3}" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{7AE6DE87-C956-4B40-9C89-3D166C9841D3}" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{7AE6DE87-C956-4B40-9C89-3D166C9841D3}" /f
::É¾³ý WPSÍøÅÌ
reg delete "HKCR\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{5FCD4425-CA3A-48F4-A57C-B8A75C32ACB1}" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{5FCD4425-CA3A-48F4-A57C-B8A75C32ACB1}" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{5FCD4425-CA3A-48F4-A57C-B8A75C32ACB1}" /f
::É¾³ý WPSÍøÅÌ
reg delete "HKCR\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{5FCD4425-CA3A-48F4-A57C-B8A75C32ACB1}" /f
reg delete "HKCU\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{5FCD4425-CA3A-48F4-A57C-B8A75C32ACB1}" /f
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{5FCD4425-CA3A-48F4-A57C-B8A75C32ACB1}" /f
REM Èí¼þ-WPS-½ûÓÃWPS OfficeµÄÆô¶¯»­Ãæ
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "Startup" /t reg_dword /d 0 /f
REM Èí¼þ-WPS-ÉèÖÃWPS OfficeµÄ½çÃæÓïÑÔÎª1033Ó¢ÎÄ£¬2052ÖÐÎÄ
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "Lang" /t reg_dword /d 2052 /f
REM Èí¼þ-WPS-ÉèÖÃWPS OfficeµÄÄ¬ÈÏ±£´æ¸ñÊ½Îªdocx
reg add "HKCU\Software\Kingsoft\WPS\kxe" /v "SaveType" /t reg_sz /d "docx" /f
REM Èí¼þ-WPS-½ûÓÃWPS OfficeµÄ¹ã¸æÍÆËÍ
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "AdPush" /t reg_dword /d 0 /f
REM Èí¼þ-WPS-ÉèÖÃWPS OfficeµÄÍ¼±ê´óÐ¡ÎªÖÐµÈ
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "IconSize" /t reg_dword /d 1 /f
REM Èí¼þ-WPS-½ûÓÃWPS OfficeµÄÊµÊ±Æ´Ð´¼ì²é
reg add "HKCU\Software\Kingsoft\WPS\kxe" /v "AutoCheck" /t reg_dword /d 0 /f
REM Èí¼þ-WPS-ÉèÖÃWPS OfficeµÄÄ¬ÈÏ×ÖÌåÎªArial
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "FontName" /t reg_sz /d "Arial" /f
REM Èí¼þ-WPS-ÉèÖÃWPS OfficeµÄÄ¬ÈÏ×ÖÌå´óÐ¡Îª12
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "FontSize" /t reg_dword /d 12 /f
REM Èí¼þ-WPS-¹Ø±Õ WPS ×Ô¶¯ÉÏ´«£¨uploadfile=false£©
reg add "HKCU\SOFTWARE\Kingsoft\WPSCloud" /v "uploadfile" /t REG_SZ /d "false" /f
reg add "HKCU\SOFTWARE\Kingsoft\WPSCloud" /v "fileTransfer" /t REG_SZ /d "false" /f
reg add "HKCU\SOFTWARE\Kingsoft\WPSCloud" /v "shareFile" /t REG_SZ /d "false" /f
reg add "HKCU\SOFTWARE\Kingsoft\WPSCloud" /v "DesktopSync" /t REG_SZ /d "false" /f
REM Èí¼þ-WPS-½ûÓÃ WPS ÔÆÍ¬²½
reg add "HKCU\Software\Kingsoft\Office\12.0\Cloud" /v DisableSync /t REG_DWORD /d 1 /f
REM Èí¼þ-WPS-½ûÓÃ WPS ÓÒ¼üÔÆ²Ëµ¥
reg add "HKCU\SOFTWARE\Classes\*\shellex\ContextMenuHandlers\WPSCloudMenu" /v LegacyDisable /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\Directory\ shellex\ContextMenuHandlers\WPSCloudMenu" /v LegacyDisable /t REG_SZ /d "" /f
REM Èí¼þ-WPS-¹Ø±Õ WPS ÔÆ·þÎñ×ÔÆô¶¯
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\WPS Cloud" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\WPS Cloud" /f
REM Èí¼þ-WPS-¹Ø±Õ WPS ×Ô¶¯Éý¼¶
reg add "HKCU\Software\Kingsoft\Office\AutoUpdate" /v EnableAutoUpdate /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\WPS\Office\6.0\Common\Update" /v AutoUpdate /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Kingsoft\Office\6.0\Common\updateinfo" /v "UpdateMode" /t REG_SZ /d "manual" /f
REM Èí¼þ-WPS-²»Ê¹ÓÃ´úÀí
reg add "HKCU\Software\Kingsoft\Office\Common\Network" /v ProxyEnable /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Kingsoft\Office\Common\Network" /v ProxyServer /t REG_SZ /d "" /f
reg add "HKCU\Software\Kingsoft\Office\Common\Network" /v ProxyOverride /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Kingsoft\Office\6.0\Common\proxyinfo" /v "proxytype" /t REG_DWORD /d 0 /f
REM Èí¼þ-WPS-ÉèÖÃTDR»Ö¸´¼ÆÊýÎª0£¨½ûÓÃ³¬Ê±¼ì²âºÍ»Ö¸´£©
reg add "HKCU\SOFTWARE\Kingsoft\Office\6.0\wpp\Application Settings" /v "TdrRecoveryCount" /t REG_DWORD /d 0 /f
REM Èí¼þ-WPS-ÉèÖÃ¼æÈÝÄ£Ê½ÀàÐÍÎª1£¨ÆôÓÃ¼æÈÝÄ£Ê½£©
reg add "HKCU\SOFTWARE\Kingsoft\Office\6.0\Common" /v "compatible_type" /t REG_DWORD /d 1 /f
REM Èí¼þ-WPS-WPS Ó²¼þÍ¼ÐÎ¼ÓËÙ£¨½â¾ö¿¨¶Ù£©
reg add "HKCU\Software\Kingsoft\Office\12.0\Common\Graphics" /v DisableHardwareAcceleration /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Kingsoft\Office\12.0\Common\Graphics" /v UseCPUEmulation /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Kingsoft\Office\6.0\Common\Graphics" /v DisableHardwareAcceleration /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Kingsoft\Office\6.0\Common\Graphics" /v UseCPUEmulation /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Kingsoft\Office\6.0\Common" /v DisableHWAcceleration /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Kingsoft\Office\6.0\wpp\Application Settings" /v "HardwareAccelerated" /t REG_SZ /d "AccelerationNone" /f
reg add "HKCU\SOFTWARE\Kingsoft\Office\6.0\wpp\Application Settings" /v "EnableUseHardWare" /t REG_DWORD /d 0 /f
REM Èí¼þ-WPS-½ûÓÃ ·¢ËÍµ½ ¡ú WPSÔÆÎÄµµ´«ÊäÖúÊÖ
del /f /q "%APPDATA%\Microsoft\Windows\SendTo\WPSÔÆÎÄµµ´«ÊäÖúÊÖ.lnk"
reg add "HKCU\SOFTWARE\Classes\*\shellex\ContextMenuHandlers\WpsSendToCloud" /v LegacyDisable /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\Directory\ shellex\ContextMenuHandlers\WpsSendToCloud" /v LegacyDisable /t REG_SZ /d "" /f
REM Èí¼þ-WPS-½ûÓÃ Í¨¹ýWPSÔÆÎÄµµ ·ÖÏí¡¢Ð­×÷¡¢ÉÏ´«
reg add "HKCU\SOFTWARE\Classes\*\shell\WpsCloudShare" /v LegacyDisable /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\Directory\ shell\WpsCloudShare" /v LegacyDisable /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\*\shellex\ContextMenuHandlers\WpsCloudShare" /v LegacyDisable /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\Directory\ shellex\ContextMenuHandlers\WpsCloudShare" /v LegacyDisable /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\*\shellex\ContextMenuHandlers\UploadToWpsCloud" /v LegacyDisable /t REG_SZ /d "" /f
reg add "HKCU\SOFTWARE\Classes\Directory\ shellex\ContextMenuHandlers\UploadToWpsCloud" /v LegacyDisable /t REG_SZ /d "" /f
REM Èí¼þ-WPS-¹Ø±Õ WPS Í¬²½×ÀÃæËùÓÐÎÄ¼þ£¨×ÀÃæÔÆÍ¬²½£©
reg add "HKCU\Software\Kingsoft\WPSCloud\DesktopSync" /v EnableDesktopSync /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Kingsoft\WPSCloud\DesktopSync" /v SyncDesktop /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Kingsoft\WPSCloud\DesktopSync" /v AutoSync /t REG_DWORD /d 0 /f
REM Èí¼þ-WPS-³¹µ×½ûÓÃ WPS ÔÆÅÌÍ¬²½·þÎñ£¨·ÀÖ¹ºóÌ¨¸´»î£©
reg add "HKCU\Software\Kingsoft\Office\12.0\Cloud" /v DisableCloudService /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Kingsoft\WPSCloud" /v DisableFileSync /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Kingsoft\WPSCloud" /v DisableDesktopSync /t REG_DWORD /d 1 /f
REM Èí¼þ-WPS-±í¸ñ£ºÓÒ¼üµã»÷Ê±²»ÏÔÊ¾ÃÔÄã¹¤¾ßÀ¸
reg add "HKCU\SOFTWARE\Kingsoft\Office\6.0\et\Application Settings" /v "ShowRightClickMiniToolBar" /t REG_SZ /d "0" /f
REM Èí¼þ-WPS-±í¸ñ£º½ûÓÃÆ½»¬¹ö¶¯
reg add "HKCU\SOFTWARE\Kingsoft\Office\6.0\et\Application Settings" /v "EnableSmoothScroll" /t REG_SZ /d "0" /f

REM Èí¼þ-Office-½ûÓÃOffice 16 ExcelµÄ¶¯»­
reg add "HKCU\Software\Microsoft\Office\16.0\Excel\options" /v "EnableAnimations" /t reg_dword /d 0 /f
REM Èí¼þ-Office-½ûÓÃOffice 13 ExcelµÄ¶¯»­
reg add "HKCU\Software\Microsoft\Office\15.0\Excel\options" /v "EnableAnimations" /t reg_dword /d 0 /f
REM Èí¼þ-Office-½ûÓÃOfficeÎÄ¼þÉÏ´«Í¨Öª
reg add "HKCU\Software\Microsoft\Office\16.0\Common\FileIO" /v "DisablePausedUploadNotification" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Common\FileIO" /v "DisableUploadFailureNotification" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Common\FileIO" /v "DisableNotificationIcon" /t reg_dword /d 1 /f
REM Èí¼þ-Office-ÉèÖÃOffice 16µÄÄ¬ÈÏ±£´æ¸ñÊ½Îª.docx
reg add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "DefaultFormat" /t reg_sz /d "docx" /f
REM Èí¼þ-Office-½ûÓÃOffice 16µÄ»¶Ó­ÆÁÄ»
reg add "HKCU\Software\Microsoft\Office\16.0\Common" /v "ShownFirstRunOptin" /t reg_dword /d 1 /f
REM Èí¼þ-Office-½ûÓÃOffice 16µÄ¶¯»­Ð§¹û
reg add "HKCU\Software\Microsoft\Office\16.0\Common\Graphics" /v "DisableAnimations" /t reg_dword /d 1 /f

REM Èí¼þ-¸£ê¿ÔÄ¶ÁÆ÷-É¾³ýÀ¬»ø¹ã¸æÈí¼þ
del "C:\ProgramData\CPPackages\*.EXE" /q /f 2>nul
REM Èí¼þ-¸£ê¿ÔÄ¶ÁÆ÷-¹Ø±Õ¸£ê¿ÔÄ¶ÁÆ÷µÄ×Ô¶¯¸üÐÂ·þÎñ
sc stop FoxitReaderUpdateService
sc config FoxitReaderUpdateService start= disabled
REM Èí¼þ-¸£ê¿ÔÄ¶ÁÆ÷-½ûÓÃ¸£ê¿ÔÄ¶ÁÆ÷µÄÆô¶¯»­Ãæ
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "ShowStartPage" /t reg_dword /d 0 /f
REM Èí¼þ-¸£ê¿ÔÄ¶ÁÆ÷-ÉèÖÃ¸£ê¿ÔÄ¶ÁÆ÷µÄ½çÃæÓïÑÔÎªÓ¢ÎÄ
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "Language" /t reg_dword /d 2052 /f
REM Èí¼þ-¸£ê¿ÔÄ¶ÁÆ÷-ÉèÖÃ¸£ê¿ÔÄ¶ÁÆ÷µÄÄ¬ÈÏ´ò¿ª·½Ê½Îªµ¥Ò³Á¬ÐøÄ£Ê½
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "PageDisplayMode" /t reg_dword /d 0 /f
REM Èí¼þ-¸£ê¿ÔÄ¶ÁÆ÷-½ûÓÃ¸£ê¿ÔÄ¶ÁÆ÷µÄ¹ã¸æÍÆËÍ
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "ShowAdvertisement" /t reg_dword /d 0 /f
REM Èí¼þ-¸£ê¿ÔÄ¶ÁÆ÷-ÉèÖÃ¸£ê¿ÔÄ¶ÁÆ÷µÄÄ¬ÈÏ×ÖÌåÎªArial
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "DefaultFontName" /t reg_sz /d "Arial" /f
REM Èí¼þ-¸£ê¿ÔÄ¶ÁÆ÷-ÉèÖÃ¸£ê¿ÔÄ¶ÁÆ÷µÄÄ¬ÈÏ×ÖÌå´óÐ¡Îª12
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "DefaultFontSize" /t reg_dword /d 12 /f
REM Èí¼þ-¸£ê¿ÔÄ¶ÁÆ÷-ÉèÖÃ¸£ê¿ÔÄ¶ÁÆ÷µÄÍ¼±ê´óÐ¡ÎªÖÐµÈ
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "ToolbarIconSize" /t reg_dword /d 1 /f

REM Èí¼þ-·þÎñ-Asus-¹Ø±ÕAsusµÄ×Ô¶¯¸üÐÂ·þÎñ
sc stop AsusUpdateCheck
sc config AsusUpdateCheck start=disabled
sc stop edgeupdatem
sc config edgeupdatem start=disabled
REM Èí¼þ-·þÎñ-¸£ê¿ÔÄ¶ÁÆ÷-¹Ø±Õ¸£ê¿ÔÄ¶ÁÆ÷µÄ×Ô¶¯¸üÐÂ·þÎñ
sc stop FoxitReaderUpdateService
sc config FoxitReaderUpdateService start=disabled
REM Èí¼þ-·þÎñ-WPS-¹Ø±ÕWPS OfficeµÄ×Ô¶¯¸üÐÂ·þÎñ
sc stop WPSUpdateService
sc config WPSUpdateService start= disabled
net stop wpscloudsvr
sc config wpscloudsvr start=disabled
REM Èí¼þ-·þÎñ-½ûÓÃ²¢Í£Ö¹PDF·þÎñ
net stop FoxitPhantomPDFUpdateService
sc config FoxitPhantomPDFUpdateService start=disabled
REM Èí¼þ-·þÎñ-Edge-¹Ø±ÕEdgeµÄ×Ô¶¯¸üÐÂ·þÎñ
net stop MicrosoftEdgeElevationService
sc config MicrosoftEdgeElevationService start=disabled
net stop edgeupdate
sc config edgeupdate start=disabled
sc delete edgeupdate
net stop edgeupdatem
sc config edgeupdatem start=disabled
net stop MicrosoftEdgeElevationService
sc config MicrosoftEdgeElevationService start=disabled
REM Èí¼þ-·þÎñ-Í£Ö¹²¢½ûÓÃ¾É°æGoogle¸üÐÂ·þÎñ£¨Chrome 78-122×óÓÒÊ¹ÓÃµÄ·þÎñÃû£©
sc stop gupdate
sc config gupdate start= disabled
sc stop gupdatem
sc config gupdatem start= disabled
REM 2. Í£Ö¹²¢½ûÓÃÐÂ°æGoogle¸üÐÂ·þÎñ£¨Chrome 123¼°ÒÔÉÏ°æ±¾ÒýÈëµÄÐÂ·þÎñÃû£©
sc stop GoogleUpdater InternalService
sc config "GoogleUpdater InternalService" start= disabled
sc stop "GoogleUpdater Service"
sc config "GoogleUpdater Service" start= disabled

REM Èí¼þ-Èí¼þÆô¶¯Ïî-½ûÓÃ OneDrive Í¬²½¿Í»§¶Ë
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t reg_dword /d 1 /f
REM Èí¼þ-Èí¼þÆô¶¯Ïî-É¾³ýOneDriveµÄÆô¶¯Ïî
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f
REM Èí¼þ-Èí¼þÆô¶¯Ïî-½ûÓÃOneDriveµÄÏµÍ³·þÎñ
sc config OneSyncSvc start= disabled

REM Èí¼þ-¼Æ»®ÈÎÎñ-Í¨Åä·ûÉ¾³ý
powershell "$t=Get-ScheduledTask|?{$_.TaskName -match 'update|edge|google|office|firefox|fox|wps'};$t|ft TaskName,State -AutoSize;$t|Unregister-ScheduledTask -Confirm:$false"

REM Èí¼þ-·þÎñ-Í¨Åä·ûÉ¾³ý
powershell "$s=Get-Service|?{$_.Name -match 'update|google|fox|edge|pdf|wps' -and $_.Name -ne 'tzautoupdate'};$s|ft DisplayName,Status,StartType -AutoSize;$s|Stop-Service -Force;$s|Set-Service -StartupType Disabled"
goto :eof

:better_wl
REM ÍøÂç-ÆôÓÃTCP´°¿ÚËõ·ÅÑ¡Ïî
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v Tcp1323Opts /t REG_DWORD /d 3 /f >nul
REM ÍøÂç-ÆôÓÃ½ÓÊÕ·½Ëõ·Å×´Ì¬
netsh interface tcp set global rss=enabled 2>nul
REM ÍøÂç-ÉèÖÃÄ¬ÈÏTTLÎª64
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f >nul
REM ÍøÂç-ÆôÓÃÂ·¾¶MTU·¢ÏÖ
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f >nul
REM ÍøÂç-ÆôÓÃTCP SACKÑ¡Ïî
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v SackOpts /t REG_DWORD /d 1 /f >nul
REM ÍøÂç-½ûÓÃTCP/IPºÚ¶´¼ì²â£¨ÆóÒµ»·¾³½¨Òé½ûÓÃ£©
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f >nul
REM ÍøÂç-±£³ÖNagleËã·¨£¨ÊÊºÏOAÐ¡°üÁ÷Á¿£©
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpNoDelay /t REG_DWORD /d 0 /f >nul
REM ÍøÂç-ÉèÖÃTCP×î´óÈßÓàÈ·ÈÏÊýÎª2
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f >nul
REM ÍøÂç-ÉèÖÃTCP×î´óÊý¾ÝÖØ´«´ÎÊý
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpMaxDataRetransmissions /t REG_DWORD /d 8 /f >nul
REM ÍøÂç-ÉèÖÃTCP³õÊ¼»¯RTT
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpInitialRTT /t REG_DWORD /d 300 /f >nul
REM ÍøÂç-ÉèÖÃTCPµÈ´ýÊ±¼äÑÓ³Ù
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpTimedWaitDelay /t REG_DWORD /d 60 /f >nul
REM ÍøÂç-ÉèÖÃ×î´óÓÃ»§¶Ë¿ÚÊý
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxUserPort /t REG_DWORD /d 65534 /f >nul
REM ÍøÂç-½ûÓÃTCP°ë¿ªÁ¬½ÓÏÞÖÆ
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f >nul
REM ÍøÂç-½ûÓÃËÀÍø¹Ø¼ì²â
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableDeadGWDetect /t REG_DWORD /d 0 /f >nul
REM ÍøÂç-ÉèÖÃWindows¹¤×÷Õ¾·þÎñ×î´ó²¢·¢ÃüÁîÊý
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v MaxCmds /t REG_DWORD /d 30 /f >nul
REM ÍøÂç-ÉèÖÃWindows¹¤×÷Õ¾·þÎñ×î´óÏß³ÌÊý
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v MaxThreads /t REG_DWORD /d 30 /f >nul
REM ÍøÂç-ÉèÖÃWindows¹¤×÷Õ¾·þÎñ×î´óÊÕ¼¯¼ÆÊý
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v MaxCollectionCount /t REG_DWORD /d 32 /f >nul
REM ÍøÂç-ÉèÖÃNetBIOSÃû³Æ½âÎö²éÑ¯³¬Ê±
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v NameSrvQueryTimeout /t REG_DWORD /d 1000 /f >nul
REM ÍøÂç-ÉèÖÃDNS»º´æ×î´óTTL
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v maxcachettl /t REG_DWORD /d 3600 /f >nul
REM ÍøÂç-ÉèÖÃDNS»º´æÌõÄ¿×î´óTTLÏÞÖÆ
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v maxcacheentryttllimit /t REG_DWORD /d 10800 /f >nul
REM ÍøÂç-ÉèÖÃDNS»º´æ¸ºÃæ»º´æTTL
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v maxnegativecachettl /t REG_DWORD /d 60 /f >nul
REM ÍøÂç-ÉèÖÃDNS»º´æ¸ºÃæSOA¼ÇÂ¼»º´æÊ±¼ä
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v negativesoacachetime /t REG_DWORD /d 60 /f >nul
REM ÍøÂç-ÉèÖÃDNS»º´æÍøÂç¹ÊÕÏ»º´æÊ±¼ä
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v netfailurecachetime /t REG_DWORD /d 30 /f >nul
REM ÍøÂç-½ûÖ¹µ¯³öÐÂÍøÂçÎ»ÖÃÉèÖÃ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoNetConnectDisconnect /t REG_DWORD /d 1 /f >nul
REM ÍøÂç-ÆôÓÃÍøÂçÎÄ¼þ¼ÐËÑË÷ÓÅ»¯
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v nonetcrawling /t REG_DWORD /d 1 /f >nul
REM ÍøÂç-ÍøÂç½ÚÁ÷ÏÞÖÆÎª10%
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 10 /f >nul
REM ÍøÂç-Ìá¸ßÏµÍ³ÏìÓ¦ËÙ¶È
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f >nul
REM ÍøÂç-½ûÓÃ¶Ô·Ç×î¼ÑÅ¬Á¦Á÷Á¿µÄÏÞÖÆ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v NonBestEffortLimit /t REG_DWORD /d 0 /f >nul
REM ÍøÂç-½ûÓÃQoSÊý¾Ý°üµ÷¶È
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DisableQoS /t REG_DWORD /d 1 /f >nul
REM ÍøÂç-ÆôÓÃTCP Fast Open£¨Ðè·þÎñÆ÷Ö§³Ö£©
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpFastOpen /t REG_DWORD /d 1 /f >nul
REM ÍøÂç-ÉèÖÃÃ¿¸ö·þÎñÆ÷µÄ×î´óÁ¬½ÓÊýÎª10£¨ÆóÒµ½¨ÒéÏÞÖÆ£©
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v MaxConnectionsPerServer /t REG_DWORD /d 10 /f >nul
REM ÍøÂç-×ª·¢»º³åÄÚ´æ
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "ForwardBufferMemory" /t REG_DWORD /d 74240 /f
REM ÍøÂç-×ª·¢Êý¾Ý°üÊýÁ¿
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "NumForwardPackets" /t REG_DWORD /d 5000 /f
REM ÍøÂç-TIME_WAIT ³¬Ê±ÃëÊý
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f
REM ÍøÂç-Ãû³Æ²éÑ¯³¬Ê±ºÁÃë
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v "NameQueryTimeout" /t REG_DWORD /d 1000 /f
REM ÍøÂç-×ª·¢»º³åÄÚ´æ
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "ForwardBufferMemory" /t REG_DWORD /d 74240 /f
goto :eof

:finish
REM ¸üÐÂ²ßÂÔ
gpupdate /force
REM ½ûÓÃÐÂ½¨µÄ¡°ÁªÏµÈË¡±ÓÒ¼ü²Ëµ¥£º
reg delete "HKCR\.contact" /f 2>nul
REM ½ûÓÃ·¢ËÍµ½µÄ¡°´«Õæ½ÓÊÕÈË¡±À©Õ¹²Ëµ¥£º
del /q /f "%APPDATA%\Microsoft\Windows\SendTo\Fax Recipient.lnk" 2>nul
REM ½ûÓÃ·¢ËÍµ½µÄ¡°ZIP¡±À©Õ¹²Ëµ¥£º
del /q /f "%APPDATA%\Microsoft\Windows\SendTo\Compressed (zipped) Folder.ZFSendToTarget" 2>nul
REM ½ûÓÃ·¢ËÍµ½µÄ¡°ÓÊ¼þÊÕ¼þÈË¡±À©Õ¹²Ëµ¥£º
del /q /f "%APPDATA%\Microsoft\Windows\SendTo\Mail Recipient.MAPIMail" 2>nul
REM É¾³ýÇý¶¯ÎÄ¼þ
if "%hs%" NEQ "_hsf" rd /q /s "C:\ShaoHua\Drv\Drvceo\" 2>nul
if "%hs%" NEQ "_hsf" del /q /f /s "C:\ShaoHua\Drv\Drvceo\*" 2>nul
call :chrome
call :finish%hs%
REM Ë¢ÐÂ×ÀÃæ
taskkill /f /im explorer.exe 2>nul
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters
start "" explorer
if "%hs%"=="_hsf" goto :eof
REM ÏµÍ³¼¤»î½Å±¾
if exist "C:\ShaoHua\Key\Activate.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\ÏµÍ³¼¤»î½Å±¾.lnk""):b.TargetPath=""C:\ShaoHua\Key\Activate.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
REM À¬»øÇåÀí½Å±¾
if exist "C:\ShaoHua\Key\ClearTemp.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\À¬»øÇåÀí½Å±¾.lnk""):b.TargetPath=""C:\ShaoHua\Key\ClearTemp.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
REM Ð¶ÔØJAVA
start /wait "" msiexec /x {26A24AE4-039D-4CA4-87B4-2F64180291F0} /qn /norestart
start /wait "" msiexec /x {64A3A4F4-B792-11D6-A78A-00B0D0180291} /qn /norestart
REM ÇåÀí´«µÝÓÅ»¯ÎÄ¼þ
del /q /f /s "%localappdata%\Packages\Microsoft.Windows.ContentDeliveryManager_cw5n1h2txyewy\*"
REM ÇåÀíËõÂÔÍ¼»º´æ
del /q /f /s "%localappdata%\Microsoft\Windows\Explorer\*"
del /q /f /s "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*"
del /q /f /s "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*"
del /q /f /s "%TEMP%\*"
start "" cleanmgr.exe /VERYLOWDISK
for /f "tokens=3*" %%i in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "ProductName"') do set ProductName=%%i %%j
for /f "tokens=3*" %%i in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId"') do set ReleaseId=%%i
for /f "tokens=2* delims=[]" %%i in ('ver') do set v=%%i
for /f "tokens=2* delims= " %%i in ("%v%") do set CurrentBuildNumber=%%i
REM start mshta vbscript:msgbox("System£º"^&vbCrLf^&"%ProductName%"^&vbCrLf^&"%processor_architecture%"^&vbCrLf^&"%ReleaseId% - %CurrentBuildNumber%"^&vbCrLf^&""^&vbCrLf^&"Script£º"^&vbCrLf^&"ShaoHua - 7x24H - 18900559020"^&vbCrLf^&"Version£º"^&vbCrLf^&"%Version%",64,"Tips - %date%")(window.close)
start "" rundll32 shell32,ShellAbout Script  £ºÉÛ»ª - 18900559020                   Date£º%Version% System£º%ProductName% - %processor_architecture% - %CurrentBuildNumber%
if not "%hs%"=="_hsf" for /F "tokens=1" %%a in ('wmic os get localdatetime ^| find "."') do (set date=%%a & set day=!date:~0,12!& reg add "HKCR\.ShaoHua\Script" /v "!day!" /t reg_sz /d "Script%Version%" /f& reg add "HKCR\.ShaoHua" /v "FirstInstall" /t reg_sz /d "1" /f)
echo %~dp0|findstr /i "windows" >nul && exit || (del "%~f0" & exit)
exit
:finish_hsl
REM ½çÃæ-ËøÆÁ½çÃæ-ÆôÓÃÆÁÄ»±£»¤³ÌÐò
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t reg_sz /d "1" /f
REM ½çÃæ-ËøÆÁ½çÃæ-ÆÁÄ»±£»¤³ÌÐòÆô¶¯³¬Ê±Ê±¼ä
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveTimeOut" /t reg_sz /d "180" /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-hsbank-Ê×Ò³ÉèÖÃ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "http://38.40.12.180" /f >nul
REM Èí¼þ-ä¯ÀÀÆ÷-IE-hsbank-¼æÈÝÐÔÊÓÍ¼ÖÐÌí¼ÓÍøÕ¾
reg add "HKCU\Software\Microsoft\Internet Explorer\BrowserEmulation\ClearableListData" /v "UserFilter" /d "411f00005308adba1c00000066040000010000001c0000000c00000004f493222487d601010000000c00330039002e00310039002e00310031002e003100370037000c000000fd9c074d2487d601010000000a0068007300620061006e006b002e0063006f006d000c0000000054236e2487d601010000000c00330038002e00310039002e00310031002e003100370036000c00000072f633952487d601010000000c00330038002e00310039002e00310039002e003100310034000c000000f3fb70bc2487d601010000000c00330038002e00310039002e00310039002e003200340030000c00000089614bc92487d6010100000003002a002e002a000c0000005b847eabfcbed601010000000c00330038002e00310039002e00310039002e003100350037000c0000008cfd718833ced601010000000b00330038002e00310039002e00310037002e00380030000c00000070381f9433ced601010000000b00330038002e00310039002e00310033002e00370030000c000000b8e4df9c33ced601010000000b00330038002e00310039002e00360034002e00330035000c00000050ba78a333ced601010000000c00330038002e00340030002e00310035002e003100300031000c000000960235af33ced6010100000007006800730062002e00620069007a000c0000001366e42c34ced601010000000b00330038002e00310039002e00370039002e00350035000c000000917dab825729d701010000000b00330038002e00310039002e00370039002e00340035000c0000001197e8875729d701010000000c00330038002e00310039002e00310039002e003100370032000c0000003998c8720d4dd701010000000c00330038002e00310039002e00310033002e003200340031000c00000097a5e72f6154d701010000000c00330038002e00310039002e00310039002e003200340033000c000000459afabc195cd701010000000b00330038002e00310039002e00310039002e00370038000c00000091ee0d178f5ed701010000000c00330038002e00310039002e00370037002e003100300034000c000000ce2a8ae6b7b2d70101000000090068007300620061006e006b002e00630063000c000000b6b5c1eeb7b2d701010000000b00330038002e00310030002e00360038002e00330032000c00000085dc69f3b7b2d701010000000b00330038002e00310030002e00360038002e00330038000c000000d223a28509a3d801010000000b00330038002e00310039002e00310039002e00350032000c0000005a097aa609a3d801010000000b00330038002e00310039002e00310039002e00380037000c0000009129ce0a46a5d801010000000b00330038002e00310039002e00310036002e00330033000c0000008a48ee2846a5d801010000000c00330038002e00310039002e00310031002e003100370037000c000000d1f89b9446a5d801010000000b00330038002e00310039002e00370038002e00350039000c000000f1d6b2b69416dc01010000000c00330038002e00310039002e00370038002e00310033003000" /t reg_binary /f
REM Èí¼þ-ä¯ÀÀÆ÷-IE-hsbank-Ìí¼ÓÓòÃûÖÁÐÅÈÎÕ¾µã
for %%d in (
hsbank.com.cn
hsbank.cn
hsbank.cc
hsbank.com
) do (
reg add "%IE_Domains%\%%d\*" /v "http" /t REG_DWORD /d 2 /f
reg add "%IE_Domains%\%%d\*" /v "https" /t REG_DWORD /d 2 /f
)
REM Èí¼þ-ä¯ÀÀÆ÷-IE-hsbank-Ìí¼ÓIPµ½ÐÅÈÎÕ¾µã
set /a rangeNum=99

for %%i in (
STAR
38.STAR
38.STAR.STAR.STAR
38.10.68.32
38.10.68.38
38.19.11.176
38.19.11.177
38.19.13.70
38.19.13.241
38.19.17.80
38.19.19.114
38.19.19.157
38.19.19.172
38.19.19.240
38.19.19.243
38.19.19.78
38.19.64.35
38.19.77.104
38.19.79.45
38.19.79.55
38.40.15.101
38.19.19.52
38.19.19.87
38.19.16.33
38.19.78.59
38.19.78.130
) do (
set "val=%%i"
set "val=!val:STAR=*!"
reg add "%IE_Ranges%\Range!rangeNum!" /v ":Range" /d "!val!" /t REG_SZ /f
reg add "%IE_Ranges%\Range!rangeNum!" /v "http" /d 2 /t REG_DWORD /f
reg add "%IE_Ranges%\Range!rangeNum!" /v "https" /d 2 /t REG_DWORD /f
set /a rangeNum+=1
)
@echo off
attrib -h "C:\hsbankweb.xml"
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-´´½¨IEÄ£Ê½Õ¾µãÁÐ±íXMLÎÄ¼þ
(
echo ^<?xml version="1.0" encoding="UTF-8"?^>
echo ^<site-list version="1"^>
for %%i in (
38.10.68.32
38.10.68.38
38.19.11.176
38.19.11.177
38.19.13.241
38.19.13.70
38.19.19.114
38.19.19.157
38.19.19.172
38.19.19.240
38.19.19.52
38.19.19.78
38.19.19.87
38.19.64.35
38.19.77.104
38.19.78.59
38.19.78.130
38.19.79.45
38.19.79.55
38.40.15.101
) do (
echo     ^<site url="%%i"^>
echo         ^<compat-mode^>Default^</compat-mode^>
echo         ^<open-in^>IE11^</open-in^>
echo     ^</site^>
)
echo ^</site-list^>
) > C:\hsbankweb.xml
attrib +h "C:\hsbankweb.xml"
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÉèÖÃIE¼¯³ÉÄ£Ê½¼¶±ð
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "InternetExplorerIntegrationLevel" /t REG_DWORD /d 1 /f
REM Èí¼þ-ä¯ÀÀÆ÷-Edge-ÅäÖÃIEÄ£Ê½Õ¾µãÁÐ±íÂ·¾¶
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "InternetExplorerIntegrationSiteList" /t REG_SZ /d "file:///C:/hsbankweb.xml" /f
call :upan
call :360ent
REM ÐÞ¸ÄÄÚÍøchromeÊ×Ò³
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v HomepageLocation /t REG_SZ /d "http://38.40.18.180" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v HomepageIsNewTabPage /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ShowHomeButton /t REG_DWORD /d 1 /f
REM ÏÔÊ¾´ËµçÄÔÖÐµÄ´òÓ¡»úÎÄ¼þ¼Ð
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}" /ve /f
del /q /f "C:\users\public\desktop\ÊéÉúµç×Ó¹«ÎÄÏµÍ³7.4.2.lnk" 2>nul
del /q /f "C:\users\public\desktop\Sursen Maker 2.0.lnk" 2>nul
del /q /f "C:\users\public\desktop\SursenOfdMaker.lnk" 2>nul
del /q /f "C:\ShaoHua\Key\SafeLoad.bat" 2>nul
del /q /f "C:\ShaoHua\Soft\WeChatSetup.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\ThunderSpeed.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\PowerShadow_8.5.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\Shadow Defender 1.5.0.726.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\windowsÉú²úÍâÍøV5.4.1.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\ÀëÏß°²×°°ü20241206-ÍâÍøWindows.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\lva_setupfull_20241205174952.exe" 2>nul
rd /q /s "C:\ShaoHua\Soft\°²×°°ü" 2>nul
del /q /f "C:\ShaoHua\Tools\Key\*.exe" 2>nul
del /q /f "C:\ShaoHua\Tools\OfficeÐÞ¸´¹¤¾ß\OfficeÆô¶¯Ò»¼üÐÞ¸´.exe" 2>nul
del /q /f "C:\ShaoHua\Tools\OfficeÐÞ¸´¹¤¾ß\´òÓ¡ÈÎÎñÒ»¼üÇå³ý.exe" 2>nul
del /q /f "C:\ShaoHua\Tools\PrintBox.exe" 2>nul
set "local=C:\ShaoHua" >nul 2>nul
rd /q /s "%systemdrive%\sysprep\" 2>nul
rd /q /s "C:\ShaoHua\Tools\Key" 2>nul
rd /q /s "C:\ShaoHua\Tools\DNS" 2>nul
rd /q /s "C:\ShaoHua\Tools\¾ÖÓòÍø¹²Ïí" 2>nul
rd /q /s "C:\ShaoHua\Tools\Key" 2>nul
del /q /f /s "C:\ShaoHua\*Ò»¼ü*" 2>nul
del /q /f /s "C:\ShaoHua\*¹²Ïí*" 2>nul
del /q /f /s "C:\ShaoHua\*KMS_VL*" 2>nul
del /q /f /s "C:\ShaoHua\*oem7*" 2>nul
del /q /f /s "C:\ShaoHua\*office2007*" 2>nul
del /q /f /s "C:\ShaoHua\tools\*dns*" 2>nul
del /q /f /s "C:\ShaoHua\tools\*Share*" 2>nul
del /q /f /s "C:\ShaoHua\Soft\*inst*" 2>nul
del /q /f /s "C:\ShaoHua\Soft\*lva_*" 2>nul
del /q /f /s "C:\ShaoHua\Soft\*WeChat*" 2>nul
del /q /f /s "%systemdrive%\sysprep\*" 2>nul
REM ×ª»»ÏµÍ³°æ±¾ÎªENT
cscript %windir%\system32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
goto :eof
:finish_hsw
REM ½çÃæ-ËøÆÁ½çÃæ-ÆôÓÃÆÁÄ»±£»¤³ÌÐò
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t reg_sz /d "1" /f
REM ½çÃæ-ËøÆÁ½çÃæ-ÆÁÄ»±£»¤³ÌÐòÆô¶¯³¬Ê±Ê±¼ä
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveTimeOut" /t reg_sz /d "180" /f
call :finish_hso
call :360ent
if exist "C:\ShaoHua\Tools\SetUserFTA.exe" "C:\ShaoHua\Tools\SetUserFTA.exe" http ChromeHTML
if exist "C:\ShaoHua\Tools\SetUserFTA.exe" "C:\ShaoHua\Tools\SetUserFTA.exe" https ChromeHTML
call :upan
REM ÏÔÊ¾´ËµçÄÔÖÖµÄ´òÓ¡»úÎÄ¼þ¼Ð
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}" /ve /f
REM ÐÞ¸ÄÍâÍøchromeÊ×Ò³
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v HomepageLocation /t REG_SZ /d "http://www.bing.com" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v HomepageIsNewTabPage /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v ShowHomeButton /t REG_DWORD /d 1 /f
REM °²×°°ü½Å±¾
if exist "C:\ShaoHua\Soft\°²×°°ü" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\Èí¼þ°²×°°ü.lnk""):b.TargetPath=""C:\ShaoHua\Soft\°²×°°ü"":b.WorkingDirectory=""C:\ShaoHua\Soft\°²×°°ü"":b.Save:close") 2>nul
REM ¿ÌÂ¼»ú½Å±¾
if exist "C:\ShaoHua\Tools\Burner.exe" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\¹âÅÌ¿ÌÂ¼.lnk""):b.TargetPath=""C:\ShaoHua\Tools\Burner.exe"":b.WorkingDirectory=""C:\ShaoHua\Tools"":b.Save:close") 2>nul
REM ×ª»»ÏµÍ³°æ±¾ÎªENT
cscript %windir%\system32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43
goto :eof
:finish_hso
REM ÓÀ¾ÃÔÝÍ£Windows×Ô¶¯¸üÐÂ
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v FlightSettingsMaxPauseDays /t reg_dword /d 9999 /f
REM É¾³ý´ËµçÄÔÖÖµÄ´òÓ¡»úÎÄ¼þ¼Ð
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}" /f
REM É¾³ý´ËµçÄÔÖÖµÄ°²È«UÅÌ_V3ÎÄ¼þ¼Ð
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /f
if "%hs%"=="_hsf" goto :eof
REM Èí¼þ-ä¯ÀÀÆ÷-IE-hsbank-Ê×Ò³ÉèÖÃ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t REG_SZ /d "http://www.bing.com" /f >nul
del /q /f "C:\Windows\System32\UCli.exe" 2>nul
del /q /f "C:\Windows\System32\config.ini" 2>nul
rd /q /s "C:\ShaoHua\Hsbank\" 2>nul
del /q /f /s "C:\Windows\Hsbank\*" 2>nul
del /q /f "C:\ShaoHua\Tools\PrintBox.exe" 2>nul
rd /q /s "C:\ShaoHua\Drv\Scan" 2>nul
rd /q /s "C:\ShaoHua\Drv\Glenfly" 2>nul
rd /q /s "C:\ShaoHua\Drv\KeyBoard" 2>nul
if "%hs%"=="_hsw" goto :eof
if exist "C:\ShaoHua\Tools\SetUserFTA.exe" "C:\ShaoHua\Tools\SetUserFTA.exe" http MSEdgeHTM
if exist "C:\ShaoHua\Tools\SetUserFTA.exe" "C:\ShaoHua\Tools\SetUserFTA.exe" https MSEdgeHTM
del /q /f "C:\ShaoHua\Key\SafeLoad.bat" 2>nul
del /q /f "C:\ShaoHua\Soft\FugueExplorer_v3.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\UniontechCloudPrintServerInstaller_1.2.4.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\PowerShadow_8.5.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\Shadow Defender 1.5.0.726.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\windowsÉú²úÍâÍøV5.4.1.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\ÀëÏß°²×°°ü20241206-ÍâÍøWindows.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\lva_setupfull_20241205174952.exe" 2>nul
del /q /f "C:\ShaoHua\Soft\WeChatSetup.exe" 2>nul
del /q /f "C:\ShaoHua\Softprep.exe" 2>nul
del /q /f "C:\ShaoHua\Softprep.ini" 2>nul
rd /q /s "C:\ShaoHua\Soft\°²×°°ü" 2>nul
rd /q /s "C:\ShaoHua\Drv\Printer\Icsp" 2>nul
rd /q /s "C:\ShaoHua\Drv\Printer\Brother" 2>nul
rd /q /s "C:\ShaoHua\Drv\Printer\Sharp" 2>nul
rd /q /s "C:\ShaoHua\Drv\Printer\Oki5530" 2>nul
del /q /f "%USERPROFILE%\Desktop\360ÆóÒµ°²È«ä¯ÀÀÆ÷.lnk" 2>nul
del /q /f "%PUBLIC%\Desktop\360ÆóÒµ°²È«ä¯ÀÀÆ÷.lnk" 2>nul
rd /q /s "%ProgramFiles%\360ent" 2>nul
del /q /f "C:\Program Files (x86)\Kingsoft\WPS Office\11.8.2.12316\oem\companylogo.png" 2>nul
ren "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\WPS Office »ÕÉÌÒøÐÐ¹É·ÝÓÐÏÞ¹«Ë¾×¨ÓÃ°æ" "WPS Office" 2>nul
reg add "HKLM\SOFTWARE\WOW6432Node\Kingsoft\Office\6.0\Common" /v DisplayName /t REG_SZ /d "WPS Office 2019 (11.8.2.12316)" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Kingsoft Office" /v DisplayName /t REG_SZ /d "WPS Office 2019 (11.8.2.12316)" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Kingsoft Office" /v StartMenuDir /t REG_SZ /d "WPS Office" /f
if exist "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\Microsoft Edge.lnk""):b.TargetPath=""%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe"":b.WorkingDirectory=""%ProgramFiles(x86)%\Microsoft\Edge\Application"":b.Save:close") 2>nul

powershell -NoProfile -Command "$s=(New-Object -COM WScript.Shell).CreateShortcut('%USERPROFILE%\Desktop\Microsoft Edge.lnk');$s.TargetPath='%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe';$s.Save()"
REM ×ª»»ÏµÍ³°æ±¾ÎªLTSC ENT
REM cscript %windir%\system32\slmgr.vbs /ipk PG7H6-7RNT3-R4MGR-HMJK2-J462D
goto :eof
:finish_hsf
call :finish_hso
goto :eof
:chrome
set "chrome_path=C:\Program Files\Google\Chrome\Application\chrome.exe"
if not exist "%chrome_path%" goto :eof
:: ×¢²á Chrome µ½ HKLM (ËùÓÐÓÃ»§)
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome" /ve /d "Google Chrome" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities" /v "ApplicationName" /d "Google Chrome" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities" /v "ApplicationDescription" /d "Google Chrome ä¯ÀÀÆ÷" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities" /v "ApplicationIcon" /d "%chrome_path%,0" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\shell\open\command" /ve /d "\"%chrome_path%\"" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\DefaultIcon" /ve /d "%chrome_path%,0" /f >nul 2>&1
:: ×¢²á Chrome ÄÜÁ¦
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities" /v "ApplicationCompany" /d "Google LLC" /f >nul 2>&1
:: ×¢²á URL Ð­Òé
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\URLAssociations" /v "http" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\URLAssociations" /v "https" /d "ChromeHTML" /f >nul 2>&1
:: ×¢²áÎÄ¼þ¹ØÁª
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\FileAssociations" /v ".htm" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\FileAssociations" /v ".html" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\FileAssociations" /v ".shtml" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\FileAssociations" /v ".xht" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\FileAssociations" /v ".xhtml" /d "ChromeHTML" /f >nul 2>&1
:: ×¢²áµ½ RegisteredApplications
reg add "HKLM\Software\RegisteredApplications" /v "Google Chrome" /d "Software\Clients\StartMenuInternet\Google Chrome\Capabilities" /f >nul 2>&1
:: ×¢²á Chrome ÎÄ¼þÀàÐÍ
reg add "HKCR\ChromeHTML" /ve /d "Google Chrome HTML Document" /f >nul 2>&1
reg add "HKCR\ChromeHTML\DefaultIcon" /ve /d "%chrome_path%,0" /f >nul 2>&1
reg add "HKCR\ChromeHTML\shell\open\command" /ve /d "\"%chrome_path%\" \"%%1\"" /f >nul 2>&1
goto :eof
:360ent
set "ent_path=C:\Program Files\360ent\Application\360ent.exe"
if not exist "%ent_path%" goto :eof
:: ×¢²á 360ÆóÒµä¯ÀÀÆ÷µ½ HKLM
reg add "HKLM\Software\Clients\StartMenuInternet\360ent" /ve /d "360ÆóÒµ°²È«ä¯ÀÀÆ÷" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities" /v "ApplicationName" /d "360ÆóÒµ°²È«ä¯ÀÀÆ÷" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities" /v "ApplicationDescription" /d "360ÆóÒµ°²È«ä¯ÀÀÆ÷" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities" /v "ApplicationIcon" /d "%ent_path%,0" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\shell\open\command" /ve /d "\"%ent_path%\"" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\DefaultIcon" /ve /d "%ent_path%,0" /f >nul 2>&1

:: ×¢²á 360ÆóÒµä¯ÀÀÆ÷ÄÜÁ¦
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities" /v "ApplicationCompany" /d "360.cn" /f >nul 2>&1
:: ×¢²á URL Ð­Òé
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities\URLAssociations" /v "http" /d "360HTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities\URLAssociations" /v "https" /d "360HTML" /f >nul 2>&1
:: ×¢²áÎÄ¼þ¹ØÁª
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities\FileAssociations" /v ".htm" /d "360HTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities\FileAssociations" /v ".html" /d "360HTML" /f >nul 2>&1
:: ×¢²áµ½ RegisteredApplications
reg add "HKLM\Software\RegisteredApplications" /v "360ent" /d "Software\Clients\StartMenuInternet\360ent\Capabilities" /f >nul 2>&1
:: ×¢²á 360 ÎÄ¼þÀàÐÍ
reg add "HKCR\360HTML" /ve /d "360 Enterprise HTML Document" /f >nul 2>&1
reg add "HKCR\360HTML\DefaultIcon" /ve /d "%ent_path%,0" /f >nul 2>&1
reg add "HKCR\360HTML\shell\open\command" /ve /d "\"%ent_path%\" \"%%1\"" /f >nul 2>&1
goto :eof
:upan
REM °²È«UÅÌ_v1_V2_V3_DEL
del /q /f "%userprofile%\Desktop\°²È«UÅÌ.lnk" 2>nul
del /q /f "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Network Shortcuts\°²È«UÅÌ.exe" 2>nul
del /q /f "%UserProfile%\AppData\Roaming\Microsoft\Windows\Network Shortcuts\°²È«UÅÌ.exe" 2>nul
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKLM\SOFTWARE\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKCU\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKLM\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
del /q /f "%userprofile%\Desktop\°²È«UÅÌ_V2.lnk" 2>nul
del /q /f "%userprofile%\Desktop\°²È«UÅÌ_V3.lnk" 2>nul
if "%hs%"=="_hsf" goto :eof
if exist "C:\ShaoHua\Soft\FugueExplorer_v3.exe" call :upanadd
goto :eof
:upanadd
REM °²È«UÅÌ_V3_ADD
if not exist "C:\ShaoHua\Soft\FugueExplorer_v3.exe" goto :eof
start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\°²È«UÅÌ_V3.lnk""):b.TargetPath=""C:\ShaoHua\Soft\FugueExplorer_v3.exe"":b.WorkingDirectory=""C:\ShaoHua\Soft"":b.Save:close") 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "°²È«UÅÌ_V3" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "°²È«UÅÌ_V3" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "°²È«UÅÌ_V3" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "InfoTip" /t reg_sz /d "¿ì½Ý²¹¶¡By_ShaoHua" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "LocalizedString" /t reg_sz /d "°²È«UÅÌ_V3" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "System.ItemAuthors" /t reg_sz /d "¿ì½Ý²¹¶¡By_ShaoHua" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "TileInfo" /t reg_sz /d "prop:System.ItemAuthors" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\DefaultIcon" /ve /t reg_expand_sz /d "C:\ShaoHua\Soft\FugueExplorer_v3.exe" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\Shell\Open\Command" /ve /t reg_sz /d "C:\ShaoHua\Soft\FugueExplorer_v3.exe" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\Instance" /v "CLSID" /t reg_sz /d "{0AFACED1-E828-11D1-9187-B532F1E9575D}" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\Instance\InitPropertyBag" /v "Target" /t reg_sz /d "C:\ShaoHua\Soft\\" /f
reg add "HKCU\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "°²È«UÅÌ_V3" /f
reg add "HKLM\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "°²È«UÅÌ_V3" /f
goto :eof