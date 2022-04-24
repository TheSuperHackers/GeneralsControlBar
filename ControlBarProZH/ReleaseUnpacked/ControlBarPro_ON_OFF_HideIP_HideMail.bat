@echo off
:-------------------------------------
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else (
    goto gotAdmin
)

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

set ThisDir=%~dp0.
set FileList=
set FileList=%FileList% 339_ControlBarProHideIpZH.big
set FileList=%FileList% 339_ControlBarProHideMailZH.big
set SetOn=0
set RenSuffix=off

for %%f in (%FileList%) do (
    if exist "%ThisDir%\%%f.%RenSuffix%" (
        set SetOn=1
        goto next
    )
)

:next

for %%f in (%FileList%) do (
    if %SetOn% EQU 0 (
        if exist "%ThisDir%\%%f" (
            echo Rename "%ThisDir%\%%f"
            echo     to "%ThisDir%\%%f.%RenSuffix%"
            rename "%ThisDir%\%%f" "%%f.%RenSuffix%"
        )
    ) else (
        if exist "%ThisDir%\%%f.%RenSuffix%" (
            echo Rename "%ThisDir%\%%f.%RenSuffix%""
            echo     to "%ThisDir%\%%f"
            rename "%ThisDir%\%%f.%RenSuffix%" "%%f"
        )
    )
)
