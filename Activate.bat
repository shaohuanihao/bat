��a
cls
echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=Activate�ű�
set Powered=Powered by �ۻ� 18900559020
set Version=20231005
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
mshta vbscript:createobject("wscript.shell").sendkeys("{CAPSLOCK}")(window.close)
:menu
cls&echo.&echo.����ѡ������ǰ�����ǻ�����ɽ��������������������&echo.&echo.�����ֶ����룡��Ҫ��ѡ��&echo.&echo.�������� A ѡ��Ϊ ���Զ����жϡ���10���Ĭ��ִ�У�&echo.�������� L ѡ��Ϊ ��HS-Lan������&echo.�������� W ѡ��Ϊ ��HS-Wan������&echo.&echo.���߼�ѡ�&echo.&echo.�������� E ת���� ��Enterprise��ҵ�桿&echo.�������� P ת���� ��Professionalרҵ�桿&echo.&echo.�������� Q �ű��� ���˳���&echo.&echo.�������룺&choice /T 10 /C ALWPEQS /d A /N >nul 2>nul
if %errorlevel%==1 goto spc
if %errorlevel%==2 goto HS-Lan
if %errorlevel%==3 goto HS-Wan
if %errorlevel%==4 goto top
if %errorlevel%==5 goto toe
if %errorlevel%==6 exit
if %errorlevel%==7 if exist "C:\ShaoHua\up.bat" (call "C:\ShaoHua\up.bat") else (echo.������ʹ��ȫ�����ܣ�����ϵ�ۻ�18900559020��װ���²���ϵͳ����&&timeout /t 10)
:spc
set osi=&set wsi=&arp -a|findstr /i "38.40." >nul && (set Pc=HS-Lan&goto HS-Lan)||(arp -a|findstr /i "38.41." >nul && (set Pc=HS-Lan&goto HS-Lan)||(arp -a|findstr /i "10.198." >nul && (set Pc=HS-Wan&goto HS-Wan)||(set Pc=PC-Other&cls&echo.&echo.���������ĵ����������޷��ж�������������������5��󷵻ز˵�&timeout /t 5&goto menu)))
:HS-Lan
title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� %Comment%&set osi=38.19.14.203&set wsi=38.19.14.202&goto osi
:HS-Wan
title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� %Comment%&set osi=60.16.12.38&set wsi=60.16.12.38&goto osi
:toe
cls&title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� �����л�Enterprise��ҵ��...&cscript %windir%\system32\slmgr.vbs /rilc&cscript %windir%\system32\slmgr.vbs /upk >nul 2>&1&cscript %windir%\system32\slmgr.vbs /ckms >nul 2>&1&cscript %windir%\system32\slmgr.vbs /cpky >nul 2>&1&cscript %windir%\system32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43&timeout /t 5&goto menu
:top
cls&title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� �����л�Professionalרҵ��...&cscript %windir%\system32\slmgr.vbs /rilc&cscript %windir%\system32\slmgr.vbs /upk >nul 2>&1&cscript %windir%\system32\slmgr.vbs /ckms >nul 2>&1&cscript %windir%\system32\slmgr.vbs /cpky >nul 2>&1&cscript %windir%\system32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX&timeout /t 5&goto menu
goto spc
:osi
cls&set ver=0&set pf=%ProgramFiles(x86)%&title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� ��������Office���������...
:pf
if "%pf%"=="%ProgramFiles%" if %ver%==7 goto wsi
if "%ver%"=="7" (set pf=%ProgramFiles%&set ver=0&goto pf)
cd "%pf%\Microsoft Office\Office1%ver%\" 2>nul&cls&cscript "%pf%\Microsoft Office\Office1%ver%\ospp.vbs" /sethst:%osi% 2>nul&cls&cscript "%pf%\Microsoft Office\Office1%ver%\ospp.vbs" /act 2>nul&cls&set /a ver=%ver%+1&goto pf
:wsi
title %Pc% �� %Name% �� %Powered% �� Ver%Version% �� ��������Windows���������...&cscript %windir%\system32\slmgr.vbs /skms %wsi% 2>nul&cscript %windir%\system32\slmgr.vbs /ato 2>nul&timeout /t 3&cls&cscript %windir%\system32\slmgr.vbs /dli 2>nul&echo������������������������������������������������ɢ����ʱ���ټ������ڡ����������������������������������� �ۻ�&echo��������������������������������������������������������������������������������������������������18900559020&timeout /t 6 >nul&exit