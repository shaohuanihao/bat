��a
cls
echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=�ۺϽű�
set Powered=Powered by �ۻ� 18900559020
set Version=20240623
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
call :CapsLK
:passwd
cls&echo.&echo.
echo.����������������������������������������������������������������������������������������������Ver%Version%&echo.&echo.&echo.&echo.&echo.&echo.&set /p pwd=��������������������������������������������Password:
if /i "%pwd%" neq "shaohua" goto :passwd
call :patch
title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� %Comment%
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

:CapsLK
for /f "delims=" %%i in ('powershell -command "[console]::CapsLock"') do if "%%i"=="False" mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
goto :eof

:patch
if "%PROCESSOR_ARCHITECTURE%"=="AMD64" call :patch64
if "%PROCESSOR_ARCHITECTURE%"=="x86" call :patch32
set IE_type="%IE_Path32%" "%%1"
set IE_Domains=HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains
set IE_Ranges=HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges
choice /T 1 /C WLOFA /d A /N >nul 2>nul
if %errorlevel%==5 REM
if %errorlevel%==4 set Pc=PC-Sysprep&set hs=_hsf&&goto :eof
if %errorlevel%==3 set Pc=PC-Other&set hs=_hso&&goto :eof
if %errorlevel%==2 set Pc=HS-Lan&set hs=_hsl&&goto :eof
if %errorlevel%==1 set Pc=HS-Wan&set hs=_hsw&&goto :eof
REM ����ARP���õ��Ե�������
arp -a|findstr /i "38.40." >nul && (set Pc=HS-Lan&set hs=_hsl)||(arp -a|findstr /i "38.41." >nul && (set Pc=HS-Lan&set hs=_hsl)||(arp -a|findstr /i "10.198." >nul && (set Pc=HS-Wan&set hs=_hsw)||(set Pc=PC-Other&cls&echo. &echo.�����޷��ж����Ļ���&echo.&echo.�����ű�ר���ڻ���������ɽ�������绷��ʹ��&echo.�������ж�������������˾��ϵ&echo. &echo.����ɽ������ӿƼ����޹�˾ - �ۻ� - 7x24H - 18900559020&timeout /t 6 >nul&exit)))
goto :eof
:patch64
set bit=64&set arch=X64&set IE_Path64=C:\Program Files\Internet Explorer\iexplore.exe&set IE_Path32=C:\Program Files (x86)\Internet Explorer\iexplore.exe
goto :eof
:patch32
set bit=32&set arch=X86&set IE_Path64=&set IE_Path32=C:\Program Files\Internet Explorer\iexplore.exe
goto :eof
:cmd_admin
REM ����cmd-admin
reg add "HKCR\cmdfile\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /C \"%1\" %*" /f
reg add "HKCR\ConsoleHost\command\runas" /ve /t REG_SZ /d "cmd.exe /C \"%1\" %*" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\system32\cmd.exe" /t reg_sz /d RUNASADMIN /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\SysWOW64\cmd.exe" /t reg_sz /d RUNASADMIN /f
reg add "HKCR\ConsoleHost\command\runas" /ve /t REG_SZ /d "cmd.exe /C \"%1\" %*" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\system32\conhost.exe" /t reg_sz /d RUNASADMIN /f
reg add "HKCR\Microsoft.PowerShellScript.1\Shell\runas\command" /ve /t REG_SZ /d "PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File \"%1\"" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" /t reg_sz /d RUNASADMIN /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\SysWOW64\WindowsPowerShell\v1.0\powershell.exe" /t reg_sz /d RUNASADMIN /f
REM ��ʼ�����û��˻�����(UAC)����
echo �����û��˻����Ʋ���...
REM �������ù���Ա��UAC��ʾ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
REM �������ù���Ա�ʻ��Ĺ���Ա��׼ģʽ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v FilterAdministratorToken /t REG_DWORD /d 1 /f
REM ���á��û��ʻ����ƣ��Թ���Ա��׼ģʽ�������й���Ա��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
REM �����ڰ�ȫ������ʾ (PromptOnSecureDesktop)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f

REM ����Ӧ�ó���װ��Ⲣ��ʾ����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableInstallerDetection /t REG_DWORD /d 1 /f
REM ��������Ȩ��ʱ����ʾ
secedit /export /cfg C:\Windows\Temp\export.inf
(findstr /v "ConsentPromptBehaviorAdmin" C:\Windows\Temp\export.inf) > C:\Windows\Temp\export_without.inf
echo ConsentPromptBehaviorAdmin = 0 >> C:\Windows\Temp\export_without.inf
secedit /configure /cfg C:\Windows\Temp\export_without.inf /db C:\Windows\Temp\export.sdb
REM ������ʱ�ļ�
del C:\Windows\Temp\export.inf
del C:\Windows\Temp\export_without.inf
del C:\Windows\Temp\export.sdb
goto :eof

:pctime
REM ָ��NTP������
call :pctime%hs%
REM �������Զ�����ʱ�䡱
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v Type /d NTP /f
REM �������Զ�����ʱ����
reg add "HKLM\SYSTEM\CurrentControlSet\Services\tzautoupdate" /v Start /t REG_DWORD /d 3 /f
w32tm /config /update
sc config w32time start= auto
net stop w32time
net start w32time
w32tm /resync
goto :eof
:pctime_hsl
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v 3 /t REG_SZ /d 38.40.254.250 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v NtpServer /t REG_SZ /d 38.40.254.250 /f
w32tm /config /manualpeerlist:"38.40.254.250" /syncfromflags:manual /reliable:yes /update
goto :eof
:pctime_hsw
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v NtpServer /t REG_SZ /d "time.windows.com,0x9" /f
w32tm /config /manualpeerlist:"time.windows.com" /syncfromflags:manual /reliable:yes /update
goto :eof
:pctime_hso
call :pctime_hsw
goto :eof
:pctime_hsf
call :pctime_hsw
goto :eof

:closesoft
REM �ر�������������������
taskkill /f /t /im iexplore.exe 2>nul
taskkill /f /t /im MicrosoftEdge.exe 2>nul
taskkill /f /t /im chrome.exe  2>nul
taskkill /f /t /im firefox.exe  2>nul
taskkill /f /t /im WeChat.exe 2>nul
taskkill /f /t /im WechatBrowser.exe 2>nul
taskkill /f /t /im 360se.exe 2>nul
taskkill /f /t /im 360chrome.exe 2>nul
taskkill /f /t /im sesvc.exe 2>nul
taskkill /f /t /im "StartMenuExperienceHost.exe" >nul 2>nul
taskkill /f /im OneDrive.exe >nul 2>nul
taskkill /f /im wpsoffice.exe >nul 2>nul
taskkill /f /t /im FRMI.exe 2>nul
taskkill /f /t /im Lcserver.exe 2>nul
goto :eof

:better_yj
REM Ӳ��-��Դ�����Ż�
echo �Ӳ��ر���ʾ��
Powercfg -x -monitor-timeout-dc 0
Powercfg -x -monitor-timeout-ac 0
echo �Ӳ��ر�Ӳ��
powercfg -x -disk-timeout-dc 0
powercfg -x -disk-timeout-ac 0
echo �Ӳ��Զ�����˯��״̬
powercfg -x -standby-timeout-dc 0
powercfg -x -standby-timeout-ac 0
powercfg -hibernate off
echo �Ӳ��Զ���������״̬
powercfg -x -hibernate-timeout-dc 0
powercfg -x -hibernate-timeout-ac 0
echo �ر���ʾ��ǰ�ȴ�ʱ��: �Ӳ�
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
echo ����ʱ����Ҫ����
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c fea3413e-7e05-4911-9a71-700331f1c294 0e796bdb-100d-47d6-a2d5-f7d2daa51f51 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c fea3413e-7e05-4911-9a71-700331f1c294 0e796bdb-100d-47d6-a2d5-f7d2daa51f51 0
echo �Ӳ��ر�Ӳ��
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
echo JavaScript ��ʱ��Ƶ���������
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 1
echo ���������ӳ�õ�Ƭ
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
echo �����������������
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
echo �Ӳ��Զ�����˯��
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
echo ������˯��
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 1
echo �Ӳ��Զ���������
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
echo ����ʹ�û��Ѷ�ʱ��
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 1
echo USB ѡ������ͣ����
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
echo ���ϸ��ӣ�����ȡ�κβ���
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
echo ���µ�Դ��ťΪ�ػ�
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
echo ����˯�߰�ťΪ˯��
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
echo ϵͳɢ�ȷ�ʽΪ����
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
echo ý�干��ʱ����ֹ���������˯��״̬
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 1
echo Video playback quality bias
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 1
echo ������Ƶʱ���Ż���Ƶ����
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0
echo ������׿Խ���ܡ�
REM ����ҵ���׿Խ���ܡ���Դ�ƻ���ѡ��üƻ������򴴽���ѡ��üƻ�
for /f "tokens=2 delims=:(" %%a in ('powercfg /list ^| findstr "׿Խ����"') do (set GUID=%%a)
if defined GUID (set GUID=!GUID: =!)
if not "!GUID!"=="" (powercfg -setactive !GUID!) else (
    powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
    for /f "tokens=2 delims=:(" %%a in ('powercfg /list ^| findstr "׿Խ����"') do (set GUID=%%a)
    set GUID=!GUID: =!
    powercfg -setactive !GUID!)
REM Ӳ��-��Դ�����Ż�-����ϵͳ����
powercfg -h off
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 0
del c:\hiberfil.sys /f /q 2>nul

REM Ӳ��-����-win10��ֹ��������
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t reg_dword /d 1 /f
REM Ӳ��-����-��������ʱ�������Լ��
bcdedit /set nointegritychecks on
REM Ӳ��-����-��������ִ�б�����DEP��
bcdedit /set nx AlwaysOff
REM Ӳ��-����-��������ʱ�������Լ��
bcdedit -set loadoptions DISABLE_INTEGRITY_CHECKS
REM �ر�ϵͳ����ģʽ
REM bcdedit /set testsigning off
REM �������Թ���
REM bcdedit /debug ON
REM bcdedit /bootdebug ON
REM Ӳ��-����-�������Ա�����豸��װ���Ʋ���
reg add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v "AllowAdminInstall" /t reg_dword /d 1 /f
REM Ӳ��-����-���豸��������Ĵ���ǩ������Ϊ����
reg add "HKCU\Software\Policies\Microsoft\Windows NT\Driver Signing" /v "BehaviorOnFailedVerify" /t reg_dword /d 0 /f
goto :eof

:better_xt
REM ϵͳ-֪ͨ-��������Ա���ƹ���
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t reg_dword /d 1 /f
REM ϵͳ-֪ͨ-�����û�������ʿ���̨�л�����
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t reg_dword /d 1 /f
REM ϵͳ-֪ͨ-��ֹ�ڰ�ȫ��������ʾUAC��ʾ
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t reg_dword /d 0 /f
REM ϵͳ-֪ͨ-�ر�Windows��֪ͨ-��ȫ��ά��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /t reg_dword /d 0 /f
REM ϵͳ-֪ͨ-�ر�Windows��֪ͨ-��ӡ֪ͨ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "Enabled" /t reg_dword /d 0 /f
REM ϵͳ-֪ͨ-�ر�Windows��֪ͨ-�Զ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "Enabled" /t reg_dword /d 0 /f
REM ϵͳ-֪ͨ-�ر�Windows��֪ͨ-Defender
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "Enabled" /t reg_dword /d 0 /f
REM ϵͳ-֪ͨ-�ر�Windows��֪ͨ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "LockScreenToastEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v "TrayIconStatus" /t reg_dword /d 9 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_BADGE_ENABLED" /t reg_dword /d 0 /f
REM ϵͳ-֪ͨ-���� Windows To Go ���ֲ��� USB ����������ʾ
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PortableOperatingSystem" /v ShutdownBehavior /t REG_DWORD /d 0 /f
REM ϵͳ-֪ͨ-���ذ�ȫ��ά���еĽ�������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAHealth" /t reg_dword /d 1 /f
REM ϵͳ-֪ͨ-����֪ͨ�е�����Ч��
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_GLEAM_ENABLED /t REG_DWORD /d 0 /f
REM ϵͳ-֪ͨ-����֪ͨ�еĻ���
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NOC_GLOBAL_SETTING_BADGE_ENABLED /t REG_DWORD /d 0 /f
REM ϵͳ-֪ͨ-��������������ɨ����
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\Launcher" /v "DisableLightDismiss" /t reg_dword /d 1 /f
REM ϵͳ-֪ͨ-����֪ͨ����
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t reg_dword /d 1 /f
REM ϵͳ-֪ͨ-�رա�ͬ��������ݿ羳���䡱
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CloudContent" /v DisableCrossDeviceDataTransfer /t REG_DWORD /d 1 /f
REM ϵͳ-֪ͨ-�ص�������Dr.Watson
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t reg_sz /d 0 /f
REM ϵͳ-֪ͨ-���ô���㱨�����ڷ������ش���ʱ֪ͨ��
reg add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v "ShowUI" /t reg_dword /d 0 /f
REM ϵͳ-֪ͨ-����Windows Defender Security Center��֪ͨ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f
REM ϵͳ-֪ͨ-�ر������ǽ��ֹ��Ӧ��ʱ֪ͨ��
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v DisableNotifications /t REG_DWORD /d 1 /f
REM ϵͳ-֪ͨ-�رչ�������ǽ��ֹ��Ӧ��ʱ֪ͨ��
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v DisableNotifications /t REG_DWORD /d 1 /f
REM ϵͳ-֪ͨ-�ر�Windows Defender����ǽ��ֹ��Ӧ��ʱ֪ͨ��
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v Notifications_Disabled /t REG_DWORD /d 1 /f
REM ϵͳ-֪ͨ-���ý���֪ͨ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v NocToastEnabled /t REG_DWORD /d 0 /f
REM ϵͳ-֪ͨ-�������еġ���ȫ��ά����֪ͨ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v Enabled /t REG_DWORD /d 0 /f
REM ϵͳ-֪ͨ-���ö�̬����������ʱ��֪ͨ
reg add "HKLM\SOFTWARE\Microsoft\Windows Security Health\Health Advisor" /v DynamicLockNotificationDisabled /t REG_DWORD /d 1 /f
REM ϵͳ-֪ͨ-���ò�����ϵͳҪ���ˮӡ
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" /v NoGenTicket /t REG_DWORD /d 1 /f

