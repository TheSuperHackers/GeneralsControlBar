call SETUP_Folders.bat

:: Copy base release files
xcopy /Y /S %ReleaseUnpackedDir%\*.txt %ReleaseUnpacked720Dir%\*.txt
xcopy /Y /S %ReleaseUnpackedDir%\*.dat %ReleaseUnpacked720Dir%\*.dat
xcopy /Y /S %ReleaseUnpackedDir%\*.big %ReleaseUnpacked720Dir%\*.big
xcopy /Y /S %ReleaseUnpackedDir%\*.exe %ReleaseUnpacked720Dir%\*.exe
xcopy /Y /S %ReleaseUnpackedDir%\*.cmd %ReleaseUnpacked720Dir%\*.cmd
xcopy /Y /S %ReleaseUnpackedDir%\*.txt_720 %ReleaseUnpacked720Dir%\*.txt

:: Define big file name(s)
set BigName=340_ControlBarPro720ZH

:: Free folders of big file contents
del /s /f /q %BigFilesUnpackedDir%\%BigName%
del /s /f /q %BigFilesDir%\%BigName%

setlocal enableextensions enabledelayedexpansion

:: Copy .big contents
xcopy /Y /S %GameFilesDir%\*.ini_720 %BigFilesUnpackedDir%\%BigName%\*.ini

:: Generate .big file(s)
set GeneralsBigCreatorExe=..\Tools\GeneralsBigCreator\GeneralsBigCreator.exe
%GeneralsBigCreatorExe% -source %BigFilesUnpackedDir%\%BigName% -dest %BigFilesDir%\%BigName%.big

:: Generate Release file(s)
xcopy /Y %BigFilesDir%\%BigName%.big %ReleaseUnpacked720Dir%\%BigName%.big.bak*
