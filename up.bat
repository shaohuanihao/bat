ÿþa
cls
@echo on
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo on
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=Upgrade½Å±¾
set Powered=Powered by ÉÛ»ª 18900559020
set Version=20260604
set Comment=ÔËÐÐÍê±Ïºó½Å±¾»á×Ô¶¯¹Ø±Õ£¬ÇëÎðÊÖ¶¯¹Ø±Õ£¡
title %Name% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
:start
for /f "delims=" %%i in ('powershell -command "[console]::CapsLock"') do if "%%i"=="False" mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
choice /T 1 /C SH /d H /N >nul 2>nul
if %errorlevel%==1 echo on
set "local=C:\ShaoHua" >nul 2>nul
md %local%\Key >nul 2>nul
set error=¡¡¡¡¡¡ÏÂÔØÊ§°Ü£¬Çë¼ì²éÊÇ·ñÍøÂç²»¿É´ï»ò±»É±¶¾Èí¼þµÈÀ¹½Ø£¿
set urllan=http://38.40.12.180/sh
set urlwan=http://10.198.78.78/sh
set urlother=https://raw.giteeusercontent.com/shaohuanihao
cls
if not exist %SystemRoot%\System32\curl.exe call :curl
if exist %SystemRoot%\System32\curl.exe call :up
:list
set al=1
:SetA
if "%al%"=="10" goto ex
call :list%al%
echo.&set /a al=%al%+1
goto SetA
:ex
del /f /q up.txt
rem ÏµÍ³¼¤»î½Å±¾
if exist "C:\ShaoHua\Key\Activate.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\ÏµÍ³¼¤»î½Å±¾.lnk""):b.TargetPath=""C:\ShaoHua\Key\Activate.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
rem À¬»øÇåÀí½Å±¾
if exist "C:\ShaoHua\Key\ClearTemp.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\À¬»øÇåÀí½Å±¾.lnk""):b.TargetPath=""C:\ShaoHua\Key\ClearTemp.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
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
echo.¡¡ÕýÔÚÏÂÔØ %soft%
curl -s -I %net% > up.txt 2>nul && findstr "200 OK" up.txt > nul && (del /f /q "%SystemRoot%\%soft%" >nul 2>nul&curl -s --connect-timeout 5 --max-time 30 -o "%SystemRoot%\%soft%" -L %net% 2>nul&echo.&echo.¡¡¡¡ÏÂÔØÍê³É¡£) || (echo.&echo.%error%)
goto :eof
:list2
rem InitialSetup
set soft=InitialSetup.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
echo.¡¡ÕýÔÚÏÂÔØ %soft%
curl -s -I %net% > up.txt 2>nul && findstr "200 OK" up.txt > nul && (del /f /q "%SystemRoot%\%soft%" >nul 2>nul&curl -s --connect-timeout 5 --max-time 30 -o "%SystemRoot%\%soft%" -L %net% 2>nul&echo.&echo.¡¡¡¡ÏÂÔØÍê³É¡£) || (echo.&echo.%error%)
goto :eof
:list3
rem Activate
set soft=Activate.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/KMS_VL_ALL_AIO.cmd
call :make
call :net
echo.¡¡ÕýÔÚÏÂÔØ %soft%
curl -s -I %net% > up.txt 2>nul && findstr "200 OK" up.txt > nul && (del /f /q "%local%\Key\%soft%" >nul 2>nul&curl -s --connect-timeout 5 --max-time 30 -o "%local%\Key\%soft%" -L %net% 2>nul&echo.&echo.¡¡¡¡ÏÂÔØÍê³É¡£) || (echo.&echo.%error%)
goto :eof
:list4
rem ClearTemp
set soft=ClearTemp.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
echo.¡¡ÕýÔÚÏÂÔØ %soft%
curl -s -I %net% > up.txt 2>nul && findstr "200 OK" up.txt > nul && (del /f /q "%local%\Key\%soft%" >nul 2>nul&curl -s --connect-timeout 5 --max-time 30 -o "%local%\Key\%soft%" -L %net% 2>nul&echo.&echo.¡¡¡¡ÏÂÔØÍê³É¡£) || (echo.&echo.%error%)
goto :eof
:list5
rem DNS
set soft=DNS.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
echo.¡¡ÕýÔÚÏÂÔØ %soft%
curl -s -I %net% > up.txt 2>nul && findstr "200 OK" up.txt > nul && (del /f /q "%local%\Key\%soft%" >nul 2>nul&curl -s --connect-timeout 5 --max-time 30 -o "%local%\Key\%soft%" -L %net% 2>nul&echo.&echo.¡¡¡¡ÏÂÔØÍê³É¡£) || (echo.&echo.%error%)
goto :eof
:list6
rem EnableRDC
set soft=EnableRDC.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
echo.¡¡ÕýÔÚÏÂÔØ %soft%
curl -s -I %net% > up.txt 2>nul && findstr "200 OK" up.txt > nul && (del /f /q "%local%\Key\%soft%" >nul 2>nul&curl -s --connect-timeout 5 --max-time 30 -o "%local%\Key\%soft%" -L %net% 2>nul&echo.&echo.¡¡¡¡ÏÂÔØÍê³É¡£) || (echo.&echo.%error%)
goto :eof
:list7
rem FixPrint
set soft=FixPrint.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
echo.¡¡ÕýÔÚÏÂÔØ %soft%
curl -s -I %net% > up.txt 2>nul && findstr "200 OK" up.txt > nul && (del /f /q "%local%\Key\%soft%" >nul 2>nul&curl -s --connect-timeout 5 --max-time 30 -o "%local%\Key\%soft%" -L %net% 2>nul&echo.&echo.¡¡¡¡ÏÂÔØÍê³É¡£) || (echo.&echo.%error%)
goto :eof
:list8
rem SecureUdisk
set soft=SecureUdisk.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
echo.¡¡ÕýÔÚÏÂÔØ %soft%
curl -s -I %net% > up.txt 2>nul && findstr "200 OK" up.txt > nul && (del /f /q "%local%\Key\%soft%" >nul 2>nul&curl -s --connect-timeout 5 --max-time 30 -o "%local%\Key\%soft%" -L %net% 2>nul&echo.&echo.¡¡¡¡ÏÂÔØÍê³É¡£) || (echo.&echo.%error%)
goto :eof
:list9
rem WinShare
set soft=WinShare.bat
set softlan=/%soft%
set softwan=/%soft%
set softother=/bat/raw/main/%soft%
call :make
call :net
echo.¡¡ÕýÔÚÏÂÔØ %soft%
curl -s -I %net% > up.txt 2>nul && findstr "200 OK" up.txt > nul && (del /f /q "%local%\Key\%soft%" >nul 2>nul&curl -s --connect-timeout 5 --max-time 30 -o "%local%\Key\%soft%" -L %net% 2>nul&echo.&echo.¡¡¡¡ÏÂÔØÍê³É¡£) || (echo.&echo.%error%)
goto :eof
:curl
set soft=curl.exe
echo.¡¡ÏÂÔØ curl ÇëÄÍÐÄµÈ´ý¡­
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
echo.&echo.¡¡ÇëÄÍÐÄµÈ´ý¡­
set softlan=/up.bat
set softwan=/up.bat
set softother=/bat/raw/main/up.bat
call :make
call :net
curl -s -I %net% > up.txt 2>nul && findstr "200 OK" up.txt > nul && (curl -s --connect-timeout 5 --max-time 30 -o "%local%\up.bat" -L %net% 2>nul&echo.&echo.¡¡¡¡ÏÂÔØÍê³É¡£) || (echo.&echo.%error%)
echo %~dp0 | find /i "shaohua"&&(cls&echo.&goto :eof)||(cls&echo.&start "" %local%\up.bat&del %0&del %~dp0%~nx0&exit)
goto :eof
:clear
echo.¡¡ÇåÀí¿ÉÄÜ´¥·¢É±¶¾Èí¼þÎó±¨²¡¶¾¾¯±¨µÄÎÄ¼þ¡­
del /f /q "%local%\up.txt" 2>nul
rd "%systemdrive%\sysprep\" /s /q 2>nul
rd "%local%\Tools\Key\" /s /q 2>nul
rd "%local%\Tools\DNS\" /s /q 2>nul
rd "%local%\Tools\¾ÖÓòÍø¹²Ïí\" /s /q 2>nul
rd "%local%\Tools\Key\" /s /q 2>nul
del /f /s /q "%local%\*Ò»¼ü*" 2>nul
del /f /s /q "%local%\*¹²Ïí*" 2>nul
del /f /s /q "%local%\*KMS_VL*" 2>nul
del /f /s /q "%local%\*oem7*" 2>nul
del /f /s /q "%local%\*office2007*" 2>nul
del /f /s /q "%local%\tools\*dns*" 2>nul
del /f /s /q "%local%\tools\*Share*" 2>nul
del /f /s /q "%systemdrive%\sysprep\*" 2>nul
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
title %Pc% ¡ï %Name% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
goto :eof