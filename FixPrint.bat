��a
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=FixPrint�ű�
set Powered=Powered by �ۻ� 18900559020
set Version=20241020
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
:start
call :CapsLK
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v forceguest /t REG_DWORD /d 0 /f
cls
echo.
echo.����ѡ�������������ĸ��ݼ���&echo.
echo.������������U�����������룺�����Server��ӡ�������������·�ǿ���޸��û�������Ե����޷���ӡ�����⣻&echo.
echo.������������S���������޸�����Server��ӡ����������ֱ����ӡ���ĵ�����������&echo.
echo.������������C���ͻ����޸�����Client�����ߵ��ԣ���Ҫ��ӹ����ӡ������������&echo.
echo.������������F������������������ӡ��ʱ���ֿհ׺ͱ�0x0000011b��0x00000709�����⣻&echo.
echo.������������D������������ɾ�������ѱ���Ĵ�ӡ�����¼��&echo.
echo.������������O��Office�޸�����Officeģ������޸���&echo.
echo.
echo.��������������������������������������������������������������������������������%Version%���ۻ���18900559020&echo.
choice /C USCFDO /N /M "��[ �� U �������� / �� S �����޸� / �� C �ͻ����޸� / �� F ������� / �� D �������� / �� O Office�޸� ]��"
if errorlevel 6 goto office
if errorlevel 5 goto clear
if errorlevel 4 goto fix
if errorlevel 3 goto client
if errorlevel 2 goto server
if errorlevel 1 goto update
exit
:CapsLK
for /f "delims=" %%i in ('powershell -command "[console]::CapsLock"') do if "%%i"=="False" mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
goto :eof
:fix
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Print" /v "RpcAuthnLevelPrivacyEnabled" /d "0" /t reg_dword /f >nul 2>nul
@wusa /quiet /uninstall /kb:5000802 >nul 2>nul
@wusa /quiet /uninstall /kb:5000808 >nul 2>nul
@wusa /quiet /uninstall /kb:5006670 >nul 2>nul
@wusa /quiet /uninstall /kb:5006667 >nul 2>nul
@wusa /quiet /uninstall /kb:5006672 >nul 2>nul
@wusa /quiet /uninstall /kb:5006669 >nul 2>nul
@wusa /quiet /uninstall /kb:5006675 >nul 2>nul
@wusa /quiet /uninstall /kb:5005569 >nul 2>nul
@wusa /quiet /uninstall /kb:5005573 >nul 2>nul
@wusa /quiet /uninstall /kb:5005568 >nul 2>nul
@wusa /quiet /uninstall /kb:5005566 >nul 2>nul
@wusa /quiet /uninstall /kb:5005565 >nul 2>nul
goto end
:update
net user PrintUser Hs123456 >nul 2>nul
goto end
:server
cls&echo.
echo.���ҽ�Ϊ���Զ������²�����&echo.&echo.
echo.������������ע�⣺��ǰѡ���ǡ���ӡ����������&echo.
echo.������������1����ɾ������ printuser �� printeruser�û���
echo.������������2�����½� PrintUser �û���
echo.������������3����Ϊ PrintUser �û����á�Hs123456�����룻
echo.������������4����Ϊ PrintUser �û����������������ڣ�
echo.������������5�������� Guset �û���
echo.������������6�������ù��������ʽΪ���빲��&echo.&echo.&echo.
echo.������������������������������������������������������������������������������������������������������ �ۻ�
echo.������������������������������������������������������������������������������������������������18900559020&echo.
echo.�������������...&pause >nul 2>nul&cls&echo.&echo.�������У����Ժ�...&echo.&
net stop server /y
net stop spooler /y
net stop workstation /y
net user printuser /delete >nul 2>nul
net user PrintUser /delete >nul 2>nul
net user PrinterUser /delete >nul 2>nul
net user PrintUser Hs123456 /add >nul 2>nul
net localgroup Users PrintUser /add >nul 2>nul
wmic path win32_useraccount where name='PrintUser' set passwordexpires='false' >nul 2>nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v "PrintUser" /d "0" /t reg_dword /f >nul 2>nul
net user guest /active:no>nul 2>nul
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v forceguest /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Print" /v "RpcAuthnLevelPrivacyEnabled" /d "0" /t reg_dword /f >nul 2>nul
net start rpcss
net start server
dism /online /enable-feature /featurename:Printing-Foundation-LPDPrintService /NoRestart 2>nul
net start lpdsvc
net start spooler
net start SSDPSRV
net start workstation
sc config SSDPSRV start= auto
cls&echo. &echo. &echo. �����IP��ַ���ͻ�����ӹ����ӡ��ʱ����õ���&echo.&FOR /F "tokens=2 delims=:" %%A in ('ipconfig ^| findstr "IPv4"') do echo. ����IP�����ǣ���%%A��&echo.&pause
cls&echo.
echo.���������...�롾�������Ժ󡿣��ٵ���Ҫ���ӹ����ӡ���ĵ��������б��ű�...&echo.&echo.&echo.&echo.&echo.&echo.
echo.������������������������������������������������ɢ����ʱ���ټ�������&echo.&echo.&echo.&echo.&echo.&echo.
echo.������������������������������������������������������������������������������������������������������ �ۻ�
echo.������������������������������������������������������������������������������������������������18900559020&echo.
echo.�������������ʹ��ҵ绰��...&timeout /t 6 >nul&exit
:client
cls&echo.
echo.��������Է���ַ&echo.����ȷ���Ļ������á���ӡ���ĵ����������򿪷����������鿴��ҳ����IP��ַ��&echo.&echo.��Ʃ�磺&echo.��38.4*.***.***&echo.
set "input="&set "f="
set /p input=��������IP:
echo;"%input%"|>nul findstr "^\"[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\"$"||(goto client)
for %%a in (%input:.= %) do (echo;%%a|>nul findstr "^25[0-5]$ ^2[0-4][0-9]$ ^1[0-9][0-9]$ ^[1-9][0-9]$ ^[0-9]$"||(goto client))
echo.&echo.���Է�IP��ַΪ����������%input%��&set p=&for /f "tokens=3 delims=: " %%p in ('ping -a %input% -w 1 -n 1') do (set /a p+=1&if !p!==1 echo.���Է��������Ϊ��������%%p��&set name=%%p)
echo.&echo.��ע�⣺���������ӦΪ��MAS-HS********������ʽ�����Ϸ�û�г��֣�����������&echo.&echo.&echo.&echo.&echo.
choice /C:YN /N /M "��[ ����Y��ȷ�� / ����N������ ]"
if errorlevel 2 goto client
if errorlevel 1 goto cmdkey
:cmdkey
cls&echo.&echo.ɾ������%name%��ƾ֤
cmdkey /delete:%name%
echo.&echo.�����ȷ%name%��ƾ֤
cmdkey /add:%name% /user:PrintUser /pass:Hs123456
net use \\%name%\ "Hs123456" /user:"PrintUser"
cmdkey /add:%input% /user:PrintUser /pass:Hs123456
net use \\%input%\ "Hs123456" /user:"PrintUser"
explorer \\%name%\
goto end
:clear
sc config spooler start= disabled
net stop spooler
net session /delete /y
attrib "%systemroot%\System32\spool\PRINTERS\*" -R /s
del "%systemroot%\System32\spool\PRINTERS\*" /q /s
dism /online /enable-feature /featurename:Printing-Foundation-LPDPrintService /NoRestart 2>nul
net start lpdsvc
sc config spooler start= auto
net start spooler
goto end
:office
del /a /f /s /q "C:\Documents and Settings\%UserName%\Application Data\Microsoft\Templates\*"
del /a /f /s /q "C:\Documents and Settings\Administrator\Application Data\Microsoft\Templates\*"
regsvr32 /u /s pintlgnt.ime
del /f /s /q "%userprofile%\local settings\temp\*"
del /f /s /q "%appdata%\microsoft\Templates\*.dot"
del /f /s /q "%appdata%\microsoft\Word\Startup\*.dot"
goto end
:end
echo.&echo.���������...&echo.&echo.&echo.&echo.&echo.&echo.
echo.������������������������������������������������ɢ����ʱ���ټ�������&echo.&echo.&echo.&echo.&echo.&echo.
echo.������������������������������������������������������������������������������������������������������ �ۻ�
echo.������������������������������������������������������������������������������������������������18900559020&echo.
echo.�������������ʹ��ҵ绰��...&timeout /t 6 >nul&exit