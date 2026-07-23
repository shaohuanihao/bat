ÿþa
cls
@echo off
ver|findstr /i "5.1." >nul&&(goto:begin)
net session>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)

:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set "Name=SafePatch"
set "Powered=Powered by ÉÛ»ª 18900559020"
set "Version=20260714"
set "Comment=ÔËÐÐÍê±Ïºó½Å±¾»á×Ô¶¯¹Ø±Õ£¬ÇëÎðÊÖ¶¯¹Ø±Õ£¡"
title %Name% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
set "markdir=%SystemRoot%"
set "p=shaohuanihao"
set "local=D:\SH"
set "ver=202511101511 202511241850 202511271000 202512021856 202604071308 202607092300 202607092345 202607100046"
taskkill /f /im 7za.exe 2>nul
call :patch
call :always
exit

:patch
set "server="
(ping -n 1 -w 30 10.198.78.78 >nul 2>&1 && set "server=10.198.78.78") || (ping -n 1 -w 30 10.198.78.150 >nul 2>&1 && set "server=10.198.78.150") || echo.[INFO]  ÍøÂç²»¿É´ï£¬½«Ê¹ÓÃ±¾µØ»º´æ¼ÌÐøÖ´ÐÐ
if not exist "%local%\Soft" md "%local%\Soft" >nul 2>nul
if defined server (
    choice /T 1 /C SH /d H /N >nul 2>&1
    if !errorlevel!==1 call :input
    if not exist "%local%\Soft\7za.exe" call :smart_download "http://%server%/7za.exe" "%local%\Soft\7za.exe" ""
)
echo.
echo.[WARNING]  ÇëµÈ´ý½Å±¾Ö´ÐÐÍê±Ï£¬ÔÙ²Ù×÷µçÄÔ
for %%V in (%ver%) do (
    if "%%V"=="" (
        echo.[WARN]  ¼ì²âµ½¿Õ°æ±¾ºÅ£¬Ìø¹ý
    ) else if not exist "%markdir%\SafePatch%%V" (
        echo.
        call :%%V
    ) else (
        echo.
        echo.[SKIP]  %%V ÒÑÍê³É£¬Ìø¹ý
    )
)
echo.
echo.[DONE]  ËùÓÐ²¹¶¡´¦ÀíÍê³É
goto :eof

