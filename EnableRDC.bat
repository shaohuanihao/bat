��a
cls
echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=EnableRDC�ű�
set Powered=Powered by �ۻ� 18900559020
set Version=20231005
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
:start
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v forceguest /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes
netsh advfirewall set allprofiles state off
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
goto end
:end
mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
echo.&echo.���������...&echo.&echo.&echo.&echo.&echo.&echo.
echo.������������������������������������������������ɢ����ʱ���ټ�������&echo.&echo.&echo.&echo.&echo.&echo.
echo.������������������������������������������������������������������������������������������������������ �ۻ�
echo.������������������������������������������������������������������������������������������������18900559020&echo.
echo.�������������ʹ��ҵ绰��...&timeout /t 6 >nul&exit