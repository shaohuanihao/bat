��a
cls
echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
echo off&chcp 65001&cls&disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=综合脚本
set Powered=Powered by 邵华 18900559020
set Version=20230620
set Comment=运行完毕后脚本会自动关闭，请勿手动关闭！
title %Name% ★ %Powered% ★ Ver%Version% ★ %Comment%
mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
:password
cls&echo.&echo.&echo.&echo.&echo.&echo.&echo.&echo.&echo.&set /p pwd=　　　　　　　　　　　　　　　　　　Password:
if /i "%pwd%" neq "shaohua" goto password
:start
rem 开启cmd-admin
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v %windir%\system32\cmd.exe /t reg_sz /d RUNASADMIN /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v %windir%\system32\cmd.exe /t reg_sz /d RUNASADMIN /f
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v %windir%\SysWOW64\cmd.exe /t reg_sz /d RUNASADMIN /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v %windir%\SysWOW64\cmd.exe /t reg_sz /d RUNASADMIN /f
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v %windir%\system32\conhost.exe /t reg_sz /d RUNASADMIN /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v %windir%\system32\conhost.exe /t reg_sz /d RUNASADMIN /f
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v %windir%\System32\WindowsPowerShell\v1.0\powershell.exe /t reg_sz /d RUNASADMIN /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v %windir%\System32\WindowsPowerShell\v1.0\powershell.exe /t reg_sz /d RUNASADMIN /f
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v %windir%\SysWOW64\WindowsPowerShell\v1.0\powershell.exe /t reg_sz /d RUNASADMIN /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v %windir%\SysWOW64\WindowsPowerShell\v1.0\powershell.exe /t reg_sz /d RUNASADMIN /f
cls&choice /T 1 /C SHA /d A /N >nul 2>nul
if %errorlevel%==3 goto licensed
if %errorlevel%==2 goto upanset
if %errorlevel%==1 goto upanout
:licensed
arp -a|findstr /i "38.40." >nul && (set Pc=HS-Lan)||(arp -a|findstr /i "38.41." >nul && (set Pc=HS-Lan)||(arp -a|findstr /i "10.198." >nul && (set Pc=HS-Wan)||(set Pc=PC-Other&cls&echo. &echo.　暂无法判断您的环境&echo.&echo.　本脚本专供于徽商银行马鞍山地区网络环境使用&echo.　如您有定制需求请于我司联系&echo. &echo.　马鞍山创锐电子科技有限公司 - 邵华 - 7x24H - 18900559020&timeout /t 6 >nul&exit)))
:UPtime
title %Pc% ★ %Name% ★ %Powered% ★ Ver%Version% ★ %Comment%
rem 指定NTP服务器
if %Pc% EQU HS-Lan goto NPCtime
if %Pc% EQU HS-Wan goto WPCtime
:NPCtime
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v 3 /t REG_SZ /d 38.40.254.254 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v NtpServer /t REG_SZ /d 38.40.254.254 /f
w32tm /config /manualpeerlist:"38.40.254.254" /syncfromflags:manual /reliable:yes /update 2>nul
goto endtime
:WPCtime
w32tm /config /manualpeerlist:"time.windows.com" /syncfromflags:manual /reliable:yes /update 2>nul
goto endtime
:endtime
sc config w32time start= auto 2>nul
net stop w32time >nul 2>nul
net start w32time >nul 2>nul
w32tm /resync 2>nul
:upanset
rem 安全U盘_v1_V2_V3_DEL
del /f /q "%userprofile%\Desktop\安全U盘.lnk" 2>nul
del /f /q "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Network Shortcuts\安全U盘.exe" 2>nul
del /f /q "%UserProfile%\AppData\Roaming\Microsoft\Windows\Network Shortcuts\安全U盘.exe" 2>nul
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKCU\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKLM\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
del /f /q "%userprofile%\Desktop\安全U盘_V2.lnk" 2>nul
del /f /q "%userprofile%\Desktop\安全U盘_V3.lnk" 2>nul
if exist "C:\ShaoHua\Soft\FugueExplorer_v3.exe" (goto upanstart) else (goto upanout)
:upanstart
rem 安全U盘_V3_ADD
if not exist "C:\ShaoHua\Soft\FugueExplorer_v3.exe" goto upanout
start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\安全U盘_V3.lnk""):b.TargetPath=""C:\ShaoHua\Soft\FugueExplorer_v3.exe"":b.WorkingDirectory=""C:\ShaoHua\Soft"":b.Save:close") 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "安全U盘_V3" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "安全U盘_V3" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "安全U盘_V3" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "InfoTip" /t reg_sz /d "快捷补丁By_ShaoHua" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "LocalizedString" /t reg_sz /d "安全U盘_V3" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "System.ItemAuthors" /t reg_sz /d "快捷补丁By_ShaoHua" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /v "TileInfo" /t reg_sz /d "prop:System.ItemAuthors" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\DefaultIcon" /ve /t reg_expand_sz /d "C:\ShaoHua\Soft\FugueExplorer_v3.exe" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\Shell\Open\Command" /ve /t reg_sz /d "C:\ShaoHua\Soft\FugueExplorer_v3.exe" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\Instance" /v "CLSID" /t reg_sz /d "{0AFACED1-E828-11D1-9187-B532F1E9575D}" /f
reg add "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}\Instance\InitPropertyBag" /v "Target" /t reg_sz /d "C:\ShaoHua\Soft\\" /f
reg add "HKCU\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "安全U盘_V3" /f
reg add "HKLM\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F69}" /ve /t reg_sz /d "安全U盘_V3" /f
:upanout
mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
rem 关闭所有浏览器
taskkill /f /t /im iexplore.exe 2>nul
taskkill /f /t /im chrome.exe  2>nul
taskkill /f /t /im firefox.exe  2>nul
taskkill /f /t /im WeChat.exe 2>nul
taskkill /f /t /im WechatBrowser.exe 2>nul
taskkill /f /t /im 360se.exe 2>nul
taskkill /f /t /im sesvc.exe 2>nul
rem 最大化提高系统自带电源管理性能
echo 切换电源方案为【高性能】
Powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo 从不关闭显示器
Powercfg -x -monitor-timeout-dc 0
Powercfg -x -monitor-timeout-ac 0
echo 从不关闭硬盘
powercfg -x -disk-timeout-dc 0
powercfg -x -disk-timeout-ac 0
echo 从不自动进入睡眠状态
powercfg -hibernate off
powercfg -x -standby-timeout-dc 0
powercfg -x -standby-timeout-ac 0
echo 从不自动进入休眠状态
powercfg -x -hibernate-timeout-dc 0
powercfg -x -hibernate-timeout-ac 0
echo 关闭显示器前等待时间: 从不
powercfg -change -monitor-timeout-ac 0
powercfg -change -monitor-timeout-dc 0
echo 唤醒时不需要密码
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c fea3413e-7e05-4911-9a71-700331f1c294 0e796bdb-100d-47d6-a2d5-f7d2daa51f51 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c fea3413e-7e05-4911-9a71-700331f1c294 0e796bdb-100d-47d6-a2d5-f7d2daa51f51 0
echo 从不关闭硬盘
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
echo JavaScript 计时器频率最高性能
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 02f815b5-a5cf-4c84-bf20-649d1f75d3d8 4c793e7d-a264-42e1-87d3-7a0d2f523ccd 1
echo 桌面允许放映幻灯片
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 0d7dbae2-4294-402a-ba8e-26777e8488cd 309dce9b-bef4-4119-9921-a851fb12f0f4 0
echo 无线适配器最高性能
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
echo 从不自动进入睡眠
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
echo 允许混合睡眠
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 94ac6d29-73ce-41a6-809f-6363ba21b47e 1
echo 从不自动进入休眠
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 9d7815a6-7ee4-497e-8888-515a05f02364 0
echo 允许使用唤醒定时器
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 238c9fa8-0aad-41ed-83f4-97be242c8f20 bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d 1
echo USB 选择性暂停设置
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
echo 合上盖子，不采取任何操作
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
echo 按下电源按钮为关机
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3
echo 按下睡眠按钮为睡眠
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 96996bc0-ad50-47ec-923b-6f41874dd9eb 1
echo 系统散热方式为主动
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
echo 媒体共享时，阻止计算机进入睡眠状态
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 03680956-93bc-4294-bba6-4e0f09bb717f 1
echo Video playback quality bias
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 1
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 10778347-1370-4ee0-8bbd-33bdacaade49 1
echo 播放视频时，优化视频质量
powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0
powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 9596fb26-9850-41fd-ac3e-f7c3c00afd4b 34c7b99f-9a6d-4b3c-8dc7-b6693b78cef4 0
echo 禁用系统休眠
powercfg -h off
del c:\hiberfil.sys /f /q 2>nul
rem 设置锁屏
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t reg_sz /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaverIsSecure" /t reg_sz /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveTimeOut" /t reg_sz /d "180" /f
rem 设置IE
taskkill /f /t /im iexplore.exe 2>nul
taskkill /f /t /im chrome.exe  2>nul
taskkill /f /t /im firefox.exe  2>nul
taskkill /f /t /im WeChat.exe 2>nul
taskkill /f /t /im WechatBrowser.exe 2>nul
taskkill /f /t /im 360se.exe 2>nul
taskkill /f /t /im sesvc.exe 2>nul
rem 取消关闭浏览器自动清理记录
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Privacy" /v "ClearBrowsingHistoryOnExit" /d "0" /t reg_dword /f
rem 设置IE控件
rem  ActiveX控件设置
set bl=0
:SetActiver
if "%bl%"=="5" goto ex
set regpath=HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\%bl%
echo ZONE%bl%
rem 安全级别12000=高、11500=中-高、11000＝中、10500＝中低、10000＝低、0=自定义
reg add "%regpath%" /v "CurrentLevel" /d "0" /t reg_dword /f
rem 下载已签名的ActiveX控件
reg add "%regpath%" /v "1001" /d "0" /t reg_dword /f
rem 下载未签名的ActiveX控件
reg add "%regpath%" /v "1004" /d "0" /t reg_dword /f
rem 运行 ActiveX 控件和插件
reg add "%regpath%" /v "1200" /d "0" /t reg_dword /f
rem 对没有标记为可安全执行脚本的 ActiveX 控件进行初始化和脚本运行
reg add "%regpath%" /v "1201" /d "0" /t reg_dword /f
rem 允许 Microsoft 网页浏览器控件的脚本
reg add "%regpath%" /v "1206" /d "0" /t reg_dword /f
rem 允许 Internet Explorer Web 浏览器控件的脚本编写
reg add "%regpath%" /v "1207" /d "0" /t reg_dword /f
rem 允许以前未使用的 ActiveX 控件在没有提示的情况下运行
reg add "%regpath%" /v "1208" /d "0" /t reg_dword /f
rem 允许脚本小程序
reg add "%regpath%" /v "1209" /d "0" /t reg_dword /f
rem 覆盖每站点（基于域）ActiveX 限制
reg add "%regpath%" /v "120A" /d "0" /t reg_dword /f
rem 覆盖每站点（基于域）ActiveX 限制
reg add "%regpath%" /v "120B" /d "3" /t reg_dword /f
rem 未知
reg add "%regpath%" /v "120C" /d "0" /t reg_dword /f
rem 活动脚本编写
reg add "%regpath%" /v "1400" /d "0" /t reg_dword /f
rem Java 小程序脚本编写
reg add "%regpath%" /v "1402" /d "0" /t reg_dword /f
rem 对标记为可安全执行脚本的 ActiveX 控件执行脚本
reg add "%regpath%" /v "1405" /d "0" /t reg_dword /f
rem 跨域访问数据源
reg add "%regpath%" /v "1406" /d "0" /t reg_dword /f
rem 允许编程剪贴板访问
reg add "%regpath%" /v "1407" /d "0" /t reg_dword /f
rem 未知
reg add "%regpath%" /v "1408" /d "0" /t reg_dword /f
rem 启用 XSS 筛选器
reg add "%regpath%" /v "1409" /d "3" /t reg_dword /f
rem 提交未加密的表单数据
reg add "%regpath%" /v "1601" /d "0" /t reg_dword /f
rem 字体下载
reg add "%regpath%" /v "1604" /d "0" /t reg_dword /f
rem 运行 Java
reg add "%regpath%" /v "1605" /d "0" /t reg_dword /f
rem 用户数据持久性
reg add "%regpath%" /v "1606" /d "0" /t reg_dword /f
rem 跨域浏览子框架
reg add "%regpath%" /v "1607" /d "0" /t reg_dword /f
rem 允许 META REFRESH
reg add "%regpath%" /v "1608" /d "0" /t reg_dword /f
rem 显示混合内容
reg add "%regpath%" /v "1609" /d "0" /t reg_dword /f
rem 在将文件上载到服务器时包括本地目录路径
reg add "%regpath%" /v "160A" /d "0" /t reg_dword /f
rem 桌面项目的安装
reg add "%regpath%" /v "1800" /d "0" /t reg_dword /f
rem 拖放或复制和粘贴文件
reg add "%regpath%" /v "1802" /d "0" /t reg_dword /f
rem 文件下载
reg add "%regpath%" /v "1803" /d "0" /t reg_dword /f
rem 在 IFRAME 中启动程序和文件
reg add "%regpath%" /v "1804" /d "0" /t reg_dword /f
rem 在 Web 视图中启动程序和文件
reg add "%regpath%" /v "1805" /d "0" /t reg_dword /f
rem 启动应用程序和不安全文件
reg add "%regpath%" /v "1806" /d "0" /t reg_dword /f
rem 启动应用程序和不安全文件
reg add "%regpath%" /v "1807" /d "0" /t reg_dword /f
reg add "%regpath%" /v "1808" /d "0" /t reg_dword /f
rem 使用弹出窗口阻止程序
reg add "%regpath%" /v "1809" /d "3" /t reg_dword /f
reg add "%regpath%" /v "1812" /d "0" /t reg_dword /f
rem 保留
reg add "%regpath%" /v "180A" /d "0" /t reg_dword /f
reg add "%regpath%" /v "180B" /d "0" /t reg_dword /f
reg add "%regpath%" /v "180C" /d "0" /t reg_dword /f
reg add "%regpath%" /v "180D" /d "0" /t reg_dword /f
rem 用户身份验证：登录0=运行自动 10000=65536=提示用户输入
reg add "%regpath%" /v "1A00" /d "65536" /t reg_dword /f
rem 允许计算机上存储的持久 cookie
reg add "%regpath%" /v "1A02" /d "0" /t reg_dword /f
rem 允许每会话 cookie
reg add "%regpath%" /v "1A03" /d "0" /t reg_dword /f
rem 其他：没有证书或只有一个证书时不提示进行客户证书选择
reg add "%regpath%" /v "1A04" /d "0" /t reg_dword /f
rem 允许第三方持久 cookie
reg add "%regpath%" /v "1A05" /d "0" /t reg_dword /f
rem 允许第三方会话 cookie
reg add "%regpath%" /v "1A06" /d "0" /t reg_dword /f
rem 隐私设置
reg add "%regpath%" /v "1A10" /d "0" /t reg_dword /f
rem Java 权限30000=7530 196608=低 131072=中 65536=高 0=禁用
reg add "%regpath%" /v "1C00" /d "196608" /t reg_dword /f
rem 其他：软件频道权限30000=7530
reg add "%regpath%" /v "1E05" /d "30000" /t reg_dword /f
rem ActiveX 控件和插件：二进制和脚本行为
reg add "%regpath%" /v "2000" /d "0" /t reg_dword /f
rem 运行已用 Authenticode 签名的组件
reg add "%regpath%" /v "2001" /d "0" /t reg_dword /f
rem 运行未用 Authenticode 签名的组件
reg add "%regpath%" /v "2004" /d "0" /t reg_dword /f
reg add "%regpath%" /v "2005" /d "0" /t reg_dword /f
rem 带有清单的权限的组件3＝禁用、10000＝高安全级=65536
reg add "%regpath%" /v "2007" /d "65536" /t reg_dword /f
rem 基于内容打开文件，而不是基于文件扩展名
reg add "%regpath%" /v "2100" /d "0" /t reg_dword /f
rem 允许 在低特权 Web 内容区域中的网站可以导航到此区域
reg add "%regpath%" /v "2101" /d "0" /t reg_dword /f
rem 允许由脚本初始化的窗口，没有大小和位置限制
reg add "%regpath%" /v "2102" /d "0" /t reg_dword /f
rem 允许通过脚本更新状态栏
reg add "%regpath%" /v "2103" /d "0" /t reg_dword /f
rem 允许网站打开没有地址或状态栏的窗口
reg add "%regpath%" /v "2104" /d "0" /t reg_dword /f
rem 脚本：允许网站使用脚本窗口提示信息 ^
reg add "%regpath%" /v "2105" /d "0" /t reg_dword /f
reg add "%regpath%" /v "2106" /d "0" /t reg_dword /f
reg add "%regpath%" /v "2107" /d "0" /t reg_dword /f
rem 文件下载自动提示
reg add "%regpath%" /v "2200" /d "0" /t reg_dword /f
rem ActiveX 控件自动提示
reg add "%regpath%" /v "2201" /d "0" /t reg_dword /f
rem 允许通过受限制的协议的活动内容访问我的电脑
reg add "%regpath%" /v "2300" /d "0" /t reg_dword /f
rem 其他：使用钓鱼网站筛选器
reg add "%regpath%" /v "2301" /d "3" /t reg_dword /f
rem .NET Framework：XAML 浏览器应用程序
reg add "%regpath%" /v "2400" /d "0" /t reg_dword /f
rem  .NET Framework：XPS 文档
reg add "%regpath%" /v "2401" /d "0" /t reg_dword /f
rem .NET Framework：松散 XAML
reg add "%regpath%" /v "2402" /d "0" /t reg_dword /f
rem 关闭区域保护模式0x0（开启），0x3（关闭）
reg add "%regpath%" /v "2500" /d "3" /t reg_dword /f
rem 启用 .NET Framework 安装程序
reg add "%regpath%" /v "2600" /d "0" /t reg_dword /f
rem 启用 .NET Framework 设置
reg add "%regpath%" /v "2700" /d "3" /t reg_dword /f
rem 允许ActiveX筛选
reg add "%regpath%" /v "2702" /d "0" /t reg_dword /f
rem 启用：第权限WEB内容区域中的网站可以导航到此区域
reg add "%regpath%" /v "2707" /d "0" /t reg_dword /f
reg add "%regpath%" /v "2708" /d "0" /t reg_dword /f
reg add "%regpath%" /v "2709" /d "0" /t reg_dword /f
rem “在AC控件上运行反恶意软件”-关闭
reg add "%regpath%" /v "270B" /d "0" /t reg_dword /f
reg add "%regpath%" /v "270C" /d "3" /t reg_dword /f
rem 级别
reg add "%regpath%" /v "MinLevel" /d "10000" /t reg_dword /f
reg add "%regpath%" /v "RecommendedLevel" /d "10000" /t reg_dword /f
set /a bl=%bl%+1
goto SetActiver
:ex
rem 允许直接运行来自网络的exebat
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations /v ModRiskFileTypes /t REG_SZ /d .bat;.exe;.reg;.vbs;.zip;.rar;.7z /f
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Associations /v ModRiskFileTypes /t REG_SZ /d .bat;.exe;.reg;.vbs;.zip;.rar;.7z /f
rem IE不提示我保存密码
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "FormSuggest PW Ask" /t Reg_Sz /d "no" /f
rem IE不提示密码
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "FormSuggest Passwords" /t Reg_Sz /d "no" /f
rem IE不使用自动完成功能
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "Use FormSuggest" /t Reg_Sz /d "no" /f
rem 设置在 Internet Explorer 中打开链接的方式
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v AssociationActivationMode /t REG_DWORD /d 0 /f
rem 在 IE 中打开 ActiveX 控件日志记录
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v AuditModeEnabled /t REG_DWORD /d 1 /f
rem 删除IE 中过时的 ActiveX 控件的这次运行按钮
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v RunThisTimeEnabled /t REG_DWORD /d 0 /f
rem 删除IE 中禁用的 ActiveX 控件
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Ext\Settings" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Ext\Settings" /f
rem 禁用IE自动崩溃恢复
reg add "HKCU\Software\Microsoft\Internet Explorer\Recovery" /v AutoRecover /t REG_DWORD /d 2 /f
rem 关闭对 IE 的过时 ActiveX 控件的阻止
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v VersionCheckEnabled /t REG_DWORD /d 0 /f
rem 删除IE的过期ActiveX控件阻止通知中的“更新”按钮
reg add "HKCU\Software\Microsoft\Internet Explorer\VersionManager" /v UpdateEnabled /t REG_DWORD /d 0 /f
rem 关闭UAC
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t reg_dword /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t reg_dword /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t reg_dword /d 0 /f
rem 在兼容性视图中显示所有网站
reg add "HKCU\Software\Microsoft\Internet Explorer\BrowserEmulation" /v "AllSitesCompatibilityMode" /t reg_dword /d 1 /f
rem 输入法默认语言  0 中文，1 英文
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t reg_dword /d 1 /f
rem 输入法智能模糊拼音  0 禁用，1 启用
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableSmartFuzzyPinyin" /t reg_dword /d 1 /f
rem 输入法模糊拼音  0 禁用，1 启用
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Fuzzy Input" /t reg_dword /d 1 /f
rem 输入法自学习  0 为禁用，1 为启用
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable self-learning" /t reg_dword /d 1 /f
rem 输入法智能自学习  0 为禁用，1 为启用
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableSmartSelfLearning" /t reg_dword /d 1 /f
rem 输入法云计算  0 为禁用，1 为启用
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Cloud Candidate" /t reg_dword /d 0 /f
rem 输入法中英文切换快捷键（默认 ctrl + 空格，还可使用）0 默认为 shift，1 为 ctrl，2 为 无
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "English Switch Key" /t reg_dword /d 0 /f
rem 输入法显示新词热词  0 为禁用，1 为启用
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableHap" /t reg_dword /d 0 /f
rem 输入法显示新词热词搜索的提示  0 为禁用，1 为启用
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Hot And Popular Word Search" /t reg_dword /d 0 /f
rem 记事本自动换行
reg add "HKCU\Software\Microsoft\Notepad" /v "fWrap" /t reg_dword /d 1 /f
rem 记事本终显示状态栏
reg add "HKCU\Software\Microsoft\Notepad" /v "StatusBar" /t reg_dword /d 1 /f
rem 快捷方式不添加快捷方式的文字
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Link" /d "00000000" /t reg_binary /f
rem 兼容性视图中添加网站
reg add "HKCU\Software\Microsoft\Internet Explorer\BrowserEmulation\ClearableListData" /v "UserFilter" /d "411f00005308adba1b0000003c040000010000001b0000000c00000004f493222487d601010000000c00330039002e00310039002e00310031002e003100370037000c000000fd9c074d2487d601010000000a0068007300620061006e006b002e0063006f006d000c0000000054236e2487d601010000000c00330038002e00310039002e00310031002e003100370036000c00000072f633952487d601010000000c00330038002e00310039002e00310039002e003100310034000c000000f3fb70bc2487d601010000000c00330038002e00310039002e00310039002e003200340030000c00000089614bc92487d6010100000003002a002e002a000c0000005b847eabfcbed601010000000c00330038002e00310039002e00310039002e003100350037000c0000008cfd718833ced601010000000b00330038002e00310039002e00310037002e00380030000c00000070381f9433ced601010000000b00330038002e00310039002e00310033002e00370030000c000000b8e4df9c33ced601010000000b00330038002e00310039002e00360034002e00330035000c00000050ba78a333ced601010000000c00330038002e00340030002e00310035002e003100300031000c000000960235af33ced6010100000007006800730062002e00620069007a000c0000001366e42c34ced601010000000b00330038002e00310039002e00370039002e00350035000c000000917dab825729d701010000000b00330038002e00310039002e00370039002e00340035000c0000001197e8875729d701010000000c00330038002e00310039002e00310039002e003100370032000c0000003998c8720d4dd701010000000c00330038002e00310039002e00310033002e003200340031000c00000097a5e72f6154d701010000000c00330038002e00310039002e00310039002e003200340033000c000000459afabc195cd701010000000b00330038002e00310039002e00310039002e00370038000c00000091ee0d178f5ed701010000000c00330038002e00310039002e00370037002e003100300034000c000000ce2a8ae6b7b2d70101000000090068007300620061006e006b002e00630063000c000000b6b5c1eeb7b2d701010000000b00330038002e00310030002e00360038002e00330032000c00000085dc69f3b7b2d701010000000b00330038002e00310030002e00360038002e00330038000c000000d223a28509a3d801010000000b00330038002e00310039002e00310039002e00350032000c0000005a097aa609a3d801010000000b00330038002e00310039002e00310039002e00380037000c0000009129ce0a46a5d801010000000b00330038002e00310039002e00310036002e00330033000c0000008a48ee2846a5d801010000000c00330038002e00310039002e00310031002e003100370037000c000000d1f89b9446a5d801010000000b00330038002e00310039002e00370038002e0035003900" /t reg_binary /f
rem 当创建新选项卡时，始终切换到新选项卡
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "OpenInForeground" /t reg_dword /d 1 /f
rem 其他程序从当前窗口的新选项卡打开连接
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "ShortcutBehavior" /t reg_dword /d 1 /f
rem 关闭开始屏幕自动显示"应用"视图
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v ShowAppsViewOnStart /d 0 /t REG_DWORD /f
rem 关闭通知-安全和维护
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /t reg_dword /d 0 /f
rem 关闭通知-打印通知
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "Enabled" /t reg_dword /d 0 /f
rem 关闭通知-自动播放
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "Enabled" /t reg_dword /d 0 /f
rem 关闭通知-Defender
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "Enabled" /t reg_dword /d 0 /f
rem 关闭通知
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "LockScreenToastEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v "TrayIconStatus" /t reg_dword /d 9 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_BADGE_ENABLED" /t reg_dword /d 0 /f
rem 关闭事件跟踪程序
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability" /v "ShutdownReasonOn" /d 0 /t REG_DWORD /f
rem 打开文件资源管理器时打开此电脑
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /d 1 /t REG_DWORD /f
rem 关闭IE安全警报
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnOnHTTPSToHTTPRedirect" /d 0 /t REG_DWORD /f
rem 关闭客户体验改善计划
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /d 0 /t REG_DWORD /f
rem 登录windows开启数字键
Reg Add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t "Reg_Sz" /d "2" /f
rem 关闭「改进手写笔记与键入」设定
Reg Add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t "Reg_Dword" /d "0" /f
rem 关闭笔记与键入个性化设定
Reg Add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t "Reg_Dword" /d "1" /f
Reg Add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t "Reg_Dword" /d "1" /f
Reg Add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t "Reg_Dword" /d "0" /f
rem 登陆无需滑动，对触摸屏更友好
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreen" /t REG_DWORD /d 1 /f
rem 关闭「笔迹与键入个人化」设定
Reg Add "HKLM\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t "Reg_Dword" /d "0" /f
rem 「传递最佳化」设定为〝关闭『允许从其他电脑下载』〞
Reg Add "HKU\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t "Reg_Dword" /d "0" /f
rem 关闭〝在档案总管和「执行」对话方块中使用即时自动完成〞设定
Reg Add "HKCU\SOFTWARE\Microsoft\Internet Explorer\AutoComplete" /v "Append Completion" /t "Reg_Sz" /d "no" /f
rem 关闭「在相容性检视下显示内部网路网站」设定
Reg Add "HKCU\SOFTWARE\Microsoft\Internet Explorer\BrowserEmulation" /v "IntranetCompatibilityMode" /t "Reg_Dword" /d "0" /f
rem 更预设下载位置为「桌面」资料夹
Reg Add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Default Download Directory" /t "Reg_Sz" /d "C:\Users\%username%\Desktop" /f
rem 关闭「下载完成时通知我」设定
Reg Add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "NotifyDownloadComplete" /t "Reg_Sz" /d "no" /f
rem 调整「菜单」的显示速度为0毫秒
Reg Add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t "Reg_Sz" /d "0" /f
rem 关闭通知中心的通知消息
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t reg_dword /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\Launcher" /v "DisableLightDismiss" /t reg_dword /d 1 /f
rem 取消 对证书地址不匹配发出警告
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnonBadCertRecving" /t reg_dword /d 0 /f
rem 取消-检查发行商的证书是否已吊销
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing" /v "State" /t reg_dword /d 146944 /f
rem 取消 检查服务器证书吊销道:
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CertificateRevocation" /t reg_dword /d 0 /f
rem 取消-检查所下载的程序的签名
reg add "HKCU\Software\Microsoft\Internet Explorer\Download" /v "CheckExeSignatures" /t reg_sz /d "no" /f
rem 关闭管理SmartScreen筛选器
reg add "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v "EnabledV8" /t reg_dword /d 0 /f
rem 取消-启用增强保护模式
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Isolation" /t reg_sz /d "PMIL" /f
rem 取消-启用64 位增强保护模式
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Isolation64Bit" /t reg_dword /d "0" /f
rem 设置-32 位浏览器
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "TabProcGrowth" /t reg_dword /d "1" /f
rem 选择-允许活动内容在我的电脑的文件中运行
reg add "HKCU\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN" /v "iexplore.exe" /t reg_dword /d 0 /f
rem 选择-允许来自CD的活动内容在我的电脑中运行
reg add "HKCU\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN\Settings" /v "LOCALMACHINE_CD_UNLOCK" /t reg_dword /d 1 /f
rem 选择-允许运行或安装软件即使签名无效
reg add "HKCU\Software\Microsoft\Internet Explorer\Download" /v "RunInvalidSignatures" /t reg_dword /d 1 /f
rem 关闭-启用窗口弹出阻止程序
reg add "HKCU\Software\Microsoft\Internet Explorer\New Windows" /v "PopupMgr" /t reg_dword /d 0 /f
rem 使用TLS1.2和TLS1.0(全开2728)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "SecureProtocols" /d "2184" /t reg_dword /f
rem 去掉IE安全设置风险提示
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "NoProtectedModeBanner" /d 1 /t reg_dword /f
rem 禁止smartscreen
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t reg_sz /d "off" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /d 0 /t reg_dword /f
rem IE同时下载多个文件
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v "iexplore.exe" /d 10 /t reg_dword /f
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v "iexplore.exe" /d 10 /t reg_dword /f
rem IE下载连接数
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /d 10 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /d 10 /t reg_dword /f
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /d 10 /t reg_dword /f
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /d 10 /t reg_dword /f
rem 关闭IE启动自动崩溃恢复
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Recovery" /v "AutoRecover" /t reg_sz /d 2 /f
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Recovery" /v "AutoRecover" /t reg_sz /d 2 /f
rem 自动优化启动分区，加快启动速度
reg add "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" /v "Enable" /t reg_sz /d "Y" /f
rem 解决磁盘占用率100%的问题
reg add "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" /v "OptimizeComplete" /t reg_sz /d "no" /f
rem 启用Win10长路径
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t reg_dword /d 1 /f
rem 关闭IE在后台加载站点和内容以优化性能
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\PrefetchPrerender" /v "Enabled" /t reg_sz /d 0 /f
rem 360优化程序的反应时间加快系统处理速度
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t reg_sz /d 10000 /f
rem 360缩短因错误程序导致鼠标键盘无反应的等待时间
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t reg_sz /d 3000 /f
rem 搜狗输入法服务禁用
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SogouSvc" /v "Start" /t reg_dword /d 3 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\SogouSvc" /v "Start" /t reg_dword /d 3 /f
rem 加大图标缓存
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t reg_sz /d 4096 /f
rem 关掉调试器Dr.Watson
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t reg_sz /d 0 /f
rem 禁止IE浏览器自动更新
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v "NoUpdateCheck" /t reg_sz /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v "NoUpdateCheck" /t reg_sz /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v "NoUpdateCheck" /t reg_sz /d 1 /f
rem 禁用错误汇报及但在发生严重错误时通知我
reg add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v "ShowUI" /t reg_dword /d 0 /f
rem 关闭默认共享(禁止 $C $D,禁止 $Admin)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v "AutoShareServer" /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v "AutoShareWks" /t reg_dword /d 0 /f
rem 开启经典共享
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "forceguest" /t reg_dword /d 0 /f
rem 开启远程协助
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t reg_dword /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t reg_dword /d 0 /f
rem 禁止远程修改注册表
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /t reg_dword /d 1 /f
rem 去除属性解除锁定
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t reg_dword /d 1 /f
rem 关闭游戏录制工具
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t reg_dword /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t reg_dword /d 0 /f
rem 关闭“当我玩游戏时在后台录制”
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t reg_dword /d 0 /f
rem 关闭onedrive
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t reg_dword /d 1 /f
rem 关闭自动更新地图
reg add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t reg_dword /d 0 /f
rem 关闭资讯和兴趣
taskkill /f /t /im "StartMenuExperienceHost.exe" >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t reg_dword /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t reg_dword /d 0 /f
taskkill /f /t /im "StartMenuExperienceHost.exe" >nul 2>nul
rem 关闭小娜
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t reg_dword /d 0 /f
rem 关闭win10快速用户切换功能
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "HideFastUserSwitching" /t reg_dword /d 1 /f
rem 关闭Windows Defender
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t reg_dword /d 1 /f
rem 开启Windows Defender删除文件提示（否则直接删除）
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t reg_dword /d 1 /f
rem 卸载并删除OneDrive
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall 2>nul
RD "%UserProfile%\OneDrive" /Q /S 2>nul
RD "%LocalAppData%\Microsoft\OneDrive" /Q /S 2>nul
RD "%ProgramData%\Microsoft OneDrive" /Q /S 2>nul
RD "C:\OneDriveTemp" /Q /S 2>nul
REG Delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f 2>nul
REG Delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f 2>nul
rem 禁用Windows Defender 安全中心服务
reg add "HKLM\SYSTEM\ControlSet001\Services\SecurityHealthService" /v "Start" /t reg_dword /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t reg_dword /d 4 /f
rem 关闭在开始菜单显示建议
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t reg_dword /d 0 /f
rem 关闭Windowsink
reg add "HKLM\Software\Microsoft\Windows\WindowsInkWorkspace" /v "AllowWindowsInkWorkspace" /t reg_dword /d 0 /f
rem 在通知区域显示所有图示设定
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t "Reg_Dword" /d "0" /f
rem 微软拼音默认为英语输入
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t reg_dword /d 1 /f
rem 删除通知和操作中心
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t reg_dword /d 1 /f
rem 文件没有关联的打开程序时，禁止从网络上去搜索打开类型
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoInternetOpenWith" /t reg_dword /d 1 /f
rem 关闭Windows商店功能
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.WindowsStore_8wekyb3d8bbwe" /v "Disabled" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.WindowsStore_8wekyb3d8bbwe" /v "DisabledByUser" /t reg_dword /d 1 /f
rem 关闭打开方式从应用商店选择其它应用
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t reg_dword /d 1 /f
rem 语言栏隐藏到任务拦，取消语言栏上的帮助按钮
reg add "HKCU\Software\Microsoft\CTF\MSUTB" /v "ShowDeskBand" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t reg_dword /d 4 /f
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\CTF\LangBar\ItemState{ED9D5450-EBE6-4255-8289-F8A31E687228}" /v "DemoteLevel" /t reg_dword /d 3 /f
rem 关闭快速访问不显示常用文件夹和最近使用文件
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t reg_dword /d 0 /f
rem 禁止运行计算机自动维护计划
reg add "HKLM\Software\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t reg_dword /d 0 /f
rem 关闭系统感知
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "fAllowToGetHelp" /t reg_dword /d 0 /f
rem 屏幕键盘不挡任务栏
reg add "HKLM\SOFTWARE\Microsoft\StigRegKey\Typing\TaskbarAvoidanceEnabled" /v "Enable" /t reg_dword /d 1 /f
rem 关闭Adobe Flash即点即用
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Security" /v "FlashClickToRunMode" /t reg_dword /d 0 /f
rem 使chrome支持flash
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "AllowOutdatedPlugins" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "RunAllFlashInAllowMode" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "DefaultPluginsSetting" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "HardwareAccelerationModeEnabled" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium\PluginsAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKCU\SOFTWARE\Policies\Chromium\PluginsAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
rem 下载前询问每个文件的保存位置
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PromptForDownloadLocation" /t reg_dword /d 1 /f
rem 允许运行过时的插件
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AllowOutdatedPlugins" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "RunAllFlashInAllowMode" /t reg_dword /d 1 /f
rem 默认通知设置
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultNotificationsSetting" /t reg_dword /d 1 /f
rem 默认弹出窗口设置_允许
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultPopupsSetting" /t reg_dword /d 1 /f
rem 允许已加入高级保护计划的用户将下载内容发送给 Google 进行深度扫描
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AdvancedProtectionDeepScanningEnabled" /t reg_dword /d 0 /f
rem 在Google Chrome关闭后继续运行后台应用_关闭
reg add "HKLM\Software\Policies\Google\Chrome\Recommended" /v "BackgroundModeEnabled" /t reg_dword /d 0 /f
rem 在工具栏上显示"主页"按钮
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ShowHomeButton" /t reg_dword /d 1 /f
rem 将 Google Chrome 设为默认浏览器
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultBrowserSettingEnabled" /t reg_dword /d 0 /f
rem 默认JavaScript设置_允许
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultJavaScriptSetting" /t reg_dword /d 1 /f
rem 默认Flash设置_允许
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultPluginsSetting" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "HardwareAccelerationModeEnabled" /t reg_dword /d 1 /f
rem 在这些网站上允许弹出窗口
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PopupsAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PopupsAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
rem 在这些网站上允许Flash插件
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
rem 允许这些网站上的不安全内容
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\InsecureContentAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\InsecureContentAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
rem 在这些网站上允许JavaScript
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\JavaScriptAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\JavaScriptAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
rem 允许在这些站点上生成密钥
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\KeygenAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\KeygenAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
rem 在这些站点上允许WebUSB
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\WebUsbAskForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\WebUsbAskForUrls" /v "2" /t reg_sz /d "http://*" /f
rem 打印页眉和页脚
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PrintHeaderFooter" /t reg_dword /d 0 /f
rem 默认背景图片打印模式
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PrintingBackgroundGraphicsDefault" /t reg_sz /d "enabled" /f
rem 添加网址至信任站点
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\hsbank.com.cn\*" /v "http" /t reg_dword /d "2" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\hsbank.com.cn\*" /v "https" /t reg_dword /d "2" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\hsbank.cn\*" /v "http" /t reg_dword /d "2" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\hsbank.cn\*" /v "https" /t reg_dword /d "2" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\hsbank.cc\*" /v "http" /t reg_dword /d "2" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\hsbank.cc\*" /v "https" /t reg_dword /d "2" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\hsbank.com\*" /v "http" /t reg_dword /d "2" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains\hsbank.com\*" /v "https" /t reg_dword /d "2" /f
rem 增加IP到信任站点
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range100" /v ":Range" /d "38.*" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range100" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range100" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range101" /v ":Range" /d "38.*.*.*" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range101" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range101" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range102" /v ":Range" /d "38.10.68.32" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range102" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range102" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range103" /v ":Range" /d "38.10.68.38" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range103" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range103" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range104" /v ":Range" /d "38.19.11.176" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range104" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range104" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range105" /v ":Range" /d "38.19.11.177" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range105" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range105" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range106" /v ":Range" /d "38.19.13.70" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range106" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range106" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range107" /v ":Range" /d "38.19.13.241" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range107" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range107" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range108" /v ":Range" /d "38.19.17.80" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range108" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range108" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range109" /v ":Range" /d "38.19.19.114" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range109" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range109" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range110" /v ":Range" /d "38.19.19.157" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range110" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range110" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range111" /v ":Range" /d "38.19.19.172" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range111" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range111" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range112" /v ":Range" /d "38.19.19.240" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range112" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range112" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range113" /v ":Range" /d "38.19.19.243" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range113" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range113" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range114" /v ":Range" /d "38.19.19.78" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range114" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range114" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range115" /v ":Range" /d "38.19.64.35" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range115" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range115" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range116" /v ":Range" /d "38.19.77.104" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range116" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range116" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range117" /v ":Range" /d "38.19.79.45" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range117" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range117" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range118" /v ":Range" /d "38.19.79.55" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range118" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range118" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range119" /v ":Range" /d "38.40.15.101" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range119" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range119" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range120" /v ":Range" /d "38.19.19.52" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range120" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range120" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range121" /v ":Range" /d "38.19.19.87" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range121" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range121" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range122" /v ":Range" /d "38.19.16.33" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range122" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range122" /v "https" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range123" /v ":Range" /d "38.19.78.59" /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range123" /v "http" /d "2" /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges\Range123" /v "https" /d "2" /t REG_DWORD /f
rem 开启IE打印背景颜色和图像
rem reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Print_Background" /t reg_sz /d "yes" /f
rem reg add "HKCU\Software\Microsoft\Internet Explorer\PageSetup" /v "Print_Background" /t reg_sz /d "yes" /f
rem 去除IE右边的笑脸
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /v "NoHelpItemSendFeedback" /t reg_dword /d "1" /f
rem 关闭IE安全设置检查功能
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Security" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Group Policy Objects\{C2D0B7D4-7CC5-40A6-AC4C-A25BA2637B18}Machine\Software\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Group Policy Objects\{C2D0B7D4-7CC5-40A6-AC4C-A25BA2637B18}Machine\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
rem 关闭信任站点要求服务器验证(https:)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "Flags" /t reg_dword /d "67" /f
rem 启用不安全的来宾登录
reg add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "AllowInsecureGuestAuth" /d 1 /t reg_dword /f
reg add "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows\LanmanWorkstation" /v "AllowInsecureGuestAuth" /d 1 /t reg_dword /f
rem 网络优化
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v "NameSrvQueryTimeout" /d 3000 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "nonetcrawling" /d 1 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /d 0 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /d 64 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /d 1 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUBHDetect" /d 1 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /d 1 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /d 2 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxCmds" /d 30 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxThreads" /d 30 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxCollectionCount" /d 32 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "negativesoacachetime" /d 0 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "netfailurecachetime" /d 0 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxcacheentryttllimit" /d 10800 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxcachettl" /d 10800 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxnegativecachettl" /d 0 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /d 1 /t reg_dword /f
rem 启用最佳性能
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /d 2 /t REG_DWORD /f
rem 界面优化
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SearchboxTaskbarMode" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /d 0 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /d 0 /t reg_dword /f
rem 加快Aero Snap显示速度，更快的看到窗口缩略图
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /d 0 /t reg_dword /f
rem 加快Aero Snap显示速度，更快的看到窗口缩略图
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DesktopLivePreviewHoverTime" /d 0 /t reg_dword /f
rem 系统显示效果优化
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /d 3 /t REG_DWORD /f
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /d 0 /t REG_SZ /f
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /d 9012038010000000 /t REG_BINARY /f
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /d 2 /t REG_SZ /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 0 /t REG_SZ /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /d 0 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /d 0 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /d 0 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /d 1 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /d 1 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /d 0 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /d 1 /t REG_DWORD /f
rem 反馈频率改为“从不”
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /d 0 /t REG_DWORD /f
rem 防止鼠标焦点丢失
reg add "HKCU\Control Panel\Desktop" /v "ForegroundLockTimeout" /d 0 /t REG_SZ /f
rem 设置窗口超窄边框
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "PaddedBorderWidth" /d "-15" /t REG_SZ /f
rem 开启窗口颜色标题栏和窗口边框
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /d "1" /t REG_SZ /f
rem 关闭窗口颜色透明效果
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /d "0" /t REG_SZ /f
rem 鼠标停留时间
reg add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /d 100 /t REG_SZ /f
rem 仅光盘自动运行
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /d 221 /t REG_DWORD /f
rem 优化Windows文件列表刷新策略，文件夹手工1自动0刷新
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSimpleNetIDList" /d 0 /t REG_DWORD /f
rem 关闭cortona
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /d 0 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "SettingsVersion" /d 3 /t REG_DWORD /f
rem 删除资源管理器音乐文件夹
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
rem 删除资源管理器视频文件夹
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
rem 删除桌面库文件夹
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5} /f
rem 开启磁贴取消固定的选项
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "LockedStartLayout" /d 0 /t reg_dword /f
reg add "HKLM\Software\Wow6432Node\Policies\Microsoft\Windows\Explorer" /v "LockedStartLayout" /d 0 /t reg_dword /f
rem NTF文件优化
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager" /v "NtfsDisableLastAccessUpdate" /d 1 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "NtfsDisableLastAccessUpdate" /d 1 /t reg_dword /f
rem 优化硬盘数据存储
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout" /v "EnableAutoLayout" /d 1 /t reg_dword /f
rem 系统自我修复时间
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager" /v "AutoChkTimeout" /d 5 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "AutoChkTimeout" /d 5 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /d 1 /t reg_dword /f