:input
set /p input=""
if /i "!input!"=="deepfix" (del /f /q "%local%\Soft\"&del /f /q "%markdir%\SafePatch*")
if /i "!input!"=="fix" (del /f /q "%markdir%\SafePatch*")
goto :eof

:get_md5
set "md5_file=%~1"
set "md5_result="
if not exist "%md5_file%" goto :eof
for /f "delims=" %%h in ('certutil -hashfile "%md5_file%" MD5 ^| findstr /v "CertUtil"') do set "md5_result=%%h"
set "md5_result=!md5_result: =!"
goto :eof

:smart_download
set "url=%~1"
set "output=%~2"
set "expected_md5=%~3"
if not defined server (
    echo.[INFO]  ÍøÂç²»¿É´ï£¬Ìø¹ýÏÂÔØ£¬½«Ê¹ÓÃ±¾µØ»º´æ
    goto :eof
)
if exist "%output%" (
    if not "!expected_md5!"=="" (
        call :get_md5 "%output%"
        if /i "!md5_result!"=="!expected_md5!" (
            echo.[INFO]  MD5Ò»ÖÂ
            goto :eof
        ) else (
            echo.[INFO]  MD5²»Ò»ÖÂ£¨±¾µØ:!md5_result! ÕýÈ·:!expected_md5!£©£¬ÖØÐÂÏÂÔØ
            del /f /q "%output%" >nul 2>nul
        )
    ) else (
        echo.[INFO]  ÎÄ¼þÒÑ´æÔÚ£¬ÎÞMD5Ð£Ñé£¬Ìø¹ýÏÂÔØ
        goto :eof
    )
) else (
    echo.[INFO]  ÎÄ¼þ²»´æÔÚ£¬¿ªÊ¼ÏÂÔØ
)
curl --connect-timeout 3 -S -L -o "%output%" --progress-bar "%url%"
if exist "%output%" (
    if not "!expected_md5!"=="" (
        call :get_md5 "%output%"
        if /i not "!md5_result!"=="!expected_md5!" (
            echo.[ERROR] MD5Ð£ÑéÊ§°Ü
            echo.[ERROR] ÕýÈ·: !expected_md5!
            echo.[ERROR] ±¾µØ: !md5_result!
            echo.[ERROR] ÖØÐÂÏÂÔØ
            del /f /q "%output%" >nul 2>nul
            goto :eof
        )
        echo.[INFO]  ÏÂÔØÍê³É£¬MD5Ð£ÑéÍ¨¹ý
    ) else (
        echo.[INFO]  ÏÂÔØÍê³É
    )
) else (
    echo.[INFO]  ÏÂÔØÊ§°Ü£¬½«Ê¹ÓÃ±¾µØ»º´æ
)
goto :eof

:always
echo.
echo.[STEP]  ÐÞ¸´Î¢ÐÅÍ¼±ê
if exist "C:\Program Files\Tencent\Weixin\Weixin.exe" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(""C:\Users\Public\Desktop\Î¢ÐÅ.lnk""):b.TargetPath=""C:\Program Files\Tencent\Weixin\Weixin.exe"":b.WorkingDirectory=""C:\Program Files\Tencent\Weixin"":b.Save:close") 2>nul
echo.[STEP]  ÉèÖÃä¯ÀÀÆ÷¹ØÁª
if exist "C:\Program Files\360ent\Application\360ent.exe" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\\360ÆóÒµ°²È«ä¯ÀÀÆ÷.lnk""):b.TargetPath=""C:\Program Files\360ent\Application\360ent.exe"":b.WorkingDirectory=""C:\Program Files\360ent\Application"":b.Save:close") 2>nul
if exist "C:\Program Files\Google\chrome\Application\chrome.exe" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(""C:\Users\Public\Desktop\Google Chrome.lnk""):b.TargetPath=""C:\Program Files\Google\chrome\Application\chrome.exe"":b.WorkingDirectory=""C:\Program Files\Google\chrome\Application"":b.Save:close") 2>nul
tasklist /fi "imagename eq ctfmon.exe" | find /i "ctfmon.exe" || start "" "%windir%\System32\ctfmon.exe" >nul 2>nul
goto :eof

