��a
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=InitialSetup�ű�
set Powered=Powered by �ۻ� 18900559020
set Version=20240728
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
:start
REM ver
for /F "tokens=1" %%a in ('wmic os get localdatetime ^| find "."') do (set date=%%a & set day=!date:~0,8!& reg add "HKCR\.ShaoHua" /v "InitialSetup" /t reg_sz /d "!day!" /f)
call :cmd_admin
call :clear
call :out
exit
:cmd_admin
REM ����cmd_admin
reg add "HKLM\SOFTWARE\Sysinternals" /v "PsExecAccept" /t REG_DWORD /d 1 /f
reg add "HKCR\cmdfile\shell\runas\command" /ve /t REG_SZ /d "cmd.exe /C \"%1\" %*" /f
reg add "HKCR\ConsoleHost\command\runas" /ve /t REG_SZ /d "cmd.exe /C \"%1\" %*" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\system32\cmd.exe" /t reg_sz /d RUNASADMIN /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\SysWOW64\cmd.exe" /t reg_sz /d RUNASADMIN /f
reg add "HKCR\ConsoleHost\command\runas" /ve /t REG_SZ /d "cmd.exe /C \"%1\" %*" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\system32\conhost.exe" /t reg_sz /d RUNASADMIN /f
reg add "HKCR\Microsoft.PowerShellScript.1\Shell\runas\command" /ve /t REG_SZ /d "PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File \"%1\"" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" /t reg_sz /d RUNASADMIN /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%windir%\SysWOW64\WindowsPowerShell\v1.0\powershell.exe" /t reg_sz /d RUNASADMIN /f
REM UAC_Installer detection(��װ������)_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableInstallerDetection" /t REG_DWORD /d 0 /f
REM UAC_UAC �û���ʾ_��ʾ����ƾ��
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorUser" /t REG_DWORD /d 2 /f
REM UAC_UAC ����Ա��ʾ_����ʾ��ֱ������
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /t REG_DWORD /d 0 /f
REM UAC_UIAccess ��ȫλ������_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableSecureUIAPaths" /t REG_DWORD /d 1 /f
REM UAC_UIAccess ����_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableUIADesktopToggle" /t REG_DWORD /d 1 /f
REM UAC_��������ǩ����_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ValidateAdminCodeSignatures" /t REG_DWORD /d 0 /f
REM UAC_���ù���Ա�ʻ�_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "FilterAdministratorToken" /t REG_DWORD /d 1 /f
REM UAC_���� UAC-�Թ���Ա��׼ģʽ�������й���Ա(EnableLUA)_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f
REM UAC_��ȫ������ʾ_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "PromptOnSecureDesktop" /t REG_DWORD /d 0 /f
REM UAC_���ļ���ע���д��������⻯��ÿ�û�λ��_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t REG_DWORD /d 1 /f
REM UAC_�����Թ���Ա������еĳ�������û�ӳ�������������_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLinkedConnections" /t REG_DWORD /d 1 /f
REM UAC_�����û�ѡ��򿪷�ʽ_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoInternetOpenWith" /t REG_DWORD /d 0 /f
REM UAC_�����������첽Ӧ��_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "SyschronousMachineGroupPolicy" /t REG_DWORD /d 0 /f
REM UAC_�û�������첽Ӧ��_����
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "SyschronousUserGroupPolicy" /t REG_DWORD /d 0 /f
REM luafv��������Ϊ�ֶ��������ļ����⻯
reg add "HKLM\SYSTEM\CurrentControlSet\Services\luafv" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\luafv" /v Start /t REG_DWORD /d 3 /f
REM ǿ�Ƹ��������
gpupdate /force
REM ֹͣ������luafv������Ӧ������
net stop luafv
net start luafv
REM ����������Դ������
taskkill /f /im explorer.exe
start explorer.exe
goto :eof
:clear
timeout /t 3 >nul
REM ɾ�����мƻ�����
schtasks /delete /tn * /F
REM ɾ���û���ϵͳ�������е�������
@reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /va /f
@reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /va /f
@reg delete "HKLM\Software\Microsoft\Shared Tools\MSConfig\startupreg" /f
REM ɾ�������ļ����е����г���
del /q /f "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.*"
del /q /f "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\*.*"
REM ɾ�������û��Ĺ��������ļ�
del /q /f "C:\Users\All Users\Microsoft\Windows\Start Menu\Programs\Startup\*.*"
REM ɾ�� Sysprep �ļ��м�������
del /q /f "C:\Sysprep\*.*"
rd /s /q "C:\Sysprep"
REM ɾ���û���ʼ�˵��е�������
del /q /f "%userprofile%\��ʼ�˵�\����\����\*.*"
REM ɾ������Ĺ���ļ�
rd /s /q "C:\Users\Administrator\AppData\Local\360Chrome"
rd /s /q "C:\Users\Administrator\AppData\Local\360ChromeX"
rd /s /q "C:\Users\Administrator\AppData\Local\google"
rd /s /q "C:\Users\Administrator\AppData\Local\Microsoft\Edge"
rd /s /q "C:\Users\Administrator\AppData\Local\Sogou\SogouExplorer"
rd /s /q "C:\Users\Administrator\AppData\Local\Tencent\QQBrowser"
REM ��� ctfmon.exe ���û�������
@reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "ctfmon" /t REG_SZ /d "C:\Windows\System32\ctfmon.exe" /f
REM ��鲢���� ctfmon.exe �����δ����
tasklist /FI "IMAGENAME eq ctfmon.exe" | find /I "ctfmon.exe" >nul || start "" "C:\WINDOWS\system32\ctfmon.exe"
goto :eof
:out
REM shaohua
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v "ShaoHua" /t REG_SZ /d "C:\Windows\shaohua.bat" /f
rem NAME
start "" /wait rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,1 2>nul
rem IP
RunDll32.exe shell32.dll,Control_RunDLL ncpa.cpl 2>nul
rem �������
sysdm.cpl
cls&echo.&echo.��ȷ���Ѿ���� ������� �� IP��ַ �����ã�����&echo.&echo.������ɣ��밴��������������ԡ�&echo.&pause&cls&shutdown -r -t 10 -c "��һ�׶��ѽ�����10���ϵͳ���Զ�������������²�����"&del %0