REM ϵͳ-���-�رչ���ʶ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
REM ϵͳ-���-����ң��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REM ϵͳ-���-���ô����Ż�����
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadModeBackground /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadModeForeground /t REG_DWORD /d 0 /f
REM ϵͳ-���-�رտͻ�������Ƽƻ�
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /d 0 /t REG_DWORD /f
REM ϵͳ-���-��ֹ�� Microsoft ����ī���ʹ�������
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t "Reg_Dword" /d "1" /f
REM ϵͳ-���-��ֹ�� Microsoft ���͹����������д����Ϣ���԰������ǸĽ������Ĵ��ֺ�д��
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t "Reg_Dword" /d "1" /f
REM ϵͳ-���-��ֹ Windows �ռ���ϵ������
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t "Reg_Dword" /d "0" /f
REM ϵͳ-���-����������ѻ����趨Ϊ�رա�����������������ء�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /f
reg add "HKU\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t "Reg_Dword" /d "0" /f
REM ϵͳ-���-�ر���Ѷ����Ȥ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t reg_dword /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t reg_dword /d 0 /f
REM ϵͳ-���-����Windows�еĸ��Ի��������������ռ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /d 0 /t reg_dword /f
REM ϵͳ-���-�ر�windows�����Ż�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceAppSuggestionsEnabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�ر�windows�����Ż�����
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f
REM ϵͳ-���-���õ�¼ʱ������˽��������
reg add "HKLM\Software\Policies\Microsoft\Windows\OOBE" /v "DisablePrivacyExperience" /t reg_dword /d 1 /f
REM ϵͳ-���-�ر���������ʾ�����ݺ�����ϵͳ�Ƽ��ͽ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�ر��ڿ�ʼ�˵�����ʾ�Ľ�������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�������ݽ�����������ԭʼ�豸������ԤװӦ�ó���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�ر��̵�Ӧ���ƹ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�������ݽ����������ľ�Ĭ��װӦ�ó���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�������ݽ���������������½����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�������ڿ�ʼ�˵���ʾ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t reg_dword /d 0 /f
reg add "HKU\.DEFAULT\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�ر�ϵͳ�Ƽ�������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�ر��û������ϵĽ���͹��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�ر��ض����͵�ϵͳ�������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�ر��ض���ϵͳ����������Ƽ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t reg_dword /d 0 /f
REM ϵͳ-���-�ر��Ƽ���������ʾ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t reg_dword /d 0 /f
REM ϵͳ-���-
REM �������ݽ����������Ĺ��ܹ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t reg_dword /d 0 /f
REM ϵͳ-���-��������ʱ��Windows �۽��ƹ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t reg_dword /d 1 /f
REM ϵͳ-���-�������ݽ�������������ת�������Ӳ㹦��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t reg_dword /d 1 /f
REM ϵͳ-���-�ر�������վͨ�����������б����ṩ��ط���
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t reg_dword /d 1 /f

REM ϵͳ-Windows Defender-�ر�Windows���������еķ�����ɨ�蹦��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "ScanWithAntiVirus" /t REG_DWORD /d 0 /f
REM ϵͳ-Windows Defender-��ֹSmartScreen ��Ӧ�ú��ļ���鹦��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\SmartScreen" /v ConfigureAppInstallControl /t REG_DWORD /d 0 /f
REM ϵͳ-Windows Defender-����W��ֹindowsӦ�ó���������Web������������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f
REM ϵͳ-Windows Defender-�ر�Windows Defender
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v "ForceUpdateFromMU" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableBlockAtFirstSeen" /t reg_dword /d 1 /f
REM ϵͳ-Windows Defender-Windows 10 ����߰汾�ر�Windows Defender
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" /v CheckForSignaturesBeforeRunningScan /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableSpecialRunningModes" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "AllowFastServiceStartup" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /v "DisableBehaviorMonitoring" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /v "DisableScanOnRealtimeEnable" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /v "DisableScriptScanning" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableArchiveScanning /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableEmailScanning /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRemovableDriveScanning /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v AvgCPULoadFactor /t REG_DWORD /d 1 /f
REM ϵͳ-Windows Defender-Windows 7/8/8.1�ر�Windows Defender
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableSpecialRunningModes" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
REM ϵͳ-Windows Defender-����Windows Defender ��ȫ���ķ���
reg add "HKLM\SYSTEM\ControlSet001\Services\SecurityHealthService" /v "Start" /t reg_dword /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t reg_dword /d 4 /f
sc config WinDefend start= disabled

REM ϵͳ-����-�ر�Windowsink
reg add "HKLM\Software\Microsoft\Windows\WindowsInkWorkspace" /v "AllowWindowsInkWorkspace" /t reg_dword /d 0 /f
REM ϵͳ-����-�ر�С��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortanaAboveLock /t REG_DWORD /d 0 /f
REM ϵͳ-����-�ر�cortona
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /d 0 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "SettingsVersion" /d 3 /t REG_DWORD /f
REM ϵͳ-����-�ر��¼����ٳ���
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability" /v "ShutdownReasonOn" /d 0 /t REG_DWORD /f
REM ϵͳ-����-���� Microsoft Store ��̨����Ӧ�ó���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.WindowsStore_8wekyb3d8bbwe" /v "Disabled" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.WindowsStore_8wekyb3d8bbwe" /v "DisabledByUser" /t reg_dword /d 1 /f
REM ϵͳ-����-���ô洢��֪����
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\StorageSense" /v StorageSense /t REG_DWORD /d 0 /f
REM ϵͳ-����-���ô洢��֪����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "fAllowToGetHelp" /t reg_dword /d 0 /f
REM ϵͳ-����-����������ϵͳ�е� SmartScreen ����
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /d 0 /f
REM ϵͳ-����-����WfpDiag.ETL��־��by powerxing04��
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BFE\Parameters\Policy\Options" /v "CollectNetEvents" /t reg_dword /d 0 /f
REM ϵͳ-����-ȡ�������˺ŵ�¼��־����
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ReportBootOk" /t reg_dword /d 1 /f
REM ϵͳ-����-����ʱд�������Ϣ
reg add "HKLM\SYSTEM\CurrentControlSet\Control\CrashControl" /v "CrashDumpEnabled" /t reg_dword /d 3 /f
REM ϵͳ-����-����������ݹ���
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide" /v "DisableComponentBackups" /t reg_dword /d 1 /f
REM ϵͳ-����-�������������־
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableLog" /t reg_dword /d 0 /f
REM ϵͳ-����-���ø��½�ѹģ��DPX��־
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing" /v "EnableDpxLog" /t reg_dword /d 0 /f
REM ϵͳ-����-����ϵͳ��־��by Windows 10�Ż��������ߣ�
reg add "HKCU\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t reg_dword /d 0 /f
REM ϵͳ-����-VHD����ʱ��Ҫ��VHD��̬�ļ���չ������Խ�ʡ�ռ䣩
reg add "HKLM\SYSTEM\CurrentControlSet\services\FsDepends\Parameters" /v "VirtualDiskExpandOnMount" /t reg_dword /d 4 /f
REM ϵͳ-����-�رա��Ľ���д�ʼ�����롹�趨
reg add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t "Reg_Dword" /d "0" /f
REM ϵͳ-����-�رա��ʼ��������˻����趨
reg add "HKLM\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t "Reg_Dword" /d "0" /f
REM ϵͳ-����-������Ϸ¼�ƹ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t reg_dword /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t reg_dword /d 0 /f
REM ϵͳ-����-�رա���������Ϸʱ�ں�̨¼�ơ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t reg_dword /d 0 /f
REM ϵͳ-����-�رճ������������
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /d 1 /t REG_DWORD /f
REM ϵͳ-����-��½���軬�����Դ��������Ѻ�
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreen" /t REG_DWORD /d 1 /f

REM ϵͳ-����-�ر�win10�����û��л�����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "HideFastUserSwitching" /t reg_dword /d 1 /f
REM ϵͳ-����-��¼windows�������ּ�
reg add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t "REG_SZ" /d "2" /f
reg add "HKU\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t reg_sz /d "2" /f
REM ϵͳ-����-NTFS�ļ��Ż�
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager" /v "NtfsDisableLastAccessUpdate" /d 1 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "NtfsDisableLastAccessUpdate" /d 1 /t reg_dword /f
REM ϵͳ-����-ϵͳ�����޸�ʱ��
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager" /v "AutoChkTimeout" /d 5 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "AutoChkTimeout" /d 5 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /d 1 /t reg_dword /f
REM ϵͳ-����-�Ż�Ӳ�����ݴ洢
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout" /v "EnableAutoLayout" /d 1 /t reg_dword /f
REM ϵͳ-����-�ر�win10ϵͳԤ���ռ�
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t reg_dword /d 0 /f
REM ϵͳ-����-����Win10��·��
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t reg_dword /d 1 /f
REM ϵͳ-����-���������Ż�����
reg add "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" /v "OptimizeComplete" /t reg_dword /d 0 /f
REM ϵͳ-����-�������Զ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /d 221 /t REG_DWORD /f
REM ϵͳ-����-�ر�win10��windows����Ĭ�ϴ�ӡ��
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows" /v "LegacyDefaultPrinterMode" /t reg_dword /d 1 /f
REM ϵͳ-����-�޸ġ��������վ�е��ļ����ڳ�������ʱ�����뽫��ɾ����ѡ��޸�Ϊ���Ӳ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\BitBucket" /v NukeOnDelete /t REG_DWORD /d 0 /f

REM ϵͳ-����-�رճ���Ԥ�� Superfetch
sc config SysMain start= disabled
sc stop SysMain
REM ϵͳ-����-�ر�ϵͳԤ�� Prefetch
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
REM ϵͳ-����-��ֹ���ѽ���ϵͳ��Ϸ���
sc stop WdiSystemHost
sc stop WdiServiceHost
sc stop DPS
sc config DPS start= disabled
sc config WdiServiceHost start= disabled
sc config WdiSystemHost start= disabled
REM ϵͳ-����-���ó������������
net stop PcaSvc
sc config PcaSvc start=disabled
REM ϵͳ-����-����Զ���޸�ע���
net stop RemoteRegistry
sc config RemoteRegistry start=disabled
REM ϵͳ-����-������Ϸ���
net stop DPS
sc config DPS start=disabled
REM ϵͳ-����-����IPv6ת������
net start iphlpsvc
sc config iphlpsvc start= auto
REM ϵͳ-����-����Windows Search
net start WSearch
sc config WSearch start= auto
REM ϵͳ-����-���ô��󱨸�
net stop WerSvc
sc config WerSvc start=disabled
REM ϵͳ-����-���ü�ͥ��
net stop HomeGroupProvider
sc config HomeGroupProvider start=disabled
REM ϵͳ-����-�ֶ�NTFS���Ӹ��ٷ���
net stop TrkWks
sc config TrkWks start=demand
REM ϵͳ-����-���÷���ǽ����
net stop MpsSvc
sc config MpsSvc start=disabled
REM ϵͳ-����-���ñ��ݷ���
net stop SDRSVC
sc config SDRSVC start=disabled
REM ϵͳ-����-����AppReadiness
net stop AppReadiness
sc config AppReadiness start=disabled
REM ϵͳ-����-����RemoteRegistry
net stop RemoteRegistry
sc config RemoteRegistry start=disabled
REM ϵͳ-����-����Windows To Go
net stop WTGService
sc config WTGService start= disabled
REM ϵͳ-����-����LPD��ӡ����
net start lpdsvc
sc config lpdsvc start= auto

REM ϵͳ-��ʽ����-ɾ��FTP��ע�����
Reg Delete "HKCR\ftp\shell\open\command" /f
REM ϵͳ-��ʽ����-��������FTP��Ĭ�ϴ򿪷�ʽΪWindows��Դ������
reg add "HKCR\ftp\shell\open\command" /ve /d "explorer.exe %1" /f
REM ϵͳ-��ʽ����-�ļ�û�й����Ĵ򿪳���ʱ����ֹ��������ȥ����������
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoInternetOpenWith" /t reg_dword /d 1 /f
REM ϵͳ-��ʽ����-�رմ򿪷�ʽ��Ӧ���̵�ѡ������Ӧ��
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t reg_dword /d 1 /f