:202511101511
set "this=202511101511"
set "mark=%markdir%\SafePatch%this%"
set "STEP=ÌÞ³ýÎÞÐ§Í¼±ê¡¢ÍÆËÍ360ä¯ÀÀÆ÷¡¢Ð¶ÔØJAVA"
title %STEP% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
echo.[PATCH] ÔËÐÐ %this%
echo.[STEP]  %STEP%
del /f /q "C:\Users\Public\Desktop\Î¢ÐÅ.lnk" >nul 2>nul
del /f /q "C:\Users\Public\Desktop\Google Chrome.lnk" >nul 2>nul
del /f /q "C:\Users\Public\Desktop\360ÆóÒµ°²È«ä¯ÀÀÆ÷.lnk" >nul 2>nul
del /f /q "C:\Users\Administrator\Desktop\Î¢ÐÅ.lnk" >nul 2>nul
del /f /q "C:\Users\Administrator\Desktop\Google Chrome.lnk" >nul 2>nul
del /f /q "C:\Users\Administrator\Desktop\´òÓ¡¹²Ïí½Å±¾.lnk" >nul 2>nul
echo.[STEP]  Ð¶ÔØJAVA
start /wait "" msiexec /x {26A24AE4-039D-4CA4-87B4-2F64180291F0} /qn /norestart
start /wait "" msiexec /x {64A3A4F4-B792-11D6-A78A-00B0D0180291} /qn /norestart
echo.[STEP]  Ð¶ÔØÀÏ°æ±¾Î¢ÐÅ
if exist "C:\Program Files\Tencent\WeChat\Uninstall.exe" start /wait "" "C:\Program Files\Tencent\WeChat\Uninstall.exe" /S
call :smart_download "http://%server%/%this%.7z" "%local%\Soft\%this%.7z" "51ef660feb6140007c1f0aac05868c54"
echo.[STEP]  ½âÑ¹ %this% ¸üÐÂ°ü
"%local%\Soft\7za.exe" x -p"%p%" -o"C:\" -y -bb1 "%local%\Soft\%this%.7z"
if errorlevel 1 (
    echo.[ERROR] ½âÑ¹Ê§°Ü£¬ÏÂ´ÎÔËÐÐ½«ÖØÊÔ
    goto :eof
)
set "chrome_path=C:\Program Files\Google\Chrome\Application\chrome.exe"
set "ent_path=C:\Program Files\360ent\Application\360ent.exe"
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome" /ve /d "Google Chrome" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities" /v "ApplicationName" /d "Google Chrome" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities" /v "ApplicationDescription" /d "Google Chrome ä¯ÀÀÆ÷" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities" /v "ApplicationIcon" /d "!chrome_path!,0" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\shell\open\command" /ve /d """!chrome_path!""" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\DefaultIcon" /ve /d "!chrome_path!,0" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities" /v "ApplicationCompany" /d "Google LLC" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\URLAssociations" /v "http" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\URLAssociations" /v "https" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\FileAssociations" /v ".htm" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\FileAssociations" /v ".html" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\FileAssociations" /v ".shtml" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\FileAssociations" /v ".xht" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\Google Chrome\Capabilities\FileAssociations" /v ".xhtml" /d "ChromeHTML" /f >nul 2>&1
reg add "HKLM\Software\RegisteredApplications" /v "Google Chrome" /d "Software\Clients\StartMenuInternet\Google Chrome\Capabilities" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent" /ve /d "360ÆóÒµ°²È«ä¯ÀÀÆ÷" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities" /v "ApplicationName" /d "360ÆóÒµ°²È«ä¯ÀÀÆ÷" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities" /v "ApplicationDescription" /d "360ÆóÒµ°²È«ä¯ÀÀÆ÷" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities" /v "ApplicationIcon" /d "!ent_path!,0" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\shell\open\command" /ve /d """!ent_path!""" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\DefaultIcon" /ve /d "!ent_path!,0" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities" /v "ApplicationCompany" /d "360.cn" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities\URLAssociations" /v "http" /d "360HTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities\URLAssociations" /v "https" /d "360HTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities\FileAssociations" /v ".htm" /d "360HTML" /f >nul 2>&1
reg add "HKLM\Software\Clients\StartMenuInternet\360ent\Capabilities\FileAssociations" /v ".html" /d "360HTML" /f >nul 2>&1
reg add "HKLM\Software\RegisteredApplications" /v "360ent" /d "Software\Clients\StartMenuInternet\360ent\Capabilities" /f >nul 2>&1
reg add "HKCR\ChromeHTML" /ve /d "Google Chrome HTML Document" /f >nul 2>&1
reg add "HKCR\ChromeHTML\DefaultIcon" /ve /d "!chrome_path!,0" /f >nul 2>&1
reg add "HKCR\ChromeHTML\shell\open\command" /ve /d """!chrome_path!" "%%1""" /f >nul 2>&1
reg add "HKCR\360HTML" /ve /d "360 Enterprise HTML Document" /f >nul 2>&1
reg add "HKCR\360HTML\DefaultIcon" /ve /d "!ent_path!,0" /f >nul 2>&1
reg add "HKCR\360HTML\shell\open\command" /ve /d """!ent_path!" "%%1""" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Kolbicz IT\SetUserFTA" /v "RunCount" /t reg_dword /d 1 /f >nul 2>&1
if exist "C:\ShaoHua\Tools\SetUserFTA.exe" (
    C:\ShaoHua\Tools\SetUserFTA.exe http ChromeHTML
    C:\ShaoHua\Tools\SetUserFTA.exe https ChromeHTML
    C:\ShaoHua\Tools\SetUserFTA.exe .htm ChromeHTML
    C:\ShaoHua\Tools\SetUserFTA.exe .html ChromeHTML
    C:\ShaoHua\Tools\SetUserFTA.exe .shtml ChromeHTML
    C:\ShaoHua\Tools\SetUserFTA.exe .xht ChromeHTML
    C:\ShaoHua\Tools\SetUserFTA.exe .xhtml ChromeHTML
) else (
    echo.[WARN]  SetUserFTA.exe ²»´æÔÚ£¬Ìø¹ýä¯ÀÀÆ÷¹ØÁªÉèÖÃ
)
reg add "HKCU\SOFTWARE\Kolbicz IT\SetUserFTA" /v "RunCount" /t reg_dword /d 1 /f >nul 2>&1
type nul > "%mark%"
echo.[DONE]  %this% ÒÑÍê³É
goto :eof

:202511241850
set "this=202511241850"
set "mark=%markdir%\SafePatch%this%"
set "STEP="
title %STEP% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
echo.[PATCH] ÔËÐÐ %this%
echo.[STEP]  %STEP%
echo.[INFO]  ²¹¶¡ÒÑ¸üÐÂÖÁ 202607100046£¬Ìø¹ý²Ù×÷
type nul > "%mark%"
echo.[DONE]  %this% ÒÑÍê³É
goto :eof

:202511271000
set "this=202511271000"
set "mark=%markdir%\SafePatch%this%"
set "STEP=²¹È«DNS"
title %STEP% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
echo.[PATCH] ÔËÐÐ %this%
echo.[STEP]  %STEP%
netsh interface ipv4 add dnsservers "ÒÔÌ«Íø" address="61.132.163.68" index=1 validate=no >nul 2>nul
netsh interface ipv4 add dnsservers "ÒÔÌ«Íø" address="218.104.78.2" index=2 validate=no >nul 2>nul
netsh interface ipv4 delete dnsservers "ÒÔÌ«Íø" 3 >nul 2>nul
netsh interface ipv4 add dnsservers "ÒÔÌ«Íø 2" address="61.132.163.68" index=1 validate=no >nul 2>nul
netsh interface ipv4 add dnsservers "ÒÔÌ«Íø 2" address="218.104.78.2" index=2 validate=no >nul 2>nul
netsh interface ipv4 delete dnsservers "ÒÔÌ«Íø 2" 3 >nul 2>nul
netsh interface ipv4 add dnsservers "ÒÔÌ«Íø 3" address="61.132.163.68" index=1 validate=no >nul 2>nul
netsh interface ipv4 add dnsservers "ÒÔÌ«Íø 3" address="218.104.78.2" index=2 validate=no >nul 2>nul
netsh interface ipv4 delete dnsservers "ÒÔÌ«Íø 3" 3 >nul 2>nul
type nul > "%mark%"
echo.[DONE]  %this% ÒÑÍê³É
goto :eof

:202512021856
set "this=202512021856"
set "mark=%markdir%\SafePatch%this%"
set "STEP=É¾³ý¿ÉÄÜÎó±¨ÎÄ¼þ"
title %STEP% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
echo.[PATCH] ÔËÐÐ %this%
echo.[STEP]  %STEP%
del /f /q "C:\ShaoHua\Tools\PrintBox.exe" >nul 2>nul
type nul > "%mark%"
echo.[DONE]  %this% ÒÑÍê³É
goto :eof

:202604071308
set "this=202604071308"
set "mark=%markdir%\SafePatch%this%"
set "STEP=É¾³ý¿ÉÄÜÎó±¨ÎÄ¼þ"
title %STEP% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
echo.[PATCH] ÔËÐÐ %this%
echo.[STEP]  %STEP%
del /q /f "C:\Windows\shaohua.bat" >nul 2>nul
del /q /f "C:\Program Files (x86)\SysCeo\DrvCeo\Res\dcbcx86.dll" >nul 2>nul
type nul > "%mark%"
echo.[DONE]  %this% ÒÑÍê³É
goto :eof

:202607092300
set "this=202607092300"
set "mark=%markdir%\SafePatch%this%"
set "STEP=Êý¾Ý±£ÏÕÏäÐÞ¸´"
title %STEP% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
echo.[PATCH] ÔËÐÐ %this%
echo.[STEP]  %STEP%
tasklist /FI "IMAGENAME eq interface.exe" 2>nul | find /I "interface.exe" >nul && goto tips_closed_202607092300
call :smart_download "http://%server%/%this%.msi" "%local%\Soft\%this%.msi" "3b379bd8233673e51836e50d3a07c848"
echo.[STEP]  ¿ªÊ¼°²×°£¬Õâ²½»á³¬¼¶Âý£¬´ó¸Å1-2·ÖÖÓ£¬Çë±£³ÖÄÍÐÄ
msiexec /i "%local%\Soft\%this%.msi" /qn APPDIR="D:\Hsbank\TPMClient\" IN_SERVER_ADDR="60.16.12.69" REBOOT="ReallySuppress" /l*v "C:\SafePatch_%this%.log"
if errorlevel 1 (
    echo.[ERROR] °²×°Ê§°Ü£¬Çë½«´íÎóÈÕÖ¾·¢¸øÎÒ
    goto :eof
)
set "max=240"
set /a count=0
:wait_tips_202607092300
powershell -NoProfile -Command "if (Get-Process | Where-Object { $_.MainWindowTitle -and $_.MainWindowTitle -like '*ÌáÊ¾*' }) { exit 0 } else { exit 1 }"
if not errorlevel 1 (
    C:\Windows\nircmd.exe win close title "ÌáÊ¾"
    timeout /t 1 /nobreak >nul
    powershell -NoProfile -Command "if (Get-Process | Where-Object { $_.MainWindowTitle -and $_.MainWindowTitle -like '*ÌáÊ¾*' }) { exit 0 } else { exit 1 }"
    if errorlevel 1 goto tips_closed_202607092300
)
set /a count+=1
if !count! GEQ !max! goto tips_closed_202607092300
timeout /t 1 /nobreak >nul
goto wait_tips_202607092300
:tips_closed_202607092300
C:\Windows\nircmd.exe restartexplorer
type nul > "%mark%"
echo.[DONE]  %this% ÒÑÍê³É
goto :eof

:202607092345
set "this=202607092345"
set "mark=%markdir%\SafePatch%this%"
set "STEP=Î¢ÐÅ4.1.11¸üÐÂ"
title %STEP% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
echo.[PATCH] ÔËÐÐ %this%
echo.[STEP]  %STEP%
call :smart_download "http://%server%/%this%.7z" "%local%\Soft\%this%.7z" "79f6cb09c41784c9fe8b04ed92003cd8"
echo.[STEP]  ¿ªÊ¼½âÑ¹¸üÐÂ
"%local%\Soft\7za.exe" x -p"%p%" -o"C:\" -y -bb1 "%local%\Soft\%this%.7z"
if errorlevel 1 (
    echo.[ERROR] ½âÑ¹Ê§°Ü£¬ÏÂ´ÎÔËÐÐ½«ÖØÊÔ
    goto :eof
)
type nul > "%mark%"
echo.[DONE]  %this% ÒÑÍê³É
goto :eof

:202607100046
set "this=202607100046"
set "mark=%markdir%\SafePatch%this%"
set "STEP=¿´Í¼Èí¼þ¸üÐÂ"
title %STEP% ¡ï %Powered% ¡ï Ver%Version% ¡ï %Comment%
echo.[PATCH] ÔËÐÐ %this%
echo.[STEP]  %STEP%
call :smart_download "http://%server%/%this%.7z" "%local%\Soft\%this%.7z" "5b1435b473cb924aef74e2a20a526a7a"
echo.[STEP]  ¿ªÊ¼½âÑ¹¸üÐÂ
"%local%\Soft\7za.exe" x -p"%p%" -o"C:\" -y -bb1 "%local%\Soft\%this%.7z"
if errorlevel 1 (
    echo.[ERROR] ½âÑ¹Ê§°Ü£¬ÏÂ´ÎÔËÐÐ½«ÖØÊÔ
    goto :eof
)
echo.[STEP]  ÉèÖÃÎÄ¼þ¹ØÁª
if exist "C:\Program Files\Imagine\Imagine64.exe" (
    start "" "C:\Program Files\Imagine\Imagine64.exe" /assocext
    if errorlevel 1 (
        echo.[WARN]  ÎÄ¼þ¹ØÁªÉèÖÃÊ§°Ü£¬µ«ÈÔÐ´ÈëÍê³É±ê¼Ç
    )
) else (
    echo.[WARN]  Imagine ²»´æÔÚ£¬Ìø¹ýÎÄ¼þ¹ØÁª
)
type nul > "%mark%"
echo.[DONE]  %this% ÒÑÍê³É
goto :eof