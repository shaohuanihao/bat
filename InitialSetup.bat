ÿþa
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net session>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=InitialSetup½Å±¾
set Powered=Powered by ÉÛ»ª 18900559020
set Version=20260721
set Comment=ÔËÐÐÍê±Ïºó½Å±¾»á×Ô¶¯¹Ø±Õ£¬ÇëÎðÊÖ¶¯¹Ø±Õ£¡
title %Name% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
:start
REM ver
for /F "tokens=1" %%a in ('wmic os get localdatetime ^| find "."') do (set date=%%a & set day=!date:~0,8!& reg add "HKCR\.ShaoHua" /v "InitialSetup" /t reg_sz /d "!day!" /f)
call :cmd_admin
call :clear
call :out
exit
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
:clear
timeout /t 3 >nul
REM Èí¼þ-ÊäÈë·¨-Ä¬ÈÏÓïÑÔ 0 ÖÐÎÄ£¬1 Ó¢ÎÄ£¬¿Ï¶¨ÕýÈ·£¡
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t reg_dword /d 1 /f
REM É¾³ýËùÓÐ¼Æ»®ÈÎÎñ
REM ½ûÓÃÈ«²¿ÈÎÎñ½ûÓÃ£¬»áµ¼ÖÂ¼Æ»®ÈÎÎñ²»Í£±¨´í
REM schtasks /delete /tn * /F
REM ¿Í»§ÌåÑé¸Ä½ø¼Æ»® + Ò£²âÉÏ±¨£¨È«¸²¸Ç£©
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Application Experience\AitAgent" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Device Inventory\DeviceInventoryTask" >nul 2>&1
REM ÏµÍ³Õï¶Ï¡¢´ÅÅÌÕï¶ÏÈ«ÏµÁÐ
schtasks /change /disable /tn "\Microsoft\Windows\Diagnostics\Scheduled" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Diagnostics\DiskDiagnosticDataCollector" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\DiskDiagnostic\DiskDiagnosticResolver" >nul 2>&1
REM ¹ã¸æ¡¢ÍÆËÍ¡¢Ó¦ÓÃÊý¾ÝÍ¬²½È«ÏµÁÐ
schtasks /change /disable /tn "\Microsoft\Windows\AdvertisingInfo\Schedule" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\ApplicationData\DsSvcCleanup" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\PushNotifications\WpnTask4" >nul 2>&1
REM Xbox È«Ì×ÈÎÎñ
schtasks /change /disable /tn "\Microsoft\Windows\XboxGameSave\XboxGameSaveTask" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Xbox\XboxLiveGameInstaller" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Xbox\XboxLiveTask" >nul 2>&1
REM ´ÅÅÌËéÆ¬ÕûÀí SSD×¨ÓÃ¹Ø±Õ
schtasks /change /disable /tn "\Microsoft\Windows\Defrag\ScheduledDefrag" >nul 2>&1
REM ÏµÍ³×Ô¶¯Î¬»¤Ë«ÈÎÎñ
schtasks /change /disable /tn "\Microsoft\Windows\TaskScheduler\Regular Maintenance" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\TaskScheduler\Maintenance Configurator" >nul 2>&1
REM ·´À¡ÖÐÐÄ¡¢´íÎóÈÕÖ¾ÉÏ´«È«Ì×
schtasks /change /disable /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" >nul 2>&1
REM µØÍ¼¡¢Î»ÖÃ¸üÐÂÈÎÎñ
schtasks /change /disable /tn "\Microsoft\Windows\Maps\MapsUpdateTask" >nul 2>&1
REM ÓïÒôÊ¶±ð¡¢ÊÖÐ´´íÎóÉÏ±¨
schtasks /change /disable /tn "\Microsoft\Windows\Speech\SpeechModelDownloadTask" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Speech\SpeechTelemetryTask" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\HandwritingErrorReports\HandwritingErrorReportTask" >nul 2>&1
REM MediaCenter ¶àÃ½ÌåÈ«Ì×ºóÌ¨ÈÎÎñ
schtasks /change /disable /tn "\Microsoft\Windows\MediaCenter\MediaCenterRecoveryTask" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\MediaCenter\ObjectStoreRecoveryTask" >nul 2>&1
REM ´òÓ¡Õï¶ÏÊÕ¼¯
schtasks /change /disable /tn "\Microsoft\Windows\PrintDiagnostics\PrintDiagnosticTask" >nul 2>&1
REM ËøÆÁ/±ÚÖ½×Ô¶¯Í¬²½ÈÎÎñ
schtasks /change /disable /tn "\Microsoft\Windows\Wallpaper\WallpaperTask" >nul 2>&1
REM OneDrive Í¬²½ÈÎÎñ£¨²»ÓÃOneDrive¿É½ûÓÃ£©
schtasks /change /disable /tn "\Microsoft\Windows\SkyDrive\RoutineCleanupTask" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\SkyDrive\Idle Sync Maintenance Task" >nul 2>&1
REM ¼ÒÍ¥×é£¨ÒÑ·ÏÆú¹¦ÄÜ£©
schtasks /change /disable /tn "\Microsoft\Windows\HomeGroup\HomeGroupTask" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\HomeGroup\HomeGroupListener" >nul 2>&1
REM ÉÌµêÓ¦ÓÃÁÙÊ±×´Ì¬ÇåÀí
schtasks /change /disable /tn "\Microsoft\Windows\ApplicationData\CleanupTemporaryState" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\AppxDeploymentClient\Pre-staged app cleanup" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\AppxDeploymentClient\InstallPreapprovedApps" >nul 2>&1
REM ×ÖÌå»º´æ·þÎñ£¨Èô²»¸Ä×ÖÌå¿É½ûÓÃ£©
schtasks /change /disable /tn "\Microsoft\Windows\FontCache\FontCacheTask" >nul 2>&1
REM ´æ´¢¸ÐÖª×Ô¶¯ÇåÀí
schtasks /change /disable /tn "\Microsoft\Windows\DiskFootprint\StorageSense" >nul 2>&1
REM ÓÃ»§×ÊÁÏÉÏ´«£¨ÒþË½Ïà¹Ø£©
schtasks /change /disable /tn "\Microsoft\Windows\User Profile Service\HiveUploadTask" >nul 2>&1
REM ¸¨Öú¹¦ÄÜÒ£²â£¨²»ÓÃ·Å´ó¾µ/½²ÊöÈË¿É¹Ø£©
schtasks /change /disable /tn "\Microsoft\Windows\Accessibility\AccessibilityDiagnostics" >nul 2>&1
REM Windows ¸üÐÂ×Ô¶¯Î¬»¤£¨²»Ó°ÏìÊÖ¶¯¸üÐÂ£©
schtasks /change /disable /tn "\Microsoft\Windows\WindowsUpdate\Automatic App Update" >nul 2>&1
REM ´ÅÅÌÅä¶î¹ÜÀí£¨¸öÈËÓÃ»§¿É½ûÓÃ£©
schtasks /change /disable /tn "\Microsoft\Windows\DiskQuota\DiskQuota" >nul 2>&1
REM ¿Õ¼ä¹ÜÀíÈÎÎñ£¨´æ´¢¿Õ¼äÓÅ»¯£©
schtasks /change /disable /tn "\Microsoft\Windows\SpacePort\SpaceAgentTask" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\SpacePort\SpaceManagerTask" >nul 2>&1
REM WebThreatDefense£¨Windows Defender²¿·Ö¹¦ÄÜ£¬×°ÁËµÚÈý·½É±Èí¿É¹Ø£©
schtasks /change /disable /tn "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup" >nul 2>&1
schtasks /change /disable /tn "\Microsoft\Windows\Windows Defender\Windows Defender Verification" >nul 2>&1
REM Ô¶³ÌÐ­ÖúÈÕÖ¾ÉÏ´«£¨µ¥»úÀëÏßÓÃ»§¹Ø±Õ£©
schtasks /change /disable /tn "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask" >nul 2>&1
REM wpsÉý¼¶
schtasks /change /disable /tn "WpsUpdateTask_Administrator" >nul 2>&1
REM 360zipÉý¼¶
schtasks /change /disable /tn "360ZipUpdater" >nul 2>&1
REM É¾³ýÓÃ»§ºÍÏµÍ³Æô¶¯ÏîÖÐµÄËùÓÐÏî
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /va /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /va /f
reg delete "HKLM\Software\Microsoft\Shared Tools\MSConfig\startupreg" /f
REM É¾³ýÆô¶¯ÎÄ¼þ¼ÐÖÐµÄËùÓÐ³ÌÐò
del /q /f "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*"
del /q /f "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\*"
REM É¾³ýËùÓÐÓÃ»§µÄ¹«¹²Æô¶¯ÎÄ¼þ
del /q /f "C:\Users\All Users\Microsoft\Windows\Start Menu\Programs\Startup\*"
REM É¾³ý Sysprep ÎÄ¼þ¼Ð¼°ÆäÄÚÈÝ
rd /s /q "C:\Sysprep"
del /q /f "C:\Sysprep\*"
REM É¾³ýÓÃ»§¿ªÊ¼²Ëµ¥ÖÐµÄÆô¶¯Ïî
del /q /f "%userprofile%\¿ªÊ¼²Ëµ¥\³ÌÐò\Æô¶¯\*"
REM É¾³ý¶àÓàµÄ¹ã¸æÎÄ¼þ
taskkill /F /IM 360pingbao.exe /T >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Roaming\360pingbao" >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Roaming\greencore" >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Roaming\GreenCore7z" >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Roaming\360browser" >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Roaming\SogouExplorer" >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Local\360Chrome" >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Local\360ChromeX" >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Local\google" >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Local\Microsoft\Edge" >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Local\Sogou" >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Local\Tencent\QQBrowser" >nul 2>&1
rd /s /q "C:\Users\Administrator\AppData\Local\Tencent" >nul 2>&1
del /q /f "C:\Users\Administrator\AppData\Local\config.ini" >nul 2>&1
del /q /f "C:\Program Files (x86)\SysCeo\DrvCeo\Res\dcairbx86.dll" >nul 2>&1
del /q /f "C:\Program Files (x86)\SysCeo\DrvCeo\Res\dcairbx86_ntf.dll" >nul 2>&1
reg delete "HKCU\SOFTWARE\360" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\360Chrome" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\360ChromeX" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\360ent6" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\360SoftMgr" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\360ent6" /f >nul 2>&1
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\360pingbao" /f >nul 2>&1
del /q /f /s "C:\Users\Administrator\AppData\Local\Temp\" >nul 2>&1
REM Ìí¼Ó ctfmon.exe µ½ÓÃ»§Æô¶¯Ïî
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "ctfmon" /t REG_SZ /d "C:\Windows\System32\ctfmon.exe" /f
REM ¼ì²é²¢Æô¶¯ ctfmon.exe Èç¹ûËüÎ´ÔËÐÐ
tasklist /FI "IMAGENAME eq ctfmon.exe" | find /I "ctfmon.exe" >nul || start "" "C:\WINDOWS\system32\ctfmon.exe"
goto :eof
:out
REM WPSÐÞ¸´
Reg delete "HKCU\Software\Kingsoft\Office\6.0\et" /f >nul 2>&1
Reg delete "HKCU\Software\Kingsoft\Office\6.0\wps" /f >nul 2>&1
Reg delete "HKCU\Software\Kingsoft\Office\6.0\wpp" /f >nul 2>&1
Reg delete "HKCU\Software\kingsoft\Office\6.0\Common\AuthInfo" /f >nul 2>&1
del /q /f "%allusersprofile%\Application Data\Kingsoft\office6\license2.dat" >nul 2>&1
del /q /f "%programdata%\Kingsoft\office6\license2.dat" >nul 2>&1
start "" "C:\Program Files (x86)\Kingsoft\WPS Office\11.8.2.12316\office6\ksomisc.exe" -addsn 26B4J-UDCM6-XR46L-DAVW9-WDACG >nul 2>&1
REM shaohua
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "ShaoHua" /t REG_SZ /d "C:\Windows\shaohua.bat" /f
rem NAME
start "" /wait rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,1 2>nul
rem IP
RunDll32.exe shell32.dll,Control_RunDLL ncpa.cpl 2>nul
rem ¼ÆËã»úÃû
sysdm.cpl
cls&echo.&echo.ÇëÈ·¶¨ÒÑ¾­Íê³É ¼ÆËã»úÃû ºÍ IPµØÖ· µÄÉèÖÃ£¡£¡£¡&echo.&echo.ÈôÒÑÍê³É£¬Çë°´ÏÂÈÎÒâ¼üÖØÆôµçÄÔ¡£&echo.&pause&cls&shutdown -r -t 10 -c "µÚÒ»½×¶ÎÒÑ½áÊø¡£10Ãëºó£¬ÏµÍ³»á×Ô¶¯ÖØÆô£¬Íê³ÉÓàÏÂ²Ù×÷£¡"&del %0