REM ϵͳ-Զ��-����Զ��Э��
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t reg_dword /d 1 /f
REM ϵͳ-Զ��-����Զ����������
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t reg_dword /d 0 /f
REM ϵͳ-Զ��-��ֹԶ���޸�ע���
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteAccess" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /t reg_dword /d 0 /f
REM ϵͳ-Զ��-����Զ������Ự�еĿͻ��˴�ӡ������ΪĬ�ϴ�ӡ��
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fForceClientLptDef" /t reg_dword /d 1 /f
REM ϵͳ-Զ��-����RPC����˽������֤
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Print" /v "RpcAuthnLevelPrivacyEnabled" /t reg_dword /d 0 /f
REM ϵͳ-Զ��-���ÿͻ��˴�ӡ���ض���
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCpm" /t reg_dword /d 1 /f
REM ϵͳ-Զ��-����Զ��������������ʹ��TCP����
reg add "HKCU\Software\Microsoft\Terminal Server Client" /v "TlsReauthe" /t REG_DWORD /d 0 /f
REM ϵͳ-Զ��-���������ٶ�ΪLAN��10 Mbps����ߣ�
reg add "HKCU\Software\Microsoft\Terminal Server Client" /v "ConnectionBandwidth" /t REG_DWORD /d 1 /f
REM ϵͳ-Զ��-�����ն˷���ͻ��˵���������ʾ����ʹ����������Զ������Ự��ʼ�տɼ���
reg add "HKCU\Software\Microsoft\Terminal Server Client" /v "ConnectionBarShow" /t REG_DWORD /d 1 /f
REM ϵͳ-Զ��-�����ն˷���ͻ��˵�������״̬Ϊʼ����ʾ�����������û���ʹ��Զ������ʱ���õع��������ӡ�
reg add "HKCU\Software\Microsoft\Terminal Server Client" /v "ConnectionBarStatus" /t REG_DWORD /d 1 /f
REM ϵͳ-Զ��-�����ն˷���ͻ��˵��������̶����ܡ�
reg add "HKCU\Software\Microsoft\Terminal Server Client" /v "PinConnectionBar" /t REG_DWORD /d 1 /f

REM ϵͳ-ϵͳ����-�Զ���װ���������ĸ���
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutoInstallMinorUpdates" /t reg_dword /d 1 /f
REM ϵͳ-ϵͳ����-���¹���ʱ������û���¼���Զ����������
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t reg_dword /d 1 /f
REM ϵͳ-ϵͳ����-win10��ֹ���´���1809�汾
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetReleaseVersion" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetReleaseVersionInfo" /t reg_sz /d 1809 /f
REM ϵͳ-ϵͳ����-��ֹ Windows ������ʾ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableOSUpgrade /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v DisableWindowsUpdateAccess /t REG_DWORD /d 1 /f
REM ϵͳ-ϵͳ����-Windows 7 ������ʾ������ Windows 10
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\OSUpgrade" /v ReservationsAllowed /t REG_DWORD /d 0 /f
REM ϵͳ-ϵͳ����-ֹͣWindows Update����
sc stop wuauserv
sc config wuauserv start= disabled
REM ϵͳ-ϵͳ����-ɾ�� Windows 10 ������صļƻ�����
schtasks /Change /TN "\Microsoft\Windows\WindowsUpdate\*" /DISABLE
schtasks /delete /tn "\Microsoft\Windows\WindowsUpdate\*" /f
REM ϵͳ-ϵͳ����-��ֹ���ӵ� Windows Update �Ļ�����λ��
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t reg_dword /d 1 /f
REM ϵͳ-ϵͳ����-�����Զ�����
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t reg_dword /d 1 /f
REM ϵͳ-ϵͳ����-����windows���·���
sc config WaaSMedicSvc start= disabled 2>nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc " /v "start" /t reg_dword /d "4" /f
REM ϵͳ-ϵͳ����-����Windows 10��������GWX
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Gwx" /v "DisableGwx" /t reg_dword /d 1 /f
REM ϵͳ-ϵͳ����-Windows To Go���(�ر��������汾����)
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "PortableOperatingSystem" /t reg_dword /d 1 /f
REM ϵͳ-ϵͳ����-Windows���²������������ɾ������
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t reg_dword /d 1 /f
REM ϵͳ-ϵͳ����-��Windows Update�Զ����µ���Ϊ�Ӳ����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "AUOptions" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t reg_dword /d 0 /f

REM ϵͳ-��ȫ����-�ر�Ĭ�Ϲ���(��ֹ $C $D,��ֹ $Admin)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v "AutoShareServer" /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v "AutoShareWks" /t reg_dword /d 0 /f
REM ϵͳ-��ȫ����-�������乲��
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "forceguest" /t reg_dword /d 0 /f
REM ϵͳ-��ȫ����-�ر��Զ����µ�ͼ
reg add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d 0 /f
REM ϵͳ-��ȫ����-��ֹҪ���� Ctrl+Alt+Del ����¼
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableCAD /t REG_DWORD /d 1 /f
REM ϵͳ-��ȫ����-δ��¼�ɹػ�
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ShutdownWithoutLogon" /t REG_DWORD /d 1 /f
REM ϵͳ-��ȫ����-���ùر�ԭ��
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "EnableReasonUI" /t REG_DWORD /d 0 /f

REM ϵͳ-��ȫ����-���ø����������
net accounts /maxpwage:unlimited /minpwlen:0 /minpwage:0 /uniquepw:0
REM ϵͳ-��ȫ����-���û�����������Ч������Ϊ��������
net accounts /maxpwage:unlimited
wmic UserAccount where Name='administrator' set PasswordExpires=False
REM ϵͳ-��ȫ����-�ڱ��ؼ����������������ȫ�ķÿ������֤��64λϵͳ��
reg add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "AllowInsecureGuestAuth" /d 1 /t reg_dword /f
REM ϵͳ-��ȫ����-�ڱ��ؼ����������������ȫ�ķÿ������֤��32λϵͳ��
reg add "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows\LanmanWorkstation" /v "AllowInsecureGuestAuth" /d 1 /t reg_dword /f
REM ϵͳ-��ȫ����-�����������������ص��ļ��ڴ�ʱ������ֹ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d 0 /f
REM ϵͳ-��ȫ����-��ֹ���м�����Զ�ά���ƻ�
reg add "HKLM\Software\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t reg_dword /d 0 /f
REM ϵͳ-��ȫ����-����ֱ���������������exebat
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /t reg_sz /d ".bat;.exe;.reg;.vbs;.chm;.msi;.js;.cmd;.zip;.rar;.7z" /f
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "ModRiskFileTypes" /t reg_sz /d ".bat;.exe;.reg;.vbs;.chm;.msi;.js;.cmd;.zip;.rar;.7z" /f

REM ϵͳ-��ȫ����- �رշ���ǽ
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v "EnableFirewall" /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\PublicProfile" /v "EnableFirewall" /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\DomainProfile" /v "EnableFirewall" /t reg_dword /d 0 /f
goto :eof

:better_jm
REM ����-��������-��������ʱ
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t reg_sz /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaverIsSecure" /t reg_sz /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveTimeOut" /t reg_sz /d "180" /f
REM ����-��������-����������Ļʱ�Զ������Ĵ�������
reg add "HKLM\SOFTWARE\Microsoft\TabletTip\1.7" /v "DisableNewKeyboardExperience" /t REG_DWORD /d 1 /f
REM ����-��������-�ر��״ε�¼����
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "EnableFirstLogonAnimation" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableFirstLogonAnimation" /t reg_dword /d 0 /f

REM ����-������-����������ռ��ʱ��ռ��ʱ�ϲ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t reg_dword /d 1 /f
REM ����-������-����������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t reg_dword /d 0 /f
REM ����-������-������ʹ��Сͼ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t reg_dword /d 1 /f
REM ����-������-ʼ����ʾ�˵���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AlwaysShowMenus" /t reg_dword /d 1 /f
REM ����-������-�����������رա���С������󻯴��ڵĶ���
reg add "HKCU\Control Panel\Desktop" /v "Animation" /t REG_SZ /d "0" /f
REM ����-������-����Cortana��ť��ʾ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /d 0 /t reg_dword /f
REM ����-������-ȷ����������������Ч����Ĭ��Ӧ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v TaskbarAnimations /t REG_DWORD /d 0 /f
REM ����-������-��������������Ч��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f
REM ����-������-�������е�Cortana����Ϊ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
REM ����-������-���������ر�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f
REM ����-������-����������������
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "HidePeopleBar" /t reg_dword /d 1 /f
REM ����-������-��ť��ʾͼ����ı�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /d 0 /t REG_DWORD /f
REM ����-������-��Ļ���̲���������
reg add "HKCU\Software\Microsoft\TabletTip\1.7" /v "EnableDesktopModeAutoInvoke" /t REG_DWORD /d 0 /f
REM ����-������-��֪ͨ������ʾ����ϵͳͼ���֪ͨ��ע���Ƿ���е������֣�
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t "Reg_Dword" /d "1" /f
REM ����-������-�������½�Windows ������������֪ͨͼ��
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t reg_dword /d 0 /f
REM ����-������-��Դ������������С��ʱ��ʾ����·��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" /v "FullPath" /t reg_dword /d 1 /f
REM ����-������-ʹ��������͸��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseOLEDTaskbarTransparency" /t reg_dword /d 1 /f
REM ����-������-ȡ��������ʱ�Ӿ�ȷ����
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSecondsInSystemClock" /t reg_dword /d 0 /f
REM ����-������-����ĳЩSATAӲ��������ͼ��
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvata" /v "DisableRemovable" /t reg_dword /d 1 /f
REM ����-������-������-�����������ص�������
reg add "HKCU\Software\Microsoft\CTF\MSUTB" /v "ShowDeskBand" /t REG_DWORD /d 1 /f
REM ����-������-������-ȡ���������ϵİ�����ť
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d 4 /f
REM ����-������-������-����С��ʱ����ʾ�������ϵĶ���ͼ��
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d 0 /f
REM ����-������-������-�����������Ľ�������Ϊ3
reg add "HKCU\Software\Microsoft\CTF\LangBar\ItemState{ED9D5450-EBE6-4255-8289-F8A31E687228}" /v "DemoteLevel" /t REG_DWORD /d 3 /f

REM ����-��ʼ�˵�-���ÿ�ʼ�˵��е����ʹ�õĳ����б�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 0 /f
REM ����-��ʼ�˵�-�رտ�ʼ��Ļ�Զ���ʾ"Ӧ��"��ͼ
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v ShowAppsViewOnStart /d 0 /t REG_DWORD /f
REM ����-��ʼ�˵�-��������ȡ���̶���ѡ��
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "LockedStartLayout" /d 0 /t reg_dword /f
reg add "HKLM\Software\Wow6432Node\Policies\Microsoft\Windows\Explorer" /v "LockedStartLayout" /d 0 /t reg_dword /f
REM ����-��ʼ�˵�-ɾ�����д������û��˳�ʱ������д���
reg add "HKCU\Software\Policies\Microsoft\Windows" /v "ClearTilesOnExit" /t reg_dword /d 1 /f
REM ����-��ʼ�˵�-�رա�ͻ����ʾ�°�װ�ĳ���
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_NotifyNewApps" /t reg_dword /d 0 /f
REM ����-��ʼ�˵�-�����Ƽ���Ŀ�������ͼ��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\10" /v ShellExecute /t REG_SZ /d "control.exe" /f

REM ����-�����뱳��-���ô��ڶ�̬Ч��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisablePreviewDesktop /t REG_DWORD /d 1 /f
REM ����-�����뱳��-�رո߼���������
reg add "HKCU\Control Panel\Desktop" /v "Win8DpiScaling" /t reg_dword /d 0 /f
REM ����-�����뱳��-�������� Windows �����޸�Ӧ��
reg add "HKCU\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t reg_dword /d 1 /f
REM ����-�����뱳��-�����˵���ʾ�ٶ�Ϊ0���룬ʵ�ּ��㼴����Ч��
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t "Reg_Sz" /d "0" /f
REM ����-�����뱳��-���ô��ڳ�խ�߿�
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "PaddedBorderWidth" /d "-15" /t REG_SZ /f
REM ����-�����뱳��-������ʼ�˵������������������ĺͱ���������ɫ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t reg_dword /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v "ColorPrevalence" /t reg_dword /d 1 /f
REM ����-�����뱳��-������ʼ�˵�������������������͸��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_ShowGlass /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProximity /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t reg_dword /d 1 /f
REM ����-�����뱳��-�����ͣ��UIԪ���ϵ��ӳ�ʱ������Ϊ0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /d 0 /t reg_dword /f
REM ����-�����뱳��-������Ԥ�����ڵ���ͣʱ������Ϊ0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DesktopLivePreviewHoverTime" /d 0 /t reg_dword /f
REM ����-�����뱳��-���ô���������ӰЧ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /d 0 /t REG_DWORD /f
REM ����-�����뱳��-�������ָ����ӰЧ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /d 0 /t REG_DWORD /f
REM ����-�����뱳��-�����б���ͼ�еİ�͸��ѡ��Ч��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /d 0 /t REG_DWORD /f
REM ����-�����뱳��-�����Ӿ�Ч������Ϊ����ģʽ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /d 3 /t REG_DWORD /f
REM ����-�����뱳��-�����϶�����ʱȫ����ʾ
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /d 0 /t REG_SZ /f
REM ����-�����뱳��-���õ�ǰ�û������û���ѡ������Ϊ 9c32038012000000
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /d "9c32038012000000" /t REG_BINARY /f
REM ����-�����뱳��-���õ�ǰ�û�����Դ�������û���ѡ������Ϊ 9c32038012000000
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "UserPreferencesMask" /d "9c32038012000000" /t REG_BINARY /f
REM ����-�����뱳��-����-�����뱳��-��������ƽ����
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /d 2 /t REG_SZ /f
REM ����-�����뱳��-���ô�����С�������ʱ�Ķ���Ч��
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 0 /t REG_SZ /f
REM ����-�����뱳��-�����б���ͼ�е���ӰЧ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /d 1 /t REG_DWORD /f
REM ����-�����뱳��-�������洰�ڹ���������ϲ���
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /d 1 /t REG_DWORD /f
REM ����-�����뱳��-����ʼ����������ͼ
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /d 0 /t REG_DWORD /f
REM ����-�����뱳��-����Aero Peek����
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /d 1 /t REG_DWORD /f
REM ����-�����뱳��-����ϵͳ�Ľ��û�����
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /d 0 /t REG_DWORD /f
REM ����-�����뱳��-���������ͣʱ��Ϊ100���룬�������꽻������Ӧ�ٶ�
reg add "HKCU\Control Panel\Desktop" /v "ForegroundLockTimeout" /d 0 /t REG_SZ /f
REM ����-�����뱳��-���������ͣʱ��Ϊ100���룬��ʹ����Ԫ�ؿ�����Ӧ������
reg add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /d 100 /t REG_SZ /f
REM ����-�����뱳��-��ʾ��������Ϊ100%(124%ֵΪ119,100%ֵΪ96)
reg add "HKCU\Control Panel\Desktop" /v "LogPixels" /t reg_dword /d 96 /f
REM ����-�����뱳��-��������ͼ���Զ����й��ܡ��Զ��������硢����������
reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "FFlags" /t REG_DWORD /d 1075839524 /f

