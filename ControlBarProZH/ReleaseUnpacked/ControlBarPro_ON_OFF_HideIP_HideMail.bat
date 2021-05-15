@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

set ControlBarProHideIpBig=339_ControlBarProHideIpZH.big
set ControlBarProHideIpBak=339_ControlBarProHideIpZH.big.BAK
set ControlBarProHideMailBig=339_ControlBarProHideMailZH.big
set ControlBarProHideMailBak=339_ControlBarProHideMailZH.big.BAK

if exist %ControlBarProHideIpBig% (
	ren %ControlBarProHideIpBig% %ControlBarProHideIpBak%
) else (
	if exist %ControlBarProHideIpBak% (
		ren %ControlBarProHideIpBak% %ControlBarProHideIpBig%
	)
)

if exist %ControlBarProHideMailBig% (
	ren %ControlBarProHideMailBig% %ControlBarProHideMailBak%
) else (
	if exist %ControlBarProHideMailBak% (
		ren %ControlBarProHideMailBak% %ControlBarProHideMailBig%
	)
)
