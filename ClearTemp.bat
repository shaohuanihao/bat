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
set Version=20240728
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
:start
call :CapsLK
cls&for /f "tokens=2 delims=()" %%i in ('fsutil volume diskfree c:^|find /i "����"') do set myvar=%%i&echo.
echo.����ǰC�̿�������Ϊ%myvar%��&echo.&echo.
echo.�������������ҽ�Ϊ���Զ������²�����&echo.
echo.����������������������1����ǿ�ƹر� ΢�� ����
echo.����������������������2����ǿ�ƹر� Internet Explorer ^& 360 ^& Google Chrome����� ����
echo.����������������������3�������� ΢���Զ�������ĵ� ^& ͼƬ ^& ��Ƶ ^& �����¼��һ�� �ļ�
echo.����������������������4�������� ϵͳ Temp ��ʱ �ļ�
echo.����������������������5�������� ��ӡ�Զ������¼ �ļ�
echo.����������������������6�������� Internet Explorer ^& 360 ^& Google Chrome ��������� �ļ�
echo.����������������������7�������� Windows ������ʱ �ļ�
echo.����������������������8�������� ϵͳ������ʽ����¼�ļ� �ļ�
echo.����������������������9�������� ����������� �Զ�����
echo.
echo.��������������������������������������������������������������������������������%Version%���ۻ���18900559020&echo.
echo.�����������ʼ...&pause >nul 2>nul&cls&echo.&echo.�������У����Ժ�...&echo.
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
taskkill /f /t /im WeChat.exe 2>nul
taskkill /f /t /im WechatBrowser.exe 2>nul
goto :eof
:l2
cls&echo.
taskkill /f /t /im iexplore.exe 2>nul
taskkill /f /t /im chrome.exe  2>nul
taskkill /f /t /im firefox.exe  2>nul
taskkill /f /t /im 360se.exe 2>nul
taskkill /f /t /im sesvc.exe 2>nul
goto :eof
:l3
rem Delete WeChat Files directory
cls&echo.&echo.���Ƿ�ȷ����� ��΢���Զ�������ĵ� ^& ͼƬ ^& ��Ƶ ^& �����¼��һ���ļ�����
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
for /f "tokens=1,2,*" %%i in ('REG QUERY HKEY_CURRENT_USER\Software\Tencent\WeChat /v FileSavePath') do set "regvalue=%%k"
if defined regvalue (
    del /f /s /q "%regvalue%\WeChat Files\*.*"
)
del /f /s /q "%userprofile%\Documents\WeChat Files\*.*" 2>nul
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
del /f /s /q "C:\Windows\System32\spool\PRINTERS\*.*"
goto :eof
:l6
rem Delete browser cache files
cls&echo.&echo.���Ƿ�ȷ���������Internet Explorer ^& 360 ^& Google Chrome ����������ļ�������
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\INetCache\*.*"
del /f /s /q "%userprofile%\AppData\Local\Google\Chrome\User Data\Default\Cache\*.*"
del /f /s /q "%userprofile%\AppData\Local\360Chrome\User Data\Default\Cache\*.*"
del /f /s /q "%userprofile%\AppData\roaming\360se6\User Data\Default\Cache\*.*"
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
del /f /s /q %systemdrive%\recycled\*.*
rem �����ļ�
rem del /f /s /q %windir%\*.bak
rem Ԥ���ļ�
rem del /f /s /q %windir%\prefetch\*.*
rem ��ʱĿ¼
del /f /s /q %windir%\temp\*.*
rem ��������ļ��ļ�¼
del /f /s /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
goto :eof
:l9
rem Run disk cleanup tool by Sageset id 60
cls&echo.&echo.���Ƿ�ȷ��������������������򡿡���������ֶ�����
call :xuanze
if %errorlevel%==2 goto :eof
call :tishi
rem Cleanmgr.exe /sageset:60
rem Cleanmgr.exe /sagerun:60
cleanmgr.exe /VERYLOWDISK
goto :eof
:xuanze
echo.&echo.������Y������������N��������&echo.&echo.����ȷ�ϣ�&echo.&echo.��4��󣬽���ΪY������
choice /T 4 /C YN /d Y /N >nul 2>nul
goto :eof
:tishi
cls&echo.&if %errorlevel%==1 echo.����������������˵�������������У������ĵȴ�����&echo.
goto :eof
:exit
cls&for /f "tokens=2 delims=()" %%i in ('fsutil volume diskfree c:^|find /i "����"') do set myvar=%%i&echo.
echo.&echo.���������,��ǰC�̿�������Ϊ%myvar%...&echo.&echo.&echo.&echo.&echo.&echo.
echo.������������������������������������������������ɢ����ʱ���ټ�������&echo.&echo.&echo.&echo.&echo.&echo.
echo.������������������������������������������������������������������������������������������������������ �ۻ�
echo.������������������������������������������������������������������������������������������������18900559020&echo.
echo.�������������ʹ��ҵ绰��...&timeout /t 6 >nul&exit