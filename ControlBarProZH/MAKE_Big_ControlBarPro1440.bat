call SETUP_Folders.bat

:: Copy base release files
xcopy /Y /S %ReleaseUnpackedDir%\*.txt %ReleaseUnpacked1440Dir%\*.txt
xcopy /Y /S %ReleaseUnpackedDir%\*.dat %ReleaseUnpacked1440Dir%\*.dat
xcopy /Y /S %ReleaseUnpackedDir%\*.big %ReleaseUnpacked1440Dir%\*.big
xcopy /Y /S %ReleaseUnpackedDir%\*.exe %ReleaseUnpacked1440Dir%\*.exe
xcopy /Y /S %ReleaseUnpackedDir%\*.cmd %ReleaseUnpacked1440Dir%\*.cmd
xcopy /Y /S %ReleaseUnpackedDir%\*.txt_1440 %ReleaseUnpacked1440Dir%\*.txt

:: Define big file name(s)
set BigName=340_ControlBarPro1440ZH

:: Free folders of big file contents
del /s /f /q %BigFilesUnpackedDir%\%BigName%
del /s /f /q %BigFilesDir%\%BigName%

setlocal enableextensions enabledelayedexpansion

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.ini_1440 %BigFilesUnpackedDir%\%BigName%\*.ini

:: Generate .big file(s)
set GeneralsBigCreatorExe=..\Tools\GeneralsBigCreator\GeneralsBigCreator.exe
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%BigName% -dest %BigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpacked1440Dir%\%BigName%.big.bak*
