��a
cls
@echo off
ver|findstr /i "5\.1\." > nul&&(goto:begin)
net sess>nul 2>&1||(cls&powershell saps '%0'-Verb RunAs&exit)
:begin
@echo off
cls
disableX >nul 2>nul&mode con cols=110 lines=20&color 1F&setlocal enabledelayedexpansion
set Name=SecureUdisk�ű�
set Powered=Powered by �ۻ� 18900559020
set Version=20241020
set Comment=������Ϻ�ű����Զ��رգ������ֶ��رգ�
title %Name% �� %Powered% �� Ver%Version% �� %Comment%
:start
rem �������
set vnn1=
set vnn2={679F137C-3162-45da-BE3C-2F9C3D093F68}
set vnn3={679F137C-3162-45da-BE3C-2F9C3D093F69}
set vcn1=��ȫU��
set vcn2=��ȫU��_V2
set vcn3=��ȫU��_V3
set vpn1=C:\ShaoHua\Soft\FugueExplorer.exe
set vpn2=C:\ShaoHua\Soft\FugueExplorer_v2.exe
set vpn3=C:\ShaoHua\Soft\FugueExplorer_v3.exe
set vpn4=%~dp0\FugueExplorer_v3.exe
rem ��������
taskkill /f /im FugueExplorer.exe
rem �жϰ汾
if exist "C:\ShaoHua\Soft\FugueExplorer.exe" (goto upanver) else (goto menu)
:upanver
set EXE='C:\ShaoHua\Soft\FugueExplorer.exe'
powershell "(Get-Item -path %EXE%).VersionInfo.ProductVersion" > DE_Version_tmp.txt
for /f "tokens=*" %%i in (DE_Version_tmp.txt) do set vvn=%%i
del DE_Version_tmp.txt
if %vvn% EQU 8.7.1.16 ren "C:\ShaoHua\Soft\FugueExplorer.exe" FugueExplorer_v3.exe
if %vvn% EQU 8.7.1.16 set vcn=%vcn3%
if %vvn% NEQ 8.7.1.16 ren "C:\ShaoHua\Soft\FugueExplorer.exe" FugueExplorer_v2.exe
if %vvn% NEQ 8.7.1.16 set vcn=%vcn2%
rem ��ʾ����
:menu
cls&echo.
echo.  ��ǰϵͳ��ȫU��Ϊ %vcn% �汾��Ϊ %vvn%��&echo.&echo.
echo.               �ҽ�Ϊ���Զ������²�����&echo.&echo.
echo.                              a1����ɾ��  ����        %vcn1%  ���а汾��  ��ݷ�ʽ
echo.                              a2����ɾ��  ��Դ������  %vcn1%  ���а汾��  ��ݷ�ʽ
echo.                              b1��������  ����        %vcn1%  ���°汾��  ��ݷ�ʽ
echo.                              b2��������  ��Դ������  %vcn1%  ���°汾��  ��ݷ�ʽ
echo.&echo.&echo.&echo.
echo.                                                                                                        �ۻ�
echo.                                                                                                 18900559020&echo.
echo.  �����������...&pause >nul 2>nul&cls&echo.&echo.  �����У����Ժ�...&echo.

rem clear Secure Udisk V1
del /f /q "%userprofile%\Desktop\%vcn1%.lnk"
del /f /q "C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Network Shortcuts\%vcn1%.exe"
del /f /q "%UserProfile%\AppData\Roaming\Microsoft\Windows\Network Shortcuts\%vcn1%.exe"

rem clear Secure Udisk V2
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\%vnn2%" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\%vnn2%" /f
reg delete "HKCR\CLSID\%vnn2%" /f
reg delete "HKCU\Software\Classes\CLSID\%vnn2%" /f
reg delete "HKLM\Software\Classes\CLSID\%vnn2%" /f
del /f /q "%userprofile%\Desktop\%vcn2%.lnk"

rem clear Secure Udisk V3
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\%vnn3%" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\%vnn3%" /f
reg delete "HKCR\CLSID\%vnn3%" /f
reg delete "HKCU\Software\Classes\CLSID\%vnn3%" /f
reg delete "HKLM\Software\Classes\CLSID\%vnn3%" /f
del /f /q "%userprofile%\Desktop\%vcn3%.lnk"