REM ����-��Դ������-���ٴ�����󻯺���С���Ķ���ʱ��
reg add "HKCU\Control Panel\Desktop" /v "AnimateWindows" /t REG_SZ /d "0" /f
REM ����-��Դ������-���ء���ǰ�İ汾����ǩ
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v ShowPreviousVersions /t REG_DWORD /d 0 /f
REM ����-��Դ������-ɾ�����˵��ԡ��Ҳ�ϵͳ�̷��Ϸ����ļ�����Ƶ
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a}" /f
REM ����-��Դ������-ɾ�����˵��ԡ��Ҳ�ϵͳ�̷��Ϸ����ļ�������
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de}" /f
REM ����-��Դ������-ɾ�����˵��ԡ��Ҳ�ϵͳ�̷��Ϸ����ļ���ͼƬ
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}" /f
REM ����-��Դ������-ɾ�����˵��ԡ��Ҳ�ϵͳ�̷��Ϸ����ļ���3D����
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
REM ����-��Դ������-ɾ�����˵��ԡ����������ļ�����Ƶ
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{35286a68-3c57-41a1-bbb1-0eae73d76c95}" /f
REM ����-��Դ������-ɾ�����˵��ԡ����������ļ�������
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{1cf1260c-4dd0-4ebb-811f-33c572699fde}" /f
REM ����-��Դ������-ɾ�����˵��ԡ����������ļ���ͼƬ
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{24ad3ad4-a569-4530-98e1-ab02f9417aa8}" /f
REM ����-��Դ������-ɾ�����˵��ԡ����������ļ���3D����
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
REM ����-��Դ������-�������ڶ�������ʱ�䣺
reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundLockTimeout /t REG_DWORD /d 0 /f
REM ����-��Դ������-���ļ���Դ������ʱ�򿪴˵���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /d 1 /t REG_DWORD /f
REM ����-��Դ������-ɾ����Դ�����������ļ���
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
REM ����-��Դ������-ɾ����Դ��������Ƶ�ļ���
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
REM ����-��Դ������-������Windows��Դ����������ʾ������Ŀ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t reg_dword /d 0 /f
REM ����-��Դ������-������Windows��Դ����������ʾ���ʹ�õ���Ŀ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t reg_dword /d 0 /f
REM ����-��Դ������-�Ż�Windows�ļ��б�ˢ�²��ԣ��ļ����ֹ�1�Զ�0ˢ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSimpleNetIDList" /d 0 /t REG_DWORD /f
REM ����-��Դ������-������Դ������������
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Ribbon" /v "MinimizedStateTabletModeOff" /t reg_dword /d 1 /f
REM ����-��Դ������-�ر���ʾ�����ļ���չ��
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t reg_dword /d 1 /f
REM ����-��Դ������-�ر���ʾ���������ļ�
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t reg_dword /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t reg_dword /d 0 /f

REM ����-Ӧ�ó���-���ٵȴ�Ӧ�ó���δ��Ӧ�ĵȴ�ʱ��
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t reg_sz /d 3000 /f
REM ����-Ӧ�ó���-����Ӧ�ó���رյĵȴ�ʱ��
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t reg_sz /d 10000 /f

REM ����-����-��ʾ"�ҵĵ���"ͼ��
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t reg_dword /d 0 /f
REM ����-����-��ʾ"�ҵ��ĵ�"ͼ��
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t reg_dword /d 0 /f
REM ����-����-��ʾ"�����ھ�"ͼ��
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t reg_dword /d 0 /f
REM ����-����-��ʾ"����վ"ͼ��
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t reg_dword /d 0 /f
REM ����-����-��ʾ"�������"ͼ��
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t reg_dword /d 0 /f
REM ����-����-�ر���������ʾ��
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{031E4825-7B94-4dc3-B131-E946B44C8DD5}" /t reg_dword /d 1 /f
REM ����-����-ɾ��������ļ���
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5} /f
REM ����-����-�Ӵ�����ͼ�껺��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t reg_sz /d 2048 /f
REM ����-����-��ݷ�ʽ����ӿ�ݷ�ʽ������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /t REG_BINARY /d 00000000 /f
REM ����-����-�����ֽ��������Ϊ
reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t reg_dword /d 256 /f
REM ����-����-"�ҵĵ���"�����豸������
reg add "HKCR\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\DeviceManager" /ve /d "�豸������" /f
reg add "HKCR\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\DeviceManager\command" /ve /d "devmgmt.msc" /f

REM ����-�Ҽ��˵�-�����Ҽ��˵�������ΪWindows 7ģʽ��by Silence��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\FlightedFeatures" /v "ImmersiveContextMenu" /t reg_dword /d 0 /f
REM ����-�Ҽ��˵�-ȥ���Ҽ����Խ������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSecurityTab" /t REG_DWORD /d 1 /f
REM ����-�Ҽ��˵�-�����Ҽ��˵��Ķ���Ч��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /d 0 /t reg_dword /f
REM ����-�Ҽ��˵�-����Win11��������Ҽ��˵���Ĭ����ʾ����ѡ��
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /v "ThreadingModel" /t REG_SZ /d "" /f
goto :eof

:better_llq
REM ���-�����-IE-��ǿ-ɾ������IE�����
reg delete "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /f
reg delete "HKLM\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /f
REM ���-�����-IE-��ǿ-���IE�����
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /ve /d "Internet Explorer" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\DefaultIcon" /ve /d "%IE_Path32%,-32528" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\NoAddOns" /ve /d "��û�м���������������(&N)" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\NoAddOns\Command" /ve /d "%IE_Path32% about:NoAdd-ons" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open" /ve /d "����ҳ(&H)" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open\Command" /ve /d "%IE_Path32%" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open\Command" /ve /t reg_sz /d "%IE_Path32%" /f
if "%bit%"=="64" reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open64" /ve /t reg_sz /d "����64λIE(&E)" /f
if "%bit%"=="64" reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open64\Command" /ve /t reg_sz /d "%IE_Path64%" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Alank" /ve /t reg_sz /d "�򿪿հ�ҳ(&B)" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Alank\Command" /ve /t reg_sz /d "\"%IE_Path32%\" about:blank" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Set" /ve /d "����(&R)" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Set\Command" /ve /d "Rundll32.exe Shell32.dll,Control_RunDLL Inetcpl.cpl" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\ShellFolder" /v "Attributes" /t REG_DWORD /d 0x00000030 /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /ve /d "Internet Explorer" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\DefaultIcon" /ve /d "%IE_Path32%,-32528" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\NoAddOns" /ve /d "��û�м���������������(&N)" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\NoAddOns\Command" /ve /d "%IE_Path32% about:NoAdd-ons" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open" /ve /d "����ҳ(&H)" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open\Command" /ve /d "%IE_Path32%" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Set" /ve /d "����(&R)" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Set\Command" /ve /d "Rundll32.exe Shell32.dll,Control_RunDLL Inetcpl.cpl" /f
reg add "HKLM\SOFTWARE\Classes\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\ShellFolder" /v "Attributes" /t REG_DWORD /d 0x00000030 /f
REM ���-�����-IE-��ǿ-ע�������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /ve /d "Internet Explorer" /f
REM ���-�����-IE-��ǿ-�������IE��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}" /ve /d "Internet Explorer" /f
call :better_llq_kj
REM ���-�����-IE-�ؼ�-�� IE �д� ActiveX �ؼ���־��¼
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v AuditModeEnabled /t REG_DWORD /d 1 /f
REM ���-�����-IE-�ؼ�-ɾ��IE �й�ʱ�� ActiveX �ؼ���������а�ť
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v RunThisTimeEnabled /t REG_DWORD /d 0 /f
REM ���-�����-IE-�ؼ�-ɾ��IE �н��õ� ActiveX �ؼ�
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Ext\Settings" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Ext\Settings" /f
REM ���-�����-IE-�ؼ�-�������б���ֹ�Ĺ�ʱ ActiveX �ؼ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "VersionCheckEnabled" /t REG_DWORD /d 0 /f
REM ���-�����-IE-�ؼ�-�������н��õ� ActiveX �ؼ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "NoExtOff" /t REG_DWORD /d 0 /f
REM ���-�����-IE-�ؼ�-ɾ��IE�Ĺ���ActiveX�ؼ���ֹ֪ͨ�еġ����¡���ť
reg add "HKCU\Software\Microsoft\Internet Explorer\VersionManager" /v UpdateEnabled /t REG_DWORD /d 0 /f
REM ���-�����-IE-�ؼ�-�Զ�����IE�°�װ�ļ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "IgnoreFrameApprovalCheck" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "IgnoreFrameApprovalCheck" /t reg_dword /d 1 /f

REM ���-�����-IE-����-��ʾ�˵���
reg add "HKCU\Software\Microsoft\Internet Explorer\Toolbar" /v ITBarLayout /t REG_SZ /d "1" /f
REM ���-�����-IE-����-��ʾ�ղؼ���
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v Show_Favoritesbar /t REG_DWORD /d 1 /f
REM ���-�����-IE-����-��ʾ״̬��
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v StatusBarWeb /t REG_DWORD /d 1 /f
REM ���-�����-IE-����-����һ����ʾ��ǩ
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v TabProcGrowth /t REG_DWORD /d 0 /f
REM ���-�����-IE-����-ȥ��IE�ұߵ�Ц��
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /v "NoHelpItemSendFeedback" /t reg_dword /d "1" /f
REM ���-�����-IE-����-ȥ��IE�������ϵĶ�������
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Window Title" /t REG_SZ /d "" /f
REM ���-�����-IE-����-��ʾͼƬ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Display Inline Images" /t REG_SZ /d "yes" /f
REM ���-�����-IE-����-�����ڶ�һ����ʾ��ǩҳ
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v TabProcGrowth /t REG_DWORD /d 0 /f
REM ���-�����-IE-����-������������ʱʼ������ѡ��д򿪵�������
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "PopupsUseNewWindow" /t reg_dword /d 2 /f
REM ���-�����-IE-����-����Internet Explorer������
reg add "HKCU\Software\Microsoft\Internet Explorer\Toolbar" /v "Locked" /t reg_dword /d 1 /f

