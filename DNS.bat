��a
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=DNS
set Powered=Powered by �ۻ� 18900559020
set Version=20250209
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
for /f "tokens=2 delims==" %%i in ('wmic computersystem get name /value') do set PCName=%%i
:start
call :CapsLK
cls
echo.
echo.����ѡ������ǰ���ԡ���%PCName%�����ǡ����������ǡ���������&echo.&echo.
echo.���������������������������롡A��ѡ��Ϊ�����Զ����жϡ�����6���Ĭ��ִ�У�&echo.
echo.���������������������������롡L��ѡ��Ϊ����HS-Lan������&echo.
echo.���������������������������롡W��ѡ��Ϊ����HS-Wan������&echo.
echo.���������������������������롡O��ѡ��Ϊ����PC-Other������&echo.
echo.���������������������������롡Q���ű��������˳���&echo.
echo.
echo.��������������������������������������������������������������������������������%Version%���ۻ���18900559020&echo.
echo.�������룺
choice /T 10 /C ALWOQS /d A /N >nul 2>nul
if %errorlevel%==1 goto auto
if %errorlevel%==2 goto HS-Lan
if %errorlevel%==3 goto HS-Wan
if %errorlevel%==4 goto PC-Other
if %errorlevel%==5 exit
if %errorlevel%==6 if exist "C:\ShaoHua\up.bat" (call "C:\ShaoHua\up.bat") else (echo.������ʹ��ȫ�����ܣ�����ϵ�ۻ�18900559020��װ���²���ϵͳ����&timeout /t 6)
:CapsLK
for /f "delims=" %%i in ('powershell -command "[console]::CapsLock"') do if "%%i"=="False" mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
goto :eof
:auto
call :net
goto %Pc%
:HS-Lan
title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� %Comment%
call :const
set Pc=HS-Lan
call :del
call :add
goto exit
:HS-Wan
call :net
title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� %Comment%
call :const
set Pc=HS-Wan
call :del
call :add
goto exit
:PC-Other
call :net
title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� %Comment%
call :const
set Pc=PC-Other
call :del
goto exit
:list
:net
set Pc=&arp -a|findstr /i "38.40." >nul && (set Pc=HS-Lan)||(arp -a|findstr /i "38.41." >nul && (set Pc=HS-Lan)||(arp -a|findstr /i "10.198." >nul && (set Pc=HS-Wan)||(set Pc=PC-Other)))
goto :eof
:const
set wangka1=��������&set wangka2=�������� 2&set wangka3=��̫��&set wangka4=��̫�� 2&set wangka5=��̫�� 3
set HS-Lan1=38.19.64.129&set HS-Lan2=38.16.36.8&set HS-Lan3=38.19.18.10&set HS-Lan4=38.16.68.8
set HS-Wan1=61.132.163.68&set HS-Wan2=218.104.78.2
set add1=netsh interface ipv4 add dnsservers "
set add3=" address="
set add5=" index="
set add7=" validate=no 2>nul
goto :eof
:del
for %%i in ("%wangka1%" "%wangka2%" "%wangka3%" "%wangka4%" "%wangka5%") do (netsh interface ipv4 delete dnsservers %%i all >nul 2>nul)
goto :eof
:add
set Ano=1&set Bno=1
:SetA
if "%Ano%"=="5" goto ex
call set wangka=%%wangka%Ano%%%
:SetB
if "%Bno%"=="5" goto SetbBEnd
call set net=%%%Pc%%Bno%%%
%add1%%wangka%%add3%%net%%add5%%Bno%%add7% >nul 2>nul
if !errorlevel! equ 0 echo. & echo �ɹ�����: ����=!wangka! DNS=!net! 
set /a Bno=%Bno%+1
goto SetB
:SetbBEnd
set Bno=1
set /a Ano=%Ano%+1
goto SetA
:ex
goto :eof
:exit
timeout /t 2 > nul
ipconfig /flushdns >nul 2>nul
echo.&echo.���������...&echo.&echo.&echo.&echo.&echo.&echo.
echo.������������������������������������������������ɢ����ʱ���ټ�������&echo.&echo.&echo.&echo.&echo.&echo.
echo.
echo.��������������������������������������������������������������������������������%Version%���ۻ���18900559020&echo.
echo.�������������ʹ��ҵ绰��...&timeout /t 3 >nul&exit