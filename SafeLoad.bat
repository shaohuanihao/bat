��a
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=SafeLoad
set Powered=Powered by �ۻ� 18900559020
set Version=20241217
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
:start
call :CapsLK
call :fix
call :patch
echo.&echo.�����ڼ�������ͨѶ��&echo.
call :ping
choice /T 1 /C SH /d H /N >nul 2>nul
if %errorlevel%==1 call :input
call :down
call :run
exit

:CapsLK
for /f "delims=" %%i in ('powershell -command "[console]::CapsLock"') do if "%%i"=="False" mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
goto :eof

:fix
echo.&echo.�����ڼ��ϵͳ������&echo.
schtasks /delete /tn "%Name%" /f >nul 2>nul
schtasks /create /tn "%Name%" /tr "C:\ShaoHua\Key\%Name%.bat" /sc ONLOGON /ru "Administrator" /rl highest /f >nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrives" /t REG_DWORD /d 8 /f >nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoViewOnDrive /t REG_DWORD /d 8 /f >nul 2>nul
powershell -Command "Stop-Process -Name explorer -Force"
goto :eof

:patch
set server=10.198.78.78
set no=0
set pingmax=6
set local=D:\SH\
set s_safe=http://%server%/Safe.bat
set l_safe=%local%Key\Safe.bat
set s_ps=http://%server%/Safe.ps1
set l_ps=%local%Key\Safe.ps1
set s_safeclear=http://%server%/SafeClear.bat
set l_safeclear=%local%Key\SafeClear.bat
goto :eof

:ping
ping -n 1 %server% > nul && (goto :eof) || (set /a no+=1 & if %no% geq %pingmax% (goto :run) else (echo.��%no%�γ���... & timeout /t 1 > nul & goto :ping))
goto :eof

:down
echo.&echo.�����ڳ��Ը��·���������ļ���&echo.
if not exist "%local%key" (mkdir "%local%key") >nul 2>nul
for /f "delims=" %%a in ('curl -# -L -o NUL "%s_safe%" --write-out "%%{http_code}" --silent --max-time 3') do (set s_safe_status=%%a) >nul 2>nul
for /f "delims=" %%b in ('curl -# -L -o NUL "%s_ps%" --write-out "%%{http_code}" --silent --max-time 3') do (set s_ps_status=%%b) >nul 2>nul
for /f "delims=" %%c in ('curl -# -L -o NUL "%s_safeclear%" --write-out "%%{http_code}" --silent --max-time 3') do (set s_sc_status=%%c) >nul 2>nul
if "%s_safe_status%"=="200" (curl -s -S -L -o "%l_safe%" --progress-bar --max-time 3 %s_safe% ) else (echo.����ʧ�ܣ�HTTP ״̬�룺%s_safe_status%) >nul 2>nul
if "%s_ps_status%"=="200" (curl -s -S -L -o "%l_ps%" --progress-bar --max-time 3 %s_ps% ) else (echo.����ʧ�ܣ�HTTP ״̬�룺%s_ps_status%) >nul 2>nul
if "%s_sc_status%"=="200" (curl -s -S -L -o "%l_safeclear%" --progress-bar --max-time 3 %s_safeclear% ) else (echo.����ʧ�ܣ�HTTP ״̬�룺%s_sc_status%) >nul 2>nul
goto :eof

:run

if exist "%l_safe%" (call "%l_safe%") >nul 2>nul
echo.&echo.���Ƿ�����ϵͳ�����ļ���Ĭ��N����������3����Զ�������&echo.
choice /T 3 /C YN /d N
if %errorlevel%==1 if exist "%l_safeclear%" (start "" "%l_safeclear%")
if %errorlevel%==0 exit
exit

:input
set /p input=""
if "%input%"=="disable" (schtasks /delete /tn "%Name%" /f)
if "%input%"=="shaohua" (goto :safe) else (goto :eof)
goto :eof

:safe
schtasks /delete /tn "%Name%" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrives" /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoViewOnDrive" /f >nul 2>nul
powershell -Command "Stop-Process -Name explorer -Force"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoViewOnDrive" /f >nul 2>nul
exit