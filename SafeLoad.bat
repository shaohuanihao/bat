ÿþa
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net session>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=SafeLoad
set Powered=Powered by ÉÛ»ª 18900559020
set Version=20260714
set Comment=ÔËÐÐÍê±Ïºó½Å±¾»á×Ô¶¯¹Ø±Õ£¬ÇëÎðÊÖ¶¯¹Ø±Õ£¡
title %Name% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
:start
call :killlist
call :CapsLK
call :fix
call :patch
call :killlist
call :downbat
echo.&echo.¡¡ÕýÔÚ¼ì²é·þÎñÆ÷Í¨Ñ¶¡­&echo.
call :ping
call :killlist
call :down
call :killlist
call :run
exit

:CapsLK
for /f "delims=" %%i in ('powershell -command "[console]::CapsLock"') do if "%%i"=="False" mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
goto :eof

:fix
echo.&echo.¡¡ÕýÔÚ¼ì²éÏµÍ³»·¾³¡­&echo.
schtasks /delete /tn "%Name%" /f >nul 2>nul
rem schtasks /create /tn "%Name%" /tr "C:\ShaoHua\Key\%Name%.bat" /sc ONLOGON /ru "Administrator" /rl highest /f >nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%Name%" /t REG_SZ /d "C:\ShaoHua\Key\%Name%.bat" /f >nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrives" /t REG_DWORD /d 8 /f >nul 2>nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoViewOnDrive /t REG_DWORD /d 8 /f >nul 2>nul
choice /T 1 /C SH /d H /N >nul 2>nul
if %errorlevel%==1 call :input
goto :eof

:patch
(ping -n 1 -w 50 10.198.78.78 >nul 2>&1 && set "server=10.198.78.78") || (ping -n 1 -w 50 10.198.78.150 >nul 2>&1 && set "server=10.198.78.150") || (if exist "D:\SH\Key\sos.bat" call "D:\SH\Key\sos.bat")
set no=1
set pingmax=6
set localbat=C:\ShaoHua\
set s_safeloadbat=http://%server%/SafeLoad.bat
set l_safeloadbat=%localbat%Key\SafeLoad.bat
set local=D:\SH\
set s_safebat=http://%server%/SafeBat.bat
set l_safebat=%local%Key\SafeBat.bat
set s_safetemp=http://%server%/SafeTemp.bat
set l_safetemp=%local%Key\SafeTemp.bat
set s_safepatch=http://%server%/SafePatch.bat
set l_safepatch=%local%Key\SafePatch.bat
set s_SafeClear=http://%server%/SafeClear.bat
set l_SafeClear=%local%Key\SafeClear.bat
set s_ClearTemp=http://%server%/ClearTemp.bat
set l_ClearTemp=%localbat%Key\ClearTemp.bat
set s_safec=http://%server%/SafeC.exe
set l_safec=%local%Key\SafeC.exe
set s_safed=http://%server%/SafeD.exe
set l_safed=%local%Key\SafeD.exe
goto :eof

:ping
ping -n 1 -w 200 %server% > nul && (goto :eof) || (set /a no+=1 & if %no% geq %pingmax% (goto :run) else (echo.¡¡ÍøÂç²»¿É´ï£¬µÚ%no%´Î³¢ÊÔ¡­ & timeout /t 1 > nul & goto :ping))
goto :eof

:downbat
echo.&echo.¡¡ÕýÔÚ¼ì²é½Å±¾×ÔÉí¸üÐÂ¡­&echo.
for /f "delims=" %%a in ('curl -L -o NUL "%s_safeloadbat%" --write-out "%%{http_code}" --silent --max-time 3') do set http_status=%%a
if "!http_status!" neq "200" goto :eof
set remote_size=
for /f "tokens=2" %%b in ('curl -sI "%s_safeloadbat%" ^| findstr /i "Content-Length:"') do set remote_size=%%b
for %%c in ("%~f0") do set local_size=%%~zc
if not "!remote_size!"=="!local_size!" (
    echo.¡¡·¢ÏÖÐÂ°æ±¾£¬ÕýÔÚ¸üÐÂ¡­
    set "temp_file=%TEMP%\SafeLoad_new.bat"
	curl --connect-timeout 3 -S -L -o "!temp_file!" --progress-bar "%s_safeloadbat%"
    if exist "!temp_file!" (
        copy /y "!temp_file!" "%~f0" >nul
        del "!temp_file!"
        echo.¡¡¸üÐÂÍê³É£¬ÖØÆôÖÐ¡­
        start "" "%~f0"
        exit
    )
) else (goto :eof)
goto :eof

:down
echo.&echo.¡¡ÕýÔÚ³¢ÊÔ¸üÐÂ·þÎñ¶Ë×îÐÂÎÄ¼þ¡­&echo.
if not exist "%local%key" (mkdir "%local%key") >nul 2>nul

