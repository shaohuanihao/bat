��a
cls
echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=Upgrade�ű�
set Powered=Powered by �ۻ� 18900559020
set Version=20231005
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
:start
echo.
set "local=C:\ShaoHua" >nul 2>nul
md %local%\Key >nul 2>nul
set error=�ƺ��������������⣬�����Ƿ���ɱ����������أ�
set urllan=http://38.40.12.180/sh
set urlwan=http://10.198.78.78/sh
set urlother=https://gitee.com/shaohuanihao
if not exist %SystemRoot%\System32\curl.exe call :curl
if exist %SystemRoot%\System32\curl.exe call :up
if exist %local%\up.bat call :clear
:list
set al=1
:SetA
if "%al%"=="10" goto ex
call :list%al%
set /a al=%al%+1
goto SetA
:ex
rem ϵͳ����ű�
if exist "C:\ShaoHua\Key\Activate.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\ϵͳ����ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\Activate.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
rem ��ӡ����ű�
if exist "C:\ShaoHua\Key\FixPrint.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\��ӡ����ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\FixPrint.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
rem ��������ű�
if exist "C:\ShaoHua\Key\ClearTemp.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\��������ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\ClearTemp.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
exit
:list1
rem shaohua
set soft=shaohua.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /s /q "%SystemRoot%\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -o "%SystemRoot%\%soft%" -L %net% || echo.%error%
goto :eof
:list2
rem Activate
set soft=Activate.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/KMS_VL_ALL_AIO.cmd
call :make
call :net
del /f /s /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -o "%local%\Key\%soft%" -L %net% || echo.%error%
goto :eof
:list3
rem ClearTemp
set soft=ClearTemp.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /s /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -o "%local%\Key\%soft%" -L %net% || echo.%error%
goto :eof
:list4
rem DNS
set soft=DNS.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
del /f /s /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -o "%local%\Key\%soft%" -L %net% || echo.%error%
goto :eof
:list5
rem EnableRDC
set soft=EnableRDC.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /s /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -o "%local%\Key\%soft%" -L %net% || echo.%error%
goto :eof
:list6
rem FirstDel
set soft=FirstDel.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /s /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -o "%local%\Key\%soft%" -L %net% || echo.%error%
goto :eof
:list7
rem FixPrint
set soft=FixPrint.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /s /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -o "%local%\Key\%soft%" -L %net% || echo.%error%
goto :eof
:list8
rem SecureUdisk
set soft=SecureUdisk.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /s /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -o "%local%\Key\%soft%" -L %net% || echo.%error%
goto :eof
:list9
rem WinShare
set soft=WinShare.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
del /f /s /q "%local%\Key\%soft%" >nul 2>nul
echo. Downloading %soft%
curl -# -o "%local%\Key\%soft%" -L %net% || echo.%error%
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
curl -# -o "%local%\up.bat" -L %net%
echo %~dp0|find /i "shaohua"&&(goto :eof)||(start "" %local%\up.bat&del %0&del %~dp0%~nx0&exit)
goto :eof
:clear
echo. Cleaning up files that may trigger false-positive virus alerts from antivirus software. Please be patient, no matter how long it takes.
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
:make
set L=&set W=&set O=
set L=%urllan%%softlan%
set W=%urlwan%%softwan%
set O=%urlother%%softother%
goto :eof
:net
set net=&set Pc=
arp -a|findstr /i "38.40." >nul && (set net=%L%&set Pc=HS-Lan)||(arp -a|findstr /i "38.41." >nul && (set net=%L%&set Pc=HS-Lan)||(arp -a|findstr /i "10.198." >nul && (set net=%W%&set Pc=HS-Wan)||(set net=%O%&set Pc=PC-Other)))
title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� %Comment%
goto :eof