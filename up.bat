��a
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=Upgrade�ű�
set Powered=Powered by �ۻ� 18900559020
set Version=20241226
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
:start
for /f "delims=" %%i in ('powershell -command "[console]::CapsLock"') do if "%%i"=="False" mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
choice /T 1 /C SH /d H /N >nul 2>nul
if %errorlevel%==1 echo on
set "local=C:\ShaoHua" >nul 2>nul
md %local%\Key >nul 2>nul
set error=�������������⣬�����Ƿ����粻�ɴ����ɱ����������أ�
set urllan=http://38.40.12.180/sh
set urlwan=http://10.198.78.78/sh
set urlother=https://gitee.com/shaohuanihao
cls
if not exist %SystemRoot%\System32\curl.exe call :curl
if exist %SystemRoot%\System32\curl.exe call :up
:list
set al=1
:SetA
if "%al%"=="10" goto ex
call :list%al%
set /a al=%al%+1
goto SetA
:ex
del /f /q up.txt
rem ϵͳ����ű�
if exist "C:\ShaoHua\Key\Activate.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\ϵͳ����ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\Activate.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
rem ��ӡ����ű�
if exist "C:\ShaoHua\Key\FixPrint.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\��ӡ����ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\FixPrint.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
rem ��������ű�
if exist "C:\ShaoHua\Key\ClearTemp.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\��������ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\ClearTemp.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
if exist %local%\up.bat call :clear
exit
:list1
rem shaohua
set soft=shaohua.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /q "%SystemRoot%\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -I %net% > up.txt && findstr "200 OK" up.txt > nul && (curl -# -o "%SystemRoot%\%soft%" -L %net%) || (echo.%error%)
goto :eof
:list2
rem InitialSetup
set soft=InitialSetup.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /q "%SystemRoot%\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -I %net% > up.txt && findstr "200 OK" up.txt > nul && (curl -# -o "%SystemRoot%\%soft%" -L %net%) || (echo.%error%)
goto :eof
:list3
rem Activate
set soft=Activate.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/KMS_VL_ALL_AIO.cmd
call :make
call :net
del /f /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -I %net% > up.txt && findstr "200 OK" up.txt > nul && (curl -# -o "%local%\Key\%soft%" -L %net%) || (echo.%error%)
goto :eof
:list4
rem ClearTemp
set soft=ClearTemp.bat
echo.%soft%
set softlan=/%soft%
echo.%softlan%
set softwan=/%soft%
echo.%softwan%
set softother=/bat/raw/main/%soft%
echo.%softother%
call :make
call :net
del /f /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -I %net% > up.txt && findstr "200 OK" up.txt > nul && (curl -# -o "%local%\Key\%soft%" -L %net%) || (echo.%error%)
echo.%local%\Key\%soft%111111111111
echo.%net%
pause
goto :eof
:list5
rem DNS
set soft=DNS.bat
echo.%soft%
set softlan=/%soft%
echo.%softlan%
set softwan=/%soft%
echo.%softwan%
set softother=/bat/raw/main/%soft%
echo.%softother%
call :make
del /f /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -I %net% > up.txt && findstr "200 OK" up.txt > nul && (curl -# -o "%local%\Key\%soft%" -L %net%) || (echo.%error%)
echo.%local%\Key\%soft%22222222
echo.%net%
pause
goto :eof
:list6
rem EnableRDC
set soft=EnableRDC.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -I %net% > up.txt && findstr "200 OK" up.txt > nul && (curl -# -o "%local%\Key\%soft%" -L %net%) || (echo.%error%)
goto :eof
:list7
rem FixPrint
set soft=FixPrint.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -I %net% > up.txt && findstr "200 OK" up.txt > nul && (curl -# -o "%local%\Key\%soft%" -L %net%) || (echo.%error%)
goto :eof
:list8
rem SecureUdisk
set soft=SecureUdisk.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -I %net% > up.txt && findstr "200 OK" up.txt > nul && (curl -# -o "%local%\Key\%soft%" -L %net%) || (echo.%error%)
goto :eof
:list9
rem WinShare
set soft=WinShare.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -I %net% > up.txt && findstr "200 OK" up.txt > nul && (curl -# -o "%local%\Key\%soft%" -L %net%) || (echo.%error%)
goto :eof
:curl
set soft=curl.exe
echo. Downloading curl.Just keep waiting no matter how long it takes.
set wgetlan=/curl.exe
set wgetwan=/curl.exe
set wgetother=/bat/raw/main/curl.exe
set L=&set W=&set O=
set L=%urllan%%wgetlan%
set W=%urlwan%%wgetwan%
set O=%urlother%%wgetother%
arp -a|findstr /i "38.40." >nul && (set net=%L%&set Pc=HS-Lan)||(arp -a|findstr /i "38.41." >nul && (set net=%L%&set Pc=HS-Lan)||(arp -a|findstr /i "10.198." >nul && (set net=%W%&set Pc=HS-Wan)||(set net=%O%&set Pc=PC-Other)))
title Downloading curl.Just keep waiting no matter how long it takes.
bitsadmin /transfer curl %net% %SystemRoot%\System32\curl.exe
goto :eof
:up
echo. Updating the script. Please be patient, no matter how long it takes.
set softlan=/up.bat
set softwan=/up.bat
set softother=/bat/raw/main/up.bat
call :make
call :net
curl -# -I %net% > up.txt && findstr "200 OK" up.txt > nul && (curl -# -o "%local%\up.bat" -L %net%) || (echo.%error%)
echo %~dp0|find /i "shaohua"&&(cls&echo.&goto :eof)||(cls&echo.&start "" %local%\up.bat&del %0&del %~dp0%~nx0&exit)
goto :eof
:clear
echo. Cleaning up files that may trigger false-positive virus alerts from antivirus software. Please be patient, no matter how long it takes.
del /f /q "%local%\up.txt"
rd "%systemdrive%\sysprep\" /s /q
rd "%local%\Tools\Key\" /s /q
rd "%local%\Tools\DNS\" /s /q
rd "%local%\Tools\����������\" /s /q
rd "%local%\Tools\Key\" /s /q
del /f /s /q "%local%\*һ��*"
del /f /s /q "%local%\*����*"
del /f /s /q "%local%\*KMS_VL*"
del /f /s /q "%local%\*oem7*"
del /f /s /q "%local%\*office2007*"
del /f /s /q "%local%\tools\*dns*"
del /f /s /q "%local%\tools\*Share*"
del /f /s /q "%systemdrive%\sysprep\*"
rd "C:\ShaoHua\Drv\Drvceo\" /s /q
goto :eof
:make
set L=&set W=&set O=
set L=%urllan%%softlan%
echo.%L%
set W=%urlwan%%softwan%
echo.%W%
set O=%urlother%%softother%
echo.%O%
goto :eof
:net
set net=&set Pc=
arp -a|findstr /i "38.40." >nul && (set net=%L%&set Pc=HS-Lan)||(arp -a|findstr /i "38.41." >nul && (set net=%L%&set Pc=HS-Lan)||(arp -a|findstr /i "10.198." >nul && (set net=%W%&set Pc=HS-Wan)||(set net=%O%&set Pc=PC-Other)))
title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� %Comment%
goto :eof