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
set Version=20231005
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
:password
cls&echo.&echo.&echo.&echo.&echo.&echo.&echo.&echo.&echo.&set /p pwd=��������������������������������������Password:
if /i "%pwd%" neq "shaohua" goto password
:start
REM ���á��û��ʻ����ƣ��Թ���Ա��׼ģʽ�������й���Ա��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f
REM ����cmd-admin
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
arp -a|findstr /i "38.40." >nul && (set Pc=HS-Lan)||(arp -a|findstr /i "38.41." >nul && (set Pc=HS-Lan)||(arp -a|findstr /i "10.198." >nul && (set Pc=HS-Wan)||(set Pc=PC-Other&cls&echo. &echo.�����޷��ж����Ļ���&echo.&echo.�����ű�ר���ڻ���������ɽ�������绷��ʹ��&echo.�������ж�������������˾��ϵ&echo. &echo.����ɽ������ӿƼ����޹�˾ - �ۻ� - 7x24H - 18900559020&timeout /t 6 >nul&exit)))
:UPtime
title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� %Comment%
REM ָ��NTP������
if %Pc% EQU HS-Lan goto NPCtime
if %Pc% EQU HS-Wan goto WPCtime
if %Pc% EQU PC-Other goto WPCtime
:NPCtime
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v 3 /t REG_SZ /d 38.40.254.254 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v NtpServer /t REG_SZ /d 38.40.254.254 /f
w32tm /config /manualpeerlist:"38.40.254.254" /syncfromflags:domhier /reliable:yes /update 2>nul
goto endtime
:WPCtime
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\DateTime\Servers" /v 3 /f
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v NtpServer /f
w32tm /config /manualpeerlist:"time.windows.com" /syncfromflags:domhier /reliable:yes /update 2>nul
goto endtime
:endtime
sc config w32time start= auto 2>nul
net stop w32time >nul 2>nul
net start w32time >nul 2>nul
w32tm /resync 2>nul
:upanset
REM ��ȫU��_v1_V2_V3_DEL
del /f /q "%userprofile%\Desktop\��ȫU��.lnk" 2>nul
del /f /q "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Network Shortcuts\��ȫU��.exe" 2>nul
del /f /q "%UserProfile%\AppData\Roaming\Microsoft\Windows\Network Shortcuts\��ȫU��.exe" 2>nul
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKCR\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKCU\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
reg delete "HKLM\Software\Classes\CLSID\{679F137C-3162-45da-BE3C-2F9C3D093F68}" /f 2>nul
del /f /q "%userprofile%\Desktop\��ȫU��_V2.lnk" 2>nul
del /f /q "%userprofile%\Desktop\��ȫU��_V3.lnk" 2>nul
if exist "C:\ShaoHua\Soft\FugueExplorer_v3.exe" (goto upanstart) else (goto upanout)
:upanstart
REM ��ȫU��_V3_ADD
if not exist "C:\ShaoHua\Soft\FugueExplorer_v3.exe" goto upanout
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
:upanout
mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
REM �ر����������
taskkill /f /t /im iexplore.exe 2>nul
taskkill /f /t /im chrome.exe  2>nul
taskkill /f /t /im firefox.exe  2>nul
taskkill /f /t /im WeChat.exe 2>nul
taskkill /f /t /im WechatBrowser.exe 2>nul
taskkill /f /t /im 360se.exe 2>nul
taskkill /f /t /im sesvc.exe 2>nul
REM ������ϵͳ�Դ���Դ��������
echo �л���Դ����Ϊ�������ܡ�
Powercfg -s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
echo �Ӳ��ر���ʾ��
Powercfg -x -monitor-timeout-dc 0
Powercfg -x -monitor-timeout-ac 0
echo �Ӳ��ر�Ӳ��
powercfg -x -disk-timeout-dc 0
powercfg -x -disk-timeout-ac 0
echo �Ӳ��Զ�����˯��״̬
powercfg -hibernate off
powercfg -x -standby-timeout-dc 0
powercfg -x -standby-timeout-ac 0
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
echo ����ϵͳ����
powercfg -h off
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 0
del c:\hiberfil.sys /f /q 2>nul
REM ��������
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveActive" /t reg_sz /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaverIsSecure" /t reg_sz /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v "ScreenSaveTimeOut" /t reg_sz /d "180" /f
REM ����IE
taskkill /f /t /im iexplore.exe 2>nul
taskkill /f /t /im chrome.exe  2>nul
taskkill /f /t /im firefox.exe  2>nul
taskkill /f /t /im WeChat.exe 2>nul
taskkill /f /t /im WechatBrowser.exe 2>nul
taskkill /f /t /im 360se.exe 2>nul
taskkill /f /t /im sesvc.exe 2>nul
REM ȡ���ر�������Զ������¼
reg add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Privacy" /v "ClearBrowsingHistoryOnExit" /d "0" /t reg_dword /f
REM ����IE�ؼ�
REM  ActiveX�ؼ�����
set bl=0
:SetActiver
if "%bl%"=="5" goto ex
set regpath=HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\%bl%
echo ZONE%bl%
REM ��ȫ����12000=�ߡ�11500=��-�ߡ�11000���С�10500���е͡�10000���͡�0=�Զ���
reg add "%regpath%" /v "CurrentLevel" /d "0" /t reg_dword /f
REM ������ǩ����ActiveX�ؼ�
reg add "%regpath%" /v "1001" /d "0" /t reg_dword /f
REM ����δǩ����ActiveX�ؼ�
reg add "%regpath%" /v "1004" /d "0" /t reg_dword /f
REM ���� ActiveX �ؼ��Ͳ��
reg add "%regpath%" /v "1200" /d "0" /t reg_dword /f
REM ��û�б��Ϊ�ɰ�ȫִ�нű��� ActiveX �ؼ����г�ʼ���ͽű�����
reg add "%regpath%" /v "1201" /d "0" /t reg_dword /f
REM ���� Microsoft ��ҳ������ؼ��Ľű�
reg add "%regpath%" /v "1206" /d "0" /t reg_dword /f
REM ���� Internet Explorer Web ������ؼ��Ľű���д
reg add "%regpath%" /v "1207" /d "0" /t reg_dword /f
REM ������ǰδʹ�õ� ActiveX �ؼ���û����ʾ�����������
reg add "%regpath%" /v "1208" /d "0" /t reg_dword /f
REM ����ű�С����
reg add "%regpath%" /v "1209" /d "0" /t reg_dword /f
REM ����ÿվ�㣨������ActiveX ����
reg add "%regpath%" /v "120A" /d "0" /t reg_dword /f
REM ����ÿվ�㣨������ActiveX ����
reg add "%regpath%" /v "120B" /d "3" /t reg_dword /f
REM δ֪
reg add "%regpath%" /v "120C" /d "0" /t reg_dword /f
REM ��ű���д
reg add "%regpath%" /v "1400" /d "0" /t reg_dword /f
REM Java С����ű���д
reg add "%regpath%" /v "1402" /d "0" /t reg_dword /f
REM �Ա��Ϊ�ɰ�ȫִ�нű��� ActiveX �ؼ�ִ�нű�
reg add "%regpath%" /v "1405" /d "0" /t reg_dword /f
REM �����������Դ
reg add "%regpath%" /v "1406" /d "0" /t reg_dword /f
REM �����̼��������
reg add "%regpath%" /v "1407" /d "0" /t reg_dword /f
REM δ֪
reg add "%regpath%" /v "1408" /d "0" /t reg_dword /f
REM ���� XSS ɸѡ��
reg add "%regpath%" /v "1409" /d "3" /t reg_dword /f
REM �ύδ���ܵı�����
reg add "%regpath%" /v "1601" /d "0" /t reg_dword /f
REM ��������
reg add "%regpath%" /v "1604" /d "0" /t reg_dword /f
REM ���� Java
reg add "%regpath%" /v "1605" /d "0" /t reg_dword /f
REM �û����ݳ־���
reg add "%regpath%" /v "1606" /d "0" /t reg_dword /f
REM ��������ӿ��
reg add "%regpath%" /v "1607" /d "0" /t reg_dword /f
REM ���� META REFRESH
reg add "%regpath%" /v "1608" /d "0" /t reg_dword /f
REM ��ʾ�������
reg add "%regpath%" /v "1609" /d "0" /t reg_dword /f
REM �ڽ��ļ����ص�������ʱ��������Ŀ¼·��
reg add "%regpath%" /v "160A" /d "0" /t reg_dword /f
REM ������Ŀ�İ�װ
reg add "%regpath%" /v "1800" /d "0" /t reg_dword /f
REM �ϷŻ��ƺ�ճ���ļ�
reg add "%regpath%" /v "1802" /d "0" /t reg_dword /f
REM �ļ�����
reg add "%regpath%" /v "1803" /d "0" /t reg_dword /f
REM �� IFRAME ������������ļ�
reg add "%regpath%" /v "1804" /d "0" /t reg_dword /f
REM �� Web ��ͼ������������ļ�
reg add "%regpath%" /v "1805" /d "0" /t reg_dword /f
REM ����Ӧ�ó���Ͳ���ȫ�ļ�
reg add "%regpath%" /v "1806" /d "0" /t reg_dword /f
REM ����Ӧ�ó���Ͳ���ȫ�ļ�
reg add "%regpath%" /v "1807" /d "0" /t reg_dword /f
reg add "%regpath%" /v "1808" /d "0" /t reg_dword /f
REM ʹ�õ���������ֹ����
reg add "%regpath%" /v "1809" /d "3" /t reg_dword /f
reg add "%regpath%" /v "1812" /d "0" /t reg_dword /f
REM ����
reg add "%regpath%" /v "180A" /d "0" /t reg_dword /f
reg add "%regpath%" /v "180B" /d "0" /t reg_dword /f
reg add "%regpath%" /v "180C" /d "0" /t reg_dword /f
reg add "%regpath%" /v "180D" /d "0" /t reg_dword /f
REM �û������֤����¼0=�����Զ� 10000=65536=��ʾ�û�����
reg add "%regpath%" /v "1A00" /d "65536" /t reg_dword /f
REM ���������ϴ洢�ĳ־� cookie
reg add "%regpath%" /v "1A02" /d "0" /t reg_dword /f
REM ����ÿ�Ự cookie
reg add "%regpath%" /v "1A03" /d "0" /t reg_dword /f
REM ������û��֤���ֻ��һ��֤��ʱ����ʾ���пͻ�֤��ѡ��
reg add "%regpath%" /v "1A04" /d "0" /t reg_dword /f
REM ����������־� cookie
reg add "%regpath%" /v "1A05" /d "0" /t reg_dword /f
REM ����������Ự cookie
reg add "%regpath%" /v "1A06" /d "0" /t reg_dword /f
REM ��˽����
reg add "%regpath%" /v "1A10" /d "0" /t reg_dword /f
REM Java Ȩ��30000=7530 196608=�� 131072=�� 65536=�� 0=����
reg add "%regpath%" /v "1C00" /d "196608" /t reg_dword /f
REM ���������Ƶ��Ȩ��30000=7530
reg add "%regpath%" /v "1E05" /d "30000" /t reg_dword /f
REM ActiveX �ؼ��Ͳ���������ƺͽű���Ϊ
reg add "%regpath%" /v "2000" /d "0" /t reg_dword /f
REM �������� Authenticode ǩ�������
reg add "%regpath%" /v "2001" /d "0" /t reg_dword /f
REM ����δ�� Authenticode ǩ�������
reg add "%regpath%" /v "2004" /d "0" /t reg_dword /f
reg add "%regpath%" /v "2005" /d "0" /t reg_dword /f
REM �����嵥��Ȩ�޵����3�����á�10000���߰�ȫ��=65536
reg add "%regpath%" /v "2007" /d "65536" /t reg_dword /f
REM �������ݴ��ļ��������ǻ����ļ���չ��
reg add "%regpath%" /v "2100" /d "0" /t reg_dword /f
REM ���� �ڵ���Ȩ Web ���������е���վ���Ե�����������
reg add "%regpath%" /v "2101" /d "0" /t reg_dword /f
REM �����ɽű���ʼ���Ĵ��ڣ�û�д�С��λ������
reg add "%regpath%" /v "2102" /d "0" /t reg_dword /f
REM ����ͨ���ű�����״̬��
reg add "%regpath%" /v "2103" /d "0" /t reg_dword /f
REM ������վ��û�е�ַ��״̬���Ĵ���
reg add "%regpath%" /v "2104" /d "0" /t reg_dword /f
REM �ű���������վʹ�ýű�������ʾ��Ϣ ^
reg add "%regpath%" /v "2105" /d "0" /t reg_dword /f
reg add "%regpath%" /v "2106" /d "0" /t reg_dword /f
reg add "%regpath%" /v "2107" /d "0" /t reg_dword /f
REM �ļ������Զ���ʾ
reg add "%regpath%" /v "2200" /d "0" /t reg_dword /f
REM ActiveX �ؼ��Զ���ʾ
reg add "%regpath%" /v "2201" /d "0" /t reg_dword /f
REM ����ͨ�������Ƶ�Э��Ļ���ݷ����ҵĵ���
reg add "%regpath%" /v "2300" /d "0" /t reg_dword /f
REM ������ʹ�õ�����վɸѡ��
reg add "%regpath%" /v "2301" /d "3" /t reg_dword /f
REM .NET Framework��XAML �����Ӧ�ó���
reg add "%regpath%" /v "2400" /d "0" /t reg_dword /f
REM  .NET Framework��XPS �ĵ�
reg add "%regpath%" /v "2401" /d "0" /t reg_dword /f
REM .NET Framework����ɢ XAML
reg add "%regpath%" /v "2402" /d "0" /t reg_dword /f
REM �ر����򱣻�ģʽ0x0����������0x3���رգ�
reg add "%regpath%" /v "2500" /d "3" /t reg_dword /f
REM ���� .NET Framework ��װ����
reg add "%regpath%" /v "2600" /d "0" /t reg_dword /f
REM ���� .NET Framework ����
reg add "%regpath%" /v "2700" /d "3" /t reg_dword /f
REM ����ActiveXɸѡ
reg add "%regpath%" /v "2702" /d "0" /t reg_dword /f
REM ���ã���Ȩ��WEB���������е���վ���Ե�����������
reg add "%regpath%" /v "2707" /d "0" /t reg_dword /f
reg add "%regpath%" /v "2708" /d "0" /t reg_dword /f
reg add "%regpath%" /v "2709" /d "0" /t reg_dword /f
REM ����AC�ؼ������з����������-�ر�
reg add "%regpath%" /v "270B" /d "0" /t reg_dword /f
reg add "%regpath%" /v "270C" /d "3" /t reg_dword /f
REM ����
reg add "%regpath%" /v "MinLevel" /d "10000" /t reg_dword /f
reg add "%regpath%" /v "RecommendedLevel" /d "10000" /t reg_dword /f
set /a bl=%bl%+1
goto SetActiver
:ex
REM ����ֱ���������������exebat
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations /v ModRiskFileTypes /t REG_SZ /d .bat;.exe;.reg;.vbs;.zip;.rar;.7z /f
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Associations /v ModRiskFileTypes /t REG_SZ /d .bat;.exe;.reg;.vbs;.zip;.rar;.7z /f
REM IE����ʾ�ұ�������
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "FormSuggest PW Ask" /t Reg_Sz /d "no" /f
REM IE����ʾ����
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "FormSuggest Passwords" /t Reg_Sz /d "no" /f
REM IE��ʹ���Զ���ɹ���
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "Use FormSuggest" /t Reg_Sz /d "no" /f
REM ������ Internet Explorer �д����ӵķ�ʽ
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v AssociationActivationMode /t REG_DWORD /d 0 /f
REM �� IE �д� ActiveX �ؼ���־��¼
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v AuditModeEnabled /t REG_DWORD /d 1 /f
REM ɾ��IE �й�ʱ�� ActiveX �ؼ���������а�ť
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v RunThisTimeEnabled /t REG_DWORD /d 0 /f
REM ɾ��IE �н��õ� ActiveX �ؼ�
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Ext\Settings" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Ext\Settings" /f
REM ����IE�Զ������ָ�
reg add "HKCU\Software\Microsoft\Internet Explorer\Recovery" /v AutoRecover /t REG_DWORD /d 2 /f
REM �������б���ֹ�Ĺ�ʱ ActiveX �ؼ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "VersionCheckEnabled" /t REG_DWORD /d 0 /f
REM �������н��õ� ActiveX �ؼ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "NoExtOff" /t REG_DWORD /d 0 /f
REM ɾ��IE�Ĺ���ActiveX�ؼ���ֹ֪ͨ�еġ����¡���ť
reg add "HKCU\Software\Microsoft\Internet Explorer\VersionManager" /v UpdateEnabled /t REG_DWORD /d 0 /f
REM �޸ġ��û��ʻ����ƣ��Թ���Ա��׼ģʽ�������й���Ա����ע�������
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f
REM �ر�UAC - �����û��˻�����
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t reg_dword /d 0 /f
REM ��������Ա���ƹ���
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t reg_dword /d 1 /f
REM ����UIA�����л�
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t reg_dword /d 1 /f
REM �ڰ�ȫ�����ϲ���ʾUAC��ʾ
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t reg_dword /d 0 /f
REM �ڼ�������ͼ����ʾ������վ
reg add "HKCU\Software\Microsoft\Internet Explorer\BrowserEmulation" /v "AllSitesCompatibilityMode" /t reg_dword /d 1 /f
REM ���뷨Ĭ������  0 ���ģ�1 Ӣ��
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t reg_dword /d 1 /f
REM ���뷨����ģ��ƴ��  0 ���ã�1 ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableSmartFuzzyPinyin" /t reg_dword /d 1 /f
REM ���뷨ģ��ƴ��  0 ���ã�1 ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Fuzzy Input" /t reg_dword /d 1 /f
REM ���뷨��ѧϰ  0 Ϊ���ã�1 Ϊ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable self-learning" /t reg_dword /d 1 /f
REM ���뷨������ѧϰ  0 Ϊ���ã�1 Ϊ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableSmartSelfLearning" /t reg_dword /d 1 /f
REM ���뷨�Ƽ���  0 Ϊ���ã�1 Ϊ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Cloud Candidate" /t reg_dword /d 0 /f
REM ���뷨��Ӣ���л���ݼ���Ĭ�� ctrl + �ո񣬻���ʹ�ã�0 Ĭ��Ϊ shift��1 Ϊ ctrl��2 Ϊ ��
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "English Switch Key" /t reg_dword /d 0 /f
REM ���뷨��ʾ�´��ȴ�  0 Ϊ���ã�1 Ϊ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "EnableHap" /t reg_dword /d 0 /f
REM ���뷨��ʾ�´��ȴ���������ʾ  0 Ϊ���ã�1 Ϊ����
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Enable Hot And Popular Word Search" /t reg_dword /d 0 /f
REM ���±��Զ�����
reg add "HKCU\Software\Microsoft\Notepad" /v "fWrap" /t reg_dword /d 1 /f
REM ���±�����ʾ״̬��
reg add "HKCU\Software\Microsoft\Notepad" /v "StatusBar" /t reg_dword /d 1 /f
REM ��ݷ�ʽ����ӿ�ݷ�ʽ������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "Link" /d "00000000" /t reg_binary /f
REM ��������ͼ�������վ
reg add "HKCU\Software\Microsoft\Internet Explorer\BrowserEmulation\ClearableListData" /v "UserFilter" /d "411f00005308adba1b0000003c040000010000001b0000000c00000004f493222487d601010000000c00330039002e00310039002e00310031002e003100370037000c000000fd9c074d2487d601010000000a0068007300620061006e006b002e0063006f006d000c0000000054236e2487d601010000000c00330038002e00310039002e00310031002e003100370036000c00000072f633952487d601010000000c00330038002e00310039002e00310039002e003100310034000c000000f3fb70bc2487d601010000000c00330038002e00310039002e00310039002e003200340030000c00000089614bc92487d6010100000003002a002e002a000c0000005b847eabfcbed601010000000c00330038002e00310039002e00310039002e003100350037000c0000008cfd718833ced601010000000b00330038002e00310039002e00310037002e00380030000c00000070381f9433ced601010000000b00330038002e00310039002e00310033002e00370030000c000000b8e4df9c33ced601010000000b00330038002e00310039002e00360034002e00330035000c00000050ba78a333ced601010000000c00330038002e00340030002e00310035002e003100300031000c000000960235af33ced6010100000007006800730062002e00620069007a000c0000001366e42c34ced601010000000b00330038002e00310039002e00370039002e00350035000c000000917dab825729d701010000000b00330038002e00310039002e00370039002e00340035000c0000001197e8875729d701010000000c00330038002e00310039002e00310039002e003100370032000c0000003998c8720d4dd701010000000c00330038002e00310039002e00310033002e003200340031000c00000097a5e72f6154d701010000000c00330038002e00310039002e00310039002e003200340033000c000000459afabc195cd701010000000b00330038002e00310039002e00310039002e00370038000c00000091ee0d178f5ed701010000000c00330038002e00310039002e00370037002e003100300034000c000000ce2a8ae6b7b2d70101000000090068007300620061006e006b002e00630063000c000000b6b5c1eeb7b2d701010000000b00330038002e00310030002e00360038002e00330032000c00000085dc69f3b7b2d701010000000b00330038002e00310030002e00360038002e00330038000c000000d223a28509a3d801010000000b00330038002e00310039002e00310039002e00350032000c0000005a097aa609a3d801010000000b00330038002e00310039002e00310039002e00380037000c0000009129ce0a46a5d801010000000b00330038002e00310039002e00310036002e00330033000c0000008a48ee2846a5d801010000000c00330038002e00310039002e00310031002e003100370037000c000000d1f89b9446a5d801010000000b00330038002e00310039002e00370038002e0035003900" /t reg_binary /f
REM ��������ѡ�ʱ��ʼ���л�����ѡ�
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "OpenInForeground" /t reg_dword /d 1 /f
REM ����IE���������������ӵ�ǰ���ڵ���ѡ�������
reg add "HKCU\Software\Microsoft\Internet Explorer\TabbedBrowsing" /v "ShortcutBehavior" /t reg_dword /d 1 /f
REM �رտ�ʼ��Ļ�Զ���ʾ"Ӧ��"��ͼ
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v ShowAppsViewOnStart /d 0 /t REG_DWORD /f
REM �ر�Windows��֪ͨ-��ȫ��ά��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" /v "Enabled" /t reg_dword /d 0 /f
REM �ر�Windows��֪ͨ-��ӡ֪ͨ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.Print.Notification" /v "Enabled" /t reg_dword /d 0 /f
REM �ر�Windows��֪ͨ-�Զ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.AutoPlay" /v "Enabled" /t reg_dword /d 0 /f
REM �ر�Windows��֪ͨ-Defender
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "ShowBanner" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "ShowInActionCenter" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "SoundFile" /t reg_sz /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.Defender.SecurityCenter" /v "Enabled" /t reg_dword /d 0 /f
REM �ر�Windows��֪ͨ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "LockScreenToastEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v "TrayIconStatus" /t reg_dword /d 9 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_NOTIFICATION_SOUND" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_CRITICAL_TOASTS_ABOVE_LOCK" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_ALLOW_TOASTS_ABOVE_LOCK" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING_BADGE_ENABLED" /t reg_dword /d 0 /f
REM �ر��¼����ٳ���
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Reliability" /v "ShutdownReasonOn" /d 0 /t REG_DWORD /f
REM ���ļ���Դ������ʱ�򿪴˵���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /d 1 /t REG_DWORD /f
REM �ر�IE��ȫ����
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnOnHTTPSToHTTPRedirect" /d 0 /t REG_DWORD /f
REM �رտͻ�������Ƽƻ�
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /d 0 /t REG_DWORD /f
REM ��¼windows�������ּ�
Reg Add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t "Reg_Sz" /d "2" /f
REM �رա��Ľ���д�ʼ�����롹�趨
Reg Add "HKCU\SOFTWARE\Microsoft\Input\TIPC" /v "Enabled" /t "Reg_Dword" /d "0" /f
REM �رձʼ��������Ի��趨
Reg Add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t "Reg_Dword" /d "1" /f
Reg Add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t "Reg_Dword" /d "1" /f
Reg Add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t "Reg_Dword" /d "0" /f
REM ��½���軬�����Դ��������Ѻ�
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v "NoLockScreen" /t REG_DWORD /d 1 /f
REM �رա��ʼ��������˻����趨
Reg Add "HKLM\SOFTWARE\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t "Reg_Dword" /d "0" /f
REM ��������ѻ����趨Ϊ���رա�����������������ء���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /f
Reg Add "HKU\S-1-5-20\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t "Reg_Dword" /d "0" /f
REM �رը��ڵ����ܹܺ͡�ִ�С��Ի�������ʹ�ü�ʱ�Զ���ɨ��趨
Reg Add "HKCU\SOFTWARE\Microsoft\Internet Explorer\AutoComplete" /v "Append Completion" /t "Reg_Sz" /d "no" /f
REM �رա��������Լ�������ʾ�ڲ���·��վ���趨
Reg Add "HKCU\SOFTWARE\Microsoft\Internet Explorer\BrowserEmulation" /v "IntranetCompatibilityMode" /t "Reg_Dword" /d "0" /f
REM ��Ԥ������λ��Ϊ�����桹���ϼ�
Reg Add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Default Download Directory" /t "Reg_Sz" /d "C:\Users\%username%\Desktop" /f
REM �رա��������ʱ֪ͨ�ҡ��趨
Reg Add "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "NotifyDownloadComplete" /t "Reg_Sz" /d "no" /f
REM �������˵�������ʾ�ٶ�Ϊ0����
Reg Add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t "Reg_Sz" /d "0" /f
REM �ر�֪ͨ���ĵ�֪ͨ��Ϣ
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell" /v "UseActionCenterExperience" /t reg_dword /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ImmersiveShell\Launcher" /v "DisableLightDismiss" /t reg_dword /d 1 /f
REM ȡ�� ��֤���ַ��ƥ�䷢������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "WarnonBadCertRecving" /t reg_dword /d 0 /f
REM ȡ��-��鷢���̵�֤���Ƿ��ѵ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\WinTrust\Trust Providers\Software Publishing" /v "State" /t reg_dword /d 146944 /f
REM ȡ�� ��������֤�������:
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "CertificateRevocation" /t reg_dword /d 0 /f
REM ȡ��-��������صĳ����ǩ��
reg add "HKCU\Software\Microsoft\Internet Explorer\Download" /v "CheckExeSignatures" /t reg_sz /d "no" /f
REM ������ǿ����ģʽ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Isolation" /t reg_sz /d "PMIL" /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Isolation64Bit" /t reg_sz /d "PMIL" /f
REM ����-32 λ�����
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "TabProcGrowth" /t reg_dword /d "1" /f
REM ����Internet Explorer�ڱ��ػ������ҵĵ��ԣ������л����
reg add "HKCU\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN" /v "iexplore.exe" /t reg_dword /d 0 /f
REM ѡ��-��������CD�Ļ�������ҵĵ���������
reg add "HKCU\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN\Settings" /v "LOCALMACHINE_CD_UNLOCK" /t reg_dword /d 1 /f
REM ѡ��-�������л�װ�����ʹǩ����Ч
reg add "HKCU\Software\Microsoft\Internet Explorer\Download" /v "RunInvalidSignatures" /t reg_dword /d 1 /f
REM �ر�-���ô��ڵ�����ֹ����
reg add "HKCU\Software\Microsoft\Internet Explorer\New Windows" /v "PopupMgr" /t reg_dword /d 0 /f
REM ����Internet Explorer��TLS 1.2��TLS 1.0
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "SecureProtocols" /t REG_DWORD /d 0x880 /f
REM ȥ��IE��ȫ���÷�����ʾ
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "NoProtectedModeBanner" /d 1 /t reg_dword /f
REM �رչ���SmartScreenɸѡ��
reg add "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v "EnabledV8" /t reg_dword /d 0 /f
REM ��ֹEdge��SmartScreen
reg add "HKCU\SOFTWARE\Microsoft\Edge\SmartScreenEnabled" /v "" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Edge\SmartScreenPuaEnabled" /v "" /t REG_DWORD /d 0 /f
REM ��ֹSmartScreen
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\MicrosoftEdge\PhishingFilter" /v "EnabledV9" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "ScanWithAntiVirus" /t REG_DWORD /d 1 /f
REM ����IEͬʱ���ض���ļ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /t REG_DWORD /d 10 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /t REG_DWORD /d 10 /f
REM IE����������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /d 10 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /d 10 /t reg_dword /f
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPerServer" /d 10 /t reg_dword /f
reg add "HKU\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v "MaxConnectionsPer1_0Server" /d 10 /t reg_dword /f
REM �ر�IE�����Զ������ָ�
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Recovery" /v "AutoRecover" /t reg_dword /d 0 /f
REM �Զ��Ż������������ӿ������ٶ�
reg add "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" /v "Enable" /t reg_sz /d "Y" /f
REM �������ռ����100%������
reg add "HKLM\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction" /v "OptimizeComplete" /t reg_dword /d 0 /f
REM ����Win10��·��
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t reg_dword /d 1 /f
REM �ر�IE�ں�̨����վ����������Ż�����
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "UseSWRender" /t REG_DWORD /d 1 /f
REM ����Internet Explorer��Ԥȡ��Ԥ��Ⱦ����
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\PrefetchPrerender" /v "Enabled" /t reg_sz /d 0 /f
REM 360�Ż�����ķ�Ӧʱ��ӿ�ϵͳ�����ٶ�
reg add "HKCU\Control Panel\Desktop" /v "WaitToKillAppTimeout" /t reg_sz /d 10000 /f
REM 360���������������������޷�Ӧ�ĵȴ�ʱ��
reg add "HKCU\Control Panel\Desktop" /v "HungAppTimeout" /t reg_sz /d 3000 /f
REM �ѹ����뷨�������
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SogouSvc" /v "Start" /t reg_dword /d 3 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\SogouSvc" /v "Start" /t reg_dword /d 3 /f
REM �Ӵ�ͼ�껺��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t reg_sz /d 4096 /f
REM �ص�������Dr.Watson
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v "Auto" /t reg_sz /d 0 /f
REM ��ֹIE������Զ�����
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v "NoUpdateCheck" /t reg_sz /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v "NoUpdateCheck" /t reg_sz /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v "NoUpdateCheck" /t reg_sz /d 1 /f
REM ���ô���㱨�����ڷ������ش���ʱ֪ͨ��
reg add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\PCHealth\ErrorReporting" /v "ShowUI" /t reg_dword /d 0 /f
REM �ر�Ĭ�Ϲ���(��ֹ $C $D,��ֹ $Admin)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v "AutoShareServer" /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v "AutoShareWks" /t reg_dword /d 0 /f
REM �������乲��
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v "forceguest" /t reg_dword /d 0 /f
REM ����Զ��Э��
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t reg_dword /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t reg_dword /d 0 /f
REM ����Զ��MSTSC����
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d 0 /f
REM ��ֹԶ���޸�ע���
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteAccess" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" /v "RemoteRegAccess" /t reg_dword /d 0 /f
REM ȥ���Ҽ����Խ������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSecurityTab" /t REG_DWORD /d 1 /f
REM �����������������ص��ļ��ڴ�ʱ������ֹ
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d 1 /f
REM �ر���Ϸ¼�ƹ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t reg_dword /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t reg_dword /d 0 /f
REM �رա���������Ϸʱ�ں�̨¼�ơ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t reg_dword /d 0 /f
REM �ر�onedrive
reg add "HKLM\Software\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t reg_dword /d 1 /f
REM �ر��Զ����µ�ͼ
reg add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d 0 /f
REM �ر���Ѷ����Ȥ
taskkill /f /t /im "StartMenuExperienceHost.exe" >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t reg_dword /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t reg_dword /d 0 /f
taskkill /f /t /im "StartMenuExperienceHost.exe" >nul 2>nul
REM �ر�С��
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
REM �ر�win10�����û��л�����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "HideFastUserSwitching" /t reg_dword /d 1 /f
REM �ر�Windows Defender
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableScanOnRealtimeEnable" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Signature Updates" /v "ForceUpdateFromMU" /t reg_dword /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "DisableBlockAtFirstSeen" /t reg_dword /d 1 /f
REM Windows 10 ����߰汾�ر�Windows Defender
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableSpecialRunningModes" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
REM Windows 7/8/8.1�ر�Windows Defender
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableAntiVirus" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableSpecialRunningModes" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "DisableRoutinelyTakingAction" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender" /v "ServiceKeepAlive" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableIOAVProtection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableOnAccessProtection" /t REG_DWORD /d 1 /f
REM ����Windows Defender ��ȫ���ķ���
reg add "HKLM\SYSTEM\ControlSet001\Services\SecurityHealthService" /v "Start" /t reg_dword /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t reg_dword /d 4 /f
sc config WinDefend start= disabled
REM ж�ز�ɾ��OneDrive
taskkill /f /t /im OneDrive.exe
REM ɾ��OneDrive��������
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /f
REM ����OneDrive��ϵͳ����
sc config OneSyncSvc start= disabled
REM ж��OneDrive
taskkill /f /im OneDrive.exe
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
rd "%UserProfile%\OneDrive" /Q /S
rd "C:\OneDriveTemp" /Q /S
rd "%LocalAppData%\Microsoft\OneDrive" /Q /S
rd "%ProgramData%\Microsoft OneDrive" /Q /S
REM �������ݽ����������Ĺ��ܹ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t reg_dword /d 0 /f
REM �������ݽ�����������ԭʼ�豸������ԤװӦ�ó���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t reg_dword /d 0 /f
REM �������ݽ�������������ת��������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t reg_dword /d 1 /f
REM �������ݽ�������������ת�������Ӳ㹦��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t reg_dword /d 1 /f
REM �������ݽ�����������Ԥ��װӦ�ó���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t reg_dword /d 0 /f
REM �������ݽ����������ľ�Ĭ��װӦ�ó���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t reg_dword /d 0 /f
REM �������ݽ���������������½����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t reg_dword /d 0 /f
REM �������ݽ�����������ϵͳ��彨�鹦��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t reg_dword /d 0 /f
REM �ر��ڿ�ʼ�˵���ʾ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353696Enabled" /t reg_dword /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353698Enabled" /t reg_dword /d 0 /f
REM �ر�Windowsink
reg add "HKLM\Software\Microsoft\Windows\WindowsInkWorkspace" /v "AllowWindowsInkWorkspace" /t reg_dword /d 0 /f
REM ��֪ͨ������ʾ����ͼʾ�趨
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t "Reg_Dword" /d "0" /f
REM ΢��ƴ��Ĭ��ΪӢ������
reg add "HKCU\Software\Microsoft\InputMethod\Settings\CHS" /v "Default Mode" /t reg_dword /d 1 /f
REM ɾ��֪ͨ�Ͳ�������
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "DisableNotificationCenter" /t reg_dword /d 1 /f
REM �ļ�û�й����Ĵ򿪳���ʱ����ֹ��������ȥ����������
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoInternetOpenWith" /t reg_dword /d 1 /f
REM ���� Microsoft Store ��̨����Ӧ�ó���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.WindowsStore_8wekyb3d8bbwe" /v "Disabled" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications\Microsoft.WindowsStore_8wekyb3d8bbwe" /v "DisabledByUser" /t reg_dword /d 1 /f
REM �رմ򿪷�ʽ��Ӧ���̵�ѡ������Ӧ��
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "NoUseStoreOpenWith" /t reg_dword /d 1 /f
REM �����������ص�������
reg add "HKCU\Software\Microsoft\CTF\MSUTB" /v "ShowDeskBand" /t REG_DWORD /d 1 /f
REM ȡ���������ϵİ�����ť
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ShowStatus" /t REG_DWORD /d 4 /f
REM ����С��ʱ����ʾ�������ϵĶ���ͼ��
reg add "HKCU\Software\Microsoft\CTF\LangBar" /v "ExtraIconsOnMinimized" /t REG_DWORD /d 0 /f
REM �����������Ľ�������Ϊ3
reg add "HKCU\Software\Microsoft\CTF\LangBar\ItemState{ED9D5450-EBE6-4255-8289-F8A31E687228}" /v "DemoteLevel" /t REG_DWORD /d 3 /f
REM �رտ��ٷ�������ʾ�����ļ���
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t reg_dword /d 0 /f
REM �رտ��ٷ�������ʾ���ʹ�õ��ļ�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t reg_dword /d 0 /f
REM ��ֹ���м�����Զ�ά���ƻ�
reg add "HKLM\Software\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t reg_dword /d 0 /f
REM �ر�ϵͳ��֪
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense\Parameters\StoragePolicy" /v "fAllowToGetHelp" /t reg_dword /d 0 /f
REM ��Ļ���̲���������
reg add "HKLM\SOFTWARE\Microsoft\StigRegKey\Typing\TaskbarAvoidanceEnabled" /v "Enable" /t reg_dword /d 1 /f
REM �ر�Adobe Flash���㼴��
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Security" /v "FlashClickToRunMode" /t reg_dword /d 0 /f
REM ʹchrome֧��flash
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "AllowOutdatedPlugins" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "RunAllFlashInAllowMode" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "DefaultPluginsSetting" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium" /v "HardwareAccelerationModeEnabled" /t reg_dword /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Chromium\PluginsAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKCU\SOFTWARE\Policies\Chromium\PluginsAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ����ǰѯ��ÿ���ļ��ı���λ��
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "PromptForDownloadLocation" /t reg_dword /d 1 /f
REM �������й�ʱ�Ĳ��
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AllowOutdatedPlugins" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "RunAllFlashInAllowMode" /t reg_dword /d 1 /f
REM Ĭ��֪ͨ����
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultNotificationsSetting" /t reg_dword /d 1 /f
REM Ĭ�ϵ�����������_����
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultPopupsSetting" /t reg_dword /d 1 /f
REM �����Ѽ���߼������ƻ����û����������ݷ��͸� Google �������ɨ��
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AdvancedProtectionDeepScanningEnabled" /t reg_dword /d 0 /f
REM ��Google Chrome�رպ�������к�̨Ӧ��_�ر�
reg add "HKLM\Software\Policies\Google\Chrome\Recommended" /v "BackgroundModeEnabled" /t reg_dword /d 0 /f
REM �ڹ���������ʾ"��ҳ"��ť
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "ShowHomeButton" /t reg_dword /d 1 /f
REM �� Google Chrome ��ΪĬ�������
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultBrowserSettingEnabled" /t reg_dword /d 0 /f
REM Ĭ��JavaScript����_����
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultJavaScriptSetting" /t reg_dword /d 1 /f
REM Ĭ��Flash����_����
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "DefaultPluginsSetting" /t reg_dword /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "HardwareAccelerationModeEnabled" /t reg_dword /d 1 /f
REM ����Щ��վ������������
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PopupsAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\PopupsAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ����Щ��վ������Flash���
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
REM ������Щ��վ�ϵĲ���ȫ����
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\InsecureContentAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\InsecureContentAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ����Щ��վ������JavaScript
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\JavaScriptAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\JavaScriptAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ��������Щվ����������Կ
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\KeygenAllowedForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\KeygenAllowedForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ����Щվ��������WebUSB
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\WebUsbAskForUrls" /v "1" /t reg_sz /d "https://*" /f
reg add "HKLM\SOFTWARE\Policies\Google\Chrome\WebUsbAskForUrls" /v "2" /t reg_sz /d "http://*" /f
REM ��ֹChrome��ӡҳü��ҳ��
reg add "HKCU\Software\Policies\Google\Chrome" /v "PrintHeaderFooter" /t REG_DWORD /d 0 /f
REM ����ChromeĬ�ϱ���ͼƬ��ӡģʽ
reg add "HKCU\Software\Policies\Google\Chrome" /v "PrintingBackgroundGraphicsDefault" /t REG_SZ /d "enabled" /f
REM �����ַ������վ��
SET REGPATH=HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains
reg add "%REGPATH%\hsbank.com.cn\*" /v "http" /t reg_dword /d "2" /f
reg add "%REGPATH%\hsbank.com.cn\*" /v "https" /t reg_dword /d "2" /f
reg add "%REGPATH%\hsbank.cn\*" /v "http" /t reg_dword /d "2" /f
reg add "%REGPATH%\hsbank.cn\*" /v "https" /t reg_dword /d "2" /f
reg add "%REGPATH%\hsbank.cc\*" /v "http" /t reg_dword /d "2" /f
reg add "%REGPATH%\hsbank.cc\*" /v "https" /t reg_dword /d "2" /f
reg add "%REGPATH%\hsbank.com\*" /v "http" /t reg_dword /d "2" /f
reg add "%REGPATH%\hsbank.com\*" /v "https" /t reg_dword /d "2" /f
REM ����IP������վ��
SET REGPATH=HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Ranges
reg add "%REGPATH%\Range100" /v ":Range" /d "38.*" /t REG_SZ /f
reg add "%REGPATH%\Range100" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range100" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range101" /v ":Range" /d "38.*.*.*" /t REG_SZ /f
reg add "%REGPATH%\Range101" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range101" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range102" /v ":Range" /d "38.10.68.32" /t REG_SZ /f
reg add "%REGPATH%\Range102" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range102" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range103" /v ":Range" /d "38.10.68.38" /t REG_SZ /f
reg add "%REGPATH%\Range103" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range103" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range104" /v ":Range" /d "38.19.11.176" /t REG_SZ /f
reg add "%REGPATH%\Range104" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range104" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range105" /v ":Range" /d "38.19.11.177" /t REG_SZ /f
reg add "%REGPATH%\Range105" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range105" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range106" /v ":Range" /d "38.19.13.70" /t REG_SZ /f
reg add "%REGPATH%\Range106" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range106" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range107" /v ":Range" /d "38.19.13.241" /t REG_SZ /f
reg add "%REGPATH%\Range107" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range107" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range108" /v ":Range" /d "38.19.17.80" /t REG_SZ /f
reg add "%REGPATH%\Range108" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range108" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range109" /v ":Range" /d "38.19.19.114" /t REG_SZ /f
reg add "%REGPATH%\Range109" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range109" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range110" /v ":Range" /d "38.19.19.157" /t REG_SZ /f
reg add "%REGPATH%\Range110" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range110" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range111" /v ":Range" /d "38.19.19.172" /t REG_SZ /f
reg add "%REGPATH%\Range111" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range111" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range112" /v ":Range" /d "38.19.19.240" /t REG_SZ /f
reg add "%REGPATH%\Range112" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range112" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range113" /v ":Range" /d "38.19.19.243" /t REG_SZ /f
reg add "%REGPATH%\Range113" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range113" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range114" /v ":Range" /d "38.19.19.78" /t REG_SZ /f
reg add "%REGPATH%\Range114" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range114" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range115" /v ":Range" /d "38.19.64.35" /t REG_SZ /f
reg add "%REGPATH%\Range115" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range115" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range116" /v ":Range" /d "38.19.77.104" /t REG_SZ /f
reg add "%REGPATH%\Range116" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range116" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range117" /v ":Range" /d "38.19.79.45" /t REG_SZ /f
reg add "%REGPATH%\Range117" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range117" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range118" /v ":Range" /d "38.19.79.55" /t REG_SZ /f
reg add "%REGPATH%\Range118" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range118" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range119" /v ":Range" /d "38.40.15.101" /t REG_SZ /f
reg add "%REGPATH%\Range119" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range119" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range120" /v ":Range" /d "38.19.19.52" /t REG_SZ /f
reg add "%REGPATH%\Range120" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range120" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range121" /v ":Range" /d "38.19.19.87" /t REG_SZ /f
reg add "%REGPATH%\Range121" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range121" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range122" /v ":Range" /d "38.19.16.33" /t REG_SZ /f
reg add "%REGPATH%\Range122" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range122" /v "https" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range123" /v ":Range" /d "38.19.78.59" /t REG_SZ /f
reg add "%REGPATH%\Range123" /v "http" /d "2" /t REG_DWORD /f
reg add "%REGPATH%\Range123" /v "https" /d "2" /t REG_DWORD /f
REM ����IE��ӡ������ɫ��ͼ��
REM reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "Print_Background" /t reg_sz /d "yes" /f
REM reg add "HKCU\Software\Microsoft\Internet Explorer\PageSetup" /v "Print_Background" /t reg_sz /d "yes" /f
REM ȥ��IE�ұߵ�Ц��
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions" /v "NoHelpItemSendFeedback" /t reg_dword /d "1" /f
REM �ر�IE��ȫ���ü�鹦��
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Security" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Group Policy Objects\{C2D0B7D4-7CC5-40A6-AC4C-A25BA2637B18}Machine\Software\Policies\Microsoft\Internet Explorer\Security" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableSecuritySettingsCheck" /t reg_dword /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Group Policy Objects\{C2D0B7D4-7CC5-40A6-AC4C-A25BA2637B18}Machine\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "NoFirsttimeprompt" /t reg_dword /d "1" /f
REM �ر�����վ��Ҫ���������֤(https:)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v "Flags" /t reg_dword /d "67" /f
REM ���ò���ȫ��������¼
reg add "HKLM\Software\Policies\Microsoft\Windows\LanmanWorkstation" /v "AllowInsecureGuestAuth" /d 1 /t reg_dword /f
reg add "HKLM\Software\WOW6432Node\Policies\Microsoft\Windows\LanmanWorkstation" /v "AllowInsecureGuestAuth" /d 1 /t reg_dword /f
REM �����Ż�-����NetBIOS���ƽ�����ѯ��ʱʱ��Ϊ3000���롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NetBT\Parameters" /v "NameSrvQueryTimeout" /d 3000 /t reg_dword /f
REM �����Ż�-���������ļ��������Ż���������ļ�������������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "nonetcrawling" /d 1 /t reg_dword /f
REM �����Ż�-����ÿ�������������������Ϊ0����ʾû�����ơ�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /d 0 /t reg_dword /f
REM �����Ż�-����Ĭ�ϵ�TTL������ʱ�䣩Ϊ64��
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /d 64 /t reg_dword /f
REM �����Ż�-����·��MTU���ֹ��ܣ����Ż�TCP/IP��������ݴ��䡣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /d 1 /t reg_dword /f
REM �����Ż�-����TCP/IP�ڶ���⹦�ܣ����Ż����紫�䡣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUBHDetect" /d 1 /t reg_dword /f
REM �����Ż�-����TCP SACKѡ�������������ܡ�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /d 1 /t reg_dword /f
REM �����Ż�-����TCP�������ȷ����Ϊ2���Լ��������ӳ١�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /d 2 /t reg_dword /f
REM �����Ż�-����Windows����վ�������󲢷�������Ϊ30��
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxCmds" /d 30 /t reg_dword /f
REM �����Ż�-����Windows����վ���������߳���Ϊ30��
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxThreads" /d 30 /t reg_dword /f
REM �����Ż�-����Windows����վ���������ռ�����Ϊ32��
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "MaxCollectionCount" /d 32 /t reg_dword /f
REM �����Ż�-����DNS���渺��SOA��Start of Authority����¼�Ļ���ʱ��Ϊ0�롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "negativesoacachetime" /d 0 /t reg_dword /f
REM �����Ż�-����DNS����������ϵĻ���ʱ��Ϊ0�롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "netfailurecachetime" /d 0 /t reg_dword /f
REM �����Ż�-����DNS������Ŀ�����TTL������ʱ�䣩����Ϊ10800�롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxcacheentryttllimit" /d 10800 /t reg_dword /f
REM �����Ż�-����DNS��������TTL������ʱ�䣩Ϊ10800�롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxcachettl" /d 10800 /t reg_dword /f
REM �����Ż�-����DNS���渺�滺������TTL������ʱ�䣩Ϊ0�롣
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "maxnegativecachettl" /d 0 /t reg_dword /f
REM �����Ż�-����TCP��������ѡ���������紫�����ܡ�
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /d 1 /t reg_dword /f
REM ����������������Ӿ�Ч������Ϊ�������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /d 2 /t REG_DWORD /f
REM �����Ż�-����Windows�еĸ��Ի��������������ռ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /d 0 /t reg_dword /f
REM �����Ż�-��������������Ч��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /d 0 /t reg_dword /f
REM �����Ż�-���ò˵�����Ч��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\MenuAnimation" /v "DefaultApplied" /d 0 /t reg_dword /f
REM �����Ż�-���ô�����ӰЧ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\DropShadow" /v "DefaultApplied" /d 0 /t reg_dword /f
REM �����Ż�-�������ָ����ӰЧ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\CursorShadow" /v "DefaultApplied" /d 0 /t reg_dword /f
REM �����Ż�-�����б���ͼ��͸��ѡ��Ч��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewAlphaSelect" /d 0 /t reg_dword /f
REM �����Ż�-��������������Ч��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /d 0 /t reg_dword /f
REM �����Ż�-����Cortana��ť��ʾ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /d 0 /t reg_dword /f
REM �����Ż�-���������Ͻ���������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SearchboxTaskbarMode" /d 0 /t reg_dword /f
REM �����Ż�-���ÿ�ʼ�˵��е����ʹ�õĳ����б�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /d 0 /t reg_dword /f
REM �����Ż�-ȡ����ʾ"Windows lnk������"��ť
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f
REM �����Ż�-����������Ļʱ�Զ������Ĵ�������
reg add "HKLM\SOFTWARE\Microsoft\TabletTip\1.7" /v "DisableNewKeyboardExperience" /t REG_DWORD /d 1 /f
REM �ӿ�Aero Snap��ʾ�ٶȣ�����Ŀ�����������ͼ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ExtendedUIHoverTime" /d 0 /t reg_dword /f
REM �ӿ�Aero Snap��ʾ�ٶȣ�����Ŀ�����������ͼ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DesktopLivePreviewHoverTime" /d 0 /t reg_dword /f
REM ϵͳ��ʾЧ���Ż�-�����Ӿ�Ч������Ϊ������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /d 3 /t REG_DWORD /f
REM ϵͳ��ʾЧ���Ż�-�����϶�����ʱ��ȫ��Ԥ��Ч��
reg add "HKCU\Control Panel\Desktop" /v "DragFullWindows" /d 0 /t REG_SZ /f
REM ϵͳ��ʾЧ���Ż�-�޸��û���ѡ������
reg add "HKCU\Control Panel\Desktop" /v "UserPreferencesMask" /d 9012038010000000 /t REG_BINARY /f
REM ϵͳ��ʾЧ���Ż�-��������ƽ����Ϊ��׼
reg add "HKCU\Control Panel\Desktop" /v "FontSmoothing" /d 2 /t REG_SZ /f
REM ϵͳ��ʾЧ���Ż�-���ô�����С�������ʱ�Ķ���Ч��
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /d 0 /t REG_SZ /f
REM ϵͳ��ʾЧ���Ż�-������������ʾͼ�������
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /d 0 /t REG_DWORD /f
REM ϵͳ��ʾЧ���Ż�-�����б���ͼ����ӰЧ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /d 1 /t REG_DWORD /f
REM ϵͳ��ʾЧ���Ż�-�����Ӿ�Ч������Ϊ������
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "CompositionPolicy" /d 1 /t REG_DWORD /f
REM ϵͳ��ʾЧ���Ż�-�����Ӿ�Ч������Ϊ������
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /d 0 /t REG_DWORD /f
REM ϵͳ��ʾЧ���Ż�-�����Ӿ�Ч������Ϊ������
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /d 1 /t REG_DWORD /f
REM ����Ƶ�ʸ�Ϊ���Ӳ���
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /d 0 /t REG_DWORD /f
REM ��ֹ��꽹�㶪ʧ
reg add "HKCU\Control Panel\Desktop" /v "ForegroundLockTimeout" /d 0 /t REG_SZ /f
REM ���ô��ڳ�խ�߿�
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "PaddedBorderWidth" /d "-15" /t REG_SZ /f
REM ����������ɫ�������ʹ��ڱ߿�
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /d "1" /t REG_SZ /f
REM �رմ�����ɫ͸��Ч��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /d "0" /t REG_SZ /f
REM ���ͣ��ʱ��
reg add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /d 100 /t REG_SZ /f
REM �������Զ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoDriveTypeAutoRun" /d 221 /t REG_DWORD /f
REM �Ż�Windows�ļ��б�ˢ�²��ԣ��ļ����ֹ�1�Զ�0ˢ��
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoSimpleNetIDList" /d 0 /t REG_DWORD /f
REM �ر�cortona
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "Enabled" /d 0 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v "SettingsVersion" /d 3 /t REG_DWORD /f
REM ɾ����Դ�����������ļ���
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
REM ɾ����Դ��������Ƶ�ļ���
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
REM ɾ��������ļ���
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\{031E4825-7B94-4dc3-B131-E946B44C8DD5} /f
REM ��������ȡ���̶���ѡ��
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v "LockedStartLayout" /d 0 /t reg_dword /f
reg add "HKLM\Software\Wow6432Node\Policies\Microsoft\Windows\Explorer" /v "LockedStartLayout" /d 0 /t reg_dword /f
REM NTF�ļ��Ż�
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager" /v "NtfsDisableLastAccessUpdate" /d 1 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "NtfsDisableLastAccessUpdate" /d 1 /t reg_dword /f
REM �Ż�Ӳ�����ݴ洢
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout" /v "EnableAutoLayout" /d 1 /t reg_dword /f
REM ϵͳ�����޸�ʱ��
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager" /v "AutoChkTimeout" /d 5 /t reg_dword /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "AutoChkTimeout" /d 5 /t reg_dword /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoLowDiskSpaceChecks" /d 1 /t reg_dword /f
REM ���Win10ͼƬ���������ڴ治�㣬����2Ϊʵ���Ʒ������4G�ڴ�
REM reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\ICM\RegisteredProfiles" /v "sRGB" /t reg_sz /d "RSWOP.icm" /f
reg add "HKCU\Software\Microsoft\Windows Photo Viewer\Viewer" /f /v MemCacheSize /t REG_DWORD /d 4294967295
REM �ر�windows�����Ż�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v "PenWorkspaceAppSuggestionsEnabled" /t reg_dword /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d "4" /f
REM ��������ʼ�������ļ���������
REM reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Search\PrimaryProperties\UnindexedLocations" /v "SearchOnly" /t reg_dword /d 0 /f
REM ȥ��WPS���ĵ�
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace{D426C8B3-0B26-4F0D-BA74-2EE212EDAC6D}" /f 
taskkill /f /im wpsoffice.exe
ping 127.0.0.1 -n 5 > nul
rd "%UserProfile%\AppData\Roaming\WPS\Office" /Q /S
rd "%UserProfile%\AppData\Local\Kingsoft\WPS Office" /Q /S rd "%UserProfile%\AppData\LocalLow\Kingsoft\WPS Office" /Q /S
REM IE��ֹ����������֪ͨ
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableAddonLoadTimePerformanceNotifications" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "DisableAddonLoadTimePerformanceNotifications" /t reg_dword /d 1 /f
REM �Զ������°�װ�ļ�����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "IgnoreFrameApprovalCheck" /t reg_dword /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Ext" /v "IgnoreFrameApprovalCheck" /t reg_dword /d 1 /f
REM ����IE�״������Զ�������
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceHasShown" /t reg_dword /d 1 /f
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v "RunOnceComplete" /t reg_dword /d 1 /f
REM �����״���
reg add "HKCU\Software\Policies\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Main" /v "DisableFirstRunCustomize" /t reg_dword /d 1 /f
REM �ر�������վͨ�����������б����ṩ��ط���
reg add "HKCU\Control Panel\International\User Profile" /v "HttpAcceptLanguageOptOut" /t reg_dword /d 1 /f
REM �ر�win10ϵͳԤ���ռ�
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\ReserveManager" /v "ShippedWithReserves" /t reg_dword /d 0 /f
REM Windows 7����ӵ�������ṩ����������������������
netsh int tcp set global congestionprovider=none 2>nul
netsh interface tcp set global congestionprovider=ctcp 2>nul
REM Windows 7�����̴�ж��״̬Ϊ�Զ��������������紫��Ч��
netsh int tcp set global chimney=automatic 2>nul
REM Windows 7���ý��շ�����״̬���������߶��ϵͳ����������
netsh int tcp set global rss=enabled 2>nul
REM Windows 7����NetDMA״̬�����������������ݰ��Ĵ���Ч��
netsh int tcp set global netdma=enabled 2>nul
REM Windows 7����ֱ�ӻ������(DCA)�����������������ݰ��Ĵ���Ч��
netsh int tcp set global dca=enabled 2>nul
REM Windows 7���ý��մ����Զ���г����Ϊ����ģʽ������԰������ĳЩ������������
netsh int tcp set global autotuninglevel=restricted
REM ����TCP����ʽ�㷨
netsh int tcp set heuristics disabled
REM Windows10����������ģ��������ӵ�������ṩ����������������������
netsh int tcp set supplemental template=datacenter congestionprovider=ctcp 2>nul
REM Windows10����ECN���ܡ�����԰������ĳЩ�������������
netsh int tcp set global ecncapability=disabled 2>nul
REM Windows10����RFC 1323ʱ����������������紫��Ч��
netsh int tcp set global timestamps=enabled 2>nul
REM Windows10����IPv6��ع���
netsh interface teredo set state disable 1>nul 2>nul
netsh interface 6to4 set state disabled 1>nul 2>nul
netsh interface isatap set state disabled 1>nul 2>nul
REM �޸�XPS
REM assoc .oxps=oxpsfile 2>nul
REM assoc .xps=xpsfile 2>nul
REM ftype oxpsfile=%Windir%\System32\xpsrchvw.exe %1 2>nul
REM ftype xpsfile=%Windir%\System32\xpsrchvw.exe %1 2>nul
REM ��ʽ�޸�
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

