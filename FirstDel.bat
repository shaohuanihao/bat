��a
cls
echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=FirstDel�ű�
set Powered=Powered by �ۻ� 18900559020
set Version=20231005
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
rem ɾ�����мƻ�����
timeout /t 3 >nul
schtasks /delete /tn * /F
rem ɾ����������������
@reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /va /f
@reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Run /va /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v ctfmon.exe /d C:\WINDOWS\system32\ctfmon.exe
@reg delete "HKLM\Software\Microsoft\Shared Tools\MSConfig\startupreg" /f
del "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\*.*" /q /f
del "C:\Users\All Users\Microsoft\Windows\Start Menu\Programs\StartUp\*.*" /q /f
del "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\*.*" /q /f
del "C:\Sysprep\*.*" /q /f
rd "C:\Sysprep\" /s /q /f
del "%userprofile%\����ʼ���˵�\����\����\*.*" /q /f 
exit