REM ���-�����-IE-����-������İ�ȫ���ü����¼�������ڰ�ȫ���ա�
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "IgnoreServerCertErrors" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v WarnOnZoneCrossing /t REG_DWORD /d 0 /f
REM ���-�����-IE-����-����IE���û�����ʱ�Զ��Ƽ��������ַ�ͱ���Ϣ
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\AutoComplete" /v "Append Completion" /t "Reg_Sz" /d "no" /f
REM ���-�����-IE-����-����IE���ڲ���վ����ģʽ��ȷ���ڷ����ڲ���վʱ�����Զ��л�������ģʽ��
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\BrowserEmulation" /v "IntranetCompatibilityMode" /t "Reg_Dword" /d "0" /f
REM ���-�����-IE-����-�ڼ�������ͼ����ʾ������վ
reg add "HKCU\Software\Microsoft\Internet Explorer\BrowserEmulation" /v "AllSitesCompatibilityMode" /t reg_dword /d 1 /f
REM ���-�����-IE-����-����IE�������֪ͨ����ֹ����֪ͨ������ʾ������ɡ�
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "NotifyDownloadComplete" /t "Reg_Sz" /d "no" /f
REM ���-�����-IE-����-����IEĬ������Ŀ¼Ϊ�û�����
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Default Download Directory" /t "Reg_Expand_SZ" /d "%USERPROFILE%\Desktop" /f
REM ���-�����-IE-����-�ر�IE��ȫ����
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnOnHTTPSToHTTPRedirect" /d 0 /t REG_DWORD /f
REM ���-�����-IE-����-ȡ���ر�������Զ������¼
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Privacy" /v "ClearBrowsingHistoryOnExit" /d "0" /t reg_dword /f
REM ���-�����-IE-����-����ʾ�ұ�������
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "FormSuggest PW Ask" /t REG_SZ /d "no" /f
REM ���-�����-IE-����-����ʾ����
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "FormSuggest Passwords" /t REG_SZ /d "no" /f
REM ���-�����-IE-����-��ʹ���Զ���ɹ���
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "Use FormSuggest" /t Reg_Sz /d "no" /f
REM ���-�����-IE-����-������ Internet Explorer �д����ӵķ�ʽ
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v AssociationActivationMode /t REG_DWORD /d 0 /f
REM ���-�����-IE-����-REM ����IE�Զ������ָ�
reg add "HKCU\Software\Microsoft\Internet Explorer\Recovery" /v AutoRecover /t REG_DWORD /d 2 /f
REM ���-�����-IE-����-����IE���ղ���֤��ʱ�ľ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnonBadCertRecving" /t reg_dword /d 0 /f
REM ���-�����-IE-����-ȡ��-��鷢���̵�֤���Ƿ��ѵ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing" /v "State" /t reg_dword /d 146944 /f
REM ���-�����-IE-����-����֤��������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CertificateRevocation" /t reg_dword /d 0 /f
REM ���-�����-IE-����-��ֹ����ִ���ļ���ǩ��
reg add "HKCU\Software\Microsoft\Internet Explorer\Download" /v "CheckExeSignatures" /t reg_sz /d "no" /f
REM ���-�����-IE-����-������ǿ����ģʽ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Isolation" /t reg_sz /d "PMIL" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Isolation64Bit" /t reg_sz /d "PMIL" /f
REM ���-�����-IE-����-���Ʊ�ǩҳ��Ϊ�������̵���Ϊ��
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "TabProcGrowth" /t reg_dword /d "1" /f
REM ���-�����-IE-����-����Internet Explorer�ڱ��ػ������ҵĵ��ԣ������л����
reg add "HKCU\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN" /v "iexplore.exe" /t reg_dword /d 0 /f
REM ���-�����-IE-����-ѡ��-��������CD�Ļ�������ҵĵ���������
reg add "HKCU\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN\Settings" /v "LOCALMACHINE_CD_UNLOCK" /t reg_dword /d 1 /f
REM ���-�����-IE-����-������Чǩ���������ļ�
reg add "HKCU\Software\Microsoft\Internet Explorer\Download" /v "RunInvalidSignatures" /t reg_dword /d 1 /f
REM ���-�����-IE-����-����IE�ĵ������ڹ�����
reg add "HKCU\Software\Microsoft\Internet Explorer\New Windows" /v "PopupMgr" /t reg_dword /d 0 /f
REM ���-�����-IE-����-����IE��TLS 1.2��TLS 1.0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "SecureProtocols" /t REG_DWORD /d 0x880 /f
REM ���-�����-IE-����-ȥ��IE��ȫ���÷�����ʾ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "NoProtectedModeBanner" /d 1 /t reg_dword /f
REM ���-�����-IE-����-�ر�IE����SmartScreenɸѡ��V8
reg add "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v "EnabledV8" /t reg_dword /d 0 /f
REM ���-�����-IE-����-�ر�IE����SmartScreenɸѡ��V9
reg add "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 0 /f
REM ���-�����-IE-����-����IEͬʱ���ض���ļ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d 10 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d 10 /f
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /d 10 /t reg_dword /f
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /d 10 /t reg_dword /f
REM ���-�����-IE-����-�ر�IE�����Զ������ָ�
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Recovery" /v "AutoRecover" /t reg_dword /d 0 /f
REM ���-�����-IE-����-����IE�ں�̨����վ����������Ż�����
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "UseSWRender" /t REG_DWORD /d 1 /f
REM ���-�����-IE-����-����IE��Ԥȡ��Ԥ��Ⱦ����
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\PrefetchPrerender" /v "Enabled" /t REG_DWORD /d 0 /f
REM ���-�����-IE-����-�ر��Զ�����
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "NoUpdateCheck" /t reg_dword /d 1 /f
REM ���-�����-IE-����-��ֹIE������Զ�����
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v "NoUpdateCheck" /t reg_sz /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v "NoUpdateCheck" /t reg_sz /d 1 /f
REM ���-�����-IE-����-���õ�ǰ�û���IE��ȫ���ü��
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
REM ���-�����-IE-����-���ñ��ؼ������IE��ȫ���ü��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
REM ���-�����-IE-����-�ڱ��ؼ�����Ͻ���IE���״���ʾ
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Security" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
REM ���-�����-IE-����-����ָ������Զ����IE��ȫ���ü��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Group Policy Objects\{C2D0B7D4-7CC5-40A6-AC4C-A25BA2637B18}Machine\Software\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
REM ���-�����-IE-����-���õ�ǰ�û���IE��չ��ȫ���ü��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
REM ���-�����-IE-����-���ñ��ؼ������IE��չ��ȫ���ü��
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
REM ���-�����-IE-����-�ڱ��ؼ�����Ͻ���IE��չ���״���ʾ
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
REM ���-�����-IE-����-��ָ������Զ����½���IE��չ���״���ʾ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Group Policy Objects\{C2D0B7D4-7CC5-40A6-AC4C-A25BA2637B18}Machine\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
REM ���-�����-IE-����-�ر�����վ��Ҫ���������֤(https:)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "Flags" /t reg_dword /d "67" /f
REM ���-�����-IE-����-IE��ֹ����������֪ͨ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableAddonLoadTimePerformanceNotifications" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableAddonLoadTimePerformanceNotifications" /t reg_dword /d 1 /f
REM ���-�����-IE-����-����IE�״������Զ�������
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceHasShown" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceComplete" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t reg_dword /d 1 /f
REM ���-�����-IE-����-�رս������վ
reg add "HKCU\Software\Microsoft\Internet Explorer\Suggested Sites" /v "Enabled" /t reg_dword /d 0 /f
REM ���-�����-IE-����-�����״���
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t reg_dword /d 1 /f
REM ���-�����-IE-����-����IE����ļ�����
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Check_Associations" /t REG_SZ /d "yes" /f
REM ���-�����-IE-����-�������´��ڻ��ǩҳ��ʼ����Internet Explorer�д�����
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v AlwaysOpenIEInNewWindow /t REG_DWORD /d 1 /f
REM ���-�����-IE-����-��������ѡ�ʱ��ʼ���л�����ѡ�
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "OpenInForeground" /t reg_dword /d 1 /f
REM ���-�����-IE-����-����IE���������������ӵ�ǰ���ڵ���ѡ�������
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "ShortcutBehavior" /t reg_dword /d 1 /f

REM ���-�����-IE-����-��ʽ����
assoc .htm=htmlfile
assoc .html=htmlfile
assoc .mht=htmlfile
assoc .mhtm=htmlfile
assoc .mhtml=htmlfile
assoc .url=htmlfile
assoc .website=htmlfile
assoc .xht=htmlfile
assoc .xhtml=htmlfile
assoc .http=htmlfile
assoc .https=htmlfile
ftype htmfile=%IE_type%
ftype htmlfile=%IE_type%
ftype mhtfile=%IE_type%
ftype mhtmfile=%IE_type%
ftype urlfile=%IE_type%
ftype httpfile=%IE_type%
ftype httpsfile=%IE_type%
REM ���-�����-IE-����-����Internet Explorer���Activities������
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v EnableIEActivities /t REG_DWORD /d 1 /f
REM ���-�����-IE-����-���õ�ǰ�û���HTTP���ӵ�Ĭ�������ѡ��ɾ�������ʶ��
reg delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" /v Progid /f
REM ���-�����-IE-����-���õ�ǰ�û���HTTP���ӵ�Ĭ�������ѡ��ɾ����ȫ��ϣ
reg delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" /v Hash /f
REM ���-�����-IE-����-���õ�ǰ�û���HTTPS���ӵ�Ĭ�������ѡ��ɾ�������ʶ��
reg delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" /v Progid /f
REM ���-�����-IE-����-���õ�ǰ�û���HTTPS���ӵ�Ĭ�������ѡ��ɾ����ȫ��ϣ
reg delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" /v Hash /f
REM ���-�����-IE-����-�޸�Ĭ���������ע����ֵΪIE
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" /v ProgId /d "Internet Explorer" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" /v ProgId /d "Internet Explorer" /f
REM ���-�����-IE-����-����Ĭ���������Ӧ��·��
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\DefaultIcon" /ve /d "%IE_Path32%,1" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\DefaultIcon" /ve /d "%IE_Path32%,1" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\DefaultIcon" /ve /d "%IE_Path32%,1" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\shell\open\command" /ve /d "%IE_Path32% -nohome" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\shell\open\command" /ve /d "%IE_Path32% -nohome" /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\shell\open\command" /ve /d "%IE_Path32% -nohome" /f
REM ���-�����-IE-����-����iexplore.exe��·��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\iexplore.exe" /ve /t REG_SZ /d "%IE_Path32%" /f

REM ���-�����-Edge-��ֹMicrosoft Edge���״����С���ӭҳ��
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge" /v "PreventFirstRunPage" /t reg_dword /d 0 /f
REM ���-�����-Edge-rem ����IE�Զ���ת��Edge�����
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v IE11DisableEdgeRedirect /t REG_DWORD /d 1 /f
REM ���-�����-Edge-����Edge�����
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AllowPrelaunch /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v DoNotUpdateToEdgeWithChromium /t REG_DWORD /d 1 /f
REM ���-�����-Edge-��ֹEdge��SmartScreen
reg add "HKCU\SOFTWARE\Microsoft\Edge\SmartScreenEnabled" /v "" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Edge\SmartScreenPuaEnabled" /v "" /t REG_DWORD /d 0 /f
REM ���-�����-Edge-�ر�Adobe Flash���㼴��
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Security" /v "FlashClickToRunMode" /t reg_dword /d 0 /f
REM ���-�����-Edge-����Microsoft Edge��V9�汾������վ������
reg add "HKCU\Software\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 0 /f

REM ���-�����-Chrome-ʹchrome֧��flash
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "AllowOutdatedPlugins" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "RunAllFlashInAllowMode" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "DefaultPluginsSetting" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "HardwareAccelerationModeEnabled" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium\PluginsAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKCU\SOFTWARE\Policies\Chromium\PluginsAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ���-�����-Chrome-����ǰѯ��ÿ���ļ��ı���λ��
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PromptForDownloadLocation" /t reg_dword /d 1 /f
REM ���-�����-Chrome-�������й�ʱ�Ĳ��
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AllowOutdatedPlugins" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "RunAllFlashInAllowMode" /t reg_dword /d 1 /f
REM ���-�����-Chrome-Ĭ��֪ͨ����
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultNotificationsSetting" /t reg_dword /d 1 /f
REM ���-�����-Chrome-Ĭ�ϵ�����������_����
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultPopupsSetting" /t reg_dword /d 1 /f
REM ���-�����-Chrome-��ֹ����߼������ƻ����û����������ݷ��͸� Google �������ɨ��
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AdvancedProtectionDeepScanningEnabled" /t reg_dword /d 0 /f
REM ���-�����-Chrome-��Google Chrome�رպ�������к�̨Ӧ��_�ر�
reg add "HKLM\Software\Policies\Google\Chrome\Recommended" /v "BackgroundModeEnabled" /t reg_dword /d 0 /f
REM ���-�����-Chrome-�ڹ���������ʾ"��ҳ"��ť
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ShowHomeButton" /t reg_dword /d 1 /f
REM ���-�����-Chrome-�رս� Google Chrome ��ΪĬ�������
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultBrowserSettingEnabled" /t reg_dword /d 0 /f
REM ���-�����-Chrome-Ĭ��JavaScript����_����
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultJavaScriptSetting" /t reg_dword /d 1 /f
REM ���-�����-Chrome-Ĭ��Flash����_����
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultPluginsSetting" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "HardwareAccelerationModeEnabled" /t reg_dword /d 1 /f
REM ���-�����-Chrome-����Щ��վ������������
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PopupsAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PopupsAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ���-�����-Chrome-����Щ��վ������Flash���
reg add "HKCU\SOFTWARE\Policies\Google\Chrome\PluginsAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKCU\SOFTWARE\Policies\Google\Chrome\PluginsAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PluginsAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PluginsAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
reg add "HKCU\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "1" /d "[*.]com" /t REG_SZ /f
reg add "HKCU\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "2" /d "[*.]net" /t REG_SZ /f
reg add "HKCU\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "3" /d "[*.]org" /t REG_SZ /f
reg add "HKCU\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "4" /d "[*.]cn" /t REG_SZ /f
reg add "HKCU\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "5" /d "[*.]cc" /t REG_SZ /f
reg add "HKLM\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "1" /d "[*.]com" /t REG_SZ /f
reg add "HKLM\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "2" /d "[*.]net" /t REG_SZ /f
reg add "HKLM\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "3" /d "[*.]org" /t REG_SZ /f
reg add "HKLM\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "4" /d "[*.]cn" /t REG_SZ /f
reg add "HKLM\Software\Policies\Google\Chrome\PluginsAllowedForUrls" /v "5" /d "[*.]cc" /t REG_SZ /f
REM ���-�����-Chrome-������Щ��վ�ϵĲ���ȫ����
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\InsecureContentAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\InsecureContentAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ���-�����-Chrome-����Щ��վ������JavaScript
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\JavaScriptAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\JavaScriptAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ���-�����-Chrome-��������Щվ����������Կ
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\KeygenAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\KeygenAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ���-�����-Chrome-����Щվ��������WebUSB
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\WebUsbAskForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\WebUsbAskForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ���-�����-Chrome-��ֹChrome��ӡҳü��ҳ��
reg add "HKCU\Software\Policies\Google\Chrome" /v "PrintHeaderFooter" /t REG_DWORD /d 0 /f
REM ���-�����-Chrome-����ChromeĬ�ϱ���ͼƬ��ӡģʽ
reg add "HKCU\Software\Policies\Google\Chrome" /v "PrintingBackgroundGraphicsDefault" /t REG_SZ /d "enabled" /f
call :better_llq%hs%
goto :eof

