��a
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=SafeClear
set Powered=Powered by �ۻ� 18900559020
set Version=20241212
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
:start
call :clear
exit

:clear
set temp=C:\Temp\EmptyDir
if exist "%temp%" rd /s /q "%temp%"
mkdir "%temp%"
echo ��ʼ���� D:\ Ŀ¼�����Ժ�...
robocopy D:\ %temp% /MIR /MOVE ^
    /XD "D:\SH\Key" "D:\SH\Soft" "D:\LVUAAgentInstBaseRoot" "D:\Program Files (x86)\Qianxin" "D:\UniAccessAgentDownloadData" "D:\System Volume Information" ^
    /XF "D:\ODiskFileStore\��ȫO��.odisk2" "D:\pagefile.sys" ^
    /R:0 /W:0 /NJH /NJS
set dir="D:\$RECYCLE.BIN"
takeown /F %dir% /A /R /D Y >nul
icacls %dir% /grant Administrators:F /T >nul
rd /s /q %dir%
set dir="D:\System Volume Information"
takeown /F %dir% /A /R /D Y >nul
icacls %dir% /grant Administrators:F /T >nul
rd /s /q %dir%
rd /s /q "%temp%"
goto :eof