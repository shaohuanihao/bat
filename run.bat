��a
cls
echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=FirstRun�ű�
set Powered=Powered by �ۻ� 18900559020
set Version=20231005
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
rem ����cmd-admin
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
rem verdate
REG QUERY "HKLM\SYSTEM\Setup" /v Type 2>nul|findstr /i "Type">nul &&(reg add "HKLM\SYSTEM\Setup" /v "Type" /t reg_sz /d "%date%" /f)||(echo.)
rem LNK
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(""%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\Lnk1.lnk""):b.TargetPath=""C:\ShaoHua\Key\FirstDel.bat"":b.WorkingDirectory=""C:\Windows\Key\"":b.Save:close") 2>nul
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(""%SYSTEMDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\Lnk2.lnk""):b.TargetPath=""C:\Windows\shaohua.bat"":b.WorkingDirectory=""C:\Windows\"":b.Save:close") 2>nul
rem NAME
start "" /wait rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,1 2>nul
rem IP
RunDll32.exe shell32.dll,Control_RunDLL ncpa.cpl 2>nul
rem �������
sysdm.cpl
cls&echo.&echo.��ȷ���Ѿ���� ������� �� IP��ַ �����ã�����&echo.&echo.������ɣ��밴��������������ԡ�&echo.&pause&cls&shutdown -r -t 10 -c "��һ�׶��ѽ�����10���ϵͳ���Զ�������������²�����"&del %0