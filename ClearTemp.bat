��a
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=ClearTemp�ű�
set Powered=Powered by �ۻ� 18900559020
set Version=20241210
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
:start
set userInput=
call :CapsLK
cls&for /f "tokens=2 delims=()" %%i in ('fsutil volume diskfree c:^|find /i "����"') do set myvar=%%i&cls&echo.
echo.����ǰC�̿�������Ϊ%myvar%��&echo.
echo.������ A Ĭ�ϡ��Զ������в������������� �� C ������������������ �� U �����½ű����������� �� Q ���˳��ű�&echo.
echo.��������������A1): ǿ�ƹر� ΢�� ����
echo.��������������A2): ǿ�ƹر� ������������� ����
echo.��������������A3): ���� ΢�� �Զ������ �ĵ� ^& ͼƬ ^& ��Ƶ ^& �����¼ һ�� �ļ�
echo.��������������A4): ���� ϵͳ Temp ��ʱ �ļ�
echo.��������������A5): ���� ��ӡ�Զ������¼ �ļ�
echo.��������������A6): ���� ������������� ���� �ļ�
echo.��������������A7): ���� Windows ������ʱ �ļ�
echo.��������������A8): ���� ϵͳ������ʽ����¼�ļ� �ļ�
echo.��������������A9): ���� ����������� �Զ�����&echo.
echo.�����������ٶ�ȡ�����ڶ����أ�Ӳ�̵Ķ�д�ٶȡ�CPU���ڴ��ռ�á������ļ���������ɱ�����ܿ�����ĺ�̨��صȡ�&echo.
echo.��������������������������������������������������������������������������������%Version%���ۻ���18900559020
choice /T 6 /C ACUQ /d A /n /m "���ű�6���Ĭ��ѡA����ѡ��"
if %errorlevel%==1 goto :auto
if %errorlevel%==2 goto :clear
if %errorlevel%==3 if exist "C:\ShaoHua\up.bat" (call "C:\ShaoHua\up.bat") else (echo.ȱ�ٺ����ļ���������ʹ��ȫ�����ܣ�����ϵ�ۻ�18900559020��&&timeout /t 6)
if %errorlevel%==4 exit
:auto
cls&echo.&echo.���Զ������У����Ժ�...&echo.
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
cls&echo.&echo.���Ƿ�ȷ����� ��΢���Զ�������ĵ� ^& ͼƬ ^& ��Ƶ ^& �����¼��һ���ļ�����
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
for /f "tokens=1,2,*" %%i in ('REG QUERY HKCU\Software\Tencent\WeChat /v FileSavePath') do set "regvalue=%%k"
if defined regvalue (
    del /f /s /q "%regvalue%\WeChat Files\*"
)
del /f /s /q "%userprofile%\Documents\WeChat Files\*" 2>nul
goto :eof
:l4
rem Clear temp and temp cache directories
cls
echo.&echo.���Ƿ�ȷ����� ��ϵͳ Temp ��ʱ�ļ�����
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
del /f /s /q "%temp%\*.tmp" 2>nul
del /f /s /q "%tmp%\*.tmp" 2>nul
goto :eof
:l5
rem Delete print task history files
cls&echo.&echo.���Ƿ�ȷ�����������ӡ�Զ������¼�ļ�������
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
del /f /s /q "C:\Windows\System32\spool\PRINTERS\*"
goto :eof
:l6
rem Delete browser cache files
cls&echo.&echo.���Ƿ�ȷ���������Internet Explorer ^& 360XX ^& Google Chrome ^& ��� ^& Edge ����������ļ�������
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
cls&echo.&echo.���Ƿ�ȷ���������Windows������ʱ�ļ�������
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
rd /s /q %windir%\SoftwareDistribution\Download
rd /s /q %windir%$Windows.~BT
rd /s /q %windir%\servicing\Packages
goto :eof
:l8
rem Delete symptom files
cls&echo.&echo.���Ƿ�ȷ���������ϵͳ������ʽ����¼�ļ�������
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
rem ��ʱ�ļ�
rem del /f /s /q %systemdrive%\*.tmp
rem ��ʱ�ļ�
rem del /f /s /q %systemdrive%\*._mp
rem ��־�ļ�
rem del /f /s /q %systemdrive%\*.log
rem ��ʱ�����ļ�
rem del /f /s /q %systemdrive%\*.gid
rem ���̼���ļ�
rem del /f /s /q %systemdrive%\*.chk
rem ��ʱ�����ļ�
rem del /f /s /q %systemdrive%\*.old
rem ����վ�ļ�
del /f /s /q "%systemdrive%\recycled\*"
rem �����ļ�
rem del /f /s /q %windir%\*.bak
rem Ԥ���ļ�
rem del /f /s /q %windir%\prefetch\*.*
rem ��ʱĿ¼
del /f /s /q "%windir%\temp\*"
rem ��������ļ��ļ�¼
del /f /s /q "%userprofile%\recent\*"
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*"
del /f /s /q "%userprofile%\Local Settings\Temp\*"
goto :eof
:l9
rem Run disk cleanup tool by Sageset id 60
cls&echo.&echo.���Ƿ�ȷ��������������������򡿡���������ֶ�����
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
rem Cleanmgr.exe /sageset:60
rem Cleanmgr.exe /sagerun:60
start "" cleanmgr.exe /VERYLOWDISK
goto :eof
:clear
if exist "D:\SH\Key\safe.bat" call "D:\SH\Key\safe.bat" 2>nul
echo.&echo.��[��������]���������...���ű������������˵�...&timeout /t 3 >nul&goto :start
:xuanze
echo.&echo.������Y������������N��������&echo.&echo.����ȷ�ϣ�&echo.&echo.��3��󣬽���ΪY������
choice /T 3 /C YN /d Y /N >nul 2>nul
goto :eof
:tishi
cls&echo.&if %errorlevel%==1 echo.����������������˵�������������У��ϵ��Կ��ܻᡰ�������������ĵȴ�����&echo.
goto :eof
:up
cls&echo.&if %errorlevel%==1 echo.����������������˵�������������У��ϵ��Կ��ܻᡰ�������������ĵȴ�����&echo.
goto :eof
:exit
cls&for /f "tokens=2 delims=()" %%i in ('fsutil volume diskfree c:^|find /i "����"') do set myvar=%%i&echo.
echo.&echo.���������,��ǰC�̿�������Ϊ%myvar%...&echo.&echo.&echo.&echo.&echo.&echo.
echo.������������������������������������������������ɢ����ʱ���ټ�������&echo.&echo.&echo.&echo.&echo.&echo.
echo.������������������������������������������������������������������������������������������������������ �ۻ�
echo.������������������������������������������������������������������������������������������������18900559020&echo.
echo.�������������ʹ��ҵ绰��...&timeout /t 6 >nul&exit