:better_llq_kj
set bl=0
call :better_llq_kj_set
goto :eof

:better_llq_kj_set
if "%bl%"=="5" goto :eof
set IE_Zones=HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\%bl%
echo ZONE%bl%
REM ��ȫ����12000=�ߡ�11500=��-�ߡ�11000���С�10500���е͡�10000���͡�0=�Զ���
reg add "%IE_Zones%" /v "CurrentLevel" /d "0" /t reg_dword /f
REM ������ǩ����ActiveX�ؼ�
reg add "%IE_Zones%" /v "1001" /d "0" /t reg_dword /f
REM ����δǩ����ActiveX�ؼ�
reg add "%IE_Zones%" /v "1004" /d "0" /t reg_dword /f
REM ���� ActiveX �ؼ��Ͳ��
reg add "%IE_Zones%" /v "1200" /d "0" /t reg_dword /f
REM ��û�б��Ϊ�ɰ�ȫִ�нű��� ActiveX �ؼ����г�ʼ���ͽű�����
reg add "%IE_Zones%" /v "1201" /d "0" /t reg_dword /f
REM ���� Microsoft ��ҳ������ؼ��Ľű�
reg add "%IE_Zones%" /v "1206" /d "0" /t reg_dword /f
REM ���� Internet Explorer Web ������ؼ��Ľű���д
reg add "%IE_Zones%" /v "1207" /d "0" /t reg_dword /f
REM ������ǰδʹ�õ� ActiveX �ؼ���û����ʾ�����������
reg add "%IE_Zones%" /v "1208" /d "0" /t reg_dword /f
REM ����ű�С����
reg add "%IE_Zones%" /v "1209" /d "0" /t reg_dword /f
REM ����ÿվ�㣨������ActiveX ����
reg add "%IE_Zones%" /v "120A" /d "0" /t reg_dword /f
REM ����ÿվ�㣨������ActiveX ����
reg add "%IE_Zones%" /v "120B" /d "3" /t reg_dword /f
REM δ֪
reg add "%IE_Zones%" /v "120C" /d "0" /t reg_dword /f
REM ��ű���д
reg add "%IE_Zones%" /v "1400" /d "0" /t reg_dword /f
REM Java С����ű���д
reg add "%IE_Zones%" /v "1402" /d "0" /t reg_dword /f
REM �Ա��Ϊ�ɰ�ȫִ�нű��� ActiveX �ؼ�ִ�нű�
reg add "%IE_Zones%" /v "1405" /d "0" /t reg_dword /f
REM �����������Դ
reg add "%IE_Zones%" /v "1406" /d "0" /t reg_dword /f
REM �����̼��������
reg add "%IE_Zones%" /v "1407" /d "0" /t reg_dword /f
REM δ֪
reg add "%IE_Zones%" /v "1408" /d "0" /t reg_dword /f
REM ���� XSS ɸѡ��
reg add "%IE_Zones%" /v "1409" /d "3" /t reg_dword /f
REM �ύδ���ܵı�����
reg add "%IE_Zones%" /v "1601" /d "0" /t reg_dword /f
REM ��������
reg add "%IE_Zones%" /v "1604" /d "0" /t reg_dword /f
REM ���� Java
reg add "%IE_Zones%" /v "1605" /d "0" /t reg_dword /f
REM �û����ݳ־���
reg add "%IE_Zones%" /v "1606" /d "0" /t reg_dword /f
REM ��������ӿ��
reg add "%IE_Zones%" /v "1607" /d "0" /t reg_dword /f
REM ���� META REFRESH
reg add "%IE_Zones%" /v "1608" /d "0" /t reg_dword /f
REM ��ʾ�������
reg add "%IE_Zones%" /v "1609" /d "0" /t reg_dword /f
REM �ڽ��ļ����ص�������ʱ��������Ŀ¼·��
reg add "%IE_Zones%" /v "160A" /d "0" /t reg_dword /f
REM ������Ŀ�İ�װ
reg add "%IE_Zones%" /v "1800" /d "0" /t reg_dword /f
REM �ϷŻ��ƺ�ճ���ļ�
reg add "%IE_Zones%" /v "1802" /d "0" /t reg_dword /f
REM �ļ�����
reg add "%IE_Zones%" /v "1803" /d "0" /t reg_dword /f
REM �� IFRAME ������������ļ�
reg add "%IE_Zones%" /v "1804" /d "0" /t reg_dword /f
REM �� Web ��ͼ������������ļ�
reg add "%IE_Zones%" /v "1805" /d "0" /t reg_dword /f
REM ����Ӧ�ó���Ͳ���ȫ�ļ�
reg add "%IE_Zones%" /v "1806" /d "0" /t reg_dword /f
REM ����Ӧ�ó���Ͳ���ȫ�ļ�
reg add "%IE_Zones%" /v "1807" /d "0" /t reg_dword /f
reg add "%IE_Zones%" /v "1808" /d "0" /t reg_dword /f
REM ʹ�õ���������ֹ����
reg add "%IE_Zones%" /v "1809" /d "3" /t reg_dword /f
reg add "%IE_Zones%" /v "1812" /d "0" /t reg_dword /f
REM ����
reg add "%IE_Zones%" /v "180A" /d "0" /t reg_dword /f
reg add "%IE_Zones%" /v "180B" /d "0" /t reg_dword /f
reg add "%IE_Zones%" /v "180C" /d "0" /t reg_dword /f
reg add "%IE_Zones%" /v "180D" /d "0" /t reg_dword /f
REM �û������֤����¼0=�����Զ� 10000=65536=��ʾ�û�����
reg add "%IE_Zones%" /v "1A00" /d "65536" /t reg_dword /f
REM ���������ϴ洢�ĳ־� cookie
reg add "%IE_Zones%" /v "1A02" /d "0" /t reg_dword /f
REM ����ÿ�Ự cookie
reg add "%IE_Zones%" /v "1A03" /d "0" /t reg_dword /f
REM ������û��֤���ֻ��һ��֤��ʱ����ʾ���пͻ�֤��ѡ��
reg add "%IE_Zones%" /v "1A04" /d "0" /t reg_dword /f
REM ����������־� cookie
reg add "%IE_Zones%" /v "1A05" /d "0" /t reg_dword /f
REM ����������Ự cookie
reg add "%IE_Zones%" /v "1A06" /d "0" /t reg_dword /f
REM ��˽����
reg add "%IE_Zones%" /v "1A10" /d "0" /t reg_dword /f
REM Java Ȩ��30000=7530 196608=�� 131072=�� 65536=�� 0=����
reg add "%IE_Zones%" /v "1C00" /d "196608" /t reg_dword /f
REM ���������Ƶ��Ȩ��30000=7530
reg add "%IE_Zones%" /v "1E05" /d "30000" /t reg_dword /f
REM ActiveX �ؼ��Ͳ���������ƺͽű���Ϊ
reg add "%IE_Zones%" /v "2000" /d "0" /t reg_dword /f
REM �������� Authenticode ǩ�������
reg add "%IE_Zones%" /v "2001" /d "0" /t reg_dword /f
REM ����δ�� Authenticode ǩ�������
reg add "%IE_Zones%" /v "2004" /d "0" /t reg_dword /f
reg add "%IE_Zones%" /v "2005" /d "0" /t reg_dword /f
REM �����嵥��Ȩ�޵����3�����á�10000���߰�ȫ��=65536
reg add "%IE_Zones%" /v "2007" /d "65536" /t reg_dword /f
REM �������ݴ��ļ��������ǻ����ļ���չ��
reg add "%IE_Zones%" /v "2100" /d "0" /t reg_dword /f
REM ���� �ڵ���Ȩ Web ���������е���վ���Ե�����������
reg add "%IE_Zones%" /v "2101" /d "0" /t reg_dword /f
REM �����ɽű���ʼ���Ĵ��ڣ�û�д�С��λ������
reg add "%IE_Zones%" /v "2102" /d "0" /t reg_dword /f
REM ����ͨ���ű�����״̬��
reg add "%IE_Zones%" /v "2103" /d "0" /t reg_dword /f
REM ������վ��û�е�ַ��״̬���Ĵ���
reg add "%IE_Zones%" /v "2104" /d "0" /t reg_dword /f
REM �ű���������վʹ�ýű�������ʾ��Ϣ ^
reg add "%IE_Zones%" /v "2105" /d "0" /t reg_dword /f
reg add "%IE_Zones%" /v "2106" /d "0" /t reg_dword /f
reg add "%IE_Zones%" /v "2107" /d "0" /t reg_dword /f
REM �ļ������Զ���ʾ
reg add "%IE_Zones%" /v "2200" /d "0" /t reg_dword /f
REM ActiveX �ؼ��Զ���ʾ
reg add "%IE_Zones%" /v "2201" /d "0" /t reg_dword /f
REM ����ͨ�������Ƶ�Э��Ļ���ݷ����ҵĵ���
reg add "%IE_Zones%" /v "2300" /d "0" /t reg_dword /f
REM ������ʹ�õ�����վɸѡ��
reg add "%IE_Zones%" /v "2301" /d "3" /t reg_dword /f
REM .NET Framework��XAML �����Ӧ�ó���
reg add "%IE_Zones%" /v "2400" /d "0" /t reg_dword /f
REM  .NET Framework��XPS �ĵ�
reg add "%IE_Zones%" /v "2401" /d "0" /t reg_dword /f
REM .NET Framework����ɢ XAML
reg add "%IE_Zones%" /v "2402" /d "0" /t reg_dword /f
REM �ر����򱣻�ģʽ0x0����������0x3���رգ�
reg add "%IE_Zones%" /v "2500" /d "3" /t reg_dword /f
REM ���� .NET Framework ��װ����
reg add "%IE_Zones%" /v "2600" /d "0" /t reg_dword /f
REM ���� .NET Framework ����
reg add "%IE_Zones%" /v "2700" /d "3" /t reg_dword /f
REM ����ActiveXɸѡ
reg add "%IE_Zones%" /v "2702" /d "0" /t reg_dword /f
REM ���ã���Ȩ��WEB���������е���վ���Ե�����������
reg add "%IE_Zones%" /v "2707" /d "0" /t reg_dword /f
reg add "%IE_Zones%" /v "2708" /d "0" /t reg_dword /f
reg add "%IE_Zones%" /v "2709" /d "0" /t reg_dword /f
REM ����AC�ؼ������з����������-�ر�
reg add "%IE_Zones%" /v "270B" /d "0" /t reg_dword /f
reg add "%IE_Zones%" /v "270C" /d "3" /t reg_dword /f
REM ����
reg add "%IE_Zones%" /v "MinLevel" /d "10000" /t reg_dword /f
reg add "%IE_Zones%" /v "RecommendedLevel" /d "10000" /t reg_dword /f
set /a bl=%bl%+1
call :better_llq_kj_set
goto :eof

