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
set FileList1=
set FileList1=%FileList1% 340_ControlBarProZH.big
set FileList1=%FileList1% 340_ControlBarPro720ZH.big
set FileList1=%FileList1% 340_ControlBarPro900ZH.big
set FileList1=%FileList1% 340_ControlBarPro1080ZH.big
set FileList1=%FileList1% 340_ControlBarPro1440ZH.big
set FileList1=%FileList1% 340_ControlBarPro2160ZH.big
set FileList1=%FileList1% 340_ControlBarProPlainZH.big
set FileList2=
set FileList2=%FileList2% 339_ControlBarProHideIpZH.big
set FileList2=%FileList2% 339_ControlBarProHideMailZH.big
set SetOn=0
set RenSuffix=BAK

for %%f in (%FileList1%) do (
    if exist "%ThisDir%\%%f.%RenSuffix%" (
        set SetOn=1
        goto next
    )
)

:next

for %%f in (%FileList1%) do (
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

if %SetOn% EQU 0 (
    for %%f in (%FileList2%) do (
        if exist "%ThisDir%\%%f" (
            echo Rename "%ThisDir%\%%f"
            echo     to "%ThisDir%\%%f.%RenSuffix%"
            rename "%ThisDir%\%%f" "%%f.%RenSuffix%"
        )
    )
)