rem 解决Win10图片管理器报内存不足
rem reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\ICM\RegisteredProfiles" /v "sRGB" /t reg_sz /d "RSWOP.icm" /f
rem 关闭windows传递优化
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceAppSuggestionsEnabled" /t reg_dword /d 0 /f
rem 开启搜索始终搜索文件名和内容
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\PrimaryProperties\UnindexedLocations" /v "SearchOnly" /t reg_dword /d 0 /f
rem 去除WPS云文档
rem @reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{7AE6DE87-C956-4B40-9C89-3D166C9841D3}" /f
rem @reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{5FCD4425-CA3A-48F4-A57C-B8A75C32ACB1}" /f
rem IE禁止加载项性能通知
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableAddonLoadTimePerformanceNotifications" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableAddonLoadTimePerformanceNotifications" /t reg_dword /d 1 /f
rem 自动激活新安装的加载项
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "IgnoreFrameApprovalCheck" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "IgnoreFrameApprovalCheck" /t reg_dword /d 1 /f
rem 跳过IE首次运行自定义设置
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceHasShown" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceComplete" /t reg_dword /d 1 /f
rem 跳过首次向导
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t reg_dword /d 1 /f
rem 关闭允许网站通过访问语言列表来提供相关服务
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t reg_dword /d 1 /f
rem 关闭win10系统预留空间
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t reg_dword /d 0 /f
rem 网络加速：
rem 附加拥塞控制提供程序（Win7）：
netsh int tcp set global congestionprovider=none 2>nul
netsh interface tcp set global congestionprovider=ctcp 2>nul
rem 烟囱卸载状态 ：
netsh int tcp set global chimney=automatic 2>nul
rem 接收方缩放状态：
netsh int tcp set global rss=enabled 2>nul
rem NetDMA 状态：
netsh int tcp set global netdma=enabled 2>nul
rem 直接缓存访问(DCA)：
netsh int tcp set global dca=enabled 2>nul
rem 接收窗口自动调谐级别：
rem netsh int tcp set global autotuninglevel=normal 2>nul[20230611]
netsh int tcp set global autotuninglevel=restricted
netsh int tcp set heuristics disabled
rem 附加拥塞控制提供程序（Win10）：
netsh int tcp set supplemental template=datacenter congestionprovider=ctcp 2>nul
rem ECN 功能：
netsh int tcp set global ecncapability=disabled 2>nul
rem RFC 1323 时间戳：
netsh int tcp set global timestamps=enabled 2>nul
rem 关闭ipv6
netsh interface teredo set state disable 1>nul 2>nul
netsh interface 6to4 set state disabled 1>nul 2>nul
netsh interface isatap set state disabled 1>nul 2>nul
rem 修复XPS
rem assoc .oxps=oxpsfile 2>nul
rem assoc .xps=xpsfile 2>nul
rem ftype oxpsfile=%Windir%\System32\xpsrchvw.exe %1 2>nul
rem ftype xpsfile=%Windir%\System32\xpsrchvw.exe %1 2>nul
rem 格式修复
taskkill /f /t /im iexplore.exe 2>nul
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Check_Associations" /t REG_SZ /d "yes" /f
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
set PF="%ProgramFiles%\Internet Explorer\iexplore.exe" "%%1"&if exist "C:\Program Files (x86)" set PF="%ProgramFiles(x86)%\Internet Explorer\iexplore.exe" "%%1"
ftype htmfile=%PF%
ftype htmlfile=%PF%
ftype mhtfile=%PF%
ftype mhtmfile=%PF%
ftype urlfile=%PF%
ftype httpfile=%PF%
ftype httpsfile=%PF%
rem 增强桌面IE
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open\Command" /ve /t reg_sz /d "C:\Program Files (x86)\Internet Explorer\iexplore.exe" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open64" /ve /t reg_sz /d "启动64位IE(&E)" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open64\Command" /ve /t reg_sz /d "C:\Program Files\internet explorer\iexplore.exe" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Alank" /ve /t reg_sz /d "打开空白页(&B)" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Alank\Command" /ve /t reg_sz /d "\"C:\Program Files (x86)\Internet Explorer\iexplore.exe\" about:blank" /f
rem 关闭win10让windows管理默认打印机
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows" /v "LegacyDefaultPrinterMode" /t reg_dword /d 1 /f
rem 关闭程序兼容性助手
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /d 1 /t REG_DWORD /f
rem 禁用疑难解答和系统诊断服务
sc stop WdiSystemHost
sc stop WdiServiceHost
sc stop DPS
sc config DPS start= disabled
sc config WdiServiceHost start= disabled
sc config WdiSystemHost start= disabled
rem 屏幕保护
rem rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,1
rem 首页
INETCPL.CPL
rem 密码,win10没用
rem control.exe nusrmgr.cpl
rem 打印机
rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL PrintersFolder
rem IP
rem ncpa.cpl
rem 网络设置
rem control netconnections
rem 电源选项
rem powercfg.cpl
rem 默认程序设置
rem Rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,3
rem 计算机名
rem sysdm.cpl
rem 系统判断
rem for /f "tokens=2* delims=[.]" %%i in ('ver') do set v=%%i
rem for /f "tokens=2* delims= " %%i in ("%v%") do set sysos=%%i
rem 系统跳转
rem goto os%sysos%
rem :os5
rem echo Windows XP
rem goto last
rem :os6
rem echo Windows 7
rem del "%userprofile%\AppData\Roaming\Microsoft\Windows\SendTo\Compressed (zipped) Folder.ZFSendToTarget" /q /f 2>nul
rem 设置主题
rem rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"%Windir%\Resources\Themes\aero.theme"
rem goto last
rem :os10
rem echo Windows 10
rem move /Y C:\Users\Public\ver.bat %userprofile%
rem 永久启动和禁用win10驱动签名验证脚本
bcdedit.exe /set nointegritychecks on
bcdedit /set nx AlwaysOff
rem 关闭数字签名校验
bcdedit -set loadoptions DISABLE_INTEGRITY_CHECKS
rem 关闭系统测试模式
rem bcdedit /set testsigning off
rem 开启调试功能
rem bcdedit /debug ON
rem bcdedit /bootdebug ON
rem 允许管理员覆盖设备安装限制策略
reg add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v "AllowAdminInstall" /t reg_dword /d 1 /f
rem 设备驱动程序的代码签名为忽略
reg add "HKCU\Software\Policies\Microsoft\Windows NT\Driver Signing" /v "BehaviorOnFailedVerify" /t reg_dword /d 0 /f
rem 用户密码永不过期
net accounts /maxpwage:unlimited
rem 禁用登录时启动隐私设置体验(1809后专用)
reg add "HKLM\Software\Policies\Microsoft\Windows\OOBE" /v "DisablePrivacyExperience" /t reg_dword /d 1 /f
rem 设置主题
rem "%Windir%\Resources\Themes\HSbankWin10.theme"
rem 解决win10远程慢
netsh interface tcp set global autotuninglevel=disabled
rem 关闭高级缩放设置
reg add "HKCU\Control Panel\Desktop" /v "Win8DpiScaling" /t reg_dword /d 0 /f
rem 开启允许windows尝试修复应用
reg add "HKCU\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t reg_dword /d 1 /f
rem 设置自定义缩放为124(124%值为119,100%值为96)
reg add "HKCU\Control Panel\Desktop" /v "LogPixels" /t reg_dword /d 96 /f
rem 删除所有磁贴
reg add "HKCU\Software\Policies\Microsoft\Windows" /v "ClearTilesOnExit" /t reg_dword /d 1 /f
rem 不允许客户端打印机重定向
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCpm" /t reg_dword /d 1 /f
rem 不要将默认客户端打印机设置为会话中的默认打印机
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fForceClientLptDef" /t reg_dword /d 1 /f
rem 删除福昕阅读器垃圾广告软件
taskkill /f /t /im FRMI.exe 2>nul
taskkill /f /t /im Lcserver.exe 2>nul
del "C:\ProgramData\CPPackages\*.EXE" /q /f 2>nul
rem 软件安装器
if exist "C:\ShaoHua\Softprep.exe" start "" /wait C:\ShaoHua\Softprep.exe 2>nul
rem SSD加速
rem 判断是否是固态硬盘
rem powershell get-physicaldisk|Findstr /l /c:"SSD" 1>nul 2>nul&&goto ssd ||goto exit
:ssd
rem 关闭超级预读 Superfetch
net stop "SysMain" 2>nul
sc config "SysMain" start= disabled 2>nul
rem 关闭系统预读 Prefetch
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t reg_dword /d 0 /f
rem 禁止疑难解答和系统诊断服务
sc stop "WdiSystemHost" 2>nul
sc stop "WdiServiceHost" 2>nul
sc stop "DPS" 2>nul
sc config "DPS" start= disabled 2>nul
sc config "WdiServiceHost" start= disabled 2>nul
sc config "WdiSystemHost" start= disabled 2>nul
:exit
rem 更新策略
gpupdate /force
rem 系统激活脚本
if exist "C:\ShaoHua\Key\Activate.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\系统激活脚本.lnk""):b.TargetPath=""C:\ShaoHua\Key\Activate.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
rem 打印共享脚本
if exist "C:\ShaoHua\Key\FixPrint.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\打印共享脚本.lnk""):b.TargetPath=""C:\ShaoHua\Key\FixPrint.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
rem 垃圾清理脚本
if exist "C:\ShaoHua\Key\ClearTemp.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\垃圾清理脚本.lnk""):b.TargetPath=""C:\ShaoHua\Key\ClearTemp.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
rem 删除驱动文件
del "C:\ShaoHua\Drv\Drvceo\*.*" /f /s /q 2>nul
rd "C:\ShaoHua\Drv\Drvceo\" /s /q 2>nul
rem 内外网电脑判断
if exist "C:\resoft\resoft.dll" goto neipc 2>nul
if not exist "C:\resoft\resoft.dll" goto waipc 2>nul
:neipc
del "C:\users\public\desktop\书生电子公文系统7.4.2.lnk" /q /f 2>nul
del "C:\users\public\desktop\Sursen Maker 2.0.lnk" /q /f 2>nul
del "C:\shaohua\soft\WeChatSetup.exe" /q /f 2>nul
del "C:\shaohua\soft\ThunderSpeed.exe" /q /f 2>nul
del "C:\ShaoHua\Tools\Key\*.exe" /q /f 2>nul
del "C:\ShaoHua\Tools\Office修复工具\Office启动一键修复.exe" /q /f 2>nul
del "C:\ShaoHua\Tools\Office修复工具\打印任务一键清除.exe" /q /f 2>nul
goto tips
:waipc
rem 禁用Windows10自动更新
rem win10禁止更新驱动
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t reg_dword /d 1 /f
rem win10禁止更新大于1809版本
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetReleaseVersion" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetReleaseVersionInfo" /t reg_sz /d 1809 /f
rem 结束进程 / Stopping Process...  
rem taskkill /im Windows10UpgraderApp.exe 2>nul
rem del /f /q "%USERPROFILE%\Desktop\微软 Windows 10 易升.lnk" 2>nul
rem del /f /q "%USERPROFILE%\Desktop\Windows 10 Update Assistant.lnk" 2>nul
rem 添加防火墙规则 / Adding firewall rules...
rem netsh advfirewall firewall add rule name="Block_Windows10UpgraderApp" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\Windows10UpgraderApp.exe" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_WinREBootApp32" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\WinREBootApp32.exe" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_WinREBootApp64" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\WinREBootApp64.exe" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_bootsect" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\bootsect.exe" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_DW20" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\DW20.EXE" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_DWTRIG20" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\DWTRIG20.EXE" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_GatherOSState" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\GatherOSState.EXE" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_GetCurrentRollback" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\GetCurrentRollback.EXE" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_HttpHelper" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\HttpHelper.exe" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_UpdateAssistant" dir=in program="%SYSTEMROOT%\UpdateAssistant\UpdateAssistant.exe" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_UpdateAssistantCheck" dir=in program="%SYSTEMROOT%\UpdateAssistant\UpdateAssistantCheck.exe" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_Windows10Upgrade" dir=in program="%SYSTEMROOT%\UpdateAssistant\Windows10Upgrade.exe" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_UpdateAssistantV2" dir=in program="%SYSTEMROOT%\UpdateAssistantV2\UpdateAssistant.exe" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_UpdateAssistantCheckV2" dir=in program="%SYSTEMROOT%\UpdateAssistantV2\UpdateAssistantCheck.exe" action=block 2>nul
rem netsh advfirewall firewall add rule name="Block_Windows10UpgradeV2" dir=in program="%SYSTEMROOT%\UpdateAssistantV2\Windows10Upgrade.exe" action=block 2>nul
rem 设置ACL / Configurating ACL...
rem echo y|cacls C:\Windows\UpdateAssistant\*.exe /t /p everyone:n 2>nul
rem echo y|cacls C:\Windows10Upgrade\*.exe /t /p everyone:n 2>nul
rem 停止Windows Update服务 / Disable Windows Update
sc stop wuauserv
sc config wuauserv start= disabled
rem 删除计划任务 / Delete task...
schtasks /delete /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistant" /f 2>nul
schtasks /delete /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantAllUsersRun" /f 2>nul
schtasks /delete /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantCalendarRun" /f 2>nul
schtasks /delete /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantWakeupRun" /f 2>nul
rem 设置注册表 / Editing Registry...
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t reg_dword /d 1 /f
rem 禁用windows更新。
sc config WaaSMedicSvc start= disabled 2>nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc " /v "start" /t reg_dword /d "4" /f
rem 彻底禁用Win10自动更新服务：Windows Update
rem reg add "HKLM\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t reg_dword /d "4" /f
rem reg add "HKLM\SYSTEM\ControlSet001\Services\wuauserv" /v "FailureActions" /d "80510100000000000000000003000000140000000000000060ea000000000000000000000000000000000000" /t reg_binary /f
rem 彻底禁用Win10自动更新服务：Windows Update Medic Service
rem reg add "HKLM\SYSTEM\ControlSet001\Services\WaaSMedicSvc" /v "Start" /t reg_dword /d "4" /f
rem reg add "HKLM\SYSTEM\ControlSet001\Services\WaaSMedicSvc" /v "FailureActions" /d "84030000000000000000000003000000140000000001000000c0d4010001000000e09304000000000000000000" /t reg_binary /f
rem 彻底禁用Win10自动更新服务：Windows Update
rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t reg_dword /d "4" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "FailureActions" /d "80510100000000000000000003000000140000000000000060ea000000000000000000000000000000000000" /t reg_binary /f
rem 彻底禁用Win10自动更新服务：Windows Update Medic Service
rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t reg_dword /d "4" /f
rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "FailureActions" /d "84030000000000000000000003000000140000000001000000c0d4010001000000e09304000000000000000000" /t reg_binary /f
rem 文件整理
del "C:\Windows\System32\UCli.exe" /f /s /q 2>nul
del "C:\Windows\System32\config.ini" /f /s /q 2>nul
del "C:\windows\Hsbank\*.*" /f /s /q 2>nul
rd "C:\shaohua\Hsbank\" /s /q 2>nul
goto tips
:tips
rem 清理IE缓存
rem start "" cleanmgr
rem    1   浏览器历史记录
rem    2   Cookies
rem    4   临时网络文件
rem    8   离线收藏夹和下载历史记录
rem   16   表格数据
rem   32   密码
rem   64   仿冒网站筛选数据
rem  128   网页恢复数据
rem  256   运行缓存清除时不显示GUI
rem  512   不要使用多线程删除
rem 1024   仅在浏览器处于私有浏览模式时有效
rem 2048   追踪数据
rem 4096   附加组件（插件）存储的数据
rem 8192   为收藏的网站保留缓存的数据
rem RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4
del /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*"
del /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*"
del /f /s /q "%TEMP%\*"
cleanmgr.exe /VERYLOWDISK
rem 刷新桌面
taskkill /f /im explorer.exe 2>nul
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
start "" explorer
for /f "tokens=3*" %%i in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "ProductName"') do set ProductName=%%i %%j
for /f "tokens=3*" %%i in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId"') do set ReleaseId=%%i
for /f "tokens=2* delims=[]" %%i in ('ver') do set v=%%i
for /f "tokens=2* delims= " %%i in ("%v%") do set CurrentBuildNumber=%%i
rem start mshta vbscript:msgbox("System："^&vbCrLf^&"%ProductName%"^&vbCrLf^&"%processor_architecture%"^&vbCrLf^&"%ReleaseId% - %CurrentBuildNumber%"^&vbCrLf^&""^&vbCrLf^&"Script："^&vbCrLf^&"ShaoHua - 7x24H - 18900559020"^&vbCrLf^&"Version："^&vbCrLf^&"%Version%",64,"Tips - %date%")(window.close)
rem 开启远程
rem Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,5
start "" rundll32 shell32,ShellAbout Script  ：邵华 - 18900559020                   Date：%Version% System：%ProductName% - %processor_architecture% - %CurrentBuildNumber%
if exist "C:\ShaoHua\Tools\info.exe" start "" "C:\ShaoHua\Tools\info.exe"
echo %~dp0|find /i "windows" >nul||del %0
exit