:better_llq_hsl
REM ���-�����-IE-hsbank-��������ͼ�������վ
reg add "HKCU\Software\Microsoft\Internet Explorer\BrowserEmulation\ClearableListData" /v "UserFilter" /d "411f00005308adba1b0000003c040000010000001b0000000c00000004f493222487d601010000000c00330039002e00310039002e00310031002e003100370037000c000000fd9c074d2487d601010000000a0068007300620061006e006b002e0063006f006d000c0000000054236e2487d601010000000c00330038002e00310039002e00310031002e003100370036000c00000072f633952487d601010000000c00330038002e00310039002e00310039002e003100310034000c000000f3fb70bc2487d601010000000c00330038002e00310039002e00310039002e003200340030000c00000089614bc92487d6010100000003002a002e002a000c0000005b847eabfcbed601010000000c00330038002e00310039002e00310039002e003100350037000c0000008cfd718833ced601010000000b00330038002e00310039002e00310037002e00380030000c00000070381f9433ced601010000000b00330038002e00310039002e00310033002e00370030000c000000b8e4df9c33ced601010000000b00330038002e00310039002e00360034002e00330035000c00000050ba78a333ced601010000000c00330038002e00340030002e00310035002e003100300031000c000000960235af33ced6010100000007006800730062002e00620069007a000c0000001366e42c34ced601010000000b00330038002e00310039002e00370039002e00350035000c000000917dab825729d701010000000b00330038002e00310039002e00370039002e00340035000c0000001197e8875729d701010000000c00330038002e00310039002e00310039002e003100370032000c0000003998c8720d4dd701010000000c00330038002e00310039002e00310033002e003200340031000c00000097a5e72f6154d701010000000c00330038002e00310039002e00310039002e003200340033000c000000459afabc195cd701010000000b00330038002e00310039002e00310039002e00370038000c00000091ee0d178f5ed701010000000c00330038002e00310039002e00370037002e003100300034000c000000ce2a8ae6b7b2d70101000000090068007300620061006e006b002e00630063000c000000b6b5c1eeb7b2d701010000000b00330038002e00310030002e00360038002e00330032000c00000085dc69f3b7b2d701010000000b00330038002e00310030002e00360038002e00330038000c000000d223a28509a3d801010000000b00330038002e00310039002e00310039002e00350032000c0000005a097aa609a3d801010000000b00330038002e00310039002e00310039002e00380037000c0000009129ce0a46a5d801010000000b00330038002e00310039002e00310036002e00330033000c0000008a48ee2846a5d801010000000c00330038002e00310039002e00310031002e003100370037000c000000d1f89b9446a5d801010000000b00330038002e00310039002e00370038002e0035003900" /t reg_binary /f
REM ���-�����-IE-hsbank-�����ַ������վ��
reg add "%IE_Domains%\*" /v "http" /t reg_dword /d "2" /f
reg add "%IE_Domains%\*" /v "https" /t reg_dword /d "2" /f
reg add "%IE_Domains%\hsbank.com.cn\*" /v "http" /t reg_dword /d "2" /f
reg add "%IE_Domains%\hsbank.com.cn\*" /v "https" /t reg_dword /d "2" /f
reg add "%IE_Domains%\hsbank.cn\*" /v "http" /t reg_dword /d "2" /f
reg add "%IE_Domains%\hsbank.cn\*" /v "https" /t reg_dword /d "2" /f
reg add "%IE_Domains%\hsbank.cc\*" /v "http" /t reg_dword /d "2" /f
reg add "%IE_Domains%\hsbank.cc\*" /v "https" /t reg_dword /d "2" /f
reg add "%IE_Domains%\hsbank.com\*" /v "http" /t reg_dword /d "2" /f
reg add "%IE_Domains%\hsbank.com\*" /v "https" /t reg_dword /d "2" /f
REM ���-�����-IE-hsbank-����IP������վ��
reg add "%IE_Ranges%\Range99" /v ":Range" /d "*" /t REG_SZ /f
reg add "%IE_Ranges%\Range100" /v ":Range" /d "38.*" /t REG_SZ /f
reg add "%IE_Ranges%\Range100" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range100" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range101" /v ":Range" /d "38.*.*.*" /t REG_SZ /f
reg add "%IE_Ranges%\Range101" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range101" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range102" /v ":Range" /d "38.10.68.32" /t REG_SZ /f
reg add "%IE_Ranges%\Range102" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range102" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range103" /v ":Range" /d "38.10.68.38" /t REG_SZ /f
reg add "%IE_Ranges%\Range103" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range103" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range104" /v ":Range" /d "38.19.11.176" /t REG_SZ /f
reg add "%IE_Ranges%\Range104" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range104" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range105" /v ":Range" /d "38.19.11.177" /t REG_SZ /f
reg add "%IE_Ranges%\Range105" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range105" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range106" /v ":Range" /d "38.19.13.70" /t REG_SZ /f
reg add "%IE_Ranges%\Range106" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range106" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range107" /v ":Range" /d "38.19.13.241" /t REG_SZ /f
reg add "%IE_Ranges%\Range107" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range107" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range108" /v ":Range" /d "38.19.17.80" /t REG_SZ /f
reg add "%IE_Ranges%\Range108" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range108" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range109" /v ":Range" /d "38.19.19.114" /t REG_SZ /f
reg add "%IE_Ranges%\Range109" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range109" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range110" /v ":Range" /d "38.19.19.157" /t REG_SZ /f
reg add "%IE_Ranges%\Range110" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range110" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range111" /v ":Range" /d "38.19.19.172" /t REG_SZ /f
reg add "%IE_Ranges%\Range111" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range111" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range112" /v ":Range" /d "38.19.19.240" /t REG_SZ /f
reg add "%IE_Ranges%\Range112" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range112" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range113" /v ":Range" /d "38.19.19.243" /t REG_SZ /f
reg add "%IE_Ranges%\Range113" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range113" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range114" /v ":Range" /d "38.19.19.78" /t REG_SZ /f
reg add "%IE_Ranges%\Range114" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range114" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range115" /v ":Range" /d "38.19.64.35" /t REG_SZ /f
reg add "%IE_Ranges%\Range115" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range115" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range116" /v ":Range" /d "38.19.77.104" /t REG_SZ /f
reg add "%IE_Ranges%\Range116" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range116" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range117" /v ":Range" /d "38.19.79.45" /t REG_SZ /f
reg add "%IE_Ranges%\Range117" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range117" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range118" /v ":Range" /d "38.19.79.55" /t REG_SZ /f
reg add "%IE_Ranges%\Range118" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range118" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range119" /v ":Range" /d "38.40.15.101" /t REG_SZ /f
reg add "%IE_Ranges%\Range119" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range119" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range120" /v ":Range" /d "38.19.19.52" /t REG_SZ /f
reg add "%IE_Ranges%\Range120" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range120" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range121" /v ":Range" /d "38.19.19.87" /t REG_SZ /f
reg add "%IE_Ranges%\Range121" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range121" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range122" /v ":Range" /d "38.19.16.33" /t REG_SZ /f
reg add "%IE_Ranges%\Range122" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range122" /v "https" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range123" /v ":Range" /d "38.19.78.59" /t REG_SZ /f
reg add "%IE_Ranges%\Range123" /v "http" /d "2" /t REG_DWORD /f
reg add "%IE_Ranges%\Range123" /v "https" /d "2" /t REG_DWORD /f
goto :eof
:better_llq_hsw
goto :eof
:better_llq_hso
goto :eof
:better_llq_hsf
goto :eof
:soft_setup
if "%hs%"=="_hsf" goto :eof
REM ��ҳ
INETCPL.CPL
REM ��ӡ��
rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL PrintersFolder
REM �����װ��
if exist "C:\ShaoHua\Softprep.exe" start "" /wait C:\ShaoHua\Softprep.exe 2>nul
goto :eof

:better_rj
REM ���ÿ���ʱ���뷨Ĭ��ΪӢ�ģ�ע���Ƿ���ȷ��
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "DefaultMode" /t REG_SZ /d "0" /f
REM ���-���뷨-Ĭ������  0 ���ģ�1 Ӣ��
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t reg_dword /d 1 /f
REM ���-���뷨-����ģ��ƴ��  0 ���ã�1 ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableSmartFuzzyPinyin" /t reg_dword /d 1 /f
REM ���-���뷨-ģ��ƴ��  0 ���ã�1 ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Fuzzy Input" /t reg_dword /d 1 /f
REM ���-���뷨-��ѧϰ  0 Ϊ���ã�1 Ϊ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable self-learning" /t reg_dword /d 1 /f
REM ���-���뷨-������ѧϰ  0 Ϊ���ã�1 Ϊ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableSmartSelfLearning" /t reg_dword /d 1 /f
REM ���-���뷨-�Ƽ���  0 Ϊ���ã�1 Ϊ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Cloud Candidate" /t reg_dword /d 0 /f
REM ���-���뷨-��Ӣ���л���ݼ���Ĭ�� ctrl + �ո񣬻���ʹ�ã�0 Ĭ��Ϊ shift��1 Ϊ ctrl��2 Ϊ ��
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "English Switch Key" /t reg_dword /d 0 /f
REM ���-���뷨-��ʾ�´��ȴ�  0 Ϊ���ã�1 Ϊ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableHap" /t reg_dword /d 0 /f
REM ���-���뷨-��ʾ�´��ȴ���������ʾ  0 Ϊ���ã�1 Ϊ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Hot And Popular Word Search" /t reg_dword /d 0 /f
REM ���-���뷨-�ѹ����뷨�������
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SogouSvc" /v "Start" /t reg_dword /d 3 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\SogouSvc" /v "Start" /t reg_dword /d 3 /f

REM ���-���±�-�Զ�����
reg add "HKCU\Software\Microsoft\Notepad" /v "fWrap" /t reg_dword /d 1 /f
REM ���-���±�-ʼ����ʾ״̬��
reg add "HKCU\Software\Microsoft\Notepad" /v "StatusBar" /t reg_dword /d 1 /f

REM ���-Windows ��Ƭ�鿴��-���� Windows Photo Viewer ΪĬ�ϴ򿪷�ʽ
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\OpenWithList" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\OpenWithProgids" /f
REM ���-Windows ��Ƭ�鿴��-����ϵͳĬ�ϵ� Windows Photo Viewer
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\OpenWithList" /v "MRUList" /t REG_SZ /d "a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\OpenWithList" /v "a" /t REG_SZ /d "Windows.PhotoViewer.FileAssoc.Tiff" /f
REM ���-Windows ��Ƭ�鿴��-���� PhotoViewer.FileAssoc.Tiff �Ĺ���
icacls "HKCR\.tiff" /grant Administrators:F
icacls "HKCR\PhotoViewer.FileAssoc.Tiff" /grant Administrators:F
ftype PhotoViewer.FileAssoc.Tiff="C:\Program Files\Windows Photo Viewer\PhotoViewer.dll" "%1"
REM ���-Windows ��Ƭ�鿴��-���� Windows Photo Viewer Ϊ�����Ӧ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.jpg\UserChoice" /v "Progid" /t REG_SZ /d "Windows.PhotoViewer.FileAssoc.Tiff" /f
REM ���-Windows ��Ƭ�鿴��-����ͼƬ��ʽ����Ϊ Windows Photo Viewer
assoc .jpg=PhotoViewer.FileAssoc.Tiff
assoc .jpeg=PhotoViewer.FileAssoc.Tiff
assoc .png=PhotoViewer.FileAssoc.Tiff
assoc .bmp=PhotoViewer.FileAssoc.Tiff
assoc .gif=PhotoViewer.FileAssoc.Tiff
assoc .tif=PhotoViewer.FileAssoc.Tiff
assoc .tiff=PhotoViewer.FileAssoc.Tiff
assoc .ico=PhotoViewer.FileAssoc.Tiff
assoc .jfif=PhotoViewer.FileAssoc.Tiff
REM ���-Windows ��Ƭ�鿴��-���Win10���ڴ治�㣬����2Ϊʵ���Ʒ������1G����
REM reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\ICM\RegisteredProfiles" /v "sRGB" /t reg_sz /d "RSWOP.icm" /f
reg add "HKCU\Software\Microsoft\Windows Photo Viewer\Viewer" /f /v MemCacheSize /t REG_DWORD /d 1073741824

REM ���-Windows Media Player-����ʾ�״�ʹ�öԻ���
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /v "GroupPrivacyAcceptance" /t reg_dword /d 1 /f
REM ���-Windows Media Player-�����Զ����¹���
reg add "HKLM\SOFTWARE\Policies\Microsoft\WindowsMediaPlayer" /v "DisableAutoUpdate" /t REG_DWORD /d 1 /f

REM ���-WPS-�ر�WPS Office���Զ����·���
sc stop WPSUpdateService
sc config WPSUpdateService start= disabled
REM ���-WPS-ȥ��WPS���ĵ�
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace{D426C8B3-0B26-4F0D-BA74-2EE212EDAC6D}" /f 
REM ���-WPS-����WPS Office����������
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "Startup" /t REG_DWORD /d 0 /f
REM ���-WPS-����WPS Office�Ľ�������ΪӢ��
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "Lang" /t REG_DWORD /d 2052 /f
REM ���-WPS-����WPS Office��Ĭ�ϱ����ʽΪdocx
reg add "HKCU\Software\Kingsoft\WPS\kxe" /v "SaveType" /t REG_SZ /d "docx" /f
REM ���-WPS-����WPS Office�Ĺ������
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "AdPush" /t REG_DWORD /d 0 /f
REM ���-WPS-����WPS Office��ͼ���СΪ�е�
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "IconSize" /t REG_DWORD /d 1 /f
REM ���-WPS-����WPS Office��ʵʱƴд���
reg add "HKCU\Software\Kingsoft\WPS\kxe" /v "AutoCheck" /t REG_DWORD /d 0 /f
REM ���-WPS-����WPS Office��Ĭ������ΪArial
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "FontName" /t REG_SZ /d "Arial" /f
REM ���-WPS-����WPS Office��Ĭ�������СΪ12
reg add "HKCU\Software\Kingsoft\WPS\kui" /v "FontSize" /t REG_DWORD /d 12 /f

REM ���-Office-����Office 16 Excel�Ķ���
reg add "HKCU\Software\Microsoft\Office\16.0\Excel\options" /v "EnableAnimations" /t REG_DWORD /d 0 /f
REM ���-Office-����Office 13 Excel�Ķ���
reg add "HKCU\Software\Microsoft\Office\15.0\Excel\options" /v "EnableAnimations" /t REG_DWORD /d 0 /f
REM ���-Office-����Office�ļ��ϴ�֪ͨ
reg add "HKCU\Software\Microsoft\Office\16.0\Common\FileIO" /v "DisablePausedUploadNotification" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Common\FileIO" /v "DisableUploadFailureNotification" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Office\16.0\Common\FileIO" /v "DisableNotificationIcon" /t REG_DWORD /d 1 /f
REM ���-Office-����Office 16��Ĭ�ϱ����ʽΪ.docx
reg add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "DefaultFormat" /t REG_SZ /d "docx" /f
REM ���-Office-����Office 16�Ļ�ӭ��Ļ
reg add "HKCU\Software\Microsoft\Office\16.0\Common" /v "ShownFirstRunOptin" /t REG_DWORD /d 1 /f
REM ���-Office-����Office 16�Ķ���Ч��
reg add "HKCU\Software\Microsoft\Office\16.0\Common\Graphics" /v "DisableAnimations" /t REG_DWORD /d 1 /f