rem xuanze
cls&echo.&echo.&echo.&echo.&echo.&echo.&echo.&echo.&echo.                                     �Ѿ��ɹ�ɾ��  ���а汾��  ��ݷ�ʽ��&echo.
echo.                                     �Ƿ�������  ���°汾��  ��ݷ�ʽ��&echo.&echo.&echo.&echo.&echo.&echo.&echo.
SET Choice=
SET /P Choice=����ֱ�Ӱ��س������������������������س����˳���
IF "%Choice%" EQU "" GOTO add
IF "%Choice%" NEQ "" GOTO exit
exit
:add
cls
rem add Secure Udisk
set vnn=%vnn3%
set vcn=%vcn3%
set vpn=%vpn3%

rem %systemroot%\LVUAAgentlnstBaseRoot\FugueExplorer.exe
echo f | xcopy /d /y /g /h FugueExplorer_v3.exe %vpn3%
echo f | xcopy /d /y /g /h %~dp0FugueExplorer_v3.exe %vpn3%
echo f | xcopy /d /y /g /h D:\LVUAAgentlnstBaseRoot\FugueExplorer.exe %vpn3%
echo f | xcopy /d /y /g /h %systemroot%\LVUAAgentlnstBaseRoot\FugueExplorer.exe %vpn3%
if exist "C:\ShaoHua\Soft\FugueExplorer_v3.exe" (echo.) else (goto end)
if exist "%vpn%" start "" mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(a.SpecialFolders(""Desktop"") & ""\%vcn%.lnk""):b.TargetPath=""%vpn%"":b.WorkingDirectory=""C:\ShaoHua\Soft"":b.Save:close") 2>nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\%vnn%" /ve /t reg_sz /d "%vcn%" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\%vnn%" /ve /t reg_sz /d "%vcn%" /f
reg add "HKCR\CLSID\%vnn%" /ve /t reg_sz /d "%vcn%" /f
reg add "HKCR\CLSID\%vnn%" /v "InfoTip" /t reg_sz /d "��ݲ���By_ShaoHua" /f
reg add "HKCR\CLSID\%vnn%" /v "LocalizedString" /t reg_sz /d "%vcn%" /f
reg add "HKCR\CLSID\%vnn%" /v "System.ItemAuthors" /t reg_sz /d "��ݲ���By_ShaoHua" /f
reg add "HKCR\CLSID\%vnn%" /v "TileInfo" /t reg_sz /d "prop:System.ItemAuthors" /f
reg add "HKCR\CLSID\%vnn%\DefaultIcon" /ve /t reg_expand_sz /d "%vpn%" /f
reg add "HKCR\CLSID\%vnn%\Shell\Open\Command" /ve /t reg_sz /d "%vpn%" /f
reg add "HKCR\CLSID\%vnn%\Instance" /v "CLSID" /t reg_sz /d "{0AFACED1-E828-11D1-9187-B532F1E9575D}" /f
reg add "HKCR\CLSID\%vnn%\Instance\InitPropertyBag" /v "Target" /t reg_sz /d "C:\ShaoHua\Soft\\" /f
reg add "HKCU\Software\Classes\CLSID\%vnn%" /ve /t reg_sz /d "%vcn%" /f
reg add "HKLM\Software\Classes\CLSID\%vnn%" /ve /t reg_sz /d "%vcn%" /f

:exit
rem �жϰ汾
if exist "C:\ShaoHua\Soft\FugueExplorer_v3.exe" (goto upanf) else (goto end)
:upanf
set EXE='C:\ShaoHua\Soft\FugueExplorer_v3.exe'
powershell "(Get-Item -path %EXE%).VersionInfo.ProductVersion" > DE_Version_tmp.txt
for /f "tokens=*" %%i in (DE_Version_tmp.txt) do set vvn=%%i
del DE_Version_tmp.txt
:end
cls&echo.
echo.&echo.  ��ǰϵͳ��ȫU��Ϊ %vcn% �汾��Ϊ %vvn%��&echo.&echo.&echo.&echo.&echo.&echo.
echo.                                            ��ɢ����ʱ  �ټ�������&echo.&echo.&echo.&echo.&echo.&echo.
echo.                                                                                                        �ۻ�
echo.                                                                                                 18900559020&echo.
echo.  �����������ʹ��ҵ绰��...&timeout /t 6 >nul&exit