:: ÏÂÔØº¯Êý
call :smart_download "%s_safebat%" "%l_safebat%" "SafeBat.bat"
call :smart_download "%s_safetemp%" "%l_safetemp%" "SafeTemp.bat"
call :smart_download "%s_safepatch%" "%l_safepatch%" "SafePatch.bat"
call :smart_download "%s_SafeClear%" "%l_SafeClear%" "SafeClear.bat"
call :smart_download "%s_ClearTemp%" "%l_ClearTemp%" "ClearTemp.bat"
call :smart_download "%s_safec%" "%l_safec%" "SafeC.exe"
call :smart_download "%s_safed%" "%l_safed%" "SafeD.exe"
goto :eof

:smart_download
set "url=%~1"
set "output=%~2"
for /f "delims=" %%a in ('curl -# -L -o NUL "%url%" --write-out "%%{http_code}" --silent --max-time 3') do (set http_status=%%a) >nul 2>nul
if "!http_status!" neq "200" (
    echo.¡¡Ä¿±ê²»¿É´ï£º!http_status!
    goto :eof
)
if exist "!output!" (
    for /f "tokens=2" %%b in ('curl -sI "!url!" ^| findstr /i "Content-Length:"') do set remote_size=%%b
    for %%c in ("!output!") do set local_size=%%~zc
    if "!remote_size!"=="!local_size!" (
        echo.¡¡ÒÑ´æÔÚ£¬Ìø¹ýÏÂÔØ
    ) else (
        echo.¡¡ÎÄ¼þ²»Ò»ÖÂ£¨±¾µØ:!local_size! ·þÎñÆ÷:!remote_size!£©£¬ÖØÐÂÏÂÔØ¡­
        curl --connect-timeout 3 -S -L -o "!output!" --progress-bar "!url!" && echo.¡¡ÏÂÔØ³É¹¦
    )
) else (
	echo.¡¡²»´æÔÚ£¬¿ªÊ¼ÏÂÔØ¡­    
	curl --connect-timeout 3 -S -L -o "!output!" --progress-bar "!url!" && echo.¡¡ÏÂÔØ³É¹¦
)
goto :eof

:run
del /q /f "C:\ShaoHua\Soft\Shadow Defender 1.5.0.726.exe" >nul 2>nul
if exist "%l_safetemp%" (echo.&echo.¡¡ÇëÄÍÐÄµÈ´ý¡­&start "" /wait "%l_safetemp%") 2>nul
if exist "%l_safec%" (start "" /wait "%l_safec%" -p"shaohuanihao") 2>nul
if exist "%l_safed%" (start "" /wait "%l_safed%" -p"shaohuanihao") 2>nul
if exist "%l_safepatch%" (echo.&echo.¡¡ÇëÄÍÐÄµÈ´ý¡­&start "" /wait "%l_safepatch%") 2>nul
if exist "%l_safebat%" (start "" "%l_safebat%") 2>nul
echo.&echo.¡¡ÊÇ·ñÇåÀíÏµÍ³À¬»øÎÄ¼þ£¿Ä¬ÈÏN£¨²»ÇåÀí£©£¬3Ãëºó×Ô¶¯Ìø¹ý²¢½áÊøÍË³ö¡£&echo.
choice /T 2 /C YN /d N
if %errorlevel%==1 if exist %l_safeclear% (start "" %l_safeclear%)
if %errorlevel%==0 echo.
echo.&echo.¡¡ËùÓÐ²¿ÊðÒÑÍê³É£¬¼´½«Õ¹¿ª×ÀÃæ¡£&timeout /t 2 > nul &start "" explorer
exit

:input
set /p input=""
if /i "%input%"=="disable" (reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%Name%" /f&schtasks /delete /tn "%Name%" /f)
if /i "%input%"=="shaohua" (goto :safe)
if /i "%input%"=="quit" (start "" explorer&exit)
if /i "%input%"=="exit" (start "" explorer&exit)
goto :eof

:safe
schtasks /delete /tn "%Name%" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "%Name%" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDrives" /f >nul 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoViewOnDrive" /f >nul 2>nul
start "" explorer
exit

:killlist
echo.&echo.¡¡ÇëÄÍÐÄµÈ´ýÏµÍ³³õÊ¼»¯Íê³É¡­
taskkill /f /im explorer.exe >nul 2>nul
for %%i in (WechatBrowser WechatAppLauncher WeChatAppEx WeChatExt crashpad_handler WeChat Weixin iexplore MicrosoftEdge chrome firefox 360se 360ent 360chrome sesvc OneDrive wpsoffice FRMI Lcserver lv007) do @taskkill /f /t /im "%%i.exe" 2>nul
goto :eof