REM ���-����Ķ���-ɾ������������
del "C:\ProgramData\CPPackages\*.EXE" /q /f 2>nul
REM ���-����Ķ���-�رո���Ķ������Զ����·���
sc stop FoxitReaderUpdateService
sc config FoxitReaderUpdateService start= disabled
REM ���-����Ķ���-���ø���Ķ�������������
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "ShowStartPage" /t REG_DWORD /d 0 /f
REM ���-����Ķ���-���ø���Ķ����Ľ�������ΪӢ��
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "Language" /t REG_DWORD /d 2052 /f
REM ���-����Ķ���-���ø���Ķ�����Ĭ�ϴ򿪷�ʽΪ��ҳ����ģʽ
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "PageDisplayMode" /t REG_DWORD /d 0 /f
REM ���-����Ķ���-���ø���Ķ����Ĺ������
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "ShowAdvertisement" /t REG_DWORD /d 0 /f
REM ���-����Ķ���-���ø���Ķ�����Ĭ������ΪArial
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "DefaultFontName" /t REG_SZ /d "Arial" /f
REM ���-����Ķ���-���ø���Ķ�����Ĭ�������СΪ12
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "DefaultFontSize" /t REG_DWORD /d 12 /f
REM ���-����Ķ���-���ø���Ķ�����ͼ���СΪ�е�
reg add "HKCU\Software\Foxit Software\Foxit Reader 11.0\Preferences" /v "ToolbarIconSize" /t REG_DWORD /d 1 /f

REM ���-���������-���� OneDrive ͬ���ͻ���
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t reg_dword /d 1 /f
REM ���-���������-ɾ��OneDrive��������
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f
REM ���-���������-����OneDrive��ϵͳ����
sc config OneSyncSvc start= disabled
goto :eof

:better_wl
REM ����-���� TCP �뿪���ӵ�����
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
REM ����-��ֹ����������λ������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoNetConnectDisconnect /t REG_DWORD /d 1 /f
REM ����-����NetBIOS���ƽ�����ѯ��ʱʱ��Ϊ3000���롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v "NameSrvQueryTimeout" /d 3000 /t reg_dword /f
REM ����-���������ļ��������Ż���������ļ�������������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "nonetcrawling" /d 1 /t reg_dword /f
REM ����-����ÿ�������������������Ϊ0����ʾû�����ơ�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /d 0 /t reg_dword /f
REM ����-����Ĭ�ϵ�TTL������ʱ�䣩Ϊ64��
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /d 64 /t reg_dword /f
REM ����-����·��MTU���ֹ��ܣ����Ż�TCP/IP��������ݴ��䡣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /d 1 /t reg_dword /f
REM ����-����TCP/IP�ڶ���⹦�ܣ����Ż����紫�䡣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUBHDetect" /d 1 /t reg_dword /f
REM ����-����TCP SACKѡ�������������ܡ�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /d 1 /t reg_dword /f
REM ����-����TCP�������ȷ����Ϊ2���Լ��������ӳ١�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /d 2 /t reg_dword /f
REM ����-����Windows����վ�������󲢷�������Ϊ30��
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxCmds" /d 30 /t reg_dword /f
REM ����-����Windows����վ���������߳���Ϊ30��
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxThreads" /d 30 /t reg_dword /f
REM ����-����Windows����վ���������ռ�����Ϊ32��
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxCollectionCount" /d 32 /t reg_dword /f
REM ����-����DNS���渺��SOA��Start of Authority����¼�Ļ���ʱ��Ϊ0�롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "negativesoacachetime" /d 0 /t reg_dword /f
REM ����-����DNS����������ϵĻ���ʱ��Ϊ0�롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "netfailurecachetime" /d 0 /t reg_dword /f
REM ����-����DNS������Ŀ�����TTL������ʱ�䣩����Ϊ10800�롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxcacheentryttllimit" /d 10800 /t reg_dword /f
REM ����-����DNS��������TTL������ʱ�䣩Ϊ10800�롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxcachettl" /d 10800 /t reg_dword /f
REM ����-����DNS���渺�滺������TTL������ʱ�䣩Ϊ0�롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxnegativecachettl" /d 0 /t reg_dword /f
REM ����-����TCP��������ѡ���������紫�����ܡ�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /d 1 /t reg_dword /f
REM ����-Windows 7����ӵ�������ṩ����������������������
netsh int tcp set global congestionprovider=none 2>nul
netsh interface tcp set global congestionprovider=ctcp 2>nul
REM ����-Windows 7�����̴�ж��״̬Ϊ�Զ��������������紫��Ч��
netsh int tcp set global chimney=automatic 2>nul
REM ����-Windows 7���ý��շ�����״̬���������߶��ϵͳ����������
netsh int tcp set global rss=enabled 2>nul
REM ����-Windows 7����NetDMA״̬�����������������ݰ��Ĵ���Ч��
netsh int tcp set global netdma=enabled 2>nul
REM ����-Windows 7����ֱ�ӻ������(DCA)�����������������ݰ��Ĵ���Ч��
netsh int tcp set global dca=enabled 2>nul
REM ����-Windows 7���ý��մ����Զ���г����Ϊ����ģʽ������԰������ĳЩ������������
netsh int tcp set global autotuninglevel=restricted
REM ����-����TCP����ʽ�㷨
netsh int tcp set heuristics disabled
REM ����-Windows10����������ģ��������ӵ�������ṩ����������������������
netsh int tcp set supplemental template=datacenter congestionprovider=ctcp 2>nul
REM ����-Windows10����ECN���ܡ�����԰������ĳЩ�������������
netsh int tcp set global ecncapability=disabled 2>nul
REM ����-Windows10����RFC 1323ʱ����������������紫��Ч��
netsh int tcp set global timestamps=enabled 2>nul
goto :eof

:finish
REM ���²���
gpupdate /force
call :finish%hs%
if "%hs%"=="_hsf" goto :eof
REM ϵͳ����ű�
if exist "C:\ShaoHua\Key\Activate.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\ϵͳ����ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\Activate.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
REM ��ӡ����ű�
if exist "C:\ShaoHua\Key\FixPrint.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\��ӡ����ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\FixPrint.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
REM ��������ű�
if exist "C:\ShaoHua\Key\ClearTemp.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\��������ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\ClearTemp.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
REM ɾ�������ļ�
del "C:\ShaoHua\Drv\Drvceo\*.*" /f /s /q 2>nul
rd "C:\ShaoHua\Drv\Drvceo\" /s /q 2>nul
del /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*"
del /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*"
del /f /s /q "%TEMP%\*"
start "" cleanmgr.exe /VERYLOWDISK
REM ˢ������
taskkill /f /im explorer.exe 2>nul
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True
start "" explorer
for /f "tokens=3*" %%i in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "ProductName"') do set ProductName=%%i %%j
for /f "tokens=3*" %%i in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId"') do set ReleaseId=%%i
for /f "tokens=2* delims=[]" %%i in ('ver') do set v=%%i
for /f "tokens=2* delims= " %%i in ("%v%") do set CurrentBuildNumber=%%i
REM start mshta vbscript:msgbox("System��"^&vbCrLf^&"%ProductName%"^&vbCrLf^&"%processor_architecture%"^&vbCrLf^&"%ReleaseId% - %CurrentBuildNumber%"^&vbCrLf^&""^&vbCrLf^&"Script��"^&vbCrLf^&"ShaoHua - 7x24H - 18900559020"^&vbCrLf^&"Version��"^&vbCrLf^&"%Version%",64,"Tips - %date%")(window.close)
start "" rundll32 shell32,ShellAbout Script  ���ۻ� - 18900559020                   Date��%Version% System��%ProductName% - %processor_architecture% - %CurrentBuildNumber%
echo %~dp0|findstr /i "windows" >nul && exit || (del "%~f0" & exit)
exit
:finish_hsl
call :upan
REM ��ʾ�˵����ֵĴ�ӡ���ļ���
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}" /ve /f
del "C:\users\public\desktop\�������ӹ���ϵͳ7.4.2.lnk" /q /f 2>nul
del "C:\users\public\desktop\Sursen Maker 2.0.lnk" /q /f 2>nul
del "C:\users\public\desktop\SursenOfdMaker.lnk" /q /f 2>nul
del "C:\shaohua\soft\WeChatSetup.exe" /q /f 2>nul
del "C:\shaohua\soft\ThunderSpeed.exe" /q /f 2>nul
del "C:\ShaoHua\Tools\Key\*.exe" /q /f 2>nul
del "C:\ShaoHua\Tools\Office�޸�����\Office����һ���޸�.exe" /q /f 2>nul
del "C:\ShaoHua\Tools\Office�޸�����\��ӡ����һ�����.exe" /q /f 2>nul
set "local=C:\ShaoHua" >nul 2>nul
rd "%systemdrive%\sysprep\" /s /q 2>nul
rd "%local%\Tools\Key" /s /q 2>nul
rd "%local%\Tools\DNS" /s /q 2>nul
rd "%local%\Tools\����������" /s /q 2>nul
rd "%local%\Tools\Key" /s /q 2>nul
del /f /s /q "%local%\*һ��*" 2>nul
del /f /s /q "%local%\*����*" 2>nul
del /f /s /q "%local%\*KMS_VL*" 2>nul
del /f /s /q "%local%\*oem7*" 2>nul
del /f /s /q "%local%\*office2007*" 2>nul
del /f /s /q "%local%\tools\*dns*" 2>nul
del /f /s /q "%local%\tools\*Share*" 2>nul
del /f /s /q "%systemdrive%\sysprep\*" 2>nul
del "C:\ShaoHua\Drv\Drvceo\*.*" /f /s /q 2>nul
rd "C:\ShaoHua\Drv\Drvceo\" /s /q 2>nul
goto :eof
:finish_hsw
call :finish_hso
call :upan
REM ��ʾ�˵����ֵĴ�ӡ���ļ���
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}" /ve /f
goto :eof
:finish_hso
REM ������ͣWindows�Զ�����
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v FlightSettingsMaxPauseDays /t reg_dword /d 9999 /f
REM ɾ���˵����ֵĴ�ӡ���ļ���
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{2227A280-3AEA-1069-A2DE-08002B30309D}" /f
REM ɾ���˵����ֵİ�ȫU��_V3�ļ���
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /f
REM �����½��ġ���ϵ�ˡ��Ҽ��˵���
reg delete "HKCR\.contact" /f 2>nul
REM ���÷��͵��ġ���������ˡ���չ�˵���
del /f /s /q "%APPDATA%\Microsoft\Windows\SendTo\Fax Recipient.lnk" 2>nul
REM ���÷��͵��ġ�ZIP����չ�˵���
del /f /s /q "%APPDATA%\Microsoft\Windows\SendTo\Compressed (zipped) Folder.ZFSendToTarget" 2>nul
REM ���÷��͵��ġ��ʼ��ռ��ˡ���չ�˵���
del /f /s /q "%APPDATA%\Microsoft\Windows\SendTo\Mail Recipient.MAPIMail" 2>nul
if "%hs%"=="_hsf" goto :eof
del "C:\Windows\System32\UCli.exe" /f /s /q 2>nul
del "C:\Windows\System32\config.ini" /f /s /q 2>nul
del "C:\windows\Hsbank\*.*" /f /s /q 2>nul
rd "C:\shaohua\Hsbank\" /s /q 2>nul
del "%USERPROFILE%\Desktop\360��ҵ��ȫ�����.lnk" /f /q 2>nul
del "%PUBLIC%%\Desktop\360��ҵ��ȫ�����.lnk" /f /q 2>nul
rd "%ProgramFiles%\360\360ent" /s /q 2>nul
goto :eof
:finish_hsf
call :finish_hso
goto :eof
:upan
REM ��ȫU��_v1_V2_V3_DEL
del /f /s /q "%userprofile%\Desktop\��ȫU��.lnk" 2>nul
del /f /s /q "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Network Shortcuts\��ȫU��.exe" 2>nul
del /f /s /q "%UserProfile%\AppData\Roaming\Microsoft\Windows\Network Shortcuts\��ȫU��.exe" 2>nul
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKCU\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKLM\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
del /f /s /q "%userprofile%\Desktop\��ȫU��_V2.lnk" 2>nul
del /f /s /q "%userprofile%\Desktop\��ȫU��_V3.lnk" 2>nul
if "%hs%"=="_hsf" goto :eof
if exist "C:\ShaoHua\Soft\FugueExplorer_v3.exe" call :upanadd
goto :eof
:upanadd
REM ��ȫU��_V3_ADD
if not exist "C:\ShaoHua\Soft\FugueExplorer_v3.exe" goto :eof
start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\��ȫU��_V3.lnk""):b.TargetPath=""C:\ShaoHua\Soft\FugueExplorer_v3.exe"":b.WorkingDirectory=""C:\ShaoHua\Soft"":b.Save:close") 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "��ȫU��_V3" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "��ȫU��_V3" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "��ȫU��_V3" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "InfoTip" /t reg_sz /d "��ݲ���By_ShaoHua" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "LocalizedString" /t reg_sz /d "��ȫU��_V3" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "System.ItemAuthors" /t reg_sz /d "��ݲ���By_ShaoHua" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "TileInfo" /t reg_sz /d "prop:System.ItemAuthors" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\DefaultIcon" /ve /t reg_expand_sz /d "C:\ShaoHua\Soft\FugueExplorer_v3.exe" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\Shell\Open\Command" /ve /t reg_sz /d "C:\ShaoHua\Soft\FugueExplorer_v3.exe" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\Instance" /v "CLSID" /t reg_sz /d "{0AFACED1-E828-11D1-9187-B532F1E9575D}" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\Instance\InitPropertyBag" /v "Target" /t reg_sz /d "C:\ShaoHua\Soft\\" /f
reg add "HKCU\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "��ȫU��_V3" /f
reg add "HKLM\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "��ȫU��_V3" /f
goto :eof