REM ����Ĭ���������Ӧ�����ƺ�·��
set "browserName=Internet Explorer"
set "browserPath32=C:\ProgramFiles(x86)\Internet Explorer\iexplore.exe"
set "browserPath64=C:\Program Files\internet explorer\iexplore.exe"
REM ����Internet Explorer����չ����
REM reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v EnableExtensions /t REG_DWORD /d 0 /f
REM �������´��ڻ��ǩҳ��ʼ����Internet Explorer�д�����
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v AlwaysOpenIEInNewWindow /t REG_DWORD /d 1 /f
REM ����Internet Explorer�Ļ����
reg add "HKCU\Software\Microsoft\Internet Explorer\Main" /v EnableIEActivities /t REG_DWORD /d 0 /f
REM ɾ��httpЭ���UserChoice��
reg delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" /v Progid /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" /v Hash /f
REM ɾ��httpsЭ���UserChoice��
reg delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" /v Progid /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" /v Hash /f
REM ����Edge�����
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v AllowPrelaunch /t REG_DWORD /d 0 /f
reg ADD "HKLM\SOFTWARE\Policies\Microsoft\EdgeUpdate" /v DoNotUpdateToEdgeWithChromium /t REG_DWORD /d 1 /f
REM �����Զ���ת��Edge�����
reg ADD "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" /v Hash /t REG_SZ /d "" /f
reg ADD "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" /v Hash /t REG_SZ /d "" /f
REM ����Ĭ���������Ӧ�����ƺ�·��
reg ADD "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\DefaultIcon" /ve /d "%browserPath32%,1" /f
reg ADD "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\DefaultIcon" /ve /d "%browserPath32%,1" /f
reg ADD "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\DefaultIcon" /ve /d "%browserPath32%,1" /f
reg ADD "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\shell\open\command" /ve /d "\"%browserPath32%\" -nohome" /f
reg ADD "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\shell\open\command" /ve /d "\"%browserPath32%\" -nohome" /f
reg ADD "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\shell\open\command" /ve /d "\"%browserPath32%\" -nohome" /f
REM �޸�Ĭ���������ע����ֵ
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice" /v ProgId /d %browserName% /f
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice" /v ProgId /d %browserName% /f
rem �ָ�Ĭ�ϵ� FTP �򿪷�ʽΪ Windows ��Դ������
reg add "HKCU\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\ftp\UserChoice" /v ProgId /d "IE.AssocFile.FTP" /f
REM ����Ĭ���������·��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\iexplore.exe" /v Path /t REG_SZ /d %browserPath32% /f
REM ����IE11��Edge���ض���
reg add "HKLM\SOFTWARE\Microsoft\Internet Explorer\Main" /v IE11DisableEdgeRedirect /t REG_DWORD /d 1 /f
REM ��ǿ����IE
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open\Command" /ve /t reg_sz /d "%browserPath32%" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open64" /ve /t reg_sz /d "����64λIE(&E)" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Open64\Command" /ve /t reg_sz /d "%browserPath64%" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Alank" /ve /t reg_sz /d "�򿪿հ�ҳ(&B)" /f
reg add "HKCR\CLSID\{B416D21B-3B22-B6D4-BBD3-BBD452DB3D5B}\Shell\Alank\Command" /ve /t reg_sz /d "\"%browserPath32%\" about:blank" /f
REM �ر�win10��windows����Ĭ�ϴ�ӡ��
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows" /v "LegacyDefaultPrinterMode" /t reg_dword /d 1 /f
REM �رճ������������
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /d 1 /t REG_DWORD /f
REM ��Ļ����
REM rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,1
REM ��ҳ
INETCPL.CPL
REM ����,win10û��
REM control.exe nusrmgr.cpl
REM ��ӡ��
rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL PrintersFolder
REM IP
REM ncpa.cpl
REM ��������
REM control netconnections
REM ��Դѡ��
REM powercfg.cpl
REM Ĭ�ϳ�������
REM Rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,3
REM �������
REM sysdm.cpl
REM ϵͳ�ж�
REM for /f "tokens=2* delims=[.]" %%i in ('ver') do set v=%%i
REM for /f "tokens=2* delims= " %%i in ("%v%") do set sysos=%%i
REM ϵͳ��ת
REM goto os%sysos%
REM :os5
REM echo Windows XP
REM goto last
REM :os6
REM echo Windows 7
REM del "%userprofile%\AppData\Roaming\Microsoft\Windows\SendTo\Compressed (zipped) Folder.ZFSendToTarget" /q /f 2>nul
REM ��������
REM rundll32.exe %SystemRoot%\system32\shell32.dll,Control_RunDLL %SystemRoot%\system32\desk.cpl desk,@Themes /Action:OpenTheme /file:"%Windir%\Resources\Themes\aero.theme"
REM goto last
REM :os10
REM echo Windows 10
REM move /Y C:\Users\Public\ver.bat %userprofile%
REM ���������ͽ���win10����ǩ����֤�ű�
REM ��������ʱ�������Լ��
bcdedit.exe /set nointegritychecks on
REM ��������ִ�б�����DEP��
bcdedit /set nx AlwaysOff
REM ��������ʱ�������Լ��
bcdedit -set loadoptions DISABLE_INTEGRITY_CHECKS
REM �ر�ϵͳ����ģʽ
REM bcdedit /set testsigning off
REM �������Թ���
REM bcdedit /debug ON
REM bcdedit /bootdebug ON
REM �������Ա�����豸��װ���Ʋ���
reg add "HKLM\Software\Policies\Microsoft\Windows\DeviceInstall\Restrictions" /v "AllowAdminInstall" /t reg_dword /d 1 /f
REM ���豸��������Ĵ���ǩ������Ϊ����
reg add "HKCU\Software\Policies\Microsoft\Windows NT\Driver Signing" /v "BehaviorOnFailedVerify" /t reg_dword /d 0 /f
REM ���û�����������Ч������Ϊ��������
net accounts /maxpwage:unlimited
REM ���õ�¼ʱ������˽��������
reg add "HKLM\Software\Policies\Microsoft\Windows\OOBE" /v "DisablePrivacyExperience" /t reg_dword /d 1 /f
REM ��������
REM "%Windir%\Resources\Themes\HSbankWin10.theme"
REM ���win10Զ�������ر� TCP/IP �Զ�����
netsh interface tcp set global autotuninglevel=disabled
REM �رո߼���������
reg add "HKCU\Control Panel\Desktop" /v "Win8DpiScaling" /t reg_dword /d 0 /f
REM �������� Windows �����޸�Ӧ��
reg add "HKCU\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t reg_dword /d 1 /f
REM �����Զ�������Ϊ124(124%ֵΪ119,100%ֵΪ96)
reg add "HKCU\Control Panel\Desktop" /v "LogPixels" /t reg_dword /d 96 /f
REM ɾ�����д������û��˳�ʱ������д���
reg add "HKCU\Software\Policies\Microsoft\Windows" /v "ClearTilesOnExit" /t reg_dword /d 1 /f
REM ���ÿͻ��˴�ӡ���ض���
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fDisableCpm" /t reg_dword /d 1 /f
REM ����Զ������Ự�еĿͻ��˴�ӡ������ΪĬ�ϴ�ӡ��
reg add "HKLM\Software\Policies\Microsoft\Windows NT\Terminal Services" /v "fForceClientLptDef" /t reg_dword /d 1 /f
REM ɾ������Ķ�������������
taskkill /f /t /im FRMI.exe 2>nul
taskkill /f /t /im Lcserver.exe 2>nul
del "C:\ProgramData\CPPackages\*.EXE" /q /f 2>nul
REM �����װ��
if exist "C:\ShaoHua\Softprep.exe" start "" /wait C:\ShaoHua\Softprep.exe 2>nul
REM SSD����
REM �ж��Ƿ��ǹ�̬Ӳ��
REM powershell get-physicaldisk|Findstr /l /c:"SSD" 1>nul 2>nul&&goto ssd ||goto exit
:ssd
REM �رճ���Ԥ�� Superfetch
net stop "SysMain" 2>nul
sc config "SysMain" start= disabled 2>nul
REM �ر�ϵͳԤ�� Prefetch
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t reg_dword /d 0 /f
REM ��ֹ���ѽ���ϵͳ��Ϸ���
sc stop WdiSystemHost
sc stop WdiServiceHost
sc stop DPS
sc config DPS start= disabled
sc config WdiServiceHost start= disabled
sc config WdiSystemHost start= disabled
:exit
REM ���²���
gpupdate /force
REM ϵͳ����ű�
if exist "C:\ShaoHua\Key\Activate.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\ϵͳ����ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\Activate.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
REM ��ӡ����ű�
if exist "C:\ShaoHua\Key\FixPrint.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\��ӡ����ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\FixPrint.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
REM ��������ű�
if exist "C:\ShaoHua\Key\ClearTemp.bat" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\��������ű�.lnk""):b.TargetPath=""C:\ShaoHua\Key\ClearTemp.bat"":b.WorkingDirectory=""C:\ShaoHua\Key"":b.Save:close") 2>nul
REM ɾ�������ļ�
del "C:\ShaoHua\Drv\Drvceo\*.*" /f /s /q 2>nul
rd "C:\ShaoHua\Drv\Drvceo\" /s /q 2>nul
REM �����������ж�
if exist "C:\resoft\resoft.dll" goto neipc 2>nul
if not exist "C:\resoft\resoft.dll" goto waipc 2>nul
:neipc
del "C:\users\public\desktop\�������ӹ���ϵͳ7.4.2.lnk" /q /f 2>nul
del "C:\users\public\desktop\Sursen Maker 2.0.lnk" /q /f 2>nul
del "C:\shaohua\soft\WeChatSetup.exe" /q /f 2>nul
del "C:\shaohua\soft\ThunderSpeed.exe" /q /f 2>nul
del "C:\ShaoHua\Tools\Key\*.exe" /q /f 2>nul
del "C:\ShaoHua\Tools\Office�޸�����\Office����һ���޸�.exe" /q /f 2>nul
del "C:\ShaoHua\Tools\Office�޸�����\��ӡ����һ�����.exe" /q /f 2>nul
goto tips
:waipc
REM ����Windows10�Զ�����
REM win10��ֹ��������
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t reg_dword /d 1 /f
REM win10��ֹ���´���1809�汾
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetReleaseVersion" /t reg_dword /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetReleaseVersionInfo" /t reg_sz /d 1809 /f
REM �������� / Stopping Process...  
REM taskkill /im Windows10UpgraderApp.exe 2>nul
REM del /f /q "%USERPROFILE%\Desktop\΢�� Windows 10 ����.lnk" 2>nul
REM del /f /q "%USERPROFILE%\Desktop\Windows 10 Update Assistant.lnk" 2>nul
REM ��ӷ���ǽ���� / Adding firewall rules...
REM netsh advfirewall firewall add rule name="Block_Windows10UpgraderApp" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\Windows10UpgraderApp.exe" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_WinREBootApp32" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\WinREBootApp32.exe" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_WinREBootApp64" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\WinREBootApp64.exe" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_bootsect" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\bootsect.exe" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_DW20" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\DW20.EXE" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_DWTRIG20" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\DWTRIG20.EXE" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_GatherOSState" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\GatherOSState.EXE" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_GetCurrentRollback" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\GetCurrentRollback.EXE" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_HttpHelper" dir=in program="%SYSTEMDRIVE%\Windows10Upgrade\HttpHelper.exe" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_UpdateAssistant" dir=in program="%SYSTEMROOT%\UpdateAssistant\UpdateAssistant.exe" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_UpdateAssistantCheck" dir=in program="%SYSTEMROOT%\UpdateAssistant\UpdateAssistantCheck.exe" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_Windows10Upgrade" dir=in program="%SYSTEMROOT%\UpdateAssistant\Windows10Upgrade.exe" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_UpdateAssistantV2" dir=in program="%SYSTEMROOT%\UpdateAssistantV2\UpdateAssistant.exe" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_UpdateAssistantCheckV2" dir=in program="%SYSTEMROOT%\UpdateAssistantV2\UpdateAssistantCheck.exe" action=block 2>nul
REM netsh advfirewall firewall add rule name="Block_Windows10UpgradeV2" dir=in program="%SYSTEMROOT%\UpdateAssistantV2\Windows10Upgrade.exe" action=block 2>nul
REM ����ACL / Configurating ACL...
REM echo y|cacls C:\Windows\UpdateAssistant\*.exe /t /p everyone:n 2>nul
REM echo y|cacls C:\Windows10Upgrade\*.exe /t /p everyone:n 2>nul
REM ֹͣWindows Update���� / Disable Windows Update
sc stop wuauserv
sc config wuauserv start= disabled
REM ɾ���ƻ����� / Delete task...
schtasks /delete /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistant" /f 2>nul
schtasks /delete /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantAllUsersRun" /f 2>nul
schtasks /delete /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantCalendarRun" /f 2>nul
schtasks /delete /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateAssistantWakeupRun" /f 2>nul
REM ��ֹ���ӵ� Windows Update �Ļ�����λ��
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t reg_dword /d 1 /f
REM �����Զ�����
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t reg_dword /d 1 /f
REM ����windows���·���
sc config WaaSMedicSvc start= disabled 2>nul
reg add "HKLM\SYSTEM\CurrentControlSet\Services\UsoSvc " /v "start" /t reg_dword /d "4" /f
REM ���׽���Win10�Զ����·���Windows Update
REM reg add "HKLM\SYSTEM\ControlSet001\Services\wuauserv" /v "Start" /t reg_dword /d "4" /f
REM reg add "HKLM\SYSTEM\ControlSet001\Services\wuauserv" /v "FailureActions" /d "80510100000000000000000003000000140000000000000060ea000000000000000000000000000000000000" /t reg_binary /f
REM ���׽���Win10�Զ����·���Windows Update Medic Service
REM reg add "HKLM\SYSTEM\ControlSet001\Services\WaaSMedicSvc" /v "Start" /t reg_dword /d "4" /f
REM reg add "HKLM\SYSTEM\ControlSet001\Services\WaaSMedicSvc" /v "FailureActions" /d "84030000000000000000000003000000140000000001000000c0d4010001000000e09304000000000000000000" /t reg_binary /f
REM ���׽���Win10�Զ����·���Windows Update
REM reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t reg_dword /d "4" /f
REM reg add "HKLM\SYSTEM\CurrentControlSet\Services\wuauserv" /v "FailureActions" /d "80510100000000000000000003000000140000000000000060ea000000000000000000000000000000000000" /t reg_binary /f
REM ���׽���Win10�Զ����·���Windows Update Medic Service
REM reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t reg_dword /d "4" /f
REM reg add "HKLM\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "FailureActions" /d "84030000000000000000000003000000140000000001000000c0d4010001000000e09304000000000000000000" /t reg_binary /f
REM �ļ�����
del "C:\Windows\System32\UCli.exe" /f /s /q 2>nul
del "C:\Windows\System32\config.ini" /f /s /q 2>nul
del "C:\windows\Hsbank\*.*" /f /s /q 2>nul
rd "C:\shaohua\Hsbank\" /s /q 2>nul
goto tips
:tips
REM ����IE����
REM start "" cleanmgr
REM		1����ʱInternet�ļ�
REM		2��Cookies
REM		4����ʷ��¼
REM		8��������
REM		16������
REM		32����չ�ı�����
REM		64�������ļ�
REM		128���Ѱ�װ����չ
REM		256��Ԥ������
REM		512�����ٱ�������
REM		1024��Do Not Track����
REM		2048���ָ�Ĭ������
REM		4096��ɾ����������
REM		8192��ɾ������
REM		16384��Windows���������ʷ
REM RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 4
del /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*"
del /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*"
del /f /s /q "%TEMP%\*"
REM ��ʱInternet�ļ���1Cookies��2��ʷ��¼��4�����ݣ�8Ԥ�����棨���߻��棩��256����Щ���ּ��������õ�271��
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 271
cleanmgr.exe /VERYLOWDISK
REM ˢ������
taskkill /f /im explorer.exe 2>nul
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
start "" explorer
for /f "tokens=3*" %%i in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "ProductName"') do set ProductName=%%i %%j
for /f "tokens=3*" %%i in ('reg query "HKLM\Software\Microsoft\Windows NT\CurrentVersion" /v "ReleaseId"') do set ReleaseId=%%i
for /f "tokens=2* delims=[]" %%i in ('ver') do set v=%%i
for /f "tokens=2* delims= " %%i in ("%v%") do set CurrentBuildNumber=%%i
REM start mshta vbscript:msgbox("System��"^&vbCrLf^&"%ProductName%"^&vbCrLf^&"%processor_architecture%"^&vbCrLf^&"%ReleaseId% - %CurrentBuildNumber%"^&vbCrLf^&""^&vbCrLf^&"Script��"^&vbCrLf^&"ShaoHua - 7x24H - 18900559020"^&vbCrLf^&"Version��"^&vbCrLf^&"%Version%",64,"Tips - %date%")(window.close)
REM ����Զ��
REM Rundll32.exe shell32.dll,Control_RunDLL Sysdm.cpl,,5
start "" rundll32 shell32,ShellAbout Script  ���ۻ� - 18900559020                   Date��%Version% System��%ProductName% - %processor_architecture% - %CurrentBuildNumber%
if exist "C:\ShaoHua\Tools\info.exe" start "" "C:\ShaoHua\Tools\info.exe"
echo %~dp0|find /i "windows" >nul||del %0
exit